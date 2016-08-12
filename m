Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 09/13] rpmsg: remove pointless OOM prints
Date: Fri, 12 Aug 2016 18:42:24 -0500
Message-ID: <20160812234228.39731-10-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

These types of error prints are superfluous. The system will
pick up on OOM issues and let the user know. While at this,
fix the usage of using a structure instead of the actual
variable in one of the allocations.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index fe03b2aef450..1dbe756a987d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -220,10 +220,8 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	struct device *dev = rpdev ? &rpdev->dev : &vrp->vdev->dev;
 
 	ept = kzalloc(sizeof(*ept), GFP_KERNEL);
-	if (!ept) {
-		dev_err(dev, "failed to kzalloc a new ept\n");
+	if (!ept)
 		return NULL;
-	}
 
 	kref_init(&ept->refcount);
 	mutex_init(&ept->cb_lock);
@@ -514,11 +512,9 @@ static struct rpmsg_channel *rpmsg_create_channel(struct virtproc_info *vrp,
 		return NULL;
 	}
 
-	rpdev = kzalloc(sizeof(struct rpmsg_channel), GFP_KERNEL);
-	if (!rpdev) {
-		pr_err("kzalloc failed\n");
+	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
+	if (!rpdev)
 		return NULL;
-	}
 
 	rpdev->vrp = vrp;
 	rpdev->src = chinfo->src;
-- 
2.9.0
