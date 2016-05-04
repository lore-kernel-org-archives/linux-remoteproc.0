Return-Path: <>
From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 4/4] rpmsg: use module_rpmsg_driver in existing drivers and examples
Date: Wed, 4 May 2016 13:34:15 -0500
Message-ID: <1462386855-17381-4-git-send-email-afd@ti.com>
In-Reply-To: <1462386855-17381-1-git-send-email-afd@ti.com>
References: <1462386855-17381-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Existing drivers and examples are updated to use the
module_rpmsg_driver helper macro.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/rpmsg.txt             | 14 +-------------
 samples/rpmsg/rpmsg_client_sample.c | 13 +------------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
index 1d88426..b19700c 100644
--- a/Documentation/rpmsg.txt
+++ b/Documentation/rpmsg.txt
@@ -202,7 +202,6 @@ with the payload of the inbound message).
      a pointer to a previously-registered rpmsg_driver struct.
      Returns 0 on success, and an appropriate error value on failure.
 
-
 3. Typical usage
 
 The following is a simple rpmsg driver, that sends an "hello!" message
@@ -254,18 +253,7 @@ static struct rpmsg_driver rpmsg_sample_client = {
 	.callback	= rpmsg_sample_cb,
 	.remove		= rpmsg_sample_remove,
 };
-
-static int __init init(void)
-{
-	return register_rpmsg_driver(&rpmsg_sample_client);
-}
-module_init(init);
-
-static void __exit fini(void)
-{
-	unregister_rpmsg_driver(&rpmsg_sample_client);
-}
-module_exit(fini);
+module_rpmsg_driver(rpmsg_sample_client);
 
 Note: a similar sample which can be built and loaded can be found
 in samples/rpmsg/.
diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index 82ed288..d0e249c9 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -82,18 +82,7 @@ static struct rpmsg_driver rpmsg_sample_client = {
 	.callback	= rpmsg_sample_cb,
 	.remove		= rpmsg_sample_remove,
 };
-
-static int __init rpmsg_client_sample_init(void)
-{
-	return register_rpmsg_driver(&rpmsg_sample_client);
-}
-module_init(rpmsg_client_sample_init);
-
-static void __exit rpmsg_client_sample_fini(void)
-{
-	unregister_rpmsg_driver(&rpmsg_sample_client);
-}
-module_exit(rpmsg_client_sample_fini);
+module_rpmsg_driver(rpmsg_sample_client);
 
 MODULE_DESCRIPTION("Remote processor messaging sample client driver");
 MODULE_LICENSE("GPL v2");
-- 
2.8.2
