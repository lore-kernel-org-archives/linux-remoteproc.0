Return-Path: <>
From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 2/4] rpmsg: drop owner assignment from rpmsg_drivers
Date: Wed, 4 May 2016 17:01:37 -0500
Message-ID: <1462399299-28159-2-git-send-email-afd@ti.com>
In-Reply-To: <1462399299-28159-1-git-send-email-afd@ti.com>
References: <1462399299-28159-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

An rpmsg_driver does not need to set an owner, it will be populated by
the driver core.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/rpmsg.txt             | 1 -
 samples/rpmsg/rpmsg_client_sample.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
index f7edc3a..1d88426 100644
--- a/Documentation/rpmsg.txt
+++ b/Documentation/rpmsg.txt
@@ -249,7 +249,6 @@ MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
 
 static struct rpmsg_driver rpmsg_sample_client = {
 	.drv.name	= KBUILD_MODNAME,
-	.drv.owner	= THIS_MODULE,
 	.id_table	= rpmsg_driver_sample_id_table,
 	.probe		= rpmsg_sample_probe,
 	.callback	= rpmsg_sample_cb,
diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index 59b1344..82ed288 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -77,7 +77,6 @@ MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_sample_id_table);
 
 static struct rpmsg_driver rpmsg_sample_client = {
 	.drv.name	= KBUILD_MODNAME,
-	.drv.owner	= THIS_MODULE,
 	.id_table	= rpmsg_driver_sample_id_table,
 	.probe		= rpmsg_sample_probe,
 	.callback	= rpmsg_sample_cb,
-- 
2.8.2
