<?php

namespace App\Http\Controllers\Konsultan;

use App\Http\Controllers\Controller;
use App\Models\Consultation;
use App\Models\ConsultationCategory;
use App\Models\ConsultationResponse;
use App\Models\ConsultationAttachment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class ConsultationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $consultations = Consultation::with(['user', 'category', 'latestResponse'])
            ->orderBy('created_at', 'desc')
            ->paginate(15);

        $stats = [
            'total' => Consultation::count(),
            'menunggu' => Consultation::menunggu()->count(),
            'proses' => Consultation::proses()->count(),
            'selesai' => Consultation::selesai()->count(),
        ];

        return view('konsultan.consultations.index', compact('consultations', 'stats'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ConsultationCategory::where('is_active', true)->get();
        return view('konsultan.consultations.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'category_id' => 'required|exists:consultation_categories,id',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'priority' => 'required|in:low,medium,high',
        ]);

        $consultation = Consultation::create($request->all());
        $consultation->update(['status' => 'proses']);

        return redirect()->route('konsultan.consultations.show', $consultation)
            ->with('success', 'Konsultasi berhasil dibuat.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Consultation $consultation)
    {
        $consultation->load(['user', 'category', 'responses.user', 'attachments']);
        $categories = ConsultationCategory::where('is_active', true)->get();
        
        return view('konsultan.consultations.show', compact('consultation', 'categories'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Consultation $consultation)
    {
        $categories = ConsultationCategory::where('is_active', true)->get();
        return view('konsultan.consultations.edit', compact('consultation', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Consultation $consultation)
    {
        $request->validate([
            'category_id' => 'required|exists:consultation_categories,id',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'priority' => 'required|in:low,medium,high',
        ]);

        $consultation->update($request->all());

        return redirect()->route('konsultan.consultations.show', $consultation)
            ->with('success', 'Konsultasi berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Consultation $consultation)
    {
        // Delete attachments
        foreach ($consultation->attachments as $attachment) {
            Storage::disk('public')->delete($attachment->file_path);
        }
        
        $consultation->delete();

        return redirect()->route('konsultan.consultations.index')
            ->with('success', 'Konsultasi berhasil dihapus.');
    }

    /**
     * Store a response to consultation
     */
    public function storeResponse(Request $request, Consultation $consultation)
    {
        $request->validate([
            'response' => 'required|string',
            'is_public' => 'boolean',
            'attachments.*' => 'nullable|file|max:10240', // 10MB max
        ]);

        $response = ConsultationResponse::create([
            'consultation_id' => $consultation->id,
            'user_id' => Auth::id(),
            'is_responder' => true,
            'response' => $request->response,
            'is_public' => $request->boolean('is_public', true),
        ]);

        // Handle file uploads
        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $file) {
                $path = $file->store('consultation-responses', 'public');
                
                ConsultationAttachment::create([
                    'response_id' => $response->id,
                    'file_name' => $file->hashName(),
                    'file_path' => $path,
                    'file_type' => $file->getMimeType(),
                    'file_size' => $file->getSize(),
                    'original_name' => $file->getClientOriginalName(),
                ]);
            }
        }

        // Update consultation status
        $consultation->update(['status' => 'proses']);

        return redirect()->route('konsultan.consultations.show', $consultation)
            ->with('success', 'Respon berhasil ditambahkan.');
    }

    /**
     * Mark consultation as finished
     */
    public function finish(Consultation $consultation)
    {
        $consultation->update([
            'status' => 'selesai',
            'resolved_at' => now()
        ]);

        return redirect()->route('konsultan.consultations.show', $consultation)
            ->with('success', 'Status konsultasi berhasil diperbarui menjadi selesai.');
    }
}
