Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] rpmsg: Only invoke announce_create for rpdev with endpoints
Date: Tue, 27 Mar 2018 14:06:42 -0700
Message-Id: <20180327210643.3436-3-bjorn.andersson@linaro.org>
In-Reply-To: <20180327210643.3436-1-bjorn.andersson@linaro.org>
References: <20180327210643.3436-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

For special rpmsg devices without a primary endpoint there is nothing to
announce so don't call the backend announce create function if we didn't
create an endpoint.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index dffa3aab7178..e85d2691d2cf 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -442,7 +442,7 @@ static int rpmsg_dev_probe(struct device *dev)
 		goto out;
 	}
 
-	if (rpdev->ops->announce_create)
+	if (ept && rpdev->ops->announce_create)
 		err = rpdev->ops->announce_create(rpdev);
 out:
 	return err;
-- 
2.16.2
