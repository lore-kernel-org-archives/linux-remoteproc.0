Return-Path: <baolin.wang@linaro.org>
Return-Path: <baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/4] hwspinlock: sprd: Check the return value of clk_prepare_enable()
Date: Fri, 27 Sep 2019 15:10:45 +0800
Message-Id: <b944d4a60b392fd9c72421a798281bf0134388ca.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1569567749.git.baolin.wang@linaro.org>
References: <cover.1569567749.git.baolin.wang@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

We must check the return value of clk_prepare_enable() to make sure the
hardware spinlock controller can be enabled successfully, otherwise we
should return error.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/hwspinlock/sprd_hwspinlock.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 7a8534f..d210424 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -105,7 +105,9 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 		return PTR_ERR(sprd_hwlock->clk);
 	}
 
-	clk_prepare_enable(sprd_hwlock->clk);
+	ret = clk_prepare_enable(sprd_hwlock->clk);
+	if (ret)
+		return ret;
 
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
-- 
1.7.9.5
