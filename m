Return-Path: <mst@redhat.com>
Return-Path: <mst@redhat.com>
Date: Mon, 6 Apr 2020 21:16:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v8 07/19] remoteproc: pull in slab.h
Message-ID: <20200407011612.478226-8-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/rem=
oteproc_sysfs.c
index 7f8536b73295..52b871327b55 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/remoteproc.h>
+#include <linux/slab.h>
=20
 #include "remoteproc_internal.h"
=20
--=20
MST
