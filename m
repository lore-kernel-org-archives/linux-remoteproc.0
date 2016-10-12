Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 17/20] remoteproc: core: Add function to verify resource table consistency
Date: Wed, 12 Oct 2016 18:00:35 +0200
Message-ID: <1476288038-24909-18-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

As resource table could be parsed several times, at different times,
to avoid sanity check duplication, let's introduce a new function
to verify the complete integrity of one resource table.

This new function is called before copying it in cache and
accessing it.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 559a63b..849460e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -785,6 +785,69 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 		rproc_remove_virtio_dev(rvdev);
 }
 
+static int rproc_resource_table_sanity_check(struct rproc *rproc,
+		struct resource_table *table_ptr, int len)
+{
+	struct device *dev = &rproc->dev;
+	int i;
+
+	if (len < sizeof(*table_ptr))
+		goto out;
+
+	for (i = 0; i < table_ptr->num; i++) {
+		int offset = table_ptr->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table_ptr + offset;
+		int avail = len - offset - sizeof(*hdr);
+		void *rsc = (void *)hdr + sizeof(*hdr);
+		struct fw_rsc_vdev *v;
+
+		/* Make sure table isn't truncated */
+		if (avail < 0)
+			goto out;
+
+		if (offset == FW_RSC_ADDR_ANY || offset == 0) {
+			dev_err(dev, "Entry %d: bad offset value %x\n", i, offset);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "rsc: type %d\n", hdr->type);
+
+		switch (hdr->type) {
+		case RSC_CARVEOUT:
+			avail -= sizeof(struct fw_rsc_carveout);
+			break;
+		case RSC_DEVMEM:
+			avail -= sizeof(struct fw_rsc_devmem);
+			break;
+		case RSC_TRACE:
+			avail -= sizeof(struct fw_rsc_trace);
+			break;
+		case RSC_VDEV:
+			v = rsc;
+			avail -= sizeof(struct fw_rsc_vdev);
+			if (avail < 0)
+				goto out;
+
+			avail -= v->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)
+				 + v->config_len;
+			break;
+		default:
+			dev_err(&rproc->dev, "Unsupported resource type: %d\n",
+				hdr->type);
+			return -EINVAL;
+		}
+		if (avail < 0)
+			goto out;
+	}
+
+	return 0;
+
+out:
+	dev_err(dev, "Invalid resource table format\n");
+	dump_stack();
+	return -EINVAL;
+}
+
 static void rproc_dump_resource_table(struct rproc *rproc,
 				      struct resource_table *table, int size)
 {
@@ -1246,6 +1309,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up;
 	}
 
+	/*  Verify resource table consistency */
+	ret = rproc_resource_table_sanity_check(rproc, table, tablesz);
+	if (ret) {
+		dev_err(dev, "Failed to get valid resource table,%d\n", ret);
+		goto clean_up;
+	}
+
 	/*
 	 * Create a copy of the resource table. When a virtio device starts
 	 * and calls vring_new_virtqueue() the address of the allocated vring
-- 
1.9.1
