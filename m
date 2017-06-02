Return-Path: <Henri.Roosen@ginzinger.com>
From: Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH] rpmsg: cleanup incorrect function in dev_err message
Date: Fri, 2 Jun 2017 13:36:04 +0200
Message-ID: <1496403365-32328-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-remoteproc@vger.kernel.org
Cc: Henri Roosen <henri.roosen@ginzinger.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Trivial cleanup for incorrect function in dev_err message

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 0ca2ccc..0b5d0d3 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -390,7 +390,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	ret = device_add(dev);
 	if (ret) {
-		dev_err(dev, "device_register failed: %d\n", ret);
+		dev_err(dev, "device_add failed: %d\n", ret);
 		put_device(dev);
 	}
 
@@ -505,7 +505,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 
 	ret = device_add(dev);
 	if (ret) {
-		dev_err(&rpdev->dev, "device_register failed: %d\n", ret);
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
 		put_device(dev);
 	}
 
-- 
2.1.4
