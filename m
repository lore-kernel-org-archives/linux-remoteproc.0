Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/4] remoteproc: introduce version element into resource type field
Date: Wed, 25 Mar 2020 15:46:59 -0500
Message-ID: <20200325204701.16862-3-s-anna@ti.com>
In-Reply-To: <20200325204701.16862-1-s-anna@ti.com>
References: <20200325204701.16862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Clement Leger <cleger@kalray.eu>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The current remoteproc core has supported only 32-bit remote
processors and as such some of the current resource structures
may not scale well for 64-bit remote processors, and would
require new versions of resource types. Each resource is currently
identified by a 32-bit type field. Introduce the concept of version
for these resource types by overloading this 32-bit type field
into two 16-bit version and type fields with the existing resources
behaving as version 0 thereby providing backward compatibility.

The version field is passed as an additional argument to each of
the handler functions, and all the existing handlers are updated
accordingly. Each specific handler will be updated on a need basis
when a new version of the resource type is added.

An alternate way would be to introduce the new types as completely
new resource types which would require additional customization of
the resource handlers based on the 32-bit or 64-bit mode of a remote
processor, and introduction of an additional mode flag to the rproc
structure.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c    | 25 +++++++++++++++----------
 drivers/remoteproc/remoteproc_debugfs.c | 17 ++++++++++-------
 include/linux/remoteproc.h              |  8 +++++++-
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6e0b91fa6f11..53bc37c508c6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -46,7 +46,7 @@ static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
 
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
-				 void *, int offset, int avail);
+				 void *, int offset, int avail, u16 ver);
 
 static int rproc_alloc_carveout(struct rproc *rproc,
 				struct rproc_mem_entry *mem);
@@ -453,6 +453,7 @@ static void rproc_rvdev_release(struct device *dev)
  * @rsc: the vring resource descriptor
  * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
+ * @ver: version number of the resource type
  *
  * This resource entry requests the host to statically register a virtio
  * device (vdev), and setup everything needed to support it. It contains
@@ -476,7 +477,7 @@ static void rproc_rvdev_release(struct device *dev)
  * Returns 0 on success, or an appropriate error code otherwise
  */
 static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
-			     int offset, int avail)
+			     int offset, int avail, u16 ver)
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
@@ -596,6 +597,7 @@ void rproc_vdev_release(struct kref *ref)
  * @rsc: the trace resource descriptor
  * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
+ * @ver: version number of the resource type
  *
  * In case the remote processor dumps trace logs into memory,
  * export it via debugfs.
@@ -608,7 +610,7 @@ void rproc_vdev_release(struct kref *ref)
  * Returns 0 on success, or an appropriate error code otherwise
  */
 static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
