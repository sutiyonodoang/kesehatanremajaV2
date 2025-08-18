-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2025 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('pending','in_progress','resolved','closed','reopened') NOT NULL DEFAULT 'pending',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`id`, `user_id`, `category_id`, `title`, `description`, `priority`, `status`, `resolved_at`, `created_at`, `updated_at`) VALUES
(1, 21, 1, 'Sudah jarang makan tapi badan tetap gemuk', 'saya ada masalah dengan bb yang tidak ideal, beberapa cara yang pernah saya lakukan seperti .....\r\nnamun hingga sekarang bb masih belum ideal.', 'low', 'pending', NULL, '2025-08-13 23:00:17', '2025-08-13 23:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_attachments`
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
-- Table structure for table `consultation_categories`
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
-- Dumping data for table `consultation_categories`
--

INSERT INTO `consultation_categories` (`id`, `name`, `description`, `color`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Nutrisi & Diet', 'Konsultasi seputar nutrisi, diet, dan pola makan sehat', '#28a745', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(2, 'Olahraga & Fitness', 'Konsultasi seputar olahraga, fitness, dan aktivitas fisik', '#007bff', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(3, 'Kesehatan Mental', 'Konsultasi seputar kesehatan mental dan psikologi', '#6f42c1', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(4, 'Penyakit & Pengobatan', 'Konsultasi seputar penyakit dan pengobatan', '#dc3545', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(5, 'Kesehatan Wanita', 'Konsultasi khusus kesehatan wanita', '#e83e8c', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(6, 'Kesehatan Pria', 'Konsultasi khusus kesehatan pria', '#fd7e14', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(7, 'Kesehatan Anak', 'Konsultasi seputar kesehatan anak dan tumbuh kembang', '#20c997', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(8, 'Kesehatan Lansia', 'Konsultasi seputar kesehatan lansia', '#6c757d', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32'),
(9, 'Lainnya', 'Konsultasi kesehatan lainnya', '#6c757d', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_responses`
--

CREATE TABLE `consultation_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `response` text NOT NULL,
  `internal_notes` text DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download_logs`
--

CREATE TABLE `download_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `materi_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `download_logs`
--

INSERT INTO `download_logs` (`id`, `user_id`, `materi_id`, `created_at`, `updated_at`) VALUES
(1, 21, 12, '2025-08-12 09:14:22', '2025-08-12 09:14:22'),
(2, 21, 12, '2025-08-12 09:14:32', '2025-08-12 09:14:32'),
(3, 21, 12, '2025-08-12 12:30:14', '2025-08-12 12:30:14'),
(4, 21, 5, '2025-08-12 12:52:20', '2025-08-12 12:52:20'),
(5, 21, 10, '2025-08-12 14:20:07', '2025-08-12 14:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `informasi_kesehatan`
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
-- Dumping data for table `informasi_kesehatan`
--

INSERT INTO `informasi_kesehatan` (`id`, `judul`, `deskripsi`, `link_sumber`, `tanggal_update`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Kesehatan Remaja', 'kesehatan pada remaja', 'https://ayosehat.kemkes.go.id/kategori-usia/remaja', '2025-07-03', 3, '2025-07-02 22:28:57', '2025-07-02 22:28:57'),
(5, 'Kesehatan Remaja', 'ff', 'https://sourceforge.net/projects/xampp/', '2025-07-07', 3, '2025-07-06 18:05:35', '2025-07-06 18:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `komentars`
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
-- Dumping data for table `komentars`
--

INSERT INTO `komentars` (`id`, `materi_id`, `user_id`, `isi_komentar`, `balasan_admin`, `created_at`, `updated_at`) VALUES
(3, 7, 21, 'gue bangett', NULL, '2025-08-12 09:14:11', '2025-08-12 09:14:11'),
(4, 13, 21, 'singkat padat mudah difahami', NULL, '2025-08-12 12:38:58', '2025-08-12 12:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `materi_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 7, 21, '2025-08-12 09:13:52', '2025-08-12 09:13:52'),
(5, 12, 21, '2025-08-12 09:39:42', '2025-08-12 09:39:42'),
(6, 13, 21, '2025-08-12 10:03:02', '2025-08-12 10:03:02'),
(7, 5, 21, '2025-08-12 12:52:31', '2025-08-12 12:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `materis`
--

CREATE TABLE `materis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `kategori` enum('pola_hidup_sehat','reproduksi','kesehatan_mental','gizi','narkoba') NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis` varchar(255) NOT NULL COMMENT 'pdf, doc, link, video',
  `file_path` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materis`
--

INSERT INTO `materis` (`id`, `judul`, `slug`, `kategori`, `deskripsi`, `jenis`, `file_path`, `link`, `created_at`, `updated_at`, `status`) VALUES
(5, 'Gizi Remaja', NULL, 'pola_hidup_sehat', NULL, 'pdf', 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf', NULL, '2025-08-05 16:48:19', '2025-08-05 16:48:19', 'aktif'),
(7, 'Edukasi Gizi Seimbang', NULL, 'pola_hidup_sehat', NULL, 'video', 'materi_files/e15miiQKxnqwOVOhnvf0Utphc3vyWOOKp3KKpsZc.mp4', NULL, '2025-08-05 16:50:17', '2025-08-05 16:50:17', 'aktif'),
(8, 'Waspada Narkoba', NULL, 'pola_hidup_sehat', NULL, 'pdf', 'materi_files/k7lnvjhH5r9nUgfsfT1LK6SbWbfYnxgoehQqhPp6.pdf', NULL, '2025-08-05 16:51:38', '2025-08-05 16:51:38', 'aktif'),
(9, 'Pencegahan Penyalahgunaan NAPZA Remaja', NULL, 'pola_hidup_sehat', NULL, 'video', 'materi_files/1iZi3rMHfEd9cscmxdSSg1wcALlZlWA6zOHtEjLv.mp4', NULL, '2025-08-05 16:53:27', '2025-08-05 16:53:27', 'aktif'),
(10, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, 'pdf', 'materi_files/t6Q4UYMPGoNRRKdjlsSeiHSF0j9oW4zMjZhkOLC2.pdf', NULL, '2025-08-05 16:54:34', '2025-08-05 16:54:34', 'aktif'),
(11, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, 'video', 'materi_files/UKiSoYORnokknTtEcOVKIl1PQQUFR2zRKJF6dCQ3.mp4', NULL, '2025-08-05 16:55:06', '2025-08-05 16:55:06', 'aktif'),
(12, 'Kesehatan Mental dan Manajemen Stress Remaja', NULL, 'kesehatan_mental', NULL, 'pdf', 'materi_files/mdltEb7NksMZfbeD2L3ckit7brcBTdWOU82SYbT9.pdf', NULL, '2025-08-05 16:55:49', '2025-08-05 16:55:49', 'aktif'),
(13, 'Sehatkah Jiwaku?', NULL, 'kesehatan_mental', NULL, 'video', 'materi_files/MxCD3f373J3gJRfYSKDTr1MAGs46UfetlP6vx1wQ.mp4', NULL, '2025-08-05 16:56:29', '2025-08-05 16:56:29', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
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
(20, '2025_08_14_055611_add_role_konsultan_to_users_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('depiacomputer@gmail.com', '$2y$12$sXnjEgYIFvSJCHdri4uL6ejGzA46Osrs3AIZqV0Lxb8pBLKuR70gy', '2025-07-09 00:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('YeociVFOQzMJd9TiasDUKYEeN99qhgqlN9lv75Ec', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSFlzVW5POE1yZ1psZFlySWhHdlFrdEFpV0NiSXN1R2JJUzdBdFBLaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL21hdGVyaSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIxO30=', 1755167710);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Devia', 'dviafnopiani@gmail.com', NULL, '$2y$12$uwJqDHWRsqtwP8GyZubAceqS/ueSOJ5KLELQzAE6BZcNwadov7/5O', 'admin', NULL, '2025-07-01 02:42:59', '2025-07-01 02:42:59'),
(5, 'devia', 'depiacomputer@gmail.com', NULL, '$2y$12$3D43kv3gQngMrloJErHuEeJZWBh/sYoOD.oWgSd4YzLov3mY7hw5q', 'user', NULL, '2025-07-02 21:58:25', '2025-07-02 21:58:25'),
(20, 'Sutiyono', 'sutiyonodoang@gmail.com', NULL, '$2y$12$3g5exqqoWA9D0YMeUb.I6u24x.7pvkbVniU8qWC9w4cipZF9kguPO', 'admin', NULL, '2025-08-12 03:31:42', '2025-08-12 03:31:42'),
(21, 'tiyo', 'tiyo@unibba.ac.id', NULL, '$2y$12$DstenL5MmETo8tsvkiiEP.vcPzLnvXidt6Rwdrs.88OsJDR9BSV1a', 'user', NULL, '2025-08-12 03:35:06', '2025-08-12 03:35:06'),
(22, 'Dr. Sarah Konsultan', 'konsultan@example.com', '2025-08-13 23:15:19', '$2y$12$pTabMvTMn51M/7O2skpPMuWiN3Ycw81lyvAb/puXXAwi0jObD/Xtu', 'konsultan', NULL, '2025-08-13 23:15:19', '2025-08-13 23:15:19'),
(23, 'Dr. Ahmad Spesialis', 'ahmad.konsultan@example.com', '2025-08-13 23:15:19', '$2y$12$s7MfXC5/Kuo30HFhTSx5SO4K5Kk/5aFJRV.bpZtg9A9tkHaFPz5qq', 'konsultan', NULL, '2025-08-13 23:15:19', '2025-08-13 23:15:19'),
(24, 'Dr. Maria Gizi', 'maria.konsultan@example.com', '2025-08-13 23:15:20', '$2y$12$7ys9UvpEthswuO8hl256Kewap/G.voBf5nTSI8.IJqUDmudUmlu5O', 'konsultan', NULL, '2025-08-13 23:15:20', '2025-08-13 23:15:20'),
(25, 'qian', 'qian@rwselasasih.com', NULL, '$2y$12$Snwbl9pXP4au3VHbwdfeRuOctzl3BOzOb1LyhBG3O2qwIPaB/idAe', 'konsultan', NULL, '2025-08-14 00:58:59', '2025-08-14 00:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
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
-- Dumping data for table `user_progress`
--

INSERT INTO `user_progress` (`id`, `user_id`, `content_type`, `content_id`, `is_completed`, `progress_data`, `created_at`, `updated_at`) VALUES
(1, 21, 'materi_pdf', 12, 1, NULL, '2025-08-12 12:30:14', '2025-08-12 12:30:14'),
(2, 21, 'materi_pdf', 5, 1, NULL, '2025-08-12 12:52:20', '2025-08-12 12:52:20'),
(3, 21, 'materi_video', 13, 1, NULL, '2025-08-12 14:11:07', '2025-08-12 14:11:07'),
(4, 21, 'informasi_kesehatan', 5, 1, NULL, '2025-08-12 14:18:55', '2025-08-12 14:18:55'),
(5, 21, 'informasi_kesehatan', 4, 1, NULL, '2025-08-12 14:19:46', '2025-08-12 14:19:46'),
(6, 21, 'materi_pdf', 10, 1, NULL, '2025-08-12 14:20:07', '2025-08-12 14:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_rooms`
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
-- Dumping data for table `zoom_rooms`
--

INSERT INTO `zoom_rooms` (`id`, `judul`, `deskripsi`, `link_meeting`, `jadwal`, `created_by`, `created_at`, `updated_at`, `meeting_id`, `passcode`) VALUES
(1, 'Deteksi Dini Kanker Payudara pada Remaja', NULL, 'https://us05web.zoom.us/j/87053542008?pwd=Yx2uHF9JDzFbFoDJbSG3FDmyK3jkSg.1', '2025-08-20 02:00:00', 20, '2025-08-12 10:10:27', '2025-08-12 10:10:27', '87053542008', 'rH6QAB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultations_user_id_foreign` (`user_id`),
  ADD KEY `consultations_category_id_foreign` (`category_id`);

--
-- Indexes for table `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultation_attachments_consultation_id_foreign` (`consultation_id`),
  ADD KEY `consultation_attachments_response_id_foreign` (`response_id`);

--
-- Indexes for table `consultation_categories`
--
ALTER TABLE `consultation_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultation_responses`
--
ALTER TABLE `consultation_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultation_responses_consultation_id_foreign` (`consultation_id`),
  ADD KEY `consultation_responses_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `download_logs`
--
ALTER TABLE `download_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `download_logs_user_id_foreign` (`user_id`),
  ADD KEY `download_logs_materi_id_foreign` (`materi_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `informasi_kesehatan_created_by_foreign` (`created_by`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentars`
--
ALTER TABLE `komentars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentars_materi_id_foreign` (`materi_id`),
  ADD KEY `komentars_user_id_foreign` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_materi_id_foreign` (`materi_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `materis`
--
ALTER TABLE `materis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materis_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_progress_user_id_content_type_content_id_unique` (`user_id`,`content_type`,`content_id`);

--
-- Indexes for table `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zoom_rooms_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultation_categories`
--
ALTER TABLE `consultation_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `consultation_responses`
--
ALTER TABLE `consultation_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download_logs`
--
ALTER TABLE `download_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komentars`
--
ALTER TABLE `komentars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `materis`
--
ALTER TABLE `materis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `consultation_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consultation_attachments`
--
ALTER TABLE `consultation_attachments`
  ADD CONSTRAINT `consultation_attachments_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultation_attachments_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `consultation_responses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consultation_responses`
--
ALTER TABLE `consultation_responses`
  ADD CONSTRAINT `consultation_responses_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultation_responses_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `download_logs`
--
ALTER TABLE `download_logs`
  ADD CONSTRAINT `download_logs_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `download_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `informasi_kesehatan`
--
ALTER TABLE `informasi_kesehatan`
  ADD CONSTRAINT `informasi_kesehatan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `komentars`
--
ALTER TABLE `komentars`
  ADD CONSTRAINT `komentars_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `komentars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zoom_rooms`
--
ALTER TABLE `zoom_rooms`
  ADD CONSTRAINT `zoom_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
