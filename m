Return-Path: <mst@redhat.com>
Return-Path: <mst@redhat.com>
Date: Mon, 6 Apr 2020 21:16:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v8 15/19] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200407011612.478226-16-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

These are used for legacy ring format, switch to APIs that make this
explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/remoteproc_core.c   | 2 +-
 drivers/remoteproc/remoteproc_virtio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remo=
teproc_core.c
index 097f33e4f1f3..c350a01e6c4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -322,7 +322,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 =09struct rproc_mem_entry *mem;
=20
 =09/* actual size of vring (in bytes) */
-=09size =3D PAGE_ALIGN(vring_size(rvring->len, rvring->align));
+=09size =3D PAGE_ALIGN(vring_legacy_size(rvring->len, rvring->align));
=20
 =09rsc =3D (void *)rproc->table_ptr + rvdev->rsc_offset;
=20
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/re=
moteproc_virtio.c
index 8c07cb2ca8ba..35b02468197a 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -95,7 +95,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device =
*vdev,
 =09len =3D rvring->len;
=20
 =09/* zero vring */
-=09size =3D vring_size(len, rvring->align);
+=09size =3D vring_legacy_size(len, rvring->align);
 =09memset(addr, 0, size);
=20
 =09dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
--=20
MST
