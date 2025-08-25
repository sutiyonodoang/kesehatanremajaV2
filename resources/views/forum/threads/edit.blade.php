@extends('layouts.app')

@section('title', 'Edit Thread - ' . $thread->title)

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('forum.index') }}">Forum</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('forum.show', $forum) }}">{{ $forum->name }}</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('forum.threads.show', [$forum, $thread]) }}">{{ $thread->title }}</a></li>
                    <li class="breadcrumb-item active">Edit</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Edit Thread</h4>
                </div>
                <div class="card-body">
                    <form action="{{ route('forum.threads.update', [$forum, $thread]) }}" method="POST">
                        @csrf
                        @method('PUT')
                        
                        <div class="mb-3">
                            <label for="title" class="form-label">Judul Thread *</label>
                            <input type="text" 
                                   class="form-control @error('title') is-invalid @enderror" 
                                   id="title" 
                                   name="title" 
                                   value="{{ old('title', $thread->title) }}" 
                                   required>
                            @error('title')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label">Isi Thread *</label>
                            <textarea class="form-control @error('content') is-invalid @enderror" 
                                      id="content" 
                                      name="content" 
                                      rows="8" 
                                      required>{{ old('content', $thread->content) }}</textarea>
                            @error('content')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <div class="form-text">Minimal 10 karakter</div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="{{ route('forum.threads.show', [$forum, $thread]) }}" class="btn btn-secondary">
                                <i class="bi bi-arrow-left"></i> Kembali
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-save"></i> Simpan Perubahan
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
