Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB88C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 09:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5BCD60F9C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 09:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348945AbhICJxa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Sep 2021 05:53:30 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37470 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348938AbhICJxa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Sep 2021 05:53:30 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 510D6203045;
        Fri,  3 Sep 2021 11:52:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 18836203044;
        Fri,  3 Sep 2021 11:52:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5AAD3183AC89;
        Fri,  3 Sep 2021 17:52:27 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v3 2/4] remoteproc: imx_rproc: Add IMX_RPROC_SCU_API method
Date:   Fri,  3 Sep 2021 17:29:35 +0800
Message-Id: <1630661377-31244-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On i.MX8QM and i.MX8QXP, most devices are controlled
by System Control Unit, so add IMX_RPROC_SCU_API
method for these platform.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_rproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 23d8e808d27f..1c7e2127c758 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -22,6 +22,8 @@ enum imx_rproc_method {
 	IMX_RPROC_MMIO,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
+	/* Through System Control Unit API */
+	IMX_RPROC_SCU_API,
 };
 
 struct imx_rproc_dcfg {
-- 
2.17.1

