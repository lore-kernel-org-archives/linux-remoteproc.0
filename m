Return-Path: <mst@redhat.com>
Return-Path: <mst@redhat.com>
Date: Thu, 9 Apr 2020 17:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] remoteproc: pull in slab.h
Message-ID: <20200409211054.12091-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/stm32_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rp=
roc.c
index a18f88044111..7ef931e9605c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
=20
 #include "remoteproc_internal.h"
--=20
MST
