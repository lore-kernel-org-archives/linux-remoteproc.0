Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:7563 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751462AbdJKKoU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 11 Oct 2017 06:44:20 -0400
From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH] remoteproc: imx_rproc: fix return value check in imx_rproc_addr_init()
Date: Wed, 11 Oct 2017 10:48:44 +0000
Message-ID: <1507718924-127469-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In case of error, the function devm_ioremap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should
be replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/remoteproc/imx_rproc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 612d914..fc38916 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -269,10 +269,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
-		if (IS_ERR(priv->mem[b].cpu_addr)) {
+		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "devm_ioremap_resource failed\n");
-			err = PTR_ERR(priv->mem[b].cpu_addr);
-			return err;
+			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
 		priv->mem[b].size = att->size;

