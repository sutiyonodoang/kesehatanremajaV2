/*
 Navicat Premium Data Transfer

 Source Server         : mysql-local
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : kesehatan_platform1

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 25/08/2025 17:12:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_id` bigint UNSIGNED NULL DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `causer_id` bigint UNSIGNED NULL DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject`(`subject_type` ASC, `subject_id` ASC) USING BTREE,
  INDEX `causer`(`causer_type` ASC, `causer_id` ASC) USING BTREE,
  INDEX `activity_log_log_name_index`(`log_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES (1, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 07:30:19', '2025-08-18 07:30:19');
INSERT INTO `activity_log` VALUES (2, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 07:30:33', '2025-08-18 07:30:33');
INSERT INTO `activity_log` VALUES (3, 'default', 'created', 'App\\Models\\Like', 'created', 10, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":12,\"user_id\":21}}', NULL, '2025-08-18 08:11:58', '2025-08-18 08:11:58');
INSERT INTO `activity_log` VALUES (4, 'default', 'created', 'App\\Models\\Like', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":7,\"user_id\":21}}', NULL, '2025-08-18 08:12:08', '2025-08-18 08:12:08');
INSERT INTO `activity_log` VALUES (5, 'default', 'created', 'App\\Models\\Like', 'created', 12, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":5,\"user_id\":21}}', NULL, '2025-08-18 08:12:18', '2025-08-18 08:12:18');
INSERT INTO `activity_log` VALUES (6, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:13:18', '2025-08-18 08:13:18');
INSERT INTO `activity_log` VALUES (7, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:13:32', '2025-08-18 08:13:32');
INSERT INTO `activity_log` VALUES (8, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:13:32', '2025-08-18 08:13:32');
INSERT INTO `activity_log` VALUES (9, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:24:33', '2025-08-18 08:24:33');
INSERT INTO `activity_log` VALUES (10, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:24:48', '2025-08-18 08:24:48');
INSERT INTO `activity_log` VALUES (11, 'default', 'created', 'App\\Models\\Like', 'created', 13, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":11,\"user_id\":21}}', NULL, '2025-08-18 08:25:04', '2025-08-18 08:25:04');
INSERT INTO `activity_log` VALUES (12, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 11, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"materi_id\":10}}', NULL, '2025-08-18 08:25:31', '2025-08-18 08:25:31');
INSERT INTO `activity_log` VALUES (13, 'default', 'created', 'App\\Models\\Like', 'created', 14, 'App\\Models\\User', 21, '{\"attributes\":{\"materi_id\":10,\"user_id\":21}}', NULL, '2025-08-18 08:28:31', '2025-08-18 08:28:31');
INSERT INTO `activity_log` VALUES (14, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:28:49', '2025-08-18 08:28:49');
INSERT INTO `activity_log` VALUES (15, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:29:07', '2025-08-18 08:29:07');
INSERT INTO `activity_log` VALUES (16, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:29:07', '2025-08-18 08:29:07');
INSERT INTO `activity_log` VALUES (17, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:30:42', '2025-08-18 08:30:42');
INSERT INTO `activity_log` VALUES (18, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:30:55', '2025-08-18 08:30:55');
INSERT INTO `activity_log` VALUES (19, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:31:17', '2025-08-18 08:31:17');
INSERT INTO `activity_log` VALUES (20, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:31:31', '2025-08-18 08:31:31');
INSERT INTO `activity_log` VALUES (21, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:31:31', '2025-08-18 08:31:31');
INSERT INTO `activity_log` VALUES (22, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"consultation_id\":5,\"user_id\":20,\"is_responder\":true,\"response\":\"beberapa tips olahraga yang baik dan sehat agar kamu bisa mendapatkan manfaat maksimal dari aktivitas fisik tanpa cedera:\\r\\n\\r\\n1. Tentukan Tujuan dengan Jelas\\r\\nApakah ingin menurunkan berat badan, meningkatkan kekuatan, atau sekadar menjaga kesehatan?\\r\\nTujuan yang jelas membantumu memilih jenis olahraga yang tepat (misalnya: lari untuk kardio, angkat beban untuk kekuatan).\\r\\n2. Mulai Perlahan dan Konsisten\\r\\nJangan langsung memaksakan diri. Mulai dari intensitas ringan hingga sedang.\\r\\nKonsistensi lebih penting daripada durasi atau intensitas. Lebih baik olahraga\\r\\n30 menit setiap hari daripada 2 jam sekali seminggu.\\r\\n3. Pilih Jenis Olahraga yang Disukai\\r\\nPilih aktivitas yang menyenangkan seperti bersepeda, berenang, menari, atau jalan kaki santai.\\r\\nDengan menikmati olahraga, kamu lebih mudah bertahan dalam jangka panjang.\\r\\n4. Lakukan Pemanasan dan Pendinginan\\r\\nPemanasan (5\\u201310 menit): seperti jalan cepat atau gerakan ringan untuk mempersiapkan otot.\\r\\nPendinginan (5\\u201310 menit): seperti peregangan setelah olahraga untuk mencegah kram dan mempercepat pemulihan.\\r\\n5. Gabungkan Jenis Latihan\\r\\nKardio (jantung): lari, berenang, sepeda \\u2013 3\\u20135 kali seminggu.\\r\\nKekuatan otot: angkat beban, squat, push-up \\u2013 2\\u20133 kali seminggu.\\r\\nKelenturan & keseimbangan: yoga, pilates, peregangan \\u2013 bantu mencegah cedera.\\r\\n6. Dengarkan Tubuhmu\\r\\nJika merasa nyeri tajam, lelah berlebihan, atau pusing, hentikan dan istirahat.\\r\\nNyeri otot ringan (DOMS) setelah latihan normal, tapi nyeri sendi atau otot yang tajam tidak normal.\\r\\n7. Jaga Hidrasi dan Nutrisi\\r\\nMinum air sebelum, selama, dan setelah olahraga.\\r\\nKonsumsi makanan bergizi untuk mendukung energi dan pemulihan otot (protein, karbohidrat kompleks, vitamin).\\r\\n8. Istirahat yang Cukup\\r\\nTubuh perlu waktu untuk pulih. Beri jeda antar sesi latihan, terutama untuk otot yang sama.\\r\\nTidur 7\\u20139 jam per malam sangat penting untuk pemulihan.\\r\\n9. Gunakan Perlengkapan yang Tepat\\r\\nSepatu olahraga yang nyaman, pakaian menyerap keringat, dan alat bantu jika diperlukan.\\r\\nIni membantu mencegah cedera dan meningkatkan kenyamanan.\\r\\n10. Konsultasi dengan Ahli (jika perlu)\\r\\nJika punya kondisi kesehatan tertentu (diabetes, jantung, dll), konsultasikan dulu dengan dokter atau pelatih profesional.\\r\\nPelatih bisa membantu membuat program latihan yang aman dan efektif.\\r\\nBonus: Buat Jadwal dan Catat Kemajuan\\r\\nJadwalkan olahraga seperti janji penting.\\r\\nCatat aktivitas, durasi, dan perasaan setelah olahraga \\u2013 ini memotivasi dan membantumu melihat perkembangan.\\r\\nIngat, Olahraga bukan hanya soal bentuk tubuh, tapi juga kesehatan mental, energi, dan kualitas hidup secara keseluruhan.\",\"is_public\":true}}', NULL, '2025-08-18 08:34:44', '2025-08-18 08:34:44');
INSERT INTO `activity_log` VALUES (23, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-18 08:34:44', '2025-08-18 08:34:44');
INSERT INTO `activity_log` VALUES (24, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:40:36', '2025-08-18 08:40:36');
INSERT INTO `activity_log` VALUES (25, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:40:51', '2025-08-18 08:40:51');
INSERT INTO `activity_log` VALUES (26, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 6, 'App\\Models\\User', 21, '{\"attributes\":{\"consultation_id\":5,\"user_id\":21,\"is_responder\":false,\"response\":\"Baik, terima kasih atas respon dan sarannya, akan saya coba pak\\/bu.\\r\\n\\r\\nterima kasih\",\"is_public\":true}}', NULL, '2025-08-18 08:42:29', '2025-08-18 08:42:29');
INSERT INTO `activity_log` VALUES (27, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:42:39', '2025-08-18 08:42:39');
INSERT INTO `activity_log` VALUES (28, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:42:54', '2025-08-18 08:42:54');
INSERT INTO `activity_log` VALUES (29, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:42:54', '2025-08-18 08:42:54');
INSERT INTO `activity_log` VALUES (30, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 5, 'App\\Models\\User', 20, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-18 08:43:22', '2025-08-18 08:43:22');
INSERT INTO `activity_log` VALUES (31, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 08:49:05', '2025-08-18 08:49:05');
INSERT INTO `activity_log` VALUES (32, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 08:49:22', '2025-08-18 08:49:22');
INSERT INTO `activity_log` VALUES (33, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-18 09:04:08', '2025-08-18 09:04:08');
INSERT INTO `activity_log` VALUES (34, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:22', '2025-08-18 09:04:22');
INSERT INTO `activity_log` VALUES (35, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:22', '2025-08-18 09:04:22');
INSERT INTO `activity_log` VALUES (36, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:04:49', '2025-08-18 09:04:49');
INSERT INTO `activity_log` VALUES (37, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:05:06', '2025-08-18 09:05:06');
INSERT INTO `activity_log` VALUES (38, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:05:06', '2025-08-18 09:05:06');
INSERT INTO `activity_log` VALUES (39, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 09:26:57', '2025-08-18 09:26:57');
INSERT INTO `activity_log` VALUES (40, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 17:59:38', '2025-08-18 17:59:38');
INSERT INTO `activity_log` VALUES (41, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 17:59:38', '2025-08-18 17:59:38');
INSERT INTO `activity_log` VALUES (42, 'default', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 20, '{\"attributes\":{\"name\":\"Tiyo\"},\"old\":{\"name\":\"rio\"}}', NULL, '2025-08-18 18:00:18', '2025-08-18 18:00:18');
INSERT INTO `activity_log` VALUES (43, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 18:31:03', '2025-08-18 18:31:03');
INSERT INTO `activity_log` VALUES (44, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-18 18:31:03', '2025-08-18 18:31:03');
INSERT INTO `activity_log` VALUES (45, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 01:31:26', '2025-08-19 01:31:26');
INSERT INTO `activity_log` VALUES (46, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 01:31:26', '2025-08-19 01:31:26');
INSERT INTO `activity_log` VALUES (47, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 02:01:06', '2025-08-19 02:01:06');
INSERT INTO `activity_log` VALUES (48, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 02:01:06', '2025-08-19 02:01:06');
INSERT INTO `activity_log` VALUES (49, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 02:02:11', '2025-08-19 02:02:11');
INSERT INTO `activity_log` VALUES (50, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 02:02:31', '2025-08-19 02:02:31');
INSERT INTO `activity_log` VALUES (51, 'default', 'created', 'App\\Models\\UserProgress', 'created', 29, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 02:03:58', '2025-08-19 02:03:58');
INSERT INTO `activity_log` VALUES (52, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 02:08:48', '2025-08-19 02:08:48');
INSERT INTO `activity_log` VALUES (53, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 02:09:02', '2025-08-19 02:09:02');
INSERT INTO `activity_log` VALUES (54, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 02:09:02', '2025-08-19 02:09:02');
INSERT INTO `activity_log` VALUES (55, 'default', 'User logged in', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-19 03:13:07', '2025-08-19 03:13:07');
INSERT INTO `activity_log` VALUES (56, 'default', 'created', 'App\\Models\\UserProgress', 'created', 30, 'App\\Models\\User', 78, '{\"attributes\":{\"user_id\":78,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 03:14:14', '2025-08-19 03:14:14');
INSERT INTO `activity_log` VALUES (57, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:15:51', '2025-08-19 03:15:51');
INSERT INTO `activity_log` VALUES (58, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:15:51', '2025-08-19 03:15:51');
INSERT INTO `activity_log` VALUES (59, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:17:08', '2025-08-19 03:17:08');
INSERT INTO `activity_log` VALUES (60, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:17:34', '2025-08-19 03:17:34');
INSERT INTO `activity_log` VALUES (61, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:17:34', '2025-08-19 03:17:34');
INSERT INTO `activity_log` VALUES (62, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:28:02', '2025-08-19 03:28:02');
INSERT INTO `activity_log` VALUES (63, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:28:42', '2025-08-19 03:28:42');
INSERT INTO `activity_log` VALUES (64, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:28:42', '2025-08-19 03:28:42');
INSERT INTO `activity_log` VALUES (65, 'default', 'User logged out', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-19 03:31:10', '2025-08-19 03:31:10');
INSERT INTO `activity_log` VALUES (66, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:34:51', '2025-08-19 03:34:51');
INSERT INTO `activity_log` VALUES (67, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:34:51', '2025-08-19 03:34:51');
INSERT INTO `activity_log` VALUES (68, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:36:10', '2025-08-19 03:36:10');
INSERT INTO `activity_log` VALUES (69, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:36:10', '2025-08-19 03:36:10');
INSERT INTO `activity_log` VALUES (70, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:41:37', '2025-08-19 03:41:37');
INSERT INTO `activity_log` VALUES (71, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 03:41:47', '2025-08-19 03:41:47');
INSERT INTO `activity_log` VALUES (72, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 03:42:49', '2025-08-19 03:42:49');
INSERT INTO `activity_log` VALUES (73, 'default', 'User logged out', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:45:12', '2025-08-19 03:45:12');
INSERT INTO `activity_log` VALUES (74, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 03:45:29', '2025-08-19 03:45:29');
INSERT INTO `activity_log` VALUES (75, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:45:39', '2025-08-19 03:45:39');
INSERT INTO `activity_log` VALUES (76, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:46:12', '2025-08-19 03:46:12');
INSERT INTO `activity_log` VALUES (77, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-19 03:46:12', '2025-08-19 03:46:12');
INSERT INTO `activity_log` VALUES (78, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:53:32', '2025-08-19 03:53:32');
INSERT INTO `activity_log` VALUES (79, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 03:53:32', '2025-08-19 03:53:32');
INSERT INTO `activity_log` VALUES (80, 'default', 'created', 'App\\Models\\User', 'created', 84, NULL, NULL, '{\"attributes\":{\"name\":\"Adam\",\"email\":\"adamsetiadijr07@gmail.com\",\"password\":\"$2y$12$a9j5r\\/BwFc5CFYHUJvCoAuMLtO0pXSDgUCneJjNccBx9qklvlQJO6\"}}', NULL, '2025-08-19 03:53:42', '2025-08-19 03:53:42');
INSERT INTO `activity_log` VALUES (81, 'default', 'created', 'App\\Models\\UserProgress', 'created', 31, 'App\\Models\\User', 84, '{\"attributes\":{\"user_id\":84,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 03:54:49', '2025-08-19 03:54:49');
INSERT INTO `activity_log` VALUES (82, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 04:11:19', '2025-08-19 04:11:19');
INSERT INTO `activity_log` VALUES (83, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 04:29:57', '2025-08-19 04:29:57');
INSERT INTO `activity_log` VALUES (84, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 04:30:10', '2025-08-19 04:30:10');
INSERT INTO `activity_log` VALUES (85, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 04:31:54', '2025-08-19 04:31:54');
INSERT INTO `activity_log` VALUES (86, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 04:32:07', '2025-08-19 04:32:07');
INSERT INTO `activity_log` VALUES (87, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 04:32:07', '2025-08-19 04:32:07');
INSERT INTO `activity_log` VALUES (88, 'default', 'User logged in', 'App\\Models\\User', NULL, 78, 'App\\Models\\User', 78, '[]', NULL, '2025-08-19 04:54:23', '2025-08-19 04:54:23');
INSERT INTO `activity_log` VALUES (89, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 08:59:28', '2025-08-19 08:59:28');
INSERT INTO `activity_log` VALUES (90, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 09:27:10', '2025-08-19 09:27:10');
INSERT INTO `activity_log` VALUES (91, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 09:30:15', '2025-08-19 09:30:15');
INSERT INTO `activity_log` VALUES (92, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 09:42:03', '2025-08-19 09:42:03');
INSERT INTO `activity_log` VALUES (93, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 09:42:20', '2025-08-19 09:42:20');
INSERT INTO `activity_log` VALUES (94, 'default', 'created', 'App\\Models\\Consultation', 'created', 6, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes konsul\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 09:51:04', '2025-08-19 09:51:04');
INSERT INTO `activity_log` VALUES (95, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 6, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes konsul\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 09:51:16', '2025-08-19 09:51:16');
INSERT INTO `activity_log` VALUES (96, 'default', 'created', 'App\\Models\\Consultation', 'created', 7, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":2,\"title\":\"testes\",\"description\":\"tes\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 09:53:20', '2025-08-19 09:53:20');
INSERT INTO `activity_log` VALUES (97, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 7, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":2,\"title\":\"testes\",\"description\":\"tes\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 09:53:24', '2025-08-19 09:53:24');
INSERT INTO `activity_log` VALUES (98, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 12:52:30', '2025-08-19 12:52:30');
INSERT INTO `activity_log` VALUES (99, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 12:52:30', '2025-08-19 12:52:30');
INSERT INTO `activity_log` VALUES (100, 'default', 'created', 'App\\Models\\Materi', 'created', 15, 'App\\Models\\User', 3, '{\"attributes\":{\"judul\":\"Perawatan Payudara\",\"slug\":\"perawatan-payudara\",\"kategori\":\"reproduksi\",\"deskripsi\":null,\"sumber\":null,\"jenis\":\"pdf\",\"file_path\":\"materi_files\\/g36nD9ysTRxp95qwEhNfPwtpnlKpkwvgT58Mq8Vk.pdf\"}}', NULL, '2025-08-19 12:53:49', '2025-08-19 12:53:49');
INSERT INTO `activity_log` VALUES (101, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 12:54:48', '2025-08-19 12:54:48');
INSERT INTO `activity_log` VALUES (102, 'default', 'created', 'App\\Models\\Consultation', 'created', 8, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"category_id\":1,\"title\":\"menjaga daya tahan tubuh\",\"description\":\"bagaimana cara menjaga daya tahan tubuh supaya tidak mudah sakit?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 12:55:37', '2025-08-19 12:55:37');
INSERT INTO `activity_log` VALUES (103, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 7, 'App\\Models\\User', 3, '{\"attributes\":{\"consultation_id\":8,\"user_id\":3,\"is_responder\":true,\"response\":\"Untuk menjaga daya tahan tubuh, usahakan makan bergizi seimbang, cukup tidur, rutin olahraga, minum air putih yang cukup, dan kelola stres dengan baik. Hindari begadang serta kebiasaan tidak sehat agar tubuh tetap fit dan tidak mudah sakit.\",\"is_public\":true}}', NULL, '2025-08-19 12:56:26', '2025-08-19 12:56:26');
INSERT INTO `activity_log` VALUES (104, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-19 12:56:26', '2025-08-19 12:56:26');
INSERT INTO `activity_log` VALUES (105, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 8, 'App\\Models\\User', 5, '{\"attributes\":{\"consultation_id\":8,\"user_id\":5,\"is_responder\":false,\"response\":\"berapa lama waktu tidur yang ideal agar tubuh tetap sehat dan tidak mudah lelah?\",\"is_public\":true}}', NULL, '2025-08-19 12:57:44', '2025-08-19 12:57:44');
INSERT INTO `activity_log` VALUES (106, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 9, 'App\\Models\\User', 3, '{\"attributes\":{\"consultation_id\":8,\"user_id\":3,\"is_responder\":true,\"response\":\"Waktu tidur ideal untuk remaja dan dewasa adalah sekitar 7\\u20139 jam per malam. Tidur cukup membantu tubuh memulihkan energi, menjaga daya tahan tubuh, dan membuat konsentrasi lebih baik di siang hari.\",\"is_public\":true}}', NULL, '2025-08-19 12:58:07', '2025-08-19 12:58:07');
INSERT INTO `activity_log` VALUES (107, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 8, 'App\\Models\\User', 3, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-19 12:59:27', '2025-08-19 12:59:27');
INSERT INTO `activity_log` VALUES (108, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 12, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"materi_id\":15}}', NULL, '2025-08-19 13:04:54', '2025-08-19 13:04:54');
INSERT INTO `activity_log` VALUES (109, 'default', 'created', 'App\\Models\\UserProgress', 'created', 32, 'App\\Models\\User', 5, '{\"attributes\":{\"user_id\":5,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 13:04:54', '2025-08-19 13:04:54');
INSERT INTO `activity_log` VALUES (110, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-19 13:05:06', '2025-08-19 13:05:06');
INSERT INTO `activity_log` VALUES (111, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-19 13:05:08', '2025-08-19 13:05:08');
INSERT INTO `activity_log` VALUES (112, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 20:10:33', '2025-08-19 20:10:33');
INSERT INTO `activity_log` VALUES (113, 'default', 'created', 'App\\Models\\Consultation', 'created', 9, 'App\\Models\\User', 21, '{\"attributes\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 20:11:47', '2025-08-19 20:11:47');
INSERT INTO `activity_log` VALUES (114, 'default', 'deleted', 'App\\Models\\Consultation', 'deleted', 9, 'App\\Models\\User', 21, '{\"old\":{\"user_id\":21,\"category_id\":1,\"title\":\"tes\",\"description\":\"tes\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-19 20:12:06', '2025-08-19 20:12:06');
INSERT INTO `activity_log` VALUES (115, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-19 21:00:16', '2025-08-19 21:00:16');
INSERT INTO `activity_log` VALUES (116, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 21:00:42', '2025-08-19 21:00:42');
INSERT INTO `activity_log` VALUES (117, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 21:00:42', '2025-08-19 21:00:42');
INSERT INTO `activity_log` VALUES (118, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 21:14:42', '2025-08-19 21:14:42');
INSERT INTO `activity_log` VALUES (119, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 21:15:01', '2025-08-19 21:15:01');
INSERT INTO `activity_log` VALUES (120, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-19 21:15:01', '2025-08-19 21:15:01');
INSERT INTO `activity_log` VALUES (121, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-19 23:45:18', '2025-08-19 23:45:18');
INSERT INTO `activity_log` VALUES (122, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 13, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":15}}', NULL, '2025-08-19 23:46:06', '2025-08-19 23:46:06');
INSERT INTO `activity_log` VALUES (123, 'default', 'created', 'App\\Models\\UserProgress', 'created', 33, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 23:46:06', '2025-08-19 23:46:06');
INSERT INTO `activity_log` VALUES (124, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 14, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":15}}', NULL, '2025-08-19 23:46:12', '2025-08-19 23:46:12');
INSERT INTO `activity_log` VALUES (125, 'default', 'created', 'App\\Models\\Like', 'created', 15, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":15,\"user_id\":43}}', NULL, '2025-08-19 23:50:00', '2025-08-19 23:50:00');
INSERT INTO `activity_log` VALUES (126, 'default', 'created', 'App\\Models\\Like', 'created', 16, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 23:50:14', '2025-08-19 23:50:14');
INSERT INTO `activity_log` VALUES (127, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 16, 'App\\Models\\User', 43, '{\"old\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 23:50:53', '2025-08-19 23:50:53');
INSERT INTO `activity_log` VALUES (128, 'default', 'created', 'App\\Models\\Like', 'created', 17, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":13,\"user_id\":43}}', NULL, '2025-08-19 23:50:55', '2025-08-19 23:50:55');
INSERT INTO `activity_log` VALUES (129, 'default', 'created', 'App\\Models\\UserProgress', 'created', 34, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-19 23:51:00', '2025-08-19 23:51:00');
INSERT INTO `activity_log` VALUES (130, 'default', 'created', 'App\\Models\\Like', 'created', 18, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":5,\"user_id\":43}}', NULL, '2025-08-19 23:57:52', '2025-08-19 23:57:52');
INSERT INTO `activity_log` VALUES (131, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 15, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"materi_id\":5}}', NULL, '2025-08-20 00:01:56', '2025-08-20 00:01:56');
INSERT INTO `activity_log` VALUES (132, 'default', 'created', 'App\\Models\\UserProgress', 'created', 35, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 00:01:56', '2025-08-20 00:01:56');
INSERT INTO `activity_log` VALUES (133, 'default', 'User logged in', 'App\\Models\\User', NULL, 57, 'App\\Models\\User', 57, '[]', NULL, '2025-08-20 06:48:09', '2025-08-20 06:48:09');
INSERT INTO `activity_log` VALUES (134, 'default', 'created', 'App\\Models\\UserProgress', 'created', 36, 'App\\Models\\User', 57, '{\"attributes\":{\"user_id\":57,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 06:49:34', '2025-08-20 06:49:34');
INSERT INTO `activity_log` VALUES (135, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-20 07:14:37', '2025-08-20 07:14:37');
INSERT INTO `activity_log` VALUES (136, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-20 10:12:27', '2025-08-20 10:12:27');
INSERT INTO `activity_log` VALUES (137, 'default', 'created', 'App\\Models\\UserProgress', 'created', 37, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:13:39', '2025-08-20 10:13:39');
INSERT INTO `activity_log` VALUES (138, 'default', 'created', 'App\\Models\\Komentar', 'created', 33, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":13,\"user_id\":24,\"isi_komentar\":\"video ini sangat mudah dipahami, saya jadi tahu apa yang dimaksud sehat jiwa!\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:14:42', '2025-08-20 10:14:42');
INSERT INTO `activity_log` VALUES (139, 'default', 'created', 'App\\Models\\Like', 'created', 19, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":13,\"user_id\":24}}', NULL, '2025-08-20 10:14:44', '2025-08-20 10:14:44');
INSERT INTO `activity_log` VALUES (140, 'default', 'created', 'App\\Models\\Like', 'created', 20, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 10:15:14', '2025-08-20 10:15:14');
INSERT INTO `activity_log` VALUES (141, 'default', 'created', 'App\\Models\\Komentar', 'created', 34, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24,\"isi_komentar\":\"Materi di PDF ini jauh lebih detail dari yang di video, ini sangat bagus untuk yang ingin mempelajari lebih dalam tentang Kesehatan mental ini \\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:17:41', '2025-08-20 10:17:41');
INSERT INTO `activity_log` VALUES (142, 'default', 'created', 'App\\Models\\Like', 'created', 21, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 10:17:43', '2025-08-20 10:17:43');
INSERT INTO `activity_log` VALUES (143, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 21, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 10:17:45', '2025-08-20 10:17:45');
INSERT INTO `activity_log` VALUES (144, 'default', 'created', 'App\\Models\\Like', 'created', 22, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 10:17:47', '2025-08-20 10:17:47');
INSERT INTO `activity_log` VALUES (145, 'default', 'created', 'App\\Models\\UserProgress', 'created', 38, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:18:13', '2025-08-20 10:18:13');
INSERT INTO `activity_log` VALUES (146, 'default', 'created', 'App\\Models\\Like', 'created', 23, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":11,\"user_id\":24}}', NULL, '2025-08-20 10:25:10', '2025-08-20 10:25:10');
INSERT INTO `activity_log` VALUES (147, 'default', 'created', 'App\\Models\\Komentar', 'created', 35, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":11,\"user_id\":24,\"isi_komentar\":\"Penjelasannya sangat jelas!, terutama materi tentang Menjaga kebersihan alat reproduksi, Ciri ciri, dan Tips and tricknya. Karena semua itu sangat penting bagi Remaja \\ud83d\\ude4c\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:26:38', '2025-08-20 10:26:38');
INSERT INTO `activity_log` VALUES (148, 'default', 'created', 'App\\Models\\Like', 'created', 24, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":10,\"user_id\":24}}', NULL, '2025-08-20 10:27:02', '2025-08-20 10:27:02');
INSERT INTO `activity_log` VALUES (149, 'default', 'created', 'App\\Models\\Komentar', 'created', 36, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":10,\"user_id\":24,\"isi_komentar\":\"Ternyata Perubahan pada remaja itu bukan hanya pada perubahan fisik, perubahan pada remaja itu ada banyak,Salah satunya Perubahan Psikologis seperti Perubahan Emosi, jasmani, cara berinteraksi kepada teman atau orang tua hingga perubahan cara otak berkerja! \\u2764\\ufe0f\\u200d\\ud83d\\udd25\\ud83d\\udc4f\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:34:51', '2025-08-20 10:34:51');
INSERT INTO `activity_log` VALUES (150, 'default', 'created', 'App\\Models\\UserProgress', 'created', 39, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:35:32', '2025-08-20 10:35:32');
INSERT INTO `activity_log` VALUES (151, 'default', 'created', 'App\\Models\\Komentar', 'created', 37, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":9,\"user_id\":24,\"isi_komentar\":\"Seruu banget vidoenya!!, aku baru tahu ternyata dampak  NAPZA sangat berbahaya bagi manusia\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:39:05', '2025-08-20 10:39:05');
INSERT INTO `activity_log` VALUES (152, 'default', 'created', 'App\\Models\\Like', 'created', 25, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":9,\"user_id\":24}}', NULL, '2025-08-20 10:39:09', '2025-08-20 10:39:09');
INSERT INTO `activity_log` VALUES (153, 'default', 'created', 'App\\Models\\Like', 'created', 26, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":8,\"user_id\":24}}', NULL, '2025-08-20 10:39:21', '2025-08-20 10:39:21');
INSERT INTO `activity_log` VALUES (154, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 26, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":8,\"user_id\":24}}', NULL, '2025-08-20 10:39:26', '2025-08-20 10:39:26');
INSERT INTO `activity_log` VALUES (155, 'default', 'created', 'App\\Models\\Like', 'created', 27, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 10:39:52', '2025-08-20 10:39:52');
INSERT INTO `activity_log` VALUES (156, 'default', 'created', 'App\\Models\\UserProgress', 'created', 40, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:40:04', '2025-08-20 10:40:04');
INSERT INTO `activity_log` VALUES (157, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 27, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 10:40:20', '2025-08-20 10:40:20');
INSERT INTO `activity_log` VALUES (158, 'default', 'created', 'App\\Models\\Like', 'created', 28, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24}}', NULL, '2025-08-20 10:40:23', '2025-08-20 10:40:23');
INSERT INTO `activity_log` VALUES (159, 'default', 'created', 'App\\Models\\Komentar', 'created', 38, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":7,\"user_id\":24,\"isi_komentar\":\"Penjelasan tentang Edukasi gizi nya sangat jelas dan mudah dimengertii \\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-20 10:42:40', '2025-08-20 10:42:40');
INSERT INTO `activity_log` VALUES (160, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 16, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":15}}', NULL, '2025-08-20 10:43:08', '2025-08-20 10:43:08');
INSERT INTO `activity_log` VALUES (161, 'default', 'created', 'App\\Models\\UserProgress', 'created', 41, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:43:08', '2025-08-20 10:43:08');
INSERT INTO `activity_log` VALUES (162, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 20, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 10:43:10', '2025-08-20 10:43:10');
INSERT INTO `activity_log` VALUES (163, 'default', 'created', 'App\\Models\\Like', 'created', 29, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":15,\"user_id\":24}}', NULL, '2025-08-20 10:43:12', '2025-08-20 10:43:12');
INSERT INTO `activity_log` VALUES (164, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 17, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 10:43:18', '2025-08-20 10:43:18');
INSERT INTO `activity_log` VALUES (165, 'default', 'created', 'App\\Models\\UserProgress', 'created', 42, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:43:18', '2025-08-20 10:43:18');
INSERT INTO `activity_log` VALUES (166, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 18, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 10:43:22', '2025-08-20 10:43:22');
INSERT INTO `activity_log` VALUES (167, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 22, 'App\\Models\\User', 24, '{\"old\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 10:43:26', '2025-08-20 10:43:26');
INSERT INTO `activity_log` VALUES (168, 'default', 'created', 'App\\Models\\Like', 'created', 30, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":12,\"user_id\":24}}', NULL, '2025-08-20 10:43:28', '2025-08-20 10:43:28');
INSERT INTO `activity_log` VALUES (169, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 19, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":12}}', NULL, '2025-08-20 10:43:29', '2025-08-20 10:43:29');
INSERT INTO `activity_log` VALUES (170, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 20, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:40', '2025-08-20 10:43:40');
INSERT INTO `activity_log` VALUES (171, 'default', 'created', 'App\\Models\\UserProgress', 'created', 43, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:43:40', '2025-08-20 10:43:40');
INSERT INTO `activity_log` VALUES (172, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 21, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:45', '2025-08-20 10:43:45');
INSERT INTO `activity_log` VALUES (173, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 22, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:46', '2025-08-20 10:43:46');
INSERT INTO `activity_log` VALUES (174, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 23, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:48', '2025-08-20 10:43:48');
INSERT INTO `activity_log` VALUES (175, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 24, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:52', '2025-08-20 10:43:52');
INSERT INTO `activity_log` VALUES (176, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 25, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:52', '2025-08-20 10:43:52');
INSERT INTO `activity_log` VALUES (177, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 26, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:56', '2025-08-20 10:43:56');
INSERT INTO `activity_log` VALUES (178, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 27, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":10}}', NULL, '2025-08-20 10:43:58', '2025-08-20 10:43:58');
INSERT INTO `activity_log` VALUES (179, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 28, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":8}}', NULL, '2025-08-20 10:44:10', '2025-08-20 10:44:10');
INSERT INTO `activity_log` VALUES (180, 'default', 'created', 'App\\Models\\UserProgress', 'created', 44, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:44:10', '2025-08-20 10:44:10');
INSERT INTO `activity_log` VALUES (181, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 29, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":5}}', NULL, '2025-08-20 10:44:20', '2025-08-20 10:44:20');
INSERT INTO `activity_log` VALUES (182, 'default', 'created', 'App\\Models\\UserProgress', 'created', 45, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:44:20', '2025-08-20 10:44:20');
INSERT INTO `activity_log` VALUES (183, 'default', 'created', 'App\\Models\\UserProgress', 'created', 46, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-20 10:44:37', '2025-08-20 10:44:37');
INSERT INTO `activity_log` VALUES (184, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-21 00:04:10', '2025-08-21 00:04:10');
INSERT INTO `activity_log` VALUES (185, 'default', 'created', 'App\\Models\\UserProgress', 'created', 47, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-21 00:05:31', '2025-08-21 00:05:31');
INSERT INTO `activity_log` VALUES (186, 'default', 'created', 'App\\Models\\Like', 'created', 31, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":7,\"user_id\":43}}', NULL, '2025-08-21 00:05:40', '2025-08-21 00:05:40');
INSERT INTO `activity_log` VALUES (187, 'default', 'created', 'App\\Models\\Like', 'created', 32, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":8,\"user_id\":43}}', NULL, '2025-08-21 00:06:14', '2025-08-21 00:06:14');
INSERT INTO `activity_log` VALUES (188, 'default', 'created', 'App\\Models\\Komentar', 'created', 39, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":8,\"user_id\":43,\"isi_komentar\":\"baguss bangett, dapatt di mengerti tentang narkoba karena penjelasannya terdapat gambar juga\",\"balasan_admin\":null}}', NULL, '2025-08-21 00:12:32', '2025-08-21 00:12:32');
INSERT INTO `activity_log` VALUES (189, 'default', 'created', 'App\\Models\\Like', 'created', 33, 'App\\Models\\User', 43, '{\"attributes\":{\"materi_id\":11,\"user_id\":43}}', NULL, '2025-08-21 00:16:20', '2025-08-21 00:16:20');
INSERT INTO `activity_log` VALUES (190, 'default', 'created', 'App\\Models\\UserProgress', 'created', 48, 'App\\Models\\User', 43, '{\"attributes\":{\"user_id\":43,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-21 00:16:30', '2025-08-21 00:16:30');
INSERT INTO `activity_log` VALUES (191, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 03:34:59', '2025-08-22 03:34:59');
INSERT INTO `activity_log` VALUES (192, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 03:34:59', '2025-08-22 03:34:59');
INSERT INTO `activity_log` VALUES (193, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-22 03:35:38', '2025-08-22 03:35:38');
INSERT INTO `activity_log` VALUES (194, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 03:36:04', '2025-08-22 03:36:04');
INSERT INTO `activity_log` VALUES (195, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 04:50:09', '2025-08-22 04:50:09');
INSERT INTO `activity_log` VALUES (196, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 05:30:24', '2025-08-22 05:30:24');
INSERT INTO `activity_log` VALUES (197, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-22 05:44:47', '2025-08-22 05:44:47');
INSERT INTO `activity_log` VALUES (198, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 06:00:44', '2025-08-22 06:00:44');
INSERT INTO `activity_log` VALUES (199, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 06:00:44', '2025-08-22 06:00:44');
INSERT INTO `activity_log` VALUES (200, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 06:05:58', '2025-08-22 06:05:58');
INSERT INTO `activity_log` VALUES (201, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 06:05:58', '2025-08-22 06:05:58');
INSERT INTO `activity_log` VALUES (202, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-22 06:07:22', '2025-08-22 06:07:22');
INSERT INTO `activity_log` VALUES (203, 'default', 'created', 'App\\Models\\Like', 'created', 34, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":15,\"user_id\":46}}', NULL, '2025-08-22 06:07:37', '2025-08-22 06:07:37');
INSERT INTO `activity_log` VALUES (204, 'default', 'created', 'App\\Models\\Like', 'created', 35, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-22 06:07:47', '2025-08-22 06:07:47');
INSERT INTO `activity_log` VALUES (205, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 35, 'App\\Models\\User', 46, '{\"old\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-22 06:07:51', '2025-08-22 06:07:51');
INSERT INTO `activity_log` VALUES (206, 'default', 'created', 'App\\Models\\Like', 'created', 36, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":13,\"user_id\":46}}', NULL, '2025-08-22 06:07:54', '2025-08-22 06:07:54');
INSERT INTO `activity_log` VALUES (207, 'default', 'created', 'App\\Models\\UserProgress', 'created', 49, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 06:09:32', '2025-08-22 06:09:32');
INSERT INTO `activity_log` VALUES (208, 'default', 'created', 'App\\Models\\Like', 'created', 37, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":9,\"user_id\":46}}', NULL, '2025-08-22 06:10:49', '2025-08-22 06:10:49');
INSERT INTO `activity_log` VALUES (209, 'default', 'User logged in', 'App\\Models\\User', NULL, 75, 'App\\Models\\User', 75, '[]', NULL, '2025-08-22 06:20:42', '2025-08-22 06:20:42');
INSERT INTO `activity_log` VALUES (210, 'default', 'created', 'App\\Models\\UserProgress', 'created', 50, 'App\\Models\\User', 75, '{\"attributes\":{\"user_id\":75,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 06:20:51', '2025-08-22 06:20:51');
INSERT INTO `activity_log` VALUES (211, 'default', 'User logged in', 'App\\Models\\User', NULL, 43, 'App\\Models\\User', 43, '[]', NULL, '2025-08-22 06:40:30', '2025-08-22 06:40:30');
INSERT INTO `activity_log` VALUES (212, 'default', 'User logged in', 'App\\Models\\User', NULL, 33, 'App\\Models\\User', 33, '[]', NULL, '2025-08-22 07:08:47', '2025-08-22 07:08:47');
INSERT INTO `activity_log` VALUES (213, 'default', 'created', 'App\\Models\\Like', 'created', 38, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":13,\"user_id\":33}}', NULL, '2025-08-22 07:09:04', '2025-08-22 07:09:04');
INSERT INTO `activity_log` VALUES (214, 'default', 'created', 'App\\Models\\Like', 'created', 39, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":11,\"user_id\":33}}', NULL, '2025-08-22 07:09:12', '2025-08-22 07:09:12');
INSERT INTO `activity_log` VALUES (215, 'default', 'created', 'App\\Models\\Like', 'created', 40, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":9,\"user_id\":33}}', NULL, '2025-08-22 07:09:20', '2025-08-22 07:09:20');
INSERT INTO `activity_log` VALUES (216, 'default', 'created', 'App\\Models\\UserProgress', 'created', 51, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 07:09:47', '2025-08-22 07:09:47');
INSERT INTO `activity_log` VALUES (217, 'default', 'created', 'App\\Models\\Komentar', 'created', 40, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":13,\"user_id\":33,\"isi_komentar\":\"lebih suka nonton video animasi edukatif kaya gini, bikin enggak bosen alias SERUUUU\\u203c\\ufe0f\\u203c\\ufe0f cocok nih untuk tontonan remaja\\/gen z ahaaay, karena bener-bener nambah ilmu pengetahuan, + ada solusinya juga, SEMANGAT YAA KAKAK-KAKAK BUAT VIDEO ANIMASI NYA\\ud83d\\udc9e\\ud83d\\udc9e\",\"balasan_admin\":null}}', NULL, '2025-08-22 07:14:10', '2025-08-22 07:14:10');
INSERT INTO `activity_log` VALUES (218, 'default', 'created', 'App\\Models\\Like', 'created', 41, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 07:14:55', '2025-08-22 07:14:55');
INSERT INTO `activity_log` VALUES (219, 'default', 'created', 'App\\Models\\UserProgress', 'created', 52, 'App\\Models\\User', 33, '{\"attributes\":{\"user_id\":33,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 07:15:03', '2025-08-22 07:15:03');
INSERT INTO `activity_log` VALUES (220, 'default', 'created', 'App\\Models\\Komentar', 'created', 41, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33,\"isi_komentar\":\"ternyata... Aku kurang berfokus sama makanan bergizi, jarang olahraga, pantes skincare, bodycare ak gak ngaruh :(( makasih yaa kak, next aku fokusin buat makanan bergizi dan pola hidup sehat!\",\"balasan_admin\":null}}', NULL, '2025-08-22 07:17:59', '2025-08-22 07:17:59');
INSERT INTO `activity_log` VALUES (221, 'default', 'created', 'App\\Models\\Like', 'created', 42, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":5,\"user_id\":33}}', NULL, '2025-08-22 07:18:20', '2025-08-22 07:18:20');
INSERT INTO `activity_log` VALUES (222, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 41, 'App\\Models\\User', 33, '{\"old\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 07:18:26', '2025-08-22 07:18:26');
INSERT INTO `activity_log` VALUES (223, 'default', 'created', 'App\\Models\\Like', 'created', 43, 'App\\Models\\User', 33, '{\"attributes\":{\"materi_id\":7,\"user_id\":33}}', NULL, '2025-08-22 07:18:33', '2025-08-22 07:18:33');
INSERT INTO `activity_log` VALUES (224, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-22 07:52:22', '2025-08-22 07:52:22');
INSERT INTO `activity_log` VALUES (225, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-22 07:52:22', '2025-08-22 07:52:22');
INSERT INTO `activity_log` VALUES (226, 'default', 'User logged in', 'App\\Models\\User', NULL, 62, 'App\\Models\\User', 62, '[]', NULL, '2025-08-22 08:14:52', '2025-08-22 08:14:52');
INSERT INTO `activity_log` VALUES (227, 'default', 'User logged in', 'App\\Models\\User', NULL, 22, 'App\\Models\\User', 22, '[]', NULL, '2025-08-22 09:44:06', '2025-08-22 09:44:06');
INSERT INTO `activity_log` VALUES (228, 'default', 'created', 'App\\Models\\UserProgress', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:44:24', '2025-08-22 09:44:24');
INSERT INTO `activity_log` VALUES (229, 'default', 'created', 'App\\Models\\Like', 'created', 44, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":15,\"user_id\":22}}', NULL, '2025-08-22 09:45:23', '2025-08-22 09:45:23');
INSERT INTO `activity_log` VALUES (230, 'default', 'created', 'App\\Models\\Komentar', 'created', 42, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":15,\"user_id\":22,\"isi_komentar\":\"Menurut aku tulisannya udah jelas banget, runtut, dan enak dibaca. Bahasannya lengkap dari pengertian sampai faktor yang memengaruhi, jadi gampang dipahami. ada juga komponen pencegahannya, jadi kita setelah baca juga tau apa aja sih yg harus kita lakuin supaya terhindar dari hal hal yg tdk kita inginkan\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:49:22', '2025-08-22 09:49:22');
INSERT INTO `activity_log` VALUES (231, 'default', 'created', 'App\\Models\\UserProgress', 'created', 54, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:49:53', '2025-08-22 09:49:53');
INSERT INTO `activity_log` VALUES (232, 'default', 'created', 'App\\Models\\Like', 'created', 45, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 09:49:56', '2025-08-22 09:49:56');
INSERT INTO `activity_log` VALUES (233, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-22 09:50:45', '2025-08-22 09:50:45');
INSERT INTO `activity_log` VALUES (234, 'default', 'created', 'App\\Models\\Komentar', 'created', 43, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22,\"isi_komentar\":\"videonya bagus, gampang di pahamii, dan penjelasan dari video ini tersampaikan dengan cepat, isi dari materinya pun tergambarkan dengan animasi animasi yg ada di dalam video\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:51:45', '2025-08-22 09:51:45');
INSERT INTO `activity_log` VALUES (235, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-22 09:52:03', '2025-08-22 09:52:03');
INSERT INTO `activity_log` VALUES (236, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 30, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"materi_id\":12}}', NULL, '2025-08-22 09:52:18', '2025-08-22 09:52:18');
INSERT INTO `activity_log` VALUES (237, 'default', 'created', 'App\\Models\\UserProgress', 'created', 55, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:52:18', '2025-08-22 09:52:18');
INSERT INTO `activity_log` VALUES (238, 'default', 'created', 'App\\Models\\UserProgress', 'created', 56, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:52:21', '2025-08-22 09:52:21');
INSERT INTO `activity_log` VALUES (239, 'default', 'created', 'App\\Models\\Like', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 09:53:10', '2025-08-22 09:53:10');
INSERT INTO `activity_log` VALUES (240, 'default', 'created', 'App\\Models\\Like', 'created', 47, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 09:54:03', '2025-08-22 09:54:03');
INSERT INTO `activity_log` VALUES (241, 'default', 'created', 'App\\Models\\Komentar', 'created', 44, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":12,\"user_id\":22,\"isi_komentar\":\"Menurut aku, dokumen ini udah keren banget. Isinya jelas, runtut, dan gampang dipahami. Penjelasan soal kesehatan mental remaja, tanda-tanda stres, sampai cara ngatasinnya tuh lengkap banget. Aku juga suka karena nggak cuma teori, tapi ada contoh yang relate sama kehidupan sehari-hari remaja. Bagian akhirnya juga asik, ada afirmasi positif sama contoh terapi yang bisa langsung dipraktekin.\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:54:04', '2025-08-22 09:54:04');
INSERT INTO `activity_log` VALUES (242, 'default', 'created', 'App\\Models\\Like', 'created', 48, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":5,\"user_id\":22}}', NULL, '2025-08-22 09:54:17', '2025-08-22 09:54:17');
INSERT INTO `activity_log` VALUES (243, 'default', 'created', 'App\\Models\\Like', 'created', 49, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":7,\"user_id\":22}}', NULL, '2025-08-22 09:54:21', '2025-08-22 09:54:21');
INSERT INTO `activity_log` VALUES (244, 'default', 'created', 'App\\Models\\Like', 'created', 50, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":8,\"user_id\":22}}', NULL, '2025-08-22 09:54:23', '2025-08-22 09:54:23');
INSERT INTO `activity_log` VALUES (245, 'default', 'created', 'App\\Models\\Like', 'created', 51, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":9,\"user_id\":22}}', NULL, '2025-08-22 09:54:26', '2025-08-22 09:54:26');
INSERT INTO `activity_log` VALUES (246, 'default', 'created', 'App\\Models\\Like', 'created', 52, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":10,\"user_id\":22}}', NULL, '2025-08-22 09:54:30', '2025-08-22 09:54:30');
INSERT INTO `activity_log` VALUES (247, 'default', 'created', 'App\\Models\\Like', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":11,\"user_id\":22}}', NULL, '2025-08-22 09:54:33', '2025-08-22 09:54:33');
INSERT INTO `activity_log` VALUES (248, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 31, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":12}}', NULL, '2025-08-22 09:54:35', '2025-08-22 09:54:35');
INSERT INTO `activity_log` VALUES (249, 'default', 'created', 'App\\Models\\UserProgress', 'created', 57, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:54:35', '2025-08-22 09:54:35');
INSERT INTO `activity_log` VALUES (250, 'default', 'created', 'App\\Models\\Like', 'created', 54, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":12,\"user_id\":22}}', NULL, '2025-08-22 09:54:36', '2025-08-22 09:54:36');
INSERT INTO `activity_log` VALUES (251, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 45, 'App\\Models\\User', 22, '{\"old\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 09:54:41', '2025-08-22 09:54:41');
INSERT INTO `activity_log` VALUES (252, 'default', 'created', 'App\\Models\\Like', 'created', 55, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":13,\"user_id\":22}}', NULL, '2025-08-22 09:54:44', '2025-08-22 09:54:44');
INSERT INTO `activity_log` VALUES (253, 'default', 'created', 'App\\Models\\UserProgress', 'created', 58, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:55:02', '2025-08-22 09:55:02');
INSERT INTO `activity_log` VALUES (254, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 32, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":12}}', NULL, '2025-08-22 09:55:02', '2025-08-22 09:55:02');
INSERT INTO `activity_log` VALUES (255, 'default', 'created', 'App\\Models\\Komentar', 'created', 45, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":11,\"user_id\":22,\"isi_komentar\":\"Videonya sangat jelas, saya dapat mengerti penjelasan yang ada di dalam video, menambah ilmu , dan dengan adanya video ini saya jadi tauu tentang menjaga kebersihan alat reproduksi\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:56:06', '2025-08-22 09:56:06');
INSERT INTO `activity_log` VALUES (256, 'default', 'created', 'App\\Models\\Komentar', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":12,\"user_id\":48,\"isi_komentar\":\"Secara keseluruhan, materi ini sudah sangat baik\\u2014lengkap secara teori, praktis untuk diterapkan, dan relevan dengan kondisi remaja saat ini\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:56:53', '2025-08-22 09:56:53');
INSERT INTO `activity_log` VALUES (257, 'default', 'created', 'App\\Models\\Like', 'created', 56, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":12,\"user_id\":48}}', NULL, '2025-08-22 09:56:56', '2025-08-22 09:56:56');
INSERT INTO `activity_log` VALUES (258, 'default', 'created', 'App\\Models\\Like', 'created', 57, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 09:57:23', '2025-08-22 09:57:23');
INSERT INTO `activity_log` VALUES (259, 'default', 'created', 'App\\Models\\Komentar', 'created', 47, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":10,\"user_id\":22,\"isi_komentar\":\"Menurut aku setelah baca keseluruhan teks ini, isinya udah sangat lengkap dan runtut banget. Dari mulai pengenalan organ reproduksi pria dan wanita, proses fisiologis kayak ovulasi, menstruasi, sampai ke perubahan fisik, psikologis, dan kognitif di masa remaja tuh dibahas jelas banget. Bagian masalah reproduksi remaja juga terasa relevan sama kondisi nyata yang sering terjadi, apalagi disertai pencegahan dan deteksi dini. Aku suka karena teksnya nggak cuma teoritis, tapi juga ada langkah praktis kayak SADARI. Jadi bener-bener terasa menyeluruh dan gampang dipahami buat pembaca, khususnya remaja yang lagi butuh pengetahuan soal ini.\",\"balasan_admin\":null}}', NULL, '2025-08-22 09:57:37', '2025-08-22 09:57:37');
INSERT INTO `activity_log` VALUES (260, 'default', 'created', 'App\\Models\\UserProgress', 'created', 59, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 09:59:44', '2025-08-22 09:59:44');
INSERT INTO `activity_log` VALUES (261, 'default', 'User logged in', 'App\\Models\\User', NULL, 65, 'App\\Models\\User', 65, '[]', NULL, '2025-08-22 10:00:06', '2025-08-22 10:00:06');
INSERT INTO `activity_log` VALUES (262, 'default', 'created', 'App\\Models\\UserProgress', 'created', 60, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:00:18', '2025-08-22 10:00:18');
INSERT INTO `activity_log` VALUES (263, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 57, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 10:00:25', '2025-08-22 10:00:25');
INSERT INTO `activity_log` VALUES (264, 'default', 'created', 'App\\Models\\Like', 'created', 58, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 10:00:27', '2025-08-22 10:00:27');
INSERT INTO `activity_log` VALUES (265, 'default', 'created', 'App\\Models\\Komentar', 'created', 48, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48,\"isi_komentar\":\"Video ini merupakan media yang baik untuk menyampaikan pesan tentang kesehatan mental remaja. Namun, agar lebih efektif, penting memastikan isi disampaikan dengan bahasa sederhana, visual menarik, durasi tidak terlalu panjang, dan ada contoh konkret yang dekat dengan kehidupan remaja.\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:00:33', '2025-08-22 10:00:33');
INSERT INTO `activity_log` VALUES (266, 'default', 'created', 'App\\Models\\Like', 'created', 59, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 10:00:59', '2025-08-22 10:00:59');
INSERT INTO `activity_log` VALUES (267, 'default', 'created', 'App\\Models\\Like', 'created', 60, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":15,\"user_id\":65}}', NULL, '2025-08-22 10:01:01', '2025-08-22 10:01:01');
INSERT INTO `activity_log` VALUES (268, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 33, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":5}}', NULL, '2025-08-22 10:01:04', '2025-08-22 10:01:04');
INSERT INTO `activity_log` VALUES (269, 'default', 'created', 'App\\Models\\UserProgress', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:01:04', '2025-08-22 10:01:04');
INSERT INTO `activity_log` VALUES (270, 'default', 'created', 'App\\Models\\Komentar', 'created', 49, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":9,\"user_id\":22,\"isi_komentar\":\"SERUU BGT, dari video ini, kita dapat menyimpulkan untuk menjauhi narkoba, karena dapat merusak tubuh kita, dan juga tidak sehat, dapat membuat candu, selain itu, animasinya bagus sekali, dan seluruh penjelasan dapat di pahami dengan cepat\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:01:19', '2025-08-22 10:01:19');
INSERT INTO `activity_log` VALUES (271, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 59, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 10:01:23', '2025-08-22 10:01:23');
INSERT INTO `activity_log` VALUES (272, 'default', 'created', 'App\\Models\\Like', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48}}', NULL, '2025-08-22 10:01:26', '2025-08-22 10:01:26');
INSERT INTO `activity_log` VALUES (273, 'default', 'created', 'App\\Models\\User', 'created', 85, NULL, NULL, '{\"attributes\":{\"name\":\"Siska jesika\",\"email\":\"tatisukmawati457@gmail.com\",\"password\":\"$2y$12$IB4e6uE9U4uamto6C4NzKu4kCkF7w\\/lzqoUkmD.Qry6dfkHkJr0pq\"}}', NULL, '2025-08-22 10:01:47', '2025-08-22 10:01:47');
INSERT INTO `activity_log` VALUES (274, 'default', 'created', 'App\\Models\\UserProgress', 'created', 62, 'App\\Models\\User', 85, '{\"attributes\":{\"user_id\":85,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:01:58', '2025-08-22 10:01:58');
INSERT INTO `activity_log` VALUES (275, 'default', 'created', 'App\\Models\\Komentar', 'created', 50, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":8,\"user_id\":22,\"isi_komentar\":\"Menurut saya setelah membaca teks ini, isi tulisannya sangat lengkap dan bermanfaat. Pembahasannya runtut, mulai dari pengertian narkoba, jenis-jenisnya, dampak fisik, psikologis, maupun sosial, sampai langkah pencegahan dan rehabilitasi. Bagian tentang peran siswa juga menarik, karena mengajak langsung generasi muda untuk ikut andil dalam mencegah penyalahgunaan narkoba. Secara keseluruhan, teks ini membuka wawasan saya bahwa bahaya narkoba tidak hanya soal kesehatan, tapi juga merusak masa depan dan lingkungan sosial.\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:02:28', '2025-08-22 10:02:28');
INSERT INTO `activity_log` VALUES (276, 'default', 'created', 'App\\Models\\Komentar', 'created', 51, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":5,\"user_id\":48,\"isi_komentar\":\"Materi ini sudah sangat kuat secara teori dan praktis, namun agar lebih efektif bagi remaja, perlu dibuat lebih sederhana, interaktif, dan dekat dengan keseharian mereka. Dengan tambahan ilustrasi dan contoh nyata, materi ini bisa menjadi panduan yang menarik sekaligus bermanfaat.\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:02:38', '2025-08-22 10:02:38');
INSERT INTO `activity_log` VALUES (277, 'default', 'created', 'App\\Models\\UserProgress', 'created', 63, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:02:50', '2025-08-22 10:02:50');
INSERT INTO `activity_log` VALUES (278, 'default', 'created', 'App\\Models\\Like', 'created', 62, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":15,\"user_id\":85}}', NULL, '2025-08-22 10:02:54', '2025-08-22 10:02:54');
INSERT INTO `activity_log` VALUES (279, 'default', 'created', 'App\\Models\\UserProgress', 'created', 64, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:03:01', '2025-08-22 10:03:01');
INSERT INTO `activity_log` VALUES (280, 'default', 'created', 'App\\Models\\Like', 'created', 63, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":7,\"user_id\":48}}', NULL, '2025-08-22 10:03:06', '2025-08-22 10:03:06');
INSERT INTO `activity_log` VALUES (281, 'default', 'User logged in', 'App\\Models\\User', NULL, 47, 'App\\Models\\User', 47, '[]', NULL, '2025-08-22 10:03:08', '2025-08-22 10:03:08');
INSERT INTO `activity_log` VALUES (282, 'default', 'created', 'App\\Models\\UserProgress', 'created', 65, 'App\\Models\\User', 85, '{\"attributes\":{\"user_id\":85,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:03:20', '2025-08-22 10:03:20');
INSERT INTO `activity_log` VALUES (283, 'default', 'created', 'App\\Models\\Like', 'created', 64, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":13,\"user_id\":85}}', NULL, '2025-08-22 10:03:31', '2025-08-22 10:03:31');
INSERT INTO `activity_log` VALUES (284, 'default', 'created', 'App\\Models\\Like', 'created', 65, 'App\\Models\\User', 85, '{\"attributes\":{\"materi_id\":12,\"user_id\":85}}', NULL, '2025-08-22 10:03:50', '2025-08-22 10:03:50');
INSERT INTO `activity_log` VALUES (285, 'default', 'created', 'App\\Models\\Komentar', 'created', 52, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":7,\"user_id\":22,\"isi_komentar\":\"wih, videonya bener benerr bikin akuu sadar kalau kita harus selalu menjaga kesehatan, dan pola hidup sehat, misalnya makan makanan yg bergizi dan seimbang, selain itu videonya mudah di pahami, terimakasi kak\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:03:51', '2025-08-22 10:03:51');
INSERT INTO `activity_log` VALUES (286, 'default', 'created', 'App\\Models\\Komentar', 'created', 53, 'App\\Models\\User', 22, '{\"attributes\":{\"materi_id\":5,\"user_id\":22,\"isi_komentar\":\"Menurut saya setelah membaca keseluruhan teks ini, isinya sangat lengkap dan jelas menjelaskan tentang gizi remaja. Dari mulai konsep gizi seimbang, isi piringku, kebutuhan gizi makro dan mikro, hingga bahaya konsumsi gula, garam, dan lemak berlebih semuanya dibahas runtut dan mudah dipahami. Penjelasan yang disertai dengan contoh sumber makanan juga membantu banget untuk membayangkan praktiknya dalam kehidupan sehari-hari. Intinya teks ini bikin saya lebih sadar betapa pentingnya menjaga pola makan dan gaya hidup sehat sejak remaja.\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:04:45', '2025-08-22 10:04:45');
INSERT INTO `activity_log` VALUES (287, 'default', 'created', 'App\\Models\\Consultation', 'created', 10, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"category_id\":1,\"title\":\"CARA BIAR BISA MENJAGA POLA HIDUP SEHAT\",\"description\":\"pengen bisa jaga pola hidup sehat, pengen juga makan makanan yg seimbang, tapi kadang susah bgt nahan kalau pengen jajan seblak, gorengan, makanan pedas dan berminyak, sama makanan manis gtu. gimana ya caranya biar bisaa konsistennn ngejaga pola hidup yg sehat, karena olahraga juga kadang kadang aja\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 10:08:20', '2025-08-22 10:08:20');
INSERT INTO `activity_log` VALUES (288, 'default', 'created', 'App\\Models\\Consultation', 'created', 11, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"category_id\":1,\"title\":\"Sehat bersama:pentingnya konsultasi rutin\",\"description\":\"Banyak orang sering mengabaikan pemeriksaan kesehatan secara berkala karena merasa masih sehat atau tidak merasakan gejala tertentu. Padahal, penyakit sering muncul tanpa tanda awal yang jelas, sehingga baru diketahui saat sudah parah. Dengan melakukan konsultasi rutin, kita bisa mendeteksi masalah kesehatan lebih dini, mencegah penyakit kronis, serta menjaga pola hidup yang lebih seimbang. Konsultasi rutin juga membantu mengatasi kebingungan masyarakat terkait pola makan, aktivitas fisik, manajemen stres, hingga cara menjaga imun tubuh.\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 10:22:35', '2025-08-22 10:22:35');
INSERT INTO `activity_log` VALUES (289, 'default', 'created', 'App\\Models\\ConsultationAttachment', 'created', 2, 'App\\Models\\User', 65, '{\"attributes\":{\"consultation_id\":11,\"response_id\":null,\"file_name\":\"tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png\",\"file_path\":\"consultations\\/tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png\",\"file_type\":\"image\\/png\",\"file_size\":316777,\"original_name\":\"IMG_20250822_172115.png\"}}', NULL, '2025-08-22 10:22:35', '2025-08-22 10:22:35');
INSERT INTO `activity_log` VALUES (290, 'default', 'created', 'App\\Models\\UserProgress', 'created', 66, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:23:36', '2025-08-22 10:23:36');
INSERT INTO `activity_log` VALUES (291, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 34, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":15}}', NULL, '2025-08-22 10:24:13', '2025-08-22 10:24:13');
INSERT INTO `activity_log` VALUES (292, 'default', 'created', 'App\\Models\\UserProgress', 'created', 67, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:24:13', '2025-08-22 10:24:13');
INSERT INTO `activity_log` VALUES (293, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 35, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":15}}', NULL, '2025-08-22 10:24:21', '2025-08-22 10:24:21');
INSERT INTO `activity_log` VALUES (294, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 36, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":12}}', NULL, '2025-08-22 10:25:31', '2025-08-22 10:25:31');
INSERT INTO `activity_log` VALUES (295, 'default', 'created', 'App\\Models\\UserProgress', 'created', 68, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":12,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:25:31', '2025-08-22 10:25:31');
INSERT INTO `activity_log` VALUES (296, 'default', 'created', 'App\\Models\\Like', 'created', 66, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":11,\"user_id\":65}}', NULL, '2025-08-22 10:25:44', '2025-08-22 10:25:44');
INSERT INTO `activity_log` VALUES (297, 'default', 'created', 'App\\Models\\UserProgress', 'created', 69, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:25:55', '2025-08-22 10:25:55');
INSERT INTO `activity_log` VALUES (298, 'default', 'created', 'App\\Models\\Komentar', 'created', 54, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":11,\"user_id\":65,\"isi_komentar\":\"Video ini sangat jelas dan mudah untuk dipahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 10:29:23', '2025-08-22 10:29:23');
INSERT INTO `activity_log` VALUES (299, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 37, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":10}}', NULL, '2025-08-22 10:30:05', '2025-08-22 10:30:05');
INSERT INTO `activity_log` VALUES (300, 'default', 'created', 'App\\Models\\UserProgress', 'created', 70, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:30:05', '2025-08-22 10:30:05');
INSERT INTO `activity_log` VALUES (301, 'default', 'created', 'App\\Models\\UserProgress', 'created', 71, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:31:01', '2025-08-22 10:31:01');
INSERT INTO `activity_log` VALUES (302, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 66, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":11,\"user_id\":65}}', NULL, '2025-08-22 10:38:15', '2025-08-22 10:38:15');
INSERT INTO `activity_log` VALUES (303, 'default', 'created', 'App\\Models\\Like', 'created', 67, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 10:38:18', '2025-08-22 10:38:18');
INSERT INTO `activity_log` VALUES (304, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 67, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 10:38:21', '2025-08-22 10:38:21');
INSERT INTO `activity_log` VALUES (305, 'default', 'created', 'App\\Models\\Like', 'created', 68, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 10:38:23', '2025-08-22 10:38:23');
INSERT INTO `activity_log` VALUES (306, 'default', 'created', 'App\\Models\\UserProgress', 'created', 72, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:39:29', '2025-08-22 10:39:29');
INSERT INTO `activity_log` VALUES (307, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 38, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":8}}', NULL, '2025-08-22 10:40:43', '2025-08-22 10:40:43');
INSERT INTO `activity_log` VALUES (308, 'default', 'created', 'App\\Models\\UserProgress', 'created', 73, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:40:43', '2025-08-22 10:40:43');
INSERT INTO `activity_log` VALUES (309, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 68, 'App\\Models\\User', 65, '{\"old\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 10:40:48', '2025-08-22 10:40:48');
INSERT INTO `activity_log` VALUES (310, 'default', 'created', 'App\\Models\\Like', 'created', 69, 'App\\Models\\User', 65, '{\"attributes\":{\"materi_id\":8,\"user_id\":65}}', NULL, '2025-08-22 10:40:49', '2025-08-22 10:40:49');
INSERT INTO `activity_log` VALUES (311, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 39, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"materi_id\":5}}', NULL, '2025-08-22 10:40:55', '2025-08-22 10:40:55');
INSERT INTO `activity_log` VALUES (312, 'default', 'created', 'App\\Models\\UserProgress', 'created', 74, 'App\\Models\\User', 65, '{\"attributes\":{\"user_id\":65,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 10:40:55', '2025-08-22 10:40:55');
INSERT INTO `activity_log` VALUES (313, 'default', 'User logged in', 'App\\Models\\User', NULL, 75, 'App\\Models\\User', 75, '[]', NULL, '2025-08-22 12:06:07', '2025-08-22 12:06:07');
INSERT INTO `activity_log` VALUES (314, 'default', 'User logged in', 'App\\Models\\User', NULL, 56, 'App\\Models\\User', 56, '[]', NULL, '2025-08-22 12:14:19', '2025-08-22 12:14:19');
INSERT INTO `activity_log` VALUES (315, 'default', 'created', 'App\\Models\\UserProgress', 'created', 75, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 12:14:33', '2025-08-22 12:14:33');
INSERT INTO `activity_log` VALUES (316, 'default', 'created', 'App\\Models\\Like', 'created', 70, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 12:14:53', '2025-08-22 12:14:53');
INSERT INTO `activity_log` VALUES (317, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 70, 'App\\Models\\User', 56, '{\"old\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 12:15:40', '2025-08-22 12:15:40');
INSERT INTO `activity_log` VALUES (318, 'default', 'created', 'App\\Models\\Like', 'created', 71, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 12:15:43', '2025-08-22 12:15:43');
INSERT INTO `activity_log` VALUES (319, 'default', 'created', 'App\\Models\\Like', 'created', 72, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":13,\"user_id\":56}}', NULL, '2025-08-22 12:15:56', '2025-08-22 12:15:56');
INSERT INTO `activity_log` VALUES (320, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 71, 'App\\Models\\User', 56, '{\"old\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 12:15:58', '2025-08-22 12:15:58');
INSERT INTO `activity_log` VALUES (321, 'default', 'created', 'App\\Models\\UserProgress', 'created', 76, 'App\\Models\\User', 56, '{\"attributes\":{\"user_id\":56,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 12:16:21', '2025-08-22 12:16:21');
INSERT INTO `activity_log` VALUES (322, 'default', 'created', 'App\\Models\\Komentar', 'created', 55, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":13,\"user_id\":56,\"isi_komentar\":\"Menarik, dan mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-22 12:16:41', '2025-08-22 12:16:41');
INSERT INTO `activity_log` VALUES (323, 'default', 'created', 'App\\Models\\Like', 'created', 73, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":12,\"user_id\":56}}', NULL, '2025-08-22 12:17:38', '2025-08-22 12:17:38');
INSERT INTO `activity_log` VALUES (324, 'default', 'created', 'App\\Models\\Like', 'created', 74, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":11,\"user_id\":56}}', NULL, '2025-08-22 12:17:45', '2025-08-22 12:17:45');
INSERT INTO `activity_log` VALUES (325, 'default', 'created', 'App\\Models\\Like', 'created', 75, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":10,\"user_id\":56}}', NULL, '2025-08-22 12:17:57', '2025-08-22 12:17:57');
INSERT INTO `activity_log` VALUES (326, 'default', 'created', 'App\\Models\\Like', 'created', 76, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":9,\"user_id\":56}}', NULL, '2025-08-22 12:18:06', '2025-08-22 12:18:06');
INSERT INTO `activity_log` VALUES (327, 'default', 'created', 'App\\Models\\Like', 'created', 77, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":8,\"user_id\":56}}', NULL, '2025-08-22 12:18:11', '2025-08-22 12:18:11');
INSERT INTO `activity_log` VALUES (328, 'default', 'created', 'App\\Models\\Like', 'created', 78, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":7,\"user_id\":56}}', NULL, '2025-08-22 12:18:17', '2025-08-22 12:18:17');
INSERT INTO `activity_log` VALUES (329, 'default', 'created', 'App\\Models\\Like', 'created', 79, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":5,\"user_id\":56}}', NULL, '2025-08-22 12:18:21', '2025-08-22 12:18:21');
INSERT INTO `activity_log` VALUES (330, 'default', 'created', 'App\\Models\\Like', 'created', 80, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":15,\"user_id\":56}}', NULL, '2025-08-22 12:18:23', '2025-08-22 12:18:23');
INSERT INTO `activity_log` VALUES (331, 'default', 'created', 'App\\Models\\Komentar', 'created', 56, 'App\\Models\\User', 56, '{\"attributes\":{\"materi_id\":12,\"user_id\":56,\"isi_komentar\":\"Walaupun panjang ya semoga bisa di mengerti\",\"balasan_admin\":null}}', NULL, '2025-08-22 12:19:32', '2025-08-22 12:19:32');
INSERT INTO `activity_log` VALUES (332, 'default', 'User logged in', 'App\\Models\\User', NULL, 65, 'App\\Models\\User', 65, '[]', NULL, '2025-08-22 23:19:17', '2025-08-22 23:19:17');
INSERT INTO `activity_log` VALUES (333, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-22 23:19:40', '2025-08-22 23:19:40');
INSERT INTO `activity_log` VALUES (334, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 23:20:53', '2025-08-22 23:20:53');
INSERT INTO `activity_log` VALUES (335, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-22 23:20:53', '2025-08-22 23:20:53');
INSERT INTO `activity_log` VALUES (336, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 40, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"materi_id\":8}}', NULL, '2025-08-22 23:21:32', '2025-08-22 23:21:32');
INSERT INTO `activity_log` VALUES (337, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 55, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Terima kasih. Semoga bisa diterapkan ilmunya\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:22:45', '2025-08-22 23:22:45');
INSERT INTO `activity_log` VALUES (338, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 43, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Betul sekali, dengan menonton video lebih cepat informasi tersampaikan. Untuk lebih detail, bisa membaca materi dalam bentuk pdf\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:25:14', '2025-08-22 23:25:14');
INSERT INTO `activity_log` VALUES (339, 'default', 'created', 'App\\Models\\Komentar', 'created', 57, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":8,\"user_id\":24,\"isi_komentar\":\"Dapat dimengerti dengan mudah dan Penyalahgunaan narkoba merupakan masalah serius yang mengancam \\r\\nMasa depan generasi muda. Jadi kita harus saling mencegah dan mengingatkan bahaya penyalah gunaaan narkoba ini terutama para pelajar\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:26:36', '2025-08-22 23:26:36');
INSERT INTO `activity_log` VALUES (340, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 40, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Oh tentu, kakak kakak mengikuti jaman supaya adek adek lebih tertarik mempelajari materi kesehatan mental\\ud83d\\ude09\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:26:41', '2025-08-22 23:26:41');
INSERT INTO `activity_log` VALUES (341, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 33, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Bukan hanya sehat fisik, tetapi kita juga harus sehat jiwa\\ud83d\\udc4d\\ud83c\\udffb\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:27:24', '2025-08-22 23:27:24');
INSERT INTO `activity_log` VALUES (342, 'default', 'User logged in', 'App\\Models\\User', NULL, 54, 'App\\Models\\User', 54, '[]', NULL, '2025-08-22 23:28:19', '2025-08-22 23:28:19');
INSERT INTO `activity_log` VALUES (343, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Kami sangat senang bila maksud dan tujuan materi tersampaikan dengan baik kepada adek adek\\ud83d\\ude0a\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:28:45', '2025-08-22 23:28:45');
INSERT INTO `activity_log` VALUES (344, 'default', 'created', 'App\\Models\\Komentar', 'created', 58, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":13,\"user_id\":54,\"isi_komentar\":\"terimakasih ka\\ud83d\\ude4f\\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:29:13', '2025-08-22 23:29:13');
INSERT INTO `activity_log` VALUES (345, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 9, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"Pelajarannya diambil dan diterapkan juga ya, Dea\\ud83d\\ude09\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:29:39', '2025-08-22 23:29:39');
INSERT INTO `activity_log` VALUES (346, 'default', 'created', 'App\\Models\\Komentar', 'created', 59, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":12,\"user_id\":54,\"isi_komentar\":\"woww menurut aku ini menarik bgt terimakasih\\ud83e\\udd29\\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:30:08', '2025-08-22 23:30:08');
INSERT INTO `activity_log` VALUES (347, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"OMG! Terima kasih Yunike\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:30:09', '2025-08-22 23:30:09');
INSERT INTO `activity_log` VALUES (348, 'default', 'created', 'App\\Models\\Like', 'created', 81, 'App\\Models\\User', 54, '{\"attributes\":{\"materi_id\":12,\"user_id\":54}}', NULL, '2025-08-22 23:30:22', '2025-08-22 23:30:22');
INSERT INTO `activity_log` VALUES (349, 'default', 'updated', 'App\\Models\\Komentar', 'updated', 27, 'App\\Models\\User', 82, '{\"attributes\":{\"balasan_admin\":\"We are the best... the best... the best yes! \\ud83d\\udd25\"},\"old\":{\"balasan_admin\":null}}', NULL, '2025-08-22 23:31:10', '2025-08-22 23:31:10');
INSERT INTO `activity_log` VALUES (350, 'default', 'created', 'App\\Models\\Komentar', 'created', 60, 'App\\Models\\User', 24, '{\"attributes\":{\"materi_id\":5,\"user_id\":24,\"isi_komentar\":\"Teks ini memberikan pemahaman bahwa gizi tidak hanya berkaitan dengan rasa kenyang, tetapi juga kualitas makanan yang dikonsumsi. ini sangat penting untuk Remaja, agar menjaga pola makan nya  dan memakan makanan bergizi\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:33:22', '2025-08-22 23:33:22');
INSERT INTO `activity_log` VALUES (351, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-22 23:39:32', '2025-08-22 23:39:32');
INSERT INTO `activity_log` VALUES (352, 'default', 'created', 'App\\Models\\Consultation', 'created', 12, 'App\\Models\\User', 24, '{\"attributes\":{\"user_id\":24,\"category_id\":1,\"title\":\"Kebutuhan Gizi Ideal untuk Remaja\",\"description\":\"Sebenarnya berapa Kebutuhan kalori, protein, vitamin, dan mineral yang ideal untuk remaja setiap harinya? Dan apakah kebutuhan gizi antara laki laki dan perempuan itu berbeda?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 23:39:34', '2025-08-22 23:39:34');
INSERT INTO `activity_log` VALUES (353, 'default', 'created', 'App\\Models\\Consultation', 'created', 13, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"category_id\":13,\"title\":\"pola makan sehat untuk remaja\",\"description\":\"Saya ingin berkonsultasi mengenai pola makan sehat untuk remaja. Saat ini saya sering merasa cepat lelah dan kurang fokus saat belajar. Berat badan saya cenderung naik, tetapi nafsu makan juga sering tinggi. Saya ingin tahu menu makanan yang seimbang, berapa kali sebaiknya makan dalam sehari, serta makanan apa saja yang harus dihindari agar kesehatan tetap terjaga\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-22 23:43:07', '2025-08-22 23:43:07');
INSERT INTO `activity_log` VALUES (354, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 41, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":15}}', NULL, '2025-08-22 23:44:23', '2025-08-22 23:44:23');
INSERT INTO `activity_log` VALUES (355, 'default', 'created', 'App\\Models\\UserProgress', 'created', 77, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:44:23', '2025-08-22 23:44:23');
INSERT INTO `activity_log` VALUES (356, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 42, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":15}}', NULL, '2025-08-22 23:44:28', '2025-08-22 23:44:28');
INSERT INTO `activity_log` VALUES (357, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 46, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 23:45:42', '2025-08-22 23:45:42');
INSERT INTO `activity_log` VALUES (358, 'default', 'created', 'App\\Models\\Like', 'created', 82, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48}}', NULL, '2025-08-22 23:45:44', '2025-08-22 23:45:44');
INSERT INTO `activity_log` VALUES (359, 'default', 'created', 'App\\Models\\Komentar', 'created', 61, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":15,\"user_id\":48,\"isi_komentar\":\"Materi sangat lengkap dan terstruktur \\u2013 Penyusunan dari pengertian, tujuan, ciri-ciri payudara sehat, hingga faktor yang mempengaruhi benar-benar rapi dan memudahkan pembaca memahami langkah demi langkah.\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:45:51', '2025-08-22 23:45:51');
INSERT INTO `activity_log` VALUES (360, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 47, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 23:46:03', '2025-08-22 23:46:03');
INSERT INTO `activity_log` VALUES (361, 'default', 'created', 'App\\Models\\Like', 'created', 83, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48}}', NULL, '2025-08-22 23:46:04', '2025-08-22 23:46:04');
INSERT INTO `activity_log` VALUES (362, 'default', 'created', 'App\\Models\\UserProgress', 'created', 78, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:46:42', '2025-08-22 23:46:42');
INSERT INTO `activity_log` VALUES (363, 'default', 'created', 'App\\Models\\Komentar', 'created', 62, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":13,\"user_id\":48,\"isi_komentar\":\"materinya mudah di pahami karna bersifat video, dan videonya animasii \\r\\nis the best\\ud83e\\udd29\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:48:19', '2025-08-22 23:48:19');
INSERT INTO `activity_log` VALUES (364, 'default', 'created', 'App\\Models\\Like', 'created', 84, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":8,\"user_id\":48}}', NULL, '2025-08-22 23:48:42', '2025-08-22 23:48:42');
INSERT INTO `activity_log` VALUES (365, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 43, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":8}}', NULL, '2025-08-22 23:48:59', '2025-08-22 23:48:59');
INSERT INTO `activity_log` VALUES (366, 'default', 'created', 'App\\Models\\UserProgress', 'created', 79, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":8,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:48:59', '2025-08-22 23:48:59');
INSERT INTO `activity_log` VALUES (367, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 44, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":8}}', NULL, '2025-08-22 23:49:08', '2025-08-22 23:49:08');
INSERT INTO `activity_log` VALUES (368, 'default', 'User logged in', 'App\\Models\\User', NULL, 69, 'App\\Models\\User', 69, '[]', NULL, '2025-08-22 23:49:23', '2025-08-22 23:49:23');
INSERT INTO `activity_log` VALUES (369, 'default', 'created', 'App\\Models\\Komentar', 'created', 63, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":8,\"user_id\":48,\"isi_komentar\":\"Materi sangat lengkap dan mendalam \\u2013 Penjelasan mencakup definisi, jenis-jenis narkoba (narkotika, psikotropika, dan bahan adiktif), dampak, pencegahan, hingga penanganan dan rehabilitasi. Ini membuat pembaca mendapatkan gambaran utuh.\\r\\n\\r\\nBahasa jelas dan sistematis \\u2013 Penyampaian menggunakan bahasa yang mudah dipahami, meskipun topiknya cukup berat. Hal ini membantu pelajar maupun masyarakat umum memahami bahaya narkoba dengan baik.\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:50:28', '2025-08-22 23:50:28');
INSERT INTO `activity_log` VALUES (370, 'default', 'created', 'App\\Models\\Like', 'created', 85, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":15,\"user_id\":69}}', NULL, '2025-08-22 23:50:46', '2025-08-22 23:50:46');
INSERT INTO `activity_log` VALUES (371, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 58, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 23:51:08', '2025-08-22 23:51:08');
INSERT INTO `activity_log` VALUES (372, 'default', 'created', 'App\\Models\\Like', 'created', 86, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48}}', NULL, '2025-08-22 23:51:12', '2025-08-22 23:51:12');
INSERT INTO `activity_log` VALUES (373, 'default', 'created', 'App\\Models\\UserProgress', 'created', 80, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:51:35', '2025-08-22 23:51:35');
INSERT INTO `activity_log` VALUES (374, 'default', 'created', 'App\\Models\\Komentar', 'created', 64, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":11,\"user_id\":48,\"isi_komentar\":\"\\u2764\\ufe0f\\u2764\\ufe0f\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:52:08', '2025-08-22 23:52:08');
INSERT INTO `activity_log` VALUES (375, 'default', 'created', 'App\\Models\\Like', 'created', 87, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 23:52:17', '2025-08-22 23:52:17');
INSERT INTO `activity_log` VALUES (376, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 45, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":10}}', NULL, '2025-08-22 23:52:30', '2025-08-22 23:52:30');
INSERT INTO `activity_log` VALUES (377, 'default', 'created', 'App\\Models\\UserProgress', 'created', 81, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_pdf\",\"content_id\":10,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:52:30', '2025-08-22 23:52:30');
INSERT INTO `activity_log` VALUES (378, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 46, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"materi_id\":10}}', NULL, '2025-08-22 23:52:40', '2025-08-22 23:52:40');
INSERT INTO `activity_log` VALUES (379, 'default', 'created', 'App\\Models\\Komentar', 'created', 65, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48,\"isi_komentar\":\"Secara keseluruhan, materi ini sangat baik, bermanfaat, dan layak digunakan sebagai bahan ajar atau penyuluhan remaja karena tidak hanya memberi informasi, tetapi juga mendorong kesadaran diri dan perilaku sehat.\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:53:39', '2025-08-22 23:53:39');
INSERT INTO `activity_log` VALUES (380, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 87, 'App\\Models\\User', 48, '{\"old\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 23:53:41', '2025-08-22 23:53:41');
INSERT INTO `activity_log` VALUES (381, 'default', 'created', 'App\\Models\\Like', 'created', 88, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":10,\"user_id\":48}}', NULL, '2025-08-22 23:53:43', '2025-08-22 23:53:43');
INSERT INTO `activity_log` VALUES (382, 'default', 'created', 'App\\Models\\UserProgress', 'created', 82, 'App\\Models\\User', 48, '{\"attributes\":{\"user_id\":48,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:54:08', '2025-08-22 23:54:08');
INSERT INTO `activity_log` VALUES (383, 'default', 'created', 'App\\Models\\Komentar', 'created', 66, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":9,\"user_id\":48,\"isi_komentar\":\"video ini bermanfaat sekali karena mengajarkan tentang pola hidup sehat, mantapp \\ud83e\\udd29\\u2764\\ufe0f\\ud83d\\udc4d\\ud83c\\udffb\",\"balasan_admin\":null}}', NULL, '2025-08-22 23:54:34', '2025-08-22 23:54:34');
INSERT INTO `activity_log` VALUES (384, 'default', 'created', 'App\\Models\\Like', 'created', 89, 'App\\Models\\User', 48, '{\"attributes\":{\"materi_id\":9,\"user_id\":48}}', NULL, '2025-08-22 23:54:38', '2025-08-22 23:54:38');
INSERT INTO `activity_log` VALUES (385, 'default', 'created', 'App\\Models\\UserProgress', 'created', 83, 'App\\Models\\User', 69, '{\"attributes\":{\"user_id\":69,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-22 23:57:51', '2025-08-22 23:57:51');
INSERT INTO `activity_log` VALUES (386, 'default', 'created', 'App\\Models\\Like', 'created', 90, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-22 23:57:54', '2025-08-22 23:57:54');
INSERT INTO `activity_log` VALUES (387, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 90, 'App\\Models\\User', 69, '{\"old\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-22 23:57:57', '2025-08-22 23:57:57');
INSERT INTO `activity_log` VALUES (388, 'default', 'created', 'App\\Models\\Like', 'created', 91, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69}}', NULL, '2025-08-23 00:00:32', '2025-08-23 00:00:32');
INSERT INTO `activity_log` VALUES (389, 'default', 'created', 'App\\Models\\Komentar', 'created', 67, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":13,\"user_id\":69,\"isi_komentar\":\"materinya keren dan menarik\",\"balasan_admin\":null}}', NULL, '2025-08-23 00:01:20', '2025-08-23 00:01:20');
INSERT INTO `activity_log` VALUES (390, 'default', 'created', 'App\\Models\\Like', 'created', 92, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":12,\"user_id\":69}}', NULL, '2025-08-23 00:02:38', '2025-08-23 00:02:38');
INSERT INTO `activity_log` VALUES (391, 'default', 'created', 'App\\Models\\Komentar', 'created', 68, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":12,\"user_id\":69,\"isi_komentar\":\"materinya jelas,isinya juga mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-23 00:04:41', '2025-08-23 00:04:41');
INSERT INTO `activity_log` VALUES (392, 'default', 'created', 'App\\Models\\Komentar', 'created', 69, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":11,\"user_id\":69,\"isi_komentar\":\"materi berbentuk vidio ini sangat menarik,dan lebih mudah di pahami\",\"balasan_admin\":null}}', NULL, '2025-08-23 00:05:44', '2025-08-23 00:05:44');
INSERT INTO `activity_log` VALUES (393, 'default', 'created', 'App\\Models\\Like', 'created', 93, 'App\\Models\\User', 69, '{\"attributes\":{\"materi_id\":11,\"user_id\":69}}', NULL, '2025-08-23 00:05:47', '2025-08-23 00:05:47');
INSERT INTO `activity_log` VALUES (394, 'default', 'created', 'App\\Models\\UserProgress', 'created', 84, 'App\\Models\\User', 69, '{\"attributes\":{\"user_id\":69,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 00:05:52', '2025-08-23 00:05:52');
INSERT INTO `activity_log` VALUES (395, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 02:51:31', '2025-08-23 02:51:31');
INSERT INTO `activity_log` VALUES (396, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 02:51:31', '2025-08-23 02:51:31');
INSERT INTO `activity_log` VALUES (397, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 02:54:01', '2025-08-23 02:54:01');
INSERT INTO `activity_log` VALUES (398, 'default', 'User logged in', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-23 02:54:12', '2025-08-23 02:54:12');
INSERT INTO `activity_log` VALUES (399, 'default', 'User logged in', 'App\\Models\\User', NULL, 48, 'App\\Models\\User', 48, '[]', NULL, '2025-08-23 02:56:13', '2025-08-23 02:56:13');
INSERT INTO `activity_log` VALUES (400, 'default', 'User logged in', 'App\\Models\\User', NULL, 55, 'App\\Models\\User', 55, '[]', NULL, '2025-08-23 03:05:01', '2025-08-23 03:05:01');
INSERT INTO `activity_log` VALUES (401, 'default', 'created', 'App\\Models\\Like', 'created', 94, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":15,\"user_id\":55}}', NULL, '2025-08-23 03:05:15', '2025-08-23 03:05:15');
INSERT INTO `activity_log` VALUES (402, 'default', 'created', 'App\\Models\\Like', 'created', 95, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:24', '2025-08-23 03:05:24');
INSERT INTO `activity_log` VALUES (403, 'default', 'created', 'App\\Models\\UserProgress', 'created', 85, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":13,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 03:05:26', '2025-08-23 03:05:26');
INSERT INTO `activity_log` VALUES (404, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 95, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:27', '2025-08-23 03:05:27');
INSERT INTO `activity_log` VALUES (405, 'default', 'created', 'App\\Models\\Like', 'created', 96, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:29', '2025-08-23 03:05:29');
INSERT INTO `activity_log` VALUES (406, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 96, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:31', '2025-08-23 03:05:31');
INSERT INTO `activity_log` VALUES (407, 'default', 'created', 'App\\Models\\Like', 'created', 97, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:32', '2025-08-23 03:05:32');
INSERT INTO `activity_log` VALUES (408, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 97, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:32', '2025-08-23 03:05:32');
INSERT INTO `activity_log` VALUES (409, 'default', 'created', 'App\\Models\\Like', 'created', 98, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:32', '2025-08-23 03:05:32');
INSERT INTO `activity_log` VALUES (410, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 98, 'App\\Models\\User', 55, '{\"old\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:05:32', '2025-08-23 03:05:32');
INSERT INTO `activity_log` VALUES (411, 'default', 'created', 'App\\Models\\Komentar', 'created', 70, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-23 03:06:12', '2025-08-23 03:06:12');
INSERT INTO `activity_log` VALUES (412, 'default', 'created', 'App\\Models\\Like', 'created', 99, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":13,\"user_id\":55}}', NULL, '2025-08-23 03:06:17', '2025-08-23 03:06:17');
INSERT INTO `activity_log` VALUES (413, 'default', 'created', 'App\\Models\\UserProgress', 'created', 86, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 03:06:31', '2025-08-23 03:06:31');
INSERT INTO `activity_log` VALUES (414, 'default', 'created', 'App\\Models\\Komentar', 'created', 71, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":11,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-23 03:06:42', '2025-08-23 03:06:42');
INSERT INTO `activity_log` VALUES (415, 'default', 'created', 'App\\Models\\Like', 'created', 100, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":11,\"user_id\":55}}', NULL, '2025-08-23 03:06:46', '2025-08-23 03:06:46');
INSERT INTO `activity_log` VALUES (416, 'default', 'created', 'App\\Models\\Like', 'created', 101, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":9,\"user_id\":55}}', NULL, '2025-08-23 03:07:03', '2025-08-23 03:07:03');
INSERT INTO `activity_log` VALUES (417, 'default', 'created', 'App\\Models\\UserProgress', 'created', 87, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":9,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 03:07:04', '2025-08-23 03:07:04');
INSERT INTO `activity_log` VALUES (418, 'default', 'created', 'App\\Models\\Komentar', 'created', 72, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":9,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-23 03:07:13', '2025-08-23 03:07:13');
INSERT INTO `activity_log` VALUES (419, 'default', 'created', 'App\\Models\\Like', 'created', 102, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":7,\"user_id\":55}}', NULL, '2025-08-23 03:07:32', '2025-08-23 03:07:32');
INSERT INTO `activity_log` VALUES (420, 'default', 'created', 'App\\Models\\Komentar', 'created', 73, 'App\\Models\\User', 55, '{\"attributes\":{\"materi_id\":7,\"user_id\":55,\"isi_komentar\":\"bagus bngt\",\"balasan_admin\":null}}', NULL, '2025-08-23 03:07:41', '2025-08-23 03:07:41');
INSERT INTO `activity_log` VALUES (421, 'default', 'created', 'App\\Models\\UserProgress', 'created', 88, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"materi_video\",\"content_id\":7,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 03:07:49', '2025-08-23 03:07:49');
INSERT INTO `activity_log` VALUES (422, 'default', 'created', 'App\\Models\\UserProgress', 'created', 89, 'App\\Models\\User', 55, '{\"attributes\":{\"user_id\":55,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 03:08:49', '2025-08-23 03:08:49');
INSERT INTO `activity_log` VALUES (423, 'default', 'User logged out', 'App\\Models\\User', NULL, 5, 'App\\Models\\User', 5, '[]', NULL, '2025-08-23 03:13:30', '2025-08-23 03:13:30');
INSERT INTO `activity_log` VALUES (424, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 03:13:44', '2025-08-23 03:13:44');
INSERT INTO `activity_log` VALUES (425, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 03:13:44', '2025-08-23 03:13:44');
INSERT INTO `activity_log` VALUES (426, 'default', 'deleted', 'App\\Models\\User', 'deleted', 84, 'App\\Models\\User', 3, '{\"old\":{\"name\":\"Adam\",\"email\":\"adamsetiadijr07@gmail.com\",\"password\":\"$2y$12$a9j5r\\/BwFc5CFYHUJvCoAuMLtO0pXSDgUCneJjNccBx9qklvlQJO6\"}}', NULL, '2025-08-23 03:14:05', '2025-08-23 03:14:05');
INSERT INTO `activity_log` VALUES (427, 'default', 'User logged in', 'App\\Models\\User', NULL, 26, 'App\\Models\\User', 26, '[]', NULL, '2025-08-23 03:21:17', '2025-08-23 03:21:17');
INSERT INTO `activity_log` VALUES (428, 'default', 'User logged out', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-23 03:22:05', '2025-08-23 03:22:05');
INSERT INTO `activity_log` VALUES (429, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-23 04:29:36', '2025-08-23 04:29:36');
INSERT INTO `activity_log` VALUES (430, 'default', 'created', 'App\\Models\\Like', 'created', 103, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":7,\"user_id\":46}}', NULL, '2025-08-23 04:30:06', '2025-08-23 04:30:06');
INSERT INTO `activity_log` VALUES (431, 'default', 'created', 'App\\Models\\Komentar', 'created', 74, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":7,\"user_id\":46,\"isi_komentar\":\"wihh gampang banget dipahami materinya, ga bosen juga liat animasinya, selalu kerenn\",\"balasan_admin\":null}}', NULL, '2025-08-23 04:33:34', '2025-08-23 04:33:34');
INSERT INTO `activity_log` VALUES (432, 'default', 'created', 'App\\Models\\UserProgress', 'created', 90, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"materi_video\",\"content_id\":11,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 04:34:11', '2025-08-23 04:34:11');
INSERT INTO `activity_log` VALUES (433, 'default', 'created', 'App\\Models\\Like', 'created', 104, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":11,\"user_id\":46}}', NULL, '2025-08-23 04:34:56', '2025-08-23 04:34:56');
INSERT INTO `activity_log` VALUES (434, 'default', 'created', 'App\\Models\\Komentar', 'created', 75, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":11,\"user_id\":46,\"isi_komentar\":\"wah terimakasih materi nya, sekarang jadi lebih tau mengenai kesehatan reproduksi \\ud83e\\udd29\",\"balasan_admin\":null}}', NULL, '2025-08-23 04:36:04', '2025-08-23 04:36:04');
INSERT INTO `activity_log` VALUES (435, 'default', 'User logged in', 'App\\Models\\User', NULL, 22, 'App\\Models\\User', 22, '[]', NULL, '2025-08-23 11:35:38', '2025-08-23 11:35:38');
INSERT INTO `activity_log` VALUES (436, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 47, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"materi_id\":5}}', NULL, '2025-08-23 11:36:04', '2025-08-23 11:36:04');
INSERT INTO `activity_log` VALUES (437, 'default', 'created', 'App\\Models\\UserProgress', 'created', 91, 'App\\Models\\User', 22, '{\"attributes\":{\"user_id\":22,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-23 11:36:04', '2025-08-23 11:36:04');
INSERT INTO `activity_log` VALUES (438, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-23 13:23:19', '2025-08-23 13:23:19');
INSERT INTO `activity_log` VALUES (439, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-23 13:23:19', '2025-08-23 13:23:19');
INSERT INTO `activity_log` VALUES (440, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":13,\"user_id\":82,\"is_responder\":true,\"response\":\"Pola makan sehat untuk remaja sangat penting untuk mendukung pertumbuhan, energi, dan fokus. Berikut beberapa tips yang bisa kamu terapkan:\\r\\n\\r\\n*Menu Makanan Seimbang:*\\r\\n\\r\\n1. *Sarapan*: Mulai hari dengan sarapan yang seimbang, seperti oatmeal dengan buah dan kacang-kacangan, atau telur dengan roti gandum dan sayuran.\\r\\n2. *Makan Siang*: Pilih makanan yang kaya akan protein, karbohidrat kompleks, dan sayuran, seperti nasi merah dengan ayam panggang dan sayuran.\\r\\n3. *Makan Malam*: Makan malam yang ringan dan seimbang, seperti ikan dengan sayuran dan quinoa.\\r\\n4. *Camilan*: Pilih camilan yang sehat, seperti buah, kacang-kacangan, atau yogurt.\\r\\n\\r\\n*Frekuensi Makan:*\\r\\n\\r\\n1. *3-5 kali makan utama*: Sarapan, makan siang, makan malam, dan 2-3 kali camilan sehat.\\r\\n2. *Jangan melewatkan makan*: Pastikan kamu makan secara teratur untuk menjaga energi dan fokus.\\r\\n\\r\\n*Makanan yang Harus Dihindari:*\\r\\n\\r\\n1. *Makanan yang tinggi gula*: Batasi konsumsi makanan yang tinggi gula, seperti permen, minuman manis, dan kue-kue.\\r\\n2. *Makanan yang tinggi lemak*: Batasi konsumsi makanan yang tinggi lemak, seperti gorengan, makanan yang digoreng, dan makanan yang tinggi lemak jenuh.\\r\\n3. *Makanan yang tinggi sodium*: Batasi konsumsi makanan yang tinggi sodium, seperti makanan yang diasinkan, makanan yang diproses, dan makanan yang tinggi garam.\\r\\n\\r\\n*Tips Tambahan:*\\r\\n\\r\\n1. *Minum banyak air*: Pastikan kamu minum banyak air untuk menjaga hidrasi dan kesehatan tubuh.\\r\\n2. *Olahraga teratur*: Lakukan olahraga teratur untuk menjaga kesehatan tubuh dan meningkatkan energi.\\r\\n3. *Tidur yang cukup*: Pastikan kamu tidur yang cukup untuk menjaga kesehatan tubuh dan meningkatkan fokus.\\r\\n\\r\\nDengan menerapkan pola makan sehat dan tips di atas, kamu dapat meningkatkan energi, fokus, dan kesehatan tubuh. Jika kamu masih merasa lelah atau kurang fokus, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk mengetahui penyebabnya.\",\"is_public\":true}}', NULL, '2025-08-23 13:26:23', '2025-08-23 13:26:23');
INSERT INTO `activity_log` VALUES (441, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 13:26:23', '2025-08-23 13:26:23');
INSERT INTO `activity_log` VALUES (442, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":12,\"user_id\":82,\"is_responder\":true,\"response\":\"Kebutuhan gizi remaja bervariasi tergantung pada usia, jenis kelamin, tingkat aktivitas fisik, dan faktor lainnya. Berikut adalah perkiraan kebutuhan gizi harian untuk remaja:\\r\\n\\r\\n*Kebutuhan Kalori:*\\r\\n\\r\\n- Remaja laki-laki (14-18 tahun): 2.200-3.200 kalori\\/hari\\r\\n- Remaja perempuan (14-18 tahun): 1.800-2.400 kalori\\/hari\\r\\n\\r\\n*Kebutuhan Protein:*\\r\\n\\r\\n- Remaja laki-laki (14-18 tahun): 52-60 gram\\/hari\\r\\n- Remaja perempuan (14-18 tahun): 46-50 gram\\/hari\\r\\n\\r\\n*Kebutuhan Vitamin dan Mineral:*\\r\\n\\r\\n- Vitamin C: 65-75 mg\\/hari\\r\\n- Vitamin D: 600-800 IU\\/hari\\r\\n- Kalsium: 1.300 mg\\/hari\\r\\n- Zat besi: 8-18 mg\\/hari (lebih tinggi untuk remaja perempuan)\\r\\n- Vitamin B12: 2,4-2,6 mcg\\/hari\\r\\n\\r\\n*Perbedaan Kebutuhan Gizi antara Laki-laki dan Perempuan:*\\r\\n\\r\\n- Remaja laki-laki umumnya membutuhkan lebih banyak kalori dan protein daripada remaja perempuan karena perbedaan tingkat metabolisme dan massa otot.\\r\\n- Remaja perempuan membutuhkan lebih banyak zat besi karena menstruasi dan kebutuhan reproduksi.\\r\\n- Kebutuhan kalsium dan vitamin D sama untuk kedua jenis kelamin karena pentingnya untuk pertumbuhan tulang.\\r\\n\\r\\nNamun, perlu diingat bahwa kebutuhan gizi individu dapat bervariasi tergantung pada faktor-faktor seperti tingkat aktivitas fisik, kondisi kesehatan, dan preferensi makanan. Oleh karena itu, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk menentukan kebutuhan gizi yang spesifik untuk setiap individu.\",\"is_public\":true}}', NULL, '2025-08-23 13:27:42', '2025-08-23 13:27:42');
INSERT INTO `activity_log` VALUES (443, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 13:27:42', '2025-08-23 13:27:42');
INSERT INTO `activity_log` VALUES (444, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":11,\"user_id\":82,\"is_responder\":true,\"response\":\"Benar sekali! Pemeriksaan kesehatan secara berkala sangat penting untuk mendeteksi masalah kesehatan lebih dini dan mencegah penyakit kronis. Banyak penyakit tidak menunjukkan gejala awal yang jelas, sehingga pemeriksaan rutin dapat membantu mengidentifikasi masalah kesehatan sebelum menjadi parah.\\r\\n\\r\\nDengan melakukan konsultasi rutin, kita dapat:\\r\\n\\r\\n- Mendeteksi masalah kesehatan lebih dini\\r\\n- Mencegah penyakit kronis\\r\\n- Menjaga pola hidup yang lebih seimbang\\r\\n- Mengatasi kebingungan terkait pola makan, aktivitas fisik, manajemen stres, dan cara menjaga imun tubuh\\r\\n\\r\\nSelain itu, konsultasi rutin juga dapat membantu meningkatkan kesadaran dan pengetahuan tentang kesehatan, sehingga kita dapat membuat keputusan yang lebih tepat untuk menjaga kesehatan kita.\\r\\n\\r\\nJadi, sangat penting untuk melakukan pemeriksaan kesehatan secara berkala dan konsultasi rutin dengan dokter atau ahli kesehatan lainnya untuk menjaga kesehatan dan mencegah penyakit.\",\"is_public\":true}}', NULL, '2025-08-23 13:29:17', '2025-08-23 13:29:17');
INSERT INTO `activity_log` VALUES (445, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 13:29:17', '2025-08-23 13:29:17');
INSERT INTO `activity_log` VALUES (446, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":10,\"user_id\":82,\"is_responder\":true,\"response\":\"Mengatur pola hidup sehat memang tidak mudah, terutama ketika ada godaan makanan yang lezat tapi tidak sehat. Berikut beberapa tips yang bisa membantu kamu menjaga pola hidup sehat dan konsisten:\\r\\n\\r\\n*Tips untuk Mengatur Pola Makan:*\\r\\n\\r\\n1. *Rencanakan makanan*: Buatlah rencana makanan untuk beberapa hari ke depan, sehingga kamu bisa mempersiapkan makanan yang seimbang dan sehat.\\r\\n2. *Siapkan makanan sehat*: Siapkan makanan sehat di rumah, seperti sayuran, buah, dan protein yang seimbang.\\r\\n3. *Kurangi godaan*: Jika kamu tahu bahwa kamu tidak bisa menahan godaan makanan tertentu, cobalah untuk menghindarinya atau mengurangi jumlahnya.\\r\\n4. *Cari alternatif*: Cari alternatif makanan yang lebih sehat untuk makanan yang kamu sukai, seperti seblak yang dibuat dengan bahan-bahan yang lebih sehat.\\r\\n\\r\\n*Tips untuk Mengatur Konsumsi Makanan Tidak Sehat:*\\r\\n\\r\\n1. *Izinkan diri*: Izinkan diri kamu untuk menikmati makanan tidak sehat dalam jumlah yang wajar dan tidak terlalu sering.\\r\\n2. *Pilih waktu yang tepat*: Pilih waktu yang tepat untuk menikmati makanan tidak sehat, seperti pada hari libur atau setelah olahraga.\\r\\n3. *Kontrol porsi*: Kontrol porsi makanan tidak sehat yang kamu konsumsi, sehingga kamu tidak terlalu banyak mengonsumsinya.\\r\\n\\r\\n*Tips untuk Meningkatkan Konsistensi:*\\r\\n\\r\\n1. *Buat tujuan*: Buat tujuan yang spesifik dan realistis untuk menjaga pola hidup sehat.\\r\\n2. *Cari dukungan*: Cari dukungan dari teman atau keluarga yang juga ingin menjaga pola hidup sehat.\\r\\n3. *Pantau progres*: Pantau progres kamu dan catat keberhasilan kamu dalam menjaga pola hidup sehat.\\r\\n4. *Jangan terlalu keras*: Jangan terlalu keras pada diri sendiri jika kamu gagal, tetapi cobalah untuk belajar dari kesalahan dan terus mencoba.\\r\\n\\r\\n*Tips untuk Meningkatkan Olahraga:*\\r\\n\\r\\n1. *Cari olahraga yang menyenangkan*: Cari olahraga yang menyenangkan dan sesuai dengan minat kamu.\\r\\n2. *Buat jadwal*: Buat jadwal olahraga yang realistis dan sesuai dengan gaya hidup kamu.\\r\\n3. *Mulai dari kecil*: Mulai dari olahraga yang ringan dan secara bertahap meningkatkan intensitas dan durasi.\\r\\n\\r\\nDengan mengikuti tips di atas, kamu bisa meningkatkan kemampuan kamu untuk menjaga pola hidup sehat dan konsisten. Ingat bahwa menjaga pola hidup sehat adalah proses yang berkelanjutan dan memerlukan kesabaran dan konsistensi.\",\"is_public\":true}}', NULL, '2025-08-23 13:30:33', '2025-08-23 13:30:33');
INSERT INTO `activity_log` VALUES (447, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-23 13:30:33', '2025-08-23 13:30:33');
INSERT INTO `activity_log` VALUES (448, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-23 14:22:58', '2025-08-23 14:22:58');
INSERT INTO `activity_log` VALUES (449, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-24 03:40:04', '2025-08-24 03:40:04');
INSERT INTO `activity_log` VALUES (450, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-24 03:40:04', '2025-08-24 03:40:04');
INSERT INTO `activity_log` VALUES (451, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-24 03:53:52', '2025-08-24 03:53:52');
INSERT INTO `activity_log` VALUES (452, 'default', 'User logged in', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-24 03:53:52', '2025-08-24 03:53:52');
INSERT INTO `activity_log` VALUES (453, 'default', 'User logged out', 'App\\Models\\User', NULL, 20, 'App\\Models\\User', 20, '[]', NULL, '2025-08-24 04:43:43', '2025-08-24 04:43:43');
INSERT INTO `activity_log` VALUES (454, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-24 06:56:39', '2025-08-24 06:56:39');
INSERT INTO `activity_log` VALUES (455, 'default', 'created', 'App\\Models\\UserProgress', 'created', 92, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 06:57:01', '2025-08-24 06:57:01');
INSERT INTO `activity_log` VALUES (456, 'default', 'created', 'App\\Models\\Like', 'created', 105, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":15,\"user_id\":63}}', NULL, '2025-08-24 06:57:48', '2025-08-24 06:57:48');
INSERT INTO `activity_log` VALUES (457, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 48, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-24 06:58:21', '2025-08-24 06:58:21');
INSERT INTO `activity_log` VALUES (458, 'default', 'created', 'App\\Models\\UserProgress', 'created', 93, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"materi_pdf\",\"content_id\":15,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 06:58:21', '2025-08-24 06:58:21');
INSERT INTO `activity_log` VALUES (459, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 49, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-24 06:58:26', '2025-08-24 06:58:26');
INSERT INTO `activity_log` VALUES (460, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 50, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-24 06:58:28', '2025-08-24 06:58:28');
INSERT INTO `activity_log` VALUES (461, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 51, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-24 06:59:00', '2025-08-24 06:59:00');
INSERT INTO `activity_log` VALUES (462, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 52, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":15}}', NULL, '2025-08-24 06:59:02', '2025-08-24 06:59:02');
INSERT INTO `activity_log` VALUES (463, 'default', 'created', 'App\\Models\\Komentar', 'created', 76, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":15,\"user_id\":63,\"isi_komentar\":\"Wah materinya lengkap bgt, gampang dipahami juga. Jadi lebih sadar pentingnya ngerawat kesehatan payudara dari hal kecil kaya kebersihan, pola makan sampe periksa rutin. Baru tau juga ternyata faktor makanan sama gaya hidup ngaruh bgt. Keren sih\",\"balasan_admin\":null}}', NULL, '2025-08-24 07:03:12', '2025-08-24 07:03:12');
INSERT INTO `activity_log` VALUES (464, 'default', 'created', 'App\\Models\\Like', 'created', 106, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":13,\"user_id\":63}}', NULL, '2025-08-24 07:03:32', '2025-08-24 07:03:32');
INSERT INTO `activity_log` VALUES (465, 'default', 'created', 'App\\Models\\Komentar', 'created', 77, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":12,\"user_id\":63,\"isi_komentar\":\"i materi, detail bgt tp gampang dicerna. Jadi makin kebuka mata kalo mental health tuh sepenting itu \\ud83d\\udd25\\ud83d\\udd25\",\"balasan_admin\":null}}', NULL, '2025-08-24 07:09:45', '2025-08-24 07:09:45');
INSERT INTO `activity_log` VALUES (466, 'default', 'created', 'App\\Models\\Like', 'created', 107, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":8,\"user_id\":63}}', NULL, '2025-08-24 07:12:33', '2025-08-24 07:12:33');
INSERT INTO `activity_log` VALUES (467, 'default', 'created', 'App\\Models\\Komentar', 'created', 78, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":8,\"user_id\":63,\"isi_komentar\":\"Setelah baca materi ini jadi sadar banget kalau narkoba itu bener-bener bahaya dan harus dijauhi. bikin semangat buat jaga diri sendiri dan teman-teman dari pengaruh narkoba Ternyata dampak narkoba luas banget ya, bukan cuma kesehatan tapi juga masa depan. Jadi lebih hati-hati\",\"balasan_admin\":null}}', NULL, '2025-08-24 07:13:55', '2025-08-24 07:13:55');
INSERT INTO `activity_log` VALUES (468, 'default', 'created', 'App\\Models\\Like', 'created', 108, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":5,\"user_id\":63}}', NULL, '2025-08-24 07:14:02', '2025-08-24 07:14:02');
INSERT INTO `activity_log` VALUES (469, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 53, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":5}}', NULL, '2025-08-24 07:14:12', '2025-08-24 07:14:12');
INSERT INTO `activity_log` VALUES (470, 'default', 'created', 'App\\Models\\UserProgress', 'created', 94, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"content_type\":\"materi_pdf\",\"content_id\":5,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 07:14:12', '2025-08-24 07:14:12');
INSERT INTO `activity_log` VALUES (471, 'default', 'created', 'App\\Models\\DownloadLog', 'created', 54, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"materi_id\":5}}', NULL, '2025-08-24 07:14:15', '2025-08-24 07:14:15');
INSERT INTO `activity_log` VALUES (472, 'default', 'created', 'App\\Models\\Komentar', 'created', 79, 'App\\Models\\User', 63, '{\"attributes\":{\"materi_id\":5,\"user_id\":63,\"isi_komentar\":\"Menurut aku materinya bermanfaat banget buat nambah pengetahuan. Jadi bisa lebih ngerti pentingnya gizi seimbang. Cocok juga buat diterapin di kehidupan sehari-hari.\",\"balasan_admin\":null}}', NULL, '2025-08-24 07:17:23', '2025-08-24 07:17:23');
INSERT INTO `activity_log` VALUES (473, 'default', 'created', 'App\\Models\\Consultation', 'created', 14, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"category_id\":1,\"title\":\"Pola Hidup Sehat untuk Remaja\",\"description\":\"sebagian siswa masih suka mengabaikan pola hidup sehat, misalnya sering kurang tidur, jarang olahraga, atau lebih memilih jajanan cepat saji daripada makanan bergizi. Hal ini bisa bikin tubuh cepat lelah, sulit fokus belajar, bahkan gampang sakit. Dengan memahami pola hidup sehat, diharapkan siswa bisa menjaga kondisi fisik dan mental. Bagaimana cara membiasakan diri untuk tidur cukup meski tugas sekolah sering menumpuk? Lalu Bagaimana cara mengatur waktu belajar, istirahat, dan aktivitas lain agar tubuh tetap fit?\",\"priority\":\"low\",\"status\":\"menunggu\"}}', NULL, '2025-08-24 07:50:43', '2025-08-24 07:50:43');
INSERT INTO `activity_log` VALUES (474, 'default', 'created', 'App\\Models\\Consultation', 'created', 15, 'App\\Models\\User', 63, '{\"attributes\":{\"user_id\":63,\"category_id\":19,\"title\":\"Kesehatan mental pada remaja\",\"description\":\"Banyak pelajar merasa mudah stres, cemas, atau terbebani dengan tugas sekolah dan masalah pribadi. Kadang bingung cara menenangkan diri, apalagi kalau tidak tahu harus cerita ke siapa. Padahal menjaga kesehatan mental sama pentingnya dengan menjaga kesehatan. Apa langkah yang bisa dilakukan kalau merasa cemas atau overthinking? Pertanyaan yg kedua  Bagaimana cara mengenali tanda-tanda kalau mental kita lagi nggak sehat? Dan Apa kegiatan sederhana yang bisa dilakukan remaja untuk menjaga mood tetap stabil?\",\"priority\":\"medium\",\"status\":\"menunggu\"}}', NULL, '2025-08-24 07:54:24', '2025-08-24 07:54:24');
INSERT INTO `activity_log` VALUES (475, 'default', 'created', 'App\\Models\\User', 'created', 86, NULL, NULL, '{\"attributes\":{\"name\":\"Arisa\",\"email\":\"naqiesss@gmail.com\",\"password\":\"$2y$12$hWV1jhCaiacTT7l9U0jEeuVumGZGJ6JaD2rIPLHKTfhzPZ0RDkGmG\"}}', NULL, '2025-08-24 21:07:55', '2025-08-24 21:07:55');
INSERT INTO `activity_log` VALUES (476, 'default', 'created', 'App\\Models\\UserProgress', 'created', 95, 'App\\Models\\User', 86, '{\"attributes\":{\"user_id\":86,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-24 21:08:05', '2025-08-24 21:08:05');
INSERT INTO `activity_log` VALUES (477, 'default', 'created', 'App\\Models\\Like', 'created', 109, 'App\\Models\\User', 86, '{\"attributes\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 21:13:19', '2025-08-24 21:13:19');
INSERT INTO `activity_log` VALUES (478, 'default', 'deleted', 'App\\Models\\Like', 'deleted', 109, 'App\\Models\\User', 86, '{\"old\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 21:13:19', '2025-08-24 21:13:19');
INSERT INTO `activity_log` VALUES (479, 'default', 'created', 'App\\Models\\Like', 'created', 110, 'App\\Models\\User', 86, '{\"attributes\":{\"materi_id\":5,\"user_id\":86}}', NULL, '2025-08-24 21:13:22', '2025-08-24 21:13:22');
INSERT INTO `activity_log` VALUES (480, 'default', 'User logged in', 'App\\Models\\User', NULL, 24, 'App\\Models\\User', 24, '[]', NULL, '2025-08-25 01:26:11', '2025-08-25 01:26:11');
INSERT INTO `activity_log` VALUES (481, 'default', 'User logged in', 'App\\Models\\User', NULL, 59, 'App\\Models\\User', 59, '[]', NULL, '2025-08-25 01:27:07', '2025-08-25 01:27:07');
INSERT INTO `activity_log` VALUES (482, 'default', 'created', 'App\\Models\\Komentar', 'created', 80, 'App\\Models\\User', 59, '{\"attributes\":{\"materi_id\":15,\"user_id\":59,\"isi_komentar\":\"Pokok nyaa in the besttt bangettttttt kaka, jadi aku enak banget bacaaaa + jelas banget \\ud83e\\udd70\\ud83e\\udd70\\ud83e\\udd70\",\"balasan_admin\":null}}', NULL, '2025-08-25 01:29:20', '2025-08-25 01:29:20');
INSERT INTO `activity_log` VALUES (483, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 14, 'App\\Models\\User', 24, '{\"attributes\":{\"consultation_id\":12,\"user_id\":24,\"is_responder\":false,\"response\":\"Baik terimakasih, jadi intinya kebutuhan gizi setiap individu itu berbeda tetapi ada standar gizi yang harus dipenuhi oleh remaja. Terimakasih sekali lagi atas jawabannya saya jadi tahu gizi yang diperlukan untuk remaja \\u263a\\ufe0f\\ud83d\\ude4c\\ud83c\\udffb\\ud83d\\udc4d\\ud83c\\udffb\",\"is_public\":true}}', NULL, '2025-08-25 01:34:42', '2025-08-25 01:34:42');
INSERT INTO `activity_log` VALUES (484, 'default', 'User logged in', 'App\\Models\\User', NULL, 33, 'App\\Models\\User', 33, '[]', NULL, '2025-08-25 03:33:53', '2025-08-25 03:33:53');
INSERT INTO `activity_log` VALUES (485, 'default', 'User logged in', 'App\\Models\\User', NULL, 63, 'App\\Models\\User', 63, '[]', NULL, '2025-08-25 07:12:49', '2025-08-25 07:12:49');
INSERT INTO `activity_log` VALUES (486, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 07:21:18', '2025-08-25 07:21:18');
INSERT INTO `activity_log` VALUES (487, 'default', 'User logged in', 'App\\Models\\User', NULL, 82, 'App\\Models\\User', 82, '[]', NULL, '2025-08-25 07:21:18', '2025-08-25 07:21:18');
INSERT INTO `activity_log` VALUES (488, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 10, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 07:25:24', '2025-08-25 07:25:24');
INSERT INTO `activity_log` VALUES (489, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 11, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 07:25:54', '2025-08-25 07:25:54');
INSERT INTO `activity_log` VALUES (490, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 12, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 07:54:33', '2025-08-25 07:54:33');
INSERT INTO `activity_log` VALUES (491, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 13, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"selesai\"},\"old\":{\"status\":\"proses\"}}', NULL, '2025-08-25 07:54:45', '2025-08-25 07:54:45');
INSERT INTO `activity_log` VALUES (492, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":14,\"user_id\":82,\"is_responder\":true,\"response\":\"1. Cara Membiasakan Tidur Cukup Meski Tugas Menumpuk\\r\\nBuat Prioritas Tugas\\r\\nGunakan metode prioritas (Eisenhower Matrix):\\r\\nPenting & Mendesak \\u2192 Kerjakan segera\\r\\nPenting & Tidak Mendesak \\u2192 Jadwalkan\\r\\nTidak Penting \\u2192 Kurangi atau hindari\\r\\nHindari Menunda Pekerjaan\\r\\nSelesaikan tugas di awal, jangan menunggu deadline agar tidak begadang.\\r\\nTetapkan Jam Tidur yang Konsisten\\r\\nMisalnya, target tidur 7\\u20138 jam setiap malam. Usahakan tidur dan bangun di jam yang sama.\\r\\nKurangi Distraksi\\r\\nSimpan ponsel saat mengerjakan tugas dan sebelum tidur agar tidak terjebak scrolling media sosial.\\r\\nTeknik Pomodoro\\r\\nBelajar fokus 25 menit, istirahat 5 menit, ulangi 4 kali, lalu ambil istirahat lebih panjang (15\\u201330 menit).\\r\\n2. Cara Mengatur Waktu Belajar, Istirahat, dan Aktivitas\\r\\nGunakan Jadwal Harian\\r\\nBuat tabel pagi\\u2013siang\\u2013sore\\u2013malam. Masukkan:\\r\\nWaktu belajar (pagi\\/sore, saat otak segar)\\r\\nIstirahat (5\\u201310 menit setiap 1 jam belajar)\\r\\nAktivitas fisik (olahraga 20\\u201330 menit minimal 3 kali seminggu)\\r\\nTidur cukup\\r\\nAtur Target Harian Kecil\\r\\nDaripada memaksakan banyak materi dalam 1 hari, pecah jadi bagian kecil (misalnya 2 bab\\/hari).\\r\\n\\r\\nHindari Multitasking\\r\\nFokus satu hal agar lebih cepat selesai dan tidak membuang energi.\\r\\nSeimbangkan dengan Me Time\\r\\nLakukan hobi ringan untuk menjaga mental tetap sehat.\",\"is_public\":true}}', NULL, '2025-08-25 07:56:22', '2025-08-25 07:56:22');
INSERT INTO `activity_log` VALUES (493, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 14, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-25 07:56:22', '2025-08-25 07:56:22');
INSERT INTO `activity_log` VALUES (494, 'default', 'created', 'App\\Models\\ConsultationResponse', 'created', 16, 'App\\Models\\User', 82, '{\"attributes\":{\"consultation_id\":15,\"user_id\":82,\"is_responder\":true,\"response\":\"1. Langkah yang Bisa Dilakukan Kalau Merasa Cemas atau Overthinking\\r\\nTarik Napas Dalam & Latihan Relaksasi\\r\\nCoba teknik 4-7-8: tarik napas 4 detik \\u2192 tahan 7 detik \\u2192 hembuskan 8 detik. Ulangi 3\\u20135 kali.\\r\\nAlihkan Pikiran ke Aktivitas Positif\\r\\nDengarkan musik yang menenangkan, menulis jurnal, atau melakukan hobi.\\r\\nPisahkan Hal yang Bisa Dikendalikan & Tidak Bisa Dikendalikan\\r\\nFokus pada solusi yang ada di tangan kamu, bukan hal yang di luar kontrol.\\r\\nBatasi Overload Informasi\\r\\nKurangi konsumsi media sosial yang memicu perbandingan diri.\\r\\nCerita ke Orang yang Dipercaya\\r\\nBisa teman dekat, keluarga, atau guru BK. Jika butuh, jangan ragu mencari konselor.\\r\\n2. Cara Mengenali Tanda-Tanda Mental Tidak Sehat\\r\\nMudah Lelah & Sulit Fokus meski tidur cukup.\\r\\nPerubahan Pola Makan (terlalu banyak atau sedikit).\\r\\nTidur Tidak Teratur (insomnia atau terlalu banyak tidur).\\r\\nSering Merasa Sedih, Kosong, atau Mudah Marah.\\r\\nMenarik Diri dari Sosial (enggan ngobrol, malas ikut kegiatan).\\r\\nTurunnya Motivasi & Prestasi Belajar.\\r\\nSakit Fisik Tanpa Sebab Jelas (sakit kepala, perut).\\r\\nJika tanda ini terjadi lebih dari 2 minggu dan mengganggu aktivitas sehari-hari, itu sinyal kamu butuh bantuan.\\r\\n3. Kegiatan Sederhana untuk Menjaga Mood Tetap Stabil\\r\\nOlahraga Ringan (jalan kaki, stretching, senam \\u2192 bisa 15\\u201330 menit).\\r\\nMendengarkan Musik Favorit yang bikin rileks.\\r\\nJournaling (tulis apa yang kamu syukuri dan rasakan).\\r\\nHobi Kreatif (gambar, masak, main musik, DIY).\\r\\nHabiskan Waktu dengan Teman atau Keluarga.\\r\\nPraktik Mindfulness (fokus pada hal-hal kecil, seperti rasa makanan, suara sekitar).\\r\\nBatasi Gadget Sebelum Tidur agar kualitas tidur lebih baik.\",\"is_public\":true}}', NULL, '2025-08-25 07:58:58', '2025-08-25 07:58:58');
INSERT INTO `activity_log` VALUES (495, 'default', 'updated', 'App\\Models\\Consultation', 'updated', 15, 'App\\Models\\User', 82, '{\"attributes\":{\"status\":\"proses\"},\"old\":{\"status\":\"menunggu\"}}', NULL, '2025-08-25 07:58:58', '2025-08-25 07:58:58');
INSERT INTO `activity_log` VALUES (496, 'default', 'User logged in', 'App\\Models\\User', NULL, 46, 'App\\Models\\User', 46, '[]', NULL, '2025-08-25 08:56:21', '2025-08-25 08:56:21');
INSERT INTO `activity_log` VALUES (497, 'default', 'created', 'App\\Models\\UserProgress', 'created', 96, 'App\\Models\\User', 46, '{\"attributes\":{\"user_id\":46,\"content_type\":\"informasi_kesehatan\",\"content_id\":4,\"is_completed\":true,\"progress_data\":null}}', NULL, '2025-08-25 08:57:29', '2025-08-25 08:57:29');
INSERT INTO `activity_log` VALUES (498, 'default', 'created', 'App\\Models\\Like', 'created', 111, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":5,\"user_id\":46}}', NULL, '2025-08-25 08:59:25', '2025-08-25 08:59:25');
INSERT INTO `activity_log` VALUES (499, 'default', 'created', 'App\\Models\\Komentar', 'created', 81, 'App\\Models\\User', 46, '{\"attributes\":{\"materi_id\":5,\"user_id\":46,\"isi_komentar\":\"Materi ini suka banget walaupun berbentuk pdf tetapi ada visual nya yaitu gambar yang bisa memberikan pemahaman lebih dalam, ilmu ini juga bagus untuk diterapkan pada kehidupan sehari-hari dalam menjaga pola hidup sehat\",\"balasan_admin\":null}}', NULL, '2025-08-25 09:00:33', '2025-08-25 09:00:33');
INSERT INTO `activity_log` VALUES (500, 'default', 'User logged in', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 09:32:11', '2025-08-25 09:32:11');
INSERT INTO `activity_log` VALUES (501, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 09:47:31', '2025-08-25 09:47:31');
INSERT INTO `activity_log` VALUES (502, 'default', 'User logged in', 'App\\Models\\User', NULL, 3, 'App\\Models\\User', 3, '[]', NULL, '2025-08-25 09:47:31', '2025-08-25 09:47:31');
INSERT INTO `activity_log` VALUES (503, 'default', 'User logged out', 'App\\Models\\User', NULL, 21, 'App\\Models\\User', 21, '[]', NULL, '2025-08-25 09:52:50', '2025-08-25 09:52:50');

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for consultation_attachments
-- ----------------------------
DROP TABLE IF EXISTS `consultation_attachments`;
CREATE TABLE `consultation_attachments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultation_id` bigint UNSIGNED NULL DEFAULT NULL,
  `response_id` bigint UNSIGNED NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `consultation_attachments_consultation_id_foreign`(`consultation_id` ASC) USING BTREE,
  INDEX `consultation_attachments_response_id_foreign`(`response_id` ASC) USING BTREE,
  CONSTRAINT `consultation_attachments_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `consultation_attachments_response_id_foreign` FOREIGN KEY (`response_id`) REFERENCES `consultation_responses` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consultation_attachments
-- ----------------------------
INSERT INTO `consultation_attachments` VALUES (2, 11, NULL, 'tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png', 'consultations/tC3vSEPQyqQznd8wN1IQwwNnjdboNc8Ire6fKaNz.png', 'image/png', 316777, 'IMG_20250822_172115.png', '2025-08-22 10:22:35', '2025-08-22 10:22:35');

-- ----------------------------
-- Table structure for consultation_categories
-- ----------------------------
DROP TABLE IF EXISTS `consultation_categories`;
CREATE TABLE `consultation_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#007bff',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consultation_categories
-- ----------------------------
INSERT INTO `consultation_categories` VALUES (1, 'Pola Hidup Sehat', NULL, '#007bff', 1, NULL, NULL);
INSERT INTO `consultation_categories` VALUES (2, 'Reproduksi', NULL, '#007bff', 1, NULL, NULL);
INSERT INTO `consultation_categories` VALUES (13, 'Gizi', NULL, '#007bff', 1, NULL, NULL);
INSERT INTO `consultation_categories` VALUES (16, 'Narkoba', NULL, '#007bff', 1, NULL, NULL);
INSERT INTO `consultation_categories` VALUES (19, 'Kesehatan Mental', NULL, '#007bff', 1, NULL, NULL);
INSERT INTO `consultation_categories` VALUES (20, 'Lainnya', 'Konsultasi kesehatan lainnya', '#6c757d', 1, '2025-08-13 22:51:32', '2025-08-13 22:51:32');

-- ----------------------------
-- Table structure for consultation_responses
-- ----------------------------
DROP TABLE IF EXISTS `consultation_responses`;
CREATE TABLE `consultation_responses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultation_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `is_responder` tinyint(1) NOT NULL DEFAULT 0,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `consultation_responses_consultation_id_foreign`(`consultation_id` ASC) USING BTREE,
  INDEX `consultation_responses_admin_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `consultation_responses_consultation_id_foreign` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `consultation_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consultation_responses
-- ----------------------------
INSERT INTO `consultation_responses` VALUES (7, 8, 3, 1, 'Untuk menjaga daya tahan tubuh, usahakan makan bergizi seimbang, cukup tidur, rutin olahraga, minum air putih yang cukup, dan kelola stres dengan baik. Hindari begadang serta kebiasaan tidak sehat agar tubuh tetap fit dan tidak mudah sakit.', 1, '2025-08-19 12:56:26', '2025-08-19 12:56:26');
INSERT INTO `consultation_responses` VALUES (8, 8, 5, 0, 'berapa lama waktu tidur yang ideal agar tubuh tetap sehat dan tidak mudah lelah?', 1, '2025-08-19 12:57:44', '2025-08-19 12:57:44');
INSERT INTO `consultation_responses` VALUES (9, 8, 3, 1, 'Waktu tidur ideal untuk remaja dan dewasa adalah sekitar 7–9 jam per malam. Tidur cukup membantu tubuh memulihkan energi, menjaga daya tahan tubuh, dan membuat konsentrasi lebih baik di siang hari.', 1, '2025-08-19 12:58:07', '2025-08-19 12:58:07');
INSERT INTO `consultation_responses` VALUES (10, 13, 82, 1, 'Pola makan sehat untuk remaja sangat penting untuk mendukung pertumbuhan, energi, dan fokus. Berikut beberapa tips yang bisa kamu terapkan:\r\n\r\n*Menu Makanan Seimbang:*\r\n\r\n1. *Sarapan*: Mulai hari dengan sarapan yang seimbang, seperti oatmeal dengan buah dan kacang-kacangan, atau telur dengan roti gandum dan sayuran.\r\n2. *Makan Siang*: Pilih makanan yang kaya akan protein, karbohidrat kompleks, dan sayuran, seperti nasi merah dengan ayam panggang dan sayuran.\r\n3. *Makan Malam*: Makan malam yang ringan dan seimbang, seperti ikan dengan sayuran dan quinoa.\r\n4. *Camilan*: Pilih camilan yang sehat, seperti buah, kacang-kacangan, atau yogurt.\r\n\r\n*Frekuensi Makan:*\r\n\r\n1. *3-5 kali makan utama*: Sarapan, makan siang, makan malam, dan 2-3 kali camilan sehat.\r\n2. *Jangan melewatkan makan*: Pastikan kamu makan secara teratur untuk menjaga energi dan fokus.\r\n\r\n*Makanan yang Harus Dihindari:*\r\n\r\n1. *Makanan yang tinggi gula*: Batasi konsumsi makanan yang tinggi gula, seperti permen, minuman manis, dan kue-kue.\r\n2. *Makanan yang tinggi lemak*: Batasi konsumsi makanan yang tinggi lemak, seperti gorengan, makanan yang digoreng, dan makanan yang tinggi lemak jenuh.\r\n3. *Makanan yang tinggi sodium*: Batasi konsumsi makanan yang tinggi sodium, seperti makanan yang diasinkan, makanan yang diproses, dan makanan yang tinggi garam.\r\n\r\n*Tips Tambahan:*\r\n\r\n1. *Minum banyak air*: Pastikan kamu minum banyak air untuk menjaga hidrasi dan kesehatan tubuh.\r\n2. *Olahraga teratur*: Lakukan olahraga teratur untuk menjaga kesehatan tubuh dan meningkatkan energi.\r\n3. *Tidur yang cukup*: Pastikan kamu tidur yang cukup untuk menjaga kesehatan tubuh dan meningkatkan fokus.\r\n\r\nDengan menerapkan pola makan sehat dan tips di atas, kamu dapat meningkatkan energi, fokus, dan kesehatan tubuh. Jika kamu masih merasa lelah atau kurang fokus, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk mengetahui penyebabnya.', 1, '2025-08-23 13:26:23', '2025-08-23 13:26:23');
INSERT INTO `consultation_responses` VALUES (11, 12, 82, 1, 'Kebutuhan gizi remaja bervariasi tergantung pada usia, jenis kelamin, tingkat aktivitas fisik, dan faktor lainnya. Berikut adalah perkiraan kebutuhan gizi harian untuk remaja:\r\n\r\n*Kebutuhan Kalori:*\r\n\r\n- Remaja laki-laki (14-18 tahun): 2.200-3.200 kalori/hari\r\n- Remaja perempuan (14-18 tahun): 1.800-2.400 kalori/hari\r\n\r\n*Kebutuhan Protein:*\r\n\r\n- Remaja laki-laki (14-18 tahun): 52-60 gram/hari\r\n- Remaja perempuan (14-18 tahun): 46-50 gram/hari\r\n\r\n*Kebutuhan Vitamin dan Mineral:*\r\n\r\n- Vitamin C: 65-75 mg/hari\r\n- Vitamin D: 600-800 IU/hari\r\n- Kalsium: 1.300 mg/hari\r\n- Zat besi: 8-18 mg/hari (lebih tinggi untuk remaja perempuan)\r\n- Vitamin B12: 2,4-2,6 mcg/hari\r\n\r\n*Perbedaan Kebutuhan Gizi antara Laki-laki dan Perempuan:*\r\n\r\n- Remaja laki-laki umumnya membutuhkan lebih banyak kalori dan protein daripada remaja perempuan karena perbedaan tingkat metabolisme dan massa otot.\r\n- Remaja perempuan membutuhkan lebih banyak zat besi karena menstruasi dan kebutuhan reproduksi.\r\n- Kebutuhan kalsium dan vitamin D sama untuk kedua jenis kelamin karena pentingnya untuk pertumbuhan tulang.\r\n\r\nNamun, perlu diingat bahwa kebutuhan gizi individu dapat bervariasi tergantung pada faktor-faktor seperti tingkat aktivitas fisik, kondisi kesehatan, dan preferensi makanan. Oleh karena itu, sebaiknya konsultasikan dengan dokter atau ahli gizi untuk menentukan kebutuhan gizi yang spesifik untuk setiap individu.', 1, '2025-08-23 13:27:42', '2025-08-23 13:27:42');
INSERT INTO `consultation_responses` VALUES (12, 11, 82, 1, 'Benar sekali! Pemeriksaan kesehatan secara berkala sangat penting untuk mendeteksi masalah kesehatan lebih dini dan mencegah penyakit kronis. Banyak penyakit tidak menunjukkan gejala awal yang jelas, sehingga pemeriksaan rutin dapat membantu mengidentifikasi masalah kesehatan sebelum menjadi parah.\r\n\r\nDengan melakukan konsultasi rutin, kita dapat:\r\n\r\n- Mendeteksi masalah kesehatan lebih dini\r\n- Mencegah penyakit kronis\r\n- Menjaga pola hidup yang lebih seimbang\r\n- Mengatasi kebingungan terkait pola makan, aktivitas fisik, manajemen stres, dan cara menjaga imun tubuh\r\n\r\nSelain itu, konsultasi rutin juga dapat membantu meningkatkan kesadaran dan pengetahuan tentang kesehatan, sehingga kita dapat membuat keputusan yang lebih tepat untuk menjaga kesehatan kita.\r\n\r\nJadi, sangat penting untuk melakukan pemeriksaan kesehatan secara berkala dan konsultasi rutin dengan dokter atau ahli kesehatan lainnya untuk menjaga kesehatan dan mencegah penyakit.', 1, '2025-08-23 13:29:17', '2025-08-23 13:29:17');
INSERT INTO `consultation_responses` VALUES (13, 10, 82, 1, 'Mengatur pola hidup sehat memang tidak mudah, terutama ketika ada godaan makanan yang lezat tapi tidak sehat. Berikut beberapa tips yang bisa membantu kamu menjaga pola hidup sehat dan konsisten:\r\n\r\n*Tips untuk Mengatur Pola Makan:*\r\n\r\n1. *Rencanakan makanan*: Buatlah rencana makanan untuk beberapa hari ke depan, sehingga kamu bisa mempersiapkan makanan yang seimbang dan sehat.\r\n2. *Siapkan makanan sehat*: Siapkan makanan sehat di rumah, seperti sayuran, buah, dan protein yang seimbang.\r\n3. *Kurangi godaan*: Jika kamu tahu bahwa kamu tidak bisa menahan godaan makanan tertentu, cobalah untuk menghindarinya atau mengurangi jumlahnya.\r\n4. *Cari alternatif*: Cari alternatif makanan yang lebih sehat untuk makanan yang kamu sukai, seperti seblak yang dibuat dengan bahan-bahan yang lebih sehat.\r\n\r\n*Tips untuk Mengatur Konsumsi Makanan Tidak Sehat:*\r\n\r\n1. *Izinkan diri*: Izinkan diri kamu untuk menikmati makanan tidak sehat dalam jumlah yang wajar dan tidak terlalu sering.\r\n2. *Pilih waktu yang tepat*: Pilih waktu yang tepat untuk menikmati makanan tidak sehat, seperti pada hari libur atau setelah olahraga.\r\n3. *Kontrol porsi*: Kontrol porsi makanan tidak sehat yang kamu konsumsi, sehingga kamu tidak terlalu banyak mengonsumsinya.\r\n\r\n*Tips untuk Meningkatkan Konsistensi:*\r\n\r\n1. *Buat tujuan*: Buat tujuan yang spesifik dan realistis untuk menjaga pola hidup sehat.\r\n2. *Cari dukungan*: Cari dukungan dari teman atau keluarga yang juga ingin menjaga pola hidup sehat.\r\n3. *Pantau progres*: Pantau progres kamu dan catat keberhasilan kamu dalam menjaga pola hidup sehat.\r\n4. *Jangan terlalu keras*: Jangan terlalu keras pada diri sendiri jika kamu gagal, tetapi cobalah untuk belajar dari kesalahan dan terus mencoba.\r\n\r\n*Tips untuk Meningkatkan Olahraga:*\r\n\r\n1. *Cari olahraga yang menyenangkan*: Cari olahraga yang menyenangkan dan sesuai dengan minat kamu.\r\n2. *Buat jadwal*: Buat jadwal olahraga yang realistis dan sesuai dengan gaya hidup kamu.\r\n3. *Mulai dari kecil*: Mulai dari olahraga yang ringan dan secara bertahap meningkatkan intensitas dan durasi.\r\n\r\nDengan mengikuti tips di atas, kamu bisa meningkatkan kemampuan kamu untuk menjaga pola hidup sehat dan konsisten. Ingat bahwa menjaga pola hidup sehat adalah proses yang berkelanjutan dan memerlukan kesabaran dan konsistensi.', 1, '2025-08-23 13:30:33', '2025-08-23 13:30:33');
INSERT INTO `consultation_responses` VALUES (14, 12, 24, 0, 'Baik terimakasih, jadi intinya kebutuhan gizi setiap individu itu berbeda tetapi ada standar gizi yang harus dipenuhi oleh remaja. Terimakasih sekali lagi atas jawabannya saya jadi tahu gizi yang diperlukan untuk remaja ☺️🙌🏻👍🏻', 1, '2025-08-25 01:34:42', '2025-08-25 01:34:42');
INSERT INTO `consultation_responses` VALUES (15, 14, 82, 1, '1. Cara Membiasakan Tidur Cukup Meski Tugas Menumpuk\r\nBuat Prioritas Tugas\r\nGunakan metode prioritas (Eisenhower Matrix):\r\nPenting & Mendesak → Kerjakan segera\r\nPenting & Tidak Mendesak → Jadwalkan\r\nTidak Penting → Kurangi atau hindari\r\nHindari Menunda Pekerjaan\r\nSelesaikan tugas di awal, jangan menunggu deadline agar tidak begadang.\r\nTetapkan Jam Tidur yang Konsisten\r\nMisalnya, target tidur 7–8 jam setiap malam. Usahakan tidur dan bangun di jam yang sama.\r\nKurangi Distraksi\r\nSimpan ponsel saat mengerjakan tugas dan sebelum tidur agar tidak terjebak scrolling media sosial.\r\nTeknik Pomodoro\r\nBelajar fokus 25 menit, istirahat 5 menit, ulangi 4 kali, lalu ambil istirahat lebih panjang (15–30 menit).\r\n2. Cara Mengatur Waktu Belajar, Istirahat, dan Aktivitas\r\nGunakan Jadwal Harian\r\nBuat tabel pagi–siang–sore–malam. Masukkan:\r\nWaktu belajar (pagi/sore, saat otak segar)\r\nIstirahat (5–10 menit setiap 1 jam belajar)\r\nAktivitas fisik (olahraga 20–30 menit minimal 3 kali seminggu)\r\nTidur cukup\r\nAtur Target Harian Kecil\r\nDaripada memaksakan banyak materi dalam 1 hari, pecah jadi bagian kecil (misalnya 2 bab/hari).\r\n\r\nHindari Multitasking\r\nFokus satu hal agar lebih cepat selesai dan tidak membuang energi.\r\nSeimbangkan dengan Me Time\r\nLakukan hobi ringan untuk menjaga mental tetap sehat.', 1, '2025-08-25 07:56:22', '2025-08-25 07:56:22');
INSERT INTO `consultation_responses` VALUES (16, 15, 82, 1, '1. Langkah yang Bisa Dilakukan Kalau Merasa Cemas atau Overthinking\r\nTarik Napas Dalam & Latihan Relaksasi\r\nCoba teknik 4-7-8: tarik napas 4 detik → tahan 7 detik → hembuskan 8 detik. Ulangi 3–5 kali.\r\nAlihkan Pikiran ke Aktivitas Positif\r\nDengarkan musik yang menenangkan, menulis jurnal, atau melakukan hobi.\r\nPisahkan Hal yang Bisa Dikendalikan & Tidak Bisa Dikendalikan\r\nFokus pada solusi yang ada di tangan kamu, bukan hal yang di luar kontrol.\r\nBatasi Overload Informasi\r\nKurangi konsumsi media sosial yang memicu perbandingan diri.\r\nCerita ke Orang yang Dipercaya\r\nBisa teman dekat, keluarga, atau guru BK. Jika butuh, jangan ragu mencari konselor.\r\n2. Cara Mengenali Tanda-Tanda Mental Tidak Sehat\r\nMudah Lelah & Sulit Fokus meski tidur cukup.\r\nPerubahan Pola Makan (terlalu banyak atau sedikit).\r\nTidur Tidak Teratur (insomnia atau terlalu banyak tidur).\r\nSering Merasa Sedih, Kosong, atau Mudah Marah.\r\nMenarik Diri dari Sosial (enggan ngobrol, malas ikut kegiatan).\r\nTurunnya Motivasi & Prestasi Belajar.\r\nSakit Fisik Tanpa Sebab Jelas (sakit kepala, perut).\r\nJika tanda ini terjadi lebih dari 2 minggu dan mengganggu aktivitas sehari-hari, itu sinyal kamu butuh bantuan.\r\n3. Kegiatan Sederhana untuk Menjaga Mood Tetap Stabil\r\nOlahraga Ringan (jalan kaki, stretching, senam → bisa 15–30 menit).\r\nMendengarkan Musik Favorit yang bikin rileks.\r\nJournaling (tulis apa yang kamu syukuri dan rasakan).\r\nHobi Kreatif (gambar, masak, main musik, DIY).\r\nHabiskan Waktu dengan Teman atau Keluarga.\r\nPraktik Mindfulness (fokus pada hal-hal kecil, seperti rasa makanan, suara sekitar).\r\nBatasi Gadget Sebelum Tidur agar kualitas tidur lebih baik.', 1, '2025-08-25 07:58:58', '2025-08-25 07:58:58');

-- ----------------------------
-- Table structure for consultations
-- ----------------------------
DROP TABLE IF EXISTS `consultations`;
CREATE TABLE `consultations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','medium','high') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('menunggu','proses','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `consultations_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `consultations_category_id_foreign`(`category_id` ASC) USING BTREE,
  CONSTRAINT `consultations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `consultation_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `consultations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consultations
-- ----------------------------
INSERT INTO `consultations` VALUES (8, 5, 1, 'menjaga daya tahan tubuh', 'bagaimana cara menjaga daya tahan tubuh supaya tidak mudah sakit?', 'low', 'selesai', NULL, '2025-08-19 12:55:37', '2025-08-19 12:59:27');
INSERT INTO `consultations` VALUES (10, 22, 1, 'CARA BIAR BISA MENJAGA POLA HIDUP SEHAT', 'pengen bisa jaga pola hidup sehat, pengen juga makan makanan yg seimbang, tapi kadang susah bgt nahan kalau pengen jajan seblak, gorengan, makanan pedas dan berminyak, sama makanan manis gtu. gimana ya caranya biar bisaa konsistennn ngejaga pola hidup yg sehat, karena olahraga juga kadang kadang aja', 'low', 'selesai', NULL, '2025-08-22 10:08:20', '2025-08-25 07:25:24');
INSERT INTO `consultations` VALUES (11, 65, 1, 'Sehat bersama:pentingnya konsultasi rutin', 'Banyak orang sering mengabaikan pemeriksaan kesehatan secara berkala karena merasa masih sehat atau tidak merasakan gejala tertentu. Padahal, penyakit sering muncul tanpa tanda awal yang jelas, sehingga baru diketahui saat sudah parah. Dengan melakukan konsultasi rutin, kita bisa mendeteksi masalah kesehatan lebih dini, mencegah penyakit kronis, serta menjaga pola hidup yang lebih seimbang. Konsultasi rutin juga membantu mengatasi kebingungan masyarakat terkait pola makan, aktivitas fisik, manajemen stres, hingga cara menjaga imun tubuh.', 'medium', 'selesai', NULL, '2025-08-22 10:22:35', '2025-08-25 07:25:54');
INSERT INTO `consultations` VALUES (12, 24, 1, 'Kebutuhan Gizi Ideal untuk Remaja', 'Sebenarnya berapa Kebutuhan kalori, protein, vitamin, dan mineral yang ideal untuk remaja setiap harinya? Dan apakah kebutuhan gizi antara laki laki dan perempuan itu berbeda?', 'low', 'selesai', NULL, '2025-08-22 23:39:34', '2025-08-25 07:54:33');
INSERT INTO `consultations` VALUES (13, 48, 13, 'pola makan sehat untuk remaja', 'Saya ingin berkonsultasi mengenai pola makan sehat untuk remaja. Saat ini saya sering merasa cepat lelah dan kurang fokus saat belajar. Berat badan saya cenderung naik, tetapi nafsu makan juga sering tinggi. Saya ingin tahu menu makanan yang seimbang, berapa kali sebaiknya makan dalam sehari, serta makanan apa saja yang harus dihindari agar kesehatan tetap terjaga', 'low', 'selesai', NULL, '2025-08-22 23:43:07', '2025-08-25 07:54:45');
INSERT INTO `consultations` VALUES (14, 63, 1, 'Pola Hidup Sehat untuk Remaja', 'sebagian siswa masih suka mengabaikan pola hidup sehat, misalnya sering kurang tidur, jarang olahraga, atau lebih memilih jajanan cepat saji daripada makanan bergizi. Hal ini bisa bikin tubuh cepat lelah, sulit fokus belajar, bahkan gampang sakit. Dengan memahami pola hidup sehat, diharapkan siswa bisa menjaga kondisi fisik dan mental. Bagaimana cara membiasakan diri untuk tidur cukup meski tugas sekolah sering menumpuk? Lalu Bagaimana cara mengatur waktu belajar, istirahat, dan aktivitas lain agar tubuh tetap fit?', 'low', 'proses', NULL, '2025-08-24 07:50:43', '2025-08-25 07:56:22');
INSERT INTO `consultations` VALUES (15, 63, 19, 'Kesehatan mental pada remaja', 'Banyak pelajar merasa mudah stres, cemas, atau terbebani dengan tugas sekolah dan masalah pribadi. Kadang bingung cara menenangkan diri, apalagi kalau tidak tahu harus cerita ke siapa. Padahal menjaga kesehatan mental sama pentingnya dengan menjaga kesehatan. Apa langkah yang bisa dilakukan kalau merasa cemas atau overthinking? Pertanyaan yg kedua  Bagaimana cara mengenali tanda-tanda kalau mental kita lagi nggak sehat? Dan Apa kegiatan sederhana yang bisa dilakukan remaja untuk menjaga mood tetap stabil?', 'medium', 'proses', NULL, '2025-08-24 07:54:24', '2025-08-25 07:58:58');

-- ----------------------------
-- Table structure for download_logs
-- ----------------------------
DROP TABLE IF EXISTS `download_logs`;
CREATE TABLE `download_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `materi_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `download_logs_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `download_logs_materi_id_foreign`(`materi_id` ASC) USING BTREE,
  CONSTRAINT `download_logs_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `download_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of download_logs
-- ----------------------------
INSERT INTO `download_logs` VALUES (12, 5, 15, '2025-08-19 13:04:54', '2025-08-19 13:04:54');
INSERT INTO `download_logs` VALUES (13, 43, 15, '2025-08-19 23:46:06', '2025-08-19 23:46:06');
INSERT INTO `download_logs` VALUES (14, 43, 15, '2025-08-19 23:46:12', '2025-08-19 23:46:12');
INSERT INTO `download_logs` VALUES (15, 43, 5, '2025-08-20 00:01:56', '2025-08-20 00:01:56');
INSERT INTO `download_logs` VALUES (16, 24, 15, '2025-08-20 10:43:08', '2025-08-20 10:43:08');
INSERT INTO `download_logs` VALUES (17, 24, 12, '2025-08-20 10:43:18', '2025-08-20 10:43:18');
INSERT INTO `download_logs` VALUES (18, 24, 12, '2025-08-20 10:43:22', '2025-08-20 10:43:22');
INSERT INTO `download_logs` VALUES (19, 24, 12, '2025-08-20 10:43:29', '2025-08-20 10:43:29');
INSERT INTO `download_logs` VALUES (20, 24, 10, '2025-08-20 10:43:40', '2025-08-20 10:43:40');
INSERT INTO `download_logs` VALUES (21, 24, 10, '2025-08-20 10:43:45', '2025-08-20 10:43:45');
INSERT INTO `download_logs` VALUES (22, 24, 10, '2025-08-20 10:43:46', '2025-08-20 10:43:46');
INSERT INTO `download_logs` VALUES (23, 24, 10, '2025-08-20 10:43:48', '2025-08-20 10:43:48');
INSERT INTO `download_logs` VALUES (24, 24, 10, '2025-08-20 10:43:52', '2025-08-20 10:43:52');
INSERT INTO `download_logs` VALUES (25, 24, 10, '2025-08-20 10:43:52', '2025-08-20 10:43:52');
INSERT INTO `download_logs` VALUES (26, 24, 10, '2025-08-20 10:43:56', '2025-08-20 10:43:56');
INSERT INTO `download_logs` VALUES (27, 24, 10, '2025-08-20 10:43:58', '2025-08-20 10:43:58');
INSERT INTO `download_logs` VALUES (28, 24, 8, '2025-08-20 10:44:10', '2025-08-20 10:44:10');
INSERT INTO `download_logs` VALUES (29, 24, 5, '2025-08-20 10:44:20', '2025-08-20 10:44:20');
INSERT INTO `download_logs` VALUES (30, 22, 12, '2025-08-22 09:52:18', '2025-08-22 09:52:18');
INSERT INTO `download_logs` VALUES (31, 48, 12, '2025-08-22 09:54:35', '2025-08-22 09:54:35');
INSERT INTO `download_logs` VALUES (32, 48, 12, '2025-08-22 09:55:02', '2025-08-22 09:55:02');
INSERT INTO `download_logs` VALUES (33, 48, 5, '2025-08-22 10:01:04', '2025-08-22 10:01:04');
INSERT INTO `download_logs` VALUES (34, 65, 15, '2025-08-22 10:24:13', '2025-08-22 10:24:13');
INSERT INTO `download_logs` VALUES (35, 65, 15, '2025-08-22 10:24:20', '2025-08-22 10:24:20');
INSERT INTO `download_logs` VALUES (36, 65, 12, '2025-08-22 10:25:31', '2025-08-22 10:25:31');
INSERT INTO `download_logs` VALUES (37, 65, 10, '2025-08-22 10:30:05', '2025-08-22 10:30:05');
INSERT INTO `download_logs` VALUES (38, 65, 8, '2025-08-22 10:40:43', '2025-08-22 10:40:43');
INSERT INTO `download_logs` VALUES (39, 65, 5, '2025-08-22 10:40:55', '2025-08-22 10:40:55');
INSERT INTO `download_logs` VALUES (40, 24, 8, '2025-08-22 23:21:32', '2025-08-22 23:21:32');
INSERT INTO `download_logs` VALUES (41, 48, 15, '2025-08-22 23:44:23', '2025-08-22 23:44:23');
INSERT INTO `download_logs` VALUES (42, 48, 15, '2025-08-22 23:44:28', '2025-08-22 23:44:28');
INSERT INTO `download_logs` VALUES (43, 48, 8, '2025-08-22 23:48:59', '2025-08-22 23:48:59');
INSERT INTO `download_logs` VALUES (44, 48, 8, '2025-08-22 23:49:08', '2025-08-22 23:49:08');
INSERT INTO `download_logs` VALUES (45, 48, 10, '2025-08-22 23:52:30', '2025-08-22 23:52:30');
INSERT INTO `download_logs` VALUES (46, 48, 10, '2025-08-22 23:52:40', '2025-08-22 23:52:40');
INSERT INTO `download_logs` VALUES (47, 22, 5, '2025-08-23 11:36:04', '2025-08-23 11:36:04');
INSERT INTO `download_logs` VALUES (48, 63, 15, '2025-08-24 06:58:21', '2025-08-24 06:58:21');
INSERT INTO `download_logs` VALUES (49, 63, 15, '2025-08-24 06:58:26', '2025-08-24 06:58:26');
INSERT INTO `download_logs` VALUES (50, 63, 15, '2025-08-24 06:58:28', '2025-08-24 06:58:28');
INSERT INTO `download_logs` VALUES (51, 63, 15, '2025-08-24 06:59:00', '2025-08-24 06:59:00');
INSERT INTO `download_logs` VALUES (52, 63, 15, '2025-08-24 06:59:02', '2025-08-24 06:59:02');
INSERT INTO `download_logs` VALUES (53, 63, 5, '2025-08-24 07:14:12', '2025-08-24 07:14:12');
INSERT INTO `download_logs` VALUES (54, 63, 5, '2025-08-24 07:14:15', '2025-08-24 07:14:15');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for forum_posts
-- ----------------------------
DROP TABLE IF EXISTS `forum_posts`;
CREATE TABLE `forum_posts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `thread_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `forum_posts_thread_id_foreign`(`thread_id` ASC) USING BTREE,
  INDEX `forum_posts_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `forum_posts_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `forum_threads` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `forum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_posts
-- ----------------------------

-- ----------------------------
-- Table structure for forum_threads
-- ----------------------------
DROP TABLE IF EXISTS `forum_threads`;
CREATE TABLE `forum_threads`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `forum_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` int NOT NULL DEFAULT 0,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `forum_threads_forum_id_foreign`(`forum_id` ASC) USING BTREE,
  INDEX `forum_threads_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `forum_threads_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `forum_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_threads
-- ----------------------------

-- ----------------------------
-- Table structure for forums
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `forums_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forums
-- ----------------------------
INSERT INTO `forums` VALUES (1, 'Kesehatan Umum', 'Diskusi tentang kesehatan umum, tips hidup sehat, dan informasi kesehatan dasar', 'kesehatan-umum', 1, 1, '2025-08-24 04:23:24', '2025-08-24 04:23:24');
INSERT INTO `forums` VALUES (2, 'Konsultasi Kesehatan', 'Tempat bertanya dan berbagi pengalaman seputar masalah kesehatan', 'konsultasi-kesehatan', 1, 2, '2025-08-24 04:23:24', '2025-08-24 04:23:24');
INSERT INTO `forums` VALUES (3, 'Gaya Hidup Sehat', 'Diskusi tentang olahraga, nutrisi, dan pola hidup sehat', 'gaya-hidup-sehat', 1, 3, '2025-08-24 04:23:24', '2025-08-24 04:23:24');
INSERT INTO `forums` VALUES (4, 'Kesehatan Mental', 'Pembahasan seputar kesehatan mental, stress management, dan wellbeing', 'kesehatan-mental', 1, 4, '2025-08-24 04:23:24', '2025-08-24 04:23:24');
INSERT INTO `forums` VALUES (5, 'Diskusi Umum', 'Ruang diskusi bebas untuk topik-topik lain yang berkaitan dengan platform', 'diskusi-umum', 1, 5, '2025-08-24 04:23:24', '2025-08-24 04:23:24');

-- ----------------------------
-- Table structure for informasi_kesehatan
-- ----------------------------
DROP TABLE IF EXISTS `informasi_kesehatan`;
CREATE TABLE `informasi_kesehatan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `link_sumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_update` date NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `informasi_kesehatan_created_by_foreign`(`created_by` ASC) USING BTREE,
  CONSTRAINT `informasi_kesehatan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of informasi_kesehatan
-- ----------------------------
INSERT INTO `informasi_kesehatan` VALUES (4, 'Kesehatan Remaja', 'kesehatan pada remaja', 'https://ayosehat.kemkes.go.id/kategori-usia/remaja', '2025-07-03', 3, '2025-07-02 15:28:57', '2025-07-02 15:28:57');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for komentars
-- ----------------------------
DROP TABLE IF EXISTS `komentars`;
CREATE TABLE `komentars`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `materi_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `isi_komentar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balasan_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `komentars_materi_id_foreign`(`materi_id` ASC) USING BTREE,
  INDEX `komentars_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `komentars_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `komentars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komentars
-- ----------------------------
INSERT INTO `komentars` VALUES (3, 7, 21, 'gue bangett', NULL, '2025-08-12 02:14:11', '2025-08-12 02:14:11');
INSERT INTO `komentars` VALUES (4, 9, 26, 'Semoga bisa jadi bermanfaat untuk kedepannya 🙏', NULL, '2025-08-12 19:50:12', '2025-08-12 19:50:12');
INSERT INTO `komentars` VALUES (5, 13, 42, 'menarik, dan dapat di pahami', NULL, '2025-08-12 19:54:48', '2025-08-12 19:54:48');
INSERT INTO `komentars` VALUES (6, 13, 62, 'Video nya sangat baguss', NULL, '2025-08-12 19:54:50', '2025-08-12 19:54:50');
INSERT INTO `komentars` VALUES (7, 13, 27, 'seru, karena interaktif banget jujur suka ke materi yang interaktif kayak gini', NULL, '2025-08-12 19:55:16', '2025-08-12 19:55:16');
INSERT INTO `komentars` VALUES (8, 13, 30, 'keren,materinya mudah dipahami', NULL, '2025-08-12 19:56:40', '2025-08-12 19:56:40');
INSERT INTO `komentars` VALUES (9, 13, 52, 'banyak pelajaran yang di ambil,bagus banget', 'Pelajarannya diambil dan diterapkan juga ya, Dea😉', '2025-08-12 19:56:55', '2025-08-22 23:29:39');
INSERT INTO `komentars` VALUES (10, 13, 23, 'keren bgt omg', 'OMG! Terima kasih Yunike', '2025-08-12 19:59:07', '2025-08-22 23:30:09');
INSERT INTO `komentars` VALUES (11, 13, 54, 'wow', NULL, '2025-08-12 19:59:40', '2025-08-12 19:59:40');
INSERT INTO `komentars` VALUES (12, 13, 40, 'kerennn 💕💕', NULL, '2025-08-12 20:00:09', '2025-08-12 20:00:09');
INSERT INTO `komentars` VALUES (13, 5, 27, 'detail dan lengkap, bagus banget min', NULL, '2025-08-12 20:00:27', '2025-08-12 20:00:27');
INSERT INTO `komentars` VALUES (14, 13, 46, 'menarik dan kreatif, mulai dari isi materinya sampaii animasi nyaa dan gampang dipahami', NULL, '2025-08-12 22:55:41', '2025-08-12 22:55:41');
INSERT INTO `komentars` VALUES (15, 13, 47, 'penjelasan dalam bentuk vidio seperti ini sangat lah menarik, karna ketertarikan itu lah saya bisa lebih memahami dan mengerti apa maksud dan tujuan yang di sampaikan', 'Kami sangat senang bila maksud dan tujuan materi tersampaikan dengan baik kepada adek adek😊', '2025-08-13 01:59:15', '2025-08-22 23:28:45');
INSERT INTO `komentars` VALUES (16, 13, 48, 'keren', NULL, '2025-08-13 04:54:19', '2025-08-13 04:54:19');
INSERT INTO `komentars` VALUES (17, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:02', '2025-08-13 18:48:02');
INSERT INTO `komentars` VALUES (18, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:03', '2025-08-13 18:48:03');
INSERT INTO `komentars` VALUES (19, 12, 47, 'untuk materi pdf ini sama sama memiliki penjelasan yang detail seperti di vidio, untuk kalian yang ingin penjelasan lebih detail dan panjang pdf ini sangat rekomendasi kan🥰🤗🤭😆🥀🫰🏻👍🏻', NULL, '2025-08-13 18:48:04', '2025-08-13 18:48:04');
INSERT INTO `komentars` VALUES (20, 13, 21, 'saya suka materinya', NULL, '2025-08-14 03:25:16', '2025-08-14 03:25:16');
INSERT INTO `komentars` VALUES (21, 13, 43, 'kerennn🔥', NULL, '2025-08-14 03:54:46', '2025-08-14 03:54:46');
INSERT INTO `komentars` VALUES (22, 7, 43, 'SERUUU BANGETT LIATNYAA', NULL, '2025-08-14 04:01:44', '2025-08-14 04:01:44');
INSERT INTO `komentars` VALUES (23, 12, 43, 'seruuu bangeett bacanya, panjang banget🔥😿😍😍', NULL, '2025-08-14 04:55:53', '2025-08-14 04:55:53');
INSERT INTO `komentars` VALUES (24, 13, 63, 'videonya sangat bermanfaat, jadi lebih paham pentingnya menjaga kesehatan mental dan cara mengelola stres.', NULL, '2025-08-14 05:09:22', '2025-08-14 05:09:22');
INSERT INTO `komentars` VALUES (25, 12, 63, 'materinya informatif dan jelas menjelaskan peran hormon stres seperti kortisol, adrenalin, dan norepinefrin, serta tahap-tahap respon tubuh... isinya mudah dipahami dan sesuai dengan kesehatan jiwa sehari-hari', NULL, '2025-08-14 05:13:04', '2025-08-14 05:13:04');
INSERT INTO `komentars` VALUES (26, 9, 43, 'seruu banget nontonnyaa', NULL, '2025-08-14 18:05:43', '2025-08-14 18:05:43');
INSERT INTO `komentars` VALUES (27, 13, 59, 'Seruu bangett, menarik , kerennn, there besttttt pokok nyaaaaa 🥰🔥🔥🔥', 'We are the best... the best... the best yes! 🔥', '2025-08-14 21:47:52', '2025-08-22 23:31:10');
INSERT INTO `komentars` VALUES (28, 11, 62, 'Materi nya mudah di pahamii🙌', NULL, '2025-08-15 01:54:38', '2025-08-15 01:54:38');
INSERT INTO `komentars` VALUES (29, 9, 62, 'Video yang sangat bermanfaat buat kita semuaa🙌', NULL, '2025-08-15 22:27:51', '2025-08-15 22:27:51');
INSERT INTO `komentars` VALUES (30, 7, 62, 'Penjelasannya sangat jelas dan video nya sangat baguss', NULL, '2025-08-15 22:31:07', '2025-08-15 22:31:07');
INSERT INTO `komentars` VALUES (31, 13, 83, 'bagus banget dan mudah dimengerti', NULL, '2025-08-16 06:06:56', '2025-08-16 06:06:56');
INSERT INTO `komentars` VALUES (32, 12, 83, 'materinya detail bangett, bener bener ngebantu kita buat kedepannya lagi agar berpengatahuan luas 💥💓', NULL, '2025-08-16 06:09:41', '2025-08-16 06:09:41');
INSERT INTO `komentars` VALUES (33, 13, 24, 'video ini sangat mudah dipahami, saya jadi tahu apa yang dimaksud sehat jiwa!', 'Bukan hanya sehat fisik, tetapi kita juga harus sehat jiwa👍🏻', '2025-08-20 10:14:42', '2025-08-22 23:27:24');
INSERT INTO `komentars` VALUES (34, 12, 24, 'Materi di PDF ini jauh lebih detail dari yang di video, ini sangat bagus untuk yang ingin mempelajari lebih dalam tentang Kesehatan mental ini 🔥', NULL, '2025-08-20 10:17:41', '2025-08-20 10:17:41');
INSERT INTO `komentars` VALUES (35, 11, 24, 'Penjelasannya sangat jelas!, terutama materi tentang Menjaga kebersihan alat reproduksi, Ciri ciri, dan Tips and tricknya. Karena semua itu sangat penting bagi Remaja 🙌🏻👍🏻', NULL, '2025-08-20 10:26:38', '2025-08-20 10:26:38');
INSERT INTO `komentars` VALUES (36, 10, 24, 'Ternyata Perubahan pada remaja itu bukan hanya pada perubahan fisik, perubahan pada remaja itu ada banyak,Salah satunya Perubahan Psikologis seperti Perubahan Emosi, jasmani, cara berinteraksi kepada teman atau orang tua hingga perubahan cara otak berkerja! ❤️‍🔥👏🏻', NULL, '2025-08-20 10:34:51', '2025-08-20 10:34:51');
INSERT INTO `komentars` VALUES (37, 9, 24, 'Seruu banget vidoenya!!, aku baru tahu ternyata dampak  NAPZA sangat berbahaya bagi manusia', NULL, '2025-08-20 10:39:05', '2025-08-20 10:39:05');
INSERT INTO `komentars` VALUES (38, 7, 24, 'Penjelasan tentang Edukasi gizi nya sangat jelas dan mudah dimengertii 🤩', NULL, '2025-08-20 10:42:40', '2025-08-20 10:42:40');
INSERT INTO `komentars` VALUES (39, 8, 43, 'baguss bangett, dapatt di mengerti tentang narkoba karena penjelasannya terdapat gambar juga', NULL, '2025-08-21 00:12:32', '2025-08-21 00:12:32');
INSERT INTO `komentars` VALUES (40, 13, 33, 'lebih suka nonton video animasi edukatif kaya gini, bikin enggak bosen alias SERUUUU‼️‼️ cocok nih untuk tontonan remaja/gen z ahaaay, karena bener-bener nambah ilmu pengetahuan, + ada solusinya juga, SEMANGAT YAA KAKAK-KAKAK BUAT VIDEO ANIMASI NYA💞💞', 'Oh tentu, kakak kakak mengikuti jaman supaya adek adek lebih tertarik mempelajari materi kesehatan mental😉', '2025-08-22 07:14:10', '2025-08-22 23:26:41');
INSERT INTO `komentars` VALUES (41, 7, 33, 'ternyata... Aku kurang berfokus sama makanan bergizi, jarang olahraga, pantes skincare, bodycare ak gak ngaruh :(( makasih yaa kak, next aku fokusin buat makanan bergizi dan pola hidup sehat!', NULL, '2025-08-22 07:17:59', '2025-08-22 07:17:59');
INSERT INTO `komentars` VALUES (42, 15, 22, 'Menurut aku tulisannya udah jelas banget, runtut, dan enak dibaca. Bahasannya lengkap dari pengertian sampai faktor yang memengaruhi, jadi gampang dipahami. ada juga komponen pencegahannya, jadi kita setelah baca juga tau apa aja sih yg harus kita lakuin supaya terhindar dari hal hal yg tdk kita inginkan', NULL, '2025-08-22 09:49:22', '2025-08-22 09:49:22');
INSERT INTO `komentars` VALUES (43, 13, 22, 'videonya bagus, gampang di pahamii, dan penjelasan dari video ini tersampaikan dengan cepat, isi dari materinya pun tergambarkan dengan animasi animasi yg ada di dalam video', 'Betul sekali, dengan menonton video lebih cepat informasi tersampaikan. Untuk lebih detail, bisa membaca materi dalam bentuk pdf😊', '2025-08-22 09:51:45', '2025-08-22 23:25:14');
INSERT INTO `komentars` VALUES (44, 12, 22, 'Menurut aku, dokumen ini udah keren banget. Isinya jelas, runtut, dan gampang dipahami. Penjelasan soal kesehatan mental remaja, tanda-tanda stres, sampai cara ngatasinnya tuh lengkap banget. Aku juga suka karena nggak cuma teori, tapi ada contoh yang relate sama kehidupan sehari-hari remaja. Bagian akhirnya juga asik, ada afirmasi positif sama contoh terapi yang bisa langsung dipraktekin.', NULL, '2025-08-22 09:54:04', '2025-08-22 09:54:04');
INSERT INTO `komentars` VALUES (45, 11, 22, 'Videonya sangat jelas, saya dapat mengerti penjelasan yang ada di dalam video, menambah ilmu , dan dengan adanya video ini saya jadi tauu tentang menjaga kebersihan alat reproduksi', NULL, '2025-08-22 09:56:06', '2025-08-22 09:56:06');
INSERT INTO `komentars` VALUES (46, 12, 48, 'Secara keseluruhan, materi ini sudah sangat baik—lengkap secara teori, praktis untuk diterapkan, dan relevan dengan kondisi remaja saat ini👍🏻👍🏻👍🏻👍🏻', NULL, '2025-08-22 09:56:53', '2025-08-22 09:56:53');
INSERT INTO `komentars` VALUES (47, 10, 22, 'Menurut aku setelah baca keseluruhan teks ini, isinya udah sangat lengkap dan runtut banget. Dari mulai pengenalan organ reproduksi pria dan wanita, proses fisiologis kayak ovulasi, menstruasi, sampai ke perubahan fisik, psikologis, dan kognitif di masa remaja tuh dibahas jelas banget. Bagian masalah reproduksi remaja juga terasa relevan sama kondisi nyata yang sering terjadi, apalagi disertai pencegahan dan deteksi dini. Aku suka karena teksnya nggak cuma teoritis, tapi juga ada langkah praktis kayak SADARI. Jadi bener-bener terasa menyeluruh dan gampang dipahami buat pembaca, khususnya remaja yang lagi butuh pengetahuan soal ini.', NULL, '2025-08-22 09:57:37', '2025-08-22 09:57:37');
INSERT INTO `komentars` VALUES (48, 11, 48, 'Video ini merupakan media yang baik untuk menyampaikan pesan tentang kesehatan mental remaja. Namun, agar lebih efektif, penting memastikan isi disampaikan dengan bahasa sederhana, visual menarik, durasi tidak terlalu panjang, dan ada contoh konkret yang dekat dengan kehidupan remaja.', NULL, '2025-08-22 10:00:33', '2025-08-22 10:00:33');
INSERT INTO `komentars` VALUES (49, 9, 22, 'SERUU BGT, dari video ini, kita dapat menyimpulkan untuk menjauhi narkoba, karena dapat merusak tubuh kita, dan juga tidak sehat, dapat membuat candu, selain itu, animasinya bagus sekali, dan seluruh penjelasan dapat di pahami dengan cepat', NULL, '2025-08-22 10:01:19', '2025-08-22 10:01:19');
INSERT INTO `komentars` VALUES (50, 8, 22, 'Menurut saya setelah membaca teks ini, isi tulisannya sangat lengkap dan bermanfaat. Pembahasannya runtut, mulai dari pengertian narkoba, jenis-jenisnya, dampak fisik, psikologis, maupun sosial, sampai langkah pencegahan dan rehabilitasi. Bagian tentang peran siswa juga menarik, karena mengajak langsung generasi muda untuk ikut andil dalam mencegah penyalahgunaan narkoba. Secara keseluruhan, teks ini membuka wawasan saya bahwa bahaya narkoba tidak hanya soal kesehatan, tapi juga merusak masa depan dan lingkungan sosial.', NULL, '2025-08-22 10:02:28', '2025-08-22 10:02:28');
INSERT INTO `komentars` VALUES (51, 5, 48, 'Materi ini sudah sangat kuat secara teori dan praktis, namun agar lebih efektif bagi remaja, perlu dibuat lebih sederhana, interaktif, dan dekat dengan keseharian mereka. Dengan tambahan ilustrasi dan contoh nyata, materi ini bisa menjadi panduan yang menarik sekaligus bermanfaat.', NULL, '2025-08-22 10:02:38', '2025-08-22 10:02:38');
INSERT INTO `komentars` VALUES (52, 7, 22, 'wih, videonya bener benerr bikin akuu sadar kalau kita harus selalu menjaga kesehatan, dan pola hidup sehat, misalnya makan makanan yg bergizi dan seimbang, selain itu videonya mudah di pahami, terimakasi kak', NULL, '2025-08-22 10:03:51', '2025-08-22 10:03:51');
INSERT INTO `komentars` VALUES (53, 5, 22, 'Menurut saya setelah membaca keseluruhan teks ini, isinya sangat lengkap dan jelas menjelaskan tentang gizi remaja. Dari mulai konsep gizi seimbang, isi piringku, kebutuhan gizi makro dan mikro, hingga bahaya konsumsi gula, garam, dan lemak berlebih semuanya dibahas runtut dan mudah dipahami. Penjelasan yang disertai dengan contoh sumber makanan juga membantu banget untuk membayangkan praktiknya dalam kehidupan sehari-hari. Intinya teks ini bikin saya lebih sadar betapa pentingnya menjaga pola makan dan gaya hidup sehat sejak remaja.', NULL, '2025-08-22 10:04:45', '2025-08-22 10:04:45');
INSERT INTO `komentars` VALUES (54, 11, 65, 'Video ini sangat jelas dan mudah untuk dipahami', NULL, '2025-08-22 10:29:23', '2025-08-22 10:29:23');
INSERT INTO `komentars` VALUES (55, 13, 56, 'Menarik, dan mudah di pahami', 'Terima kasih. Semoga bisa diterapkan ilmunya😊', '2025-08-22 12:16:41', '2025-08-22 23:22:45');
INSERT INTO `komentars` VALUES (56, 12, 56, 'Walaupun panjang ya semoga bisa di mengerti', NULL, '2025-08-22 12:19:32', '2025-08-22 12:19:32');
INSERT INTO `komentars` VALUES (57, 8, 24, 'Dapat dimengerti dengan mudah dan Penyalahgunaan narkoba merupakan masalah serius yang mengancam \r\nMasa depan generasi muda. Jadi kita harus saling mencegah dan mengingatkan bahaya penyalah gunaaan narkoba ini terutama para pelajar', NULL, '2025-08-22 23:26:36', '2025-08-22 23:26:36');
INSERT INTO `komentars` VALUES (58, 13, 54, 'terimakasih ka🙏🔥', NULL, '2025-08-22 23:29:13', '2025-08-22 23:29:13');
INSERT INTO `komentars` VALUES (59, 12, 54, 'woww menurut aku ini menarik bgt terimakasih🤩🤩', NULL, '2025-08-22 23:30:08', '2025-08-22 23:30:08');
INSERT INTO `komentars` VALUES (60, 5, 24, 'Teks ini memberikan pemahaman bahwa gizi tidak hanya berkaitan dengan rasa kenyang, tetapi juga kualitas makanan yang dikonsumsi. ini sangat penting untuk Remaja, agar menjaga pola makan nya  dan memakan makanan bergizi', NULL, '2025-08-22 23:33:22', '2025-08-22 23:33:22');
INSERT INTO `komentars` VALUES (61, 15, 48, 'Materi sangat lengkap dan terstruktur – Penyusunan dari pengertian, tujuan, ciri-ciri payudara sehat, hingga faktor yang mempengaruhi benar-benar rapi dan memudahkan pembaca memahami langkah demi langkah.', NULL, '2025-08-22 23:45:51', '2025-08-22 23:45:51');
INSERT INTO `komentars` VALUES (62, 13, 48, 'materinya mudah di pahami karna bersifat video, dan videonya animasii \r\nis the best🤩❤️👍🏻', NULL, '2025-08-22 23:48:19', '2025-08-22 23:48:19');
INSERT INTO `komentars` VALUES (63, 8, 48, 'Materi sangat lengkap dan mendalam – Penjelasan mencakup definisi, jenis-jenis narkoba (narkotika, psikotropika, dan bahan adiktif), dampak, pencegahan, hingga penanganan dan rehabilitasi. Ini membuat pembaca mendapatkan gambaran utuh.\r\n\r\nBahasa jelas dan sistematis – Penyampaian menggunakan bahasa yang mudah dipahami, meskipun topiknya cukup berat. Hal ini membantu pelajar maupun masyarakat umum memahami bahaya narkoba dengan baik.', NULL, '2025-08-22 23:50:28', '2025-08-22 23:50:28');
INSERT INTO `komentars` VALUES (64, 11, 48, '❤️❤️❤️👍🏻👍🏻', NULL, '2025-08-22 23:52:08', '2025-08-22 23:52:08');
INSERT INTO `komentars` VALUES (65, 10, 48, 'Secara keseluruhan, materi ini sangat baik, bermanfaat, dan layak digunakan sebagai bahan ajar atau penyuluhan remaja karena tidak hanya memberi informasi, tetapi juga mendorong kesadaran diri dan perilaku sehat.', NULL, '2025-08-22 23:53:39', '2025-08-22 23:53:39');
INSERT INTO `komentars` VALUES (66, 9, 48, 'video ini bermanfaat sekali karena mengajarkan tentang pola hidup sehat, mantapp 🤩❤️👍🏻', NULL, '2025-08-22 23:54:34', '2025-08-22 23:54:34');
INSERT INTO `komentars` VALUES (67, 13, 69, 'materinya keren dan menarik', NULL, '2025-08-23 00:01:20', '2025-08-23 00:01:20');
INSERT INTO `komentars` VALUES (68, 12, 69, 'materinya jelas,isinya juga mudah di pahami', NULL, '2025-08-23 00:04:41', '2025-08-23 00:04:41');
INSERT INTO `komentars` VALUES (69, 11, 69, 'materi berbentuk vidio ini sangat menarik,dan lebih mudah di pahami', NULL, '2025-08-23 00:05:44', '2025-08-23 00:05:44');
INSERT INTO `komentars` VALUES (70, 13, 55, 'bagus bngt', NULL, '2025-08-23 03:06:12', '2025-08-23 03:06:12');
INSERT INTO `komentars` VALUES (71, 11, 55, 'bagus bngt', NULL, '2025-08-23 03:06:42', '2025-08-23 03:06:42');
INSERT INTO `komentars` VALUES (72, 9, 55, 'bagus bngt', NULL, '2025-08-23 03:07:13', '2025-08-23 03:07:13');
INSERT INTO `komentars` VALUES (73, 7, 55, 'bagus bngt', NULL, '2025-08-23 03:07:41', '2025-08-23 03:07:41');
INSERT INTO `komentars` VALUES (74, 7, 46, 'wihh gampang banget dipahami materinya, ga bosen juga liat animasinya, selalu kerenn', NULL, '2025-08-23 04:33:34', '2025-08-23 04:33:34');
INSERT INTO `komentars` VALUES (75, 11, 46, 'wah terimakasih materi nya, sekarang jadi lebih tau mengenai kesehatan reproduksi 🤩', NULL, '2025-08-23 04:36:04', '2025-08-23 04:36:04');
INSERT INTO `komentars` VALUES (76, 15, 63, 'Wah materinya lengkap bgt, gampang dipahami juga. Jadi lebih sadar pentingnya ngerawat kesehatan payudara dari hal kecil kaya kebersihan, pola makan sampe periksa rutin. Baru tau juga ternyata faktor makanan sama gaya hidup ngaruh bgt. Keren sih', NULL, '2025-08-24 07:03:12', '2025-08-24 07:03:12');
INSERT INTO `komentars` VALUES (77, 12, 63, 'i materi, detail bgt tp gampang dicerna. Jadi makin kebuka mata kalo mental health tuh sepenting itu 🔥🔥', NULL, '2025-08-24 07:09:45', '2025-08-24 07:09:45');
INSERT INTO `komentars` VALUES (78, 8, 63, 'Setelah baca materi ini jadi sadar banget kalau narkoba itu bener-bener bahaya dan harus dijauhi. bikin semangat buat jaga diri sendiri dan teman-teman dari pengaruh narkoba Ternyata dampak narkoba luas banget ya, bukan cuma kesehatan tapi juga masa depan. Jadi lebih hati-hati', NULL, '2025-08-24 07:13:55', '2025-08-24 07:13:55');
INSERT INTO `komentars` VALUES (79, 5, 63, 'Menurut aku materinya bermanfaat banget buat nambah pengetahuan. Jadi bisa lebih ngerti pentingnya gizi seimbang. Cocok juga buat diterapin di kehidupan sehari-hari.', NULL, '2025-08-24 07:17:23', '2025-08-24 07:17:23');
INSERT INTO `komentars` VALUES (80, 15, 59, 'Pokok nyaa in the besttt bangettttttt kaka, jadi aku enak banget bacaaaa + jelas banget 🥰🥰🥰', NULL, '2025-08-25 01:29:20', '2025-08-25 01:29:20');
INSERT INTO `komentars` VALUES (81, 5, 46, 'Materi ini suka banget walaupun berbentuk pdf tetapi ada visual nya yaitu gambar yang bisa memberikan pemahaman lebih dalam, ilmu ini juga bagus untuk diterapkan pada kehidupan sehari-hari dalam menjaga pola hidup sehat', NULL, '2025-08-25 09:00:33', '2025-08-25 09:00:33');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `materi_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `likes_materi_id_foreign`(`materi_id` ASC) USING BTREE,
  INDEX `likes_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `likes_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (10, 12, 21, '2025-08-18 08:11:58', '2025-08-18 08:11:58');
INSERT INTO `likes` VALUES (11, 7, 21, '2025-08-18 08:12:08', '2025-08-18 08:12:08');
INSERT INTO `likes` VALUES (12, 5, 21, '2025-08-18 08:12:18', '2025-08-18 08:12:18');
INSERT INTO `likes` VALUES (13, 11, 21, '2025-08-18 08:25:04', '2025-08-18 08:25:04');
INSERT INTO `likes` VALUES (14, 10, 21, '2025-08-18 08:28:31', '2025-08-18 08:28:31');
INSERT INTO `likes` VALUES (15, 15, 43, '2025-08-19 23:50:00', '2025-08-19 23:50:00');
INSERT INTO `likes` VALUES (17, 13, 43, '2025-08-19 23:50:55', '2025-08-19 23:50:55');
INSERT INTO `likes` VALUES (18, 5, 43, '2025-08-19 23:57:52', '2025-08-19 23:57:52');
INSERT INTO `likes` VALUES (19, 13, 24, '2025-08-20 10:14:44', '2025-08-20 10:14:44');
INSERT INTO `likes` VALUES (23, 11, 24, '2025-08-20 10:25:10', '2025-08-20 10:25:10');
INSERT INTO `likes` VALUES (24, 10, 24, '2025-08-20 10:27:02', '2025-08-20 10:27:02');
INSERT INTO `likes` VALUES (25, 9, 24, '2025-08-20 10:39:09', '2025-08-20 10:39:09');
INSERT INTO `likes` VALUES (28, 7, 24, '2025-08-20 10:40:23', '2025-08-20 10:40:23');
INSERT INTO `likes` VALUES (29, 15, 24, '2025-08-20 10:43:12', '2025-08-20 10:43:12');
INSERT INTO `likes` VALUES (30, 12, 24, '2025-08-20 10:43:28', '2025-08-20 10:43:28');
INSERT INTO `likes` VALUES (31, 7, 43, '2025-08-21 00:05:40', '2025-08-21 00:05:40');
INSERT INTO `likes` VALUES (32, 8, 43, '2025-08-21 00:06:14', '2025-08-21 00:06:14');
INSERT INTO `likes` VALUES (33, 11, 43, '2025-08-21 00:16:20', '2025-08-21 00:16:20');
INSERT INTO `likes` VALUES (34, 15, 46, '2025-08-22 06:07:37', '2025-08-22 06:07:37');
INSERT INTO `likes` VALUES (36, 13, 46, '2025-08-22 06:07:54', '2025-08-22 06:07:54');
INSERT INTO `likes` VALUES (37, 9, 46, '2025-08-22 06:10:49', '2025-08-22 06:10:49');
INSERT INTO `likes` VALUES (38, 13, 33, '2025-08-22 07:09:04', '2025-08-22 07:09:04');
INSERT INTO `likes` VALUES (39, 11, 33, '2025-08-22 07:09:12', '2025-08-22 07:09:12');
INSERT INTO `likes` VALUES (40, 9, 33, '2025-08-22 07:09:20', '2025-08-22 07:09:20');
INSERT INTO `likes` VALUES (42, 5, 33, '2025-08-22 07:18:20', '2025-08-22 07:18:20');
INSERT INTO `likes` VALUES (43, 7, 33, '2025-08-22 07:18:33', '2025-08-22 07:18:33');
INSERT INTO `likes` VALUES (44, 15, 22, '2025-08-22 09:45:23', '2025-08-22 09:45:23');
INSERT INTO `likes` VALUES (48, 5, 22, '2025-08-22 09:54:17', '2025-08-22 09:54:17');
INSERT INTO `likes` VALUES (49, 7, 22, '2025-08-22 09:54:21', '2025-08-22 09:54:21');
INSERT INTO `likes` VALUES (50, 8, 22, '2025-08-22 09:54:23', '2025-08-22 09:54:23');
INSERT INTO `likes` VALUES (51, 9, 22, '2025-08-22 09:54:26', '2025-08-22 09:54:26');
INSERT INTO `likes` VALUES (52, 10, 22, '2025-08-22 09:54:30', '2025-08-22 09:54:30');
INSERT INTO `likes` VALUES (53, 11, 22, '2025-08-22 09:54:33', '2025-08-22 09:54:33');
INSERT INTO `likes` VALUES (54, 12, 22, '2025-08-22 09:54:36', '2025-08-22 09:54:36');
INSERT INTO `likes` VALUES (55, 13, 22, '2025-08-22 09:54:44', '2025-08-22 09:54:44');
INSERT INTO `likes` VALUES (56, 12, 48, '2025-08-22 09:56:56', '2025-08-22 09:56:56');
INSERT INTO `likes` VALUES (60, 15, 65, '2025-08-22 10:01:01', '2025-08-22 10:01:01');
INSERT INTO `likes` VALUES (61, 5, 48, '2025-08-22 10:01:26', '2025-08-22 10:01:26');
INSERT INTO `likes` VALUES (62, 15, 85, '2025-08-22 10:02:54', '2025-08-22 10:02:54');
INSERT INTO `likes` VALUES (63, 7, 48, '2025-08-22 10:03:06', '2025-08-22 10:03:06');
INSERT INTO `likes` VALUES (64, 13, 85, '2025-08-22 10:03:31', '2025-08-22 10:03:31');
INSERT INTO `likes` VALUES (65, 12, 85, '2025-08-22 10:03:50', '2025-08-22 10:03:50');
INSERT INTO `likes` VALUES (69, 8, 65, '2025-08-22 10:40:49', '2025-08-22 10:40:49');
INSERT INTO `likes` VALUES (72, 13, 56, '2025-08-22 12:15:56', '2025-08-22 12:15:56');
INSERT INTO `likes` VALUES (73, 12, 56, '2025-08-22 12:17:38', '2025-08-22 12:17:38');
INSERT INTO `likes` VALUES (74, 11, 56, '2025-08-22 12:17:45', '2025-08-22 12:17:45');
INSERT INTO `likes` VALUES (75, 10, 56, '2025-08-22 12:17:57', '2025-08-22 12:17:57');
INSERT INTO `likes` VALUES (76, 9, 56, '2025-08-22 12:18:06', '2025-08-22 12:18:06');
INSERT INTO `likes` VALUES (77, 8, 56, '2025-08-22 12:18:11', '2025-08-22 12:18:11');
INSERT INTO `likes` VALUES (78, 7, 56, '2025-08-22 12:18:17', '2025-08-22 12:18:17');
INSERT INTO `likes` VALUES (79, 5, 56, '2025-08-22 12:18:21', '2025-08-22 12:18:21');
INSERT INTO `likes` VALUES (80, 15, 56, '2025-08-22 12:18:23', '2025-08-22 12:18:23');
INSERT INTO `likes` VALUES (81, 12, 54, '2025-08-22 23:30:22', '2025-08-22 23:30:22');
INSERT INTO `likes` VALUES (82, 15, 48, '2025-08-22 23:45:44', '2025-08-22 23:45:44');
INSERT INTO `likes` VALUES (83, 13, 48, '2025-08-22 23:46:04', '2025-08-22 23:46:04');
INSERT INTO `likes` VALUES (84, 8, 48, '2025-08-22 23:48:42', '2025-08-22 23:48:42');
INSERT INTO `likes` VALUES (85, 15, 69, '2025-08-22 23:50:46', '2025-08-22 23:50:46');
INSERT INTO `likes` VALUES (86, 11, 48, '2025-08-22 23:51:12', '2025-08-22 23:51:12');
INSERT INTO `likes` VALUES (88, 10, 48, '2025-08-22 23:53:43', '2025-08-22 23:53:43');
INSERT INTO `likes` VALUES (89, 9, 48, '2025-08-22 23:54:38', '2025-08-22 23:54:38');
INSERT INTO `likes` VALUES (91, 13, 69, '2025-08-23 00:00:32', '2025-08-23 00:00:32');
INSERT INTO `likes` VALUES (92, 12, 69, '2025-08-23 00:02:38', '2025-08-23 00:02:38');
INSERT INTO `likes` VALUES (93, 11, 69, '2025-08-23 00:05:47', '2025-08-23 00:05:47');
INSERT INTO `likes` VALUES (94, 15, 55, '2025-08-23 03:05:15', '2025-08-23 03:05:15');
INSERT INTO `likes` VALUES (99, 13, 55, '2025-08-23 03:06:17', '2025-08-23 03:06:17');
INSERT INTO `likes` VALUES (100, 11, 55, '2025-08-23 03:06:46', '2025-08-23 03:06:46');
INSERT INTO `likes` VALUES (101, 9, 55, '2025-08-23 03:07:03', '2025-08-23 03:07:03');
INSERT INTO `likes` VALUES (102, 7, 55, '2025-08-23 03:07:32', '2025-08-23 03:07:32');
INSERT INTO `likes` VALUES (103, 7, 46, '2025-08-23 04:30:06', '2025-08-23 04:30:06');
INSERT INTO `likes` VALUES (104, 11, 46, '2025-08-23 04:34:56', '2025-08-23 04:34:56');
INSERT INTO `likes` VALUES (105, 15, 63, '2025-08-24 06:57:48', '2025-08-24 06:57:48');
INSERT INTO `likes` VALUES (106, 13, 63, '2025-08-24 07:03:32', '2025-08-24 07:03:32');
INSERT INTO `likes` VALUES (107, 8, 63, '2025-08-24 07:12:33', '2025-08-24 07:12:33');
INSERT INTO `likes` VALUES (108, 5, 63, '2025-08-24 07:14:02', '2025-08-24 07:14:02');
INSERT INTO `likes` VALUES (110, 5, 86, '2025-08-24 21:13:22', '2025-08-24 21:13:22');
INSERT INTO `likes` VALUES (111, 5, 46, '2025-08-25 08:59:25', '2025-08-25 08:59:25');

-- ----------------------------
-- Table structure for materis
-- ----------------------------
DROP TABLE IF EXISTS `materis`;
CREATE TABLE `materis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kategori` enum('pola_hidup_sehat','reproduksi','kesehatan_mental','gizi','narkoba') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'Sumber materi',
  `jenis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pdf, doc, link, video',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('aktif','nonaktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `materis_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of materis
-- ----------------------------
INSERT INTO `materis` VALUES (5, 'Gizi Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/6gCGrh0zIxEjoL0ouUDUm76ZXtkO60pB2nYIxjYN.pdf', NULL, '2025-08-05 16:48:19', '2025-08-05 16:48:19', 'aktif');
INSERT INTO `materis` VALUES (7, 'Edukasi Gizi Seimbang', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/e15miiQKxnqwOVOhnvf0Utphc3vyWOOKp3KKpsZc.mp4', NULL, '2025-08-05 16:50:17', '2025-08-05 16:50:17', 'aktif');
INSERT INTO `materis` VALUES (8, 'Waspada Narkoba', NULL, 'pola_hidup_sehat', NULL, NULL, 'pdf', 'materi_files/k7lnvjhH5r9nUgfsfT1LK6SbWbfYnxgoehQqhPp6.pdf', NULL, '2025-08-05 16:51:38', '2025-08-05 16:51:38', 'aktif');
INSERT INTO `materis` VALUES (9, 'Pencegahan Penyalahgunaan NAPZA Remaja', NULL, 'pola_hidup_sehat', NULL, NULL, 'video', 'materi_files/1iZi3rMHfEd9cscmxdSSg1wcALlZlWA6zOHtEjLv.mp4', NULL, '2025-08-05 16:53:27', '2025-08-05 16:53:27', 'aktif');
INSERT INTO `materis` VALUES (10, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'pdf', 'materi_files/t6Q4UYMPGoNRRKdjlsSeiHSF0j9oW4zMjZhkOLC2.pdf', NULL, '2025-08-05 16:54:34', '2025-08-05 16:54:34', 'aktif');
INSERT INTO `materis` VALUES (11, 'Kesehatan Reproduksi Remaja', NULL, 'reproduksi', NULL, NULL, 'video', 'materi_files/UKiSoYORnokknTtEcOVKIl1PQQUFR2zRKJF6dCQ3.mp4', NULL, '2025-08-05 16:55:06', '2025-08-05 16:55:06', 'aktif');
INSERT INTO `materis` VALUES (12, 'Kesehatan Mental dan Manajemen Stress Remaja', NULL, 'kesehatan_mental', NULL, NULL, 'pdf', 'materi_files/mdltEb7NksMZfbeD2L3ckit7brcBTdWOU82SYbT9.pdf', NULL, '2025-08-05 16:55:49', '2025-08-05 16:55:49', 'aktif');
INSERT INTO `materis` VALUES (13, 'Sehatkah Jiwaku?', NULL, 'kesehatan_mental', NULL, NULL, 'video', 'materi_files/MxCD3f373J3gJRfYSKDTr1MAGs46UfetlP6vx1wQ.mp4', NULL, '2025-08-05 16:56:29', '2025-08-05 16:56:29', 'aktif');
INSERT INTO `materis` VALUES (15, 'Perawatan Payudara', 'perawatan-payudara', 'reproduksi', NULL, NULL, 'pdf', 'materi_files/g36nD9ysTRxp95qwEhNfPwtpnlKpkwvgT58Mq8Vk.pdf', NULL, '2025-08-19 12:53:49', '2025-08-19 12:53:49', 'aktif');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_06_16_073753_create_materis_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_06_16_074054_create_komentars_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_06_16_074143_create_zoom_rooms_table', 1);
INSERT INTO `migrations` VALUES (7, '2025_06_16_074154_create_likes_table', 1);
INSERT INTO `migrations` VALUES (8, '2025_06_16_075800_create_informasi_kesehatans_table', 1);
INSERT INTO `migrations` VALUES (9, '2025_06_24_075559_alter_link_sumber_on_informasi_kesehatan_table', 1);
INSERT INTO `migrations` VALUES (10, '2025_07_14_045952_add_meeting_id_and_passcode_to_zoom_rooms', 1);
INSERT INTO `migrations` VALUES (11, '2025_08_12_054703_add_slug_to_materis_table', 1);
INSERT INTO `migrations` VALUES (12, '2025_08_12_065443_create_download_logs_table', 1);
INSERT INTO `migrations` VALUES (13, '2025_08_12_114707_update_kategori_enum_on_materis_table', 2);
INSERT INTO `migrations` VALUES (14, '2025_08_12_191651_create_user_progress_table', 3);
INSERT INTO `migrations` VALUES (15, '2025_08_14_010446_add_status_to_materis_table', 4);
INSERT INTO `migrations` VALUES (16, '2025_08_14_050444_create_consultation_categories_table', 4);
INSERT INTO `migrations` VALUES (17, '2025_08_14_050512_create_consultations_table', 4);
INSERT INTO `migrations` VALUES (18, '2025_08_14_050519_create_consultation_responses_table', 4);
INSERT INTO `migrations` VALUES (19, '2025_08_14_050524_create_consultation_attachments_table', 4);
INSERT INTO `migrations` VALUES (20, '2025_08_14_055611_add_role_konsultan_to_users_table', 5);
INSERT INTO `migrations` VALUES (21, '2025_08_15_081523_add_sumber_to_materis_table', 6);
INSERT INTO `migrations` VALUES (22, '2025_08_17_071819_update_status_on_consultations_table', 7);
INSERT INTO `migrations` VALUES (23, '2025_08_17_091514_update_consultation_responses_for_chat', 8);
INSERT INTO `migrations` VALUES (24, '2025_08_18_141946_create_activity_log_table', 9);
INSERT INTO `migrations` VALUES (25, '2025_08_18_141947_add_event_column_to_activity_log_table', 9);
INSERT INTO `migrations` VALUES (26, '2025_08_18_141948_add_batch_uuid_column_to_activity_log_table', 9);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
INSERT INTO `password_reset_tokens` VALUES ('depiacomputer@gmail.com', '$2y$12$sXnjEgYIFvSJCHdri4uL6ejGzA46Osrs3AIZqV0Lxb8pBLKuR70gy', '2025-07-09 00:53:53');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('47ToAKu5DGPegW29okRVNNpJQGUoHQvvBit55LKv', NULL, '43.156.156.96', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkQxbG8zRmI3dkl0UHhaMWwwdmZEd0Y0VUplQXBVU3lVczBRV29aWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756106749);
INSERT INTO `sessions` VALUES ('5GY5ZPNc8mooVKHfZAk8v8FGxb7WDdjvbXKY71vb', 82, '125.161.29.178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSml3a0N1WVFtWmxQOVA3MHltNmd4NXBmV2hlbnN4cng2RGFQZ1djQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS9hZG1pbi9tYXRlcmkvMTUvc3RyZWFtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxNjoiY2FwdGNoYV9xdWVzdGlvbiI7czo5OiI5ICsgNCA9ID8iO3M6MTQ6ImNhcHRjaGFfYW5zd2VyIjtpOjEzO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjgyO30=', 1756108758);
INSERT INTO `sessions` VALUES ('5Q7Y76QJKWtyXIkWAuzi4PYpomwwdW0u3i73DQjn', 46, '114.122.77.191', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieHdzU0Z0TnhSWWtzUlYybUdMbGE0dktieDc2UGViZXFuaHdhT3FUTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cHM6Ly9rZXNlaGF0YW5yZW1hamEuY29tL3VzZXIvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS91c2VyL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTY6ImNhcHRjaGFfcXVlc3Rpb24iO3M6OToiNSArIDMgPSA/IjtzOjE0OiJjYXB0Y2hhX2Fuc3dlciI7aTo4O3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ2O30=', 1756112453);
INSERT INTO `sessions` VALUES ('65PTlEqATBq5EijcYXxmSGtxBAyuvbe1fG8zBnTb', NULL, '13.82.195.38', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGgyY21iU3htYkpmek1SSjVld0RPUWRRZ0lEMkRDbGRiQ25JMEcyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3Lmtlc2VoYXRhbnJlbWFqYS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1756106006);
INSERT INTO `sessions` VALUES ('8O01dDRwL25OuVnpXd7g6p7qUYp99yNs7JmCwqVk', NULL, '66.249.79.67', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.7204.183 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWZXSUxpT2dsU2VCdnZHdEFRTER0T3pNc1VJMFRrRlhpeWduTU5HTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756115906);
INSERT INTO `sessions` VALUES ('DYwEnBru4kLyMPCaOtZrww1dZClQ1hVTovLeTqIr', 3, '114.122.70.107', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWHZ2VE91aTBIN3NyOGZhazRVbXNWMGtmb0pUOU1LSUJieHphbWFKOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTY6ImNhcHRjaGFfcXVlc3Rpb24iO3M6OToiOCArIDUgPSA/IjtzOjE0OiJjYXB0Y2hhX2Fuc3dlciI7aToxMztzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1756115293);
INSERT INTO `sessions` VALUES ('kuxuGUllSGzsmz5HnUGcmBuTp8jYSi6j1xdvRCBx', NULL, '118.195.153.213', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkpDOWl2V0hrcW9GNGVHNWJjT0lxNEFiRlRiRzhVV3NBMFBzMnNZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756111834);
INSERT INTO `sessions` VALUES ('TQlBQI0JL85Wkiq0mPzCTUwmJwftIzpbw7eKnrn8', NULL, '170.106.159.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0dmY05GdVdSeVpJSWdwbmtoVGw5N2V3QkN1M0tYanhCSnAxYkdQMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756112988);
INSERT INTO `sessions` VALUES ('uu3yceUYZcbhSR6b9c2zaRscx0o8X2CkiJyGYJWI', NULL, '125.161.29.178', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkZDWU5oVm82dXVLVldMOG5GMkJRYkFpTzNhSEk4TWcwRHZTYlFISiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbSI7fX0=', 1756115570);
INSERT INTO `sessions` VALUES ('VsZrLK12a3jrLEeKbR8MpOvK1yZhM6T6lqedo2rZ', 63, '103.156.221.223', 'Mozilla/5.0 (Linux; Android 10; vivo 1804) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/123.0.6312.118 Mobile Safari/537.36 VivoBrowser/14.6.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaU9TNXdiMVM3dWVreUJsd2lCZktiTmlIZEpvcG5ZMTlrQkRHQ0FXMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8va2VzZWhhdGFucmVtYWphLmNvbS91c2VyL2NvbnN1bHRhdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE2OiJjYXB0Y2hhX3F1ZXN0aW9uIjtzOjk6IjEgKyAzID0gPyI7czoxNDoiY2FwdGNoYV9hbnN3ZXIiO2k6NDtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2Mzt9', 1756105978);

-- ----------------------------
-- Table structure for user_progress
-- ----------------------------
DROP TABLE IF EXISTS `user_progress`;
CREATE TABLE `user_progress`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` bigint UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `progress_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_progress_user_id_content_type_content_id_unique`(`user_id` ASC, `content_type` ASC, `content_id` ASC) USING BTREE,
  CONSTRAINT `user_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_progress
-- ----------------------------
INSERT INTO `user_progress` VALUES (20, 21, 'informasi_kesehatan', 4, 1, NULL, '2025-08-17 17:29:18', '2025-08-17 17:29:18');
INSERT INTO `user_progress` VALUES (21, 21, 'materi_pdf', 12, 1, NULL, '2025-08-17 17:29:43', '2025-08-17 17:29:43');
INSERT INTO `user_progress` VALUES (22, 21, 'materi_pdf', 10, 1, NULL, '2025-08-17 17:56:09', '2025-08-17 17:56:09');
INSERT INTO `user_progress` VALUES (23, 21, 'materi_pdf', 8, 1, NULL, '2025-08-17 17:56:34', '2025-08-17 17:56:34');
INSERT INTO `user_progress` VALUES (24, 21, 'materi_pdf', 5, 1, NULL, '2025-08-17 17:56:55', '2025-08-17 17:56:55');
INSERT INTO `user_progress` VALUES (25, 21, 'materi_video', 13, 1, NULL, '2025-08-17 17:57:23', '2025-08-17 17:57:23');
INSERT INTO `user_progress` VALUES (26, 21, 'materi_video', 11, 1, NULL, '2025-08-17 18:01:04', '2025-08-17 18:01:04');
INSERT INTO `user_progress` VALUES (27, 21, 'materi_video', 9, 1, NULL, '2025-08-17 18:02:21', '2025-08-17 18:02:21');
INSERT INTO `user_progress` VALUES (28, 21, 'materi_video', 7, 1, NULL, '2025-08-17 18:03:50', '2025-08-17 18:03:50');
INSERT INTO `user_progress` VALUES (29, 5, 'informasi_kesehatan', 4, 1, NULL, '2025-08-19 02:03:58', '2025-08-19 02:03:58');
INSERT INTO `user_progress` VALUES (30, 78, 'materi_video', 13, 1, NULL, '2025-08-19 03:14:14', '2025-08-19 03:14:14');
INSERT INTO `user_progress` VALUES (32, 5, 'materi_pdf', 15, 1, NULL, '2025-08-19 13:04:54', '2025-08-19 13:04:54');
INSERT INTO `user_progress` VALUES (33, 43, 'materi_pdf', 15, 1, NULL, '2025-08-19 23:46:06', '2025-08-19 23:46:06');
INSERT INTO `user_progress` VALUES (34, 43, 'materi_video', 13, 1, NULL, '2025-08-19 23:51:00', '2025-08-19 23:51:00');
INSERT INTO `user_progress` VALUES (35, 43, 'materi_pdf', 5, 1, NULL, '2025-08-20 00:01:56', '2025-08-20 00:01:56');
INSERT INTO `user_progress` VALUES (36, 57, 'informasi_kesehatan', 4, 1, NULL, '2025-08-20 06:49:34', '2025-08-20 06:49:34');
INSERT INTO `user_progress` VALUES (37, 24, 'materi_video', 13, 1, NULL, '2025-08-20 10:13:39', '2025-08-20 10:13:39');
INSERT INTO `user_progress` VALUES (38, 24, 'materi_video', 11, 1, NULL, '2025-08-20 10:18:13', '2025-08-20 10:18:13');
INSERT INTO `user_progress` VALUES (39, 24, 'materi_video', 9, 1, NULL, '2025-08-20 10:35:32', '2025-08-20 10:35:32');
INSERT INTO `user_progress` VALUES (40, 24, 'materi_video', 7, 1, NULL, '2025-08-20 10:40:04', '2025-08-20 10:40:04');
INSERT INTO `user_progress` VALUES (41, 24, 'materi_pdf', 15, 1, NULL, '2025-08-20 10:43:08', '2025-08-20 10:43:08');
INSERT INTO `user_progress` VALUES (42, 24, 'materi_pdf', 12, 1, NULL, '2025-08-20 10:43:18', '2025-08-20 10:43:18');
INSERT INTO `user_progress` VALUES (43, 24, 'materi_pdf', 10, 1, NULL, '2025-08-20 10:43:40', '2025-08-20 10:43:40');
INSERT INTO `user_progress` VALUES (44, 24, 'materi_pdf', 8, 1, NULL, '2025-08-20 10:44:10', '2025-08-20 10:44:10');
INSERT INTO `user_progress` VALUES (45, 24, 'materi_pdf', 5, 1, NULL, '2025-08-20 10:44:20', '2025-08-20 10:44:20');
INSERT INTO `user_progress` VALUES (46, 24, 'informasi_kesehatan', 4, 1, NULL, '2025-08-20 10:44:37', '2025-08-20 10:44:37');
INSERT INTO `user_progress` VALUES (47, 43, 'materi_video', 7, 1, NULL, '2025-08-21 00:05:31', '2025-08-21 00:05:31');
INSERT INTO `user_progress` VALUES (48, 43, 'materi_video', 11, 1, NULL, '2025-08-21 00:16:30', '2025-08-21 00:16:30');
INSERT INTO `user_progress` VALUES (49, 46, 'materi_video', 7, 1, NULL, '2025-08-22 06:09:32', '2025-08-22 06:09:32');
INSERT INTO `user_progress` VALUES (50, 75, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 06:20:51', '2025-08-22 06:20:51');
INSERT INTO `user_progress` VALUES (51, 33, 'materi_video', 13, 1, NULL, '2025-08-22 07:09:47', '2025-08-22 07:09:47');
INSERT INTO `user_progress` VALUES (52, 33, 'materi_video', 7, 1, NULL, '2025-08-22 07:15:03', '2025-08-22 07:15:03');
INSERT INTO `user_progress` VALUES (53, 22, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 09:44:24', '2025-08-22 09:44:24');
INSERT INTO `user_progress` VALUES (54, 22, 'materi_video', 13, 1, NULL, '2025-08-22 09:49:53', '2025-08-22 09:49:53');
INSERT INTO `user_progress` VALUES (55, 22, 'materi_pdf', 12, 1, NULL, '2025-08-22 09:52:18', '2025-08-22 09:52:18');
INSERT INTO `user_progress` VALUES (56, 48, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 09:52:21', '2025-08-22 09:52:21');
INSERT INTO `user_progress` VALUES (57, 48, 'materi_pdf', 12, 1, NULL, '2025-08-22 09:54:35', '2025-08-22 09:54:35');
INSERT INTO `user_progress` VALUES (58, 22, 'materi_video', 11, 1, NULL, '2025-08-22 09:55:02', '2025-08-22 09:55:02');
INSERT INTO `user_progress` VALUES (59, 22, 'materi_video', 9, 1, NULL, '2025-08-22 09:59:44', '2025-08-22 09:59:44');
INSERT INTO `user_progress` VALUES (60, 65, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 10:00:18', '2025-08-22 10:00:18');
INSERT INTO `user_progress` VALUES (61, 48, 'materi_pdf', 5, 1, NULL, '2025-08-22 10:01:04', '2025-08-22 10:01:04');
INSERT INTO `user_progress` VALUES (62, 85, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 10:01:58', '2025-08-22 10:01:58');
INSERT INTO `user_progress` VALUES (63, 22, 'materi_video', 7, 1, NULL, '2025-08-22 10:02:50', '2025-08-22 10:02:50');
INSERT INTO `user_progress` VALUES (64, 48, 'materi_video', 7, 1, NULL, '2025-08-22 10:03:01', '2025-08-22 10:03:01');
INSERT INTO `user_progress` VALUES (65, 85, 'materi_video', 13, 1, NULL, '2025-08-22 10:03:20', '2025-08-22 10:03:20');
INSERT INTO `user_progress` VALUES (66, 65, 'materi_video', 13, 1, NULL, '2025-08-22 10:23:36', '2025-08-22 10:23:36');
INSERT INTO `user_progress` VALUES (67, 65, 'materi_pdf', 15, 1, NULL, '2025-08-22 10:24:13', '2025-08-22 10:24:13');
INSERT INTO `user_progress` VALUES (68, 65, 'materi_pdf', 12, 1, NULL, '2025-08-22 10:25:31', '2025-08-22 10:25:31');
INSERT INTO `user_progress` VALUES (69, 65, 'materi_video', 11, 1, NULL, '2025-08-22 10:25:55', '2025-08-22 10:25:55');
INSERT INTO `user_progress` VALUES (70, 65, 'materi_pdf', 10, 1, NULL, '2025-08-22 10:30:05', '2025-08-22 10:30:05');
INSERT INTO `user_progress` VALUES (71, 65, 'materi_video', 9, 1, NULL, '2025-08-22 10:31:01', '2025-08-22 10:31:01');
INSERT INTO `user_progress` VALUES (72, 65, 'materi_video', 7, 1, NULL, '2025-08-22 10:39:29', '2025-08-22 10:39:29');
INSERT INTO `user_progress` VALUES (73, 65, 'materi_pdf', 8, 1, NULL, '2025-08-22 10:40:43', '2025-08-22 10:40:43');
INSERT INTO `user_progress` VALUES (74, 65, 'materi_pdf', 5, 1, NULL, '2025-08-22 10:40:55', '2025-08-22 10:40:55');
INSERT INTO `user_progress` VALUES (75, 56, 'informasi_kesehatan', 4, 1, NULL, '2025-08-22 12:14:33', '2025-08-22 12:14:33');
INSERT INTO `user_progress` VALUES (76, 56, 'materi_video', 13, 1, NULL, '2025-08-22 12:16:20', '2025-08-22 12:16:20');
INSERT INTO `user_progress` VALUES (77, 48, 'materi_pdf', 15, 1, NULL, '2025-08-22 23:44:23', '2025-08-22 23:44:23');
INSERT INTO `user_progress` VALUES (78, 48, 'materi_video', 13, 1, NULL, '2025-08-22 23:46:42', '2025-08-22 23:46:42');
INSERT INTO `user_progress` VALUES (79, 48, 'materi_pdf', 8, 1, NULL, '2025-08-22 23:48:59', '2025-08-22 23:48:59');
INSERT INTO `user_progress` VALUES (80, 48, 'materi_video', 11, 1, NULL, '2025-08-22 23:51:35', '2025-08-22 23:51:35');
INSERT INTO `user_progress` VALUES (81, 48, 'materi_pdf', 10, 1, NULL, '2025-08-22 23:52:30', '2025-08-22 23:52:30');
INSERT INTO `user_progress` VALUES (82, 48, 'materi_video', 9, 1, NULL, '2025-08-22 23:54:08', '2025-08-22 23:54:08');
INSERT INTO `user_progress` VALUES (83, 69, 'materi_video', 13, 1, NULL, '2025-08-22 23:57:51', '2025-08-22 23:57:51');
INSERT INTO `user_progress` VALUES (84, 69, 'materi_video', 11, 1, NULL, '2025-08-23 00:05:52', '2025-08-23 00:05:52');
INSERT INTO `user_progress` VALUES (85, 55, 'materi_video', 13, 1, NULL, '2025-08-23 03:05:26', '2025-08-23 03:05:26');
INSERT INTO `user_progress` VALUES (86, 55, 'materi_video', 11, 1, NULL, '2025-08-23 03:06:31', '2025-08-23 03:06:31');
INSERT INTO `user_progress` VALUES (87, 55, 'materi_video', 9, 1, NULL, '2025-08-23 03:07:04', '2025-08-23 03:07:04');
INSERT INTO `user_progress` VALUES (88, 55, 'materi_video', 7, 1, NULL, '2025-08-23 03:07:49', '2025-08-23 03:07:49');
INSERT INTO `user_progress` VALUES (89, 55, 'informasi_kesehatan', 4, 1, NULL, '2025-08-23 03:08:49', '2025-08-23 03:08:49');
INSERT INTO `user_progress` VALUES (90, 46, 'materi_video', 11, 1, NULL, '2025-08-23 04:34:11', '2025-08-23 04:34:11');
INSERT INTO `user_progress` VALUES (91, 22, 'materi_pdf', 5, 1, NULL, '2025-08-23 11:36:04', '2025-08-23 11:36:04');
INSERT INTO `user_progress` VALUES (92, 63, 'informasi_kesehatan', 4, 1, NULL, '2025-08-24 06:57:01', '2025-08-24 06:57:01');
INSERT INTO `user_progress` VALUES (93, 63, 'materi_pdf', 15, 1, NULL, '2025-08-24 06:58:21', '2025-08-24 06:58:21');
INSERT INTO `user_progress` VALUES (94, 63, 'materi_pdf', 5, 1, NULL, '2025-08-24 07:14:12', '2025-08-24 07:14:12');
INSERT INTO `user_progress` VALUES (95, 86, 'informasi_kesehatan', 4, 1, NULL, '2025-08-24 21:08:05', '2025-08-24 21:08:05');
INSERT INTO `user_progress` VALUES (96, 46, 'informasi_kesehatan', 4, 1, NULL, '2025-08-25 08:57:29', '2025-08-25 08:57:29');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user','konsultan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'Devia', 'dviafnopiani@gmail.com', NULL, '$2y$12$uwJqDHWRsqtwP8GyZubAceqS/ueSOJ5KLELQzAE6BZcNwadov7/5O', 'admin', NULL, '2025-06-30 19:42:59', '2025-06-30 19:42:59');
INSERT INTO `users` VALUES (5, 'devia', 'depiacomputer@gmail.com', NULL, '$2y$12$3D43kv3gQngMrloJErHuEeJZWBh/sYoOD.oWgSd4YzLov3mY7hw5q', 'user', NULL, '2025-07-02 14:58:25', '2025-07-02 14:58:25');
INSERT INTO `users` VALUES (20, 'Sutiyono', 'sutiyonodoang@gmail.com', NULL, '$2y$12$3g5exqqoWA9D0YMeUb.I6u24x.7pvkbVniU8qWC9w4cipZF9kguPO', 'admin', NULL, '2025-08-11 20:31:42', '2025-08-11 20:31:42');
INSERT INTO `users` VALUES (21, 'Tiyo', 'tiyo@unibba.ac.id', NULL, '$2y$12$DstenL5MmETo8tsvkiiEP.vcPzLnvXidt6Rwdrs.88OsJDR9BSV1a', 'user', NULL, '2025-08-11 20:35:06', '2025-08-18 18:00:18');
INSERT INTO `users` VALUES (22, 'Lutfhiya Siti Nur Jauza', 'akunfotopart0@gmail.com', NULL, '$2y$12$nS4XyuslJNgFrcB9MLk./uAMnN7qg9HiCK3PiSownfTj7N9hF4ms2', 'user', NULL, '2025-08-12 19:31:33', '2025-08-12 19:31:33');
INSERT INTO `users` VALUES (23, 'Yunike Viona Fronika', 'vionamaibangg@gmail.com', NULL, '$2y$12$xJfFkPtVner/SKoKm9JxT.w9TqN1RLUMyF7xjpbNyEaidaA0UsR2i', 'user', NULL, '2025-08-12 19:46:17', '2025-08-12 19:46:17');
INSERT INTO `users` VALUES (24, 'Alvian Cyril Nugraha', 'alvianugraha2020@gmail.com', NULL, '$2y$12$1El4isk3IBU9oZ9mLXZHiuMmhiRx0cZMFeOz19vvsMMas2dFxBt9i', 'user', NULL, '2025-08-12 19:46:19', '2025-08-12 19:46:19');
INSERT INTO `users` VALUES (25, 'Devira Diva Suherman', 'divadevira49@gmail.com', NULL, '$2y$12$.RrrE44L7Q.T386RP4ISje3Keb9htAGe7pnpj62MG3GZBIffcBmVG', 'user', NULL, '2025-08-12 19:46:32', '2025-08-12 19:46:32');
INSERT INTO `users` VALUES (26, 'Restu Muhammad Ihwan', 'aningyuningsih.362@gmail.com', NULL, '$2y$12$PKKXUE3VFv5/nUDi2YInwu3Ea4aSqHTFbAndxEehXVE2r08myiY5u', 'user', NULL, '2025-08-12 19:46:32', '2025-08-12 19:46:32');
INSERT INTO `users` VALUES (27, 'Tedi Afriansyah', 'tedaf628@gmail.com', NULL, '$2y$12$GvlFYTeLO2oJjoYxuhlb5u2zIXZ45tVTwG9Bwhx.OGMFhRVMW6coe', 'user', NULL, '2025-08-12 19:46:39', '2025-08-12 19:46:39');
INSERT INTO `users` VALUES (28, 'Nabel fauziya', 'nabelfauziya@gmail.com', NULL, '$2y$12$LpzeOEzi0Y0yA2p.I2AOtOassyf7b.ED3s4izQ4YlnCjD2YnWerCS', 'user', NULL, '2025-08-12 19:46:51', '2025-08-12 19:46:51');
INSERT INTO `users` VALUES (29, 'Riani Septiadewi', 'rianisptdw16@gmail.com', NULL, '$2y$12$nNpGqgl9NZlQ0YXH7rTUIOufYp5Ff0GjR4tRipoX9N.DxYUXHabdC', 'user', NULL, '2025-08-12 19:46:53', '2025-08-12 19:46:53');
INSERT INTO `users` VALUES (30, 'Asyraf Muhammad Nur firdaus', 'asyrafmn46@gmail.com', NULL, '$2y$12$B8FOD9aXA/rDm1qlpICOle3V8n.2xVfXdARaq2skYhp6NagyQ7.nu', 'user', NULL, '2025-08-12 19:46:57', '2025-08-12 19:46:57');
INSERT INTO `users` VALUES (31, 'Agni Sriguntari', 'agnisriguntari2@gmail.com', NULL, '$2y$12$z8XsPGxEt3lCU9HOmPVxU.Tr9KHBycEeaNV0OIzsUcfGbdt26y1d2', 'user', NULL, '2025-08-12 19:46:58', '2025-08-12 19:46:58');
INSERT INTO `users` VALUES (32, 'Sahla Adresti Al Ihsani', 'sahlaadrestialihsani@gmail.com', NULL, '$2y$12$FC70jNIcfttp0Y1MsDQmUezfQCnqKzrvHmS1HglSSYm9P1ciICVFW', 'user', NULL, '2025-08-12 19:47:02', '2025-08-12 19:47:02');
INSERT INTO `users` VALUES (33, 'Susi Susilawati', 'susi1law4ti@gmail.com', NULL, '$2y$12$KKgYhQlRIgsSoZDOUytvSeUnmc4aTC7kARE/Qd/SbAG2.FcHBBhTq', 'user', NULL, '2025-08-12 19:47:18', '2025-08-12 19:47:18');
INSERT INTO `users` VALUES (34, 'Cicin Rahmawati', 'cicinrahmawati@gmail.com', NULL, '$2y$12$LjxbxmOaNjGXHVUgxfPBnOsw2aipNaDIO9O0I8J8p6/huk04Ok/7m', 'user', NULL, '2025-08-12 19:47:25', '2025-08-12 19:47:25');
INSERT INTO `users` VALUES (35, 'Refika Adriani', 'fikadoang751@gmail.com', NULL, '$2y$12$xG0F/lX2OnvHzQbjT9lIAe82liZOGPuOL7hCYfhUudJjD323LC1qW', 'user', NULL, '2025-08-12 19:47:33', '2025-08-12 19:47:33');
INSERT INTO `users` VALUES (36, 'Dzaki AlBariz Hidayat', 'dzakialbarizh@gmail.com', NULL, '$2y$12$izk3btNdnjTsI2QQduQM4.O4mOFRSEAHRARNRzWspIcsbPTkcaUTO', 'user', NULL, '2025-08-12 19:47:34', '2025-08-12 19:47:34');
INSERT INTO `users` VALUES (37, 'Kevin', 'layv3x3@gmail.com', NULL, '$2y$12$sL2OGFP2LD3ZpzpOarx8FONA81VFBWLuG6BySEvCeuy.J3uOKvbuy', 'user', NULL, '2025-08-12 19:47:35', '2025-08-12 19:47:35');
INSERT INTO `users` VALUES (38, 'Carissa Widya Baharizki', 'carisawidyabaharizki@gmail.com', NULL, '$2y$12$j.XQXHBwMQ5YSbLS0KbWeuotSceymEruZ0wkc5p6diN0E3AVk3atW', 'user', NULL, '2025-08-12 19:47:42', '2025-08-12 19:47:42');
INSERT INTO `users` VALUES (39, 'Vanessa Regina Putri', 'vanessareginaputri4@gmail.com', NULL, '$2y$12$5WzB525mSIfXyDyEX8OhAuGuQ9NR6J8cso0qLCXW6P.rm1gubDfuG', 'user', NULL, '2025-08-12 19:47:46', '2025-08-12 19:47:46');
INSERT INTO `users` VALUES (40, 'Khaira Nursabila', 'nskhaira25@gmail.com', NULL, '$2y$12$Ag0onUOPgnlPB4LN5eIEq.tTeR042yKxo4Fbx3nuho7Ezrv3sX99q', 'user', NULL, '2025-08-12 19:47:48', '2025-08-12 19:47:48');
INSERT INTO `users` VALUES (41, 'Diva', 'divai0611@gmail.com', NULL, '$2y$12$oNZVEzI89FPSNZjh8CN7k.OWAr29VjnxznXcyvTX0Il/VNe.yVIc2', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53');
INSERT INTO `users` VALUES (42, 'Elia Sri Rismawati', 'eliasrirismawati9@gmail.com', NULL, '$2y$12$FXD1a/l1sRlzgHj2mW/dxegeQ60bohsNtA115jIPJrJUHLU8uzm8m', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53');
INSERT INTO `users` VALUES (43, 'Titania putri', 'titaniap334@gmail.com', NULL, '$2y$12$exZYAqdae4RhISCN/Gk0QuKXyWmZ22awz98KWS9ADovH2j/5mqs/i', 'user', NULL, '2025-08-12 19:47:53', '2025-08-12 19:47:53');
INSERT INTO `users` VALUES (44, 'hikmah nurkholifah', 'h3493522@gmail.com', NULL, '$2y$12$ADd0Erg5W60eB3tcMFTAdeva87YBWLrrcrvaixeyICqmUWH6MStSC', 'user', NULL, '2025-08-12 19:47:54', '2025-08-12 19:47:54');
INSERT INTO `users` VALUES (45, 'Arisa Nabila Bilqis', 'naqieess@gmail.com', NULL, '$2y$12$X4wfdCXzIz6lFA8.mgwR9OZjEII/E5QwodEgeFmKDMNgyXOmWS9ZO', 'user', NULL, '2025-08-12 19:47:57', '2025-08-12 19:47:57');
INSERT INTO `users` VALUES (46, 'Randi Akbar Putra', 'akbarputrarandi@gmail.com', NULL, '$2y$12$EE1z/vfpiE693uaZqCQuN.xxuTkxJ9s30XRTDcHNdwaEUbB6HUjTu', 'user', NULL, '2025-08-12 19:48:02', '2025-08-12 19:48:02');
INSERT INTO `users` VALUES (47, 'Brescia Rose Samosir', 'bresciasamosir@gmail.com', NULL, '$2y$12$qUm1MLZjmStk2z18qH5zFukhOznJpVmG5Gv8ylgHfzW5CVuYlYX5y', 'user', NULL, '2025-08-12 19:48:05', '2025-08-12 19:48:05');
INSERT INTO `users` VALUES (48, 'Ribka Naomi Artha', 'ribkasitungkir77@gmail.com', NULL, '$2y$12$k/QDBnGu9s5dorr4wNCm4edekE3iLHf2sYaftP.VGAxhNaTJ1UIJS', 'user', NULL, '2025-08-12 19:48:06', '2025-08-12 19:48:06');
INSERT INTO `users` VALUES (49, 'FAIRUZ ZIKRI HABIBULLAH', 'haneulkioflife@gmail.com', NULL, '$2y$12$TNgshtpXjWsJLz98te2Mvur36CVEoOyPtsrWP44ohV/KkxUY3Zwui', 'user', NULL, '2025-08-12 19:48:08', '2025-08-12 19:48:08');
INSERT INTO `users` VALUES (50, 'Fahra faddilah', 'yantisusanti8865@gmail.com', NULL, '$2y$12$yfxZz8apDEvN.0p8tYNzXu9rBcuvAYxPYVEctJ9AQ1YDT6KUc9SBK', 'user', NULL, '2025-08-12 19:48:18', '2025-08-12 19:48:18');
INSERT INTO `users` VALUES (51, 'Yolanda Renata Putri BR. Sinurat', 'ylandarnata@gmail.com', NULL, '$2y$12$rhUXyR2kLK5CGXUrVUzT3.2NLauB6wjiHr45jBgXhl5BIYFj.XTo6', 'user', NULL, '2025-08-12 19:48:21', '2025-08-12 19:48:21');
INSERT INTO `users` VALUES (52, 'Dea Auliya', 'deaaulia251022@gmail.com', NULL, '$2y$12$nL.X7RwHZamVYmzErfU0g.FjbFEEeicg9aXRCGW91YoLXMsG9zxnW', 'user', NULL, '2025-08-12 19:48:28', '2025-08-12 19:48:28');
INSERT INTO `users` VALUES (53, 'Enurjanah aeni', 'nunurrnur@gmail.com', NULL, '$2y$12$i7a3eYmOWql20tzQYStvN.FrdrRWBH929NGFASFjGJC07ju5WAGi6', 'user', NULL, '2025-08-12 19:48:28', '2025-08-12 19:48:28');
INSERT INTO `users` VALUES (54, 'windu wulansari', 'wulanwindu054@gmail.com', NULL, '$2y$12$mXQ7ubXmLcSQmuKsbPWFY.WeP8vDVitC7NQmuI6rL6F8W8sfODvhK', 'user', NULL, '2025-08-12 19:48:35', '2025-08-12 19:48:35');
INSERT INTO `users` VALUES (55, 'DONI PUTRA PRATAMA', 'dnnyptra110@gmail.com', NULL, '$2y$12$tAL0FS/prsRA7HwpNuzu/eXgmT/3eA1PU50b/q5aMAInxT6v3WwCm', 'user', NULL, '2025-08-12 19:48:37', '2025-08-12 19:48:37');
INSERT INTO `users` VALUES (56, 'IRHAM ABDUL HAKIM', 'irhamabdulh209@gmail.com', NULL, '$2y$12$cnLax91pjRdaKlrFYFXm2OK.qkyt6BOpL8fC3ynQIe1OW0OXEX8t6', 'user', NULL, '2025-08-12 19:48:45', '2025-08-12 19:48:45');
INSERT INTO `users` VALUES (57, 'cipaa', 'ipo0ca4@gmail.com', NULL, '$2y$12$aY2nYlD34PsL75O8DmC3auILam1q02XCUTEBZj91knTR2ptiNb3Pq', 'user', NULL, '2025-08-12 19:48:45', '2025-08-12 19:48:45');
INSERT INTO `users` VALUES (58, 'NISRINA NAILAH ZALFA', 'disrinazalfa@gmail.com', NULL, '$2y$12$l4pSVXwvBtYFOjIoeLQDnunCeUecz0DWEfwXfD2LZvxdZ3Mj8nOoq', 'user', NULL, '2025-08-12 19:48:48', '2025-08-12 19:48:48');
INSERT INTO `users` VALUES (59, 'Putra Andika Pertama', 'dikaa13625@gmail.com', NULL, '$2y$12$xvU7KrcXdJSW.jZNU/tw0e88qa1auAVGtk/cOuK//WZ1jLuznzZT6', 'user', NULL, '2025-08-12 19:49:04', '2025-08-12 19:49:04');
INSERT INTO `users` VALUES (60, 'Qeenanty', 'qeenanty2008@gmail.com', NULL, '$2y$12$HK7tLlwyDnwzTGaVV1xaXeetxdW2jJfY.IlPrZC2SS6JWJJuTRyBW', 'user', NULL, '2025-08-12 19:49:05', '2025-08-12 19:49:05');
INSERT INTO `users` VALUES (61, 'keanu adhna kurniawan', 'keanuadhna@gmail.com', NULL, '$2y$12$HrbTk8AqC4jnY.IMOHljXuGCwVF6sbkttLGdtSe0s6wWXMvBJjFZy', 'user', NULL, '2025-08-12 19:49:09', '2025-08-12 19:49:09');
INSERT INTO `users` VALUES (62, 'Muhammad Ikhbal Syahreiza', 'doanksyahreza@gmail.com', NULL, '$2y$12$t1g6Fv9evL325NCWR4..KObqzcm2GbiibwktXpHXaMbKOwk3h4y2e', 'user', NULL, '2025-08-12 19:49:17', '2025-08-12 19:49:17');
INSERT INTO `users` VALUES (63, 'Keyzia Syaira Azalea', 'keyziaazalea68@gmail.com', NULL, '$2y$12$FuqAxJBsVuerY2OjGJM7dugGy8YV6wvA3OX.LT6mKpEDGxLYtPIf.', 'user', NULL, '2025-08-12 19:49:21', '2025-08-12 19:49:21');
INSERT INTO `users` VALUES (64, 'Deajeng Oktavia', 'deajengoktavia06@gmai.com', NULL, '$2y$12$Ryg6NxwjzASq0wumwlJzK.7aN5s1h0VvBX7NUyjv03DEPdP3yzgTa', 'user', NULL, '2025-08-12 19:49:30', '2025-08-12 19:49:30');
INSERT INTO `users` VALUES (65, 'Willi anugrah', 'willianugrah61@gmail.com', NULL, '$2y$12$NsWyYyDjG50MVPOE5cklLeG4VKM6cZl1Mz6H/cKEyjds8vGo6T3I6', 'user', NULL, '2025-08-12 19:49:58', '2025-08-12 19:49:58');
INSERT INTO `users` VALUES (66, 'Vinni Rizqiyanti', 'vinirizqyanti@gmail.com', NULL, '$2y$12$t1/FMuyEuFL2q02XYl3NiuLndID4IkTvpuIvFGGmSsi3Ymo6/15ZS', 'user', NULL, '2025-08-12 19:50:00', '2025-08-12 19:50:00');
INSERT INTO `users` VALUES (67, 'REZA ABDUL ROHMAN', 'rezaabdulr16@gmail.com', NULL, '$2y$12$wcJdrf/xnnbR9v1JhzzYAePyRqXMNI7eP1t3IJvMKY/iUuKR.fy36', 'user', NULL, '2025-08-12 19:50:06', '2025-08-12 19:50:06');
INSERT INTO `users` VALUES (68, 'Xena Kaila Nisa', 'arumibacin@gmail.com', NULL, '$2y$12$5FvVcGw7QQ3YZeDg73.YK.3bujPyn5gBZ194dzvQFYsz1OiETNOJO', 'user', NULL, '2025-08-12 19:50:17', '2025-08-12 19:50:17');
INSERT INTO `users` VALUES (69, 'Gisela Syiami Putri', 'giselasyiamiputri08@gmail.com', NULL, '$2y$12$q/H3XLocaCX5SrI.0eujLeMgIb6GSVCWM.R/4.Ad4PjZNYetX0eYm', 'user', NULL, '2025-08-12 19:50:20', '2025-08-12 19:50:20');
INSERT INTO `users` VALUES (70, 'Tiara septi anantia', 'septianantia@gmail.com', NULL, '$2y$12$qfqeah6vTScRPq3RsBGtR.VHcCQ9.hfhv9rsXA0X2NrDYITpKSGd2', 'user', NULL, '2025-08-12 19:50:30', '2025-08-12 19:50:30');
INSERT INTO `users` VALUES (71, 'M ILMAN DANISH', 'milmandanish@gmail.com', NULL, '$2y$12$fLmmfGxL6VQ/vZwHs4GPqOD.ywygOEfE8CURTQcOf8MStETaiNBVC', 'user', NULL, '2025-08-12 19:50:33', '2025-08-12 19:50:33');
INSERT INTO `users` VALUES (72, 'Angelia Shafira Harun', 'angeliaharun090607@gmail.com', NULL, '$2y$12$.DFa/4lndRSN5KKjBSP3TOQyrIGs7EA.of.3sElvKsC9IXlo6txkS', 'user', NULL, '2025-08-12 19:50:42', '2025-08-12 19:50:42');
INSERT INTO `users` VALUES (73, 'Zalfa safira syalabiah', 'Safirasyalabiahzalfa@gmail.com', NULL, '$2y$12$nErbIBwrx3ewymzup8kdiuMeXSmlq5i5DtPiUCW1HXfk6j5nQmKN6', 'user', NULL, '2025-08-12 19:51:26', '2025-08-12 19:51:26');
INSERT INTO `users` VALUES (74, 'FAIRUZ ZIKRI HABIBULLAH', 'ffaooobutterfly@gmail.com', NULL, '$2y$12$QhOTsR1uoiohn6.MzXI7huB7/pqjsSd93CM42.nehB.NaV1hQrHDq', 'user', NULL, '2025-08-12 19:51:27', '2025-08-12 19:51:27');
INSERT INTO `users` VALUES (75, 'MUHAMAD RIPAL', 'kp.sekepondok@gmail.com', NULL, '$2y$12$Ud7K4JpA5AD2/FT9rIzRDue16F/HmbBf5Kf2EtZCkRUPV8k10xEUG', 'user', NULL, '2025-08-12 19:51:53', '2025-08-12 19:51:53');
INSERT INTO `users` VALUES (76, 'santi riyanti rahayu', 'wartinititin75@gmail.com', NULL, '$2y$12$goyDDWs2Z7fFNqoxowlfreUQ994EMKZjwLkAy5kbh9tLwrz8qG2Aa', 'user', NULL, '2025-08-12 19:54:48', '2025-08-12 19:54:48');
INSERT INTO `users` VALUES (77, 'Siska jesika', 'siskajesika61@gmail.com', NULL, '$2y$12$yrpQz635wzuamheQJ.ZnUupHLyQD0EVolyufBglaNSvIMjCgcU6wG', 'user', NULL, '2025-08-12 20:11:04', '2025-08-12 20:11:04');
INSERT INTO `users` VALUES (78, 'Krisna Mulyadi', 'dedij6897@gmail.com', NULL, '$2y$12$qpAMclsoSrSd8nkKGoFbJ.W24.wrZ/byAQd9acBtuytAmXO2GfHNe', 'user', NULL, '2025-08-12 22:58:23', '2025-08-12 22:58:23');
INSERT INTO `users` VALUES (81, 'MUHAMAD RIPAL', 'kentania24@gmail.com', NULL, '$2y$12$XhC52I0Emb2rZf7INDZfI.MRoAiL.RtmJsjxMZDv8t9IYPAKnNn4m', 'user', NULL, '2025-08-13 06:14:09', '2025-08-13 06:14:09');
INSERT INTO `users` VALUES (82, 'admin', 'edukes.edukasikesehatan@gmail.com', NULL, '$2y$12$dMTNgXEhDL/BaNXIjyWTqecA/KcM0n4kwBngYvK2nO3ndGW6hde6C', 'admin', NULL, '2025-08-16 02:24:54', '2025-08-19 03:16:17');
INSERT INTO `users` VALUES (83, 'Deajeng Oktavia', 'deajengoktavia06@gmail.com', NULL, '$2y$12$xhLxkl2TPqVfP4tcBBXXA.YfYs31adYUwkLtnTq7AENzwnFAW.o32', 'user', NULL, '2025-08-16 06:06:12', '2025-08-16 06:06:12');
INSERT INTO `users` VALUES (85, 'Siska jesika', 'tatisukmawati457@gmail.com', NULL, '$2y$12$IB4e6uE9U4uamto6C4NzKu4kCkF7w/lzqoUkmD.Qry6dfkHkJr0pq', 'user', NULL, '2025-08-22 10:01:47', '2025-08-22 10:01:47');
INSERT INTO `users` VALUES (86, 'Arisa', 'naqiesss@gmail.com', NULL, '$2y$12$hWV1jhCaiacTT7l9U0jEeuVumGZGJ6JaD2rIPLHKTfhzPZ0RDkGmG', 'user', NULL, '2025-08-24 21:07:55', '2025-08-24 21:07:55');

-- ----------------------------
-- Table structure for zoom_rooms
-- ----------------------------
DROP TABLE IF EXISTS `zoom_rooms`;
CREATE TABLE `zoom_rooms`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `link_meeting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meeting_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `passcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zoom_rooms_created_by_foreign`(`created_by` ASC) USING BTREE,
  CONSTRAINT `zoom_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zoom_rooms
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
