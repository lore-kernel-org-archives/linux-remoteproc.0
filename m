Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-eopbgr150057.outbound.protection.outlook.com ([40.107.15.57]:63424
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727566AbfAUHQd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jan 2019 02:16:33 -0500
From: Peng Fan <peng.fan@nxp.com>
Subject: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Mon, 21 Jan 2019 04:51:57 +0000
Message-ID: <20190121050056.14325-1-peng.fan@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "hch@infradead.org" <hch@infradead.org>
Cc: "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

on i.MX8QM, M4_1 is communicating with DomU using rpmsg with a fixed
address as the dma mem buffer which is predefined.

Without this patch, the flow is:
vring_map_one_sg -> vring_use_dma_api
                 -> dma_map_page
		       -> __swiotlb_map_page
		                ->swiotlb_map_page
				->__dma_map_area(phys_to_virt(dma_to_phys(dev, dev_addr)), size, dir);
However we are using per device dma area for rpmsg, phys_to_virt
could not return a correct virtual address for virtual address in
vmalloc area. Then kernel panic.

With this patch, vring_use_dma_api will return false, and
vring_map_one_sg will return sg_phys(sg) which is the correct phys
address in the predefined memory region.
vring_map_one_sg -> vring_use_dma_api
                 -> sg_phys(sg)

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/virtio/virtio_ring.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index cd7e755484e3..8993d7cb3592 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -248,6 +248,8 @@ static inline bool virtqueue_use_indirect(struct virtqu=
eue *_vq,
=20
 static bool vring_use_dma_api(struct virtio_device *vdev)
 {
+	struct device *dma_dev =3D vdev->dev.parent;
+
 	if (!virtio_has_iommu_quirk(vdev))
 		return true;
=20
@@ -260,7 +262,7 @@ static bool vring_use_dma_api(struct virtio_device *vde=
v)
 	 * the DMA API if we're a Xen guest, which at least allows
 	 * all of the sensible Xen configurations to work correctly.
 	 */
-	if (xen_domain())
+	if (xen_domain() && !dma_dev->dma_mem)
 		return true;
=20
 	return false;
--=20
2.14.1
