Return-Path: <wenhu.wang@vivo.com>
From: Wang Wenhu <wenhu.wang@vivo.com>
Subject: [PATCH] rpmsg: fix a comment typo for rpmsg_device_match()
Date: Fri, 13 Mar 2020 09:50:49 -0700
Message-Id: <20200313165049.62907-1-wenhu.wang@vivo.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: trivial@kernel.org, kernel@vivo.com, Wang Wenhu <wenhu.wang@vivo.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Should be 'a' rather than 'an'.

Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e330ec4dfc33..a6361cad608b 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -284,7 +284,7 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 EXPORT_SYMBOL(rpmsg_trysend_offchannel);
 
 /*
- * match an rpmsg channel with a channel info struct.
+ * match a rpmsg channel with a channel info struct.
  * this is used to make sure we're not creating rpmsg devices for channels
  * that already exist.
  */
-- 
2.17.1
