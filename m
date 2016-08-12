Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:54314 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752630AbcHLXmg (ORCPT
	<rfc822;linux-remoteproc@vger.kernel.org>);
	Fri, 12 Aug 2016 19:42:36 -0400
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 13/13] samples/rpmsg: add support for multiple instances
Date: Fri, 12 Aug 2016 18:42:28 -0500
Message-ID: <20160812234228.39731-14-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The current rpmsg_client_sample is a very simple example and
is not designed to handle multiple instances. Add support for
multiple instances, so that the same number of pings are sent
to each instance. The instances can be on one or multiple
remote processors.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 samples/rpmsg/rpmsg_client_sample.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index d0e249c90668..7e17d1c0aaf2 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -24,19 +24,24 @@
 #define MSG		"hello world!"
 #define MSG_LIMIT	100
 
+struct instance_data {
+	int rx_count;
+};
+
 static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
 						void *priv, u32 src)
 {
 	int ret;
-	static int rx_count;
+	struct instance_data *idata = dev_get_drvdata(&rpdev->dev);
 
-	dev_info(&rpdev->dev, "incoming msg %d (src: 0x%x)\n", ++rx_count, src);
+	dev_info(&rpdev->dev, "incoming msg %d (src: 0x%x)\n",
+		 ++idata->rx_count, src);
 
 	print_hex_dump(KERN_DEBUG, __func__, DUMP_PREFIX_NONE, 16, 1,
 		       data, len,  true);
 
 	/* samples should not live forever */
-	if (rx_count >= MSG_LIMIT) {
+	if (idata->rx_count >= MSG_LIMIT) {
 		dev_info(&rpdev->dev, "goodbye!\n");
 		return;
 	}
@@ -50,10 +55,17 @@ static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
 static int rpmsg_sample_probe(struct rpmsg_channel *rpdev)
 {
 	int ret;
+	struct instance_data *idata;
 
 	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
 					rpdev->src, rpdev->dst);
 
+	idata = devm_kzalloc(&rpdev->dev, sizeof(*idata), GFP_KERNEL);
+	if (!idata)
+		return -ENOMEM;
+
+	dev_set_drvdata(&rpdev->dev, idata);
+
 	/* send a message to our remote processor */
 	ret = rpmsg_send(rpdev, MSG, strlen(MSG));
 	if (ret) {
-- 
2.9.0

