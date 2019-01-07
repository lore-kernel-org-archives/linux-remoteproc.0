Return-Path: <pihsun@chromium.org>
Return-Path: <pihsun@chromium.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [PATCH] rpmsg: core: Make remove handler for rpmsg driver optional.
Date: Mon,  7 Jan 2019 19:38:32 +0800
Message-Id: <20190107113833.243672-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:REMOTE PROCESSOR MESSAGING RPMSG SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Most other bus (for example, SPI, i2c) have the remove handler for
driver optional. Make remove handler for rpmsg driver optional too.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/rpmsg/rpmsg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 8122807db38094..ea88fd4e2a6ecf 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -493,7 +493,8 @@ static int rpmsg_dev_remove(struct device *dev)
 	if (rpdev->ops->announce_destroy)
 		err = rpdev->ops->announce_destroy(rpdev);
 
-	rpdrv->remove(rpdev);
+	if (rpdrv->remove)
+		rpdrv->remove(rpdev);
 
 	dev_pm_domain_detach(dev, true);
 
-- 
2.20.1.97.g81188d93c3-goog
