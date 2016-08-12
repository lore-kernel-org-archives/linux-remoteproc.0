Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 10/13] rpmsg: use proper format-specifier for printing dma_addr_t
Date: Fri, 12 Aug 2016 18:42:25 -0500
Message-ID: <20160812234228.39731-11-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The dma_addr_t types can be printed properly using the %pad
printk format-specifier, there is no need to resort to the
unsigned long long type-casting to deal with different possible
type sizes.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1dbe756a987d..5d74ee4c00f1 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -991,8 +991,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
 		goto vqs_del;
 	}
 
-	dev_dbg(&vdev->dev, "buffers: va %p, dma 0x%llx\n", bufs_va,
-					(unsigned long long)vrp->bufs_dma);
+	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
+		bufs_va, &vrp->bufs_dma);
 
 	/* half of the buffers is dedicated for RX */
 	vrp->rbufs = bufs_va;
-- 
2.9.0
