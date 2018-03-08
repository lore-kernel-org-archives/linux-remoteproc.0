Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 1/2] rpmsg: glink: use put_device() if device_register fail
Date: Thu,  8 Mar 2018 15:06:07 +0530
Message-Id: <3bf53792e96a3889604dde687627a04a06ff3a6e.1520501519.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
References: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
References: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

if device_register() returned an error! Always use put_device()
to give up the reference initialized. And unregister device for
other return error.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 892f2b9..3fa9d43 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -217,6 +217,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
+		put_device(dev);
 		return ERR_PTR(ret);
 	}
 
@@ -299,7 +300,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	return glink;
 
 err_put_dev:
-	put_device(dev);
+	device_unregister(dev);
 
 	return ERR_PTR(ret);
 }
-- 
1.9.1
