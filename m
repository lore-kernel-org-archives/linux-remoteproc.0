Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:40868 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751604AbdICMqQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 3 Sep 2017 08:46:16 -0400
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][rpmsg-next] rpmsg: glink: fix null pointer dereference on a null intent
Date: Sun,  3 Sep 2017 13:46:14 +0100
Message-Id: <20170903124614.6248-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

In the case where glink->intentless is true and the call
to qcom_glink_tx fails then we have a condition where ret is
non-zero and intent is null, causing a null pointer deference
when setting intent->in_use to false.  Add an extra check to
only dereference intent if intent is non-null.

Detected by: CoverityScan CID#1455247 ("Explicit null dereferenced")

Fixes: 88c6060f5a7f ("rpmsg: glink: Handle remote rx done command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 666068202597..8bc0d0456a40 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1264,7 +1264,7 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	ret = qcom_glink_tx(glink, &req, sizeof(req), data, len, wait);
 
 	/* Mark intent available if we failed */
-	if (ret)
+	if (ret && intent)
 		intent->in_use = false;
 
 	return ret;
-- 
2.14.1

