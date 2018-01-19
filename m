Return-Path: <dan.carpenter@oracle.com>
Date: Fri, 19 Jan 2018 16:22:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] rpmsg: smd: Fix double unlock in __qcom_smd_send()
Message-ID: <20180119132236.GA32641@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

We're not holding the lock here, so we shouldn't unlock.

Fixes: 178f3f75bb4e ("rpmsg: smd: Don't hold the tx lock during wait")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index cea9a0930c4d..dd3e7eea8c38 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -759,11 +759,11 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 				       qcom_smd_get_tx_avail(channel) >= tlen ||
 				       channel->state != SMD_CHANNEL_OPENED);
 		if (ret)
-			goto out;
+			goto ret;
 
 		ret = mutex_lock_interruptible(&channel->tx_lock);
 		if (ret)
-			goto out;
+			return ret;
 
 		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 1);
 	}
