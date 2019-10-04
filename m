Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: remove useless typedef
Date: Fri,  4 Oct 2019 19:44:24 +0200
Message-Id: <20191004174424.21898-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

rproc_handle_resources_t is not used anymore, remove it.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 48feebd6d0a2..78e00194e72f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -52,8 +52,6 @@
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
 
-typedef int (*rproc_handle_resources_t)(struct rproc *rproc,
-				struct resource_table *table, int len);
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
 
-- 
2.15.0.276.g89ea799
