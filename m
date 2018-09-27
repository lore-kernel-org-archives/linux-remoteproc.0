Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] rpmsg: fix memory leak on channel
Date: Thu, 27 Sep 2018 22:36:27 +0100
Message-Id: <20180927213627.12752-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Currently a failed allocation of channel->name leads to an
immediate return without freeing channel. Fix this by setting
ret to -ENOMEM and jumping to an exit path that kfree's channel.

Detected by CoverityScan, CID#1473692 ("Resource Leak")

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rpmsg/qcom_smd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 0dae7c9f4a8f..4abbeea782fa 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1122,8 +1122,10 @@ static struct qcom_smd_channel *qcom_smd_create_channel(struct qcom_smd_edge *ed
 
 	channel->edge = edge;
 	channel->name = kstrdup(name, GFP_KERNEL);
-	if (!channel->name)
-		return ERR_PTR(-ENOMEM);
+	if (!channel->name) {
+		ret = -ENOMEM;
+		goto free_channel;
+	}
 
 	spin_lock_init(&channel->tx_lock);
 	spin_lock_init(&channel->recv_lock);
@@ -1173,6 +1175,7 @@ static struct qcom_smd_channel *qcom_smd_create_channel(struct qcom_smd_edge *ed
 
 free_name_and_channel:
 	kfree(channel->name);
+free_channel:
 	kfree(channel);
 
 	return ERR_PTR(ret);
-- 
2.17.1