-			      int offset, int avail)
+			      int offset, int avail, u16 ver)
 {
 	struct rproc_debug_trace *trace;
 	struct device *dev = &rproc->dev;
@@ -662,6 +664,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * @rsc: the devmem resource entry
  * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
+ * @ver: version number of the resource type
  *
  * Remote processors commonly need to access certain on-chip peripherals.
  *
@@ -683,7 +686,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * are outside those ranges.
  */
 static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
-			       int offset, int avail)
+			       int offset, int avail, u16 ver)
 {
 	struct rproc_mem_entry *mapping;
 	struct device *dev = &rproc->dev;
@@ -865,6 +868,7 @@ static int rproc_release_carveout(struct rproc *rproc,
  * @rsc: the resource entry
  * @offset: offset of the resource entry
  * @avail: size of available data (for image validation)
+ * @ver: version number of the resource type
  *
  * This function will handle firmware requests for allocation of physically
  * contiguous memory regions.
@@ -880,7 +884,7 @@ static int rproc_release_carveout(struct rproc *rproc,
  */
 static int rproc_handle_carveout(struct rproc *rproc,
 				 struct fw_rsc_carveout *rsc,
-				 int offset, int avail)
+				 int offset, int avail, u16 ver)
 {
 	struct rproc_mem_entry *carveout;
 	struct device *dev = &rproc->dev;
@@ -1067,7 +1071,7 @@ static int rproc_handle_resources(struct rproc *rproc,
 			return -EINVAL;
 		}
 
-		dev_dbg(dev, "rsc: type %d\n", hdr->type);
+		dev_dbg(dev, "rsc: type %d vers %d\n", hdr->st.t, hdr->st.v);
 
 		if (hdr->type >= RSC_VENDOR_START &&
 		    hdr->type <= RSC_VENDOR_END) {
@@ -1083,16 +1087,17 @@ static int rproc_handle_resources(struct rproc *rproc,
 			continue;
 		}
 
-		if (hdr->type >= RSC_LAST) {
-			dev_warn(dev, "unsupported resource %d\n", hdr->type);
+		if (hdr->st.t >= RSC_LAST) {
+			dev_warn(dev, "unsupported resource %d\n", hdr->st.t);
 			continue;
 		}
 
-		handler = handlers[hdr->type];
+		handler = handlers[hdr->st.t];
 		if (!handler)
 			continue;
 
-		ret = handler(rproc, rsc, offset + sizeof(*hdr), avail);
+		ret = handler(rproc, rsc, offset + sizeof(*hdr), avail,
+			      hdr->st.v);
 		if (ret)
 			break;
 	}
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index d734cadb16e3..3560eed7a360 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -206,10 +206,11 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 		struct fw_rsc_hdr *hdr = (void *)table + offset;
 		void *rsc = (void *)hdr + sizeof(*hdr);
 
-		switch (hdr->type) {
+		switch (hdr->st.t) {
 		case RSC_CARVEOUT:
 			c = rsc;
-			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
+			seq_printf(seq, "Entry %d is of type %s\n",
+				   i, types[hdr->st.t]);
 			seq_printf(seq, "  Device Address 0x%x\n", c->da);
 			seq_printf(seq, "  Physical Address 0x%x\n", c->pa);
 			seq_printf(seq, "  Length 0x%x Bytes\n", c->len);
@@ -219,7 +220,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			break;
 		case RSC_DEVMEM:
 			d = rsc;
-			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
+			seq_printf(seq, "Entry %d is of type %s\n",
+				   i, types[hdr->st.t]);
 			seq_printf(seq, "  Device Address 0x%x\n", d->da);
 			seq_printf(seq, "  Physical Address 0x%x\n", d->pa);
 			seq_printf(seq, "  Length 0x%x Bytes\n", d->len);
@@ -229,7 +231,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			break;
 		case RSC_TRACE:
 			t = rsc;
-			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
+			seq_printf(seq, "Entry %d is of type %s\n",
+				   i, types[hdr->st.t]);
 			seq_printf(seq, "  Device Address 0x%x\n", t->da);
 			seq_printf(seq, "  Length 0x%x Bytes\n", t->len);
 			seq_printf(seq, "  Reserved (should be zero) [%d]\n", t->reserved);
@@ -237,8 +240,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			break;
 		case RSC_VDEV:
 			v = rsc;
-			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
-
+			seq_printf(seq, "Entry %d is of type %s\n",
+				   i, types[hdr->st.t]);
 			seq_printf(seq, "  ID %d\n", v->id);
 			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
 			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
@@ -261,7 +264,7 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			break;
 		default:
 			seq_printf(seq, "Unknown resource type found: %d [hdr: %pK]\n",
-				   hdr->type, hdr);
+				   hdr->st.t, hdr);
 			break;
 		}
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 77788a4bb94e..526d3cb45e37 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -86,7 +86,13 @@ struct resource_table {
  * this header, and it should be parsed according to the resource type.
  */
 struct fw_rsc_hdr {
-	u32 type;
+	union {
+		u32 type;
+		struct {
+			u16 t;
+			u16 v;
+		} st;
+	};
 	u8 data[0];
 } __packed;
 
-- 
2.23.0
