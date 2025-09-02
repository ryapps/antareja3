-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('USER', 'ADMIN') NOT NULL,
    `verified` BOOLEAN NOT NULL DEFAULT false,
    `token` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_token_key`(`token`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anggota` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `telp` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `posisi` ENUM('OFFICIAL', 'DANTON', 'B1S1', 'B1S2', 'B1S3', 'B2S1', 'B2S2', 'B2S3', 'B3S1', 'B3S2', 'B3S3', 'B4S1', 'B4S2', 'B4S3', 'B5S1', 'B5S2', 'B5S3', 'CERDAS_CERMAT1', 'CERDAS_CERMAT2') NOT NULL,
    `nisn` VARCHAR(191) NULL,
    `kelas` ENUM('VII', 'VIII', 'IX', 'X', 'XI', 'XII') NOT NULL,
    `timId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Anggota_email_key`(`email`),
    UNIQUE INDEX `Anggota_posisi_timId_key`(`posisi`, `timId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Penilaian` (
    `id` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `tim_id` VARCHAR(191) NOT NULL,
    `danpas` INTEGER NOT NULL,
    `detail_url` VARCHAR(191) NOT NULL,
    `formasi` INTEGER NOT NULL,
    `note` VARCHAR(191) NOT NULL,
    `pasukan` INTEGER NOT NULL,
    `pbb` INTEGER NOT NULL,
    `pbb_tambahan` INTEGER NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT false,
    `variasi` INTEGER NOT NULL,
    `cerdas_cermat` INTEGER NULL,
    `mascot` INTEGER NULL,

    UNIQUE INDEX `Penilaian_tim_id_key`(`tim_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tim` (
    `id` VARCHAR(191) NOT NULL,
    `nama_tim` VARCHAR(191) NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,
    `pelatih` VARCHAR(191) NOT NULL,
    `jenjang` ENUM('SMP', 'SMA') NOT NULL,
    `confirmed` BOOLEAN NOT NULL DEFAULT false,
    `userId` VARCHAR(191) NOT NULL,
    `asal_sekolah` VARCHAR(191) NOT NULL,
    `tipe_tim` ENUM('SMALL', 'NORMAL') NOT NULL,
    `foto_mascot` VARCHAR(191) NULL,
    `no_pelatih` VARCHAR(191) NOT NULL,
    `link_berkas` VARCHAR(191) NULL,
    `link_video` VARCHAR(191) NULL,

    UNIQUE INDEX `Tim_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pembayaran` (
    `id` VARCHAR(191) NOT NULL,
    `tim_id` VARCHAR(191) NOT NULL,
    `bukti_tf` VARCHAR(191) NOT NULL,
    `bank` VARCHAR(191) NOT NULL,
    `nama_rek` VARCHAR(191) NOT NULL,
    `isDP` BOOLEAN NOT NULL,

    UNIQUE INDEX `Pembayaran_tim_id_key`(`tim_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pengumuman` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `content` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Anggota` ADD CONSTRAINT `Anggota_timId_fkey` FOREIGN KEY (`timId`) REFERENCES `Tim`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Penilaian` ADD CONSTRAINT `Penilaian_tim_id_fkey` FOREIGN KEY (`tim_id`) REFERENCES `Tim`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Penilaian` ADD CONSTRAINT `Penilaian_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tim` ADD CONSTRAINT `Tim_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pembayaran` ADD CONSTRAINT `Pembayaran_tim_id_fkey` FOREIGN KEY (`tim_id`) REFERENCES `Tim`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
