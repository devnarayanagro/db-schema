-- CreateTable
CREATE TABLE `_producttoproductbadge` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_ProductToProductBadge_AB_unique`(`A` ASC, `B` ASC),
    INDEX `_ProductToProductBadge_B_index`(`B` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `address` (
    `id` VARCHAR(191) NOT NULL,
    `customerId` BIGINT NOT NULL,
    `label` VARCHAR(191) NULL,
    `line1` VARCHAR(191) NOT NULL,
    `line2` VARCHAR(191) NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `postalCode` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL DEFAULT 'IN',
    `phone` VARCHAR(191) NULL,
    `isDefault` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Address_customerId_idx`(`customerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminaccess` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `type` ENUM('dashboard', 'catalog', 'products', 'inventory', 'orders', 'partners', 'customers', 'finance', 'ads', 'banners', 'stats', 'messages', 'notifications', 'reports', 'approvals', 'settings', 'security', 'ipControl', 'systemControl') NOT NULL,
    `level` ENUM('view', 'manage', 'approve', 'full') NOT NULL DEFAULT 'view',
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `grantedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AdminAccess_adminId_type_key`(`adminId` ASC, `type` ASC),
    INDEX `AdminAccess_type_level_isActive_idx`(`type` ASC, `level` ASC, `isActive` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminaccount` (
    `id` INTEGER NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `emailVerified` DATETIME(3) NULL,
    `password` VARCHAR(191) NULL,
    `name` VARCHAR(191) NOT NULL,
    `avatarUrl` VARCHAR(191) NULL,
    `department` VARCHAR(191) NULL,
    `isSuperAdmin` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `departmentId` VARCHAR(191) NULL,
    `firstName` VARCHAR(191) NULL,
    `ipApprovalRequired` BOOLEAN NOT NULL DEFAULT false,
    `lastName` VARCHAR(191) NULL,
    `middleName` VARCHAR(191) NULL,
    `status` ENUM('active', 'suspended', 'deleted') NOT NULL DEFAULT 'active',

    INDEX `AdminAccount_departmentId_fkey`(`departmentId` ASC),
    UNIQUE INDEX `AdminAccount_email_key`(`email` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminallowedip` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `ipAddress` VARCHAR(45) NOT NULL,
    `label` VARCHAR(120) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `lastUsedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AdminAllowedIp_adminId_ipAddress_key`(`adminId` ASC, `ipAddress` ASC),
    INDEX `AdminAllowedIp_ipAddress_isActive_idx`(`ipAddress` ASC, `isActive` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `admindepartment` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `type` ENUM('management', 'catalog', 'operations', 'partners', 'finance', 'marketing', 'support', 'security') NOT NULL,
    `description` VARCHAR(255) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AdminDepartment_slug_key`(`slug` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `admindepartmentaccess` (
    `id` VARCHAR(191) NOT NULL,
    `departmentId` VARCHAR(191) NOT NULL,
    `type` ENUM('dashboard', 'catalog', 'products', 'inventory', 'orders', 'partners', 'customers', 'finance', 'ads', 'banners', 'stats', 'messages', 'notifications', 'reports', 'approvals', 'settings', 'security', 'ipControl', 'systemControl') NOT NULL,
    `level` ENUM('view', 'manage', 'approve', 'full') NOT NULL DEFAULT 'view',
    `isActive` BOOLEAN NOT NULL DEFAULT true,

    UNIQUE INDEX `AdminDepartmentAccess_departmentId_type_key`(`departmentId` ASC, `type` ASC),
    INDEX `AdminDepartmentAccess_type_level_isActive_idx`(`type` ASC, `level` ASC, `isActive` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminfingerprint` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `fingerprint` VARCHAR(255) NOT NULL,
    `userAgent` VARCHAR(500) NULL,
    `ipAddress` VARCHAR(45) NULL,
    `forwardedFor` VARCHAR(500) NULL,
    `browser` VARCHAR(80) NULL,
    `operatingSystem` VARCHAR(80) NULL,
    `deviceType` VARCHAR(30) NULL,
    `language` VARCHAR(20) NULL,
    `timezone` VARCHAR(80) NULL,
    `countryCode` VARCHAR(10) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `latitude` DECIMAL(9, 6) NULL,
    `longitude` DECIMAL(9, 6) NULL,
    `locationSource` VARCHAR(40) NULL,
    `isTrusted` BOOLEAN NOT NULL DEFAULT true,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `revokedAt` DATETIME(3) NULL,
    `revokedReason` VARCHAR(255) NULL,
    `firstSeenAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `lastSeenAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `AdminFingerprint_adminId_fingerprint_key`(`adminId` ASC, `fingerprint` ASC),
    INDEX `AdminFingerprint_adminId_idx`(`adminId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminipapproval` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `ipAddress` VARCHAR(45) NOT NULL,
    `fingerprint` VARCHAR(255) NULL,
    `userAgent` VARCHAR(500) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `status` ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    `note` VARCHAR(255) NULL,
    `requestedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `reviewedAt` DATETIME(3) NULL,
    `expiresAt` DATETIME(3) NULL,

    INDEX `AdminIpApproval_adminId_status_idx`(`adminId` ASC, `status` ASC),
    INDEX `AdminIpApproval_ipAddress_status_idx`(`ipAddress` ASC, `status` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminloginactivity` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NULL,
    `email` VARCHAR(191) NULL,
    `fingerprint` VARCHAR(255) NULL,
    `status` VARCHAR(30) NOT NULL,
    `reason` VARCHAR(120) NULL,
    `userAgent` VARCHAR(500) NULL,
    `ipAddress` VARCHAR(45) NULL,
    `forwardedFor` VARCHAR(500) NULL,
    `browser` VARCHAR(80) NULL,
    `operatingSystem` VARCHAR(80) NULL,
    `deviceType` VARCHAR(30) NULL,
    `language` VARCHAR(20) NULL,
    `timezone` VARCHAR(80) NULL,
    `countryCode` VARCHAR(10) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `locationSource` VARCHAR(40) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `AdminLoginActivity_adminId_createdAt_idx`(`adminId` ASC, `createdAt` ASC),
    INDEX `AdminLoginActivity_email_createdAt_idx`(`email` ASC, `createdAt` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminpushsubscription` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `endpoint` TEXT NOT NULL,
    `p256dh` TEXT NOT NULL,
    `auth` TEXT NOT NULL,
    `userAgent` VARCHAR(500) NULL,
    `deviceType` VARCHAR(30) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `lastSeenAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `AdminPushSubscription_adminId_endpoint_key`(`adminId` ASC, `endpoint`(191) ASC),
    INDEX `AdminPushSubscription_adminId_isActive_idx`(`adminId` ASC, `isActive` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminsecurity` (
    `id` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `failedLoginAttempts` INTEGER NOT NULL DEFAULT 0,
    `lockedUntil` DATETIME(3) NULL,

    UNIQUE INDEX `AdminSecurity_adminId_key`(`adminId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminsession` (
    `id` VARCHAR(191) NOT NULL,
    `sessionToken` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    INDEX `AdminSession_adminId_fkey`(`adminId` ASC),
    UNIQUE INDEX `AdminSession_sessionToken_key`(`sessionToken` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `adminverificationtoken` (
    `identifier` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AdminVerificationToken_identifier_token_key`(`identifier` ASC, `token` ASC),
    UNIQUE INDEX `AdminVerificationToken_token_key`(`token` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customeraccount` (
    `id` BIGINT NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `phoneVerified` DATETIME(3) NULL,
    `email` VARCHAR(191) NULL,
    `emailVerified` DATETIME(3) NULL,
    `name` VARCHAR(191) NULL,
    `avatarUrl` VARCHAR(191) NULL,
    `dob` DATETIME(3) NULL,
    `gender` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CustomerAccount_email_key`(`email` ASC),
    UNIQUE INDEX `CustomerAccount_phone_key`(`phone` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customeroauthaccount` (
    `id` VARCHAR(191) NOT NULL,
    `customerId` BIGINT NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `provider` VARCHAR(191) NOT NULL,
    `providerAccountId` VARCHAR(191) NOT NULL,
    `refresh_token` TEXT NULL,
    `access_token` TEXT NULL,
    `expires_at` INTEGER NULL,
    `token_type` VARCHAR(191) NULL,
    `scope` VARCHAR(191) NULL,
    `id_token` TEXT NULL,
    `session_state` VARCHAR(191) NULL,

    INDEX `CustomerOAuthAccount_customerId_fkey`(`customerId` ASC),
    UNIQUE INDEX `CustomerOAuthAccount_provider_providerAccountId_key`(`provider` ASC, `providerAccountId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customerphoneotp` (
    `id` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `codeHash` VARCHAR(191) NOT NULL,
    `expiresAt` DATETIME(3) NOT NULL,
    `attempts` INTEGER NOT NULL DEFAULT 0,
    `consumedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `CustomerPhoneOtp_phone_idx`(`phone` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customersession` (
    `id` VARCHAR(191) NOT NULL,
    `sessionToken` VARCHAR(191) NOT NULL,
    `customerId` BIGINT NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    INDEX `CustomerSession_customerId_fkey`(`customerId` ASC),
    UNIQUE INDEX `CustomerSession_sessionToken_key`(`sessionToken` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customerverificationtoken` (
    `identifier` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `CustomerVerificationToken_identifier_token_key`(`identifier` ASC, `token` ASC),
    UNIQUE INDEX `CustomerVerificationToken_token_key`(`token` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partneraccount` (
    `id` BIGINT NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `emailVerified` DATETIME(3) NULL,
    `password` VARCHAR(191) NOT NULL,
    `status` ENUM('pending', 'approved', 'suspended', 'rejected', 'blocked', 'deleted') NOT NULL DEFAULT 'pending',
    `approvedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `PartnerAccount_email_key`(`email` ASC),
    INDEX `PartnerAccount_status_idx`(`status` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partneraddress` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `addressLine1` VARCHAR(191) NULL,
    `addressLine2` VARCHAR(191) NULL,
    `city` VARCHAR(191) NULL,
    `state` VARCHAR(191) NULL,
    `postalCode` VARCHAR(191) NULL,
    `country` VARCHAR(191) NOT NULL DEFAULT 'IN',

    UNIQUE INDEX `PartnerAddress_partnerId_key`(`partnerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerbackupcode` (
    `id` VARCHAR(191) NOT NULL,
    `securityId` VARCHAR(191) NOT NULL,
    `codeHash` VARCHAR(191) NOT NULL,
    `used` BOOLEAN NOT NULL DEFAULT false,
    `usedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `PartnerBackupCode_securityId_idx`(`securityId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerbankdetails` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `bankAccountHolder` VARCHAR(191) NULL,
    `bankAccountNumber` VARCHAR(191) NULL,
    `bankIfsc` VARCHAR(191) NULL,
    `bankName` VARCHAR(191) NULL,
    `upiId` VARCHAR(191) NULL,

    UNIQUE INDEX `PartnerBankDetails_partnerId_key`(`partnerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerbusinessdetails` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `businessType` ENUM('individual', 'proprietorship', 'partnership', 'private_limited', 'llp', 'other') NOT NULL DEFAULT 'individual',
    `gstNumber` VARCHAR(191) NULL,
    `panNumber` VARCHAR(191) NULL,

    UNIQUE INDEX `PartnerBusinessDetails_partnerId_key`(`partnerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerfingerprint` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `fingerprint` VARCHAR(255) NOT NULL,
    `userAgent` VARCHAR(500) NULL,
    `ipAddress` VARCHAR(45) NULL,
    `forwardedFor` VARCHAR(500) NULL,
    `browser` VARCHAR(80) NULL,
    `operatingSystem` VARCHAR(80) NULL,
    `deviceType` VARCHAR(30) NULL,
    `language` VARCHAR(20) NULL,
    `timezone` VARCHAR(80) NULL,
    `countryCode` VARCHAR(10) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `latitude` DECIMAL(9, 6) NULL,
    `longitude` DECIMAL(9, 6) NULL,
    `locationSource` VARCHAR(40) NULL,
    `isTrusted` BOOLEAN NOT NULL DEFAULT false,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `revokedAt` DATETIME(3) NULL,
    `revokedReason` VARCHAR(255) NULL,
    `firstSeenAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `lastSeenAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `PartnerFingerprint_ipAddress_idx`(`ipAddress` ASC),
    INDEX `PartnerFingerprint_isActive_idx`(`isActive` ASC),
    UNIQUE INDEX `PartnerFingerprint_partnerId_fingerprint_key`(`partnerId` ASC, `fingerprint` ASC),
    INDEX `PartnerFingerprint_partnerId_idx`(`partnerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerkyc` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `kycDocumentUrl` VARCHAR(191) NULL,
    `kycStatus` ENUM('pending', 'verified', 'rejected') NOT NULL DEFAULT 'pending',
    `reviewedAt` DATETIME(3) NULL,
    `commissionRate` DECIMAL(5, 2) NOT NULL DEFAULT 0.00,

    INDEX `PartnerKyc_kycStatus_idx`(`kycStatus` ASC),
    UNIQUE INDEX `PartnerKyc_partnerId_key`(`partnerId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerloginactivity` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NULL,
    `email` VARCHAR(191) NULL,
    `fingerprint` VARCHAR(255) NULL,
    `status` VARCHAR(30) NOT NULL,
    `reason` VARCHAR(120) NULL,
    `userAgent` VARCHAR(500) NULL,
    `ipAddress` VARCHAR(45) NULL,
    `forwardedFor` VARCHAR(500) NULL,
    `browser` VARCHAR(80) NULL,
    `operatingSystem` VARCHAR(80) NULL,
    `deviceType` VARCHAR(30) NULL,
    `language` VARCHAR(20) NULL,
    `timezone` VARCHAR(80) NULL,
    `countryCode` VARCHAR(10) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `PartnerLoginActivity_email_createdAt_idx`(`email` ASC, `createdAt` ASC),
    INDEX `PartnerLoginActivity_partnerId_createdAt_idx`(`partnerId` ASC, `createdAt` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerprofile` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `storeName` VARCHAR(191) NOT NULL,
    `storeSlug` VARCHAR(191) NOT NULL,
    `storeDescription` TEXT NULL,
    `storeLogoUrl` VARCHAR(191) NULL,
    `storeBannerUrl` VARCHAR(191) NULL,
    `ownerName` VARCHAR(191) NOT NULL,
    `supportEmail` VARCHAR(191) NULL,
    `supportPhone` VARCHAR(191) NULL,

    UNIQUE INDEX `PartnerProfile_partnerId_key`(`partnerId` ASC),
    UNIQUE INDEX `PartnerProfile_storeSlug_key`(`storeSlug` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnersecurity` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NOT NULL,
    `phone` VARCHAR(191) NULL,
    `phoneVerified` DATETIME(3) NULL,
    `twoFactorEnabled` BOOLEAN NOT NULL DEFAULT false,
    `twoFactorSecret` VARCHAR(191) NULL,
    `twoFactorVerifiedAt` DATETIME(3) NULL,
    `failedLoginAttempts` INTEGER NOT NULL DEFAULT 0,
    `lockedUntil` DATETIME(3) NULL,

    UNIQUE INDEX `PartnerSecurity_partnerId_key`(`partnerId` ASC),
    UNIQUE INDEX `PartnerSecurity_phone_key`(`phone` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnersignupactivity` (
    `id` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NULL,
    `email` VARCHAR(191) NOT NULL,
    `fingerprint` VARCHAR(255) NULL,
    `status` VARCHAR(30) NOT NULL,
    `reason` VARCHAR(120) NULL,
    `userAgent` VARCHAR(500) NULL,
    `ipAddress` VARCHAR(45) NULL,
    `forwardedFor` VARCHAR(500) NULL,
    `browser` VARCHAR(80) NULL,
    `operatingSystem` VARCHAR(80) NULL,
    `deviceType` VARCHAR(30) NULL,
    `language` VARCHAR(20) NULL,
    `timezone` VARCHAR(80) NULL,
    `countryCode` VARCHAR(10) NULL,
    `country` VARCHAR(80) NULL,
    `region` VARCHAR(120) NULL,
    `city` VARCHAR(120) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `PartnerSignupActivity_email_createdAt_idx`(`email` ASC, `createdAt` ASC),
    INDEX `PartnerSignupActivity_partnerId_createdAt_idx`(`partnerId` ASC, `createdAt` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `partnerverificationtoken` (
    `identifier` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `type` ENUM('email_otp', 'email_verification', 'password_reset') NOT NULL DEFAULT 'email_otp',
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `PartnerVerificationToken_identifier_token_key`(`identifier` ASC, `token` ASC),
    INDEX `PartnerVerificationToken_identifier_type_idx`(`identifier` ASC, `type` ASC),
    UNIQUE INDEX `PartnerVerificationToken_token_key`(`token` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pricingtier` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `unit` ENUM('w_kg', 'w_gram', 'w_mg', 'w_tonne', 'w_quintal', 'w_lb', 'w_oz', 'v_liter', 'v_ml', 'v_gallon', 'v_litre', 'v_cup', 'v_bottle', 'v_can', 'l_meter', 'l_cm', 'l_mm', 'l_inch', 'l_foot', 'l_km', 'c_piece', 'c_bag', 'c_bottle', 'c_packet', 'c_bundle', 'c_box', 'c_pack', 'c_bunch', 'c_dozen', 'c_carton', 'c_crate', 'c_tray', 'c_set', 'c_dose') NOT NULL,
    `unitValue` INTEGER NOT NULL DEFAULT 1,
    `maximumRetailPrice` DECIMAL(10, 2) NOT NULL,
    `sellingPrice` DECIMAL(10, 2) NOT NULL,
    `discountPercentage` INTEGER NOT NULL DEFAULT 0,
    `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    `stockQuantity` INTEGER NOT NULL DEFAULT 0,
    `moq` INTEGER NOT NULL DEFAULT 1,
    `shippingWeight` DECIMAL(10, 3) NULL,
    `shippingLength` DECIMAL(10, 2) NULL,
    `shippingWidth` DECIMAL(10, 2) NULL,
    `shippingHeight` DECIMAL(10, 2) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `PricingTier_productId_idx`(`productId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `categoryId` VARCHAR(191) NOT NULL,
    `partnerId` BIGINT NULL,
    `subcategory` VARCHAR(191) NULL,
    `brand` VARCHAR(191) NULL,
    `sku` VARCHAR(191) NULL,
    `hsnCode` VARCHAR(191) NULL,
    `status` ENUM('draft', 'active', 'out_of_stock', 'deleted') NOT NULL DEFAULT 'draft',
    `approvalStatus` ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    `unitType` ENUM('weight', 'volume', 'length', 'count') NOT NULL DEFAULT 'weight',
    `unit` ENUM('w_kg', 'w_gram', 'w_mg', 'w_tonne', 'w_quintal', 'w_lb', 'w_oz', 'v_liter', 'v_ml', 'v_gallon', 'v_litre', 'v_cup', 'v_bottle', 'v_can', 'l_meter', 'l_cm', 'l_mm', 'l_inch', 'l_foot', 'l_km', 'c_piece', 'c_bag', 'c_bottle', 'c_packet', 'c_bundle', 'c_box', 'c_pack', 'c_bunch', 'c_dozen', 'c_carton', 'c_crate', 'c_tray', 'c_set', 'c_dose') NOT NULL DEFAULT 'w_kg',
    `description` TEXT NULL,
    `descriptionEnabled` BOOLEAN NOT NULL DEFAULT true,
    `specification` TEXT NULL,
    `specificationEnabled` BOOLEAN NOT NULL DEFAULT false,
    `additionalInformation` TEXT NULL,
    `additionalInfoEnabled` BOOLEAN NOT NULL DEFAULT false,
    `storageInformation` TEXT NULL,
    `storageInfoEnabled` BOOLEAN NOT NULL DEFAULT false,
    `usageInformation` TEXT NULL,
    `usageInfoEnabled` BOOLEAN NOT NULL DEFAULT false,
    `returnInformation` TEXT NULL,
    `returnInfoEnabled` BOOLEAN NOT NULL DEFAULT true,
    `highlights` LONGTEXT NOT NULL,
    `originLocation` VARCHAR(191) NULL,
    `harvestDate` DATETIME(3) NULL,
    `packedDate` DATETIME(3) NULL,
    `expiryDate` DATETIME(3) NULL,
    `shelfLife` VARCHAR(191) NULL,
    `organicCertification` VARCHAR(191) NULL,
    `gstRate` DECIMAL(5, 2) NULL,
    `gstIncluded` ENUM('included', 'excluded') NOT NULL DEFAULT 'included',
    `chemicalUsage` TEXT NULL,
    `nutritionalInfo` TEXT NULL,
    `certificationUploadUrl` VARCHAR(191) NULL,
    `deliveryStandard` BOOLEAN NOT NULL DEFAULT true,
    `deliveryExpress` BOOLEAN NOT NULL DEFAULT false,
    `deliveryCod` BOOLEAN NOT NULL DEFAULT true,
    `returnPolicyDays` INTEGER NOT NULL DEFAULT 7,
    `metaTitle` VARCHAR(191) NULL,
    `metaDescription` VARCHAR(160) NULL,
    `metaKeywords` LONGTEXT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Product_categoryId_idx`(`categoryId` ASC),
    INDEX `Product_partnerId_idx`(`partnerId` ASC),
    UNIQUE INDEX `Product_sku_key`(`sku` ASC),
    UNIQUE INDEX `Product_slug_key`(`slug` ASC),
    INDEX `Product_status_idx`(`status` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productapproval` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `status` ENUM('pending', 'approved', 'rejected') NOT NULL,
    `reviewedById` INTEGER NULL,
    `reviewNote` TEXT NULL,
    `reviewedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `ProductApproval_productId_status_idx`(`productId` ASC, `status` ASC),
    INDEX `ProductApproval_reviewedById_idx`(`reviewedById` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productbadge` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NULL,
    `icon` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `position` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `ProductBadge_name_key`(`name` ASC),
    UNIQUE INDEX `ProductBadge_slug_key`(`slug` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productcategory` (
    `id` VARCHAR(191) NOT NULL,
    `parentId` VARCHAR(191) NULL,
    `title` VARCHAR(191) NOT NULL,
    `subtitle` VARCHAR(191) NULL,
    `slug` VARCHAR(191) NOT NULL,
    `imageUrl` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `position` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `ProductCategory_parentId_idx`(`parentId` ASC),
    UNIQUE INDEX `ProductCategory_slug_key`(`slug` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productimage` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `altText` VARCHAR(191) NULL,
    `isMain` BOOLEAN NOT NULL DEFAULT false,
    `position` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `ProductImage_productId_idx`(`productId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productvideo` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `ProductVideo_productId_key`(`productId` ASC),
    PRIMARY KEY (`id` ASC)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_producttoproductbadge` ADD CONSTRAINT `_ProductToProductBadge_A_fkey` FOREIGN KEY (`A`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_producttoproductbadge` ADD CONSTRAINT `_ProductToProductBadge_B_fkey` FOREIGN KEY (`B`) REFERENCES `productbadge`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `address` ADD CONSTRAINT `Address_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customeraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminaccess` ADD CONSTRAINT `AdminAccess_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminaccount` ADD CONSTRAINT `AdminAccount_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `admindepartment`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminallowedip` ADD CONSTRAINT `AdminAllowedIp_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `admindepartmentaccess` ADD CONSTRAINT `AdminDepartmentAccess_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `admindepartment`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminfingerprint` ADD CONSTRAINT `AdminFingerprint_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminipapproval` ADD CONSTRAINT `AdminIpApproval_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminloginactivity` ADD CONSTRAINT `AdminLoginActivity_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminpushsubscription` ADD CONSTRAINT `AdminPushSubscription_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminsecurity` ADD CONSTRAINT `AdminSecurity_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `adminsession` ADD CONSTRAINT `AdminSession_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `adminaccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customeroauthaccount` ADD CONSTRAINT `CustomerOAuthAccount_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customeraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customersession` ADD CONSTRAINT `CustomerSession_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customeraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partneraddress` ADD CONSTRAINT `PartnerAddress_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerbackupcode` ADD CONSTRAINT `PartnerBackupCode_securityId_fkey` FOREIGN KEY (`securityId`) REFERENCES `partnersecurity`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerbankdetails` ADD CONSTRAINT `PartnerBankDetails_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerbusinessdetails` ADD CONSTRAINT `PartnerBusinessDetails_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerfingerprint` ADD CONSTRAINT `PartnerFingerprint_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerkyc` ADD CONSTRAINT `PartnerKyc_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerloginactivity` ADD CONSTRAINT `PartnerLoginActivity_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnerprofile` ADD CONSTRAINT `PartnerProfile_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnersecurity` ADD CONSTRAINT `PartnerSecurity_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partnersignupactivity` ADD CONSTRAINT `PartnerSignupActivity_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pricingtier` ADD CONSTRAINT `PricingTier_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `productcategory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `Product_partnerId_fkey` FOREIGN KEY (`partnerId`) REFERENCES `partneraccount`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `productapproval` ADD CONSTRAINT `ProductApproval_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `productapproval` ADD CONSTRAINT `ProductApproval_reviewedById_fkey` FOREIGN KEY (`reviewedById`) REFERENCES `adminaccount`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `productcategory` ADD CONSTRAINT `ProductCategory_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `productcategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `productimage` ADD CONSTRAINT `ProductImage_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `productvideo` ADD CONSTRAINT `ProductVideo_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

