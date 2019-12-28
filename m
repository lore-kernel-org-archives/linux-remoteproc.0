Return-Path: <tiny.windzz@gmail.com>
Return-Path: <tiny.windzz@gmail.com>
From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] hwspinlock: stm32: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 19:15:41 +0000
Message-Id: <20191228191541.26999-1-tiny.windzz@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Yangtao Li <tiny.windzz@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index c8eacf4f9692..3ad0ce0da4d9 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -58,12 +58,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	struct resource *res;
 	size_t array_size;
 	int i, ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(&pdev->dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-- 
2.17.1
