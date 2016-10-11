Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v3 4/4] MIPS: Deprecate VPE Loader
Date: Tue, 11 Oct 2016 14:42:36 +0100
Message-ID: <1476193356-1350-5-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1476193356-1350-1-git-send-email-matt.redfearn@imgtec.com>
References: <1476193356-1350-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, Matt Redfearn <matt.redfearn@imgtec.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The MIPS remote processor driver (CONFIG_MIPS_RPROC) provides a more
standard mechanism for using one or more VPs as coprocessors running
separate firmware.

Here we deprecate this mechanism before it is removed.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v3: None
Changes in v2: None

 arch/mips/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fd2468e71e63..3e767c373c7b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2264,7 +2264,7 @@ comment "MIPS R2-to-R6 emulator is only available for UP kernels"
 	depends on SMP && CPU_MIPSR6
 
 config MIPS_VPE_LOADER
-	bool "VPE loader support."
+	bool "VPE loader support (DEPRECATED)"
 	depends on SYS_SUPPORTS_MULTITHREADING && MODULES
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
@@ -2273,6 +2273,9 @@ config MIPS_VPE_LOADER
 	  Includes a loader for loading an elf relocatable object
 	  onto another VPE and running it.
 
+	  Unless you have a specific need, you should use CONFIG_MIPS_RPROC
+          instead of this.
+
 config MIPS_VPE_LOADER_CMP
 	bool
 	default "y"
-- 
2.7.4
