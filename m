Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 5/8] remoteproc: Don't handle empty resource table
Date: Wed, 13 Dec 2017 14:41:08 -0800
Message-Id: <20171213224111.17864-6-bjorn.andersson@linaro.org>
In-Reply-To: <20171213224111.17864-1-bjorn.andersson@linaro.org>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Allow a NULL table_ptr to have the same meaning as a table with 0
entries, allowing a subsequent patch to skip the assignment step.

A few other places in the implementation does dereference table_ptr, but
they are currently all coming from rproc_handle_resources().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f2b6aa5d204c..63d88d1d206e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -739,6 +739,9 @@ static int rproc_handle_resources(struct rproc *rproc,
 	rproc_handle_resource_t handler;
 	int ret = 0, i;
 
+	if (!rproc->table_ptr)
+		return 0;
+
 	for (i = 0; i < rproc->table_ptr->num; i++) {
 		int offset = rproc->table_ptr->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
-- 
2.15.0
