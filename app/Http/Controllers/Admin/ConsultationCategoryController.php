<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConsultationCategory;
use Illuminate\Http\Request;

class ConsultationCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = ConsultationCategory::withCount('consultations')
            ->orderBy('name')
            ->paginate(15);

        return view('admin.consultation-categories.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.consultation-categories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:consultation_categories',
            'description' => 'nullable|string',
            'color' => 'required|string|max:7',
            'is_active' => 'boolean',
        ]);

        ConsultationCategory::create($request->all());

        return redirect()->route('admin.consultation-categories.index')
            ->with('success', 'Kategori konsultasi berhasil dibuat.');
    }

    /**
     * Display the specified resource.
     */
    public function show(ConsultationCategory $consultationCategory)
    {
        $consultationCategory->load(['consultations.user', 'consultations.latestResponse']);
        
        return view('admin.consultation-categories.show', compact('consultationCategory'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ConsultationCategory $consultationCategory)
    {
        return view('admin.consultation-categories.edit', compact('consultationCategory'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ConsultationCategory $consultationCategory)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:consultation_categories,name,' . $consultationCategory->id,
            'description' => 'nullable|string',
            'color' => 'required|string|max:7',
            'is_active' => 'boolean',
        ]);

        $consultationCategory->update($request->all());

        return redirect()->route('admin.consultation-categories.index')
            ->with('success', 'Kategori konsultasi berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ConsultationCategory $consultationCategory)
    {
        if ($consultationCategory->consultations()->count() > 0) {
            return redirect()->route('admin.consultation-categories.index')
                ->with('error', 'Kategori tidak dapat dihapus karena masih memiliki konsultasi.');
        }

        $consultationCategory->delete();

        return redirect()->route('admin.consultation-categories.index')
            ->with('success', 'Kategori konsultasi berhasil dihapus.');
    }
}
