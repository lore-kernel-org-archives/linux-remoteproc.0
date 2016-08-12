Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 03/13] remoteproc: use variable names for sizeof() operator
Date: Fri, 12 Aug 2016 18:42:18 -0500
Message-ID: <20160812234228.39731-4-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Fix the code formatting to use the kernel preferred style
of using the actual variables to determize the size using
the sizeof() operator.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e1644c992839..140b580477e3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -358,7 +358,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 		return -EINVAL;
 	}
 
-	rvdev = kzalloc(sizeof(struct rproc_vdev), GFP_KERNEL);
+	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
 	if (!rvdev)
 		return -ENOMEM;
 
@@ -1359,7 +1359,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		 */
 		name_len = strlen(name) + strlen(template) - 2 + 1;
 
-	rproc = kzalloc(sizeof(struct rproc) + len + name_len, GFP_KERNEL);
+	rproc = kzalloc(sizeof(*rproc) + len + name_len, GFP_KERNEL);
 	if (!rproc)
 		return NULL;
 
-- 
2.9.0
