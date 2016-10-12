Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 09/20] remoteproc: core: Unify rproc_dump_resource_table debug messages
Date: Wed, 12 Oct 2016 18:00:27 +0200
Message-ID: <1476288038-24909-10-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

For coherency with the rest of the function, mention the resource
table entry when an invalid resource is detected.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ae8e934..7bc3cd4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -876,8 +876,8 @@ static void rproc_dump_resource_table(struct rproc *rproc,
 
 			break;
 		default:
-			dev_dbg(dev, "Invalid resource type found: %d [hdr: %p]\n",
-				hdr->type, hdr);
+			dev_dbg(dev, "Entry %d: Invalid resource type found: %d [hdr: %p]\n",
+				i, hdr->type, hdr);
 			return;
 		}
 	}
-- 
1.9.1
