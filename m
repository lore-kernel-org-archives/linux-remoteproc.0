Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] samples/rpmsg: Replace print_hex_dump() with print_hex_dump_debug()
Date: Fri, 9 Aug 2019 11:27:09 -0500
Message-ID: <20190809162710.823-2-s-anna@ti.com>
In-Reply-To: <20190809162710.823-1-s-anna@ti.com>
References: <20190809162710.823-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Replace the raw print_hex_dump() call in the rpmsg_sample_cb() function
with the equivalent print_hex_dump_debug() better suited for dynamic
debug. This switch allows flexibility of controlling this trace through
dynamic debug when enabled.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 samples/rpmsg/rpmsg_client_sample.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index 2a0695573b47..b9a99e621a5c 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -29,8 +29,8 @@ static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
 	dev_info(&rpdev->dev, "incoming msg %d (src: 0x%x)\n",
 		 ++idata->rx_count, src);
 
-	print_hex_dump(KERN_DEBUG, __func__, DUMP_PREFIX_NONE, 16, 1,
-		       data, len,  true);
+	print_hex_dump_debug(__func__, DUMP_PREFIX_NONE, 16, 1, data, len,
+			     true);
 
 	/* samples should not live forever */
 	if (idata->rx_count >= MSG_LIMIT) {
-- 
2.22.0
