Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga07-in.huawei.com ([45.249.212.35]:46278 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729771AbfACGz7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Jan 2019 01:55:59 -0500
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] hwspinlock: fix return value check in stm32_hwspinlock_probe()
Date: Thu, 3 Jan 2019 07:02:30 +0000
Message-ID: <1546498950-105456-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: f24fcff1d267 ("hwspinlock: add STM32 hwspinlock device")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 34a8e00..4418392 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -57,8 +57,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	io_base = devm_ioremap_resource(&pdev->dev, res);
-	if (!io_base)
-		return -ENOMEM;
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw) + array_size, GFP_KERNEL);
