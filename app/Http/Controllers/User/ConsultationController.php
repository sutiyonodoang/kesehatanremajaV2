<?php

namespace App\Http\Controllers\User;

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
        $consultations = Auth::user()->consultations()
            ->with(['category', 'latestResponse'])
            ->orderBy('created_at', 'desc')
            ->paginate(15);

        $stats = [
            'total' => Auth::user()->consultations()->count(),
            'menunggu' => Auth::user()->consultations()->menunggu()->count(),
            'proses' => Auth::user()->consultations()->proses()->count(),
            'selesai' => Auth::user()->consultations()->selesai()->count(),
        ];

        return view('user.consultations.index', compact('consultations', 'stats'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = ConsultationCategory::where('is_active', true)->get();
        return view('user.consultations.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required|exists:consultation_categories,id',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'priority' => 'required|in:low,medium,high',
            'attachments.*' => 'nullable|file|max:10240', // 10MB max
        ]);

        $consultation = Consultation::create([
            'user_id' => Auth::id(),
            'category_id' => $request->category_id,
            'title' => $request->title,
            'description' => $request->description,
            'priority' => $request->priority,
            'status' => 'menunggu',
        ]);

        // Handle file uploads
        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $file) {
                $path = $file->store('consultations', 'public');
                
                ConsultationAttachment::create([
                    'consultation_id' => $consultation->id,
                    'file_name' => $file->hashName(),
                    'file_path' => $path,
                    'file_type' => $file->getMimeType(),
                    'file_size' => $file->getSize(),
                    'original_name' => $file->getClientOriginalName(),
                ]);
            }
        }

        return redirect()->route('user.consultations.index')
            ->with('success', 'Konsultasi berhasil dibuat dan sedang menunggu review admin.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Consultation $consultation)
    {
        // Ensure user can only view their own consultations
        if ($consultation->user_id !== Auth::id()) {
            abort(403);
        }

        $consultation->load(['category', 'responses.user', 'attachments', 'responses.attachments']);
        
        return view('user.consultations.show', compact('consultation'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Consultation $consultation)
    {
        // Ensure user can only edit their own consultations
        if ($consultation->user_id !== Auth::id()) {
            abort(403);
        }

        // Only allow editing if status is pending
        if ($consultation->status !== 'menunggu') {
            return redirect()->route('user.consultations.show', $consultation)
                ->with('error', 'Konsultasi tidak dapat diedit karena sudah diproses.');
        }

        $categories = ConsultationCategory::where('is_active', true)->get();
        return view('user.consultations.edit', compact('consultation', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Consultation $consultation)
    {
        // Ensure user can only update their own consultations
        if ($consultation->user_id !== Auth::id()) {
            abort(403);
        }

        // Only allow updating if status is pending
        if ($consultation->status !== 'menunggu') {
            return redirect()->route('user.consultations.show', $consultation)
                ->with('error', 'Konsultasi tidak dapat diperbarui karena sudah diproses.');
        }

        $request->validate([
            'category_id' => 'required|exists:consultation_categories,id',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'priority' => 'required|in:low,medium,high',
        ]);

        $consultation->update($request->all());

        return redirect()->route('user.consultations.show', $consultation)
            ->with('success', 'Konsultasi berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Consultation $consultation)
    {
        // Ensure user can only delete their own consultations
        if ($consultation->user_id !== Auth::id()) {
            abort(403);
        }

        // Only allow deletion if status is pending
        if ($consultation->status !== 'menunggu') {
            return redirect()->route('user.consultations.show', $consultation)
                ->with('error', 'Konsultasi tidak dapat dihapus karena sudah diproses.');
        }

        // Delete attachments
        foreach ($consultation->attachments as $attachment) {
            Storage::disk('public')->delete($attachment->file_path);
        }
        
        $consultation->delete();

        return redirect()->route('user.consultations.index')
            ->with('success', 'Konsultasi berhasil dihapus.');
    }

    /**
     * Store a response to consultation
     */
    public function storeResponse(Request $request, Consultation $consultation)
    {
        $request->validate([
            'response' => 'required|string',
            'attachments.*' => 'nullable|file|max:10240', // 10MB max
        ]);

        $response = ConsultationResponse::create([
            'consultation_id' => $consultation->id,
            'user_id' => Auth::id(),
            'is_responder' => false,
            'response' => $request->response,
            'is_public' => true, // User responses are always public
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

        return redirect()->route('user.consultations.show', $consultation)
            ->with('success', 'Respon berhasil ditambahkan.');
    }
}
