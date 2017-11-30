Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 04/16] remoteproc: introduce rproc_find_carveout_by_da
Date: Thu, 30 Nov 2017 17:46:39 +0100
Message-ID: <1512060411-729-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch provides a new function to find a carveout according
to a device address (da).
If match found, this function returns CPU virtual address corresponding
to specified da.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 279320a..78525d1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -211,6 +211,48 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_find_carveout_by_da() - lookup the carveout region for a remoteproc address
+ * @rproc: handle of a remote processor
+ * @da: remoteproc device address to find
+ * @len: length of the memory region @da is pointing to
+ *
+ * Platform driver has the capability to register some pre-allacoted carveout
+ * (physically contiguous memory regions) before rproc firmware loading and
+ * associated resource table analysis. These regions may be dedicated memory
+ * regions internal to the coprocessor or specified DDR region with specific
+ * attributes
+ *
+ * This function is a helper function with which we can go over the
+ * allocated carveouts and translate specific device addresse to virtual
+ * addresse so we can fill firmware resource table.
+ *
+ * The function returns a valid virtual address on success or NULL on failure.
+ */
+void *rproc_find_carveout_by_da(struct rproc *rproc, u64 da, int len)
+{
+	struct rproc_mem_entry *carveout;
+	void *va = NULL;
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		int offset = da - carveout->da;
+
+		/* try next carveout if da is too small */
+		if (offset < 0)
+			continue;
+
+		/* try next carveout if da is too large */
+		if (offset + len > carveout->len)
+			continue;
+
+		va = carveout->va + offset;
+
+		break;
+	}
+
+	return va;
+}
+
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 {
 	struct rproc *rproc = rvdev->rproc;
-- 
1.9.1
