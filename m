Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 06/13] remoteproc: print hex numbers with a leading 0x format
Date: Fri, 12 Aug 2016 18:42:21 -0500
Message-ID: <20160812234228.39731-7-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

There are couple of debug statements that are printing hexadecimal
numbers without the leading 0x. Fix these and use the standard 0x%x
format specifier so that there is no confusion when looking at the
traces.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fb92b8084a4e..0f85f7eb476d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -236,7 +236,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	}
 	notifyid = ret;
 
-	dev_dbg(dev, "vring%d: va %p dma %pad size %x idr %d\n",
+	dev_dbg(dev, "vring%d: va %p dma %pad size 0x%x idr %d\n",
 		i, va, &dma, size, notifyid);
 
 	rvring->va = va;
@@ -263,7 +263,7 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
 	struct fw_rsc_vdev_vring *vring = &rsc->vring[i];
 	struct rproc_vring *rvring = &rvdev->vring[i];
 
-	dev_dbg(dev, "vdev rsc: vring%d: da %x, qsz %d, align %d\n",
+	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
 		i, vring->da, vring->num, vring->align);
 
 	/* make sure reserved bytes are zeroes */
@@ -349,7 +349,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "vdev rsc: id %d, dfeatures %x, cfg len %d, %d vrings\n",
+	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
 		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
 
 	/* we currently support only two vrings per rvdev */
@@ -578,7 +578,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "carveout rsc: name: %s, da %x, pa %x, len 0x%x, flags %x\n",
+	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
 		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
 
 	carveout = kzalloc(sizeof(*carveout), GFP_KERNEL);
-- 
2.9.0
