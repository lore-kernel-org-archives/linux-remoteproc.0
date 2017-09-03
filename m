Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] rpmsg: glink: initialize ret to zero to ensure error status check is correct
Date: Sun,  3 Sep 2017 14:06:01 +0100
Message-Id: <20170903130601.6533-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

The new switch cases for RPM_CMD_RX_DONE, RPM_CMD_RX_DONE_W_REUSE,
RPM_CMD_RX_INTENT_REQ_ACK, RPM_CMD_INTENT and RPM_CMD_RX_INTENT_REQ from
4 recent commits are not setting ret and so a later non-zero check on ret
is testing on a garbage value in ret. Fix this by initializing ret to zero.

Detected by CoverityScan CID#1455249 ("Uninitialized scalar variable")

Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents)
Fixes: dacbb35e930f ("glink: Receive and store the remote intent buffers")
Fixes: 27b9c5b66b23 ("rpmsg: glink: Request for intents when unavailable")
Fixes: 88c6060f5a7f ("rpmsg: glink: Handle remote rx done command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rpmsg/qcom_glink_native.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 8bc0d0456a40..5a5e927ea50f 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -957,7 +957,7 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 	unsigned int param2;
 	unsigned int avail;
 	unsigned int cmd;
-	int ret;
+	int ret = 0;
 
 	for (;;) {
 		avail = qcom_glink_rx_avail(glink);
@@ -994,8 +994,6 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
 
 			mbox_send_message(glink->mbox_chan, NULL);
 			mbox_client_txdone(glink->mbox_chan, 0);
-
-			ret = 0;
 			break;
 		case RPM_CMD_INTENT:
 			qcom_glink_handle_intent(glink, param1, param2, avail);
-- 
2.14.1
