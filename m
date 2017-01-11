Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v5 4/4] MIPS: Deprecate VPE Loader
Date: Wed, 11 Jan 2017 15:34:12 +0000
Message-ID: <1484148852-29783-5-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1484148852-29783-1-git-send-email-matt.redfearn@imgtec.com>
References: <1484148852-29783-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, Matt Redfearn <matt.redfearn@imgtec.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The MIPS remote processor driver (CONFIG_MIPS_REMOTEPROC) provides a
more standard mechanism for using one or more VPs as coprocessors
running separate firmware.

Here we deprecate this mechanism before it is removed.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/mips/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6faf7c96ee15..d5b5a25a49e8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2298,7 +2298,7 @@ comment "MIPS R2-to-R6 emulator is only available for UP kernels"
 	depends on SMP && CPU_MIPSR6
 
 config MIPS_VPE_LOADER
-	bool "VPE loader support."
+	bool "VPE loader support (DEPRECATED)"
 	depends on SYS_SUPPORTS_MULTITHREADING && MODULES
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
@@ -2307,6 +2307,9 @@ config MIPS_VPE_LOADER
 	  Includes a loader for loading an elf relocatable object
 	  onto another VPE and running it.
 
+	  Unless you have a specific need, you should use CONFIG_MIPS_REMOTEPROC
+          instead of this.
+
 config MIPS_VPE_LOADER_CMP
 	bool
 	default "y"
-- 
2.7.4
