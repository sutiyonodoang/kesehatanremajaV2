-- Fix untuk materi ID 15: Update file_path yang tidak ada
UPDATE materis SET file_path = 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf' WHERE id = 15;

-- Fix untuk materi ID 21: Update jenis dari pdf ke doc untuk file PPTX
UPDATE materis SET jenis = 'doc' WHERE id = 21;

-- Verifikasi perubahan
SELECT id, judul, jenis, file_path FROM materis WHERE id IN (15, 21);
