Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: Fix wrong rvring index computation
Date: Fri,  4 Oct 2019 09:37:36 +0200
Message-Id: <20191004073736.8327-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Index of rvring is computed using pointer arithmetic. However, since
rvring->rvdev->vring is the base of the vring array, computation
of rvring idx should be reversed. It previously lead to writing at negative
indices in the resource table.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..ab7443874635 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -400,7 +400,7 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 void rproc_free_vring(struct rproc_vring *rvring)
 {
 	struct rproc *rproc = rvring->rvdev->rproc;
-	int idx = rvring->rvdev->vring - rvring;
+	int idx = rvring - rvring->rvdev->vring;
 	struct fw_rsc_vdev *rsc;
 
 	idr_remove(&rproc->notifyids, rvring->notifyid);
-- 
2.15.0.276.g89ea799
