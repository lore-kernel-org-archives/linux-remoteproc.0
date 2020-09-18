Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FB3C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 15:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 204422084C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 15:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgIRPmG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:42:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42896 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRPmG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 11:42:06 -0400
X-Greylist: delayed 1051 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 11:42:06 EDT
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kJIFQ-000436-Jm; Fri, 18 Sep 2020 15:24:28 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Erin Lo <erin.lo@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc/mediatek: fix null pointer dereference on null scp pointer
Date:   Fri, 18 Sep 2020 16:24:28 +0100
Message-Id: <20200918152428.27258-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when pointer scp is null a dev_err is being called that
references the pointer which is the very thing we are trying to
avoid doing. Remove the extraneous error message to avoid this
issue.

Addresses-Coverity: ("Dereference after null check")
Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 3d3d87210ef2..58d1d7e571d6 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -30,10 +30,8 @@ int scp_ipi_register(struct mtk_scp *scp,
 		     scp_ipi_handler_t handler,
 		     void *priv)
 {
-	if (!scp) {
-		dev_err(scp->dev, "scp device is not ready\n");
+	if (!scp)
 		return -EPROBE_DEFER;
-	}
 
 	if (WARN_ON(id >= SCP_IPI_MAX) || WARN_ON(handler == NULL))
 		return -EINVAL;
-- 
2.27.0

