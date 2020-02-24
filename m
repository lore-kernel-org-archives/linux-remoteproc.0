Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37316 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXV0y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Feb 2020 16:26:54 -0500
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
Date: Mon, 24 Feb 2020 15:26:43 -0600
Message-ID: <20200224212643.30672-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Tiwei Bie <tiwei.bie@intel.com>, "David S. Miller" <davem@davemloft.net>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The functions vring_new_virtqueue() and __vring_new_virtqueue() are used
with split rings, and any allocations within these functions are managed
outside of the .we_own_ring flag. The commit cbeedb72b97a ("virtio_ring:
allocate desc state for split ring separately") allocates the desc state
within the __vring_new_virtqueue() but frees it only when the .we_own_ring
flag is set. This leads to a memory leak when freeing such allocated
virtqueues with the vring_del_virtqueue() function.

Fix this by moving the desc_state free code outside the flag and only
for split rings. Issue was discovered during testing with remoteproc
and virtio_rpmsg.

Fixes: cbeedb72b97a ("virtio_ring: allocate desc state for split ring separately")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/virtio/virtio_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 867c7ebd3f10..58b96baa8d48 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2203,10 +2203,10 @@ void vring_del_virtqueue(struct virtqueue *_vq)
 					 vq->split.queue_size_in_bytes,
 					 vq->split.vring.desc,
 					 vq->split.queue_dma_addr);
-
-			kfree(vq->split.desc_state);
 		}
 	}
+	if (!vq->packed_ring)
+		kfree(vq->split.desc_state);
 	list_del(&_vq->list);
 	kfree(vq);
 }
-- 
2.23.0
