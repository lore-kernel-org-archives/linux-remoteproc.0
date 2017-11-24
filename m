Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 5/6] remoteproc: Add posibility to probe a sub device.
Date: Fri, 24 Nov 2017 15:36:41 +0100
Message-ID: <1511534202-12995-6-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, "Loic PALLARDY  <loic.pallardy@st.com>, Fabien DESSENNE" <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Fabien Dessenne <fabien.dessenne@st.com>

When a remote processor registers, populate the device tree to probe
a potential sub-device. This capability is added to be able to add
a resource manger for the remote processor.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 870b1fb..3f39def 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -40,6 +40,7 @@
 #include <linux/crc32.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
+#include <linux/of_platform.h>
 #include <asm/byteorder.h>
 
 #include "remoteproc_internal.h"
@@ -1343,6 +1344,11 @@ int rproc_add(struct rproc *rproc)
 			return ret;
 	}
 
+	/* add resource manager device */
+	ret = devm_of_platform_populate(dev->parent);
+	if (ret < 0)
+		return ret;
+
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
 	list_add(&rproc->node, &rproc_list);
@@ -1551,6 +1557,8 @@ int rproc_del(struct rproc *rproc)
 	list_del(&rproc->node);
 	mutex_unlock(&rproc_list_mutex);
 
+	of_platform_depopulate(rproc->dev.parent);
+
 	device_del(&rproc->dev);
 
 	return 0;
-- 
2.7.4
