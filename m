Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: srinivas.kandagatla@linaro.org
Subject: [PATCH 2/3] rpmsg: core: make rpmsg bus DMA capable
Date: Fri,  2 Mar 2018 14:55:30 +0000
Message-Id: <20180302145531.20463-3-srinivas.kandagatla@linaro.org>
In-Reply-To: <20180302145531.20463-1-srinivas.kandagatla@linaro.org>
References: <20180302145531.20463-1-srinivas.kandagatla@linaro.org>
To: will.deacon@arm.com, robin.murphy@arm.com, bjorn.andersson@linaro.org
Cc: joro@8bytes.org, ohad@wizery.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Many of the rpmsg clients like audio drivers need to allocate
dma memory. Make this bus DMA capable so that the child devices
can use dma apis.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e84c71f8d6ab..540a3f3567b8 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -472,6 +472,7 @@ struct bus_type rpmsg_bus = {
 	.uevent		= rpmsg_uevent,
 	.probe		= rpmsg_dev_probe,
 	.remove		= rpmsg_dev_remove,
+	.force_dma	= true,
 };
 EXPORT_SYMBOL(rpmsg_bus);
 
-- 
2.15.1
