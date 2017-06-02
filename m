Return-Path: <Henri.Roosen@ginzinger.com>
From: Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH] rpmsg: rpmsg_core: fix null-ptr dereference for devices without ops
Date: Fri, 2 Jun 2017 13:35:21 +0200
Message-ID: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-remoteproc@vger.kernel.org
Cc: Henri Roosen <henri.roosen@ginzinger.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

A device might not have an ops structure registered. This
patch fixes a null-prt dereference by checking ops before dereferencing
it.

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 drivers/rpmsg/rpmsg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 600f5f9..0c48452 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -429,7 +429,7 @@ static int rpmsg_dev_probe(struct device *dev)
 		goto out;
 	}
 
-	if (rpdev->ops->announce_create)
+	if (rpdev->ops && rpdev->ops->announce_create)
 		err = rpdev->ops->announce_create(rpdev);
 out:
 	return err;
-- 
2.1.4
