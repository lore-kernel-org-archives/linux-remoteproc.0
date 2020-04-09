Return-Path: <mst@redhat.com>
Return-Path: <mst@redhat.com>
Date: Thu, 9 Apr 2020 17:10:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] rpmsg: pull in slab.h
Message-ID: <20200409211045.12025-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 232aa4e40133..83f2b8804ee9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/rpmsg/mtk_rpmsg.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
=20
 #include "rpmsg_internal.h"
--=20
MST
