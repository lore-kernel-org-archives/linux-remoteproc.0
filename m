Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 08/20] remoteproc: core: Complete VDEV support in rproc_dump_resource_table function
Date: Wed, 12 Oct 2016 18:00:26 +0200
Message-ID: <1476288038-24909-9-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add dump of cfg field of vdev struct.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ce62546..ae8e934 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -808,6 +808,8 @@ static void rproc_dump_resource_table(struct rproc *rproc,
 		int offset = table->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)table + offset;
 		void *rsc = (void *)hdr + sizeof(*hdr);
+		unsigned char *cfg;
+		int len;
 
 		switch (hdr->type) {
 		case RSC_CARVEOUT:
@@ -861,6 +863,17 @@ static void rproc_dump_resource_table(struct rproc *rproc,
 				dev_dbg(dev, "    Physical Address 0x%x\n\n",
 					v->vring[j].pa);
 			}
+
+			dev_dbg(dev, "  Config table\n");
+			cfg = (unsigned char *)(&v->vring[v->num_of_vrings]);
+			len = 0;
+			do {
+				j = min(16, (int)(v->config_len - len));
+				dev_dbg(dev, "    Config[%2d-%2d] = %*phC\n",
+					len, len + j - 1, j, cfg + len);
+				len += j;
+			} while (len < v->config_len);
+
 			break;
 		default:
 			dev_dbg(dev, "Invalid resource type found: %d [hdr: %p]\n",
-- 
1.9.1
