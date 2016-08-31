Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 16/19] remoteproc: core: Clean-up resource table sanity checks
Date: Wed, 31 Aug 2016 22:50:19 +0200
Message-ID: <1472676622-32533-17-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

As resource table has been verified after just loading,
the different sanity checks done when accessing resources
are no more needed.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 47 ++++++------------------------------
 1 file changed, 7 insertions(+), 40 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b43553f..462cf79 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -50,7 +50,7 @@ static LIST_HEAD(rproc_list);
 typedef int (*rproc_handle_resources_t)(struct rproc *rproc,
 				struct resource_table *table, int len);
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
-				 void *, int offset, int avail);
+				 void *, int offset);
 
 /* Unique indices for remoteproc devices */
 static DEFINE_IDA(rproc_dev_index);
@@ -306,7 +306,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
  * @rsc: the vring resource descriptor
- * @avail: size of available data (for sanity checking the image)
  *
  * This resource entry requests the host to statically register a virtio
  * device (vdev), and setup everything needed to support it. It contains
@@ -330,19 +329,12 @@ void rproc_free_vring(struct rproc_vring *rvring)
  * Returns 0 on success, or an appropriate error code otherwise
  */
 static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
-			     int offset, int avail)
+			     int offset)
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
 	int i, ret;
 
-	/* make sure resource isn't truncated */
-	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)
-			+ rsc->config_len > avail) {
-		dev_err(dev, "vdev rsc is truncated\n");
-		return -EINVAL;
-	}
-
 	/* make sure reserved bytes are zeroes */
 	if (rsc->reserved[0] || rsc->reserved[1]) {
 		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
@@ -394,7 +386,6 @@ free_rvdev:
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
  * @rsc: the trace resource descriptor
- * @avail: size of available data (for sanity checking the image)
  *
  * In case the remote processor dumps trace logs into memory,
  * export it via debugfs.
@@ -407,18 +398,13 @@ free_rvdev:
  * Returns 0 on success, or an appropriate error code otherwise
  */
 static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
-			      int offset, int avail)
+			      int offset)
 {
 	struct rproc_mem_entry *trace;
 	struct device *dev = &rproc->dev;
 	void *ptr;
 	char name[15];
 
-	if (sizeof(*rsc) > avail) {
-		dev_err(dev, "trace rsc is truncated\n");
-		return -EINVAL;
-	}
-
 	/* make sure reserved bytes are zeroes */
 	if (rsc->reserved) {
 		dev_err(dev, "trace rsc has non zero reserved bytes\n");
@@ -465,7 +451,6 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * rproc_handle_devmem() - handle devmem resource entry
  * @rproc: remote processor handle
  * @rsc: the devmem resource entry
- * @avail: size of available data (for sanity checking the image)
  *
  * Remote processors commonly need to access certain on-chip peripherals.
  *
@@ -487,7 +472,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * are outside those ranges.
  */
 static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
-			       int offset, int avail)
+			       int offset)
 {
 	struct rproc_mem_entry *mapping;
 	struct device *dev = &rproc->dev;
@@ -497,11 +482,6 @@ static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
 	if (!rproc->domain)
 		return -EINVAL;
 
-	if (sizeof(*rsc) > avail) {
-		dev_err(dev, "devmem rsc is truncated\n");
-		return -EINVAL;
-	}
-
 	/* make sure reserved bytes are zeroes */
 	if (rsc->reserved) {
 		dev_err(dev, "devmem rsc has non zero reserved bytes\n");
@@ -543,7 +523,6 @@ out:
  * rproc_handle_carveout() - handle phys contig memory allocation requests
  * @rproc: rproc handle
  * @rsc: the resource entry
- * @avail: size of available data (for image validation)
  *
  * This function will handle firmware requests for allocation of physically
  * contiguous memory regions.
@@ -559,7 +538,7 @@ out:
  */
 static int rproc_handle_carveout(struct rproc *rproc,
 				 struct fw_rsc_carveout *rsc,
-				 int offset, int avail)
+				 int offset)
 {
 	struct rproc_mem_entry *carveout, *mapping;
 	struct device *dev = &rproc->dev;
@@ -567,11 +546,6 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	void *va;
 	int ret;
 
-	if (sizeof(*rsc) > avail) {
-		dev_err(dev, "carveout rsc is truncated\n");
-		return -EINVAL;
-	}
-
 	/* make sure reserved bytes are zeroes */
 	if (rsc->reserved) {
 		dev_err(dev, "carveout rsc has non zero reserved bytes\n");
@@ -680,7 +654,7 @@ free_carv:
 }
 
 static int rproc_count_vrings(struct rproc *rproc, struct fw_rsc_vdev *rsc,
-			      int offset, int avail)
+			      int offset)
 {
 	/* Summarize the number of notification IDs */
 	rproc->max_notifyid += rsc->num_of_vrings;
@@ -714,15 +688,8 @@ static int rproc_handle_resources(struct rproc *rproc, int len,
 	for (i = 0; i < rproc->table_ptr->num; i++) {
 		int offset = rproc->table_ptr->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
-		int avail = len - offset - sizeof(*hdr);
 		void *rsc = (void *)hdr + sizeof(*hdr);
 
-		/* make sure table isn't truncated */
-		if (avail < 0) {
-			dev_err(dev, "rsc table is truncated\n");
-			return -EINVAL;
-		}
-
 		dev_dbg(dev, "rsc: type %d\n", hdr->type);
 
 		if (hdr->type >= RSC_LAST) {
@@ -734,7 +701,7 @@ static int rproc_handle_resources(struct rproc *rproc, int len,
 		if (!handler)
 			continue;
 
-		ret = handler(rproc, rsc, offset + sizeof(*hdr), avail);
+		ret = handler(rproc, rsc, offset + sizeof(*hdr));
 		if (ret)
 			break;
 	}
-- 
1.9.1
