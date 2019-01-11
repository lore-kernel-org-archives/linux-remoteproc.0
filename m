Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] rpmsg: virtio: change header file sort style
Date: Fri, 11 Jan 2019 10:33:01 +0100
Message-ID: <1547199181-83058-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Make header files alphabetical order.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 664f957012cd..e1d563fbfe65 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -11,21 +11,21 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/virtio.h>
-#include <linux/virtio_ids.h>
-#include <linux/virtio_config.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/rpmsg.h>
 #include <linux/scatterlist.h>
-#include <linux/dma-mapping.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
-#include <linux/jiffies.h>
 #include <linux/sched.h>
+#include <linux/virtio.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
 #include <linux/wait.h>
-#include <linux/rpmsg.h>
-#include <linux/mutex.h>
-#include <linux/of_device.h>
 
 #include "rpmsg_internal.h"
 
-- 
2.7.4
