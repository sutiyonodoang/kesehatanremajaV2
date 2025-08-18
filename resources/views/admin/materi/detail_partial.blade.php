<div class="card-body">
    <p><strong>Kategori:</strong> {{ ucfirst(str_replace('_', ' ', $materi->kategori)) }}</p>
    <p><strong>Tipe:</strong> {{ strtoupper($materi->jenis) }}</p>
    <p>{{ $materi->deskripsi }}</p>

    {{-- Media --}}
    @if($materi->jenis === 'link')
        <a href="{{ $materi->link }}" target="_blank" class="btn btn-outline-info">Buka Link</a>
    @elseif($materi->jenis === 'video')
        <video id="materiVideo" controls width="100%" src="{{ asset('storage/' . $materi->file_path) }}">
            Browser Anda tidak mendukung video.
        </video>
    @elseif(in_array($materi->jenis, ['pdf', 'doc']))
        <a href="{{ asset('storage/' . $materi->file_path) }}" class="btn btn-success me-2" target="_blank">
            📥 Unduh {{ strtoupper($materi->jenis) }}
        </a>
        <iframe src="{{ asset('storage/' . $materi->file_path) }}" width="100%" height="600px" style="border: none;"></iframe>
    @endif

    {{-- Like & Comment Buttons --}}
    <div class="mt-3">
        <button class="btn btn-danger btn-sm" disabled>
            ❤️ Suka ({{ $materi->likes_count }})
        </button>
        <button class="btn btn-outline-primary btn-sm" disabled>
            💬 Komentar ({{ $materi->komentar_count ?? 0 }})
        </button>
    </div>

    {{-- Komentar --}}
    <div class="mt-4">
        <h6>Komentar</h6>
        @forelse($materi->komentar as $komen)
            <div class="mb-2">
                <strong>{{ $komen->user->name }}</strong>
                <small class="text-muted">{{ $komen->created_at->diffForHumans() }}</small>
                <p>{{ $komen->isi_komentar }}</p>

                {{-- Tampilkan balasan admin jika ada --}}
                @if($komen->balasan_admin)
                    <div class="mt-2 ms-3 ps-3 border-start border-3 border-primary bg-light p-2 rounded">
                        <strong class="text-primary">Admin</strong>
                        <p class="mb-0">{{ $komen->balasan_admin }}</p>
                    </div>
                @else
                    {{-- Form balasan admin --}}
                    <form method="POST" action="{{ route('admin.komentar.balas', $komen) }}" class="mt-2 ms-3 ps-3">
                        @csrf
                        <div class="mb-3">
                            <textarea name="balasan_admin" class="form-control" rows="2" placeholder="Tulis balasan Anda..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm">Balas</button>
                    </form>
                @endif
            </div>
        @empty
            <p class="text-muted">Belum ada komentar.</p>
        @endforelse
    </div>
</div>