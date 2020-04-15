Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
Date: Wed, 15 Apr 2020 14:48:56 -0600
Message-Id: <20200415204858.2448-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Improve the readability of function rproc_alloc_firmware() by using
a non-negated condition.

Suggested-by: Alex Elder <elder@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ebaff496ef81..0bfa6998705d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 {
 	const char *p;
 
-	if (!firmware)
+	if (firmware)
+		p = kstrdup_const(firmware, GFP_KERNEL);
+	else
 		/*
 		 * If the caller didn't pass in a firmware name then
 		 * construct a default name.
 		 */
 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
-	else
-		p = kstrdup_const(firmware, GFP_KERNEL);
 
 	if (!p)
 		return -ENOMEM;
-- 
2.20.1
