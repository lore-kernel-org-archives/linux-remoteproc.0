Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 10/17] remoteproc: add helper function to check carveout device address
Date: Fri, 27 Jul 2018 15:14:45 +0200
Message-ID: <1532697292-14272-11-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces a function to verify that a specified carveout
is fitting request device address and associated length

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1e0fe3e..5dd5edf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -259,6 +259,53 @@ struct rproc_mem_entry *
 	return mem;
 }
 
+/**
+ * rproc_check_carveout_da() - Check specified carveout da configuration
+ * @rproc: handle of a remote processor
+ * @mem: pointer on carveout to check
+ * @da: area device address
+ * @len: associated area size
+ *
+ * This function is a helper function to verify requested device area (couple
+ * da, len) is part of specified carevout.
+ *
+ * Return: 0 if carveout matchs request else -ENOMEM
+ */
+int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
+			    u32 da, u32 len)
+{
+	struct device *dev = &rproc->dev;
+	int delta = 0;
+
+	/* Check requested resource length */
+	if (len > mem->len) {
+		dev_err(dev, "Registered carveout doesn't fit len request\n");
+		return -ENOMEM;
+	}
+
+	if (da != FW_RSC_ADDR_ANY && mem->da == FW_RSC_ADDR_ANY) {
+		/* Update existing carveout da */
+		mem->da = da;
+	} else if (da != FW_RSC_ADDR_ANY && mem->da != FW_RSC_ADDR_ANY) {
+		delta = da - mem->da;
+
+		/* Check requested resource belongs to registered carveout */
+		if (delta < 0) {
+			dev_err(dev,
+				"Registered carveout doesn't fit da request\n");
+			return -ENOMEM;
+		}
+
+		if (delta + len > mem->len) {
+			dev_err(dev,
+				"Registered carveout doesn't fit len request\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 {
 	struct rproc *rproc = rvdev->rproc;
-- 
1.9.1
