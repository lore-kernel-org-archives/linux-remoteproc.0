Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 11/16] remoteproc: introduce rproc_find_carveout_by_name function
Date: Thu, 30 Nov 2017 17:46:46 +0100
Message-ID: <1512060411-729-12-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch provides a new function to find a carveout according
to a name.
If match found, this function returns a point on the corresponding
carveout.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 2b7effb..8d990b1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -367,6 +367,42 @@ void *rproc_find_carveout_by_da(struct rproc *rproc, u64 da, int len)
 	return va;
 }
 
+/**
+ * rproc_find_carveout_by_name() - lookup the carveout region by a name
+ * @rproc: handle of a remote processor
+ * @name: carveout name to find
+ *
+ * Platform driver has the capability to register some pre-allacoted carveout
+ * (physically contiguous memory regions) before rproc firmware loading and
+ * associated resource table analysis. These regions may be dedicated memory
+ * regions internal to the coprocessor or specified DDR region with specific
+ * attributes
+ *
+ * This function is a helper function with which we can go over the
+ * allocated carveouts and return associated region characteristics like
+ * coprocessor address, length or processor virtual address.
+ *
+ * The function returns a valid pointer on carveout entry on success or NULL on failure.
+ */
+struct rproc_mem_entry *
+rproc_find_carveout_by_name(struct rproc *rproc, char *name)
+{
+	struct rproc_mem_entry *carveout, *mem = NULL;
+
+	if (!name)
+		return NULL;
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		/* Compare carveout and requested names */
+		if (!strcmp(carveout->name, name)) {
+			mem = carveout;
+			break;
+		}
+	}
+
+	return mem;
+}
+
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 {
 	struct rproc *rproc = rvdev->rproc;
-- 
1.9.1
