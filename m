Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 02/19] remoteproc: core: Add function to dump resource table
Date: Wed, 31 Aug 2016 22:50:05 +0200
Message-ID: <1472676622-32533-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

Firmware can be loaded with a resource table, which details
resources needed by coprocessor like carevout memory, virtual
device, trace log buffer etc.

Until now, no method exists to display resource table content.
This function adds the capability to display the different
resources associated to a firmware if DEBUG is enabled.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 85 ++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fb2d2a0..6c48c11 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -791,6 +791,91 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 		rproc_remove_virtio_dev(rvdev);
 }
 
+static void rproc_dump_resource_table(struct rproc *rproc,
+				      struct resource_table *table, int size)
+{
+	const char *types[] = {"carveout", "devmem", "trace", "vdev"};
+	struct device *dev = &rproc->dev;
+	struct fw_rsc_carveout *c;
+	struct fw_rsc_devmem *d;
+	struct fw_rsc_trace *t;
+	struct fw_rsc_vdev *v;
+	int i, j;
+
+	if (!table) {
+		dev_dbg(dev, "No resource table found\n");
+		return;
+	}
+
+	dev_dbg(dev, "Resource Table: Version %d with %d entries [size: %x]\n",
+		table->ver, table->num, size);
+
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+		void *rsc = (void *)hdr + sizeof(*hdr);
+
+		switch (hdr->type) {
+		case RSC_CARVEOUT:
+			c = rsc;
+			dev_dbg(dev, "Entry %d is of type %s\n", i, types[hdr->type]);
+			dev_dbg(dev, "  Device Address 0x%x\n", c->da);
+			dev_dbg(dev, "  Physical Address 0x%x\n", c->pa);
+			dev_dbg(dev, "  Length 0x%x Bytes\n", c->len);
+			dev_dbg(dev, "  Flags 0x%x\n", c->flags);
+			dev_dbg(dev, "  Reserved (should be zero) [%d]\n", c->reserved);
+			dev_dbg(dev, "  Name %s\n\n", c->name);
+			break;
+		case RSC_DEVMEM:
+			d = rsc;
+			dev_dbg(dev, "Entry %d is of type %s\n", i, types[hdr->type]);
+			dev_dbg(dev, "  Device Address 0x%x\n", d->da);
+			dev_dbg(dev, "  Physical Address 0x%x\n", d->pa);
+			dev_dbg(dev, "  Length 0x%x Bytes\n", d->len);
+			dev_dbg(dev, "  Flags 0x%x\n", d->flags);
+			dev_dbg(dev, "  Reserved (should be zero) [%d]\n", d->reserved);
+			dev_dbg(dev, "  Name %s\n\n", d->name);
+			break;
+		case RSC_TRACE:
+			t = rsc;
+			dev_dbg(dev, "Entry %d is of type %s\n", i, types[hdr->type]);
+			dev_dbg(dev, "  Device Address 0x%x\n", t->da);
+			dev_dbg(dev, "  Length 0x%x Bytes\n", t->len);
+			dev_dbg(dev, "  Reserved (should be zero) [%d]\n", t->reserved);
+			dev_dbg(dev, "  Name %s\n\n", t->name);
+			break;
+		case RSC_VDEV:
+			v = rsc;
+			dev_dbg(dev, "Entry %d is of type %s\n", i, types[hdr->type]);
+
+			dev_dbg(dev, "  ID %d\n", v->id);
+			dev_dbg(dev, "  Notify ID %d\n", v->notifyid);
+			dev_dbg(dev, "  Device features 0x%x\n", v->dfeatures);
+			dev_dbg(dev, "  Guest features 0x%x\n", v->gfeatures);
+			dev_dbg(dev, "  Config length 0x%x\n", v->config_len);
+			dev_dbg(dev, "  Status 0x%x\n", v->status);
+			dev_dbg(dev, "  Number of vrings %d\n", v->num_of_vrings);
+			dev_dbg(dev, "  Reserved (should be zero) [%d][%d]\n\n",
+				v->reserved[0], v->reserved[1]);
+
+			for (j = 0; j < v->num_of_vrings; j++) {
+				dev_dbg(dev, "  Vring %d\n", j);
+				dev_dbg(dev, "    Device Address 0x%x\n", v->vring[j].da);
+				dev_dbg(dev, "    Alignment %d\n", v->vring[j].align);
+				dev_dbg(dev, "    Number of buffers %d\n", v->vring[j].num);
+				dev_dbg(dev, "    Notify ID %d\n", v->vring[j].notifyid);
+				dev_dbg(dev, "    Reserved (should be zero) [%d]\n\n",
+					v->vring[j].reserved);
+			}
+			break;
+		default:
+			dev_dbg(dev, "Invalid resource type found: %d [hdr: %p]\n",
+				hdr->type, hdr);
+			return;
+		}
+	}
+}
+
 int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
 {
 	struct device *dev = &rproc->dev;
-- 
1.9.1
