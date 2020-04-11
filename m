Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] remoteproc: Add missing '\n' in log messages
Date: Sat, 11 Apr 2020 18:07:50 +0200
Message-Id: <20200411160750.32573-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, NShubin@topcon.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 791c13b709dd ("remoteproc: Fix NULL pointer dereference in rproc_virtio_notify")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/remoteproc/remoteproc_virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index b48b78e00284..0d4cc0fc5858 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -337,8 +337,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	if (rproc->ops->kick == NULL) {
 		ret = -EINVAL;
-		dev_err(dev, ".kick method not defined for %s",
-				rproc->name);
+		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
 		goto out;
 	}
 
-- 
2.20.1
