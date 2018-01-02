Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:49118 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751573AbeABLl7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jan 2018 06:41:59 -0500
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] rpmsg: glink: Fix missing mutex_init() in qcom_glink_alloc_channel()
Date: Tue, 2 Jan 2018 11:47:03 +0000
Message-ID: <1514893623-70432-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

qcom_glink_alloc_channel() allocates the mutex but not initialize it.
Use mutex_init() on it to initialize it correctly.

This is detected by Coccinelle semantic patch.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 40d76d2..e0f31ed 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -221,6 +221,7 @@ static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
 	/* Setup glink internal glink_channel data */
 	spin_lock_init(&channel->recv_lock);
 	spin_lock_init(&channel->intent_lock);
+	mutex_init(&channel->intent_req_lock);
 
 	channel->glink = glink;
 	channel->name = kstrdup(name, GFP_KERNEL);

