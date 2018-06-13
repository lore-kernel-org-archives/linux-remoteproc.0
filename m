Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 1/5] rpmsg: smd: Add missing include of sizes.h
Date: Wed, 13 Jun 2018 14:53:56 +0200
Message-Id: <20180613125401.11734-2-niklas.cassel@linaro.org>
In-Reply-To: <20180613125401.11734-1-niklas.cassel@linaro.org>
References: <20180613125401.11734-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing include of sizes.h.

drivers/rpmsg/qcom_smd.c: In function ‘qcom_smd_channel_open’:
drivers/rpmsg/qcom_smd.c:809:36: error: ‘SZ_4K’ undeclared (first use in this function)
  bb_size = min(channel->fifo_size, SZ_4K);
                                    ^~~~~

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 6437bbeebc91..8695cb041c31 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sched.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/wait.h>
-- 
2.17.1
