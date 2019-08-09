Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] samples/rpmsg: Introduce a module parameter for message count
Date: Fri, 9 Aug 2019 11:27:10 -0500
Message-ID: <20190809162710.823-3-s-anna@ti.com>
In-Reply-To: <20190809162710.823-1-s-anna@ti.com>
References: <20190809162710.823-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The current rpmsg_client_sample uses a fixed number of messages to
be sent to each instance. This is currently set at 100. Introduce
an optional module parameter 'count' so that the number of messages
to be exchanged can be made flexible.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 samples/rpmsg/rpmsg_client_sample.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index b9a99e621a5c..ae5081662283 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -14,7 +14,9 @@
 #include <linux/rpmsg.h>
 
 #define MSG		"hello world!"
-#define MSG_LIMIT	100
+
+static int count = 100;
+module_param(count, int, 0644);
 
 struct instance_data {
 	int rx_count;
@@ -33,7 +35,7 @@ static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
 			     true);
 
 	/* samples should not live forever */
-	if (idata->rx_count >= MSG_LIMIT) {
+	if (idata->rx_count >= count) {
 		dev_info(&rpdev->dev, "goodbye!\n");
 		return 0;
 	}
-- 
2.22.0
