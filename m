Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] remoteproc: fix spelling mistake: "Resouce" -> "Resource"
Date: Mon, 29 May 2017 07:23:52 +0100
Message-Id: <20170529062352.5744-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 369ba0f8429c..564061dcc019 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -856,7 +856,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	/* look for the resource table */
 	table = rproc_find_rsc_table(rproc, fw, &tablesz);
 	if (!table) {
-		dev_err(dev, "Resouce table look up failed\n");
+		dev_err(dev, "Resource table look up failed\n");
 		return -EINVAL;
 	}
 
-- 
2.11.0
