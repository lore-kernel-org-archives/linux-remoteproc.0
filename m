Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] remoteproc: qcom: mdt_loader: add include for sizes
Date: Tue, 22 Nov 2016 19:02:17 +0200
Message-Id: <1479834137-30069-1-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-remoteproc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add linux/sizes.h to prevent build failure on non ARM architectures
as:

CC [M]  drivers/remoteproc/qcom_mdt_loader.o
In file included from include/linux/cache.h:4:0,
                 from include/linux/printk.h:8,
                 from include/linux/kernel.h:13,
                 from include/asm-generic/bug.h:13,
                 from arch/x86/include/asm/bug.h:35,
                 from include/linux/bug.h:4,
                 from include/linux/thread_info.h:11,
                 from arch/x86/include/asm/elf.h:7,
                 from include/linux/elf.h:4,
                 from drivers/remoteproc/qcom_mdt_loader.c:18:
drivers/remoteproc/qcom_mdt_loader.c: In function ‘qcom_mdt_parse’:
drivers/remoteproc/qcom_mdt_loader.c:90:52: error: ‘SZ_4K’ undeclared
(first use in this function)

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/remoteproc/qcom_mdt_loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
index 114e8e4cef67..2ff18cd6c096 100644
--- a/drivers/remoteproc/qcom_mdt_loader.c
+++ b/drivers/remoteproc/qcom_mdt_loader.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/remoteproc.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 
 #include "remoteproc_internal.h"
-- 
2.7.4
