Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 10/20] remoteproc: core: Call rproc_dump_resource_table only if debug is activated
Date: Wed, 12 Oct 2016 18:00:28 +0200
Message-ID: <1476288038-24909-11-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

To reduce CPU usage, limit rproc_dump_resource_table calls only when
DEBUG or CONFIG_DYNAMIC_DEBUG flags are activated.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7bc3cd4..4a61dc1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1066,7 +1066,8 @@ rproc_apply_resource_overrides(struct rproc *rproc,
 	}
 
 
-	rproc_dump_resource_table(rproc, table, size);
+	if (IS_ENABLED(DEBUG) || IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
+		rproc_dump_resource_table(rproc, table, size);
 
 	if (!table) {
 		size = sizeof(*table);
@@ -1100,7 +1101,8 @@ rproc_apply_resource_overrides(struct rproc *rproc,
 		*orig_table = table;
 	}
 
-	rproc_dump_resource_table(rproc, table, size);
+	if (IS_ENABLED(DEBUG) || IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
+		rproc_dump_resource_table(rproc, table, size);
 
 	*tablesz = size;
 
-- 
1.9.1
