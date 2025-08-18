-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Agu 2025 pada 18.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kesehatan_platform`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 07:30:19', '2025-08-18 07:30:19'),
(2, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 07:30:33', '2025-08-18 07:30:33'),
(3, 'default', 'created', 'App\\Models\\Like', 'created', 10, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":12,\"user_id\":21}}', NULL, '2025-08-18 08:11:58', '2025-08-18 08:11:58'),
(4, 'default', 'created', 'App\\Models\\Like', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":7,\"user_id\":21}}', NULL, '2025-08-18 08:12:08', '2025-08-18 08:12:08'),
(5, 'default', 'created', 'App\\Models\\Like', 'created', 12, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":5,\"user_id\":21}}', NULL, '2025-08-18 08:12:18', '2025-08-18 08:12:18'),
(6, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:13:18', '2025-08-18 08:13:18'),
(7, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:13:32', '2025-08-18 08:13:32'),
(8, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:13:32', '2025-08-18 08:13:32'),
(9, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:24:33', '2025-08-18 08:24:33'),
(10, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:24:48', '2025-08-18 08:24:48'),
(11, 'default', 'created', 'App\\Models\\Like', 'created', 13, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":11,\"user_id\":21}}', NULL, '2025-08-18 08:25:04', '2025-08-18 08:25:04'),
(12, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"materi_id\":10}}', NULL, '2025-08-18 08:25:31', '2025-08-18 08:25:31'),
(13, 'default', 'created', 'App\\Models\\Like', 'created', 14, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":10,\"user_id\":21}}', NULL, '2025-08-18 08:28:31', '2025-08-18 08:28:31'),
(14, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:28:49', '2025-08-18 08:28:49'),
(15, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:29:07', '2025-08-18 08:29:07'),
(16, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:29:07', '2025-08-18 08:29:07'),
(17, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:30:42', '2025-08-18 08:30:42'),
(18, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:30:55', '2025-08-18 08:30:55'),
(19, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:31:17', '2025-08-18 08:31:17'),
(20, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:31:31', '2025-08-18 08:31:31'),
(21, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:31:31', '2025-08-18 08:31:31'),
(22, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"consultation_id\":5,\"user_id\":20,\"is_responder\":true,\"response\":\"beberapa tips olahraga yang baik dan sehat agar kamu bisa mendapatkan manfaat maksimal dari aktivitas fisik tanpa cedera:\\r\\n\\r\\n1. Tentukan Tujuan dengan Jelas\\r\\nApakah ingin menurunkan berat badan, meningkatkan kekuatan, atau sekadar menjaga kesehatan?\\r\\nTujuan yang jelas membantumu memilih jenis olahraga yang tepat (misalnya: lari untuk kardio, angkat beban untuk kekuatan).\\r\\n2. Mulai Perlahan dan Konsisten\\r\\nJangan langsung memaksakan diri. Mulai dari intensitas ringan hingga sedang.\\r\\nKonsistensi lebih penting daripada durasi atau intensitas. Lebih baik olahraga\\r\\n30 menit setiap hari daripada 2 jam sekali seminggu.\\r\\n3. Pilih Jenis Olahraga yang Disukai\\r\\nPilih aktivitas yang menyenangkan seperti bersepeda, berenang, menari, atau jalan kaki santai.\\r\\nDengan menikmati olahraga, kamu lebih mudah bertahan dalam jangka panjang.\\r\\n4. Lakukan Pemanasan dan Pendinginan\\r\\nPemanasan (5\\u201310 menit): seperti jalan cepat atau gerakan ringan untuk mempersiapkan otot.\\r\\nPendinginan (5\\u201310 menit): seperti peregangan setelah olahraga untuk mencegah kram dan mempercepat pemulihan.\\r\\n5. Gabungkan Jenis Latihan\\r\\nKardio (jantung): lari, berenang, sepeda \\u2013 3\\u20135 kali seminggu.\\r\\nKekuatan otot: angkat beban, squat, push-up \\u2013 2\\u20133 kali seminggu.\\r\\nKelenturan & keseimbangan: yoga, pilates, peregangan \\u2013 bantu mencegah cedera.\\r\\n6. Dengarkan Tubuhmu\\r\\nJika merasa nyeri tajam, lelah berlebihan, atau pusing, hentikan dan istirahat.\\r\\nNyeri otot ringan (DOMS) setelah latihan normal, tapi nyeri sendi atau otot yang tajam tidak normal.\\r\\n7. Jaga Hidrasi dan Nutrisi\\r\\nMinum air sebelum, selama, dan setelah olahraga.\\r\\nKonsumsi makanan bergizi untuk mendukung energi dan pemulihan otot (protein, karbohidrat kompleks, vitamin).\\r\\n8. Istirahat yang Cukup\\r\\nTubuh perlu waktu untuk pulih. Beri jeda antar sesi latihan, terutama untuk otot yang sama.\\r\\nTidur 7\\u20139 jam per malam sangat penting untuk pemulihan.\\r\\n9. Gunakan Perlengkapan yang Tepat\\r\\nSepatu olahraga yang nyaman, pakaian menyerap keringat, dan alat bantu jika diperlukan.\\r\\nIni membantu mencegah cedera dan meningkatkan kenyamanan.\\r\\n10. Konsultasi dengan Ahli (jika perlu)\\r\\nJika punya kondisi kesehatan tertentu (diabetes, jantung, dll), konsultasikan dulu dengan dokter atau pelatih profesional.\\r\\nPelatih bisa membantu membuat program latihan yang aman dan efektif.\\r\\nBonus: Buat Jadwal dan Catat Kemajuan\\r\\nJadwalkan olahraga seperti janji penting.\\r\\nCatat aktivitas, durasi, dan perasaan setelah olahraga \\u2013 ini memotivasi dan membantumu melihat perkembangan.\\r\\nIngat, Olahraga bukan hanya soal bentuk tubuh, tapi juga kesehatan mental, energi, dan kualitas hidup secara keseluruhan.\",\"is_public\":true}}', NULL, '2025-08-18 08:34:44', '2025-08-18 08:34:44'),
(23, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-18 08:34:44', '2025-08-18 08:34:44'),
(24, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:40:36', '2025-08-18 08:40:36'),
(25, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:40:51', '2025-08-18 08:40:51'),
(26, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 6, 'App\\Models\\User', 21, '{\"attributes\":{\"consultation_id\":5,\"user_id\":21,\"is_responder\":false,\"response\":\"Baik, terima kasih atas respon dan sarannya, akan saya coba pak\\/bu.\\r\\n\\r\\nterima kasih\",\"is_public\":true}}', NULL, '2025-08-18 08:42:29', '2025-08-18 08:42:29'),
(27, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:42:39', '2025-08-18 08:42:39'),
(28, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:42:54', '2025-08-18 08:42:54'),
(29, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:42:54', '2025-08-18 08:42:54'),
(30, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-18 08:43:22', '2025-08-18 08:43:22'),
(31, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:49:05', '2025-08-18 08:49:05'),
(32, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:49:22', '2025-08-18 08:49:22'),
(33, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 09:04:08', '2025-08-18 09:04:08'),
(34, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:22', '2025-08-18 09:04:22'),
(35, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:22', '2025-08-18 09:04:22'),
(36, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:49', '2025-08-18 09:04:49'),
(37, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:05:06', '2025-08-18 09:05:06'),
(38, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:05:06', '2025-08-18 09:05:06'),
(39, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:26:57', '2025-08-18 09:26:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `consultations`
--

CREATE TABLE `consultations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('menunggu','proses','selesai') NOT NULL DEFAULT 'menunggu',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `consultation_attachments`
--

