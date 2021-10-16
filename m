Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231A1C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Oct 2021 06:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01AFC61108
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Oct 2021 06:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243676AbhJPGqm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Oct 2021 02:46:42 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:64328 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbhJPGqj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Oct 2021 02:46:39 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id bdQjmA0MmniuxbdQjmKDjp; Sat, 16 Oct 2021 08:44:30 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 16 Oct 2021 08:44:30 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, hongxing.zhu@nxp.com, peng.fan@nxp.com
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove function
Date:   Sat, 16 Oct 2021 08:44:28 +0200
Message-Id: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

'priv->workqueue' is destroyed in the error handling path of the probe but
not in the remove function.

Add the missing call to release some resources.

Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative. I'm not sure if the added function call is at
the right place in the remove function.
Review with care.
---
 drivers/remoteproc/imx_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ff8170dbbc3c..0a45bc0d3f73 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -804,6 +804,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_free_mbox(rproc);
+	destroy_workqueue(priv->workqueue);
 	rproc_free(rproc);
 
 	return 0;
-- 
2.30.2

