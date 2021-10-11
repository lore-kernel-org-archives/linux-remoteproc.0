Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0226FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 09:33:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC7D60F38
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 09:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235497AbhJKJfu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 05:35:50 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:44902 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235476AbhJKJfu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 05:35:50 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B824oX014133;
        Mon, 11 Oct 2021 11:33:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=4IZcyiEmJqJknYqY3HebfFSwzt2k+W5tkomkh6G8X1U=;
 b=CbpIgAnUR55EcjRZf1X0kVgjPWJoRIC618TZrDIDc9/hstdYIZNTKjMaAcVFmmEiA9ty
 9dfQFnqopE80XabEmUdrUQO0oB2f96ucYo2SLLksyD905bB5ncCtsbn0czgIAdKVlhva
 Y3k12HR74UnyQPep/lQwo+GEaNRfy1bAd2Tn8CScDYlIFp2g2JikFdq0xWSZvj5ZCtKg
 5fYwD0gSx56Oed3f5XEea04yInq+K+1GZQUR323V9PWI1wr8Ld7NrviGJQccj/DoWBHk
 Kx0EBNzHumqaUoR/4nNJwWMqX//70/k+xvWFkVdwgP8jY7A+iY9sUHj9WaeXKFzKKx/x qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmasq2kc3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 11:33:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5049510002A;
        Mon, 11 Oct 2021 11:33:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47C9E21B501;
        Mon, 11 Oct 2021 11:33:37 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct 2021 11:33:36
 +0200
From:   Fabien Dessenne <fabien.dessenne@foss.st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH] hwspinlock: stm32: enable clock at probe
Date:   Mon, 11 Oct 2021 11:33:26 +0200
Message-ID: <20211011093326.817797-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Set the clock during probe and keep its control during suspend / resume
operations.
This fixes an issue when CONFIG_PM is not set and where the clock is
never enabled.

Make use of devm_ functions to simplify the code.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 60 +++++++++++++++++----------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 3ad0ce0da4d9..6c3be33f3faf 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -54,8 +54,23 @@ static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.relax		= stm32_hwspinlock_relax,
 };
 
+static void stm32_hwspinlock_disable_clk(void *data)
+{
+	struct platform_device *pdev = data;
+	struct stm32_hwspinlock *hw = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
+
+	clk_disable_unprepare(hw->clk);
+}
+
 static int stm32_hwspinlock_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
 	size_t array_size;
@@ -66,41 +81,43 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return PTR_ERR(io_base);
 
 	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
-	hw = devm_kzalloc(&pdev->dev, sizeof(*hw) + array_size, GFP_KERNEL);
+	hw = devm_kzalloc(dev, sizeof(*hw) + array_size, GFP_KERNEL);
 	if (!hw)
 		return -ENOMEM;
 
-	hw->clk = devm_clk_get(&pdev->dev, "hsem");
+	hw->clk = devm_clk_get(dev, "hsem");
 	if (IS_ERR(hw->clk))
 		return PTR_ERR(hw->clk);
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
+	ret = clk_prepare_enable(hw->clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare_enable clock\n");
+		return ret;
+	}
+
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_put(dev);
 
 	platform_set_drvdata(pdev, hw);
-	pm_runtime_enable(&pdev->dev);
 
-	ret = hwspin_lock_register(&hw->bank, &pdev->dev, &stm32_hwspinlock_ops,
-				   0, STM32_MUTEX_NUM_LOCKS);
+	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
+	if (ret) {
+		dev_err(dev, "Failed to register action\n");
+		return ret;
+	}
 
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
+	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
+		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
 
-static int stm32_hwspinlock_remove(struct platform_device *pdev)
-{
-	struct stm32_hwspinlock *hw = platform_get_drvdata(pdev);
-	int ret;
+	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
+					0, STM32_MUTEX_NUM_LOCKS);
 
-	ret = hwspin_lock_unregister(&hw->bank);
 	if (ret)
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-
-	pm_runtime_disable(&pdev->dev);
+		dev_err(dev, "Failed to register hwspinlock\n");
 
-	return 0;
+	return ret;
 }
 
 static int __maybe_unused stm32_hwspinlock_runtime_suspend(struct device *dev)
@@ -135,7 +152,6 @@ MODULE_DEVICE_TABLE(of, stm32_hwpinlock_ids);
 
 static struct platform_driver stm32_hwspinlock_driver = {
 	.probe		= stm32_hwspinlock_probe,
-	.remove		= stm32_hwspinlock_remove,
 	.driver		= {
 		.name	= "stm32_hwspinlock",
 		.of_match_table = stm32_hwpinlock_ids,
-- 
2.25.1