CREATE TABLE `consultation_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `response_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `consultation_categories`
--

CREATE TABLE `consultation_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#007bff',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `consultation_categories`
--

INSERT INTO `consultation_categories` (`id`, `name`, `description`, `color`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Pola Hidup Sehat', NULL, '#007bff', 1, NULL, NULL),
(2, 'Reproduksi', NULL, '#007bff', 1, NULL, NULL),
(13, 'Gizi', NULL, '#007bff', 1, NULL, NULL),
(16, 'Narkoba', NULL, '#007bff', 1, NULL, NULL),
(19, 'Kesehatan Mental', NULL, '#007bff', 1, NULL, NULL),
(20, 'Lainnya', 'Konsultasi kesehatan lainnya', '#6c757d', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `consultation_responses`
--

CREATE TABLE `consultation_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_responder` tinyint(1) NOT NULL DEFAULT 0,
  `response` text NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `download_logs`
--

CREATE TABLE `download_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `materi_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `download_logs`
--

INSERT INTO `download_logs` (`id`, `user_id`, `materi_id`, `created_at`, `updated_at`) VALUES
(7, 21, 12, '2025-08-17 17:29:43', '2025-08-17 17:29:43'),
(8, 21, 10, '2025-08-17 17:56:09', '2025-08-17 17:56:09'),
(9, 21, 8, '2025-08-17 17:56:34', '2025-08-17 17:56:34'),
(10, 21, 5, '2025-08-17 17:56:55', '2025-08-17 17:56:55'),
(11, 21, 10, '2025-08-18 08:25:31', '2025-08-18 08:25:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `informasi_kesehatan`
--

CREATE TABLE `informasi_kesehatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `link_sumber` text NOT NULL,
  `tanggal_update` date NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `informasi_kesehatan`
--

