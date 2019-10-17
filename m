Return-Path: <ben@codethink.co.uk>
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Subject: [PATCH] remoteproc: fix argument 2 of rproc_mem_entry_init
Date: Thu, 17 Oct 2019 12:59:52 +0100
Message-Id: <20191017115952.13935-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-kernel@lists.codethink.co.uk
Cc: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The rproc_mem_entry_init() call takes a pointer to a vm
as the second argument. The code is currently using a
plain 0 as "NULL". Change to using NULL to fix the
following sparse warnings:

drivers/remoteproc/remoteproc_core.c:339:49: warning: Using plain integer as NULL pointer
drivers/remoteproc/remoteproc_core.c:916:46: warning: Using plain integer as NULL pointer

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..943af836fa0f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -336,7 +336,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 			return -ENOMEM;
 	} else {
 		/* Register carveout in in list */
-		mem = rproc_mem_entry_init(dev, 0, 0, size, rsc->vring[i].da,
+		mem = rproc_mem_entry_init(dev, NULL, 0,
+					   size, rsc->vring[i].da,
 					   rproc_alloc_carveout,
 					   rproc_release_carveout,
 					   "vdev%dvring%d",
@@ -913,7 +914,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	}
 
 	/* Register carveout in in list */
-	carveout = rproc_mem_entry_init(dev, 0, 0, rsc->len, rsc->da,
+	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
 					rproc_alloc_carveout,
 					rproc_release_carveout, rsc->name);
 	if (!carveout) {
-- 
2.23.0
