Return-Path: <mst@redhat.com>
Return-Path: <mst@redhat.com>
Date: Mon, 6 Apr 2020 17:34:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 11/12] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200406210108.148131-12-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
--=20
MST
