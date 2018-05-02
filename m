Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 3/3] remoteproc/davinci: use octal permissions for module_param()
Date: Wed,  2 May 2018 11:56:59 +0200
Message-Id: <20180502095659.3626-4-brgl@bgdev.pl>
In-Reply-To: <20180502095659.3626-1-brgl@bgdev.pl>
References: <20180502095659.3626-1-brgl@bgdev.pl>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Suman Anna <s-anna@ti.com>, Aparna Balasubramanian <aparnab@ti.com>, Kevin Hilman <khilman@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Checkpatch recommends to use octal perms instead of S_IRUGO.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Sekhar Nori <nsekhar@ti.com>
Acked-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index f134192922e0..b668e32996e2 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -25,7 +25,7 @@
 #include "remoteproc_internal.h"
 
 static char *da8xx_fw_name;
-module_param(da8xx_fw_name, charp, S_IRUGO);
+module_param(da8xx_fw_name, charp, 0444);
 MODULE_PARM_DESC(da8xx_fw_name,
 		 "Name of DSP firmware file in /lib/firmware (if not specified defaults to 'rproc-dsp-fw')");
 
-- 
2.17.0
