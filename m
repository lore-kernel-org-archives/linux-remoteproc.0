Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 08/13] remoteproc/omap: revise a minor error trace message
Date: Fri, 12 Aug 2016 18:42:23 -0500
Message-ID: <20160812234228.39731-9-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The omap_mbox_msg_send() is the legacy API for sending a mailbox
message. It has been replaced with the mbox_send_message() from
the mailbox framework. Revise the failure trace to print a generic
failure message instead of referencing the actual function name.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index ddc1a12d75e0..01e234cb9157 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -96,7 +96,8 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(oproc->mbox, (void *)vqid);
 	if (ret < 0)
-		dev_err(dev, "omap_mbox_msg_send failed: %d\n", ret);
+		dev_err(dev, "failed to send mailbox message, status = %d\n",
+			ret);
 }
 
 /*
-- 
2.9.0
