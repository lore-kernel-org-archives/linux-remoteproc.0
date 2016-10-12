Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 13/20] remoteproc: core: Add vdev support to resource amending function
Date: Wed, 12 Oct 2016 18:00:31 +0200
Message-ID: <1476288038-24909-14-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

This patch offers the capability to amend existing RSC_VDEV resource
in an existing resource table.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4297ee7..26fc647 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -985,6 +985,7 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 	struct fw_rsc_carveout *tblc, *newc;
 	struct fw_rsc_devmem *tbld, *newd;
 	struct fw_rsc_trace *tblt, *newt;
+	struct fw_rsc_vdev *tblv, *newv;
 	int updated = true;
 	int i;
 
@@ -1029,6 +1030,20 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 			memcpy(tblt, newt, request->size);
 
 			return updated;
+		case RSC_VDEV:
+			tblv = rsc;
+			newv = request->resource;
+			if (newv->id != tblv->id)
+				break;
+
+			if (request->size > (sizeof(*tblv) +
+				    tblv->num_of_vrings * sizeof(struct fw_rsc_vdev_vring) +
+				    tblv->config_len))
+				return -ENOSPC;
+
+			memcpy(tblv, newv, request->size);
+
+			return updated;
 		default:
 			dev_err(&rproc->dev,
 				"Unsupported resource type: %d\n",
-- 
1.9.1
