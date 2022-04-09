Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80B1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Apr 2022 06:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240081AbiDIGaJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 9 Apr 2022 02:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiDIGaI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 Apr 2022 02:30:08 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACA729C8C
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Apr 2022 23:27:59 -0700 (PDT)
Received: from pop-os.home ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id d4Zgn0yPQNEW1d4ZgnPvBC; Sat, 09 Apr 2022 08:27:57 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 09 Apr 2022 08:27:57 +0200
X-ME-IP: 86.243.180.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     angelogioacchino.delregno@collabora.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Date:   Sat,  9 Apr 2022 08:27:54 +0200
Message-Id: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
to free it explicitly in the remove function.

Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1 -> v2:
	- add missing Signed-off-by
---
 drivers/remoteproc/mtk_scp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 38609153bf64..4a0e6c4bc6f4 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -877,7 +877,6 @@ static int scp_remove(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-	rproc_free(scp->rproc);
 
 	return 0;
 }
-- 
2.32.0

