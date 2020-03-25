Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/4] remoteproc: add support for a new 64-bit trace version
Date: Wed, 25 Mar 2020 15:47:00 -0500
Message-ID: <20200325204701.16862-4-s-anna@ti.com>
In-Reply-To: <20200325204701.16862-1-s-anna@ti.com>
References: <20200325204701.16862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Clement Leger <cleger@kalray.eu>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce a new trace entry resource structure that accommodates
a 64-bit device address to support 64-bit processors. This is to
be used using an overloaded version value of 1 in the upper 32-bits
of the previous resource type field. The new resource still uses
32-bits for the length field (followed by a 32-bit reserved field,
so can be updated in the future), which is a sufficiently large
trace buffer size. A 32-bit padding field also had to be added
to align the device address on a 64-bit boundary, and match the
usage on the firmware side.

The remoteproc debugfs logic also has been adjusted accordingly.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c    | 40 ++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c | 37 ++++++++++++++++++-----
 include/linux/remoteproc.h              | 26 ++++++++++++++++
 3 files changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 53bc37c508c6..b9a097990862 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -609,21 +609,45 @@ void rproc_vdev_release(struct kref *ref)
  *
  * Returns 0 on success, or an appropriate error code otherwise
  */
-static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
+static int rproc_handle_trace(struct rproc *rproc, void *rsc,
 			      int offset, int avail, u16 ver)
 {
 	struct rproc_debug_trace *trace;
 	struct device *dev = &rproc->dev;
+	struct fw_rsc_trace *rsc1;
+	struct fw_rsc_trace2 *rsc2;
 	char name[15];
+	size_t rsc_size;
+	u32 reserved;
+	u64 da;
+	u32 len;
+
+	if (!ver) {
+		rsc1 = (struct fw_rsc_trace *)rsc;
+		rsc_size = sizeof(*rsc1);
+		reserved = rsc1->reserved;
+		da = rsc1->da;
+		len = rsc1->len;
+	} else if (ver == 1) {
+		rsc2 = (struct fw_rsc_trace2 *)rsc;
+		rsc_size = sizeof(*rsc2);
+		reserved = rsc2->reserved;
+		da = rsc2->da;
+		len = rsc2->len;
+	} else {
+		dev_err(dev, "unsupported trace rsc version %d\n", ver);
+		return -EINVAL;
+	}
 
-	if (sizeof(*rsc) > avail) {
+	if (rsc_size > avail) {
 		dev_err(dev, "trace rsc is truncated\n");
 		return -EINVAL;
 	}
 
 	/* make sure reserved bytes are zeroes */
-	if (rsc->reserved) {
-		dev_err(dev, "trace rsc has non zero reserved bytes\n");
+	if (reserved) {
+		dev_err(dev, "trace rsc has non zero reserved bytes, value = 0x%x\n",
+			reserved);
 		return -EINVAL;
 	}
 
@@ -632,8 +656,8 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
 		return -ENOMEM;
 
 	/* set the trace buffer dma properties */
-	trace->trace_mem.len = rsc->len;
-	trace->trace_mem.da = rsc->da;
+	trace->trace_mem.len = len;
+	trace->trace_mem.da = da;
 
 	/* set pointer on rproc device */
 	trace->rproc = rproc;
@@ -652,8 +676,8 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
 
 	rproc->num_traces++;
 
-	dev_dbg(dev, "%s added: da 0x%x, len 0x%x\n",
-		name, rsc->da, rsc->len);
+	dev_dbg(dev, "%s added: da 0x%llx, len 0x%x\n",
+		name, da, len);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 3560eed7a360..ff43736db45a 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -192,7 +192,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 	struct resource_table *table = rproc->table_ptr;
 	struct fw_rsc_carveout *c;
 	struct fw_rsc_devmem *d;
-	struct fw_rsc_trace *t;
+	struct fw_rsc_trace *t1;
+	struct fw_rsc_trace2 *t2;
 	struct fw_rsc_vdev *v;
 	int i, j;
 
@@ -205,6 +206,7 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 		int offset = table->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)table + offset;
 		void *rsc = (void *)hdr + sizeof(*hdr);
+		u16 ver = hdr->st.v;
 
 		switch (hdr->st.t) {
 		case RSC_CARVEOUT:
@@ -230,13 +232,32 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			seq_printf(seq, "  Name %s\n\n", d->name);
 			break;
 		case RSC_TRACE:
-			t = rsc;
-			seq_printf(seq, "Entry %d is of type %s\n",
-				   i, types[hdr->st.t]);
-			seq_printf(seq, "  Device Address 0x%x\n", t->da);
-			seq_printf(seq, "  Length 0x%x Bytes\n", t->len);
-			seq_printf(seq, "  Reserved (should be zero) [%d]\n", t->reserved);
-			seq_printf(seq, "  Name %s\n\n", t->name);
+			if (ver == 0) {
+				t1 = rsc;
+				seq_printf(seq, "Entry %d is version %d of type %s\n",
+					   i, ver, types[hdr->st.t]);
+				seq_printf(seq, "  Device Address 0x%x\n",
+					   t1->da);
+				seq_printf(seq, "  Length 0x%x Bytes\n",
+					   t1->len);
+				seq_printf(seq, "  Reserved (should be zero) [%d]\n",
+					   t1->reserved);
+				seq_printf(seq, "  Name %s\n\n", t1->name);
+			} else if (ver == 1) {
+				t2 = rsc;
+				seq_printf(seq, "Entry %d is version %d of type %s\n",
+					   i, ver, types[hdr->st.t]);
+				seq_printf(seq, "  Device Address 0x%llx\n",
+					   t2->da);
+				seq_printf(seq, "  Length 0x%x Bytes\n",
+					   t2->len);
+				seq_printf(seq, "  Reserved (should be zero) [%d]\n",
+					   t2->reserved);
+				seq_printf(seq, "  Name %s\n\n", t2->name);
+			} else {
+				seq_printf(seq, "Entry %d is an unsupported version %d of type %s\n",
+					   i, ver, types[hdr->st.t]);
+			}
 			break;
 		case RSC_VDEV:
 			v = rsc;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 526d3cb45e37..3b3bea42f8b1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -243,6 +243,32 @@ struct fw_rsc_trace {
 	u8 name[32];
 } __packed;
 
+/**
+ * struct fw_rsc_trace2 - trace buffer declaration supporting 64-bits
+ * @padding: initial padding after type field for aligned 64-bit access
+ * @da: device address (64-bit)
+ * @len: length (in bytes)
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the trace buffer
+ *
+ * This resource entry is an enhanced version of the fw_rsc_trace resourec entry
+ * and the provides equivalent functionality but designed for 64-bit remote
+ * processors.
+ *
+ * @da specifies the device address of the buffer, @len specifies
+ * its size, and @name may contain a human readable name of the trace buffer.
+ *
+ * After booting the remote processor, the trace buffers are exposed to the
+ * user via debugfs entries (called trace0, trace1, etc..).
+ */
+struct fw_rsc_trace2 {
+	u32 padding;
+	u64 da;
+	u32 len;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
 /**
  * struct fw_rsc_vdev_vring - vring descriptor entry
  * @da: device address
-- 
2.23.0
