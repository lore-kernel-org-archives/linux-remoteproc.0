Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 07/17] remoteproc: introduce rproc_find_carveout_by_name function
Date: Fri, 27 Jul 2018 15:14:42 +0200
Message-ID: <1532697292-14272-8-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch provides a new function to find a carveout according
to a name.
If match found, this function returns a pointer on the corresponding
carveout (rproc_mem_entry structure).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fe6c4e4..77b39ba 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -217,6 +217,48 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_find_carveout_by_name() - lookup the carveout region by a name
+ * @rproc: handle of a remote processor
+ * @name,..: carveout name to find (standard printf format)
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
+ * Return: a valid pointer on carveout entry on success or NULL on failure.
+ */
+struct rproc_mem_entry *
+rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
+{
+	va_list args;
+	char _name[32];
+	struct rproc_mem_entry *carveout, *mem = NULL;
+
+	if (!name)
+		return NULL;
+
+	va_start(args, name);
+	vsnprintf(_name, sizeof(_name), name, args);
+	va_end(args);
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		/* Compare carveout and requested names */
+		if (!strcmp(carveout->name, _name)) {
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
