Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [RFC v2 4/5] remoteproc: probe the system resource manager
Date: Wed, 27 Jun 2018 10:06:21 +0200
Message-ID: <1530086782-5046-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
References: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Oleksij
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

When a remote processor registers, populate the device tree to probe
the SRM core driver

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 283b258..a67f918 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -41,6 +41,7 @@
 #include <linux/crc32.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
+#include <linux/of_platform.h>
 #include <asm/byteorder.h>
 
 #include "remoteproc_internal.h"
@@ -1485,6 +1486,11 @@ int rproc_add(struct rproc *rproc)
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
@@ -1705,6 +1711,8 @@ int rproc_del(struct rproc *rproc)
 	list_del(&rproc->node);
 	mutex_unlock(&rproc_list_mutex);
 
+	of_platform_depopulate(rproc->dev.parent);
+
 	device_del(&rproc->dev);
 
 	return 0;
-- 
2.7.4
