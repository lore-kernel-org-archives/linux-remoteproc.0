Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 8/8] remoteproc: Reset table_ptr on stop
Date: Wed, 13 Dec 2017 14:41:11 -0800
Message-Id: <20171213224111.17864-9-bjorn.andersson@linaro.org>
In-Reply-To: <20171213224111.17864-1-bjorn.andersson@linaro.org>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The installed resource table is no longer accessible after stopping the
remote, so update table_ptr to point to the local copy.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index cbd12382b219..98c088d80b3d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1000,6 +1000,9 @@ static int rproc_stop(struct rproc *rproc, bool graceful)
 	/* remove any subdevices for the remote processor */
 	rproc_remove_subdevices(rproc, graceful);
 
+	/* the installed resource table is no longer accessible */
+	rproc->table_ptr = rproc->cached_table;
+
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
 	if (ret) {
-- 
2.15.0
