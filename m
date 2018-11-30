Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] rpmsg: core: make rpmsg bus DMA capable
Date: Fri, 30 Nov 2018 11:20:49 +0000
Message-Id: <20181130112049.14444-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Many of the rpmsg clients like audio, fastrpc drivers need to allocate
dma memory. Make this bus DMA capable so that the child devices can
use dma apis.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 8122807db380..33881e70f478 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -510,6 +510,7 @@ static struct bus_type rpmsg_bus = {
 	.uevent		= rpmsg_uevent,
 	.probe		= rpmsg_dev_probe,
 	.remove		= rpmsg_dev_remove,
+	.dma_configure	= platform_dma_configure,
 };
 
 int rpmsg_register_device(struct rpmsg_device *rpdev)
-- 
2.19.2
