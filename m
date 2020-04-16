Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 09/18] remoteproc: Move vring management from core to virtio
Date: Thu, 16 Apr 2020 18:13:22 +0200
Message-ID: <20200416161331.7606-10-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

The vrings are correlated to the virtio implementation.
Move following functions to rproc virtio:
- rproc_alloc_vring
- rproc_free_vring
- rproc_parse_vring

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 97 -----------------------
 drivers/remoteproc/remoteproc_internal.h |  4 -
 drivers/remoteproc/remoteproc_virtio.c   | 98 ++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 101 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ac57cd8016be..c9e07c53ed0c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -312,103 +312,6 @@ int rproc_check_carveout_da(struct rproc *rproc,
 }
 EXPORT_SYMBOL(rproc_check_carveout_da);
 
-int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
-{
-	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rproc->dev;
-	struct rproc_vring *rvring = &rvdev->vring[i];
-	struct fw_rsc_vdev *rsc;
-	int ret, size, notifyid;
-	struct rproc_mem_entry *mem;
-
-	/* actual size of vring (in bytes) */
-	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
-
-	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
-
-	/* Search for pre-registered carveout */
-	mem = rproc_find_carveout_by_name(rproc, "vdev%dvring%d", rvdev->index,
-					  i);
-	if (mem) {
-		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
-			return -ENOMEM;
-	} else {
-		/* Register carveout in in list */
-		mem = rproc_mem_entry_init(dev, NULL, 0,
-					   size, rsc->vring[i].da,
-					   rproc_alloc_carveout,
-					   rproc_release_carveout,
-					   "vdev%dvring%d",
-					   rvdev->index, i);
-		if (!mem) {
-			dev_err(dev, "Can't allocate memory entry structure\n");
-			return -ENOMEM;
-		}
-
-		rproc_add_carveout(rproc, mem);
-	}
-
-	/*
-	 * Assign an rproc-wide unique index for this vring
-	 * TODO: assign a notifyid for rvdev updates as well
-	 * TODO: support predefined notifyids (via resource table)
-	 */
-	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
-	if (ret < 0) {
-		dev_err(dev, "idr_alloc failed: %d\n", ret);
-		return ret;
-	}
-	notifyid = ret;
-
-	/* Potentially bump max_notifyid */
-	if (notifyid > rproc->max_notifyid)
-		rproc->max_notifyid = notifyid;
-
-	rvring->notifyid = notifyid;
-
-	/* Let the rproc know the notifyid of this vring.*/
-	rsc->vring[i].notifyid = notifyid;
-	return 0;
-}
-
-int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
-{
-	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rproc->dev;
-	struct fw_rsc_vdev_vring *vring = &rsc->vring[i];
-	struct rproc_vring *rvring = &rvdev->vring[i];
-
-	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
-		i, vring->da, vring->num, vring->align);
-
-	/* verify queue size and vring alignment are sane */
-	if (!vring->num || !vring->align) {
-		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
-			vring->num, vring->align);
-		return -EINVAL;
-	}
-
-	rvring->len = vring->num;
-	rvring->align = vring->align;
-	rvring->rvdev = rvdev;
-
-	return 0;
-}
-
-void rproc_free_vring(struct rproc_vring *rvring)
-{
-	struct rproc *rproc = rvring->rvdev->rproc;
-	int idx = rvring - rvring->rvdev->vring;
-	struct fw_rsc_vdev *rsc;
-
-	idr_remove(&rproc->notifyids, rvring->notifyid);
-
-	/* reset resource entry info */
-	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-	rsc->vring[idx].da = 0;
-	rsc->vring[idx].notifyid = -1;
-}
-
 static int rproc_compare_of(struct device *dev, void *data)
 {
 	if (dev->of_node)
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f230296908ac..5139cca646ca 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -55,10 +55,6 @@ extern struct class rproc_class;
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
-int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
-void rproc_free_vring(struct rproc_vring *rvring);
-int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
-
 void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index e1d7371d2d64..4634cd63d547 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -26,6 +26,104 @@
 
 #include "remoteproc_internal.h"
 
+static int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
+{
+	struct rproc *rproc = rvdev->rproc;
+	struct device *dev = &rproc->dev;
+	struct rproc_vring *rvring = &rvdev->vring[i];
+	struct fw_rsc_vdev *rsc;
+	int ret, size, notifyid;
+	struct rproc_mem_entry *mem;
+
+	/* actual size of vring (in bytes) */
+	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
+
+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
+
+	/* Search for pre-registered carveout */
+	mem = rproc_find_carveout_by_name(rproc, "vdev%dvring%d", rvdev->index,
+					  i);
+	if (mem) {
+		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
+			return -ENOMEM;
+	} else {
+		/* Register carveout in in list */
+		mem = rproc_mem_entry_init(dev, NULL, 0,
+					   size, rsc->vring[i].da,
+					   rproc_alloc_carveout,
+					   rproc_release_carveout,
+					   "vdev%dvring%d",
+					   rvdev->index, i);
+		if (!mem) {
+			dev_err(dev, "Can't allocate memory entry structure\n");
+			return -ENOMEM;
+		}
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	/*
+	 * Assign an rproc-wide unique index for this vring
+	 * TODO: assign a notifyid for rvdev updates as well
+	 * TODO: support predefined notifyids (via resource table)
+	 */
+	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(dev, "idr_alloc failed: %d\n", ret);
+		return ret;
+	}
+	notifyid = ret;
+
+	/* Potentially bump max_notifyid */
+	if (notifyid > rproc->max_notifyid)
+		rproc->max_notifyid = notifyid;
+
+	rvring->notifyid = notifyid;
+
+	/* Let the rproc know the notifyid of this vring.*/
+	rsc->vring[i].notifyid = notifyid;
+	return 0;
+}
+
+static int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc,
+			     int i)
+{
+	struct rproc *rproc = rvdev->rproc;
+	struct device *dev = &rproc->dev;
+	struct fw_rsc_vdev_vring *vring = &rsc->vring[i];
+	struct rproc_vring *rvring = &rvdev->vring[i];
+
+	dev_dbg(dev, "vdev rsc: vring%d: da 0x%x, qsz %d, align %d\n",
+		i, vring->da, vring->num, vring->align);
+
+	/* verify queue size and vring alignment are sane */
+	if (!vring->num || !vring->align) {
+		dev_err(dev, "invalid qsz (%d) or alignment (%d)\n",
+			vring->num, vring->align);
+		return -EINVAL;
+	}
+
+	rvring->len = vring->num;
+	rvring->align = vring->align;
+	rvring->rvdev = rvdev;
+
+	return 0;
+}
+
+static void rproc_free_vring(struct rproc_vring *rvring)
+{
+	struct rproc *rproc = rvring->rvdev->rproc;
+	int idx = rvring - rvring->rvdev->vring;
+	struct fw_rsc_vdev *rsc;
+
+	idr_remove(&rproc->notifyids, rvring->notifyid);
+
+	/* reset resource entry info */
+	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
+	rsc->vring[idx].da = 0;
+	rsc->vring[idx].notifyid = -1;
+}
+
 /* kick the remote processor, and let it know which virtqueue to poke at */
 static bool rproc_virtio_notify(struct virtqueue *vq)
 {
-- 
2.17.1
