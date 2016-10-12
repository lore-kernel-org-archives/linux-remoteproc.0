Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 11/20] remoteproc: core: Correction carveout name comparison in rproc_update_resource_table_entry
Date: Wed, 12 Oct 2016 18:00:29 +0200
Message-ID: <1476288038-24909-12-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

As old and new carveout name length may be different and the two
names may have a common part, name comparison must cover the complete
name field.
Limit strncmp to carveout name length, i.e. 32 Bytes.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4a61dc1..96692c2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -956,8 +956,7 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 			tblc = rsc;
 			newc = request->resource;
 
-			if (strncmp(newc->name, tblc->name,
-				    sizeof(*tblc->name)))
+			if (strncmp(newc->name, tblc->name, 32))
 				break;
 
 			memcpy(tblc, newc, request->size);
-- 
1.9.1
