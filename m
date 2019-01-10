Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 7/7] remoteproc: fix rproc_check_carveout_da() returned error and comments
Date: Thu, 10 Jan 2019 14:49:11 +0100
Message-ID: <1547128151-44077-8-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
References: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Fix typo in comments.
Change returned error from ENOMEM to EINVAL as
not dealing with memory allocation.
Remove carveout forced da update and return an error
when no configuration match

Fixes: c874bf59add0 ("remoteproc: add helper function to check carveout device address")

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 45d97871ca69..fc9bf99cd96f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -278,25 +278,27 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
  * @len: associated area size
  *
  * This function is a helper function to verify requested device area (couple
- * da, len) is part of specified carevout.
+ * da, len) is part of specified carveout.
+ * If da is not set (defined as FW_RSC_ADDR_ANY), only requested length is
+ * checked.
  *
- * Return: 0 if carveout match request else -ENOMEM
+ * Return: 0 if carveout matches request else error
  */
-int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
-			    u32 da, u32 len)
+static int rproc_check_carveout_da(struct rproc *rproc,
+				   struct rproc_mem_entry *mem, u32 da, u32 len)
 {
 	struct device *dev = &rproc->dev;
-	int delta = 0;
+	int delta;
 
 	/* Check requested resource length */
 	if (len > mem->len) {
 		dev_err(dev, "Registered carveout doesn't fit len request\n");
-		return -ENOMEM;
+		return -EINVAL;
 	}
 
 	if (da != FW_RSC_ADDR_ANY && mem->da == FW_RSC_ADDR_ANY) {
-		/* Update existing carveout da */
-		mem->da = da;
+		/* Address doesn't match registered carveout configuration */
+		return -EINVAL;
 	} else if (da != FW_RSC_ADDR_ANY && mem->da != FW_RSC_ADDR_ANY) {
 		delta = da - mem->da;
 
@@ -304,13 +306,13 @@ int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
 		if (delta < 0) {
 			dev_err(dev,
 				"Registered carveout doesn't fit da request\n");
-			return -ENOMEM;
+			return -EINVAL;
 		}
 
 		if (delta + len > mem->len) {
 			dev_err(dev,
 				"Registered carveout doesn't fit len request\n");
-			return -ENOMEM;
+			return -EINVAL;
 		}
 	}
 
-- 
2.7.4
