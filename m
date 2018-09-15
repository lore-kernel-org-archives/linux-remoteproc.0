Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/5] remoteproc: Add missing kernel-doc comment for auto-boot
Date: Fri, 14 Sep 2018 19:37:23 -0500
Message-ID: <20180915003725.17549-4-s-anna@ti.com>
In-Reply-To: <20180915003725.17549-1-s-anna@ti.com>
References: <20180915003725.17549-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The commit ddf711872c9d ("remoteproc: Introduce auto-boot flag")
introduced the auto-boot flag but missed adding the corresponding
kernel-doc comment. Add the same.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 include/linux/remoteproc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e3c5d856b6da..75f9ca05b865 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -439,6 +439,7 @@ struct rproc_dump_segment {
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
+ * @auto_boot: flag to indicate if remote processor should be auto-started
  * @dump_segments: list of segments in the firmware
  */
 struct rproc {
-- 
2.18.0