INSERT INTO `informasi_kesehatan` (`id`, `judul`, `deskripsi`, `link_sumber`, `tanggal_update`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Kesehatan Remaja', 'kesehatan pada remaja', 'https://ayosehat.kemkes.go.id/kategori-usia/remaja', '2025-07-03', 3, '2025-07-02 15:28:57', '2025-07-02 15:28:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentars`
--

CREATE TABLE `komentars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `isi_komentar` text NOT NULL,
  `balasan_admin` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `komentars`
--

INSERT INTO `komentars` (`id`, `materi_id`, `user_id`, `isi_komentar`, `balasan_admin`, `created_at`, `updated_at`) VALUES
(3, 7, 21, 'gue bangett', NULL, '2025-08-12 02:14:11', '2025-08-12 02:14:11'),
(4, 9, 26, 'Semoga bisa jadi bermanfaat untuk kedepannya 🙏', NULL, '2025-08-12 19:50:12', '2025-08-12 19:50:12'),
(5, 13, 42, 'menarik, dan dapat di pahami', NULL, '2025-08-12 19:54:48', '2025-08-12 19:54:48'),
(6, 13, 62, 'Video nya sangat baguss', NULL, '2025-08-12 19:54:50', '2025-08-12 19:54:50'),
(7, 13, 27, 'seru, karena interaktif banget jujur suka ke materi yang interaktif kayak gini', NULL, '2025-08-12 19:55:16', '2025-08-12 19:55:16'),
(8, 13, 30, 'keren,materinya mudah dipahami', NULL, '2025-08-12 19:56:40', '2025-08-12 19:56:40'),
(9, 13, 52, 'banyak pelajaran yang di ambil,bagus banget', NULL, '2025-08-12 19:56:55', '2025-08-12 19:56:55'),
(10, 13, 23, 'keren bgt omg', NULL, '2025-08-12 19:59:07', '2025-08-12 19:59:07'),
(11, 13, 54, 'wow', NULL, '2025-08-12 19:59:40', '2025-08-12 19:59:40'),
(12, 13, 40, 'kerennn 💕💕', NULL, '2025-08-12 20:00:09', '2025-08-12 20:00:09'),
(13, 5, 27, 'detail dan lengkap, bagus banget min', NULL, '2025-08-12 20:00:27', '2025-08-12 20:00:27'),
(14, 13, 46, 'menarik dan kreatif, mulai dari isi materinya sampaii animasi nyaa dan gampang dipahami', NULL, '2025-08-12 22:55:41', '2025-08-12 22:55:41'),
(15, 13, 47, 'penjelasan dalam bentuk vidio seperti ini sangat lah menarik, karna ketertarikan itu lah saya bisa lebih memahami dan mengerti apa maksud dan tujuan yang di sampaikan', NULL, '2025-08-13 01:59:15', '2025-08-13 01:59:15'),
(16, 13, 48, 'keren', NULL, '2025-08-13 04:54:19', '2025-08-13 04:54:19'),
(17, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:02', '2025-08-13 18:48:02'),
(18, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:03', '2025-08-13 18:48:03'),
(19, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:04', '2025-08-13 18:48:04'),
(20, 13, 21, 'saya suka materinya', NULL, '2025-08-14 03:25:16', '2025-08-14 03:25:16'),
(21, 13, 43, 'kerennn🔥', NULL, '2025-08-14 03:54:46', '2025-08-14 03:54:46'),
(22, 7, 43, 'SERUUU BANGETT LIATNYAA', NULL, '2025-08-14 04:01:44', '2025-08-14 04:01:44'),
(23, 12, 43, 'seruuu bangeett bacanya, panjang banget🔥😿😍😍', NULL, '2025-08-14 04:55:53', '2025-08-14 04:55:53'),
(24, 13, 63, 'videonya sangat bermanfaat, jadi lebih paham pentingnya menjaga kesehatan mental dan cara mengelola stres.', NULL, '2025-08-14 05:09:22', '2025-08-14 05:09:22'),
(25, 12, 63, 'materinya informatif dan jelas menjelaskan peran hormon stres seperti kortisol, adrenalin, dan norepinefrin, serta tahap-tahap respon tubuh... isinya mudah dipahami dan sesuai dengan kesehatan jiwa sehari-hari', NULL, '2025-08-14 05:13:04', '2025-08-14 05:13:04'),
(26, 9, 43, 'seruu banget nontonnyaa', NULL, '2025-08-14 18:05:43', '2025-08-14 18:05:43'),
(27, 13, 59, 'Seruu bangett, menarik , kerennn, there besttttt pokok nyaaaaa 🥰🔥🔥🔥', NULL, '2025-08-14 21:47:52', '2025-08-14 21:47:52'),
(28, 11, 62, 'Materi nya mudah di pahamii🙌', NULL, '2025-08-15 01:54:38', '2025-08-15 01:54:38'),
(29, 9, 62, 'Video yang sangat bermanfaat buat kita semuaa🙌', NULL, '2025-08-15 22:27:51', '2025-08-15 22:27:51'),
(30, 7, 62, 'Penjelasannya sangat jelas dan video nya sangat baguss', NULL, '2025-08-15 22:31:07', '2025-08-15 22:31:07'),
(31, 13, 83, 'bagus banget dan mudah dimengerti', NULL, '2025-08-16 06:06:56', '2025-08-16 06:06:56'),
(32, 12, 83, 'materinya detail bangett, bener bener ngebantu kita buat kedepannya lagi agar berpengatahuan luas 💥💓', NULL, '2025-08-16 06:09:41', '2025-08-16 06:09:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`id`, `materi_id`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 12, 21, '2025-08-18 08:11:58', '2025-08-18 08:11:58'),
(11, 7, 21, '2025-08-18 08:12:08', '2025-08-18 08:12:08'),
(12, 5, 21, '2025-08-18 08:12:18', '2025-08-18 08:12:18'),
(13, 11, 21, '2025-08-18 08:25:04', '2025-08-18 08:25:04'),
(14, 10, 21, '2025-08-18 08:28:31', '2025-08-18 08:28:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materis`
--

CREATE TABLE `materis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `kategori` enum('pola_hidup_sehat','reproduksi','kesehatan_mental','gizi','narkoba') NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `sumber` text DEFAULT NULL COMMENT 'Sumber materi',
  `jenis` varchar(255) NOT NULL COMMENT 'pdf, doc, link, video',
  `file_path` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `materis`
--

INSERT INTO `materis` (`id`, `judul`, `slug`, `kategori`, `deskripsi`, `sumber`, `jenis`, `file_path`, `link`, `created_at`, `updated_at`, `status`) VALUES
(5, 'Gizi Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf', NULL, '2025-08-05 16:48:19', '2025-08-05 16:48:19', 'aktif'),
(7, 'Edukasi Gizi Seimbang', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/e15miiQKxnqwOVOhnvf0Utphc3vyWOOKp3KKpsZc.mp4', NULL, '2025-08-05 16:50:17', '2025-08-05 16:50:17', 'aktif'),
(8, 'Waspada Narkoba', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/k7lnvjhH5r9nUgfsfT1LK6SbWbfYnxgoehQqhPp6.pdf', NULL, '2025-08-05 16:51:38', '2025-08-05 16:51:38', 'aktif'),
(9, 'Pencegahan Penyalahgunaan NAPZA Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/1iZi3rMHfEd9cscmxdSSg1wcALlZlWA6zOHtEjLv.mp4', NULL, '2025-08-05 16:53:27', '2025-08-05 16:53:27', 'aktif'),
(10, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'pdf', 'materi_files/t6Q4UYMPGoNRRKdjlsSeiHSF0j9oW4zMjZhkOLC2.pdf', NULL, '2025-08-05 16:54:34', '2025-08-05 16:54:34', 'aktif'),
(11, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'video', 'materi_files/UKiSoYORnokknTtEcOVKIl1PQQUFR2zRKJF6dCQ3.mp4', NULL, '2025-08-05 16:55:06', '2025-08-05 16:55:06', 'aktif'),
(12, 'Kesehatan Mental dan Manajemen Stress Remaja', NULL, 'kesehatan_mental', NULL, NULL, 'pdf', 'materi_files/mdltEb7NksMZfbeD2L3ckit7brcBTdWOU82SYbT9.pdf', NULL, '2025-08-05 16:55:49', '2025-08-05 16:55:49', 'aktif'),
(13, 'Sehatkah Jiwaku?', NULL, 'kesehatan_mental', NULL, NULL, 'video', 'materi_files/MxCD3f373J3gJRfYSKDTr1MAGs46UfetlP6vx1wQ.mp4', NULL, '2025-08-05 16:56:29', '2025-08-05 16:56:29', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_16_073753_create_materis_table', 1),
(5, '2025_06_16_074054_create_komentars_table', 1),
(6, '2025_06_16_074143_create_zoom_rooms_table', 1),
(7, '2025_06_16_074154_create_likes_table', 1),
(8, '2025_06_16_075800_create_informasi_kesehatans_table', 1),
(9, '2025_06_24_075559_alter_link_sumber_on_informasi_kesehatan_table', 1),
(10, '2025_07_14_045952_add_meeting_id_and_passcode_to_zoom_rooms', 1),
(11, '2025_08_12_054703_add_slug_to_materis_table', 1),
(12, '2025_08_12_065443_create_download_logs_table', 1),
(13, '2025_08_12_114707_update_kategori_enum_on_materis_table', 2),
(14, '2025_08_12_191651_create_user_progress_table', 3),
(15, '2025_08_14_010446_add_status_to_materis_table', 4),
(16, '2025_08_14_050444_create_consultation_categories_table', 4),
(17, '2025_08_14_050512_create_consultations_table', 4),
(18, '2025_08_14_050519_create_consultation_responses_table', 4),
(19, '2025_08_14_050524_create_consultation_attachments_table', 4),
(20, '2025_08_14_055611_add_role_konsultan_to_users_table', 5),
(21, '2025_08_15_081523_add_sumber_to_materis_table', 6),
(22, '2025_08_17_071819_update_status_on_consultations_table', 7),
(23, '2025_08_17_091514_update_consultation_responses_for_chat', 8),
(24, '2025_08_18_141946_create_activity_log_table', 9),
(25, '2025_08_18_141947_add_event_column_to_activity_log_table', 9),
(26, '2025_08_18_141948_add_batch_uuid_column_to_activity_log_table', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('depiacomputer@gmail.com', '$2y$12$sXnjEgYIFvSJCHdri4uL6ejGzA46Osrs3AIZqV0Lxb8pBLKuR70gy', '2025-07-09 00:53:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('v2J0C46ErcWreYPeF0hcqyyrmGEGt0BckhSb2u8w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0liUktOUE9XTDM1NDhlWFZRR0FQbzh5M212ekNUOFdMZENIWWlaQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1755534418);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user','konsultan') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Devia', 'dviafnopiani@gmail.com', NULL, '$2y$12$uwJqDHWRsqtwP8GyZubAceqS/ueSOJ5KLELQzAE6BZcNwadov7/5O', 'admin', NULL, '2025-06-30 19:42:59', '2025-06-30 19:42:59'),
(5, 'devia', 'depiacomputer@gmail.com', NULL, '$2y$12$3D43kv3gQngMrloJErHuEeJZWBh/sYoOD.oWgSd4YzLov3mY7hw5q', 'user', NULL, '2025-07-02 14:58:25', '2025-07-02 14:58:25'),
(20, 'Sutiyono', 'sutiyonodoang@gmail.com', NULL, '$2y$12$3g5exqqoWA9D0YMeUb.I6u24x.7pvkbVniU8qWC9w4cipZF9kguPO', 'admin', NULL, '2025-08-11 20:31:42', '2025-08-11 20:31:42'),
(21, 'rio', 'tiyo@unibba.ac.id', NULL, '$2y$12$DstenL5MmETo8tsvkiiEP.vcPzLnvXidt6Rwdrs.88OsJDR9BSV1a', 'user', NULL, '2025-08-11 20:35:06', '2025-08-14 03:26:30'),
(22, 'Lutfhiya Siti Nur Jauza', 'akunfotopart0@gmail.com', NULL, '$2y$12$nS4XyuslJNgFrcB9MLk./uAMnN7qg9HiCK3PiSownfTj7N9hF4ms2', 'user', NULL, '2025-08-12 19:31:33', '2025-08-12 19:31:33'),
(23, 'Yunike Viona Fronika', 'vionamaibangg@gmail.com', NULL, '$2y$12$xJfFkPtVner/SKoKm9JxT.w9TqN1RLUMyF7xjpbNyEaidaA0UsR2i', 'user', NULL, '2025-08-12 19:46:17', '2025-08-12 19:46:17'),
(24, 'Alvian Cyril Nugraha', 'alvianugraha2020@gmail.com', NULL, '$2y$12$1El4isk3IBU9oZ9mLXZHiuMmhiRx0cZMFeOz19vvsMMas2dFxBt9i', 'user', NULL, '2025-08-12 19:46:19', '2025-08-12 19:46:19'),
(25, 'Devira Diva Suherman', 'divadevira49@gmail.com', NULL, '$2y$12$.RrrE44L7Q.T386RP4ISje3Keb9htAGe7pnpj62MG3GZBIffcBmVG', 'user', NULL, '2025-08-12 19:46:32', '2025-08-12 19:46:32'),
(26, 'Restu Muhammad Ihwan', 'aningyuningsih.362@gmail.com', NULL, '$2y$12$PKKXUE3VFv5/nUDi2YInwu3Ea4aSqHTFbAndxEehXVE2r08myiY5u', 'user', NULL, '2025-08-12 19:46:32', '2025-08-12 19:46:32'),
(27, 'Tedi Afriansyah', 'tedaf628@gmail.com', NULL, '$2y$12$GvlFYTeLO2oJjoYxuhlb5u2zIXZ45tVTwG9Bwhx.OGMFhRVMW6coe', 'user', NULL, '2025-08-12 19:46:39', '2025-08-12 19:46:39'),
(28, 'Nabel fauziya', 'nabelfauziya@gmail.com', NULL, '$2y$12$LpzeOEzi0Y0yA2p.I2AOtOassyf7b.ED3s4izQ4YlnCjD2YnWerCS', 'user', NULL, '2025-08-12 19:46:51', '2025-08-12 19:46:51'),
(29, 'Riani Septiadewi', 'rianisptdw16@gmail.com', NULL, '$2y$12$nNpGqgl9NZlQ0YXH7rTUIOufYp5Ff0GjR4tRipoX9N.DxYUXHabdC', 'user', NULL, '2025-08-12 19:46:53', '2025-08-12 19:46:53'),
(30, 'Asyraf Muhammad Nur firdaus', 'asyrafmn46@gmail.com', NULL, '$2y$12$B8FOD9aXA/rDm1qlpICOle3V8n.2xVfXdARaq2skYhp6NagyQ7.nu', 'user', NULL, '2025-08-12 19:46:57', '2025-08-12 19:46:57'),
(31, 'Agni Sriguntari', 'agnisriguntari2@gmail.com', NULL, '$2y$12$z8XsPGxEt3lCU9HOmPVxU.Tr9KHBycEeaNV0OIzsUcfGbdt26y1d2', 'user', NULL, '2025-08-12 19:46:58', '2025-08-12 19:46:58'),
(32, 'Sahla Adresti Al Ihsani', 'sahlaadrestialihsani@gmail.com', NULL, '$2y$12$FC70jNIcfttp0Y1MsDQmUezfQCnqKzrvHmS1HglSSYm9P1ciICVFW', 'user', NULL, '2025-08-12 19:47:02', '2025-08-12 19:47:02'),
(33, 'Susi Susilawati', 'susi1law4ti@gmail.com', NULL, '$2y$12$KKgYhQlRIgsSoZDOUytvSeUnmc4aTC7kARE/Qd/SbAG2.FcHBBhTq', 'user', NULL, '2025-08-12 19:47:18', '2025-08-12 19:47:18'),
(34, 'Cicin Rahmawati', 'cicinrahmawati@gmail.com', NULL, '$2y$12$LjxbxmOaNjGXHVUgxfPBnOsw2aipNaDIO9O0I8J8p6/huk04Ok/7m', 'user', NULL, '2025-08-12 19:47:25', '2025-08-12 19:47:25'),
(35, 'Refika Adriani', 'fikadoang751@gmail.com', NULL, '$2y$12$xG0F/lX2OnvHzQbjT9lIAe82liZOGPuOL7hCYfhUudJjD323LC1qW', 'user', NULL, '2025-08-12 19:47:33', '2025-08-12 19:47:33'),
(36, 'Dzaki AlBariz Hidayat', 'dzakialbarizh@gmail.com', NULL, '$2y$12$izk3btNdnjTsI2QQduQM4.O4mOFRSEAHRARNRzWspIcsbPTkcaUTO', 'user', NULL, '2025-08-12 19:47:34', '2025-08-12 19:47:34'),
(37, 'Kevin', 'layv3x3@gmail.com', NULL, '$2y$12$sL2OGFP2LD3ZpzpOarx8FONA81VFBWLuG6BySEvCeuy.J3uOKvbuy', 'user', NULL, '2025-08-12 19:47:35', '2025-08-12 19:47:35'),
(38, 'Carissa Widya Baharizki', 'carisawidyabaharizki@gmail.com', NULL, '$2y$12$j.XQXHBwMQ5YSbLS0KbWeuotSceymEruZ0wkc5p6diN0E3AVk3atW', 'user', NULL, '2025-08-12 19:47:42', '2025-08-12 19:47:42'),
(39, 'Vanessa Regina Putri', 'vanessareginaputri4@gmail.com', NULL, '$2y$12$5WzB525mSIfXyDyEX8OhAuGuQ9NR6J8cso0qLCXW6P.rm1gubDfuG', 'user', NULL, '2025-08-12 19:47:46', '2025-08-12 19:47:46'),
(40, 'Khaira Nursabila', 'nskhaira25@gmail.com', NULL, '$2y$12$Ag0onUOPgnlPB4LN5eIEq.tTeR042yKxo4Fbx3nuho7Ezrv3sX99q', 'user', NULL, '2025-08-12 19:47:48', '2025-08-12 19:47:48'),
(41, 'Diva', 'divai0611@gmail.com', NULL, '$2y$12$oNZVEzI89FPSNZjh8CN7k.OWAr29VjnxznXcyvTX0Il/VNe.yVIc2', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53'),
(42, 'Elia Sri Rismawati', 'eliasrirismawati9@gmail.com', NULL, '$2y$12$FXD1a/l1sRlzgHj2mW/dxegeQ60bohsNtA115jIPJrJUHLU8uzm8m', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53'),
(43, 'Titania putri', 'titaniap334@gmail.com', NULL, '$2y$12$exZYAqdae4RhISCN/Gk0QuKXyWmZ22awz98KWS9ADovH2j/5mqs/i', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53'),
(44, 'hikmah nurkholifah', 'h3493522@gmail.com', NULL, '$2y$12$ADd0Erg5W60eB3tcMFTAdeva87YBWLrrcrvaixeyICqmUWH6MStSC', 'user', NULL, '2025-08-12 19:47:54', '2025-08-12 19:47:54'),
(45, 'Arisa Nabila Bilqis', 'naqieess@gmail.com', NULL, '$2y$12$X4wfdCXzIz6lFA8.mgwR9OZjEII/E5QwodEgeFmKDMNgyXOmWS9ZO', 'user', NULL, '2025-08-12 19:47:57', '2025-08-12 19:47:57'),
(46, 'Randi Akbar Putra', 'akbarputrarandi@gmail.com', NULL, '$2y$12$EE1z/vfpiE693uaZqCQuN.xxuTkxJ9s30XRTDcHNdwaEUbB6HUjTu', 'user', NULL, '2025-08-12 19:48:02', '2025-08-12 19:48:02'),
(47, 'Brescia Rose Samosir', 'bresciasamosir@gmail.com', NULL, '$2y$12$qUm1MLZjmStk2z18qH5zFukhOznJpVmG5Gv8ylgHfzW5CVuYlYX5y', 'user', NULL, '2025-08-12 19:48:05', '2025-08-12 19:48:05'),
(48, 'Ribka Naomi Artha', 'ribkasitungkir77@gmail.com', NULL, '$2y$12$k/QDBnGu9s5dorr4wNCm4edekE3iLHf2sYaftP.VGAxhNaTJ1UIJS', 'user', NULL, '2025-08-12 19:48:06', '2025-08-12 19:48:06'),
(49, 'FAIRUZ ZIKRI HABIBULLAH', 'haneulkioflife@gmail.com', NULL, '$2y$12$TNgshtpXjWsJLz98te2Mvur36CVEoOyPtsrWP44ohV/KkxUY3Zwui', 'user', NULL, '2025-08-12 19:48:08', '2025-08-12 19:48:08'),
(50, 'Fahra faddilah', 'yantisusanti8865@gmail.com', NULL, '$2y$12$yfxZz8apDEvN.0p8tYNzXu9rBcuvAYxPYVEctJ9AQ1YDT6KUc9SBK', 'user', NULL, '2025-08-12 19:48:18', '2025-08-12 19:48:18'),
(51, 'Yolanda Renata Putri BR. Sinurat', 'ylandarnata@gmail.com', NULL, '$2y$12$rhUXyR2kLK5CGXUrVUzT3.2NLauB6wjiHr45jBgXhl5BIYFj.XTo6', 'user', NULL, '2025-08-12 19:48:21', '2025-08-12 19:48:21'),
(52, 'Dea Auliya', 'deaaulia251022@gmail.com', NULL, '$2y$12$nL.X7RwHZamVYmzErfU0g.FjbFEEeicg9aXRCGW91YoLXMsG9zxnW', 'user', NULL, '2025-08-12 19:48:28', '2025-08-12 19:48:28'),
(53, 'Enurjanah aeni', 'nunurrnur@gmail.com', NULL, '$2y$12$i7a3eYmOWql20tzQYStvN.FrdrRWBH929NGFASFjGJC07ju5WAGi6', 'user', NULL, '2025-08-12 19:48:28', '2025-08-12 19:48:28'),
(54, 'windu wulansari', 'wulanwindu054@gmail.com', NULL, '$2y$12$mXQ7ubXmLcSQmuKsbPWFY.WeP8vDVitC7NQmuI6rL6F8W8sfODvhK', 'user', NULL, '2025-08-12 19:48:35', '2025-08-12 19:48:35'),
(55, 'DONI PUTRA PRATAMA', 'dnnyptra110@gmail.com', NULL, '$2y$12$tAL0FS/prsRA7HwpNuzu/eXgmT/3eA1PU50b/q5aMAInxT6v3WwCm', 'user', NULL, '2025-08-12 19:48:37', '2025-08-12 19:48:37'),
(56, 'IRHAM ABDUL HAKIM', 'irhamabdulh209@gmail.com', NULL, '$2y$12$cnLax91pjRdaKlrFYFXm2OK.qkyt6BOpL8fC3ynQIe1OW0OXEX8t6', 'user', NULL, '2025-08-12 19:48:45', '2025-08-12 19:48:45'),
(57, 'cipaa', 'ipo0ca4@gmail.com', NULL, '$2y$12$aY2nYlD34PsL75O8DmC3auILam1q02XCUTEBZj91knTR2ptiNb3Pq', 'user', NULL, '2025-08-12 19:48:45', '2025-08-12 19:48:45'),
(58, 'NISRINA NAILAH ZALFA', 'disrinazalfa@gmail.com', NULL, '$2y$12$l4pSVXwvBtYFOjIoeLQDnunCeUecz0DWEfwXfD2LZvxdZ3Mj8nOoq', 'user', NULL, '2025-08-12 19:48:48', '2025-08-12 19:48:48'),
(59, 'Putra Andika Pertama', 'dikaa13625@gmail.com', NULL, '$2y$12$xvU7KrcXdJSW.jZNU/tw0e88qa1auAVGtk/cOuK//WZ1jLuznzZT6', 'user', NULL, '2025-08-12 19:49:04', '2025-08-12 19:49:04'),
(60, 'Qeenanty', 'qeenanty2008@gmail.com', NULL, '$2y$12$HK7tLlwyDnwzTGaVV1xaXeetxdW2jJfY.IlPrZC2SS6JWJJuTRyBW', 'user', NULL, '2025-08-12 19:49:05', '2025-08-12 19:49:05'),
(61, 'keanu adhna kurniawan', 'keanuadhna@gmail.com', NULL, '$2y$12$HrbTk8AqC4jnY.IMOHljXuGCwVF6sbkttLGdtSe0s6wWXMvBJjFZy', 'user', NULL, '2025-08-12 19:49:09', '2025-08-12 19:49:09'),
(62, 'Muhammad Ikhbal Syahreiza', 'doanksyahreza@gmail.com', NULL, '$2y$12$t1g6Fv9evL325NCWR4..KObqzcm2GbiibwktXpHXaMbKOwk3h4y2e', 'user', NULL, '2025-08-12 19:49:17', '2025-08-12 19:49:17'),
(63, 'Keyzia Syaira Azalea', 'keyziaazalea68@gmail.com', NULL, '$2y$12$FuqAxJBsVuerY2OjGJM7dugGy8YV6wvA3OX.LT6mKpEDGxLYtPIf.', 'user', NULL, '2025-08-12 19:49:21', '2025-08-12 19:49:21'),
(64, 'Deajeng Oktavia', 'deajengoktavia06@gmai.com', NULL, '$2y$12$Ryg6NxwjzASq0wumwlJzK.7aN5s1h0VvBX7NUyjv03DEPdP3yzgTa', 'user', NULL, '2025-08-12 19:49:30', '2025-08-12 19:49:30'),
(65, 'Willi anugrah', 'willianugrah61@gmail.com', NULL, '$2y$12$NsWyYyDjG50MVPOE5cklLeG4VKM6cZl1Mz6H/cKEyjds8vGo6T3I6', 'user', NULL, '2025-08-12 19:49:58', '2025-08-12 19:49:58'),
(66, 'Vinni Rizqiyanti', 'vinirizqyanti@gmail.com', NULL, '$2y$12$t1/FMuyEuFL2q02XYl3NiuLndID4IkTvpuIvFGGmSsi3Ymo6/15ZS', 'user', NULL, '2025-08-12 19:50:00', '2025-08-12 19:50:00'),
(67, 'REZA ABDUL ROHMAN', 'rezaabdulr16@gmail.com', NULL, '$2y$12$wcJdrf/xnnbR9v1JhzzYAePyRqXMNI7eP1t3IJvMKY/iUuKR.fy36', 'user', NULL, '2025-08-12 19:50:06', '2025-08-12 19:50:06'),
(68, 'Xena Kaila Nisa', 'arumibacin@gmail.com', NULL, '$2y$12$5FvVcGw7QQ3YZeDg73.YK.3bujPyn5gBZ194dzvQFYsz1OiETNOJO', 'user', NULL, '2025-08-12 19:50:17', '2025-08-12 19:50:17'),
(69, 'Gisela Syiami Putri', 'giselasyiamiputri08@gmail.com', NULL, '$2y$12$q/H3XLocaCX5SrI.0eujLeMgIb6GSVCWM.R/4.Ad4PjZNYetX0eYm', 'user', NULL, '2025-08-12 19:50:20', '2025-08-12 19:50:20'),
(70, 'Tiara septi anantia', 'septianantia@gmail.com', NULL, '$2y$12$qfqeah6vTScRPq3RsBGtR.VHcCQ9.hfhv9rsXA0X2NrDYITpKSGd2', 'user', NULL, '2025-08-12 19:50:30', '2025-08-12 19:50:30'),
(71, 'M ILMAN DANISH', 'milmandanish@gmail.com', NULL, '$2y$12$fLmmfGxL6VQ/vZwHs4GPqOD.ywygOEfE8CURTQcOf8MStETaiNBVC', 'user', NULL, '2025-08-12 19:50:33', '2025-08-12 19:50:33'),
(72, 'Angelia Shafira Harun', 'angeliaharun090607@gmail.com', NULL, '$2y$12$.DFa/4lndRSN5KKjBSP3TOQyrIGs7EA.of.3sElvKsC9IXlo6txkS', 'user', NULL, '2025-08-12 19:50:42', '2025-08-12 19:50:42'),
(73, 'Zalfa safira syalabiah', 'Safirasyalabiahzalfa@gmail.com', NULL, '$2y$12$nErbIBwrx3ewymzup8kdiuMeXSmlq5i5DtPiUCW1HXfk6j5nQmKN6', 'user', NULL, '2025-08-12 19:51:26', '2025-08-12 19:51:26'),
(74, 'FAIRUZ ZIKRI HABIBULLAH', 'ffaooobutterfly@gmail.com', NULL, '$2y$12$QhOTsR1uoiohn6.MzXI7huB7/pqjsSd93CM42.nehB.NaV1hQrHDq', 'user', NULL, '2025-08-12 19:51:27', '2025-08-12 19:51:27'),
(75, 'MUHAMAD RIPAL', 'kp.sekepondok@gmail.com', NULL, '$2y$12$Ud7K4JpA5AD2/FT9rIzRDue16F/HmbBf5Kf2EtZCkRUPV8k10xEUG', 'user', NULL, '2025-08-12 19:51:53', '2025-08-12 19:51:53'),
(76, 'santi riyanti rahayu', 'wartinititin75@gmail.com', NULL, '$2y$12$goyDDWs2Z7fFNqoxowlfreUQ994EMKZjwLkAy5kbh9tLwrz8qG2Aa', 'user', NULL, '2025-08-12 19:54:48', '2025-08-12 19:54:48'),
(77, 'Siska jesika', 'siskajesika61@gmail.com', NULL, '$2y$12$yrpQz635wzuamheQJ.ZnUupHLyQD0EVolyufBglaNSvIMjCgcU6wG', 'user', NULL, '2025-08-12 20:11:04', '2025-08-12 20:11:04'),
(78, 'Krisna Mulyadi', 'dedij6897@gmail.com', NULL, '$2y$12$qpAMclsoSrSd8nkKGoFbJ.W24.wrZ/byAQd9acBtuytAmXO2GfHNe', 'user', NULL, '2025-08-12 22:58:23', '2025-08-12 22:58:23'),
(81, 'MUHAMAD RIPAL', 'kentania24@gmail.com', NULL, '$2y$12$XhC52I0Emb2rZf7INDZfI.MRoAiL.RtmJsjxMZDv8t9IYPAKnNn4m', 'user', NULL, '2025-08-13 06:14:09', '2025-08-13 06:14:09'),
(82, 'admin', 'edukes.edukasikesehatan@gmail.com', NULL, '$2y$12$dMTNgXEhDL/BaNXIjyWTqecA/KcM0n4kwBngYvK2nO3ndGW6hde6C', 'user', NULL, '2025-08-16 02:24:54', '2025-08-16 02:24:54'),
(83, 'Deajeng Oktavia', 'deajengoktavia06@gmail.com', NULL, '$2y$12$xhLxkl2TPqVfP4tcBBXXA.YfYs31adYUwkLtnTq7AENzwnFAW.o32', 'user', NULL, '2025-08-16 06:06:12', '2025-08-16 06:06:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_progress`
--

CREATE TABLE `user_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `progress_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`progress_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_progress`
--

INSERT INTO `user_progress` (`id`, `user_id`, `content_type`, `content_id`, `is_completed`, `progress_data`, `created_at`, `updated_at`) VALUES
(20, 21, 'informasi_kesehatan', 4, 1, NULL, '2025-08-17 17:29:18', '2025-08-17 17:29:18'),
(21, 21, 'materi_pdf', 12, 1, NULL, '2025-08-17 17:29:43', '2025-08-17 17:29:43'),
(22, 21, 'materi_pdf', 10, 1, NULL, '2025-08-17 17:56:09', '2025-08-17 17:56:09'),
(23, 21, 'materi_pdf', 8, 1, NULL, '2025-08-17 17:56:34', '2025-08-17 17:56:34'),
(24, 21, 'materi_pdf', 5, 1, NULL, '2025-08-17 17:56:55', '2025-08-17 17:56:55'),
(25, 21, 'materi_video', 13, 1, NULL, '2025-08-17 17:57:23', '2025-08-17 17:57:23'),
(26, 21, 'materi_video', 11, 1, NULL, '2025-08-17 18:01:04', '2025-08-17 18:01:04'),
(27, 21, 'materi_video', 9, 1, NULL, '2025-08-17 18:02:21', '2025-08-17 18:02:21'),
(28, 21, 'materi_video', 7, 1, NULL, '2025-08-17 18:03:50', '2025-08-17 18:03:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `zoom_rooms`
--

CREATE TABLE `zoom_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `link_meeting` varchar(255) NOT NULL,
  `jadwal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meeting_id` varchar(255) DEFAULT NULL,
  `passcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultations_user_id_foreign` (`user_id`),
  ADD KEY `consultations_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultation_attachments_consultation_id_foreign` (`consultation_id`),
  ADD KEY `consultation_attachments_response_id_foreign` (`response_id`);

--
-- Indeks untuk tabel `consultation_categories`
--
ALTER TABLE `consultation_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `consultation_responses`
--
ALTER TABLE `consultation_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultation_responses_consultation_id_foreign` (`consultation_id`),
  ADD KEY `consultation_responses_admin_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `download_logs`
--
ALTER TABLE `download_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `download_logs_user_id_foreign` (`user_id`),
  ADD KEY `download_logs_materi_id_foreign` (`materi_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `informasi_kesehatan_created_by_foreign` (`created_by`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentars`
--
ALTER TABLE `komentars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentars_materi_id_foreign` (`materi_id`),
  ADD KEY `komentars_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_materi_id_foreign` (`materi_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `materis`
--
ALTER TABLE `materis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materis_slug_unique` (`slug`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_progress_user_id_content_type_content_id_unique` (`user_id`,`content_type`,`content_id`);

--
-- Indeks untuk tabel `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zoom_rooms_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `consultation_categories`
--
ALTER TABLE `consultation_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `consultation_responses`
--
ALTER TABLE `consultation_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `download_logs`
--
ALTER TABLE `download_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `komentars`
--
ALTER TABLE `komentars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `materis`
--
ALTER TABLE `materis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `consultation_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  ADD CONSTRAINT `consultation_attachments_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultation_attachments_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `consultation_responses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `consultation_responses`
--
ALTER TABLE `consultation_responses`
  ADD CONSTRAINT `consultation_responses_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultation_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `download_logs`
--
ALTER TABLE `download_logs`
  ADD CONSTRAINT `download_logs_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `download_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  ADD CONSTRAINT `informasi_kesehatan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentars`
--
ALTER TABLE `komentars`
  ADD CONSTRAINT `komentars_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `komentars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  ADD CONSTRAINT `zoom_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
