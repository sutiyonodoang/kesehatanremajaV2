-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2025 pada 11.58
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
-- Database: `kesehatan_platform1`
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
(1, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 00:30:19', '2025-08-18 00:30:19'),
(2, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 00:30:33', '2025-08-18 00:30:33'),
(3, 'default', 'created', 'App\\Models\\Like', 'created', 10, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":12,\"user_id\":21}}', NULL, '2025-08-18 01:11:58', '2025-08-18 01:11:58'),
(4, 'default', 'created', 'App\\Models\\Like', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":7,\"user_id\":21}}', NULL, '2025-08-18 01:12:08', '2025-08-18 01:12:08'),
(5, 'default', 'created', 'App\\Models\\Like', 'created', 12, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":5,\"user_id\":21}}', NULL, '2025-08-18 01:12:18', '2025-08-18 01:12:18'),
(6, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:13:18', '2025-08-18 01:13:18'),
(7, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:13:32', '2025-08-18 01:13:32'),
(8, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:13:32', '2025-08-18 01:13:32'),
(9, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:24:33', '2025-08-18 01:24:33'),
(10, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:24:48', '2025-08-18 01:24:48'),
(11, 'default', 'created', 'App\\Models\\Like', 'created', 13, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":11,\"user_id\":21}}', NULL, '2025-08-18 01:25:04', '2025-08-18 01:25:04'),
(12, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"materi_id\":10}}', NULL, '2025-08-18 01:25:31', '2025-08-18 01:25:31'),
(13, 'default', 'created', 'App\\Models\\Like', 'created', 14, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":10,\"user_id\":21}}', NULL, '2025-08-18 01:28:31', '2025-08-18 01:28:31'),
(14, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:28:49', '2025-08-18 01:28:49'),
(15, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:29:07', '2025-08-18 01:29:07'),
(16, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:29:07', '2025-08-18 01:29:07'),
(17, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:30:42', '2025-08-18 01:30:42'),
(18, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:30:55', '2025-08-18 01:30:55'),
(19, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:31:17', '2025-08-18 01:31:17'),
(20, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:31:31', '2025-08-18 01:31:31'),
(21, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:31:31', '2025-08-18 01:31:31'),
(22, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"consultation_id\":5,\"user_id\":20,\"is_responder\":true,\"response\":\"beberapa tips olahraga yang baik dan sehat agar kamu bisa mendapatkan manfaat maksimal dari aktivitas fisik tanpa cedera:\\r\\n\\r\\n1. Tentukan Tujuan dengan Jelas\\r\\nApakah ingin menurunkan berat badan, meningkatkan kekuatan, atau sekadar menjaga kesehatan?\\r\\nTujuan yang jelas membantumu memilih jenis olahraga yang tepat (misalnya: lari untuk kardio, angkat beban untuk kekuatan).\\r\\n2. Mulai Perlahan dan Konsisten\\r\\nJangan langsung memaksakan diri. Mulai dari intensitas ringan hingga sedang.\\r\\nKonsistensi lebih penting daripada durasi atau intensitas. Lebih baik olahraga\\r\\n30 menit setiap hari daripada 2 jam sekali seminggu.\\r\\n3. Pilih Jenis Olahraga yang Disukai\\r\\nPilih aktivitas yang menyenangkan seperti bersepeda, berenang, menari, atau jalan kaki santai.\\r\\nDengan menikmati olahraga, kamu lebih mudah bertahan dalam jangka panjang.\\r\\n4. Lakukan Pemanasan dan Pendinginan\\r\\nPemanasan (5\\u201310 menit): seperti jalan cepat atau gerakan ringan untuk mempersiapkan otot.\\r\\nPendinginan (5\\u201310 menit): seperti peregangan setelah olahraga untuk mencegah kram dan mempercepat pemulihan.\\r\\n5. Gabungkan Jenis Latihan\\r\\nKardio (jantung): lari, berenang, sepeda \\u2013 3\\u20135 kali seminggu.\\r\\nKekuatan otot: angkat beban, squat, push-up \\u2013 2\\u20133 kali seminggu.\\r\\nKelenturan & keseimbangan: yoga, pilates, peregangan \\u2013 bantu mencegah cedera.\\r\\n6. Dengarkan Tubuhmu\\r\\nJika merasa nyeri tajam, lelah berlebihan, atau pusing, hentikan dan istirahat.\\r\\nNyeri otot ringan (DOMS) setelah latihan normal, tapi nyeri sendi atau otot yang tajam tidak normal.\\r\\n7. Jaga Hidrasi dan Nutrisi\\r\\nMinum air sebelum, selama, dan setelah olahraga.\\r\\nKonsumsi makanan bergizi untuk mendukung energi dan pemulihan otot (protein, karbohidrat kompleks, vitamin).\\r\\n8. Istirahat yang Cukup\\r\\nTubuh perlu waktu untuk pulih. Beri jeda antar sesi latihan, terutama untuk otot yang sama.\\r\\nTidur 7\\u20139 jam per malam sangat penting untuk pemulihan.\\r\\n9. Gunakan Perlengkapan yang Tepat\\r\\nSepatu olahraga yang nyaman, pakaian menyerap keringat, dan alat bantu jika diperlukan.\\r\\nIni membantu mencegah cedera dan meningkatkan kenyamanan.\\r\\n10. Konsultasi dengan Ahli (jika perlu)\\r\\nJika punya kondisi kesehatan tertentu (diabetes, jantung, dll), konsultasikan dulu dengan dokter atau pelatih profesional.\\r\\nPelatih bisa membantu membuat program latihan yang aman dan efektif.\\r\\nBonus: Buat Jadwal dan Catat Kemajuan\\r\\nJadwalkan olahraga seperti janji penting.\\r\\nCatat aktivitas, durasi, dan perasaan setelah olahraga \\u2013 ini memotivasi dan membantumu melihat perkembangan.\\r\\nIngat, Olahraga bukan hanya soal bentuk tubuh, tapi juga kesehatan mental, energi, dan kualitas hidup secara keseluruhan.\",\"is_public\":true}}', NULL, '2025-08-18 01:34:44', '2025-08-18 01:34:44'),
(23, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-18 01:34:44', '2025-08-18 01:34:44'),
(24, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:40:36', '2025-08-18 01:40:36'),
(25, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:40:51', '2025-08-18 01:40:51'),
(26, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 6, 'App\\Models\\User', 21, '{\"attributes\":{\"consultation_id\":5,\"user_id\":21,\"is_responder\":false,\"response\":\"Baik, terima kasih atas respon dan sarannya, akan saya coba pak\\/bu.\\r\\n\\r\\nterima kasih\",\"is_public\":true}}', NULL, '2025-08-18 01:42:29', '2025-08-18 01:42:29'),
(27, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:42:39', '2025-08-18 01:42:39'),
(28, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:42:54', '2025-08-18 01:42:54'),
(29, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:42:54', '2025-08-18 01:42:54'),
(30, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-18 01:43:22', '2025-08-18 01:43:22'),
(31, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 01:49:05', '2025-08-18 01:49:05'),
(32, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 01:49:22', '2025-08-18 01:49:22'),
(33, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 02:04:08', '2025-08-18 02:04:08'),
(34, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:04:22', '2025-08-18 02:04:22'),
(35, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:04:22', '2025-08-18 02:04:22'),
(36, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:04:49', '2025-08-18 02:04:49'),
(37, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:05:06', '2025-08-18 02:05:06'),
(38, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:05:06', '2025-08-18 02:05:06'),
(39, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 02:26:57', '2025-08-18 02:26:57'),
(40, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 10:59:38', '2025-08-18 10:59:38'),
(41, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 10:59:38', '2025-08-18 10:59:38'),
(42, 'default', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 20, '{\"attributes\":{\"name\":\"Tiyo\"},\"old\":{\"name\":\"rio\"}}', NULL, '2025-08-18 11:00:18', '2025-08-18 11:00:18'),
(43, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 11:31:03', '2025-08-18 11:31:03'),
(44, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 11:31:03', '2025-08-18 11:31:03'),
(45, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 18:31:26', '2025-08-18 18:31:26'),
(46, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 18:31:26', '2025-08-18 18:31:26'),
(47, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 19:01:06', '2025-08-18 19:01:06'),
(48, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 19:01:06', '2025-08-18 19:01:06'),
(49, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 19:02:11', '2025-08-18 19:02:11'),
(50, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 19:02:31', '2025-08-18 19:02:31'),
(51, 'default', 'created', 'App\\Models\\UserProgress', 'created', 29, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-18 19:03:58', '2025-08-18 19:03:58'),
(52, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 19:08:48', '2025-08-18 19:08:48'),
(53, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 19:09:02', '2025-08-18 19:09:02'),
(54, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 19:09:02', '2025-08-18 19:09:02'),
(55, 'default', 'User logged in', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-18 20:13:07', '2025-08-18 20:13:07'),
(56, 'default', 'created', 'App\\Models\\UserProgress', 'created', 30, 'App\\Models\\User', 78, '{\"attributes\":{\"user_id\":78,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-18 20:14:14', '2025-08-18 20:14:14'),
(57, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:15:51', '2025-08-18 20:15:51'),
(58, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:15:51', '2025-08-18 20:15:51'),
(59, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:17:08', '2025-08-18 20:17:08'),
(60, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:17:34', '2025-08-18 20:17:34'),
(61, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:17:34', '2025-08-18 20:17:34'),
(62, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:28:02', '2025-08-18 20:28:02'),
(63, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:28:42', '2025-08-18 20:28:42'),
(64, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:28:42', '2025-08-18 20:28:42'),
(65, 'default', 'User logged out', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-18 20:31:10', '2025-08-18 20:31:10'),
(66, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:34:51', '2025-08-18 20:34:51'),
(67, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:34:51', '2025-08-18 20:34:51'),
(68, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:36:10', '2025-08-18 20:36:10'),
(69, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:36:10', '2025-08-18 20:36:10'),
(70, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:41:37', '2025-08-18 20:41:37'),
(71, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 20:41:47', '2025-08-18 20:41:47'),
(72, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 20:42:49', '2025-08-18 20:42:49'),
(73, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:45:12', '2025-08-18 20:45:12'),
(74, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 20:45:29', '2025-08-18 20:45:29'),
(75, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:45:39', '2025-08-18 20:45:39'),
(76, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:46:12', '2025-08-18 20:46:12'),
(77, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-18 20:46:12', '2025-08-18 20:46:12'),
(78, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:53:32', '2025-08-18 20:53:32'),
(79, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 20:53:32', '2025-08-18 20:53:32'),
(80, 'default', 'created', 'App\\Models\\User', 'created', 84, NULL, NULL, '{\"attributes\":{\"name\":\"Adam\",\"email\":\"adamsetiadijr07@gmail.com\",\"password\":\"$2y$12$a9j5r\\/BwFc5CFYHUJvCoAuMLtO0pXSDgUCneJjNccBx9qklvlQJO6\"}}', NULL, '2025-08-18 20:53:42', '2025-08-18 20:53:42'),
(81, 'default', 'created', 'App\\Models\\UserProgress', 'created', 31, 'App\\Models\\User', 84, '{\"attributes\":{\"user_id\":84,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-18 20:54:49', '2025-08-18 20:54:49'),
(82, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 21:11:19', '2025-08-18 21:11:19'),
(83, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 21:29:57', '2025-08-18 21:29:57'),
(84, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 21:30:10', '2025-08-18 21:30:10'),
(85, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-18 21:31:54', '2025-08-18 21:31:54'),
(86, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 21:32:07', '2025-08-18 21:32:07'),
(87, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-18 21:32:07', '2025-08-18 21:32:07'),
(88, 'default', 'User logged in', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-18 21:54:23', '2025-08-18 21:54:23'),
(89, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 01:59:28', '2025-08-19 01:59:28'),
(90, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 02:27:10', '2025-08-19 02:27:10'),
(91, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 02:30:15', '2025-08-19 02:30:15'),
(92, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 02:42:03', '2025-08-19 02:42:03'),
(93, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 02:42:20', '2025-08-19 02:42:20'),
(94, 'default', 'created', 'App\\Models\\Consultation', 'created', 6, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes konsul\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 02:51:04', '2025-08-19 02:51:04'),
(95, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 6, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes konsul\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 02:51:16', '2025-08-19 02:51:16'),
(96, 'default', 'created', 'App\\Models\\Consultation', 'created', 7, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":2,\"title\":\"testes\",\"description\":\"tes\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 02:53:20', '2025-08-19 02:53:20'),
(97, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 7, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":2,\"title\":\"testes\",\"description\":\"tes\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 02:53:24', '2025-08-19 02:53:24'),
(98, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 05:52:30', '2025-08-19 05:52:30'),
(99, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 05:52:30', '2025-08-19 05:52:30'),
(100, 'default', 'created', 'App\\Models\\Materi', 'created', 15, 'App\\Models\\User', 3, '{\"attributes\":{\"judul\":\"Perawatan Payudara\",\"slug\":\"perawatan-payudara\",\"kategori\":\"reproduksi\",\"deskripsi\":null,\"sumber\":null,\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/g36nD9ysTRxp95qwEhNfPwtpnlKpkwvgT58Mq8Vk.pdf\"}}', NULL, '2025-08-19 05:53:49', '2025-08-19 05:53:49'),
(101, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 05:54:48', '2025-08-19 05:54:48'),
(102, 'default', 'created', 'App\\Models\\Consultation', 'created', 8, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"category_id\":1,\"title\":\"menjaga daya tahan tubuh\",\"description\":\"bagaimana cara menjaga daya tahan tubuh supaya tidak mudah sakit?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 05:55:37', '2025-08-19 05:55:37'),
(103, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 7, 'App\\Models\\User', 3, '{\"attributes\":{\"consultation_id\":8,\"user_id\":3,\"is_responder\":true,\"response\":\"Untuk menjaga daya tahan tubuh, usahakan makan bergizi seimbang, cukup tidur, rutin olahraga, minum air putih yang cukup, dan kelola stres dengan baik. Hindari begadang serta kebiasaan tidak sehat agar tubuh tetap fit dan tidak mudah sakit.\",\"is_public\":true}}', NULL, '2025-08-19 05:56:26', '2025-08-19 05:56:26'),
(104, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-19 05:56:26', '2025-08-19 05:56:26'),
(105, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 8, 'App\\Models\\User', 5, '{\"attributes\":{\"consultation_id\":8,\"user_id\":5,\"is_responder\":false,\"response\":\"berapa lama waktu tidur yang ideal agar tubuh tetap sehat dan tidak mudah lelah?\",\"is_public\":true}}', NULL, '2025-08-19 05:57:44', '2025-08-19 05:57:44'),
(106, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 9, 'App\\Models\\User', 3, '{\"attributes\":{\"consultation_id\":8,\"user_id\":3,\"is_responder\":true,\"response\":\"Waktu tidur ideal untuk remaja dan dewasa adalah sekitar 7\\u20139 jam per malam. Tidur cukup membantu tubuh memulihkan energi, menjaga daya tahan tubuh, dan membuat konsentrasi lebih baik di siang hari.\",\"is_public\":true}}', NULL, '2025-08-19 05:58:07', '2025-08-19 05:58:07'),
(107, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-19 05:59:27', '2025-08-19 05:59:27'),
(108, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 12, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"materi_id\":15}}', NULL, '2025-08-19 06:04:54', '2025-08-19 06:04:54'),
(109, 'default', 'created', 'App\\Models\\UserProgress', 'created', 32, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 06:04:54', '2025-08-19 06:04:54'),
(110, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 06:05:06', '2025-08-19 06:05:06'),
(111, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 06:05:08', '2025-08-19 06:05:08'),
(112, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 13:10:33', '2025-08-19 13:10:33'),
(113, 'default', 'created', 'App\\Models\\Consultation', 'created', 9, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 13:11:47', '2025-08-19 13:11:47'),
(114, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 9, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 13:12:06', '2025-08-19 13:12:06'),
(115, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 14:00:16', '2025-08-19 14:00:16'),
(116, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 14:00:42', '2025-08-19 14:00:42'),
(117, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 14:00:42', '2025-08-19 14:00:42'),
(118, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 14:14:42', '2025-08-19 14:14:42'),
(119, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 14:15:01', '2025-08-19 14:15:01'),
(120, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 14:15:01', '2025-08-19 14:15:01'),
(121, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-19 16:45:18', '2025-08-19 16:45:18'),
(122, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 13, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":15}}', NULL, '2025-08-19 16:46:06', '2025-08-19 16:46:06'),
(123, 'default', 'created', 'App\\Models\\UserProgress', 'created', 33, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 16:46:06', '2025-08-19 16:46:06'),
(124, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 14, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":15}}', NULL, '2025-08-19 16:46:12', '2025-08-19 16:46:12'),
(125, 'default', 'created', 'App\\Models\\Like', 'created', 15, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":15,\"user_id\":43}}', NULL, '2025-08-19 16:50:00', '2025-08-19 16:50:00'),
(126, 'default', 'created', 'App\\Models\\Like', 'created', 16, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 16:50:14', '2025-08-19 16:50:14'),
(127, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 16, 'App\\Models\\User', 43, '{\"old\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 16:50:53', '2025-08-19 16:50:53'),
(128, 'default', 'created', 'App\\Models\\Like', 'created', 17, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 16:50:55', '2025-08-19 16:50:55'),
(129, 'default', 'created', 'App\\Models\\UserProgress', 'created', 34, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 16:51:00', '2025-08-19 16:51:00'),
(130, 'default', 'created', 'App\\Models\\Like', 'created', 18, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":5,\"user_id\":43}}', NULL, '2025-08-19 16:57:52', '2025-08-19 16:57:52'),
(131, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 15, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":5}}', NULL, '2025-08-19 17:01:56', '2025-08-19 17:01:56'),
(132, 'default', 'created', 'App\\Models\\UserProgress', 'created', 35, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 17:01:56', '2025-08-19 17:01:56'),
(133, 'default', 'User logged in', 'App\\Models\\User', NULL, 57, 'App\\Models\\User', 57, '[]', NULL, '2025-08-19 23:48:09', '2025-08-19 23:48:09'),
(134, 'default', 'created', 'App\\Models\\UserProgress', 'created', 36, 'App\\Models\\User', 57, '{\"attributes\":{\"user_id\":57,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 23:49:34', '2025-08-19 23:49:34'),
(135, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-20 00:14:37', '2025-08-20 00:14:37'),
(136, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-20 03:12:27', '2025-08-20 03:12:27'),
(137, 'default', 'created', 'App\\Models\\UserProgress', 'created', 37, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:13:39', '2025-08-20 03:13:39'),
(138, 'default', 'created', 'App\\Models\\Komentar', 'created', 33, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":13,\"user_id\":24,\"isi_komentar\":\"video ini sangat mudah dipahami, saya jadi tahu apa yang dimaksud sehat jiwa!\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:14:42', '2025-08-20 03:14:42'),
(139, 'default', 'created', 'App\\Models\\Like', 'created', 19, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":13,\"user_id\":24}}', NULL, '2025-08-20 03:14:44', '2025-08-20 03:14:44'),
(140, 'default', 'created', 'App\\Models\\Like', 'created', 20, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 03:15:14', '2025-08-20 03:15:14'),
(141, 'default', 'created', 'App\\Models\\Komentar', 'created', 34, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24,\"isi_komentar\":\"Materi di PDF ini jauh lebih detail dari yang di video, ini sangat bagus untuk yang ingin mempelajari lebih dalam tentang Kesehatan mental ini \\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:17:41', '2025-08-20 03:17:41'),
(142, 'default', 'created', 'App\\Models\\Like', 'created', 21, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 03:17:43', '2025-08-20 03:17:43'),
(143, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 21, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 03:17:45', '2025-08-20 03:17:45'),
(144, 'default', 'created', 'App\\Models\\Like', 'created', 22, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 03:17:47', '2025-08-20 03:17:47'),
(145, 'default', 'created', 'App\\Models\\UserProgress', 'created', 38, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:18:13', '2025-08-20 03:18:13'),
(146, 'default', 'created', 'App\\Models\\Like', 'created', 23, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":11,\"user_id\":24}}', NULL, '2025-08-20 03:25:10', '2025-08-20 03:25:10'),
(147, 'default', 'created', 'App\\Models\\Komentar', 'created', 35, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":11,\"user_id\":24,\"isi_komentar\":\"Penjelasannya sangat jelas!, terutama materi tentang Menjaga kebersihan alat reproduksi, Ciri ciri, dan Tips and tricknya. Karena semua itu sangat penting bagi Remaja \\ud83d\\ude4c\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:26:38', '2025-08-20 03:26:38'),
(148, 'default', 'created', 'App\\Models\\Like', 'created', 24, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":10,\"user_id\":24}}', NULL, '2025-08-20 03:27:02', '2025-08-20 03:27:02'),
(149, 'default', 'created', 'App\\Models\\Komentar', 'created', 36, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":10,\"user_id\":24,\"isi_komentar\":\"Ternyata Perubahan pada remaja itu bukan hanya pada perubahan fisik, perubahan pada remaja itu ada banyak,Salah satunya Perubahan Psikologis seperti Perubahan Emosi, jasmani, cara berinteraksi kepada teman atau orang tua hingga perubahan cara otak berkerja! \\u2764\\ufe0f\\u200d\\ud83d\\udd25\\ud83d\\udc4f\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:34:51', '2025-08-20 03:34:51'),
(150, 'default', 'created', 'App\\Models\\UserProgress', 'created', 39, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:35:32', '2025-08-20 03:35:32'),
(151, 'default', 'created', 'App\\Models\\Komentar', 'created', 37, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":9,\"user_id\":24,\"isi_komentar\":\"Seruu banget vidoenya!!, aku baru tahu ternyata dampak  NAPZA sangat berbahaya bagi manusia\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:39:05', '2025-08-20 03:39:05'),
(152, 'default', 'created', 'App\\Models\\Like', 'created', 25, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":9,\"user_id\":24}}', NULL, '2025-08-20 03:39:09', '2025-08-20 03:39:09'),
(153, 'default', 'created', 'App\\Models\\Like', 'created', 26, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":8,\"user_id\":24}}', NULL, '2025-08-20 03:39:21', '2025-08-20 03:39:21'),
(154, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 26, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":8,\"user_id\":24}}', NULL, '2025-08-20 03:39:26', '2025-08-20 03:39:26'),
(155, 'default', 'created', 'App\\Models\\Like', 'created', 27, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 03:39:52', '2025-08-20 03:39:52'),
(156, 'default', 'created', 'App\\Models\\UserProgress', 'created', 40, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:40:04', '2025-08-20 03:40:04'),
(157, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 27, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 03:40:20', '2025-08-20 03:40:20'),
(158, 'default', 'created', 'App\\Models\\Like', 'created', 28, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 03:40:23', '2025-08-20 03:40:23'),
(159, 'default', 'created', 'App\\Models\\Komentar', 'created', 38, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24,\"isi_komentar\":\"Penjelasan tentang Edukasi gizi nya sangat jelas dan mudah dimengertii \\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-20 03:42:40', '2025-08-20 03:42:40'),
(160, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 16, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":15}}', NULL, '2025-08-20 03:43:08', '2025-08-20 03:43:08'),
(161, 'default', 'created', 'App\\Models\\UserProgress', 'created', 41, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:43:08', '2025-08-20 03:43:08'),
(162, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 20, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 03:43:10', '2025-08-20 03:43:10'),
(163, 'default', 'created', 'App\\Models\\Like', 'created', 29, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 03:43:12', '2025-08-20 03:43:12'),
(164, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 17, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 03:43:18', '2025-08-20 03:43:18'),
(165, 'default', 'created', 'App\\Models\\UserProgress', 'created', 42, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:43:18', '2025-08-20 03:43:18'),
(166, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 18, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 03:43:22', '2025-08-20 03:43:22'),
(167, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 22, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 03:43:26', '2025-08-20 03:43:26'),
(168, 'default', 'created', 'App\\Models\\Like', 'created', 30, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 03:43:28', '2025-08-20 03:43:28'),
(169, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 19, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 03:43:29', '2025-08-20 03:43:29'),
(170, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 20, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:40', '2025-08-20 03:43:40'),
(171, 'default', 'created', 'App\\Models\\UserProgress', 'created', 43, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:43:40', '2025-08-20 03:43:40'),
(172, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 21, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:45', '2025-08-20 03:43:45'),
(173, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 22, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:46', '2025-08-20 03:43:46'),
(174, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 23, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:48', '2025-08-20 03:43:48'),
(175, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 24, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:52', '2025-08-20 03:43:52'),
(176, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 25, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:52', '2025-08-20 03:43:52'),
(177, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 26, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:56', '2025-08-20 03:43:56'),
(178, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 27, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 03:43:58', '2025-08-20 03:43:58'),
(179, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 28, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":8}}', NULL, '2025-08-20 03:44:10', '2025-08-20 03:44:10'),
(180, 'default', 'created', 'App\\Models\\UserProgress', 'created', 44, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:44:10', '2025-08-20 03:44:10'),
(181, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 29, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":5}}', NULL, '2025-08-20 03:44:20', '2025-08-20 03:44:20'),
(182, 'default', 'created', 'App\\Models\\UserProgress', 'created', 45, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:44:20', '2025-08-20 03:44:20'),
(183, 'default', 'created', 'App\\Models\\UserProgress', 'created', 46, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 03:44:37', '2025-08-20 03:44:37'),
(184, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-20 17:04:10', '2025-08-20 17:04:10'),
(185, 'default', 'created', 'App\\Models\\UserProgress', 'created', 47, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 17:05:31', '2025-08-20 17:05:31'),
(186, 'default', 'created', 'App\\Models\\Like', 'created', 31, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":7,\"user_id\":43}}', NULL, '2025-08-20 17:05:40', '2025-08-20 17:05:40'),
(187, 'default', 'created', 'App\\Models\\Like', 'created', 32, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":8,\"user_id\":43}}', NULL, '2025-08-20 17:06:14', '2025-08-20 17:06:14'),
(188, 'default', 'created', 'App\\Models\\Komentar', 'created', 39, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":8,\"user_id\":43,\"isi_komentar\":\"baguss bangett, dapatt di mengerti tentang narkoba karena penjelasannya terdapat gambar juga\",\"balasan_admin\":null}}', NULL, '2025-08-20 17:12:32', '2025-08-20 17:12:32'),
(189, 'default', 'created', 'App\\Models\\Like', 'created', 33, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":11,\"user_id\":43}}', NULL, '2025-08-20 17:16:20', '2025-08-20 17:16:20'),
(190, 'default', 'created', 'App\\Models\\UserProgress', 'created', 48, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 17:16:30', '2025-08-20 17:16:30'),
(191, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-21 20:34:59', '2025-08-21 20:34:59'),
(192, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-21 20:34:59', '2025-08-21 20:34:59'),
(193, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-21 20:35:38', '2025-08-21 20:35:38'),
(194, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-21 20:36:04', '2025-08-21 20:36:04'),
(195, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-21 21:50:09', '2025-08-21 21:50:09'),
(196, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-21 22:30:24', '2025-08-21 22:30:24'),
(197, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-21 22:44:47', '2025-08-21 22:44:47'),
(198, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-21 23:00:44', '2025-08-21 23:00:44'),
(199, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-21 23:00:44', '2025-08-21 23:00:44'),
(200, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-21 23:05:58', '2025-08-21 23:05:58'),
(201, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-21 23:05:58', '2025-08-21 23:05:58'),
(202, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-21 23:07:22', '2025-08-21 23:07:22'),
(203, 'default', 'created', 'App\\Models\\Like', 'created', 34, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":15,\"user_id\":46}}', NULL, '2025-08-21 23:07:37', '2025-08-21 23:07:37'),
(204, 'default', 'created', 'App\\Models\\Like', 'created', 35, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-21 23:07:47', '2025-08-21 23:07:47'),
(205, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 35, 'App\\Models\\User', 46, '{\"old\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-21 23:07:51', '2025-08-21 23:07:51'),
(206, 'default', 'created', 'App\\Models\\Like', 'created', 36, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-21 23:07:54', '2025-08-21 23:07:54'),
(207, 'default', 'created', 'App\\Models\\UserProgress', 'created', 49, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-21 23:09:32', '2025-08-21 23:09:32'),
(208, 'default', 'created', 'App\\Models\\Like', 'created', 37, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-21 23:10:49', '2025-08-21 23:10:49'),
(209, 'default', 'User logged in', 'App\\Models\\User', NULL, 75, 'App\\Models\\User', 75, '[]', NULL, '2025-08-21 23:20:42', '2025-08-21 23:20:42'),
(210, 'default', 'created', 'App\\Models\\UserProgress', 'created', 50, 'App\\Models\\User', 75, '{\"attributes\":{\"user_id\":75,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-21 23:20:51', '2025-08-21 23:20:51'),
(211, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-21 23:40:30', '2025-08-21 23:40:30'),
(212, 'default', 'User logged in', 'App\\Models\\User', NULL, 33, 'App\\Models\\User', 33, '[]', NULL, '2025-08-22 00:08:47', '2025-08-22 00:08:47'),
(213, 'default', 'created', 'App\\Models\\Like', 'created', 38, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":13,\"user_id\":33}}', NULL, '2025-08-22 00:09:04', '2025-08-22 00:09:04'),
(214, 'default', 'created', 'App\\Models\\Like', 'created', 39, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":11,\"user_id\":33}}', NULL, '2025-08-22 00:09:12', '2025-08-22 00:09:12'),
(215, 'default', 'created', 'App\\Models\\Like', 'created', 40, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":9,\"user_id\":33}}', NULL, '2025-08-22 00:09:20', '2025-08-22 00:09:20'),
(216, 'default', 'created', 'App\\Models\\UserProgress', 'created', 51, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 00:09:47', '2025-08-22 00:09:47'),
(217, 'default', 'created', 'App\\Models\\Komentar', 'created', 40, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":13,\"user_id\":33,\"isi_komentar\":\"lebih suka nonton video animasi edukatif kaya gini, bikin enggak bosen alias SERUUUU\\u203c\\ufe0f\\u203c\\ufe0f cocok nih untuk tontonan remaja\\/gen z ahaaay, karena bener-bener nambah ilmu pengetahuan, + ada solusinya juga, SEMANGAT YAA KAKAK-KAKAK BUAT VIDEO ANIMASI NYA\\ud83d\\udc9e\\ud83d\\udc9e\",\"balasan_admin\":null}}', NULL, '2025-08-22 00:14:10', '2025-08-22 00:14:10'),
(218, 'default', 'created', 'App\\Models\\Like', 'created', 41, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 00:14:55', '2025-08-22 00:14:55'),
(219, 'default', 'created', 'App\\Models\\UserProgress', 'created', 52, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 00:15:03', '2025-08-22 00:15:03'),
(220, 'default', 'created', 'App\\Models\\Komentar', 'created', 41, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33,\"isi_komentar\":\"ternyata... Aku kurang berfokus sama makanan bergizi, jarang olahraga, pantes skincare, bodycare ak gak ngaruh :(( makasih yaa kak, next aku fokusin buat makanan bergizi dan pola hidup sehat!\",\"balasan_admin\":null}}', NULL, '2025-08-22 00:17:59', '2025-08-22 00:17:59'),
(221, 'default', 'created', 'App\\Models\\Like', 'created', 42, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":5,\"user_id\":33}}', NULL, '2025-08-22 00:18:20', '2025-08-22 00:18:20'),
(222, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 41, 'App\\Models\\User', 33, '{\"old\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 00:18:26', '2025-08-22 00:18:26'),
(223, 'default', 'created', 'App\\Models\\Like', 'created', 43, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 00:18:33', '2025-08-22 00:18:33'),
(224, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-22 00:52:22', '2025-08-22 00:52:22'),
(225, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-22 00:52:22', '2025-08-22 00:52:22'),
(226, 'default', 'User logged in', 'App\\Models\\User', NULL, 62, 'App\\Models\\User', 62, '[]', NULL, '2025-08-22 01:14:52', '2025-08-22 01:14:52'),
(227, 'default', 'User logged in', 'App\\Models\\User', NULL, 22, 'App\\Models\\User', 22, '[]', NULL, '2025-08-22 02:44:06', '2025-08-22 02:44:06'),
(228, 'default', 'created', 'App\\Models\\UserProgress', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:44:24', '2025-08-22 02:44:24'),
(229, 'default', 'created', 'App\\Models\\Like', 'created', 44, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":15,\"user_id\":22}}', NULL, '2025-08-22 02:45:23', '2025-08-22 02:45:23'),
(230, 'default', 'created', 'App\\Models\\Komentar', 'created', 42, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":15,\"user_id\":22,\"isi_komentar\":\"Menurut aku tulisannya udah jelas banget, runtut, dan enak dibaca. Bahasannya lengkap dari pengertian sampai faktor yang memengaruhi, jadi gampang dipahami. ada juga komponen pencegahannya, jadi kita setelah baca juga tau apa aja sih yg harus kita lakuin supaya terhindar dari hal hal yg tdk kita inginkan\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:49:22', '2025-08-22 02:49:22'),
(231, 'default', 'created', 'App\\Models\\UserProgress', 'created', 54, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:49:53', '2025-08-22 02:49:53'),
(232, 'default', 'created', 'App\\Models\\Like', 'created', 45, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 02:49:56', '2025-08-22 02:49:56'),
(233, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-22 02:50:45', '2025-08-22 02:50:45');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(234, 'default', 'created', 'App\\Models\\Komentar', 'created', 43, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22,\"isi_komentar\":\"videonya bagus, gampang di pahamii, dan penjelasan dari video ini tersampaikan dengan cepat, isi dari materinya pun tergambarkan dengan animasi animasi yg ada di dalam video\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:51:45', '2025-08-22 02:51:45'),
(235, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-22 02:52:03', '2025-08-22 02:52:03'),
(236, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 30, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"materi_id\":12}}', NULL, '2025-08-22 02:52:18', '2025-08-22 02:52:18'),
(237, 'default', 'created', 'App\\Models\\UserProgress', 'created', 55, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:52:18', '2025-08-22 02:52:18'),
(238, 'default', 'created', 'App\\Models\\UserProgress', 'created', 56, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:52:21', '2025-08-22 02:52:21'),
(239, 'default', 'created', 'App\\Models\\Like', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 02:53:10', '2025-08-22 02:53:10'),
(240, 'default', 'created', 'App\\Models\\Like', 'created', 47, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 02:54:03', '2025-08-22 02:54:03'),
(241, 'default', 'created', 'App\\Models\\Komentar', 'created', 44, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":12,\"user_id\":22,\"isi_komentar\":\"Menurut aku, dokumen ini udah keren banget. Isinya jelas, runtut, dan gampang dipahami. Penjelasan soal kesehatan mental remaja, tanda-tanda stres, sampai cara ngatasinnya tuh lengkap banget. Aku juga suka karena nggak cuma teori, tapi ada contoh yang relate sama kehidupan sehari-hari remaja. Bagian akhirnya juga asik, ada afirmasi positif sama contoh terapi yang bisa langsung dipraktekin.\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:54:04', '2025-08-22 02:54:04'),
(242, 'default', 'created', 'App\\Models\\Like', 'created', 48, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":5,\"user_id\":22}}', NULL, '2025-08-22 02:54:17', '2025-08-22 02:54:17'),
(243, 'default', 'created', 'App\\Models\\Like', 'created', 49, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":7,\"user_id\":22}}', NULL, '2025-08-22 02:54:21', '2025-08-22 02:54:21'),
(244, 'default', 'created', 'App\\Models\\Like', 'created', 50, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":8,\"user_id\":22}}', NULL, '2025-08-22 02:54:23', '2025-08-22 02:54:23'),
(245, 'default', 'created', 'App\\Models\\Like', 'created', 51, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":9,\"user_id\":22}}', NULL, '2025-08-22 02:54:26', '2025-08-22 02:54:26'),
(246, 'default', 'created', 'App\\Models\\Like', 'created', 52, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":10,\"user_id\":22}}', NULL, '2025-08-22 02:54:30', '2025-08-22 02:54:30'),
(247, 'default', 'created', 'App\\Models\\Like', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":11,\"user_id\":22}}', NULL, '2025-08-22 02:54:33', '2025-08-22 02:54:33'),
(248, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 31, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":12}}', NULL, '2025-08-22 02:54:35', '2025-08-22 02:54:35'),
(249, 'default', 'created', 'App\\Models\\UserProgress', 'created', 57, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:54:35', '2025-08-22 02:54:35'),
(250, 'default', 'created', 'App\\Models\\Like', 'created', 54, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":12,\"user_id\":22}}', NULL, '2025-08-22 02:54:36', '2025-08-22 02:54:36'),
(251, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 45, 'App\\Models\\User', 22, '{\"old\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 02:54:41', '2025-08-22 02:54:41'),
(252, 'default', 'created', 'App\\Models\\Like', 'created', 55, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 02:54:44', '2025-08-22 02:54:44'),
(253, 'default', 'created', 'App\\Models\\UserProgress', 'created', 58, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:55:02', '2025-08-22 02:55:02'),
(254, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 32, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":12}}', NULL, '2025-08-22 02:55:02', '2025-08-22 02:55:02'),
(255, 'default', 'created', 'App\\Models\\Komentar', 'created', 45, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":11,\"user_id\":22,\"isi_komentar\":\"Videonya sangat jelas, saya dapat mengerti penjelasan yang ada di dalam video, menambah ilmu , dan dengan adanya video ini saya jadi tauu tentang menjaga kebersihan alat reproduksi\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:56:06', '2025-08-22 02:56:06'),
(256, 'default', 'created', 'App\\Models\\Komentar', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":12,\"user_id\":48,\"isi_komentar\":\"Secara keseluruhan, materi ini sudah sangat baik\\u2014lengkap secara teori, praktis untuk diterapkan, dan relevan dengan kondisi remaja saat ini\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:56:53', '2025-08-22 02:56:53'),
(257, 'default', 'created', 'App\\Models\\Like', 'created', 56, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":12,\"user_id\":48}}', NULL, '2025-08-22 02:56:56', '2025-08-22 02:56:56'),
(258, 'default', 'created', 'App\\Models\\Like', 'created', 57, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 02:57:23', '2025-08-22 02:57:23'),
(259, 'default', 'created', 'App\\Models\\Komentar', 'created', 47, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":10,\"user_id\":22,\"isi_komentar\":\"Menurut aku setelah baca keseluruhan teks ini, isinya udah sangat lengkap dan runtut banget. Dari mulai pengenalan organ reproduksi pria dan wanita, proses fisiologis kayak ovulasi, menstruasi, sampai ke perubahan fisik, psikologis, dan kognitif di masa remaja tuh dibahas jelas banget. Bagian masalah reproduksi remaja juga terasa relevan sama kondisi nyata yang sering terjadi, apalagi disertai pencegahan dan deteksi dini. Aku suka karena teksnya nggak cuma teoritis, tapi juga ada langkah praktis kayak SADARI. Jadi bener-bener terasa menyeluruh dan gampang dipahami buat pembaca, khususnya remaja yang lagi butuh pengetahuan soal ini.\",\"balasan_admin\":null}}', NULL, '2025-08-22 02:57:37', '2025-08-22 02:57:37'),
(260, 'default', 'created', 'App\\Models\\UserProgress', 'created', 59, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 02:59:44', '2025-08-22 02:59:44'),
(261, 'default', 'User logged in', 'App\\Models\\User', NULL, 65, 'App\\Models\\User', 65, '[]', NULL, '2025-08-22 03:00:06', '2025-08-22 03:00:06'),
(262, 'default', 'created', 'App\\Models\\UserProgress', 'created', 60, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:00:18', '2025-08-22 03:00:18'),
(263, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 57, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 03:00:25', '2025-08-22 03:00:25'),
(264, 'default', 'created', 'App\\Models\\Like', 'created', 58, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 03:00:27', '2025-08-22 03:00:27'),
(265, 'default', 'created', 'App\\Models\\Komentar', 'created', 48, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48,\"isi_komentar\":\"Video ini merupakan media yang baik untuk menyampaikan pesan tentang kesehatan mental remaja. Namun, agar lebih efektif, penting memastikan isi disampaikan dengan bahasa sederhana, visual menarik, durasi tidak terlalu panjang, dan ada contoh konkret yang dekat dengan kehidupan remaja.\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:00:33', '2025-08-22 03:00:33'),
(266, 'default', 'created', 'App\\Models\\Like', 'created', 59, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 03:00:59', '2025-08-22 03:00:59'),
(267, 'default', 'created', 'App\\Models\\Like', 'created', 60, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":15,\"user_id\":65}}', NULL, '2025-08-22 03:01:01', '2025-08-22 03:01:01'),
(268, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 33, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":5}}', NULL, '2025-08-22 03:01:04', '2025-08-22 03:01:04'),
(269, 'default', 'created', 'App\\Models\\UserProgress', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:01:04', '2025-08-22 03:01:04'),
(270, 'default', 'created', 'App\\Models\\Komentar', 'created', 49, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":9,\"user_id\":22,\"isi_komentar\":\"SERUU BGT, dari video ini, kita dapat menyimpulkan untuk menjauhi narkoba, karena dapat merusak tubuh kita, dan juga tidak sehat, dapat membuat candu, selain itu, animasinya bagus sekali, dan seluruh penjelasan dapat di pahami dengan cepat\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:01:19', '2025-08-22 03:01:19'),
(271, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 59, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 03:01:23', '2025-08-22 03:01:23'),
(272, 'default', 'created', 'App\\Models\\Like', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 03:01:26', '2025-08-22 03:01:26'),
(273, 'default', 'created', 'App\\Models\\User', 'created', 85, NULL, NULL, '{\"attributes\":{\"name\":\"Siska jesika\",\"email\":\"tatisukmawati457@gmail.com\",\"password\":\"$2y$12$IB4e6uE9U4uamto6C4NzKu4kCkF7w\\/lzqoUkmD.Qry6dfkHkJr0pq\"}}', NULL, '2025-08-22 03:01:47', '2025-08-22 03:01:47'),
(274, 'default', 'created', 'App\\Models\\UserProgress', 'created', 62, 'App\\Models\\User', 85, '{\"attributes\":{\"user_id\":85,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:01:58', '2025-08-22 03:01:58'),
(275, 'default', 'created', 'App\\Models\\Komentar', 'created', 50, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":8,\"user_id\":22,\"isi_komentar\":\"Menurut saya setelah membaca teks ini, isi tulisannya sangat lengkap dan bermanfaat. Pembahasannya runtut, mulai dari pengertian narkoba, jenis-jenisnya, dampak fisik, psikologis, maupun sosial, sampai langkah pencegahan dan rehabilitasi. Bagian tentang peran siswa juga menarik, karena mengajak langsung generasi muda untuk ikut andil dalam mencegah penyalahgunaan narkoba. Secara keseluruhan, teks ini membuka wawasan saya bahwa bahaya narkoba tidak hanya soal kesehatan, tapi juga merusak masa depan dan lingkungan sosial.\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:02:28', '2025-08-22 03:02:28'),
(276, 'default', 'created', 'App\\Models\\Komentar', 'created', 51, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48,\"isi_komentar\":\"Materi ini sudah sangat kuat secara teori dan praktis, namun agar lebih efektif bagi remaja, perlu dibuat lebih sederhana, interaktif, dan dekat dengan keseharian mereka. Dengan tambahan ilustrasi dan contoh nyata, materi ini bisa menjadi panduan yang menarik sekaligus bermanfaat.\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:02:38', '2025-08-22 03:02:38'),
(277, 'default', 'created', 'App\\Models\\UserProgress', 'created', 63, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:02:50', '2025-08-22 03:02:50'),
(278, 'default', 'created', 'App\\Models\\Like', 'created', 62, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":15,\"user_id\":85}}', NULL, '2025-08-22 03:02:54', '2025-08-22 03:02:54'),
(279, 'default', 'created', 'App\\Models\\UserProgress', 'created', 64, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:03:01', '2025-08-22 03:03:01'),
(280, 'default', 'created', 'App\\Models\\Like', 'created', 63, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":7,\"user_id\":48}}', NULL, '2025-08-22 03:03:06', '2025-08-22 03:03:06'),
(281, 'default', 'User logged in', 'App\\Models\\User', NULL, 47, 'App\\Models\\User', 47, '[]', NULL, '2025-08-22 03:03:08', '2025-08-22 03:03:08'),
(282, 'default', 'created', 'App\\Models\\UserProgress', 'created', 65, 'App\\Models\\User', 85, '{\"attributes\":{\"user_id\":85,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:03:20', '2025-08-22 03:03:20'),
(283, 'default', 'created', 'App\\Models\\Like', 'created', 64, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":13,\"user_id\":85}}', NULL, '2025-08-22 03:03:31', '2025-08-22 03:03:31'),
(284, 'default', 'created', 'App\\Models\\Like', 'created', 65, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":12,\"user_id\":85}}', NULL, '2025-08-22 03:03:50', '2025-08-22 03:03:50'),
(285, 'default', 'created', 'App\\Models\\Komentar', 'created', 52, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":7,\"user_id\":22,\"isi_komentar\":\"wih, videonya bener benerr bikin akuu sadar kalau kita harus selalu menjaga kesehatan, dan pola hidup sehat, misalnya makan makanan yg bergizi dan seimbang, selain itu videonya mudah di pahami, terimakasi kak\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:03:51', '2025-08-22 03:03:51'),
(286, 'default', 'created', 'App\\Models\\Komentar', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":5,\"user_id\":22,\"isi_komentar\":\"Menurut saya setelah membaca keseluruhan teks ini, isinya sangat lengkap dan jelas menjelaskan tentang gizi remaja. Dari mulai konsep gizi seimbang, isi piringku, kebutuhan gizi makro dan mikro, hingga bahaya konsumsi gula, garam, dan lemak berlebih semuanya dibahas runtut dan mudah dipahami. Penjelasan yang disertai dengan contoh sumber makanan juga membantu banget untuk membayangkan praktiknya dalam kehidupan sehari-hari. Intinya teks ini bikin saya lebih sadar betapa pentingnya menjaga pola makan dan gaya hidup sehat sejak remaja.\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:04:45', '2025-08-22 03:04:45'),
(287, 'default', 'created', 'App\\Models\\Consultation', 'created', 10, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"category_id\":1,\"title\":\"CARA BIAR BISA MENJAGA POLA HIDUP SEHAT\",\"description\":\"pengen bisa jaga pola hidup sehat, pengen juga makan makanan yg seimbang, tapi kadang susah bgt nahan kalau pengen jajan seblak, gorengan, makanan pedas dan berminyak, sama makanan manis gtu. gimana ya caranya biar bisaa konsistennn ngejaga pola hidup yg sehat, karena olahraga juga kadang kadang aja\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 03:08:20', '2025-08-22 03:08:20'),
(288, 'default', 'created', 'App\\Models\\Consultation', 'created', 11, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"category_id\":1,\"title\":\"Sehat bersama:pentingnya konsultasi rutin\",\"description\":\"Banyak orang sering mengabaikan pemeriksaan kesehatan secara berkala karena merasa masih sehat atau tidak merasakan gejala tertentu. Padahal, penyakit sering muncul tanpa tanda awal yang jelas, sehingga baru diketahui saat sudah parah. Dengan melakukan konsultasi rutin, kita bisa mendeteksi masalah kesehatan lebih dini, mencegah penyakit kronis, serta menjaga pola hidup yang lebih seimbang. Konsultasi rutin juga membantu mengatasi kebingungan masyarakat terkait pola makan, aktivitas fisik, manajemen stres, hingga cara menjaga imun tubuh.\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 03:22:35', '2025-08-22 03:22:35'),
(289, 'default', 'created', 'App\\Models\\ConsultationAttachment', 'created', 2, 'App\\Models\\User', 65, '{\"attributes\":{\"consultation_id\":11,\"response_id\":null,\"file_name\":\"tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png\",\"file_path\":\"consultations\\/tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png\",\"file_type\":\"image\\/png\",\"file_size\":316777,\"original_name\":\"IMG_20250822_172115.png\"}}', NULL, '2025-08-22 03:22:35', '2025-08-22 03:22:35'),
(290, 'default', 'created', 'App\\Models\\UserProgress', 'created', 66, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:23:36', '2025-08-22 03:23:36'),
(291, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 34, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":15}}', NULL, '2025-08-22 03:24:13', '2025-08-22 03:24:13'),
(292, 'default', 'created', 'App\\Models\\UserProgress', 'created', 67, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:24:13', '2025-08-22 03:24:13'),
(293, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 35, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":15}}', NULL, '2025-08-22 03:24:21', '2025-08-22 03:24:21'),
(294, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 36, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":12}}', NULL, '2025-08-22 03:25:31', '2025-08-22 03:25:31'),
(295, 'default', 'created', 'App\\Models\\UserProgress', 'created', 68, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:25:31', '2025-08-22 03:25:31'),
(296, 'default', 'created', 'App\\Models\\Like', 'created', 66, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":11,\"user_id\":65}}', NULL, '2025-08-22 03:25:44', '2025-08-22 03:25:44'),
(297, 'default', 'created', 'App\\Models\\UserProgress', 'created', 69, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:25:55', '2025-08-22 03:25:55'),
(298, 'default', 'created', 'App\\Models\\Komentar', 'created', 54, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":11,\"user_id\":65,\"isi_komentar\":\"Video ini sangat jelas dan mudah untuk dipahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 03:29:23', '2025-08-22 03:29:23'),
(299, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 37, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":10}}', NULL, '2025-08-22 03:30:05', '2025-08-22 03:30:05'),
(300, 'default', 'created', 'App\\Models\\UserProgress', 'created', 70, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:30:05', '2025-08-22 03:30:05'),
(301, 'default', 'created', 'App\\Models\\UserProgress', 'created', 71, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:31:01', '2025-08-22 03:31:01'),
(302, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 66, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":11,\"user_id\":65}}', NULL, '2025-08-22 03:38:15', '2025-08-22 03:38:15'),
(303, 'default', 'created', 'App\\Models\\Like', 'created', 67, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 03:38:18', '2025-08-22 03:38:18'),
(304, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 67, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 03:38:21', '2025-08-22 03:38:21'),
(305, 'default', 'created', 'App\\Models\\Like', 'created', 68, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 03:38:23', '2025-08-22 03:38:23'),
(306, 'default', 'created', 'App\\Models\\UserProgress', 'created', 72, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:39:29', '2025-08-22 03:39:29'),
(307, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 38, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":8}}', NULL, '2025-08-22 03:40:43', '2025-08-22 03:40:43'),
(308, 'default', 'created', 'App\\Models\\UserProgress', 'created', 73, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:40:43', '2025-08-22 03:40:43'),
(309, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 68, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 03:40:48', '2025-08-22 03:40:48'),
(310, 'default', 'created', 'App\\Models\\Like', 'created', 69, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 03:40:49', '2025-08-22 03:40:49'),
(311, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 39, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":5}}', NULL, '2025-08-22 03:40:55', '2025-08-22 03:40:55'),
(312, 'default', 'created', 'App\\Models\\UserProgress', 'created', 74, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 03:40:55', '2025-08-22 03:40:55'),
(313, 'default', 'User logged in', 'App\\Models\\User', NULL, 75, 'App\\Models\\User', 75, '[]', NULL, '2025-08-22 05:06:07', '2025-08-22 05:06:07'),
(314, 'default', 'User logged in', 'App\\Models\\User', NULL, 56, 'App\\Models\\User', 56, '[]', NULL, '2025-08-22 05:14:19', '2025-08-22 05:14:19'),
(315, 'default', 'created', 'App\\Models\\UserProgress', 'created', 75, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 05:14:33', '2025-08-22 05:14:33'),
(316, 'default', 'created', 'App\\Models\\Like', 'created', 70, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 05:14:53', '2025-08-22 05:14:53'),
(317, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 70, 'App\\Models\\User', 56, '{\"old\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 05:15:40', '2025-08-22 05:15:40'),
(318, 'default', 'created', 'App\\Models\\Like', 'created', 71, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 05:15:43', '2025-08-22 05:15:43'),
(319, 'default', 'created', 'App\\Models\\Like', 'created', 72, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":13,\"user_id\":56}}', NULL, '2025-08-22 05:15:56', '2025-08-22 05:15:56'),
(320, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 71, 'App\\Models\\User', 56, '{\"old\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 05:15:58', '2025-08-22 05:15:58'),
(321, 'default', 'created', 'App\\Models\\UserProgress', 'created', 76, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 05:16:21', '2025-08-22 05:16:21'),
(322, 'default', 'created', 'App\\Models\\Komentar', 'created', 55, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":13,\"user_id\":56,\"isi_komentar\":\"Menarik, dan mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 05:16:41', '2025-08-22 05:16:41'),
(323, 'default', 'created', 'App\\Models\\Like', 'created', 73, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":12,\"user_id\":56}}', NULL, '2025-08-22 05:17:38', '2025-08-22 05:17:38'),
(324, 'default', 'created', 'App\\Models\\Like', 'created', 74, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":11,\"user_id\":56}}', NULL, '2025-08-22 05:17:45', '2025-08-22 05:17:45'),
(325, 'default', 'created', 'App\\Models\\Like', 'created', 75, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":10,\"user_id\":56}}', NULL, '2025-08-22 05:17:57', '2025-08-22 05:17:57'),
(326, 'default', 'created', 'App\\Models\\Like', 'created', 76, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":9,\"user_id\":56}}', NULL, '2025-08-22 05:18:06', '2025-08-22 05:18:06'),
(327, 'default', 'created', 'App\\Models\\Like', 'created', 77, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":8,\"user_id\":56}}', NULL, '2025-08-22 05:18:11', '2025-08-22 05:18:11'),
(328, 'default', 'created', 'App\\Models\\Like', 'created', 78, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":7,\"user_id\":56}}', NULL, '2025-08-22 05:18:17', '2025-08-22 05:18:17'),
(329, 'default', 'created', 'App\\Models\\Like', 'created', 79, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":5,\"user_id\":56}}', NULL, '2025-08-22 05:18:21', '2025-08-22 05:18:21'),
(330, 'default', 'created', 'App\\Models\\Like', 'created', 80, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 05:18:23', '2025-08-22 05:18:23'),
(331, 'default', 'created', 'App\\Models\\Komentar', 'created', 56, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":12,\"user_id\":56,\"isi_komentar\":\"Walaupun panjang ya semoga bisa di mengerti\",\"balasan_admin\":null}}', NULL, '2025-08-22 05:19:32', '2025-08-22 05:19:32'),
(332, 'default', 'User logged in', 'App\\Models\\User', NULL, 65, 'App\\Models\\User', 65, '[]', NULL, '2025-08-22 16:19:17', '2025-08-22 16:19:17'),
(333, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-22 16:19:40', '2025-08-22 16:19:40'),
(334, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 16:20:53', '2025-08-22 16:20:53'),
(335, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 16:20:53', '2025-08-22 16:20:53'),
(336, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 40, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":8}}', NULL, '2025-08-22 16:21:32', '2025-08-22 16:21:32'),
(337, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 55, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Terima kasih. Semoga bisa diterapkan ilmunya\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:22:45', '2025-08-22 16:22:45'),
(338, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 43, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Betul sekali, dengan menonton video lebih cepat informasi tersampaikan. Untuk lebih detail, bisa membaca materi dalam bentuk pdf\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:25:14', '2025-08-22 16:25:14'),
(339, 'default', 'created', 'App\\Models\\Komentar', 'created', 57, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":8,\"user_id\":24,\"isi_komentar\":\"Dapat dimengerti dengan mudah dan Penyalahgunaan narkoba merupakan masalah serius yang mengancam \\r\\nMasa depan generasi muda. Jadi kita harus saling mencegah dan mengingatkan bahaya penyalah gunaaan narkoba ini terutama para pelajar\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:26:36', '2025-08-22 16:26:36'),
(340, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 40, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Oh tentu, kakak kakak mengikuti jaman supaya adek adek lebih tertarik mempelajari materi kesehatan mental\\ud83d\\ude09\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:26:41', '2025-08-22 16:26:41'),
(341, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 33, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Bukan hanya sehat fisik, tetapi kita juga harus sehat jiwa\\ud83d\\udc4d\\ud83c\\udffb\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:27:24', '2025-08-22 16:27:24'),
(342, 'default', 'User logged in', 'App\\Models\\User', NULL, 54, 'App\\Models\\User', 54, '[]', NULL, '2025-08-22 16:28:19', '2025-08-22 16:28:19'),
(343, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Kami sangat senang bila maksud dan tujuan materi tersampaikan dengan baik kepada adek adek\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:28:45', '2025-08-22 16:28:45'),
(344, 'default', 'created', 'App\\Models\\Komentar', 'created', 58, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":13,\"user_id\":54,\"isi_komentar\":\"terimakasih ka\\ud83d\\ude4f\\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:29:13', '2025-08-22 16:29:13'),
(345, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 9, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Pelajarannya diambil dan diterapkan juga ya, Dea\\ud83d\\ude09\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:29:39', '2025-08-22 16:29:39'),
(346, 'default', 'created', 'App\\Models\\Komentar', 'created', 59, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":12,\"user_id\":54,\"isi_komentar\":\"woww menurut aku ini menarik bgt terimakasih\\ud83e\\udd29\\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:30:08', '2025-08-22 16:30:08'),
(347, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"OMG! Terima kasih Yunike\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:30:09', '2025-08-22 16:30:09'),
(348, 'default', 'created', 'App\\Models\\Like', 'created', 81, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":12,\"user_id\":54}}', NULL, '2025-08-22 16:30:22', '2025-08-22 16:30:22'),
(349, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 27, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"We are the best... the best... the best yes! \\ud83d\\udd25\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 16:31:10', '2025-08-22 16:31:10'),
(350, 'default', 'created', 'App\\Models\\Komentar', 'created', 60, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":5,\"user_id\":24,\"isi_komentar\":\"Teks ini memberikan pemahaman bahwa gizi tidak hanya berkaitan dengan rasa kenyang, tetapi juga kualitas makanan yang dikonsumsi. ini sangat penting untuk Remaja, agar menjaga pola makan nya  dan memakan makanan bergizi\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:33:22', '2025-08-22 16:33:22'),
(351, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-22 16:39:32', '2025-08-22 16:39:32'),
(352, 'default', 'created', 'App\\Models\\Consultation', 'created', 12, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"category_id\":1,\"title\":\"Kebutuhan Gizi Ideal untuk Remaja\",\"description\":\"Sebenarnya berapa Kebutuhan kalori, protein, vitamin, dan mineral yang ideal untuk remaja setiap harinya? Dan apakah kebutuhan gizi antara laki laki dan perempuan itu berbeda?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 16:39:34', '2025-08-22 16:39:34'),
(353, 'default', 'created', 'App\\Models\\Consultation', 'created', 13, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"category_id\":13,\"title\":\"pola makan sehat untuk remaja\",\"description\":\"Saya ingin berkonsultasi mengenai pola makan sehat untuk remaja. Saat ini saya sering merasa cepat lelah dan kurang fokus saat belajar. Berat badan saya cenderung naik, tetapi nafsu makan juga sering tinggi. Saya ingin tahu menu makanan yang seimbang, berapa kali sebaiknya makan dalam sehari, serta makanan apa saja yang harus dihindari agar kesehatan tetap terjaga\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 16:43:07', '2025-08-22 16:43:07'),
(354, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 41, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":15}}', NULL, '2025-08-22 16:44:23', '2025-08-22 16:44:23'),
(355, 'default', 'created', 'App\\Models\\UserProgress', 'created', 77, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:44:23', '2025-08-22 16:44:23'),
(356, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 42, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":15}}', NULL, '2025-08-22 16:44:28', '2025-08-22 16:44:28'),
(357, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 46, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 16:45:42', '2025-08-22 16:45:42'),
(358, 'default', 'created', 'App\\Models\\Like', 'created', 82, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 16:45:44', '2025-08-22 16:45:44'),
(359, 'default', 'created', 'App\\Models\\Komentar', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48,\"isi_komentar\":\"Materi sangat lengkap dan terstruktur \\u2013 Penyusunan dari pengertian, tujuan, ciri-ciri payudara sehat, hingga faktor yang mempengaruhi benar-benar rapi dan memudahkan pembaca memahami langkah demi langkah.\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:45:51', '2025-08-22 16:45:51'),
(360, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 47, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 16:46:03', '2025-08-22 16:46:03'),
(361, 'default', 'created', 'App\\Models\\Like', 'created', 83, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 16:46:04', '2025-08-22 16:46:04'),
(362, 'default', 'created', 'App\\Models\\UserProgress', 'created', 78, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:46:42', '2025-08-22 16:46:42'),
(363, 'default', 'created', 'App\\Models\\Komentar', 'created', 62, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48,\"isi_komentar\":\"materinya mudah di pahami karna bersifat video, dan videonya animasii \\r\\nis the best\\ud83e\\udd29\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:48:19', '2025-08-22 16:48:19'),
(364, 'default', 'created', 'App\\Models\\Like', 'created', 84, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":8,\"user_id\":48}}', NULL, '2025-08-22 16:48:42', '2025-08-22 16:48:42'),
(365, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 43, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":8}}', NULL, '2025-08-22 16:48:59', '2025-08-22 16:48:59'),
(366, 'default', 'created', 'App\\Models\\UserProgress', 'created', 79, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:48:59', '2025-08-22 16:48:59'),
(367, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 44, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":8}}', NULL, '2025-08-22 16:49:08', '2025-08-22 16:49:08'),
(368, 'default', 'User logged in', 'App\\Models\\User', NULL, 69, 'App\\Models\\User', 69, '[]', NULL, '2025-08-22 16:49:23', '2025-08-22 16:49:23'),
(369, 'default', 'created', 'App\\Models\\Komentar', 'created', 63, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":8,\"user_id\":48,\"isi_komentar\":\"Materi sangat lengkap dan mendalam \\u2013 Penjelasan mencakup definisi, jenis-jenis narkoba (narkotika, psikotropika, dan bahan adiktif), dampak, pencegahan, hingga penanganan dan rehabilitasi. Ini membuat pembaca mendapatkan gambaran utuh.\\r\\n\\r\\nBahasa jelas dan sistematis \\u2013 Penyampaian menggunakan bahasa yang mudah dipahami, meskipun topiknya cukup berat. Hal ini membantu pelajar maupun masyarakat umum memahami bahaya narkoba dengan baik.\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:50:28', '2025-08-22 16:50:28'),
(370, 'default', 'created', 'App\\Models\\Like', 'created', 85, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":15,\"user_id\":69}}', NULL, '2025-08-22 16:50:46', '2025-08-22 16:50:46'),
(371, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 58, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 16:51:08', '2025-08-22 16:51:08'),
(372, 'default', 'created', 'App\\Models\\Like', 'created', 86, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 16:51:12', '2025-08-22 16:51:12'),
(373, 'default', 'created', 'App\\Models\\UserProgress', 'created', 80, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:51:35', '2025-08-22 16:51:35'),
(374, 'default', 'created', 'App\\Models\\Komentar', 'created', 64, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48,\"isi_komentar\":\"\\u2764\\ufe0f\\u2764\\ufe0f\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:52:08', '2025-08-22 16:52:08'),
(375, 'default', 'created', 'App\\Models\\Like', 'created', 87, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 16:52:17', '2025-08-22 16:52:17'),
(376, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 45, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":10}}', NULL, '2025-08-22 16:52:30', '2025-08-22 16:52:30'),
(377, 'default', 'created', 'App\\Models\\UserProgress', 'created', 81, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:52:30', '2025-08-22 16:52:30'),
(378, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":10}}', NULL, '2025-08-22 16:52:40', '2025-08-22 16:52:40'),
(379, 'default', 'created', 'App\\Models\\Komentar', 'created', 65, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48,\"isi_komentar\":\"Secara keseluruhan, materi ini sangat baik, bermanfaat, dan layak digunakan sebagai bahan ajar atau penyuluhan remaja karena tidak hanya memberi informasi, tetapi juga mendorong kesadaran diri dan perilaku sehat.\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:53:39', '2025-08-22 16:53:39'),
(380, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 87, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 16:53:41', '2025-08-22 16:53:41'),
(381, 'default', 'created', 'App\\Models\\Like', 'created', 88, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 16:53:43', '2025-08-22 16:53:43'),
(382, 'default', 'created', 'App\\Models\\UserProgress', 'created', 82, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:54:08', '2025-08-22 16:54:08'),
(383, 'default', 'created', 'App\\Models\\Komentar', 'created', 66, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":9,\"user_id\":48,\"isi_komentar\":\"video ini bermanfaat sekali karena mengajarkan tentang pola hidup sehat, mantapp \\ud83e\\udd29\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 16:54:34', '2025-08-22 16:54:34'),
(384, 'default', 'created', 'App\\Models\\Like', 'created', 89, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":9,\"user_id\":48}}', NULL, '2025-08-22 16:54:38', '2025-08-22 16:54:38'),
(385, 'default', 'created', 'App\\Models\\UserProgress', 'created', 83, 'App\\Models\\User', 69, '{\"attributes\":{\"user_id\":69,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 16:57:51', '2025-08-22 16:57:51'),
(386, 'default', 'created', 'App\\Models\\Like', 'created', 90, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-22 16:57:54', '2025-08-22 16:57:54'),
(387, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 90, 'App\\Models\\User', 69, '{\"old\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-22 16:57:57', '2025-08-22 16:57:57'),
(388, 'default', 'created', 'App\\Models\\Like', 'created', 91, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-22 17:00:32', '2025-08-22 17:00:32'),
(389, 'default', 'created', 'App\\Models\\Komentar', 'created', 67, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69,\"isi_komentar\":\"materinya keren dan menarik\",\"balasan_admin\":null}}', NULL, '2025-08-22 17:01:20', '2025-08-22 17:01:20'),
(390, 'default', 'created', 'App\\Models\\Like', 'created', 92, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":12,\"user_id\":69}}', NULL, '2025-08-22 17:02:38', '2025-08-22 17:02:38'),
(391, 'default', 'created', 'App\\Models\\Komentar', 'created', 68, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":12,\"user_id\":69,\"isi_komentar\":\"materinya jelas,isinya juga mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 17:04:41', '2025-08-22 17:04:41'),
(392, 'default', 'created', 'App\\Models\\Komentar', 'created', 69, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":11,\"user_id\":69,\"isi_komentar\":\"materi berbentuk vidio ini sangat menarik,dan lebih mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 17:05:44', '2025-08-22 17:05:44'),
(393, 'default', 'created', 'App\\Models\\Like', 'created', 93, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":11,\"user_id\":69}}', NULL, '2025-08-22 17:05:47', '2025-08-22 17:05:47'),
(394, 'default', 'created', 'App\\Models\\UserProgress', 'created', 84, 'App\\Models\\User', 69, '{\"attributes\":{\"user_id\":69,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 17:05:52', '2025-08-22 17:05:52'),
(395, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 19:51:31', '2025-08-22 19:51:31'),
(396, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 19:51:31', '2025-08-22 19:51:31'),
(397, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 19:54:01', '2025-08-22 19:54:01'),
(398, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 19:54:12', '2025-08-22 19:54:12'),
(399, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-22 19:56:13', '2025-08-22 19:56:13'),
(400, 'default', 'User logged in', 'App\\Models\\User', NULL, 55, 'App\\Models\\User', 55, '[]', NULL, '2025-08-22 20:05:01', '2025-08-22 20:05:01'),
(401, 'default', 'created', 'App\\Models\\Like', 'created', 94, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":15,\"user_id\":55}}', NULL, '2025-08-22 20:05:15', '2025-08-22 20:05:15'),
(402, 'default', 'created', 'App\\Models\\Like', 'created', 95, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:24', '2025-08-22 20:05:24'),
(403, 'default', 'created', 'App\\Models\\UserProgress', 'created', 85, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 20:05:26', '2025-08-22 20:05:26'),
(404, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 95, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:27', '2025-08-22 20:05:27'),
(405, 'default', 'created', 'App\\Models\\Like', 'created', 96, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:29', '2025-08-22 20:05:29'),
(406, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 96, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:31', '2025-08-22 20:05:31'),
(407, 'default', 'created', 'App\\Models\\Like', 'created', 97, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:32', '2025-08-22 20:05:32'),
(408, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 97, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:32', '2025-08-22 20:05:32'),
(409, 'default', 'created', 'App\\Models\\Like', 'created', 98, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:32', '2025-08-22 20:05:32'),
(410, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 98, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:05:32', '2025-08-22 20:05:32'),
(411, 'default', 'created', 'App\\Models\\Komentar', 'created', 70, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-22 20:06:12', '2025-08-22 20:06:12'),
(412, 'default', 'created', 'App\\Models\\Like', 'created', 99, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-22 20:06:17', '2025-08-22 20:06:17'),
(413, 'default', 'created', 'App\\Models\\UserProgress', 'created', 86, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 20:06:31', '2025-08-22 20:06:31'),
(414, 'default', 'created', 'App\\Models\\Komentar', 'created', 71, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":11,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-22 20:06:42', '2025-08-22 20:06:42'),
(415, 'default', 'created', 'App\\Models\\Like', 'created', 100, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":11,\"user_id\":55}}', NULL, '2025-08-22 20:06:46', '2025-08-22 20:06:46'),
(416, 'default', 'created', 'App\\Models\\Like', 'created', 101, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":9,\"user_id\":55}}', NULL, '2025-08-22 20:07:03', '2025-08-22 20:07:03'),
(417, 'default', 'created', 'App\\Models\\UserProgress', 'created', 87, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 20:07:04', '2025-08-22 20:07:04'),
(418, 'default', 'created', 'App\\Models\\Komentar', 'created', 72, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":9,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-22 20:07:13', '2025-08-22 20:07:13'),
(419, 'default', 'created', 'App\\Models\\Like', 'created', 102, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":7,\"user_id\":55}}', NULL, '2025-08-22 20:07:32', '2025-08-22 20:07:32'),
(420, 'default', 'created', 'App\\Models\\Komentar', 'created', 73, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":7,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-22 20:07:41', '2025-08-22 20:07:41'),
(421, 'default', 'created', 'App\\Models\\UserProgress', 'created', 88, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 20:07:49', '2025-08-22 20:07:49'),
(422, 'default', 'created', 'App\\Models\\UserProgress', 'created', 89, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 20:08:49', '2025-08-22 20:08:49'),
(423, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 20:13:30', '2025-08-22 20:13:30'),
(424, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 20:13:44', '2025-08-22 20:13:44'),
(425, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 20:13:44', '2025-08-22 20:13:44');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(426, 'default', 'deleted', 'App\\Models\\User', 'deleted', 84, 'App\\Models\\User', 3, '{\"old\":{\"name\":\"Adam\",\"email\":\"adamsetiadijr07@gmail.com\",\"password\":\"$2y$12$a9j5r\\/BwFc5CFYHUJvCoAuMLtO0pXSDgUCneJjNccBx9qklvlQJO6\"}}', NULL, '2025-08-22 20:14:05', '2025-08-22 20:14:05'),
(427, 'default', 'User logged in', 'App\\Models\\User', NULL, 26, 'App\\Models\\User', 26, '[]', NULL, '2025-08-22 20:21:17', '2025-08-22 20:21:17'),
(428, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 20:22:05', '2025-08-22 20:22:05'),
(429, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-22 21:29:36', '2025-08-22 21:29:36'),
(430, 'default', 'created', 'App\\Models\\Like', 'created', 103, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":7,\"user_id\":46}}', NULL, '2025-08-22 21:30:06', '2025-08-22 21:30:06'),
(431, 'default', 'created', 'App\\Models\\Komentar', 'created', 74, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":7,\"user_id\":46,\"isi_komentar\":\"wihh gampang banget dipahami materinya, ga bosen juga liat animasinya, selalu kerenn\",\"balasan_admin\":null}}', NULL, '2025-08-22 21:33:34', '2025-08-22 21:33:34'),
(432, 'default', 'created', 'App\\Models\\UserProgress', 'created', 90, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 21:34:11', '2025-08-22 21:34:11'),
(433, 'default', 'created', 'App\\Models\\Like', 'created', 104, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":11,\"user_id\":46}}', NULL, '2025-08-22 21:34:56', '2025-08-22 21:34:56'),
(434, 'default', 'created', 'App\\Models\\Komentar', 'created', 75, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":11,\"user_id\":46,\"isi_komentar\":\"wah terimakasih materi nya, sekarang jadi lebih tau mengenai kesehatan reproduksi \\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-22 21:36:04', '2025-08-22 21:36:04'),
(435, 'default', 'User logged in', 'App\\Models\\User', NULL, 22, 'App\\Models\\User', 22, '[]', NULL, '2025-08-23 04:35:38', '2025-08-23 04:35:38'),
(436, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 47, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"materi_id\":5}}', NULL, '2025-08-23 04:36:04', '2025-08-23 04:36:04'),
(437, 'default', 'created', 'App\\Models\\UserProgress', 'created', 91, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 04:36:04', '2025-08-23 04:36:04'),
(438, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-23 06:23:19', '2025-08-23 06:23:19'),
(439, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-23 06:23:19', '2025-08-23 06:23:19'),
(440, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":13,\"user_id\":82,\"is_responder\":true,\"response\":\"Pola makan sehat untuk remaja sangat penting untuk mendukung pertumbuhan, energi, dan fokus. Berikut beberapa tips yang bisa kamu terapkan:\\r\\n\\r\\n*Menu Makanan Seimbang:*\\r\\n\\r\\n1. *Sarapan*: Mulai hari dengan sarapan yang seimbang, seperti oatmeal dengan buah dan kacang-kacangan, atau telur dengan roti gandum dan sayuran.\\r\\n2. *Makan Siang*: Pilih makanan yang kaya akan protein, karbohidrat kompleks, dan sayuran, seperti nasi merah dengan ayam panggang dan sayuran.\\r\\n3. *Makan Malam*: Makan malam yang ringan dan seimbang, seperti ikan dengan sayuran dan quinoa.\\r\\n4. *Camilan*: Pilih camilan yang sehat, seperti buah, kacang-kacangan, atau yogurt.\\r\\n\\r\\n*Frekuensi Makan:*\\r\\n\\r\\n1. *3-5 kali makan utama*: Sarapan, makan siang, makan malam, dan 2-3 kali camilan sehat.\\r\\n2. *Jangan melewatkan makan*: Pastikan kamu makan secara teratur untuk menjaga energi dan fokus.\\r\\n\\r\\n*Makanan yang Harus Dihindari:*\\r\\n\\r\\n1. *Makanan yang tinggi gula*: Batasi konsumsi makanan yang tinggi gula, seperti permen, minuman manis, dan kue-kue.\\r\\n2. *Makanan yang tinggi lemak*: Batasi konsumsi makanan yang tinggi lemak, seperti gorengan, makanan yang digoreng, dan makanan yang tinggi lemak jenuh.\\r\\n3. *Makanan yang tinggi sodium*: Batasi konsumsi makanan yang tinggi sodium, seperti makanan yang diasinkan, makanan yang diproses, dan makanan yang tinggi garam.\\r\\n\\r\\n*Tips Tambahan:*\\r\\n\\r\\n1. *Minum banyak air*: Pastikan kamu minum banyak air untuk menjaga hidrasi dan kesehatan tubuh.\\r\\n2. *Olahraga teratur*: Lakukan olahraga teratur untuk menjaga kesehatan tubuh dan meningkatkan energi.\\r\\n3. *Tidur yang cukup*: Pastikan kamu tidur yang cukup untuk menjaga kesehatan tubuh dan meningkatkan fokus.\\r\\n\\r\\nDengan menerapkan pola makan sehat dan tips di atas, kamu dapat meningkatkan energi, fokus, dan kesehatan tubuh. Jika kamu masih merasa lelah atau kurang fokus, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk mengetahui penyebabnya.\",\"is_public\":true}}', NULL, '2025-08-23 06:26:23', '2025-08-23 06:26:23'),
(441, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 06:26:23', '2025-08-23 06:26:23'),
(442, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":12,\"user_id\":82,\"is_responder\":true,\"response\":\"Kebutuhan gizi remaja bervariasi tergantung pada usia, jenis kelamin, tingkat aktivitas fisik, dan faktor lainnya. Berikut adalah perkiraan kebutuhan gizi harian untuk remaja:\\r\\n\\r\\n*Kebutuhan Kalori:*\\r\\n\\r\\n- Remaja laki-laki (14-18 tahun): 2.200-3.200 kalori\\/hari\\r\\n- Remaja perempuan (14-18 tahun): 1.800-2.400 kalori\\/hari\\r\\n\\r\\n*Kebutuhan Protein:*\\r\\n\\r\\n- Remaja laki-laki (14-18 tahun): 52-60 gram\\/hari\\r\\n- Remaja perempuan (14-18 tahun): 46-50 gram\\/hari\\r\\n\\r\\n*Kebutuhan Vitamin dan Mineral:*\\r\\n\\r\\n- Vitamin C: 65-75 mg\\/hari\\r\\n- Vitamin D: 600-800 IU\\/hari\\r\\n- Kalsium: 1.300 mg\\/hari\\r\\n- Zat besi: 8-18 mg\\/hari (lebih tinggi untuk remaja perempuan)\\r\\n- Vitamin B12: 2,4-2,6 mcg\\/hari\\r\\n\\r\\n*Perbedaan Kebutuhan Gizi antara Laki-laki dan Perempuan:*\\r\\n\\r\\n- Remaja laki-laki umumnya membutuhkan lebih banyak kalori dan protein daripada remaja perempuan karena perbedaan tingkat metabolisme dan massa otot.\\r\\n- Remaja perempuan membutuhkan lebih banyak zat besi karena menstruasi dan kebutuhan reproduksi.\\r\\n- Kebutuhan kalsium dan vitamin D sama untuk kedua jenis kelamin karena pentingnya untuk pertumbuhan tulang.\\r\\n\\r\\nNamun, perlu diingat bahwa kebutuhan gizi individu dapat bervariasi tergantung pada faktor-faktor seperti tingkat aktivitas fisik, kondisi kesehatan, dan preferensi makanan. Oleh karena itu, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk menentukan kebutuhan gizi yang spesifik untuk setiap individu.\",\"is_public\":true}}', NULL, '2025-08-23 06:27:42', '2025-08-23 06:27:42'),
(443, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 06:27:42', '2025-08-23 06:27:42'),
(444, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":11,\"user_id\":82,\"is_responder\":true,\"response\":\"Benar sekali! Pemeriksaan kesehatan secara berkala sangat penting untuk mendeteksi masalah kesehatan lebih dini dan mencegah penyakit kronis. Banyak penyakit tidak menunjukkan gejala awal yang jelas, sehingga pemeriksaan rutin dapat membantu mengidentifikasi masalah kesehatan sebelum menjadi parah.\\r\\n\\r\\nDengan melakukan konsultasi rutin, kita dapat:\\r\\n\\r\\n- Mendeteksi masalah kesehatan lebih dini\\r\\n- Mencegah penyakit kronis\\r\\n- Menjaga pola hidup yang lebih seimbang\\r\\n- Mengatasi kebingungan terkait pola makan, aktivitas fisik, manajemen stres, dan cara menjaga imun tubuh\\r\\n\\r\\nSelain itu, konsultasi rutin juga dapat membantu meningkatkan kesadaran dan pengetahuan tentang kesehatan, sehingga kita dapat membuat keputusan yang lebih tepat untuk menjaga kesehatan kita.\\r\\n\\r\\nJadi, sangat penting untuk melakukan pemeriksaan kesehatan secara berkala dan konsultasi rutin dengan dokter atau ahli kesehatan lainnya untuk menjaga kesehatan dan mencegah penyakit.\",\"is_public\":true}}', NULL, '2025-08-23 06:29:17', '2025-08-23 06:29:17'),
(445, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 06:29:17', '2025-08-23 06:29:17'),
(446, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":10,\"user_id\":82,\"is_responder\":true,\"response\":\"Mengatur pola hidup sehat memang tidak mudah, terutama ketika ada godaan makanan yang lezat tapi tidak sehat. Berikut beberapa tips yang bisa membantu kamu menjaga pola hidup sehat dan konsisten:\\r\\n\\r\\n*Tips untuk Mengatur Pola Makan:*\\r\\n\\r\\n1. *Rencanakan makanan*: Buatlah rencana makanan untuk beberapa hari ke depan, sehingga kamu bisa mempersiapkan makanan yang seimbang dan sehat.\\r\\n2. *Siapkan makanan sehat*: Siapkan makanan sehat di rumah, seperti sayuran, buah, dan protein yang seimbang.\\r\\n3. *Kurangi godaan*: Jika kamu tahu bahwa kamu tidak bisa menahan godaan makanan tertentu, cobalah untuk menghindarinya atau mengurangi jumlahnya.\\r\\n4. *Cari alternatif*: Cari alternatif makanan yang lebih sehat untuk makanan yang kamu sukai, seperti seblak yang dibuat dengan bahan-bahan yang lebih sehat.\\r\\n\\r\\n*Tips untuk Mengatur Konsumsi Makanan Tidak Sehat:*\\r\\n\\r\\n1. *Izinkan diri*: Izinkan diri kamu untuk menikmati makanan tidak sehat dalam jumlah yang wajar dan tidak terlalu sering.\\r\\n2. *Pilih waktu yang tepat*: Pilih waktu yang tepat untuk menikmati makanan tidak sehat, seperti pada hari libur atau setelah olahraga.\\r\\n3. *Kontrol porsi*: Kontrol porsi makanan tidak sehat yang kamu konsumsi, sehingga kamu tidak terlalu banyak mengonsumsinya.\\r\\n\\r\\n*Tips untuk Meningkatkan Konsistensi:*\\r\\n\\r\\n1. *Buat tujuan*: Buat tujuan yang spesifik dan realistis untuk menjaga pola hidup sehat.\\r\\n2. *Cari dukungan*: Cari dukungan dari teman atau keluarga yang juga ingin menjaga pola hidup sehat.\\r\\n3. *Pantau progres*: Pantau progres kamu dan catat keberhasilan kamu dalam menjaga pola hidup sehat.\\r\\n4. *Jangan terlalu keras*: Jangan terlalu keras pada diri sendiri jika kamu gagal, tetapi cobalah untuk belajar dari kesalahan dan terus mencoba.\\r\\n\\r\\n*Tips untuk Meningkatkan Olahraga:*\\r\\n\\r\\n1. *Cari olahraga yang menyenangkan*: Cari olahraga yang menyenangkan dan sesuai dengan minat kamu.\\r\\n2. *Buat jadwal*: Buat jadwal olahraga yang realistis dan sesuai dengan gaya hidup kamu.\\r\\n3. *Mulai dari kecil*: Mulai dari olahraga yang ringan dan secara bertahap meningkatkan intensitas dan durasi.\\r\\n\\r\\nDengan mengikuti tips di atas, kamu bisa meningkatkan kemampuan kamu untuk menjaga pola hidup sehat dan konsisten. Ingat bahwa menjaga pola hidup sehat adalah proses yang berkelanjutan dan memerlukan kesabaran dan konsistensi.\",\"is_public\":true}}', NULL, '2025-08-23 06:30:33', '2025-08-23 06:30:33'),
(447, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 06:30:33', '2025-08-23 06:30:33'),
(448, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-23 07:22:58', '2025-08-23 07:22:58'),
(449, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-23 20:40:04', '2025-08-23 20:40:04'),
(450, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-23 20:40:04', '2025-08-23 20:40:04'),
(451, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-23 20:53:52', '2025-08-23 20:53:52'),
(452, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-23 20:53:52', '2025-08-23 20:53:52'),
(453, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-23 21:43:43', '2025-08-23 21:43:43'),
(454, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-23 23:56:39', '2025-08-23 23:56:39'),
(455, 'default', 'created', 'App\\Models\\UserProgress', 'created', 92, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 23:57:01', '2025-08-23 23:57:01'),
(456, 'default', 'created', 'App\\Models\\Like', 'created', 105, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":15,\"user_id\":63}}', NULL, '2025-08-23 23:57:48', '2025-08-23 23:57:48'),
(457, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 48, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-23 23:58:21', '2025-08-23 23:58:21'),
(458, 'default', 'created', 'App\\Models\\UserProgress', 'created', 93, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 23:58:21', '2025-08-23 23:58:21'),
(459, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 49, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-23 23:58:26', '2025-08-23 23:58:26'),
(460, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 50, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-23 23:58:28', '2025-08-23 23:58:28'),
(461, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 51, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-23 23:59:00', '2025-08-23 23:59:00'),
(462, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 52, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-23 23:59:02', '2025-08-23 23:59:02'),
(463, 'default', 'created', 'App\\Models\\Komentar', 'created', 76, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":15,\"user_id\":63,\"isi_komentar\":\"Wah materinya lengkap bgt, gampang dipahami juga. Jadi lebih sadar pentingnya ngerawat kesehatan payudara dari hal kecil kaya kebersihan, pola makan sampe periksa rutin. Baru tau juga ternyata faktor makanan sama gaya hidup ngaruh bgt. Keren sih\",\"balasan_admin\":null}}', NULL, '2025-08-24 00:03:12', '2025-08-24 00:03:12'),
(464, 'default', 'created', 'App\\Models\\Like', 'created', 106, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":13,\"user_id\":63}}', NULL, '2025-08-24 00:03:32', '2025-08-24 00:03:32'),
(465, 'default', 'created', 'App\\Models\\Komentar', 'created', 77, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":12,\"user_id\":63,\"isi_komentar\":\"i materi, detail bgt tp gampang dicerna. Jadi makin kebuka mata kalo mental health tuh sepenting itu \\ud83d\\udd25\\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-24 00:09:45', '2025-08-24 00:09:45'),
(466, 'default', 'created', 'App\\Models\\Like', 'created', 107, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":8,\"user_id\":63}}', NULL, '2025-08-24 00:12:33', '2025-08-24 00:12:33'),
(467, 'default', 'created', 'App\\Models\\Komentar', 'created', 78, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":8,\"user_id\":63,\"isi_komentar\":\"Setelah baca materi ini jadi sadar banget kalau narkoba itu bener-bener bahaya dan harus dijauhi. bikin semangat buat jaga diri sendiri dan teman-teman dari pengaruh narkoba Ternyata dampak narkoba luas banget ya, bukan cuma kesehatan tapi juga masa depan. Jadi lebih hati-hati\",\"balasan_admin\":null}}', NULL, '2025-08-24 00:13:55', '2025-08-24 00:13:55'),
(468, 'default', 'created', 'App\\Models\\Like', 'created', 108, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":5,\"user_id\":63}}', NULL, '2025-08-24 00:14:02', '2025-08-24 00:14:02'),
(469, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 53, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":5}}', NULL, '2025-08-24 00:14:12', '2025-08-24 00:14:12'),
(470, 'default', 'created', 'App\\Models\\UserProgress', 'created', 94, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 00:14:12', '2025-08-24 00:14:12'),
(471, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 54, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":5}}', NULL, '2025-08-24 00:14:15', '2025-08-24 00:14:15'),
(472, 'default', 'created', 'App\\Models\\Komentar', 'created', 79, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":5,\"user_id\":63,\"isi_komentar\":\"Menurut aku materinya bermanfaat banget buat nambah pengetahuan. Jadi bisa lebih ngerti pentingnya gizi seimbang. Cocok juga buat diterapin di kehidupan sehari-hari.\",\"balasan_admin\":null}}', NULL, '2025-08-24 00:17:23', '2025-08-24 00:17:23'),
(473, 'default', 'created', 'App\\Models\\Consultation', 'created', 14, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"category_id\":1,\"title\":\"Pola Hidup Sehat untuk Remaja\",\"description\":\"sebagian siswa masih suka mengabaikan pola hidup sehat, misalnya sering kurang tidur, jarang olahraga, atau lebih memilih jajanan cepat saji daripada makanan bergizi. Hal ini bisa bikin tubuh cepat lelah, sulit fokus belajar, bahkan gampang sakit. Dengan memahami pola hidup sehat, diharapkan siswa bisa menjaga kondisi fisik dan mental. Bagaimana cara membiasakan diri untuk tidur cukup meski tugas sekolah sering menumpuk? Lalu Bagaimana cara mengatur waktu belajar, istirahat, dan aktivitas lain agar tubuh tetap fit?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-24 00:50:43', '2025-08-24 00:50:43'),
(474, 'default', 'created', 'App\\Models\\Consultation', 'created', 15, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"category_id\":19,\"title\":\"Kesehatan mental pada remaja\",\"description\":\"Banyak pelajar merasa mudah stres, cemas, atau terbebani dengan tugas sekolah dan masalah pribadi. Kadang bingung cara menenangkan diri, apalagi kalau tidak tahu harus cerita ke siapa. Padahal menjaga kesehatan mental sama pentingnya dengan menjaga kesehatan. Apa langkah yang bisa dilakukan kalau merasa cemas atau overthinking? Pertanyaan yg kedua  Bagaimana cara mengenali tanda-tanda kalau mental kita lagi nggak sehat? Dan Apa kegiatan sederhana yang bisa dilakukan remaja untuk menjaga mood tetap stabil?\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-24 00:54:24', '2025-08-24 00:54:24'),
(475, 'default', 'created', 'App\\Models\\User', 'created', 86, NULL, NULL, '{\"attributes\":{\"name\":\"Arisa\",\"email\":\"naqiesss@gmail.com\",\"password\":\"$2y$12$hWV1jhCaiacTT7l9U0jEeuVumGZGJ6JaD2rIPLHKTfhzPZ0RDkGmG\"}}', NULL, '2025-08-24 14:07:55', '2025-08-24 14:07:55'),
(476, 'default', 'created', 'App\\Models\\UserProgress', 'created', 95, 'App\\Models\\User', 86, '{\"attributes\":{\"user_id\":86,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 14:08:05', '2025-08-24 14:08:05'),
(477, 'default', 'created', 'App\\Models\\Like', 'created', 109, 'App\\Models\\User', 86, '{\"attributes\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 14:13:19', '2025-08-24 14:13:19'),
(478, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 109, 'App\\Models\\User', 86, '{\"old\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 14:13:19', '2025-08-24 14:13:19'),
(479, 'default', 'created', 'App\\Models\\Like', 'created', 110, 'App\\Models\\User', 86, '{\"attributes\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 14:13:22', '2025-08-24 14:13:22'),
(480, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-24 18:26:11', '2025-08-24 18:26:11'),
(481, 'default', 'User logged in', 'App\\Models\\User', NULL, 59, 'App\\Models\\User', 59, '[]', NULL, '2025-08-24 18:27:07', '2025-08-24 18:27:07'),
(482, 'default', 'created', 'App\\Models\\Komentar', 'created', 80, 'App\\Models\\User', 59, '{\"attributes\":{\"materi_id\":15,\"user_id\":59,\"isi_komentar\":\"Pokok nyaa in the besttt bangettttttt kaka, jadi aku enak banget bacaaaa + jelas banget \\ud83e\\udd70\\ud83e\\udd70\\ud83e\\udd70\",\"balasan_admin\":null}}', NULL, '2025-08-24 18:29:20', '2025-08-24 18:29:20'),
(483, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 14, 'App\\Models\\User', 24, '{\"attributes\":{\"consultation_id\":12,\"user_id\":24,\"is_responder\":false,\"response\":\"Baik terimakasih, jadi intinya kebutuhan gizi setiap individu itu berbeda tetapi ada standar gizi yang harus dipenuhi oleh remaja. Terimakasih sekali lagi atas jawabannya saya jadi tahu gizi yang diperlukan untuk remaja \\u263a\\ufe0f\\ud83d\\ude4c\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"is_public\":true}}', NULL, '2025-08-24 18:34:42', '2025-08-24 18:34:42'),
(484, 'default', 'User logged in', 'App\\Models\\User', NULL, 33, 'App\\Models\\User', 33, '[]', NULL, '2025-08-24 20:33:53', '2025-08-24 20:33:53'),
(485, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-25 00:12:49', '2025-08-25 00:12:49'),
(486, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 00:21:18', '2025-08-25 00:21:18'),
(487, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 00:21:18', '2025-08-25 00:21:18'),
(488, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 00:25:24', '2025-08-25 00:25:24'),
(489, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 00:25:54', '2025-08-25 00:25:54'),
(490, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 00:54:33', '2025-08-25 00:54:33'),
(491, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 00:54:45', '2025-08-25 00:54:45'),
(492, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":14,\"user_id\":82,\"is_responder\":true,\"response\":\"1. Cara Membiasakan Tidur Cukup Meski Tugas Menumpuk\\r\\nBuat Prioritas Tugas\\r\\nGunakan metode prioritas (Eisenhower Matrix):\\r\\nPenting & Mendesak \\u2192 Kerjakan segera\\r\\nPenting & Tidak Mendesak \\u2192 Jadwalkan\\r\\nTidak Penting \\u2192 Kurangi atau hindari\\r\\nHindari Menunda Pekerjaan\\r\\nSelesaikan tugas di awal, jangan menunggu deadline agar tidak begadang.\\r\\nTetapkan Jam Tidur yang Konsisten\\r\\nMisalnya, target tidur 7\\u20138 jam setiap malam. Usahakan tidur dan bangun di jam yang sama.\\r\\nKurangi Distraksi\\r\\nSimpan ponsel saat mengerjakan tugas dan sebelum tidur agar tidak terjebak scrolling media sosial.\\r\\nTeknik Pomodoro\\r\\nBelajar fokus 25 menit, istirahat 5 menit, ulangi 4 kali, lalu ambil istirahat lebih panjang (15\\u201330 menit).\\r\\n2. Cara Mengatur Waktu Belajar, Istirahat, dan Aktivitas\\r\\nGunakan Jadwal Harian\\r\\nBuat tabel pagi\\u2013siang\\u2013sore\\u2013malam. Masukkan:\\r\\nWaktu belajar (pagi\\/sore, saat otak segar)\\r\\nIstirahat (5\\u201310 menit setiap 1 jam belajar)\\r\\nAktivitas fisik (olahraga 20\\u201330 menit minimal 3 kali seminggu)\\r\\nTidur cukup\\r\\nAtur Target Harian Kecil\\r\\nDaripada memaksakan banyak materi dalam 1 hari, pecah jadi bagian kecil (misalnya 2 bab\\/hari).\\r\\n\\r\\nHindari Multitasking\\r\\nFokus satu hal agar lebih cepat selesai dan tidak membuang energi.\\r\\nSeimbangkan dengan Me Time\\r\\nLakukan hobi ringan untuk menjaga mental tetap sehat.\",\"is_public\":true}}', NULL, '2025-08-25 00:56:22', '2025-08-25 00:56:22'),
(493, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 14, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-25 00:56:22', '2025-08-25 00:56:22'),
(494, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 16, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":15,\"user_id\":82,\"is_responder\":true,\"response\":\"1. Langkah yang Bisa Dilakukan Kalau Merasa Cemas atau Overthinking\\r\\nTarik Napas Dalam & Latihan Relaksasi\\r\\nCoba teknik 4-7-8: tarik napas 4 detik \\u2192 tahan 7 detik \\u2192 hembuskan 8 detik. Ulangi 3\\u20135 kali.\\r\\nAlihkan Pikiran ke Aktivitas Positif\\r\\nDengarkan musik yang menenangkan, menulis jurnal, atau melakukan hobi.\\r\\nPisahkan Hal yang Bisa Dikendalikan & Tidak Bisa Dikendalikan\\r\\nFokus pada solusi yang ada di tangan kamu, bukan hal yang di luar kontrol.\\r\\nBatasi Overload Informasi\\r\\nKurangi konsumsi media sosial yang memicu perbandingan diri.\\r\\nCerita ke Orang yang Dipercaya\\r\\nBisa teman dekat, keluarga, atau guru BK. Jika butuh, jangan ragu mencari konselor.\\r\\n2. Cara Mengenali Tanda-Tanda Mental Tidak Sehat\\r\\nMudah Lelah & Sulit Fokus meski tidur cukup.\\r\\nPerubahan Pola Makan (terlalu banyak atau sedikit).\\r\\nTidur Tidak Teratur (insomnia atau terlalu banyak tidur).\\r\\nSering Merasa Sedih, Kosong, atau Mudah Marah.\\r\\nMenarik Diri dari Sosial (enggan ngobrol, malas ikut kegiatan).\\r\\nTurunnya Motivasi & Prestasi Belajar.\\r\\nSakit Fisik Tanpa Sebab Jelas (sakit kepala, perut).\\r\\nJika tanda ini terjadi lebih dari 2 minggu dan mengganggu aktivitas sehari-hari, itu sinyal kamu butuh bantuan.\\r\\n3. Kegiatan Sederhana untuk Menjaga Mood Tetap Stabil\\r\\nOlahraga Ringan (jalan kaki, stretching, senam \\u2192 bisa 15\\u201330 menit).\\r\\nMendengarkan Musik Favorit yang bikin rileks.\\r\\nJournaling (tulis apa yang kamu syukuri dan rasakan).\\r\\nHobi Kreatif (gambar, masak, main musik, DIY).\\r\\nHabiskan Waktu dengan Teman atau Keluarga.\\r\\nPraktik Mindfulness (fokus pada hal-hal kecil, seperti rasa makanan, suara sekitar).\\r\\nBatasi Gadget Sebelum Tidur agar kualitas tidur lebih baik.\",\"is_public\":true}}', NULL, '2025-08-25 00:58:58', '2025-08-25 00:58:58'),
(495, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-25 00:58:58', '2025-08-25 00:58:58'),
(496, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-25 01:56:21', '2025-08-25 01:56:21'),
(497, 'default', 'created', 'App\\Models\\UserProgress', 'created', 96, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 01:57:29', '2025-08-25 01:57:29'),
(498, 'default', 'created', 'App\\Models\\Like', 'created', 111, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":5,\"user_id\":46}}', NULL, '2025-08-25 01:59:25', '2025-08-25 01:59:25'),
(499, 'default', 'created', 'App\\Models\\Komentar', 'created', 81, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":5,\"user_id\":46,\"isi_komentar\":\"Materi ini suka banget walaupun berbentuk pdf tetapi ada visual nya yaitu gambar yang bisa memberikan pemahaman lebih dalam, ilmu ini juga bagus untuk diterapkan pada kehidupan sehari-hari dalam menjaga pola hidup sehat\",\"balasan_admin\":null}}', NULL, '2025-08-25 02:00:33', '2025-08-25 02:00:33'),
(500, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 02:32:11', '2025-08-25 02:32:11'),
(501, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 02:47:31', '2025-08-25 02:47:31'),
(502, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 02:47:31', '2025-08-25 02:47:31'),
(503, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 02:52:50', '2025-08-25 02:52:50'),
(504, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 03:40:26', '2025-08-25 03:40:26'),
(505, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 03:40:32', '2025-08-25 03:40:32'),
(506, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 03:40:47', '2025-08-25 03:40:47'),
(507, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 03:40:47', '2025-08-25 03:40:47'),
(508, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 03:48:15', '2025-08-25 03:48:15'),
(509, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 03:48:15', '2025-08-25 03:48:15'),
(510, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 03:51:40', '2025-08-25 03:51:40'),
(511, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 03:51:40', '2025-08-25 03:51:40'),
(512, 'default', 'created', 'App\\Models\\ZoomRoom', 'created', 2, 'App\\Models\\User', 20, '{\"attributes\":{\"judul\":\"Harmoni Tubuh: Langkah Harmonis Menjaga Kesehatan Payudara\",\"deskripsi\":\"Merawat payudara merupakan sebuah bentuk seni mencintai diri sendiri, sebuah investasi tak ternilai bagi masa depan setiap wanita. Ini bukan sekadar tentang menghindari penyakit, melainkan tentang membangun hubungan yang harmonis dengan tubuh, mengenali setiap sinyal dan perubahannya melalui deteksi dini yang cermat. Dengan pengetahuan yang tepat dan kepedulian yang tulus, kita mengubah ketakutan menjadi sebuah aksi pemberdayaan, memastikan bahwa aset paling berharga ini senantiasa terjaga demi meraih kehidupan yang lebih sehat, percaya diri, dan berkualitas.\",\"link_meeting\":\"https:\\/\\/us05web.zoom.us\\/j\\/82720895547?pwd=JdY11zzZeZHN8Y8qiCndnyJFXImmeJ.1\",\"jadwal\":\"2025-08-25 18:30:00\",\"created_by\":20,\"meeting_id\":\"82720895547\",\"passcode\":\"687251\"}}', NULL, '2025-08-25 04:06:01', '2025-08-25 04:06:01'),
(513, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 04:14:22', '2025-08-25 04:14:22'),
(514, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-25 04:14:34', '2025-08-25 04:14:34'),
(515, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-25 04:14:57', '2025-08-25 04:14:57'),
(516, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-25 04:15:05', '2025-08-25 04:15:05'),
(517, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 04:15:26', '2025-08-25 04:15:26'),
(518, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 04:15:39', '2025-08-25 04:15:39'),
(519, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-25 04:15:59', '2025-08-25 04:15:59'),
(520, 'default', 'created', 'App\\Models\\UserProgress', 'created', 97, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:18:09', '2025-08-25 04:18:09'),
(521, 'default', 'User logged in', 'App\\Models\\User', NULL, 62, 'App\\Models\\User', 62, '[]', NULL, '2025-08-25 04:21:59', '2025-08-25 04:21:59'),
(522, 'default', 'created', 'App\\Models\\UserProgress', 'created', 98, 'App\\Models\\User', 62, '{\"attributes\":{\"user_id\":62,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:22:08', '2025-08-25 04:22:08'),
(523, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 04:22:12', '2025-08-25 04:22:12'),
(524, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 04:22:12', '2025-08-25 04:22:12'),
(525, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-25 04:25:26', '2025-08-25 04:25:26'),
(526, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 04:26:00', '2025-08-25 04:26:00'),
(527, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 04:26:00', '2025-08-25 04:26:00'),
(528, 'default', 'created', 'App\\Models\\UserProgress', 'created', 99, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:26:20', '2025-08-25 04:26:20'),
(529, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 37, 'App\\Models\\User', 46, '{\"old\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:27:26', '2025-08-25 04:27:26'),
(530, 'default', 'created', 'App\\Models\\UserProgress', 'created', 100, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:27:36', '2025-08-25 04:27:36'),
(531, 'default', 'created', 'App\\Models\\Like', 'created', 112, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:27:38', '2025-08-25 04:27:38'),
(532, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 112, 'App\\Models\\User', 46, '{\"old\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:33:24', '2025-08-25 04:33:24'),
(533, 'default', 'created', 'App\\Models\\Like', 'created', 113, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:33:27', '2025-08-25 04:33:27'),
(534, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 113, 'App\\Models\\User', 46, '{\"old\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:33:32', '2025-08-25 04:33:32'),
(535, 'default', 'created', 'App\\Models\\Like', 'created', 114, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-25 04:33:35', '2025-08-25 04:33:35'),
(536, 'default', 'created', 'App\\Models\\Komentar', 'created', 82, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46,\"isi_komentar\":\"bagus banget sebagai generasi muda materi ini bagus banget untuk mengedukasi pelajar \\ud83d\\ude4c\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-25 04:34:25', '2025-08-25 04:34:25'),
(537, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-25 04:34:46', '2025-08-25 04:34:46'),
(538, 'default', 'created', 'App\\Models\\UserProgress', 'created', 101, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:35:00', '2025-08-25 04:35:00'),
(539, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 04:35:02', '2025-08-25 04:35:02'),
(540, 'default', 'created', 'App\\Models\\UserProgress', 'created', 102, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:35:09', '2025-08-25 04:35:09'),
(541, 'default', 'created', 'App\\Models\\UserProgress', 'created', 103, 'App\\Models\\User', 62, '{\"attributes\":{\"user_id\":62,\"content_type\":\"zoom_room\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:35:26', '2025-08-25 04:35:26'),
(542, 'default', 'User logged in', 'App\\Models\\User', NULL, 56, 'App\\Models\\User', 56, '[]', NULL, '2025-08-25 04:37:00', '2025-08-25 04:37:00'),
(543, 'default', 'created', 'App\\Models\\UserProgress', 'created', 104, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:37:36', '2025-08-25 04:37:36'),
(544, 'default', 'created', 'App\\Models\\UserProgress', 'created', 105, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"zoom_room\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:37:44', '2025-08-25 04:37:44'),
(545, 'default', 'User logged in', 'App\\Models\\User', NULL, 25, 'App\\Models\\User', 25, '[]', NULL, '2025-08-25 04:38:22', '2025-08-25 04:38:22'),
(546, 'default', 'created', 'App\\Models\\UserProgress', 'created', 106, 'App\\Models\\User', 25, '{\"attributes\":{\"user_id\":25,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:38:55', '2025-08-25 04:38:55'),
(547, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-25 04:39:13', '2025-08-25 04:39:13'),
(548, 'default', 'created', 'App\\Models\\UserProgress', 'created', 107, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"zoom_room\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:39:18', '2025-08-25 04:39:18'),
(549, 'default', 'created', 'App\\Models\\UserProgress', 'created', 108, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:39:23', '2025-08-25 04:39:23'),
(550, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-25 04:40:00', '2025-08-25 04:40:00'),
(551, 'default', 'created', 'App\\Models\\User', 'created', 87, NULL, NULL, '{\"attributes\":{\"name\":\"Angelia Shafira Harun\",\"email\":\"liamulyati899@gmail.com\",\"password\":\"$2y$12$i8UMcHaOonINRoB73FyJzOE8BmLq4kV1FZNTF1hSRD9eHCtMw2u5.\"}}', NULL, '2025-08-25 04:40:15', '2025-08-25 04:40:15'),
(552, 'default', 'created', 'App\\Models\\UserProgress', 'created', 109, 'App\\Models\\User', 87, '{\"attributes\":{\"user_id\":87,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:40:31', '2025-08-25 04:40:31'),
(553, 'default', 'User logged in', 'App\\Models\\User', NULL, 87, 'App\\Models\\User', 87, '[]', NULL, '2025-08-25 04:43:28', '2025-08-25 04:43:28'),
(554, 'default', 'created', 'App\\Models\\User', 'created', 88, NULL, NULL, '{\"attributes\":{\"name\":\"Cicin Rahmawati\",\"email\":\"cicinrahmawati75@gmail.com\",\"password\":\"$2y$12$Bbcs2itqQqtECeMn.JjSGegvRxNhuNTBFQQyWKbPEKHCFp8tHjC3m\"}}', NULL, '2025-08-25 04:44:20', '2025-08-25 04:44:20'),
(555, 'default', 'created', 'App\\Models\\UserProgress', 'created', 110, 'App\\Models\\User', 88, '{\"attributes\":{\"user_id\":88,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:44:32', '2025-08-25 04:44:32'),
(556, 'default', 'User logged in', 'App\\Models\\User', NULL, 65, 'App\\Models\\User', 65, '[]', NULL, '2025-08-25 04:44:49', '2025-08-25 04:44:49'),
(557, 'default', 'created', 'App\\Models\\UserProgress', 'created', 111, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:44:56', '2025-08-25 04:44:56'),
(558, 'default', 'created', 'App\\Models\\UserProgress', 'created', 112, 'App\\Models\\User', 88, '{\"attributes\":{\"user_id\":88,\"content_type\":\"zoom_room\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:45:52', '2025-08-25 04:45:52'),
(559, 'default', 'User logged in', 'App\\Models\\User', NULL, 85, 'App\\Models\\User', 85, '[]', NULL, '2025-08-25 04:48:49', '2025-08-25 04:48:49'),
(560, 'default', 'created', 'App\\Models\\UserProgress', 'created', 113, 'App\\Models\\User', 85, '{\"attributes\":{\"user_id\":85,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:49:32', '2025-08-25 04:49:32'),
(561, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 04:56:55', '2025-08-25 04:56:55'),
(562, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 04:57:26', '2025-08-25 04:57:26'),
(563, 'default', 'created', 'App\\Models\\UserProgress', 'created', 114, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"content_type\":\"zoom_room\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:57:42', '2025-08-25 04:57:42'),
(564, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 04:57:44', '2025-08-25 04:57:44'),
(565, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-25 04:57:57', '2025-08-25 04:57:57'),
(566, 'default', 'created', 'App\\Models\\UserProgress', 'created', 115, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 04:58:01', '2025-08-25 04:58:01'),
(567, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 05:06:53', '2025-08-25 05:06:53'),
(568, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 05:07:09', '2025-08-25 05:07:09'),
(569, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 05:07:09', '2025-08-25 05:07:09'),
(570, 'default', 'created', 'App\\Models\\Materi', 'created', 17, 'App\\Models\\User', 20, '{\"attributes\":{\"judul\":\"RANCANG BANGUN APLIKASI DASHBOARD MONITORING MBKM DI UNIVERSITAS BALE BANDUNG\",\"slug\":\"rancang-bangun-aplikasi-dashboard-monitoring-mbkm-di-universitas-bale-bandung\",\"kategori\":\"narkoba\",\"deskripsi\":\"tes materi\",\"sumber\":\"Germas, Kemenkes\",\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/ZdZacbiCKL6dKoO4OTM3kCGpp3OpFteQatODnurD.pdf\"}}', NULL, '2025-08-25 05:08:46', '2025-08-25 05:08:46'),
(571, 'default', 'deleted', 'App\\Models\\Materi', 'deleted', 17, 'App\\Models\\User', 20, '{\"old\":{\"judul\":\"RANCANG BANGUN APLIKASI DASHBOARD MONITORING MBKM DI UNIVERSITAS BALE BANDUNG\",\"slug\":\"rancang-bangun-aplikasi-dashboard-monitoring-mbkm-di-universitas-bale-bandung\",\"kategori\":\"narkoba\",\"deskripsi\":\"tes materi\",\"sumber\":\"Germas, Kemenkes\",\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/ZdZacbiCKL6dKoO4OTM3kCGpp3OpFteQatODnurD.pdf\"}}', NULL, '2025-08-25 05:08:54', '2025-08-25 05:08:54'),
(572, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 05:10:30', '2025-08-25 05:10:30'),
(573, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 14, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 05:10:42', '2025-08-25 05:10:42'),
(574, 'default', 'User logged in', 'App\\Models\\User', NULL, 33, 'App\\Models\\User', 33, '[]', NULL, '2025-08-25 05:12:39', '2025-08-25 05:12:39'),
(575, 'default', 'created', 'App\\Models\\UserProgress', 'created', 116, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 05:12:49', '2025-08-25 05:12:49'),
(576, 'default', 'User logged in', 'App\\Models\\User', NULL, 22, 'App\\Models\\User', 22, '[]', NULL, '2025-08-25 05:13:28', '2025-08-25 05:13:28'),
(577, 'default', 'created', 'App\\Models\\UserProgress', 'created', 117, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"zoom_detail_viewed\",\"content_id\":2,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 05:13:58', '2025-08-25 05:13:58'),
(578, 'default', 'created', 'App\\Models\\UserProgress', 'created', 118, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 05:27:32', '2025-08-25 05:27:32'),
(579, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 05:29:48', '2025-08-25 05:29:48'),
(580, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 39, 'App\\Models\\User', 33, '{\"old\":{\"materi_id\":11,\"user_id\":33}}', NULL, '2025-08-25 05:37:37', '2025-08-25 05:37:37'),
(581, 'default', 'created', 'App\\Models\\Like', 'created', 115, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":11,\"user_id\":33}}', NULL, '2025-08-25 05:37:40', '2025-08-25 05:37:40'),
(582, 'default', 'created', 'App\\Models\\Materi', 'created', 21, 'App\\Models\\User', 82, '{\"attributes\":{\"judul\":\"Perawatan Kesehatan Payudara\",\"slug\":\"perawatan-kesehatan-payudara\",\"kategori\":\"reproduksi\",\"deskripsi\":null,\"sumber\":null,\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/4bkrYzPtQGgStCbGljtxNJDQ1KxAWMbXK5xxmnQD.pptx\"}}', NULL, '2025-08-25 05:38:35', '2025-08-25 05:38:35'),
(583, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 05:54:40', '2025-08-25 05:54:40'),
(584, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 05:54:40', '2025-08-25 05:54:40'),
(585, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:13:34', '2025-08-25 06:13:34'),
(586, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:13:43', '2025-08-25 06:13:43'),
(587, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:13:43', '2025-08-25 06:13:43'),
(588, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:32:34', '2025-08-25 06:32:34'),
(589, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:32:46', '2025-08-25 06:32:46'),
(590, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 06:32:46', '2025-08-25 06:32:46'),
(591, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 17:09:18', '2025-08-25 17:09:18'),
(592, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 17:09:18', '2025-08-25 17:09:18'),
(593, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 17:43:21', '2025-08-25 17:43:21'),
(594, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 17:43:35', '2025-08-25 17:43:35'),
(595, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 55, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"materi_id\":21}}', NULL, '2025-08-25 18:36:01', '2025-08-25 18:36:01'),
(596, 'default', 'created', 'App\\Models\\UserProgress', 'created', 119, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"content_type\":\"materi_pdf\",\"content_id\":21,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 18:36:01', '2025-08-25 18:36:01'),
(597, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 18:39:26', '2025-08-25 18:39:26'),
(598, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 18:39:40', '2025-08-25 18:39:40'),
(599, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 18:39:40', '2025-08-25 18:39:40');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(600, 'default', 'created', 'App\\Models\\Materi', 'created', 22, 'App\\Models\\User', 20, '{\"attributes\":{\"judul\":\"tes materi\",\"slug\":\"tes-materi\",\"kategori\":\"pola_hidup_sehat\",\"deskripsi\":\"tes aja\",\"sumber\":\"Germas, Kemenkes\",\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/a2Ef2R9x4jQ7aEsWUtAwnmCGOm0hxtprewqR6TvS.pptx\"}}', NULL, '2025-08-25 18:41:25', '2025-08-25 18:41:25'),
(601, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 18:41:34', '2025-08-25 18:41:34'),
(602, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 18:41:46', '2025-08-25 18:41:46'),
(603, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 56, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"materi_id\":22}}', NULL, '2025-08-25 18:42:00', '2025-08-25 18:42:00'),
(604, 'default', 'created', 'App\\Models\\UserProgress', 'created', 120, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"content_type\":\"materi_pdf\",\"content_id\":22,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 18:42:00', '2025-08-25 18:42:00'),
(605, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 18:42:37', '2025-08-25 18:42:37'),
(606, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 18:42:51', '2025-08-25 18:42:51'),
(607, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 18:42:51', '2025-08-25 18:42:51'),
(608, 'default', 'deleted', 'App\\Models\\Materi', 'deleted', 22, 'App\\Models\\User', 20, '{\"old\":{\"judul\":\"tes materi\",\"slug\":\"tes-materi\",\"kategori\":\"pola_hidup_sehat\",\"deskripsi\":\"tes aja\",\"sumber\":\"Germas, Kemenkes\",\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/a2Ef2R9x4jQ7aEsWUtAwnmCGOm0hxtprewqR6TvS.pptx\"}}', NULL, '2025-08-25 18:43:00', '2025-08-25 18:43:00'),
(609, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-25 20:05:44', '2025-08-25 20:05:44'),
(610, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-25 21:13:50', '2025-08-25 21:13:50'),
(611, 'default', 'User logged in', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-26 02:58:43', '2025-08-26 02:58:43'),
(612, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-26 05:41:55', '2025-08-26 05:41:55'),
(613, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-26 05:41:55', '2025-08-26 05:41:55'),
(614, 'default', 'created', 'App\\Models\\User', 'created', 89, NULL, NULL, '{\"attributes\":{\"name\":\"Agus waringin\",\"email\":\"awsajah07@gmail.com\",\"password\":\"$2y$12$a.Hxy6\\/E2c1PGjIPEKLE0.bsH8DWfDsMHZkehmtlzfSMJRDKp3oDu\"}}', NULL, '2025-08-26 19:03:26', '2025-08-26 19:03:26'),
(615, 'default', 'created', 'App\\Models\\User', 'created', 90, NULL, NULL, '{\"attributes\":{\"name\":\"Fitri Apriliantini\",\"email\":\"fitriapril928@gmail.com\",\"password\":\"$2y$12$dQeMRBEj2EKGV6\\/I01DNru3zaNOkfvzLO36eJ0E.8MJVxwPP0MWEa\"}}', NULL, '2025-08-26 19:03:27', '2025-08-26 19:03:27'),
(616, 'default', 'created', 'App\\Models\\User', 'created', 91, NULL, NULL, '{\"attributes\":{\"name\":\"Aan Nuraeni\",\"email\":\"aannuraeni0606@gmail.com\",\"password\":\"$2y$12$5cAvOsYvhP3e20f70ZWfEOHLIg9UKgfRfsgVC7qIXA7.bMoGc043G\"}}', NULL, '2025-08-26 19:03:38', '2025-08-26 19:03:38'),
(617, 'default', 'created', 'App\\Models\\User', 'created', 92, NULL, NULL, '{\"attributes\":{\"name\":\"Nani Nuraeni\",\"email\":\"naninuraeni603@gmail.com\",\"password\":\"$2y$12$XEdtVVRYI2v1Vq8Zs68Vg.FMbkiVjDwIXrY8WUmOp1ko4gaplRU2m\"}}', NULL, '2025-08-26 19:04:23', '2025-08-26 19:04:23'),
(618, 'default', 'created', 'App\\Models\\User', 'created', 93, NULL, NULL, '{\"attributes\":{\"name\":\"Rahmat\",\"email\":\"rahmat83hidayatop@gmail.com\",\"password\":\"$2y$12$RHHNdB067ml5n.LbGfHIg.vKA.sGgY4lkYXf.AzdKeBFyC8yhsHbC\"}}', NULL, '2025-08-26 19:04:31', '2025-08-26 19:04:31'),
(619, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-26 19:04:35', '2025-08-26 19:04:35'),
(620, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-26 19:04:42', '2025-08-26 19:04:42'),
(621, 'default', 'created', 'App\\Models\\User', 'created', 94, NULL, NULL, '{\"attributes\":{\"name\":\"Iwan syarifudin\",\"email\":\"iwansyarifudin1979@gmail.com\",\"password\":\"$2y$12$8XU00eFXkJiNyWr1REpZHObn3YDSUgbXVlZRQFMdL.XNxTm2o\\/JVW\"}}', NULL, '2025-08-26 19:04:50', '2025-08-26 19:04:50'),
(622, 'default', 'created', 'App\\Models\\User', 'created', 95, NULL, NULL, '{\"attributes\":{\"name\":\"ANDRI ALBADRI\",\"email\":\"andrialbadri4@gmail.com\",\"password\":\"$2y$12$0\\/juIQgNvkSUnjh29lQvfuRkf7XW3rdvw1nAc5U97nTCQ3Hny09fO\"}}', NULL, '2025-08-26 19:05:34', '2025-08-26 19:05:34'),
(623, 'default', 'created', 'App\\Models\\UserProgress', 'created', 121, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:06:19', '2025-08-26 19:06:19'),
(624, 'default', 'created', 'App\\Models\\UserProgress', 'created', 122, 'App\\Models\\User', 93, '{\"attributes\":{\"user_id\":93,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:06:20', '2025-08-26 19:06:20'),
(625, 'default', 'created', 'App\\Models\\UserProgress', 'created', 123, 'App\\Models\\User', 90, '{\"attributes\":{\"user_id\":90,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:06:21', '2025-08-26 19:06:21'),
(626, 'default', 'created', 'App\\Models\\UserProgress', 'created', 124, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:06:33', '2025-08-26 19:06:33'),
(627, 'default', 'created', 'App\\Models\\User', 'created', 96, NULL, NULL, '{\"attributes\":{\"name\":\"Dodi Setia Budi\",\"email\":\"dodisetiabudi20@gmail.com\",\"password\":\"$2y$12$ZNvg7ZtuvW40srBVweL8ZuhMyTOetfzEvQGpPYpzJCDQhPNwKKibO\"}}', NULL, '2025-08-26 19:08:35', '2025-08-26 19:08:35'),
(628, 'default', 'created', 'App\\Models\\UserProgress', 'created', 125, 'App\\Models\\User', 96, '{\"attributes\":{\"user_id\":96,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:09:01', '2025-08-26 19:09:01'),
(629, 'default', 'created', 'App\\Models\\User', 'created', 97, NULL, NULL, '{\"attributes\":{\"name\":\"Hera Hermawan\",\"email\":\"herahermawan258@gmail.com\",\"password\":\"$2y$12$JRZAuo6upm3XQCfefaqCLOuVfrzlEj1HaEV\\/\\/zrnbRO7i9RxhcER.\"}}', NULL, '2025-08-26 19:09:18', '2025-08-26 19:09:18'),
(630, 'default', 'created', 'App\\Models\\UserProgress', 'created', 126, 'App\\Models\\User', 90, '{\"attributes\":{\"user_id\":90,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:10:30', '2025-08-26 19:10:30'),
(631, 'default', 'created', 'App\\Models\\Like', 'created', 116, 'App\\Models\\User', 95, '{\"attributes\":{\"materi_id\":13,\"user_id\":95}}', NULL, '2025-08-26 19:11:47', '2025-08-26 19:11:47'),
(632, 'default', 'created', 'App\\Models\\Like', 'created', 117, 'App\\Models\\User', 95, '{\"attributes\":{\"materi_id\":21,\"user_id\":95}}', NULL, '2025-08-26 19:14:00', '2025-08-26 19:14:00'),
(633, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-26 19:19:07', '2025-08-26 19:19:07'),
(634, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-26 19:19:52', '2025-08-26 19:19:52'),
(635, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-26 19:19:52', '2025-08-26 19:19:52'),
(636, 'default', 'created', 'App\\Models\\UserProgress', 'created', 127, 'App\\Models\\User', 91, '{\"attributes\":{\"user_id\":91,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:20:45', '2025-08-26 19:20:45'),
(637, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 57, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":21}}', NULL, '2025-08-26 19:21:01', '2025-08-26 19:21:01'),
(638, 'default', 'created', 'App\\Models\\UserProgress', 'created', 128, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":21,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:21:01', '2025-08-26 19:21:01'),
(639, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 58, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":15}}', NULL, '2025-08-26 19:21:12', '2025-08-26 19:21:12'),
(640, 'default', 'created', 'App\\Models\\UserProgress', 'created', 129, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:21:12', '2025-08-26 19:21:12'),
(641, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 59, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"materi_id\":21}}', NULL, '2025-08-26 19:21:14', '2025-08-26 19:21:14'),
(642, 'default', 'created', 'App\\Models\\UserProgress', 'created', 130, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"content_type\":\"materi_pdf\",\"content_id\":21,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:21:14', '2025-08-26 19:21:14'),
(643, 'default', 'created', 'App\\Models\\UserProgress', 'created', 131, 'App\\Models\\User', 91, '{\"attributes\":{\"user_id\":91,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:21:15', '2025-08-26 19:21:15'),
(644, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 60, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":15}}', NULL, '2025-08-26 19:21:15', '2025-08-26 19:21:15'),
(645, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 61, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"materi_id\":21}}', NULL, '2025-08-26 19:21:27', '2025-08-26 19:21:27'),
(646, 'default', 'created', 'App\\Models\\UserProgress', 'created', 132, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:21:53', '2025-08-26 19:21:53'),
(647, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 62, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":12}}', NULL, '2025-08-26 19:22:18', '2025-08-26 19:22:18'),
(648, 'default', 'created', 'App\\Models\\UserProgress', 'created', 133, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:22:18', '2025-08-26 19:22:18'),
(649, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 63, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"materi_id\":15}}', NULL, '2025-08-26 19:22:20', '2025-08-26 19:22:20'),
(650, 'default', 'created', 'App\\Models\\UserProgress', 'created', 134, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:22:20', '2025-08-26 19:22:20'),
(651, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 64, 'App\\Models\\User', 95, '{\"attributes\":{\"user_id\":95,\"materi_id\":15}}', NULL, '2025-08-26 19:22:27', '2025-08-26 19:22:27'),
(652, 'default', 'created', 'App\\Models\\UserProgress', 'created', 135, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:22:30', '2025-08-26 19:22:30'),
(653, 'default', 'created', 'App\\Models\\UserProgress', 'created', 136, 'App\\Models\\User', 91, '{\"attributes\":{\"user_id\":91,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:22:40', '2025-08-26 19:22:40'),
(654, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 116, 'App\\Models\\User', 95, '{\"old\":{\"materi_id\":13,\"user_id\":95}}', NULL, '2025-08-26 19:22:44', '2025-08-26 19:22:44'),
(655, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 65, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":10}}', NULL, '2025-08-26 19:22:47', '2025-08-26 19:22:47'),
(656, 'default', 'created', 'App\\Models\\UserProgress', 'created', 137, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:22:47', '2025-08-26 19:22:47'),
(657, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 66, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":10}}', NULL, '2025-08-26 19:22:51', '2025-08-26 19:22:51'),
(658, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 67, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":5}}', NULL, '2025-08-26 19:23:00', '2025-08-26 19:23:00'),
(659, 'default', 'created', 'App\\Models\\UserProgress', 'created', 138, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:23:00', '2025-08-26 19:23:00'),
(660, 'default', 'created', 'App\\Models\\UserProgress', 'created', 139, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:23:15', '2025-08-26 19:23:15'),
(661, 'default', 'created', 'App\\Models\\ZoomRoom', 'created', 3, 'App\\Models\\User', 82, '{\"attributes\":{\"judul\":\"narkoba\",\"deskripsi\":null,\"link_meeting\":\"https:\\/\\/us06web.zoom.us\\/j\\/84555277578?pwd=9aG3L2o6vVXGFCpn5HcuTR5UwZm7N3.1\",\"jadwal\":\"2025-08-28 09:23:00\",\"created_by\":82,\"meeting_id\":\"84555277578\",\"passcode\":\"436165\"}}', NULL, '2025-08-26 19:23:19', '2025-08-26 19:23:19'),
(662, 'default', 'created', 'App\\Models\\Komentar', 'created', 83, 'App\\Models\\User', 95, '{\"attributes\":{\"materi_id\":13,\"user_id\":95,\"isi_komentar\":\"Konten kesehatan yg luar biasa\",\"balasan_admin\":null}}', NULL, '2025-08-26 19:23:23', '2025-08-26 19:23:23'),
(663, 'default', 'created', 'App\\Models\\UserProgress', 'created', 140, 'App\\Models\\User', 94, '{\"attributes\":{\"user_id\":94,\"content_type\":\"zoom_detail_viewed\",\"content_id\":3,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:23:52', '2025-08-26 19:23:52'),
(664, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 68, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":8}}', NULL, '2025-08-26 19:24:09', '2025-08-26 19:24:09'),
(665, 'default', 'created', 'App\\Models\\UserProgress', 'created', 141, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:24:09', '2025-08-26 19:24:09'),
(666, 'default', 'created', 'App\\Models\\UserProgress', 'created', 142, 'App\\Models\\User', 91, '{\"attributes\":{\"user_id\":91,\"content_type\":\"zoom_detail_viewed\",\"content_id\":3,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:24:13', '2025-08-26 19:24:13'),
(667, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 69, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"materi_id\":8}}', NULL, '2025-08-26 19:24:14', '2025-08-26 19:24:14'),
(668, 'default', 'created', 'App\\Models\\UserProgress', 'created', 143, 'App\\Models\\User', 90, '{\"attributes\":{\"user_id\":90,\"content_type\":\"zoom_detail_viewed\",\"content_id\":3,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:24:27', '2025-08-26 19:24:27'),
(669, 'default', 'created', 'App\\Models\\UserProgress', 'created', 144, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:24:28', '2025-08-26 19:24:28'),
(670, 'default', 'created', 'App\\Models\\UserProgress', 'created', 145, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"content_type\":\"zoom_detail_viewed\",\"content_id\":3,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-26 19:25:18', '2025-08-26 19:25:18'),
(671, 'default', 'created', 'App\\Models\\Consultation', 'created', 16, 'App\\Models\\User', 89, '{\"attributes\":{\"user_id\":89,\"category_id\":13,\"title\":\"Program Makan Bergizi Gratis\",\"description\":\"Kegiatan rutin\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-26 19:30:15', '2025-08-26 19:30:15'),
(672, 'default', 'User logged out', 'App\\Models\\User', NULL, 89, 'App\\Models\\User', 89, '[]', NULL, '2025-08-26 19:31:40', '2025-08-26 19:31:40'),
(673, 'default', 'User logged in', 'App\\Models\\User', NULL, 89, 'App\\Models\\User', 89, '[]', NULL, '2025-08-26 19:31:55', '2025-08-26 19:31:55'),
(674, 'default', 'User logged out', 'App\\Models\\User', NULL, 95, 'App\\Models\\User', 95, '[]', NULL, '2025-08-26 19:32:27', '2025-08-26 19:32:27'),
(675, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-28 21:31:47', '2025-08-28 21:31:47'),
(676, 'default', 'created', 'App\\Models\\Like', 'created', 118, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":12,\"user_id\":46}}', NULL, '2025-08-28 21:34:02', '2025-08-28 21:34:02'),
(677, 'default', 'created', 'App\\Models\\Like', 'created', 119, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":8,\"user_id\":46}}', NULL, '2025-08-28 21:34:56', '2025-08-28 21:34:56'),
(678, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-30 02:08:30', '2025-08-30 02:08:30'),
(680, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-30 02:42:55', '2025-08-30 02:42:55'),
(681, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-30 02:42:55', '2025-08-30 02:42:55'),
(682, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-30 02:46:09', '2025-08-30 02:46:09');

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

--
-- Dumping data untuk tabel `consultations`
--

INSERT INTO `consultations` (`id`, `user_id`, `category_id`, `title`, `description`, `priority`, `status`, `resolved_at`, `created_at`, `updated_at`) VALUES
(8, 5, 1, 'menjaga daya tahan tubuh', 'bagaimana cara menjaga daya tahan tubuh supaya tidak mudah sakit?', 'low', 'selesai', NULL, '2025-08-19 05:55:37', '2025-08-19 05:59:27'),
(10, 22, 1, 'CARA BIAR BISA MENJAGA POLA HIDUP SEHAT', 'pengen bisa jaga pola hidup sehat, pengen juga makan makanan yg seimbang, tapi kadang susah bgt nahan kalau pengen jajan seblak, gorengan, makanan pedas dan berminyak, sama makanan manis gtu. gimana ya caranya biar bisaa konsistennn ngejaga pola hidup yg sehat, karena olahraga juga kadang kadang aja', 'low', 'selesai', NULL, '2025-08-22 03:08:20', '2025-08-25 00:25:24'),
(11, 65, 1, 'Sehat bersama:pentingnya konsultasi rutin', 'Banyak orang sering mengabaikan pemeriksaan kesehatan secara berkala karena merasa masih sehat atau tidak merasakan gejala tertentu. Padahal, penyakit sering muncul tanpa tanda awal yang jelas, sehingga baru diketahui saat sudah parah. Dengan melakukan konsultasi rutin, kita bisa mendeteksi masalah kesehatan lebih dini, mencegah penyakit kronis, serta menjaga pola hidup yang lebih seimbang. Konsultasi rutin juga membantu mengatasi kebingungan masyarakat terkait pola makan, aktivitas fisik, manajemen stres, hingga cara menjaga imun tubuh.', 'medium', 'selesai', NULL, '2025-08-22 03:22:35', '2025-08-25 00:25:54'),
(12, 24, 1, 'Kebutuhan Gizi Ideal untuk Remaja', 'Sebenarnya berapa Kebutuhan kalori, protein, vitamin, dan mineral yang ideal untuk remaja setiap harinya? Dan apakah kebutuhan gizi antara laki laki dan perempuan itu berbeda?', 'low', 'selesai', NULL, '2025-08-22 16:39:34', '2025-08-25 00:54:33'),
(13, 48, 13, 'pola makan sehat untuk remaja', 'Saya ingin berkonsultasi mengenai pola makan sehat untuk remaja. Saat ini saya sering merasa cepat lelah dan kurang fokus saat belajar. Berat badan saya cenderung naik, tetapi nafsu makan juga sering tinggi. Saya ingin tahu menu makanan yang seimbang, berapa kali sebaiknya makan dalam sehari, serta makanan apa saja yang harus dihindari agar kesehatan tetap terjaga', 'low', 'selesai', NULL, '2025-08-22 16:43:07', '2025-08-25 00:54:45'),
(14, 63, 1, 'Pola Hidup Sehat untuk Remaja', 'sebagian siswa masih suka mengabaikan pola hidup sehat, misalnya sering kurang tidur, jarang olahraga, atau lebih memilih jajanan cepat saji daripada makanan bergizi. Hal ini bisa bikin tubuh cepat lelah, sulit fokus belajar, bahkan gampang sakit. Dengan memahami pola hidup sehat, diharapkan siswa bisa menjaga kondisi fisik dan mental. Bagaimana cara membiasakan diri untuk tidur cukup meski tugas sekolah sering menumpuk? Lalu Bagaimana cara mengatur waktu belajar, istirahat, dan aktivitas lain agar tubuh tetap fit?', 'low', 'selesai', NULL, '2025-08-24 00:50:43', '2025-08-25 05:10:42'),
(15, 63, 19, 'Kesehatan mental pada remaja', 'Banyak pelajar merasa mudah stres, cemas, atau terbebani dengan tugas sekolah dan masalah pribadi. Kadang bingung cara menenangkan diri, apalagi kalau tidak tahu harus cerita ke siapa. Padahal menjaga kesehatan mental sama pentingnya dengan menjaga kesehatan. Apa langkah yang bisa dilakukan kalau merasa cemas atau overthinking? Pertanyaan yg kedua  Bagaimana cara mengenali tanda-tanda kalau mental kita lagi nggak sehat? Dan Apa kegiatan sederhana yang bisa dilakukan remaja untuk menjaga mood tetap stabil?', 'medium', 'selesai', NULL, '2025-08-24 00:54:24', '2025-08-25 05:10:30'),
(16, 89, 13, 'Program Makan Bergizi Gratis', 'Kegiatan rutin', 'low', 'menunggu', NULL, '2025-08-26 19:30:15', '2025-08-26 19:30:15');

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

--
-- Dumping data untuk tabel `consultation_attachments`
--

INSERT INTO `consultation_attachments` (`id`, `consultation_id`, `response_id`, `file_name`, `file_path`, `file_type`, `file_size`, `original_name`, `created_at`, `updated_at`) VALUES
(2, 11, NULL, 'tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png', 'consultations/tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png', 'image/png', 316777, 'IMG_20250822_172115.png', '2025-08-22 03:22:35', '2025-08-22 03:22:35');

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
(20, 'Lainnya', 'Konsultasi kesehatan lainnya', '#6c757d', 1, '2025-08-13 15:51:32', '2025-08-13 15:51:32');

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

--
-- Dumping data untuk tabel `consultation_responses`
--

INSERT INTO `consultation_responses` (`id`, `consultation_id`, `user_id`, `is_responder`, `response`, `is_public`, `created_at`, `updated_at`) VALUES
(7, 8, 3, 1, 'Untuk menjaga daya tahan tubuh, usahakan makan bergizi seimbang, cukup tidur, rutin olahraga, minum air putih yang cukup, dan kelola stres dengan baik. Hindari begadang serta kebiasaan tidak sehat agar tubuh tetap fit dan tidak mudah sakit.', 1, '2025-08-19 05:56:26', '2025-08-19 05:56:26'),
(8, 8, 5, 0, 'berapa lama waktu tidur yang ideal agar tubuh tetap sehat dan tidak mudah lelah?', 1, '2025-08-19 05:57:44', '2025-08-19 05:57:44'),
(9, 8, 3, 1, 'Waktu tidur ideal untuk remaja dan dewasa adalah sekitar 7–9 jam per malam. Tidur cukup membantu tubuh memulihkan energi, menjaga daya tahan tubuh, dan membuat konsentrasi lebih baik di siang hari.', 1, '2025-08-19 05:58:07', '2025-08-19 05:58:07'),
(10, 13, 82, 1, 'Pola makan sehat untuk remaja sangat penting untuk mendukung pertumbuhan, energi, dan fokus. Berikut beberapa tips yang bisa kamu terapkan:\r\n\r\n*Menu Makanan Seimbang:*\r\n\r\n1. *Sarapan*: Mulai hari dengan sarapan yang seimbang, seperti oatmeal dengan buah dan kacang-kacangan, atau telur dengan roti gandum dan sayuran.\r\n2. *Makan Siang*: Pilih makanan yang kaya akan protein, karbohidrat kompleks, dan sayuran, seperti nasi merah dengan ayam panggang dan sayuran.\r\n3. *Makan Malam*: Makan malam yang ringan dan seimbang, seperti ikan dengan sayuran dan quinoa.\r\n4. *Camilan*: Pilih camilan yang sehat, seperti buah, kacang-kacangan, atau yogurt.\r\n\r\n*Frekuensi Makan:*\r\n\r\n1. *3-5 kali makan utama*: Sarapan, makan siang, makan malam, dan 2-3 kali camilan sehat.\r\n2. *Jangan melewatkan makan*: Pastikan kamu makan secara teratur untuk menjaga energi dan fokus.\r\n\r\n*Makanan yang Harus Dihindari:*\r\n\r\n1. *Makanan yang tinggi gula*: Batasi konsumsi makanan yang tinggi gula, seperti permen, minuman manis, dan kue-kue.\r\n2. *Makanan yang tinggi lemak*: Batasi konsumsi makanan yang tinggi lemak, seperti gorengan, makanan yang digoreng, dan makanan yang tinggi lemak jenuh.\r\n3. *Makanan yang tinggi sodium*: Batasi konsumsi makanan yang tinggi sodium, seperti makanan yang diasinkan, makanan yang diproses, dan makanan yang tinggi garam.\r\n\r\n*Tips Tambahan:*\r\n\r\n1. *Minum banyak air*: Pastikan kamu minum banyak air untuk menjaga hidrasi dan kesehatan tubuh.\r\n2. *Olahraga teratur*: Lakukan olahraga teratur untuk menjaga kesehatan tubuh dan meningkatkan energi.\r\n3. *Tidur yang cukup*: Pastikan kamu tidur yang cukup untuk menjaga kesehatan tubuh dan meningkatkan fokus.\r\n\r\nDengan menerapkan pola makan sehat dan tips di atas, kamu dapat meningkatkan energi, fokus, dan kesehatan tubuh. Jika kamu masih merasa lelah atau kurang fokus, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk mengetahui penyebabnya.', 1, '2025-08-23 06:26:23', '2025-08-23 06:26:23'),
(11, 12, 82, 1, 'Kebutuhan gizi remaja bervariasi tergantung pada usia, jenis kelamin, tingkat aktivitas fisik, dan faktor lainnya. Berikut adalah perkiraan kebutuhan gizi harian untuk remaja:\r\n\r\n*Kebutuhan Kalori:*\r\n\r\n- Remaja laki-laki (14-18 tahun): 2.200-3.200 kalori/hari\r\n- Remaja perempuan (14-18 tahun): 1.800-2.400 kalori/hari\r\n\r\n*Kebutuhan Protein:*\r\n\r\n- Remaja laki-laki (14-18 tahun): 52-60 gram/hari\r\n- Remaja perempuan (14-18 tahun): 46-50 gram/hari\r\n\r\n*Kebutuhan Vitamin dan Mineral:*\r\n\r\n- Vitamin C: 65-75 mg/hari\r\n- Vitamin D: 600-800 IU/hari\r\n- Kalsium: 1.300 mg/hari\r\n- Zat besi: 8-18 mg/hari (lebih tinggi untuk remaja perempuan)\r\n- Vitamin B12: 2,4-2,6 mcg/hari\r\n\r\n*Perbedaan Kebutuhan Gizi antara Laki-laki dan Perempuan:*\r\n\r\n- Remaja laki-laki umumnya membutuhkan lebih banyak kalori dan protein daripada remaja perempuan karena perbedaan tingkat metabolisme dan massa otot.\r\n- Remaja perempuan membutuhkan lebih banyak zat besi karena menstruasi dan kebutuhan reproduksi.\r\n- Kebutuhan kalsium dan vitamin D sama untuk kedua jenis kelamin karena pentingnya untuk pertumbuhan tulang.\r\n\r\nNamun, perlu diingat bahwa kebutuhan gizi individu dapat bervariasi tergantung pada faktor-faktor seperti tingkat aktivitas fisik, kondisi kesehatan, dan preferensi makanan. Oleh karena itu, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk menentukan kebutuhan gizi yang spesifik untuk setiap individu.', 1, '2025-08-23 06:27:42', '2025-08-23 06:27:42'),
(12, 11, 82, 1, 'Benar sekali! Pemeriksaan kesehatan secara berkala sangat penting untuk mendeteksi masalah kesehatan lebih dini dan mencegah penyakit kronis. Banyak penyakit tidak menunjukkan gejala awal yang jelas, sehingga pemeriksaan rutin dapat membantu mengidentifikasi masalah kesehatan sebelum menjadi parah.\r\n\r\nDengan melakukan konsultasi rutin, kita dapat:\r\n\r\n- Mendeteksi masalah kesehatan lebih dini\r\n- Mencegah penyakit kronis\r\n- Menjaga pola hidup yang lebih seimbang\r\n- Mengatasi kebingungan terkait pola makan, aktivitas fisik, manajemen stres, dan cara menjaga imun tubuh\r\n\r\nSelain itu, konsultasi rutin juga dapat membantu meningkatkan kesadaran dan pengetahuan tentang kesehatan, sehingga kita dapat membuat keputusan yang lebih tepat untuk menjaga kesehatan kita.\r\n\r\nJadi, sangat penting untuk melakukan pemeriksaan kesehatan secara berkala dan konsultasi rutin dengan dokter atau ahli kesehatan lainnya untuk menjaga kesehatan dan mencegah penyakit.', 1, '2025-08-23 06:29:17', '2025-08-23 06:29:17'),
(13, 10, 82, 1, 'Mengatur pola hidup sehat memang tidak mudah, terutama ketika ada godaan makanan yang lezat tapi tidak sehat. Berikut beberapa tips yang bisa membantu kamu menjaga pola hidup sehat dan konsisten:\r\n\r\n*Tips untuk Mengatur Pola Makan:*\r\n\r\n1. *Rencanakan makanan*: Buatlah rencana makanan untuk beberapa hari ke depan, sehingga kamu bisa mempersiapkan makanan yang seimbang dan sehat.\r\n2. *Siapkan makanan sehat*: Siapkan makanan sehat di rumah, seperti sayuran, buah, dan protein yang seimbang.\r\n3. *Kurangi godaan*: Jika kamu tahu bahwa kamu tidak bisa menahan godaan makanan tertentu, cobalah untuk menghindarinya atau mengurangi jumlahnya.\r\n4. *Cari alternatif*: Cari alternatif makanan yang lebih sehat untuk makanan yang kamu sukai, seperti seblak yang dibuat dengan bahan-bahan yang lebih sehat.\r\n\r\n*Tips untuk Mengatur Konsumsi Makanan Tidak Sehat:*\r\n\r\n1. *Izinkan diri*: Izinkan diri kamu untuk menikmati makanan tidak sehat dalam jumlah yang wajar dan tidak terlalu sering.\r\n2. *Pilih waktu yang tepat*: Pilih waktu yang tepat untuk menikmati makanan tidak sehat, seperti pada hari libur atau setelah olahraga.\r\n3. *Kontrol porsi*: Kontrol porsi makanan tidak sehat yang kamu konsumsi, sehingga kamu tidak terlalu banyak mengonsumsinya.\r\n\r\n*Tips untuk Meningkatkan Konsistensi:*\r\n\r\n1. *Buat tujuan*: Buat tujuan yang spesifik dan realistis untuk menjaga pola hidup sehat.\r\n2. *Cari dukungan*: Cari dukungan dari teman atau keluarga yang juga ingin menjaga pola hidup sehat.\r\n3. *Pantau progres*: Pantau progres kamu dan catat keberhasilan kamu dalam menjaga pola hidup sehat.\r\n4. *Jangan terlalu keras*: Jangan terlalu keras pada diri sendiri jika kamu gagal, tetapi cobalah untuk belajar dari kesalahan dan terus mencoba.\r\n\r\n*Tips untuk Meningkatkan Olahraga:*\r\n\r\n1. *Cari olahraga yang menyenangkan*: Cari olahraga yang menyenangkan dan sesuai dengan minat kamu.\r\n2. *Buat jadwal*: Buat jadwal olahraga yang realistis dan sesuai dengan gaya hidup kamu.\r\n3. *Mulai dari kecil*: Mulai dari olahraga yang ringan dan secara bertahap meningkatkan intensitas dan durasi.\r\n\r\nDengan mengikuti tips di atas, kamu bisa meningkatkan kemampuan kamu untuk menjaga pola hidup sehat dan konsisten. Ingat bahwa menjaga pola hidup sehat adalah proses yang berkelanjutan dan memerlukan kesabaran dan konsistensi.', 1, '2025-08-23 06:30:33', '2025-08-23 06:30:33'),
(14, 12, 24, 0, 'Baik terimakasih, jadi intinya kebutuhan gizi setiap individu itu berbeda tetapi ada standar gizi yang harus dipenuhi oleh remaja. Terimakasih sekali lagi atas jawabannya saya jadi tahu gizi yang diperlukan untuk remaja ☺️🙌🏻👍🏻', 1, '2025-08-24 18:34:42', '2025-08-24 18:34:42'),
(15, 14, 82, 1, '1. Cara Membiasakan Tidur Cukup Meski Tugas Menumpuk\r\nBuat Prioritas Tugas\r\nGunakan metode prioritas (Eisenhower Matrix):\r\nPenting & Mendesak → Kerjakan segera\r\nPenting & Tidak Mendesak → Jadwalkan\r\nTidak Penting → Kurangi atau hindari\r\nHindari Menunda Pekerjaan\r\nSelesaikan tugas di awal, jangan menunggu deadline agar tidak begadang.\r\nTetapkan Jam Tidur yang Konsisten\r\nMisalnya, target tidur 7–8 jam setiap malam. Usahakan tidur dan bangun di jam yang sama.\r\nKurangi Distraksi\r\nSimpan ponsel saat mengerjakan tugas dan sebelum tidur agar tidak terjebak scrolling media sosial.\r\nTeknik Pomodoro\r\nBelajar fokus 25 menit, istirahat 5 menit, ulangi 4 kali, lalu ambil istirahat lebih panjang (15–30 menit).\r\n2. Cara Mengatur Waktu Belajar, Istirahat, dan Aktivitas\r\nGunakan Jadwal Harian\r\nBuat tabel pagi–siang–sore–malam. Masukkan:\r\nWaktu belajar (pagi/sore, saat otak segar)\r\nIstirahat (5–10 menit setiap 1 jam belajar)\r\nAktivitas fisik (olahraga 20–30 menit minimal 3 kali seminggu)\r\nTidur cukup\r\nAtur Target Harian Kecil\r\nDaripada memaksakan banyak materi dalam 1 hari, pecah jadi bagian kecil (misalnya 2 bab/hari).\r\n\r\nHindari Multitasking\r\nFokus satu hal agar lebih cepat selesai dan tidak membuang energi.\r\nSeimbangkan dengan Me Time\r\nLakukan hobi ringan untuk menjaga mental tetap sehat.', 1, '2025-08-25 00:56:22', '2025-08-25 00:56:22'),
(16, 15, 82, 1, '1. Langkah yang Bisa Dilakukan Kalau Merasa Cemas atau Overthinking\r\nTarik Napas Dalam & Latihan Relaksasi\r\nCoba teknik 4-7-8: tarik napas 4 detik → tahan 7 detik → hembuskan 8 detik. Ulangi 3–5 kali.\r\nAlihkan Pikiran ke Aktivitas Positif\r\nDengarkan musik yang menenangkan, menulis jurnal, atau melakukan hobi.\r\nPisahkan Hal yang Bisa Dikendalikan & Tidak Bisa Dikendalikan\r\nFokus pada solusi yang ada di tangan kamu, bukan hal yang di luar kontrol.\r\nBatasi Overload Informasi\r\nKurangi konsumsi media sosial yang memicu perbandingan diri.\r\nCerita ke Orang yang Dipercaya\r\nBisa teman dekat, keluarga, atau guru BK. Jika butuh, jangan ragu mencari konselor.\r\n2. Cara Mengenali Tanda-Tanda Mental Tidak Sehat\r\nMudah Lelah & Sulit Fokus meski tidur cukup.\r\nPerubahan Pola Makan (terlalu banyak atau sedikit).\r\nTidur Tidak Teratur (insomnia atau terlalu banyak tidur).\r\nSering Merasa Sedih, Kosong, atau Mudah Marah.\r\nMenarik Diri dari Sosial (enggan ngobrol, malas ikut kegiatan).\r\nTurunnya Motivasi & Prestasi Belajar.\r\nSakit Fisik Tanpa Sebab Jelas (sakit kepala, perut).\r\nJika tanda ini terjadi lebih dari 2 minggu dan mengganggu aktivitas sehari-hari, itu sinyal kamu butuh bantuan.\r\n3. Kegiatan Sederhana untuk Menjaga Mood Tetap Stabil\r\nOlahraga Ringan (jalan kaki, stretching, senam → bisa 15–30 menit).\r\nMendengarkan Musik Favorit yang bikin rileks.\r\nJournaling (tulis apa yang kamu syukuri dan rasakan).\r\nHobi Kreatif (gambar, masak, main musik, DIY).\r\nHabiskan Waktu dengan Teman atau Keluarga.\r\nPraktik Mindfulness (fokus pada hal-hal kecil, seperti rasa makanan, suara sekitar).\r\nBatasi Gadget Sebelum Tidur agar kualitas tidur lebih baik.', 1, '2025-08-25 00:58:58', '2025-08-25 00:58:58');

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
(12, 5, 15, '2025-08-19 06:04:54', '2025-08-19 06:04:54'),
(13, 43, 15, '2025-08-19 16:46:06', '2025-08-19 16:46:06'),
(14, 43, 15, '2025-08-19 16:46:12', '2025-08-19 16:46:12'),
(15, 43, 5, '2025-08-19 17:01:56', '2025-08-19 17:01:56'),
(16, 24, 15, '2025-08-20 03:43:08', '2025-08-20 03:43:08'),
(17, 24, 12, '2025-08-20 03:43:18', '2025-08-20 03:43:18'),
(18, 24, 12, '2025-08-20 03:43:22', '2025-08-20 03:43:22'),
(19, 24, 12, '2025-08-20 03:43:29', '2025-08-20 03:43:29'),
(20, 24, 10, '2025-08-20 03:43:40', '2025-08-20 03:43:40'),
(21, 24, 10, '2025-08-20 03:43:45', '2025-08-20 03:43:45'),
(22, 24, 10, '2025-08-20 03:43:46', '2025-08-20 03:43:46'),
(23, 24, 10, '2025-08-20 03:43:48', '2025-08-20 03:43:48'),
(24, 24, 10, '2025-08-20 03:43:52', '2025-08-20 03:43:52'),
(25, 24, 10, '2025-08-20 03:43:52', '2025-08-20 03:43:52'),
(26, 24, 10, '2025-08-20 03:43:56', '2025-08-20 03:43:56'),
(27, 24, 10, '2025-08-20 03:43:58', '2025-08-20 03:43:58'),
(28, 24, 8, '2025-08-20 03:44:10', '2025-08-20 03:44:10'),
(29, 24, 5, '2025-08-20 03:44:20', '2025-08-20 03:44:20'),
(30, 22, 12, '2025-08-22 02:52:18', '2025-08-22 02:52:18'),
(31, 48, 12, '2025-08-22 02:54:35', '2025-08-22 02:54:35'),
(32, 48, 12, '2025-08-22 02:55:02', '2025-08-22 02:55:02'),
(33, 48, 5, '2025-08-22 03:01:04', '2025-08-22 03:01:04'),
(34, 65, 15, '2025-08-22 03:24:13', '2025-08-22 03:24:13'),
(35, 65, 15, '2025-08-22 03:24:20', '2025-08-22 03:24:20'),
(36, 65, 12, '2025-08-22 03:25:31', '2025-08-22 03:25:31'),
(37, 65, 10, '2025-08-22 03:30:05', '2025-08-22 03:30:05'),
(38, 65, 8, '2025-08-22 03:40:43', '2025-08-22 03:40:43'),
(39, 65, 5, '2025-08-22 03:40:55', '2025-08-22 03:40:55'),
(40, 24, 8, '2025-08-22 16:21:32', '2025-08-22 16:21:32'),
(41, 48, 15, '2025-08-22 16:44:23', '2025-08-22 16:44:23'),
(42, 48, 15, '2025-08-22 16:44:28', '2025-08-22 16:44:28'),
(43, 48, 8, '2025-08-22 16:48:59', '2025-08-22 16:48:59'),
(44, 48, 8, '2025-08-22 16:49:08', '2025-08-22 16:49:08'),
(45, 48, 10, '2025-08-22 16:52:30', '2025-08-22 16:52:30'),
(46, 48, 10, '2025-08-22 16:52:40', '2025-08-22 16:52:40'),
(47, 22, 5, '2025-08-23 04:36:04', '2025-08-23 04:36:04'),
(48, 63, 15, '2025-08-23 23:58:21', '2025-08-23 23:58:21'),
(49, 63, 15, '2025-08-23 23:58:26', '2025-08-23 23:58:26'),
(50, 63, 15, '2025-08-23 23:58:28', '2025-08-23 23:58:28'),
(51, 63, 15, '2025-08-23 23:59:00', '2025-08-23 23:59:00'),
(52, 63, 15, '2025-08-23 23:59:02', '2025-08-23 23:59:02'),
(53, 63, 5, '2025-08-24 00:14:12', '2025-08-24 00:14:12'),
(54, 63, 5, '2025-08-24 00:14:15', '2025-08-24 00:14:15'),
(55, 21, 21, '2025-08-25 18:36:01', '2025-08-25 18:36:01'),
(57, 89, 21, '2025-08-26 19:21:01', '2025-08-26 19:21:01'),
(58, 89, 15, '2025-08-26 19:21:12', '2025-08-26 19:21:12'),
(59, 95, 21, '2025-08-26 19:21:14', '2025-08-26 19:21:14'),
(60, 89, 15, '2025-08-26 19:21:15', '2025-08-26 19:21:15'),
(61, 95, 21, '2025-08-26 19:21:27', '2025-08-26 19:21:27'),
(62, 89, 12, '2025-08-26 19:22:18', '2025-08-26 19:22:18'),
(63, 95, 15, '2025-08-26 19:22:20', '2025-08-26 19:22:20'),
(64, 95, 15, '2025-08-26 19:22:27', '2025-08-26 19:22:27'),
(65, 89, 10, '2025-08-26 19:22:47', '2025-08-26 19:22:47'),
(66, 89, 10, '2025-08-26 19:22:51', '2025-08-26 19:22:51'),
(67, 89, 5, '2025-08-26 19:23:00', '2025-08-26 19:23:00'),
(68, 89, 8, '2025-08-26 19:24:09', '2025-08-26 19:24:09'),
(69, 89, 8, '2025-08-26 19:24:14', '2025-08-26 19:24:14');

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
-- Struktur dari tabel `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forums`
--

INSERT INTO `forums` (`id`, `name`, `description`, `slug`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Kesehatan Umum', 'Diskusi tentang kesehatan umum, tips hidup sehat, dan informasi kesehatan dasar', 'kesehatan-umum', 1, 1, '2025-08-23 21:23:24', '2025-08-23 21:23:24'),
(2, 'Konsultasi Kesehatan', 'Tempat bertanya dan berbagi pengalaman seputar masalah kesehatan', 'konsultasi-kesehatan', 1, 2, '2025-08-23 21:23:24', '2025-08-23 21:23:24'),
(3, 'Gaya Hidup Sehat', 'Diskusi tentang olahraga, nutrisi, dan pola hidup sehat', 'gaya-hidup-sehat', 1, 3, '2025-08-23 21:23:24', '2025-08-23 21:23:24'),
(4, 'Kesehatan Mental', 'Pembahasan seputar kesehatan mental, stress management, dan wellbeing', 'kesehatan-mental', 1, 4, '2025-08-23 21:23:24', '2025-08-23 21:23:24'),
(5, 'Diskusi Umum', 'Ruang diskusi bebas untuk topik-topik lain yang berkaitan dengan platform', 'diskusi-umum', 1, 5, '2025-08-23 21:23:24', '2025-08-23 21:23:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_threads`
--

CREATE TABLE `forum_threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` int(11) NOT NULL DEFAULT 0,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forum_threads`
--

INSERT INTO `forum_threads` (`id`, `forum_id`, `user_id`, `title`, `content`, `is_pinned`, `is_locked`, `views_count`, `last_activity`, `created_at`, `updated_at`) VALUES
(7, 1, 21, 'Makanan bergizi (MBG)', 'apakah MBG memenuhi kebutuhan gizimu?', 0, 0, 2, '2025-08-26 19:15:51', '2025-08-26 19:15:51', '2025-08-26 19:28:21');

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
(4, 'Kesehatan Remaja', 'kesehatan pada remaja', 'https://ayosehat.kemkes.go.id/kategori-usia/remaja', '2025-07-03', 3, '2025-07-02 08:28:57', '2025-07-02 08:28:57');

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
(3, 7, 21, 'gue bangett', NULL, '2025-08-11 19:14:11', '2025-08-11 19:14:11'),
(4, 9, 26, 'Semoga bisa jadi bermanfaat untuk kedepannya 🙏', NULL, '2025-08-12 12:50:12', '2025-08-12 12:50:12'),
(5, 13, 42, 'menarik, dan dapat di pahami', NULL, '2025-08-12 12:54:48', '2025-08-12 12:54:48'),
(6, 13, 62, 'Video nya sangat baguss', NULL, '2025-08-12 12:54:50', '2025-08-12 12:54:50'),
(7, 13, 27, 'seru, karena interaktif banget jujur suka ke materi yang interaktif kayak gini', NULL, '2025-08-12 12:55:16', '2025-08-12 12:55:16'),
(8, 13, 30, 'keren,materinya mudah dipahami', NULL, '2025-08-12 12:56:40', '2025-08-12 12:56:40'),
(9, 13, 52, 'banyak pelajaran yang di ambil,bagus banget', 'Pelajarannya diambil dan diterapkan juga ya, Dea😉', '2025-08-12 12:56:55', '2025-08-22 16:29:39'),
(10, 13, 23, 'keren bgt omg', 'OMG! Terima kasih Yunike', '2025-08-12 12:59:07', '2025-08-22 16:30:09'),
(11, 13, 54, 'wow', NULL, '2025-08-12 12:59:40', '2025-08-12 12:59:40'),
(12, 13, 40, 'kerennn 💕💕', NULL, '2025-08-12 13:00:09', '2025-08-12 13:00:09'),
(13, 5, 27, 'detail dan lengkap, bagus banget min', NULL, '2025-08-12 13:00:27', '2025-08-12 13:00:27'),
(14, 13, 46, 'menarik dan kreatif, mulai dari isi materinya sampaii animasi nyaa dan gampang dipahami', NULL, '2025-08-12 15:55:41', '2025-08-12 15:55:41'),
(15, 13, 47, 'penjelasan dalam bentuk vidio seperti ini sangat lah menarik, karna ketertarikan itu lah saya bisa lebih memahami dan mengerti apa maksud dan tujuan yang di sampaikan', 'Kami sangat senang bila maksud dan tujuan materi tersampaikan dengan baik kepada adek adek😊', '2025-08-12 18:59:15', '2025-08-22 16:28:45'),
(16, 13, 48, 'keren', NULL, '2025-08-12 21:54:19', '2025-08-12 21:54:19'),
(17, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 11:48:02', '2025-08-13 11:48:02'),
(18, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 11:48:03', '2025-08-13 11:48:03'),
(19, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 11:48:04', '2025-08-13 11:48:04'),
(20, 13, 21, 'saya suka materinya', NULL, '2025-08-13 20:25:16', '2025-08-13 20:25:16'),
(21, 13, 43, 'kerennn🔥', NULL, '2025-08-13 20:54:46', '2025-08-13 20:54:46'),
(22, 7, 43, 'SERUUU BANGETT LIATNYAA', NULL, '2025-08-13 21:01:44', '2025-08-13 21:01:44'),
(23, 12, 43, 'seruuu bangeett bacanya, panjang banget🔥😿😍😍', NULL, '2025-08-13 21:55:53', '2025-08-13 21:55:53'),
(24, 13, 63, 'videonya sangat bermanfaat, jadi lebih paham pentingnya menjaga kesehatan mental dan cara mengelola stres.', NULL, '2025-08-13 22:09:22', '2025-08-13 22:09:22'),
(25, 12, 63, 'materinya informatif dan jelas menjelaskan peran hormon stres seperti kortisol, adrenalin, dan norepinefrin, serta tahap-tahap respon tubuh... isinya mudah dipahami dan sesuai dengan kesehatan jiwa sehari-hari', NULL, '2025-08-13 22:13:04', '2025-08-13 22:13:04'),
(26, 9, 43, 'seruu banget nontonnyaa', NULL, '2025-08-14 11:05:43', '2025-08-14 11:05:43'),
(27, 13, 59, 'Seruu bangett, menarik , kerennn, there besttttt pokok nyaaaaa 🥰🔥🔥🔥', 'We are the best... the best... the best yes! 🔥', '2025-08-14 14:47:52', '2025-08-22 16:31:10'),
(28, 11, 62, 'Materi nya mudah di pahamii🙌', NULL, '2025-08-14 18:54:38', '2025-08-14 18:54:38'),
(29, 9, 62, 'Video yang sangat bermanfaat buat kita semuaa🙌', NULL, '2025-08-15 15:27:51', '2025-08-15 15:27:51'),
(30, 7, 62, 'Penjelasannya sangat jelas dan video nya sangat baguss', NULL, '2025-08-15 15:31:07', '2025-08-15 15:31:07'),
(31, 13, 83, 'bagus banget dan mudah dimengerti', NULL, '2025-08-15 23:06:56', '2025-08-15 23:06:56'),
(32, 12, 83, 'materinya detail bangett, bener bener ngebantu kita buat kedepannya lagi agar berpengatahuan luas 💥💓', NULL, '2025-08-15 23:09:41', '2025-08-15 23:09:41'),
(33, 13, 24, 'video ini sangat mudah dipahami, saya jadi tahu apa yang dimaksud sehat jiwa!', 'Bukan hanya sehat fisik, tetapi kita juga harus sehat jiwa👍🏻', '2025-08-20 03:14:42', '2025-08-22 16:27:24'),
(34, 12, 24, 'Materi di PDF ini jauh lebih detail dari yang di video, ini sangat bagus untuk yang ingin mempelajari lebih dalam tentang Kesehatan mental ini 🔥', NULL, '2025-08-20 03:17:41', '2025-08-20 03:17:41'),
(35, 11, 24, 'Penjelasannya sangat jelas!, terutama materi tentang Menjaga kebersihan alat reproduksi, Ciri ciri, dan Tips and tricknya. Karena semua itu sangat penting bagi Remaja 🙌🏻👍🏻', NULL, '2025-08-20 03:26:38', '2025-08-20 03:26:38'),
(36, 10, 24, 'Ternyata Perubahan pada remaja itu bukan hanya pada perubahan fisik, perubahan pada remaja itu ada banyak,Salah satunya Perubahan Psikologis seperti Perubahan Emosi, jasmani, cara berinteraksi kepada teman atau orang tua hingga perubahan cara otak berkerja! ❤️‍🔥👏🏻', NULL, '2025-08-20 03:34:51', '2025-08-20 03:34:51'),
(37, 9, 24, 'Seruu banget vidoenya!!, aku baru tahu ternyata dampak  NAPZA sangat berbahaya bagi manusia', NULL, '2025-08-20 03:39:05', '2025-08-20 03:39:05'),
(38, 7, 24, 'Penjelasan tentang Edukasi gizi nya sangat jelas dan mudah dimengertii 🤩', NULL, '2025-08-20 03:42:40', '2025-08-20 03:42:40'),
(39, 8, 43, 'baguss bangett, dapatt di mengerti tentang narkoba karena penjelasannya terdapat gambar juga', NULL, '2025-08-20 17:12:32', '2025-08-20 17:12:32'),
(40, 13, 33, 'lebih suka nonton video animasi edukatif kaya gini, bikin enggak bosen alias SERUUUU‼️‼️ cocok nih untuk tontonan remaja/gen z ahaaay, karena bener-bener nambah ilmu pengetahuan, + ada solusinya juga, SEMANGAT YAA KAKAK-KAKAK BUAT VIDEO ANIMASI NYA💞💞', 'Oh tentu, kakak kakak mengikuti jaman supaya adek adek lebih tertarik mempelajari materi kesehatan mental😉', '2025-08-22 00:14:10', '2025-08-22 16:26:41'),
(41, 7, 33, 'ternyata... Aku kurang berfokus sama makanan bergizi, jarang olahraga, pantes skincare, bodycare ak gak ngaruh :(( makasih yaa kak, next aku fokusin buat makanan bergizi dan pola hidup sehat!', NULL, '2025-08-22 00:17:59', '2025-08-22 00:17:59'),
(42, 15, 22, 'Menurut aku tulisannya udah jelas banget, runtut, dan enak dibaca. Bahasannya lengkap dari pengertian sampai faktor yang memengaruhi, jadi gampang dipahami. ada juga komponen pencegahannya, jadi kita setelah baca juga tau apa aja sih yg harus kita lakuin supaya terhindar dari hal hal yg tdk kita inginkan', NULL, '2025-08-22 02:49:22', '2025-08-22 02:49:22'),
(43, 13, 22, 'videonya bagus, gampang di pahamii, dan penjelasan dari video ini tersampaikan dengan cepat, isi dari materinya pun tergambarkan dengan animasi animasi yg ada di dalam video', 'Betul sekali, dengan menonton video lebih cepat informasi tersampaikan. Untuk lebih detail, bisa membaca materi dalam bentuk pdf😊', '2025-08-22 02:51:45', '2025-08-22 16:25:14'),
(44, 12, 22, 'Menurut aku, dokumen ini udah keren banget. Isinya jelas, runtut, dan gampang dipahami. Penjelasan soal kesehatan mental remaja, tanda-tanda stres, sampai cara ngatasinnya tuh lengkap banget. Aku juga suka karena nggak cuma teori, tapi ada contoh yang relate sama kehidupan sehari-hari remaja. Bagian akhirnya juga asik, ada afirmasi positif sama contoh terapi yang bisa langsung dipraktekin.', NULL, '2025-08-22 02:54:04', '2025-08-22 02:54:04'),
(45, 11, 22, 'Videonya sangat jelas, saya dapat mengerti penjelasan yang ada di dalam video, menambah ilmu , dan dengan adanya video ini saya jadi tauu tentang menjaga kebersihan alat reproduksi', NULL, '2025-08-22 02:56:06', '2025-08-22 02:56:06'),
(46, 12, 48, 'Secara keseluruhan, materi ini sudah sangat baik—lengkap secara teori, praktis untuk diterapkan, dan relevan dengan kondisi remaja saat ini👍🏻👍🏻👍🏻👍🏻', NULL, '2025-08-22 02:56:53', '2025-08-22 02:56:53'),
(47, 10, 22, 'Menurut aku setelah baca keseluruhan teks ini, isinya udah sangat lengkap dan runtut banget. Dari mulai pengenalan organ reproduksi pria dan wanita, proses fisiologis kayak ovulasi, menstruasi, sampai ke perubahan fisik, psikologis, dan kognitif di masa remaja tuh dibahas jelas banget. Bagian masalah reproduksi remaja juga terasa relevan sama kondisi nyata yang sering terjadi, apalagi disertai pencegahan dan deteksi dini. Aku suka karena teksnya nggak cuma teoritis, tapi juga ada langkah praktis kayak SADARI. Jadi bener-bener terasa menyeluruh dan gampang dipahami buat pembaca, khususnya remaja yang lagi butuh pengetahuan soal ini.', NULL, '2025-08-22 02:57:37', '2025-08-22 02:57:37'),
(48, 11, 48, 'Video ini merupakan media yang baik untuk menyampaikan pesan tentang kesehatan mental remaja. Namun, agar lebih efektif, penting memastikan isi disampaikan dengan bahasa sederhana, visual menarik, durasi tidak terlalu panjang, dan ada contoh konkret yang dekat dengan kehidupan remaja.', NULL, '2025-08-22 03:00:33', '2025-08-22 03:00:33'),
(49, 9, 22, 'SERUU BGT, dari video ini, kita dapat menyimpulkan untuk menjauhi narkoba, karena dapat merusak tubuh kita, dan juga tidak sehat, dapat membuat candu, selain itu, animasinya bagus sekali, dan seluruh penjelasan dapat di pahami dengan cepat', NULL, '2025-08-22 03:01:19', '2025-08-22 03:01:19'),
(50, 8, 22, 'Menurut saya setelah membaca teks ini, isi tulisannya sangat lengkap dan bermanfaat. Pembahasannya runtut, mulai dari pengertian narkoba, jenis-jenisnya, dampak fisik, psikologis, maupun sosial, sampai langkah pencegahan dan rehabilitasi. Bagian tentang peran siswa juga menarik, karena mengajak langsung generasi muda untuk ikut andil dalam mencegah penyalahgunaan narkoba. Secara keseluruhan, teks ini membuka wawasan saya bahwa bahaya narkoba tidak hanya soal kesehatan, tapi juga merusak masa depan dan lingkungan sosial.', NULL, '2025-08-22 03:02:28', '2025-08-22 03:02:28'),
(51, 5, 48, 'Materi ini sudah sangat kuat secara teori dan praktis, namun agar lebih efektif bagi remaja, perlu dibuat lebih sederhana, interaktif, dan dekat dengan keseharian mereka. Dengan tambahan ilustrasi dan contoh nyata, materi ini bisa menjadi panduan yang menarik sekaligus bermanfaat.', NULL, '2025-08-22 03:02:38', '2025-08-22 03:02:38'),
(52, 7, 22, 'wih, videonya bener benerr bikin akuu sadar kalau kita harus selalu menjaga kesehatan, dan pola hidup sehat, misalnya makan makanan yg bergizi dan seimbang, selain itu videonya mudah di pahami, terimakasi kak', NULL, '2025-08-22 03:03:51', '2025-08-22 03:03:51'),
(53, 5, 22, 'Menurut saya setelah membaca keseluruhan teks ini, isinya sangat lengkap dan jelas menjelaskan tentang gizi remaja. Dari mulai konsep gizi seimbang, isi piringku, kebutuhan gizi makro dan mikro, hingga bahaya konsumsi gula, garam, dan lemak berlebih semuanya dibahas runtut dan mudah dipahami. Penjelasan yang disertai dengan contoh sumber makanan juga membantu banget untuk membayangkan praktiknya dalam kehidupan sehari-hari. Intinya teks ini bikin saya lebih sadar betapa pentingnya menjaga pola makan dan gaya hidup sehat sejak remaja.', NULL, '2025-08-22 03:04:45', '2025-08-22 03:04:45'),
(54, 11, 65, 'Video ini sangat jelas dan mudah untuk dipahami', NULL, '2025-08-22 03:29:23', '2025-08-22 03:29:23'),
(55, 13, 56, 'Menarik, dan mudah di pahami', 'Terima kasih. Semoga bisa diterapkan ilmunya😊', '2025-08-22 05:16:41', '2025-08-22 16:22:45'),
(56, 12, 56, 'Walaupun panjang ya semoga bisa di mengerti', NULL, '2025-08-22 05:19:32', '2025-08-22 05:19:32'),
(57, 8, 24, 'Dapat dimengerti dengan mudah dan Penyalahgunaan narkoba merupakan masalah serius yang mengancam \r\nMasa depan generasi muda. Jadi kita harus saling mencegah dan mengingatkan bahaya penyalah gunaaan narkoba ini terutama para pelajar', NULL, '2025-08-22 16:26:36', '2025-08-22 16:26:36'),
(58, 13, 54, 'terimakasih ka🙏🔥', NULL, '2025-08-22 16:29:13', '2025-08-22 16:29:13'),
(59, 12, 54, 'woww menurut aku ini menarik bgt terimakasih🤩🤩', NULL, '2025-08-22 16:30:08', '2025-08-22 16:30:08'),
(60, 5, 24, 'Teks ini memberikan pemahaman bahwa gizi tidak hanya berkaitan dengan rasa kenyang, tetapi juga kualitas makanan yang dikonsumsi. ini sangat penting untuk Remaja, agar menjaga pola makan nya  dan memakan makanan bergizi', NULL, '2025-08-22 16:33:22', '2025-08-22 16:33:22'),
(61, 15, 48, 'Materi sangat lengkap dan terstruktur – Penyusunan dari pengertian, tujuan, ciri-ciri payudara sehat, hingga faktor yang mempengaruhi benar-benar rapi dan memudahkan pembaca memahami langkah demi langkah.', NULL, '2025-08-22 16:45:51', '2025-08-22 16:45:51'),
(62, 13, 48, 'materinya mudah di pahami karna bersifat video, dan videonya animasii \r\nis the best🤩❤️👍🏻', NULL, '2025-08-22 16:48:19', '2025-08-22 16:48:19'),
(63, 8, 48, 'Materi sangat lengkap dan mendalam – Penjelasan mencakup definisi, jenis-jenis narkoba (narkotika, psikotropika, dan bahan adiktif), dampak, pencegahan, hingga penanganan dan rehabilitasi. Ini membuat pembaca mendapatkan gambaran utuh.\r\n\r\nBahasa jelas dan sistematis – Penyampaian menggunakan bahasa yang mudah dipahami, meskipun topiknya cukup berat. Hal ini membantu pelajar maupun masyarakat umum memahami bahaya narkoba dengan baik.', NULL, '2025-08-22 16:50:28', '2025-08-22 16:50:28'),
(64, 11, 48, '❤️❤️❤️👍🏻👍🏻', NULL, '2025-08-22 16:52:08', '2025-08-22 16:52:08'),
(65, 10, 48, 'Secara keseluruhan, materi ini sangat baik, bermanfaat, dan layak digunakan sebagai bahan ajar atau penyuluhan remaja karena tidak hanya memberi informasi, tetapi juga mendorong kesadaran diri dan perilaku sehat.', NULL, '2025-08-22 16:53:39', '2025-08-22 16:53:39'),
(66, 9, 48, 'video ini bermanfaat sekali karena mengajarkan tentang pola hidup sehat, mantapp 🤩❤️👍🏻', NULL, '2025-08-22 16:54:34', '2025-08-22 16:54:34'),
(67, 13, 69, 'materinya keren dan menarik', NULL, '2025-08-22 17:01:20', '2025-08-22 17:01:20'),
(68, 12, 69, 'materinya jelas,isinya juga mudah di pahami', NULL, '2025-08-22 17:04:41', '2025-08-22 17:04:41'),
(69, 11, 69, 'materi berbentuk vidio ini sangat menarik,dan lebih mudah di pahami', NULL, '2025-08-22 17:05:44', '2025-08-22 17:05:44'),
(70, 13, 55, 'bagus bngt', NULL, '2025-08-22 20:06:12', '2025-08-22 20:06:12'),
(71, 11, 55, 'bagus bngt', NULL, '2025-08-22 20:06:42', '2025-08-22 20:06:42'),
(72, 9, 55, 'bagus bngt', NULL, '2025-08-22 20:07:13', '2025-08-22 20:07:13'),
(73, 7, 55, 'bagus bngt', NULL, '2025-08-22 20:07:41', '2025-08-22 20:07:41'),
(74, 7, 46, 'wihh gampang banget dipahami materinya, ga bosen juga liat animasinya, selalu kerenn', NULL, '2025-08-22 21:33:34', '2025-08-22 21:33:34'),
(75, 11, 46, 'wah terimakasih materi nya, sekarang jadi lebih tau mengenai kesehatan reproduksi 🤩', NULL, '2025-08-22 21:36:04', '2025-08-22 21:36:04'),
(76, 15, 63, 'Wah materinya lengkap bgt, gampang dipahami juga. Jadi lebih sadar pentingnya ngerawat kesehatan payudara dari hal kecil kaya kebersihan, pola makan sampe periksa rutin. Baru tau juga ternyata faktor makanan sama gaya hidup ngaruh bgt. Keren sih', NULL, '2025-08-24 00:03:12', '2025-08-24 00:03:12'),
(77, 12, 63, 'i materi, detail bgt tp gampang dicerna. Jadi makin kebuka mata kalo mental health tuh sepenting itu 🔥🔥', NULL, '2025-08-24 00:09:45', '2025-08-24 00:09:45'),
(78, 8, 63, 'Setelah baca materi ini jadi sadar banget kalau narkoba itu bener-bener bahaya dan harus dijauhi. bikin semangat buat jaga diri sendiri dan teman-teman dari pengaruh narkoba Ternyata dampak narkoba luas banget ya, bukan cuma kesehatan tapi juga masa depan. Jadi lebih hati-hati', NULL, '2025-08-24 00:13:55', '2025-08-24 00:13:55'),
(79, 5, 63, 'Menurut aku materinya bermanfaat banget buat nambah pengetahuan. Jadi bisa lebih ngerti pentingnya gizi seimbang. Cocok juga buat diterapin di kehidupan sehari-hari.', NULL, '2025-08-24 00:17:23', '2025-08-24 00:17:23'),
(80, 15, 59, 'Pokok nyaa in the besttt bangettttttt kaka, jadi aku enak banget bacaaaa + jelas banget 🥰🥰🥰', NULL, '2025-08-24 18:29:20', '2025-08-24 18:29:20'),
(81, 5, 46, 'Materi ini suka banget walaupun berbentuk pdf tetapi ada visual nya yaitu gambar yang bisa memberikan pemahaman lebih dalam, ilmu ini juga bagus untuk diterapkan pada kehidupan sehari-hari dalam menjaga pola hidup sehat', NULL, '2025-08-25 02:00:33', '2025-08-25 02:00:33'),
(82, 9, 46, 'bagus banget sebagai generasi muda materi ini bagus banget untuk mengedukasi pelajar 🙌🏻', NULL, '2025-08-25 04:34:25', '2025-08-25 04:34:25'),
(83, 13, 95, 'Konten kesehatan yg luar biasa', NULL, '2025-08-26 19:23:23', '2025-08-26 19:23:23');

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
(10, 12, 21, '2025-08-18 01:11:58', '2025-08-18 01:11:58'),
(11, 7, 21, '2025-08-18 01:12:08', '2025-08-18 01:12:08'),
(12, 5, 21, '2025-08-18 01:12:18', '2025-08-18 01:12:18'),
(13, 11, 21, '2025-08-18 01:25:04', '2025-08-18 01:25:04'),
(14, 10, 21, '2025-08-18 01:28:31', '2025-08-18 01:28:31'),
(15, 15, 43, '2025-08-19 16:50:00', '2025-08-19 16:50:00'),
(17, 13, 43, '2025-08-19 16:50:55', '2025-08-19 16:50:55'),
(18, 5, 43, '2025-08-19 16:57:52', '2025-08-19 16:57:52'),
(19, 13, 24, '2025-08-20 03:14:44', '2025-08-20 03:14:44'),
(23, 11, 24, '2025-08-20 03:25:10', '2025-08-20 03:25:10'),
(24, 10, 24, '2025-08-20 03:27:02', '2025-08-20 03:27:02'),
(25, 9, 24, '2025-08-20 03:39:09', '2025-08-20 03:39:09'),
(28, 7, 24, '2025-08-20 03:40:23', '2025-08-20 03:40:23'),
(29, 15, 24, '2025-08-20 03:43:12', '2025-08-20 03:43:12'),
(30, 12, 24, '2025-08-20 03:43:28', '2025-08-20 03:43:28'),
(31, 7, 43, '2025-08-20 17:05:40', '2025-08-20 17:05:40'),
(32, 8, 43, '2025-08-20 17:06:14', '2025-08-20 17:06:14'),
(33, 11, 43, '2025-08-20 17:16:20', '2025-08-20 17:16:20'),
(34, 15, 46, '2025-08-21 23:07:37', '2025-08-21 23:07:37'),
(36, 13, 46, '2025-08-21 23:07:54', '2025-08-21 23:07:54'),
(38, 13, 33, '2025-08-22 00:09:04', '2025-08-22 00:09:04'),
(40, 9, 33, '2025-08-22 00:09:20', '2025-08-22 00:09:20'),
(42, 5, 33, '2025-08-22 00:18:20', '2025-08-22 00:18:20'),
(43, 7, 33, '2025-08-22 00:18:33', '2025-08-22 00:18:33'),
(44, 15, 22, '2025-08-22 02:45:23', '2025-08-22 02:45:23'),
(48, 5, 22, '2025-08-22 02:54:17', '2025-08-22 02:54:17'),
(49, 7, 22, '2025-08-22 02:54:21', '2025-08-22 02:54:21'),
(50, 8, 22, '2025-08-22 02:54:23', '2025-08-22 02:54:23'),
(51, 9, 22, '2025-08-22 02:54:26', '2025-08-22 02:54:26'),
(52, 10, 22, '2025-08-22 02:54:30', '2025-08-22 02:54:30'),
(53, 11, 22, '2025-08-22 02:54:33', '2025-08-22 02:54:33'),
(54, 12, 22, '2025-08-22 02:54:36', '2025-08-22 02:54:36'),
(55, 13, 22, '2025-08-22 02:54:44', '2025-08-22 02:54:44'),
(56, 12, 48, '2025-08-22 02:56:56', '2025-08-22 02:56:56'),
(60, 15, 65, '2025-08-22 03:01:01', '2025-08-22 03:01:01'),
(61, 5, 48, '2025-08-22 03:01:26', '2025-08-22 03:01:26'),
(62, 15, 85, '2025-08-22 03:02:54', '2025-08-22 03:02:54'),
(63, 7, 48, '2025-08-22 03:03:06', '2025-08-22 03:03:06'),
(64, 13, 85, '2025-08-22 03:03:31', '2025-08-22 03:03:31'),
(65, 12, 85, '2025-08-22 03:03:50', '2025-08-22 03:03:50'),
(69, 8, 65, '2025-08-22 03:40:49', '2025-08-22 03:40:49'),
(72, 13, 56, '2025-08-22 05:15:56', '2025-08-22 05:15:56'),
(73, 12, 56, '2025-08-22 05:17:38', '2025-08-22 05:17:38'),
(74, 11, 56, '2025-08-22 05:17:45', '2025-08-22 05:17:45'),
(75, 10, 56, '2025-08-22 05:17:57', '2025-08-22 05:17:57'),
(76, 9, 56, '2025-08-22 05:18:06', '2025-08-22 05:18:06'),
(77, 8, 56, '2025-08-22 05:18:11', '2025-08-22 05:18:11'),
(78, 7, 56, '2025-08-22 05:18:17', '2025-08-22 05:18:17'),
(79, 5, 56, '2025-08-22 05:18:21', '2025-08-22 05:18:21'),
(80, 15, 56, '2025-08-22 05:18:23', '2025-08-22 05:18:23'),
(81, 12, 54, '2025-08-22 16:30:22', '2025-08-22 16:30:22'),
(82, 15, 48, '2025-08-22 16:45:44', '2025-08-22 16:45:44'),
(83, 13, 48, '2025-08-22 16:46:04', '2025-08-22 16:46:04'),
(84, 8, 48, '2025-08-22 16:48:42', '2025-08-22 16:48:42'),
(85, 15, 69, '2025-08-22 16:50:46', '2025-08-22 16:50:46'),
(86, 11, 48, '2025-08-22 16:51:12', '2025-08-22 16:51:12'),
(88, 10, 48, '2025-08-22 16:53:43', '2025-08-22 16:53:43'),
(89, 9, 48, '2025-08-22 16:54:38', '2025-08-22 16:54:38'),
(91, 13, 69, '2025-08-22 17:00:32', '2025-08-22 17:00:32'),
(92, 12, 69, '2025-08-22 17:02:38', '2025-08-22 17:02:38'),
(93, 11, 69, '2025-08-22 17:05:47', '2025-08-22 17:05:47'),
(94, 15, 55, '2025-08-22 20:05:15', '2025-08-22 20:05:15'),
(99, 13, 55, '2025-08-22 20:06:17', '2025-08-22 20:06:17'),
(100, 11, 55, '2025-08-22 20:06:46', '2025-08-22 20:06:46'),
(101, 9, 55, '2025-08-22 20:07:03', '2025-08-22 20:07:03'),
(102, 7, 55, '2025-08-22 20:07:32', '2025-08-22 20:07:32'),
(103, 7, 46, '2025-08-22 21:30:06', '2025-08-22 21:30:06'),
(104, 11, 46, '2025-08-22 21:34:56', '2025-08-22 21:34:56'),
(105, 15, 63, '2025-08-23 23:57:48', '2025-08-23 23:57:48'),
(106, 13, 63, '2025-08-24 00:03:32', '2025-08-24 00:03:32'),
(107, 8, 63, '2025-08-24 00:12:33', '2025-08-24 00:12:33'),
(108, 5, 63, '2025-08-24 00:14:02', '2025-08-24 00:14:02'),
(110, 5, 86, '2025-08-24 14:13:22', '2025-08-24 14:13:22'),
(111, 5, 46, '2025-08-25 01:59:25', '2025-08-25 01:59:25'),
(114, 9, 46, '2025-08-25 04:33:35', '2025-08-25 04:33:35'),
(115, 11, 33, '2025-08-25 05:37:40', '2025-08-25 05:37:40'),
(117, 21, 95, '2025-08-26 19:14:00', '2025-08-26 19:14:00'),
(118, 12, 46, '2025-08-28 21:34:02', '2025-08-28 21:34:02'),
(119, 8, 46, '2025-08-28 21:34:56', '2025-08-28 21:34:56');

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
(5, 'Gizi Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf', NULL, '2025-08-05 09:48:19', '2025-08-05 09:48:19', 'aktif'),
(7, 'Edukasi Gizi Seimbang', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/e15miiQKxnqwOVOhnvf0Utphc3vyWOOKp3KKpsZc.mp4', NULL, '2025-08-05 09:50:17', '2025-08-05 09:50:17', 'aktif'),
(8, 'Waspada Narkoba', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/k7lnvjhH5r9nUgfsfT1LK6SbWbfYnxgoehQqhPp6.pdf', NULL, '2025-08-05 09:51:38', '2025-08-05 09:51:38', 'aktif'),
(9, 'Pencegahan Penyalahgunaan NAPZA Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/1iZi3rMHfEd9cscmxdSSg1wcALlZlWA6zOHtEjLv.mp4', NULL, '2025-08-05 09:53:27', '2025-08-05 09:53:27', 'aktif'),
(10, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'pdf', 'materi_files/t6Q4UYMPGoNRRKdjlsSeiHSF0j9oW4zMjZhkOLC2.pdf', NULL, '2025-08-05 09:54:34', '2025-08-05 09:54:34', 'aktif'),
(11, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'video', 'materi_files/UKiSoYORnokknTtEcOVKIl1PQQUFR2zRKJF6dCQ3.mp4', NULL, '2025-08-05 09:55:06', '2025-08-05 09:55:06', 'aktif'),
(12, 'Kesehatan Mental dan Manajemen Stress Remaja', NULL, 'kesehatan_mental', NULL, NULL, 'pdf', 'materi_files/mdltEb7NksMZfbeD2L3ckit7brcBTdWOU82SYbT9.pdf', NULL, '2025-08-05 09:55:49', '2025-08-05 09:55:49', 'aktif'),
(13, 'Sehatkah Jiwaku?', NULL, 'kesehatan_mental', NULL, NULL, 'video', 'materi_files/MxCD3f373J3gJRfYSKDTr1MAGs46UfetlP6vx1wQ.mp4', NULL, '2025-08-05 09:56:29', '2025-08-05 09:56:29', 'aktif'),
(15, 'Perawatan Payudara', 'perawatan-payudara', 'reproduksi', NULL, NULL, 'pdf', 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf', NULL, '2025-08-19 05:53:49', '2025-08-19 05:53:49', 'aktif'),
(21, 'Perawatan Kesehatan Payudara', 'perawatan-kesehatan-payudara', 'reproduksi', NULL, NULL, 'doc', 'materi_files/4bkrYzPtQGgStCbGljtxNJDQ1KxAWMbXK5xxmnQD.pptx', NULL, '2025-08-25 05:38:35', '2025-08-25 05:38:35', 'aktif');

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
('depiacomputer@gmail.com', '$2y$12$sXnjEgYIFvSJCHdri4uL6ejGzA46Osrs3AIZqV0Lxb8pBLKuR70gy', '2025-07-08 17:53:53');

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
('47ToAKu5DGPegW29okRVNNpJQGUoHQvvBit55LKv', NULL, '43.156.156.96', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkQxbG8zRmI3dkl0UHhaMWwwdmZEd0Y0VUplQXBVU3lVczBRV29aWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756106749),
('5GY5ZPNc8mooVKHfZAk8v8FGxb7WDdjvbXKY71vb', 82, '125.161.29.178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSml3a0N1WVFtWmxQOVA3MHltNmd4NXBmV2hlbnN4cng2RGFQZ1djQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS9hZG1pbi9tYXRlcmkvMTUvc3RyZWFtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxNjoiY2FwdGNoYV9xdWVzdGlvbiI7czo5OiI5ICsgNCA9ID8iO3M6MTQ6ImNhcHRjaGFfYW5zd2VyIjtpOjEzO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjgyO30=', 1756108758),
('5Q7Y76QJKWtyXIkWAuzi4PYpomwwdW0u3i73DQjn', 46, '114.122.77.191', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieHdzU0Z0TnhSWWtzUlYybUdMbGE0dktieDc2UGViZXFuaHdhT3FUTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cHM6Ly9rZXNlaGF0YW5yZW1hamEuY29tL3VzZXIvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS91c2VyL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTY6ImNhcHRjaGFfcXVlc3Rpb24iO3M6OToiNSArIDMgPSA/IjtzOjE0OiJjYXB0Y2hhX2Fuc3dlciI7aTo4O3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ2O30=', 1756112453),
('65PTlEqATBq5EijcYXxmSGtxBAyuvbe1fG8zBnTb', NULL, '13.82.195.38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGgyY21iU3htYkpmek1SSjVld0RPUWRRZ0lEMkRDbGRiQ25JMEcyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3Lmtlc2VoYXRhbnJlbWFqYS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756106006),
('8O01dDRwL25OuVnpXd7g6p7qUYp99yNs7JmCwqVk', NULL, '66.249.79.67', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.7204.183 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWZXSUxpT2dsU2VCdnZHdEFRTER0T3pNc1VJMFRrRlhpeWduTU5HTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756115906),
('DYwEnBru4kLyMPCaOtZrww1dZClQ1hVTovLeTqIr', 3, '114.122.70.107', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWHZ2VE91aTBIN3NyOGZhazRVbXNWMGtmb0pUOU1LSUJieHphbWFKOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTY6ImNhcHRjaGFfcXVlc3Rpb24iO3M6OToiOCArIDUgPSA/IjtzOjE0OiJjYXB0Y2hhX2Fuc3dlciI7aToxMztzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1756115293),
('kuxuGUllSGzsmz5HnUGcmBuTp8jYSi6j1xdvRCBx', NULL, '118.195.153.213', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkpDOWl2V0hrcW9GNGVHNWJjT0lxNEFiRlRiRzhVV3NBMFBzMnNZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756111834),
('TQlBQI0JL85Wkiq0mPzCTUwmJwftIzpbw7eKnrn8', NULL, '170.106.159.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0dmY05GdVdSeVpJSWdwbmtoVGw5N2V3QkN1M0tYanhCSnAxYkdQMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756112988),
('uu3yceUYZcbhSR6b9c2zaRscx0o8X2CkiJyGYJWI', NULL, '125.161.29.178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkZDWU5oVm82dXVLVldMOG5GMkJRYkFpTzNhSEk4TWcwRHZTYlFISiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fX0=', 1756115570),
('VsZrLK12a3jrLEeKbR8MpOvK1yZhM6T6lqedo2rZ', 63, '103.156.221.223', 'Mozilla/5.0 (Linux; Android 10; vivo 1804) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/123.0.6312.118 Mobile Safari/537.36 VivoBrowser/14.6.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaU9TNXdiMVM3dWVreUJsd2lCZktiTmlIZEpvcG5ZMTlrQkRHQ0FXMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS91c2VyL2NvbnN1bHRhdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE2OiJjYXB0Y2hhX3F1ZXN0aW9uIjtzOjk6IjEgKyAzID0gPyI7czoxNDoiY2FwdGNoYV9hbnN3ZXIiO2k6NDtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2Mzt9', 1756105978);

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
(3, 'Devia', 'dviafnopiani@gmail.com', NULL, '$2y$12$uwJqDHWRsqtwP8GyZubAceqS/ueSOJ5KLELQzAE6BZcNwadov7/5O', 'admin', NULL, '2025-06-30 12:42:59', '2025-06-30 12:42:59'),
(5, 'devia', 'depiacomputer@gmail.com', NULL, '$2y$12$3D43kv3gQngMrloJErHuEeJZWBh/sYoOD.oWgSd4YzLov3mY7hw5q', 'user', NULL, '2025-07-02 07:58:25', '2025-07-02 07:58:25'),
(20, 'Sutiyono', 'sutiyonodoang@gmail.com', NULL, '$2y$12$3g5exqqoWA9D0YMeUb.I6u24x.7pvkbVniU8qWC9w4cipZF9kguPO', 'admin', NULL, '2025-08-11 13:31:42', '2025-08-11 13:31:42'),
(21, 'Tiyo', 'tiyo@unibba.ac.id', NULL, '$2y$12$DstenL5MmETo8tsvkiiEP.vcPzLnvXidt6Rwdrs.88OsJDR9BSV1a', 'user', NULL, '2025-08-11 13:35:06', '2025-08-18 11:00:18'),
(22, 'Lutfhiya Siti Nur Jauza', 'akunfotopart0@gmail.com', NULL, '$2y$12$nS4XyuslJNgFrcB9MLk./uAMnN7qg9HiCK3PiSownfTj7N9hF4ms2', 'user', NULL, '2025-08-12 12:31:33', '2025-08-12 12:31:33'),
(23, 'Yunike Viona Fronika', 'vionamaibangg@gmail.com', NULL, '$2y$12$xJfFkPtVner/SKoKm9JxT.w9TqN1RLUMyF7xjpbNyEaidaA0UsR2i', 'user', NULL, '2025-08-12 12:46:17', '2025-08-12 12:46:17'),
(24, 'Alvian Cyril Nugraha', 'alvianugraha2020@gmail.com', NULL, '$2y$12$1El4isk3IBU9oZ9mLXZHiuMmhiRx0cZMFeOz19vvsMMas2dFxBt9i', 'user', NULL, '2025-08-12 12:46:19', '2025-08-12 12:46:19'),
(25, 'Devira Diva Suherman', 'divadevira49@gmail.com', NULL, '$2y$12$.RrrE44L7Q.T386RP4ISje3Keb9htAGe7pnpj62MG3GZBIffcBmVG', 'user', NULL, '2025-08-12 12:46:32', '2025-08-12 12:46:32'),
(26, 'Restu Muhammad Ihwan', 'aningyuningsih.362@gmail.com', NULL, '$2y$12$PKKXUE3VFv5/nUDi2YInwu3Ea4aSqHTFbAndxEehXVE2r08myiY5u', 'user', NULL, '2025-08-12 12:46:32', '2025-08-12 12:46:32'),
(27, 'Tedi Afriansyah', 'tedaf628@gmail.com', NULL, '$2y$12$GvlFYTeLO2oJjoYxuhlb5u2zIXZ45tVTwG9Bwhx.OGMFhRVMW6coe', 'user', NULL, '2025-08-12 12:46:39', '2025-08-12 12:46:39'),
(28, 'Nabel fauziya', 'nabelfauziya@gmail.com', NULL, '$2y$12$LpzeOEzi0Y0yA2p.I2AOtOassyf7b.ED3s4izQ4YlnCjD2YnWerCS', 'user', NULL, '2025-08-12 12:46:51', '2025-08-12 12:46:51'),
(29, 'Riani Septiadewi', 'rianisptdw16@gmail.com', NULL, '$2y$12$nNpGqgl9NZlQ0YXH7rTUIOufYp5Ff0GjR4tRipoX9N.DxYUXHabdC', 'user', NULL, '2025-08-12 12:46:53', '2025-08-12 12:46:53'),
(30, 'Asyraf Muhammad Nur firdaus', 'asyrafmn46@gmail.com', NULL, '$2y$12$B8FOD9aXA/rDm1qlpICOle3V8n.2xVfXdARaq2skYhp6NagyQ7.nu', 'user', NULL, '2025-08-12 12:46:57', '2025-08-12 12:46:57'),
(31, 'Agni Sriguntari', 'agnisriguntari2@gmail.com', NULL, '$2y$12$z8XsPGxEt3lCU9HOmPVxU.Tr9KHBycEeaNV0OIzsUcfGbdt26y1d2', 'user', NULL, '2025-08-12 12:46:58', '2025-08-12 12:46:58'),
(32, 'Sahla Adresti Al Ihsani', 'sahlaadrestialihsani@gmail.com', NULL, '$2y$12$FC70jNIcfttp0Y1MsDQmUezfQCnqKzrvHmS1HglSSYm9P1ciICVFW', 'user', NULL, '2025-08-12 12:47:02', '2025-08-12 12:47:02'),
(33, 'Susi Susilawati', 'susi1law4ti@gmail.com', NULL, '$2y$12$KKgYhQlRIgsSoZDOUytvSeUnmc4aTC7kARE/Qd/SbAG2.FcHBBhTq', 'user', NULL, '2025-08-12 12:47:18', '2025-08-12 12:47:18'),
(34, 'Cicin Rahmawati', 'cicinrahmawati@gmail.com', NULL, '$2y$12$LjxbxmOaNjGXHVUgxfPBnOsw2aipNaDIO9O0I8J8p6/huk04Ok/7m', 'user', NULL, '2025-08-12 12:47:25', '2025-08-12 12:47:25'),
(35, 'Refika Adriani', 'fikadoang751@gmail.com', NULL, '$2y$12$xG0F/lX2OnvHzQbjT9lIAe82liZOGPuOL7hCYfhUudJjD323LC1qW', 'user', NULL, '2025-08-12 12:47:33', '2025-08-12 12:47:33'),
(36, 'Dzaki AlBariz Hidayat', 'dzakialbarizh@gmail.com', NULL, '$2y$12$izk3btNdnjTsI2QQduQM4.O4mOFRSEAHRARNRzWspIcsbPTkcaUTO', 'user', NULL, '2025-08-12 12:47:34', '2025-08-12 12:47:34'),
(37, 'Kevin', 'layv3x3@gmail.com', NULL, '$2y$12$sL2OGFP2LD3ZpzpOarx8FONA81VFBWLuG6BySEvCeuy.J3uOKvbuy', 'user', NULL, '2025-08-12 12:47:35', '2025-08-12 12:47:35'),
(38, 'Carissa Widya Baharizki', 'carisawidyabaharizki@gmail.com', NULL, '$2y$12$j.XQXHBwMQ5YSbLS0KbWeuotSceymEruZ0wkc5p6diN0E3AVk3atW', 'user', NULL, '2025-08-12 12:47:42', '2025-08-12 12:47:42'),
(39, 'Vanessa Regina Putri', 'vanessareginaputri4@gmail.com', NULL, '$2y$12$5WzB525mSIfXyDyEX8OhAuGuQ9NR6J8cso0qLCXW6P.rm1gubDfuG', 'user', NULL, '2025-08-12 12:47:46', '2025-08-12 12:47:46'),
(40, 'Khaira Nursabila', 'nskhaira25@gmail.com', NULL, '$2y$12$Ag0onUOPgnlPB4LN5eIEq.tTeR042yKxo4Fbx3nuho7Ezrv3sX99q', 'user', NULL, '2025-08-12 12:47:48', '2025-08-12 12:47:48'),
(41, 'Diva', 'divai0611@gmail.com', NULL, '$2y$12$oNZVEzI89FPSNZjh8CN7k.OWAr29VjnxznXcyvTX0Il/VNe.yVIc2', 'user', NULL, '2025-08-12 12:47:53', '2025-08-12 12:47:53'),
(42, 'Elia Sri Rismawati', 'eliasrirismawati9@gmail.com', NULL, '$2y$12$FXD1a/l1sRlzgHj2mW/dxegeQ60bohsNtA115jIPJrJUHLU8uzm8m', 'user', NULL, '2025-08-12 12:47:53', '2025-08-12 12:47:53'),
(43, 'Titania putri', 'titaniap334@gmail.com', NULL, '$2y$12$exZYAqdae4RhISCN/Gk0QuKXyWmZ22awz98KWS9ADovH2j/5mqs/i', 'user', NULL, '2025-08-12 12:47:53', '2025-08-12 12:47:53'),
(44, 'hikmah nurkholifah', 'h3493522@gmail.com', NULL, '$2y$12$ADd0Erg5W60eB3tcMFTAdeva87YBWLrrcrvaixeyICqmUWH6MStSC', 'user', NULL, '2025-08-12 12:47:54', '2025-08-12 12:47:54'),
(45, 'Arisa Nabila Bilqis', 'naqieess@gmail.com', NULL, '$2y$12$X4wfdCXzIz6lFA8.mgwR9OZjEII/E5QwodEgeFmKDMNgyXOmWS9ZO', 'user', NULL, '2025-08-12 12:47:57', '2025-08-12 12:47:57'),
(46, 'Randi Akbar Putra', 'akbarputrarandi@gmail.com', NULL, '$2y$12$EE1z/vfpiE693uaZqCQuN.xxuTkxJ9s30XRTDcHNdwaEUbB6HUjTu', 'user', NULL, '2025-08-12 12:48:02', '2025-08-12 12:48:02'),
(47, 'Brescia Rose Samosir', 'bresciasamosir@gmail.com', NULL, '$2y$12$qUm1MLZjmStk2z18qH5zFukhOznJpVmG5Gv8ylgHfzW5CVuYlYX5y', 'user', NULL, '2025-08-12 12:48:05', '2025-08-12 12:48:05'),
(48, 'Ribka Naomi Artha', 'ribkasitungkir77@gmail.com', NULL, '$2y$12$k/QDBnGu9s5dorr4wNCm4edekE3iLHf2sYaftP.VGAxhNaTJ1UIJS', 'user', NULL, '2025-08-12 12:48:06', '2025-08-12 12:48:06'),
(49, 'FAIRUZ ZIKRI HABIBULLAH', 'haneulkioflife@gmail.com', NULL, '$2y$12$TNgshtpXjWsJLz98te2Mvur36CVEoOyPtsrWP44ohV/KkxUY3Zwui', 'user', NULL, '2025-08-12 12:48:08', '2025-08-12 12:48:08'),
(50, 'Fahra faddilah', 'yantisusanti8865@gmail.com', NULL, '$2y$12$yfxZz8apDEvN.0p8tYNzXu9rBcuvAYxPYVEctJ9AQ1YDT6KUc9SBK', 'user', NULL, '2025-08-12 12:48:18', '2025-08-12 12:48:18'),
(51, 'Yolanda Renata Putri BR. Sinurat', 'ylandarnata@gmail.com', NULL, '$2y$12$rhUXyR2kLK5CGXUrVUzT3.2NLauB6wjiHr45jBgXhl5BIYFj.XTo6', 'user', NULL, '2025-08-12 12:48:21', '2025-08-12 12:48:21'),
(52, 'Dea Auliya', 'deaaulia251022@gmail.com', NULL, '$2y$12$nL.X7RwHZamVYmzErfU0g.FjbFEEeicg9aXRCGW91YoLXMsG9zxnW', 'user', NULL, '2025-08-12 12:48:28', '2025-08-12 12:48:28'),
(53, 'Enurjanah aeni', 'nunurrnur@gmail.com', NULL, '$2y$12$i7a3eYmOWql20tzQYStvN.FrdrRWBH929NGFASFjGJC07ju5WAGi6', 'user', NULL, '2025-08-12 12:48:28', '2025-08-12 12:48:28'),
(54, 'windu wulansari', 'wulanwindu054@gmail.com', NULL, '$2y$12$mXQ7ubXmLcSQmuKsbPWFY.WeP8vDVitC7NQmuI6rL6F8W8sfODvhK', 'user', NULL, '2025-08-12 12:48:35', '2025-08-12 12:48:35'),
(55, 'DONI PUTRA PRATAMA', 'dnnyptra110@gmail.com', NULL, '$2y$12$tAL0FS/prsRA7HwpNuzu/eXgmT/3eA1PU50b/q5aMAInxT6v3WwCm', 'user', NULL, '2025-08-12 12:48:37', '2025-08-12 12:48:37'),
(56, 'IRHAM ABDUL HAKIM', 'irhamabdulh209@gmail.com', NULL, '$2y$12$cnLax91pjRdaKlrFYFXm2OK.qkyt6BOpL8fC3ynQIe1OW0OXEX8t6', 'user', NULL, '2025-08-12 12:48:45', '2025-08-12 12:48:45'),
(57, 'cipaa', 'ipo0ca4@gmail.com', NULL, '$2y$12$aY2nYlD34PsL75O8DmC3auILam1q02XCUTEBZj91knTR2ptiNb3Pq', 'user', NULL, '2025-08-12 12:48:45', '2025-08-12 12:48:45'),
(58, 'NISRINA NAILAH ZALFA', 'disrinazalfa@gmail.com', NULL, '$2y$12$l4pSVXwvBtYFOjIoeLQDnunCeUecz0DWEfwXfD2LZvxdZ3Mj8nOoq', 'user', NULL, '2025-08-12 12:48:48', '2025-08-12 12:48:48'),
(59, 'Putra Andika Pertama', 'dikaa13625@gmail.com', NULL, '$2y$12$xvU7KrcXdJSW.jZNU/tw0e88qa1auAVGtk/cOuK//WZ1jLuznzZT6', 'user', NULL, '2025-08-12 12:49:04', '2025-08-12 12:49:04'),
(60, 'Qeenanty', 'qeenanty2008@gmail.com', NULL, '$2y$12$HK7tLlwyDnwzTGaVV1xaXeetxdW2jJfY.IlPrZC2SS6JWJJuTRyBW', 'user', NULL, '2025-08-12 12:49:05', '2025-08-12 12:49:05'),
(61, 'keanu adhna kurniawan', 'keanuadhna@gmail.com', NULL, '$2y$12$HrbTk8AqC4jnY.IMOHljXuGCwVF6sbkttLGdtSe0s6wWXMvBJjFZy', 'user', NULL, '2025-08-12 12:49:09', '2025-08-12 12:49:09'),
(62, 'Muhammad Ikhbal Syahreiza', 'doanksyahreza@gmail.com', NULL, '$2y$12$t1g6Fv9evL325NCWR4..KObqzcm2GbiibwktXpHXaMbKOwk3h4y2e', 'user', NULL, '2025-08-12 12:49:17', '2025-08-12 12:49:17'),
(63, 'Keyzia Syaira Azalea', 'keyziaazalea68@gmail.com', NULL, '$2y$12$FuqAxJBsVuerY2OjGJM7dugGy8YV6wvA3OX.LT6mKpEDGxLYtPIf.', 'user', NULL, '2025-08-12 12:49:21', '2025-08-12 12:49:21'),
(64, 'Deajeng Oktavia', 'deajengoktavia06@gmai.com', NULL, '$2y$12$Ryg6NxwjzASq0wumwlJzK.7aN5s1h0VvBX7NUyjv03DEPdP3yzgTa', 'user', NULL, '2025-08-12 12:49:30', '2025-08-12 12:49:30'),
(65, 'Willi anugrah', 'willianugrah61@gmail.com', NULL, '$2y$12$NsWyYyDjG50MVPOE5cklLeG4VKM6cZl1Mz6H/cKEyjds8vGo6T3I6', 'user', NULL, '2025-08-12 12:49:58', '2025-08-12 12:49:58'),
(66, 'Vinni Rizqiyanti', 'vinirizqyanti@gmail.com', NULL, '$2y$12$t1/FMuyEuFL2q02XYl3NiuLndID4IkTvpuIvFGGmSsi3Ymo6/15ZS', 'user', NULL, '2025-08-12 12:50:00', '2025-08-12 12:50:00'),
(67, 'REZA ABDUL ROHMAN', 'rezaabdulr16@gmail.com', NULL, '$2y$12$wcJdrf/xnnbR9v1JhzzYAePyRqXMNI7eP1t3IJvMKY/iUuKR.fy36', 'user', NULL, '2025-08-12 12:50:06', '2025-08-12 12:50:06'),
(68, 'Xena Kaila Nisa', 'arumibacin@gmail.com', NULL, '$2y$12$5FvVcGw7QQ3YZeDg73.YK.3bujPyn5gBZ194dzvQFYsz1OiETNOJO', 'user', NULL, '2025-08-12 12:50:17', '2025-08-12 12:50:17'),
(69, 'Gisela Syiami Putri', 'giselasyiamiputri08@gmail.com', NULL, '$2y$12$q/H3XLocaCX5SrI.0eujLeMgIb6GSVCWM.R/4.Ad4PjZNYetX0eYm', 'user', NULL, '2025-08-12 12:50:20', '2025-08-12 12:50:20'),
(70, 'Tiara septi anantia', 'septianantia@gmail.com', NULL, '$2y$12$qfqeah6vTScRPq3RsBGtR.VHcCQ9.hfhv9rsXA0X2NrDYITpKSGd2', 'user', NULL, '2025-08-12 12:50:30', '2025-08-12 12:50:30'),
(71, 'M ILMAN DANISH', 'milmandanish@gmail.com', NULL, '$2y$12$fLmmfGxL6VQ/vZwHs4GPqOD.ywygOEfE8CURTQcOf8MStETaiNBVC', 'user', NULL, '2025-08-12 12:50:33', '2025-08-12 12:50:33'),
(72, 'Angelia Shafira Harun', 'angeliaharun090607@gmail.com', NULL, '$2y$12$.DFa/4lndRSN5KKjBSP3TOQyrIGs7EA.of.3sElvKsC9IXlo6txkS', 'user', NULL, '2025-08-12 12:50:42', '2025-08-12 12:50:42'),
(73, 'Zalfa safira syalabiah', 'Safirasyalabiahzalfa@gmail.com', NULL, '$2y$12$nErbIBwrx3ewymzup8kdiuMeXSmlq5i5DtPiUCW1HXfk6j5nQmKN6', 'user', NULL, '2025-08-12 12:51:26', '2025-08-12 12:51:26'),
(74, 'FAIRUZ ZIKRI HABIBULLAH', 'ffaooobutterfly@gmail.com', NULL, '$2y$12$QhOTsR1uoiohn6.MzXI7huB7/pqjsSd93CM42.nehB.NaV1hQrHDq', 'user', NULL, '2025-08-12 12:51:27', '2025-08-12 12:51:27'),
(75, 'MUHAMAD RIPAL', 'kp.sekepondok@gmail.com', NULL, '$2y$12$Ud7K4JpA5AD2/FT9rIzRDue16F/HmbBf5Kf2EtZCkRUPV8k10xEUG', 'user', NULL, '2025-08-12 12:51:53', '2025-08-12 12:51:53'),
(76, 'santi riyanti rahayu', 'wartinititin75@gmail.com', NULL, '$2y$12$goyDDWs2Z7fFNqoxowlfreUQ994EMKZjwLkAy5kbh9tLwrz8qG2Aa', 'user', NULL, '2025-08-12 12:54:48', '2025-08-12 12:54:48'),
(77, 'Siska jesika', 'siskajesika61@gmail.com', NULL, '$2y$12$yrpQz635wzuamheQJ.ZnUupHLyQD0EVolyufBglaNSvIMjCgcU6wG', 'user', NULL, '2025-08-12 13:11:04', '2025-08-12 13:11:04'),
(78, 'Krisna Mulyadi', 'dedij6897@gmail.com', NULL, '$2y$12$qpAMclsoSrSd8nkKGoFbJ.W24.wrZ/byAQd9acBtuytAmXO2GfHNe', 'user', NULL, '2025-08-12 15:58:23', '2025-08-12 15:58:23'),
(81, 'MUHAMAD RIPAL', 'kentania24@gmail.com', NULL, '$2y$12$XhC52I0Emb2rZf7INDZfI.MRoAiL.RtmJsjxMZDv8t9IYPAKnNn4m', 'user', NULL, '2025-08-12 23:14:09', '2025-08-12 23:14:09'),
(82, 'admin', 'edukes.edukasikesehatan@gmail.com', NULL, '$2y$12$dMTNgXEhDL/BaNXIjyWTqecA/KcM0n4kwBngYvK2nO3ndGW6hde6C', 'admin', NULL, '2025-08-15 19:24:54', '2025-08-18 20:16:17'),
(83, 'Deajeng Oktavia', 'deajengoktavia06@gmail.com', NULL, '$2y$12$xhLxkl2TPqVfP4tcBBXXA.YfYs31adYUwkLtnTq7AENzwnFAW.o32', 'user', NULL, '2025-08-15 23:06:12', '2025-08-15 23:06:12'),
(85, 'Siska jesika', 'tatisukmawati457@gmail.com', NULL, '$2y$12$IB4e6uE9U4uamto6C4NzKu4kCkF7w/lzqoUkmD.Qry6dfkHkJr0pq', 'user', NULL, '2025-08-22 03:01:47', '2025-08-22 03:01:47'),
(86, 'Arisa', 'naqiesss@gmail.com', NULL, '$2y$12$hWV1jhCaiacTT7l9U0jEeuVumGZGJ6JaD2rIPLHKTfhzPZ0RDkGmG', 'user', NULL, '2025-08-24 14:07:55', '2025-08-24 14:07:55'),
(87, 'Angelia Shafira Harun', 'liamulyati899@gmail.com', NULL, '$2y$12$i8UMcHaOonINRoB73FyJzOE8BmLq4kV1FZNTF1hSRD9eHCtMw2u5.', 'user', NULL, '2025-08-25 04:40:15', '2025-08-25 04:40:15'),
(88, 'Cicin Rahmawati', 'cicinrahmawati75@gmail.com', NULL, '$2y$12$Bbcs2itqQqtECeMn.JjSGegvRxNhuNTBFQQyWKbPEKHCFp8tHjC3m', 'user', NULL, '2025-08-25 04:44:20', '2025-08-25 04:44:20'),
(89, 'Agus waringin', 'awsajah07@gmail.com', NULL, '$2y$12$a.Hxy6/E2c1PGjIPEKLE0.bsH8DWfDsMHZkehmtlzfSMJRDKp3oDu', 'user', NULL, '2025-08-26 19:03:26', '2025-08-26 19:03:26'),
(90, 'Fitri Apriliantini', 'fitriapril928@gmail.com', NULL, '$2y$12$dQeMRBEj2EKGV6/I01DNru3zaNOkfvzLO36eJ0E.8MJVxwPP0MWEa', 'user', NULL, '2025-08-26 19:03:27', '2025-08-26 19:03:27'),
(91, 'Aan Nuraeni', 'aannuraeni0606@gmail.com', NULL, '$2y$12$5cAvOsYvhP3e20f70ZWfEOHLIg9UKgfRfsgVC7qIXA7.bMoGc043G', 'user', NULL, '2025-08-26 19:03:38', '2025-08-26 19:03:38'),
(92, 'Nani Nuraeni', 'naninuraeni603@gmail.com', NULL, '$2y$12$XEdtVVRYI2v1Vq8Zs68Vg.FMbkiVjDwIXrY8WUmOp1ko4gaplRU2m', 'user', NULL, '2025-08-26 19:04:23', '2025-08-26 19:04:23'),
(93, 'Rahmat', 'rahmat83hidayatop@gmail.com', NULL, '$2y$12$RHHNdB067ml5n.LbGfHIg.vKA.sGgY4lkYXf.AzdKeBFyC8yhsHbC', 'user', NULL, '2025-08-26 19:04:31', '2025-08-26 19:04:31'),
(94, 'Iwan syarifudin', 'iwansyarifudin1979@gmail.com', NULL, '$2y$12$8XU00eFXkJiNyWr1REpZHObn3YDSUgbXVlZRQFMdL.XNxTm2o/JVW', 'user', NULL, '2025-08-26 19:04:50', '2025-08-26 19:04:50'),
(95, 'ANDRI ALBADRI', 'andrialbadri4@gmail.com', NULL, '$2y$12$0/juIQgNvkSUnjh29lQvfuRkf7XW3rdvw1nAc5U97nTCQ3Hny09fO', 'user', NULL, '2025-08-26 19:05:34', '2025-08-26 19:05:34'),
(96, 'Dodi Setia Budi', 'dodisetiabudi20@gmail.com', NULL, '$2y$12$ZNvg7ZtuvW40srBVweL8ZuhMyTOetfzEvQGpPYpzJCDQhPNwKKibO', 'user', NULL, '2025-08-26 19:08:35', '2025-08-26 19:08:35'),
(97, 'Hera Hermawan', 'herahermawan258@gmail.com', NULL, '$2y$12$JRZAuo6upm3XQCfefaqCLOuVfrzlEj1HaEV//zrnbRO7i9RxhcER.', 'user', NULL, '2025-08-26 19:09:18', '2025-08-26 19:09:18');

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
(20, 21, 'informasi_kesehatan', 4, 1, NULL, '2025-08-17 10:29:18', '2025-08-17 10:29:18'),
(21, 21, 'materi_pdf', 12, 1, NULL, '2025-08-17 10:29:43', '2025-08-17 10:29:43'),
(22, 21, 'materi_pdf', 10, 1, NULL, '2025-08-17 10:56:09', '2025-08-17 10:56:09'),
(23, 21, 'materi_pdf', 8, 1, NULL, '2025-08-17 10:56:34', '2025-08-17 10:56:34'),
(24, 21, 'materi_pdf', 5, 1, NULL, '2025-08-17 10:56:55', '2025-08-17 10:56:55'),
(25, 21, 'materi_video', 13, 1, NULL, '2025-08-17 10:57:23', '2025-08-17 10:57:23'),
(26, 21, 'materi_video', 11, 1, NULL, '2025-08-17 11:01:04', '2025-08-17 11:01:04'),
(27, 21, 'materi_video', 9, 1, NULL, '2025-08-17 11:02:21', '2025-08-17 11:02:21'),
(28, 21, 'materi_video', 7, 1, NULL, '2025-08-17 11:03:50', '2025-08-17 11:03:50'),
(29, 5, 'informasi_kesehatan', 4, 1, NULL, '2025-08-18 19:03:58', '2025-08-18 19:03:58'),
(30, 78, 'materi_video', 13, 1, NULL, '2025-08-18 20:14:14', '2025-08-18 20:14:14'),
(32, 5, 'materi_pdf', 15, 1, NULL, '2025-08-19 06:04:54', '2025-08-19 06:04:54'),
(33, 43, 'materi_pdf', 15, 1, NULL, '2025-08-19 16:46:06', '2025-08-19 16:46:06'),
(34, 43, 'materi_video', 13, 1, NULL, '2025-08-19 16:51:00', '2025-08-19 16:51:00'),
(35, 43, 'materi_pdf', 5, 1, NULL, '2025-08-19 17:01:56', '2025-08-19 17:01:56'),
(36, 57, 'informasi_kesehatan', 4, 1, NULL, '2025-08-19 23:49:34', '2025-08-19 23:49:34'),
(37, 24, 'materi_video', 13, 1, NULL, '2025-08-20 03:13:39', '2025-08-20 03:13:39'),
(38, 24, 'materi_video', 11, 1, NULL, '2025-08-20 03:18:13', '2025-08-20 03:18:13'),
(39, 24, 'materi_video', 9, 1, NULL, '2025-08-20 03:35:32', '2025-08-20 03:35:32'),
(40, 24, 'materi_video', 7, 1, NULL, '2025-08-20 03:40:04', '2025-08-20 03:40:04'),
(41, 24, 'materi_pdf', 15, 1, NULL, '2025-08-20 03:43:08', '2025-08-20 03:43:08'),
(42, 24, 'materi_pdf', 12, 1, NULL, '2025-08-20 03:43:18', '2025-08-20 03:43:18'),
(43, 24, 'materi_pdf', 10, 1, NULL, '2025-08-20 03:43:40', '2025-08-20 03:43:40'),
(44, 24, 'materi_pdf', 8, 1, NULL, '2025-08-20 03:44:10', '2025-08-20 03:44:10'),
(45, 24, 'materi_pdf', 5, 1, NULL, '2025-08-20 03:44:20', '2025-08-20 03:44:20'),
(46, 24, 'informasi_kesehatan', 4, 1, NULL, '2025-08-20 03:44:37', '2025-08-20 03:44:37'),
(47, 43, 'materi_video', 7, 1, NULL, '2025-08-20 17:05:31', '2025-08-20 17:05:31'),
(48, 43, 'materi_video', 11, 1, NULL, '2025-08-20 17:16:30', '2025-08-20 17:16:30'),
(49, 46, 'materi_video', 7, 1, NULL, '2025-08-21 23:09:32', '2025-08-21 23:09:32'),
(50, 75, 'informasi_kesehatan', 4, 1, NULL, '2025-08-21 23:20:51', '2025-08-21 23:20:51'),
(51, 33, 'materi_video', 13, 1, NULL, '2025-08-22 00:09:47', '2025-08-22 00:09:47'),
(52, 33, 'materi_video', 7, 1, NULL, '2025-08-22 00:15:03', '2025-08-22 00:15:03'),
(53, 22, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 02:44:24', '2025-08-22 02:44:24'),
(54, 22, 'materi_video', 13, 1, NULL, '2025-08-22 02:49:53', '2025-08-22 02:49:53'),
(55, 22, 'materi_pdf', 12, 1, NULL, '2025-08-22 02:52:18', '2025-08-22 02:52:18'),
(56, 48, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 02:52:21', '2025-08-22 02:52:21'),
(57, 48, 'materi_pdf', 12, 1, NULL, '2025-08-22 02:54:35', '2025-08-22 02:54:35'),
(58, 22, 'materi_video', 11, 1, NULL, '2025-08-22 02:55:02', '2025-08-22 02:55:02'),
(59, 22, 'materi_video', 9, 1, NULL, '2025-08-22 02:59:44', '2025-08-22 02:59:44'),
(60, 65, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 03:00:18', '2025-08-22 03:00:18'),
(61, 48, 'materi_pdf', 5, 1, NULL, '2025-08-22 03:01:04', '2025-08-22 03:01:04'),
(62, 85, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 03:01:58', '2025-08-22 03:01:58'),
(63, 22, 'materi_video', 7, 1, NULL, '2025-08-22 03:02:50', '2025-08-22 03:02:50'),
(64, 48, 'materi_video', 7, 1, NULL, '2025-08-22 03:03:01', '2025-08-22 03:03:01'),
(65, 85, 'materi_video', 13, 1, NULL, '2025-08-22 03:03:20', '2025-08-22 03:03:20'),
(66, 65, 'materi_video', 13, 1, NULL, '2025-08-22 03:23:36', '2025-08-22 03:23:36'),
(67, 65, 'materi_pdf', 15, 1, NULL, '2025-08-22 03:24:13', '2025-08-22 03:24:13'),
(68, 65, 'materi_pdf', 12, 1, NULL, '2025-08-22 03:25:31', '2025-08-22 03:25:31'),
(69, 65, 'materi_video', 11, 1, NULL, '2025-08-22 03:25:55', '2025-08-22 03:25:55'),
(70, 65, 'materi_pdf', 10, 1, NULL, '2025-08-22 03:30:05', '2025-08-22 03:30:05'),
(71, 65, 'materi_video', 9, 1, NULL, '2025-08-22 03:31:01', '2025-08-22 03:31:01'),
(72, 65, 'materi_video', 7, 1, NULL, '2025-08-22 03:39:29', '2025-08-22 03:39:29'),
(73, 65, 'materi_pdf', 8, 1, NULL, '2025-08-22 03:40:43', '2025-08-22 03:40:43'),
(74, 65, 'materi_pdf', 5, 1, NULL, '2025-08-22 03:40:55', '2025-08-22 03:40:55'),
(75, 56, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 05:14:33', '2025-08-22 05:14:33'),
(76, 56, 'materi_video', 13, 1, NULL, '2025-08-22 05:16:20', '2025-08-22 05:16:20'),
(77, 48, 'materi_pdf', 15, 1, NULL, '2025-08-22 16:44:23', '2025-08-22 16:44:23'),
(78, 48, 'materi_video', 13, 1, NULL, '2025-08-22 16:46:42', '2025-08-22 16:46:42'),
(79, 48, 'materi_pdf', 8, 1, NULL, '2025-08-22 16:48:59', '2025-08-22 16:48:59'),
(80, 48, 'materi_video', 11, 1, NULL, '2025-08-22 16:51:35', '2025-08-22 16:51:35'),
(81, 48, 'materi_pdf', 10, 1, NULL, '2025-08-22 16:52:30', '2025-08-22 16:52:30'),
(82, 48, 'materi_video', 9, 1, NULL, '2025-08-22 16:54:08', '2025-08-22 16:54:08'),
(83, 69, 'materi_video', 13, 1, NULL, '2025-08-22 16:57:51', '2025-08-22 16:57:51'),
(84, 69, 'materi_video', 11, 1, NULL, '2025-08-22 17:05:52', '2025-08-22 17:05:52'),
(85, 55, 'materi_video', 13, 1, NULL, '2025-08-22 20:05:26', '2025-08-22 20:05:26'),
(86, 55, 'materi_video', 11, 1, NULL, '2025-08-22 20:06:31', '2025-08-22 20:06:31'),
(87, 55, 'materi_video', 9, 1, NULL, '2025-08-22 20:07:04', '2025-08-22 20:07:04'),
(88, 55, 'materi_video', 7, 1, NULL, '2025-08-22 20:07:49', '2025-08-22 20:07:49'),
(89, 55, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 20:08:49', '2025-08-22 20:08:49'),
(90, 46, 'materi_video', 11, 1, NULL, '2025-08-22 21:34:11', '2025-08-22 21:34:11'),
(91, 22, 'materi_pdf', 5, 1, NULL, '2025-08-23 04:36:04', '2025-08-23 04:36:04'),
(92, 63, 'informasi_kesehatan', 4, 1, NULL, '2025-08-23 23:57:01', '2025-08-23 23:57:01'),
(93, 63, 'materi_pdf', 15, 1, NULL, '2025-08-23 23:58:21', '2025-08-23 23:58:21'),
(94, 63, 'materi_pdf', 5, 1, NULL, '2025-08-24 00:14:12', '2025-08-24 00:14:12'),
(95, 86, 'informasi_kesehatan', 4, 1, NULL, '2025-08-24 14:08:05', '2025-08-24 14:08:05'),
(96, 46, 'informasi_kesehatan', 4, 1, NULL, '2025-08-25 01:57:29', '2025-08-25 01:57:29'),
(97, 24, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:18:09', '2025-08-25 04:18:09'),
(98, 62, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:22:08', '2025-08-25 04:22:08'),
(99, 46, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:26:20', '2025-08-25 04:26:20'),
(100, 46, 'materi_video', 9, 1, NULL, '2025-08-25 04:27:36', '2025-08-25 04:27:36'),
(101, 63, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:35:00', '2025-08-25 04:35:00'),
(102, 21, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:35:09', '2025-08-25 04:35:09'),
(103, 62, 'zoom_room', 2, 1, NULL, '2025-08-25 04:35:26', '2025-08-25 04:35:26'),
(104, 56, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:37:36', '2025-08-25 04:37:36'),
(105, 56, 'zoom_room', 2, 1, NULL, '2025-08-25 04:37:44', '2025-08-25 04:37:44'),
(106, 25, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:38:55', '2025-08-25 04:38:55'),
(107, 24, 'zoom_room', 2, 1, NULL, '2025-08-25 04:39:18', '2025-08-25 04:39:18'),
(108, 43, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:39:23', '2025-08-25 04:39:23'),
(109, 87, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:40:31', '2025-08-25 04:40:31'),
(110, 88, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:44:32', '2025-08-25 04:44:32'),
(111, 65, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:44:56', '2025-08-25 04:44:56'),
(112, 88, 'zoom_room', 2, 1, NULL, '2025-08-25 04:45:52', '2025-08-25 04:45:52'),
(113, 85, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:49:32', '2025-08-25 04:49:32'),
(114, 21, 'zoom_room', 2, 1, NULL, '2025-08-25 04:57:42', '2025-08-25 04:57:42'),
(115, 5, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 04:58:01', '2025-08-25 04:58:01'),
(116, 33, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 05:12:49', '2025-08-25 05:12:49'),
(117, 22, 'zoom_detail_viewed', 2, 1, NULL, '2025-08-25 05:13:58', '2025-08-25 05:13:58'),
(118, 33, 'materi_video', 11, 1, NULL, '2025-08-25 05:27:32', '2025-08-25 05:27:32'),
(119, 21, 'materi_pdf', 15, 1, NULL, '2025-08-25 18:22:22', '2025-08-25 18:22:22'),
(120, 21, 'materi_pdf', 21, 1, NULL, '2025-08-25 18:27:33', '2025-08-25 18:27:33');

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
-- Dumping data untuk tabel `zoom_rooms`
--

INSERT INTO `zoom_rooms` (`id`, `judul`, `deskripsi`, `link_meeting`, `jadwal`, `created_by`, `created_at`, `updated_at`, `meeting_id`, `passcode`) VALUES
(2, 'Harmoni Tubuh: Langkah Harmonis Menjaga Kesehatan Payudara', 'Merawat payudara merupakan sebuah bentuk seni mencintai diri sendiri, sebuah investasi tak ternilai bagi masa depan setiap wanita. Ini bukan sekadar tentang menghindari penyakit, melainkan tentang membangun hubungan yang harmonis dengan tubuh, mengenali setiap sinyal dan perubahannya melalui deteksi dini yang cermat. Dengan pengetahuan yang tepat dan kepedulian yang tulus, kita mengubah ketakutan menjadi sebuah aksi pemberdayaan, memastikan bahwa aset paling berharga ini senantiasa terjaga demi meraih kehidupan yang lebih sehat, percaya diri, dan berkualitas.', 'https://us05web.zoom.us/j/82720895547?pwd=JdY11zzZeZHN8Y8qiCndnyJFXImmeJ.1', '2025-08-25 11:30:00', 20, '2025-08-25 04:06:01', '2025-08-25 04:06:01', '82720895547', '687251'),
(3, 'narkoba', NULL, 'https://us06web.zoom.us/j/84555277578?pwd=9aG3L2o6vVXGFCpn5HcuTR5UwZm7N3.1', '2025-08-28 02:23:00', 82, '2025-08-26 19:23:19', '2025-08-26 19:23:19', '84555277578', '436165');

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
-- Indeks untuk tabel `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forums_slug_unique` (`slug`);

--
-- Indeks untuk tabel `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_posts_thread_id_foreign` (`thread_id`),
  ADD KEY `forum_posts_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_threads_forum_id_foreign` (`forum_id`),
  ADD KEY `forum_threads_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=683;

--
-- AUTO_INCREMENT untuk tabel `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `consultation_categories`
--
ALTER TABLE `consultation_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `consultation_responses`
--
ALTER TABLE `consultation_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `download_logs`
--
ALTER TABLE `download_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `forum_threads`
--
ALTER TABLE `forum_threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `materis`
--
ALTER TABLE `materis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT untuk tabel `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Ketidakleluasaan untuk tabel `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_posts_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `forum_threads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD CONSTRAINT `forum_threads_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
