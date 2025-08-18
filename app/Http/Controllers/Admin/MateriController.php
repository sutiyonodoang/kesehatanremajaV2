<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Materi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MateriController extends Controller
{
    public function index(Request $request)
{
    $query = Materi::withCount(['komentar', 'likes']);

    // Filtering
    if ($request->filled('kategori')) {
        $query->where('kategori', $request->kategori);
    }

    if ($request->filled('created_date')) {
        $query->whereDate('created_at', $request->created_date);
    }

    // Sorting
    $sortBy = $request->get('sort_by', 'created_at');
    $sortOrder = $request->get('sort_order', 'desc');

    if (in_array($sortBy, ['kategori', 'created_at'])) {
        $query->orderBy($sortBy, $sortOrder);
    } else {
        $query->orderBy('created_at', 'desc'); // Default sort
    }

    $materis = $query->paginate(20);

    return view('admin.materi.index', compact('materis'));
}


    public function create()
    {
        return view('admin.materi.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'kategori' => 'required|in:pola_hidup_sehat,reproduksi,kesehatan_mental,gizi,narkoba',
            'deskripsi' => 'nullable|string',
            'sumber' => 'nullable|string|max:255',
            'jenis' => 'required|in:pdf,doc,video',
            'file' => 'nullable|file|max:500000',
        ]);

        $filePath = null;

        if (in_array($request->jenis, ['pdf', 'doc', 'video']) && $request->hasFile('file')) {
            $filePath = $request->file('file')->store('materi_files', 'public');
        }

        Materi::create([
            'judul' => $request->judul,
            'kategori' => $request->kategori,
            'deskripsi' => $request->deskripsi,
            'sumber' => $request->sumber,
            'jenis' => $request->jenis,
            'file_path' => $filePath,
        ]);

        return redirect()->route('admin.materi.index')->with('success', 'Materi berhasil diupload.');
    }

    public function edit(Materi $materi)
    {
        return view('admin.materi.edit', compact('materi'));
    }

    public function update(Request $request, Materi $materi)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'kategori' => 'required|in:pola_hidup_sehat,reproduksi,kesehatan_mental,gizi,narkoba',
            'deskripsi' => 'nullable|string',
            'sumber' => 'nullable|string|max:255',
            'jenis' => 'required|in:pdf,doc,video',
            'file' => 'nullable|file|max:500000',
        ]);

        $filePath = $materi->file_path;

        if (in_array($request->jenis, ['pdf', 'doc', 'video']) && $request->hasFile('file')) {
            if ($materi->file_path) {
                Storage::disk('public')->delete($materi->file_path);
            }
            $filePath = $request->file('file')->store('materi_files', 'public');
        }

        $materi->update([
            'judul' => $request->judul,
            'kategori' => $request->kategori,
            'deskripsi' => $request->deskripsi,
            'sumber' => $request->sumber,
            'jenis' => $request->jenis,
            'file_path' => $filePath,
        ]);

        return redirect()->route('admin.materi.index')->with('success', 'Materi berhasil diperbarui.');
    }

    public function show($id)
    {
        $materi = Materi::with(['komentar.user', 'likes'])
                        ->withCount(['komentar', 'likes'])
                        ->findOrFail($id);
        return view('admin.materi.show', compact('materi'));
    }

    public function showAll(Request $request)
    {
    $query = Materi::withCount(['komentar', 'likes']);

    if ($request->filled('kategori')) {
        $query->where('kategori', $request->kategori);
    }

    $materis = $query->orderByDesc('created_at')->paginate(20);

    return view('admin.materi.show-all', compact('materis'));
}

    public function destroy(Materi $materi)
    {
        if ($materi->file_path) {
            Storage::disk('public')->delete($materi->file_path);
        }

        $materi->delete();

        return redirect()->route('admin.materi.index')->with('success', 'Materi berhasil dihapus.');
    }

    public function showDetail(Materi $materi)
    {
        $materi->load(['komentar.user', 'likes'])->loadCount(['komentar', 'likes', 'downloads']);
        return view('admin.materi.detail_partial', compact('materi'));
    }

    public function streamFile(Materi $materi)
    {
        if (!Storage::disk('public')->exists($materi->file_path)) {
            abort(404, 'File not found.');
        }

        return Storage::disk('public')->response($materi->file_path);
    }
}