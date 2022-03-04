Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD2BC4321E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Mar 2022 16:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240729AbiCDQQX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Mar 2022 11:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbiCDQQW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Mar 2022 11:16:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B4F1B8CBE
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Mar 2022 08:15:33 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id b5so13447821wrr.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Mar 2022 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=16aGvyY6fmPhhVYfQXbNCxfZJxOVo7nnrPOm+3Luipg=;
        b=kN8p92NuWAbYqs8bwZlnLzwcZDbsVEWD4vm0t5XrNfLzL7aH0vHtHEcRtcG0C/1Uu7
         9hdsGCdU1rbTrLacXL/Ft91zYh/W1JDQIBszrzrit1TsPj5F50AHGLBhangCud91sOb+
         0xmv5DAhd0EuvQ6glDl85z8F4M80x30xSzPfnpcNAC1bot0hw0gQVwnEHiXptu+KFEVT
         KtTKvHh8xyMPof3zdp+DP48Co+7DZGEpI3DZVEPQvWJu+Y5HaN7E9H5vK0HfJYoUpwXb
         uu+Xszyy+It68nNjX8tuaNzrkWGn+hyALM66vu0FpOGsNNU/MyaZYPtYRPeDWog4idkA
         Hajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16aGvyY6fmPhhVYfQXbNCxfZJxOVo7nnrPOm+3Luipg=;
        b=bB8J1DH/rwiQM56NK4kqJ4ZGXqv2NDXOgGc7z26oJyLX/ZxwQZExjG6pNZ4BeLumPY
         DPxes1lyMZwJ9ZVbf/ieHG83Gwiv3XUX9XwtyUuVfNIfl3xIFCqLm7msDljkb/3Y+dtH
         DrxQtJb17IKfpbFl4dKuVrw1qtXDtgFd2RnyMP+aDvrsAAgzBELSSQl1LAWg2yAHPQfI
         zNSyGuX1P+ocferBJ7zrbIBpAOIse68JENEW4Li+0zeGZ/aKe4aUps5LW+X1jawH7yMf
         wE2AZVEisfyTFn04VzgSj2YEYgDpFSSwWlwWEH3Zj3/OnMQKbkhs6V/lm8Db3RQlckOw
         +o1A==
X-Gm-Message-State: AOAM533H7MYgDrPUHLSvvZpukKOwePv9/JOkSbfLICDrpZVpJJuwEVXV
        vkOVAiAun5NFreO4LbOS2478Uw==
X-Google-Smtp-Source: ABdhPJwD4uW+a+b6q8YWzK9KzYjz7dwuWWKnSwI9jSPWBcToFrXnKiJsKNXtvqLT5eUBLCFLIqBmsg==
X-Received: by 2002:adf:ed0c:0:b0:1f0:63a5:36aa with SMTP id a12-20020adfed0c000000b001f063a536aamr4767846wro.588.1646410532349;
        Fri, 04 Mar 2022 08:15:32 -0800 (PST)
Received: from xps-9300.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:15:31 -0800 (PST)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.or
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, khilman@baylibre.com,
        Julien STEPHAN <jstephan@baylibre.com>,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 6/7] remoteproc: mtk-apu: Add support of MT8365
Date:   Fri,  4 Mar 2022 17:15:13 +0100
Message-Id: <20220304161514.994128-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Julien STEPHAN <jstephan@baylibre.com>

This adds support of APU available in the MT8365.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/mtk_apu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
index deec51b86ba5..57dd73c63d3f 100644
--- a/drivers/remoteproc/mtk_apu.c
+++ b/drivers/remoteproc/mtk_apu.c
@@ -96,6 +96,24 @@ static const struct mtk_apu_conf mt8183_conf = {
 	.clk_names = mt8183_clk_names
 };
 
+static const char * const mt8365_clk_names[] = {
+	"if_ck",
+	"edma",
+	"ahb",
+	"axi",
+	"ipu",
+	"jtag",
+	"smi_cam",
+	"ifr_apu_axi",
+};
+
+static const struct mtk_apu_conf mt8365_conf = {
+	.core_default0 = BIT(26) | BIT(20),
+	.core_default1 = BIT(3) | BIT(7),
+	.num_clks = ARRAY_SIZE(mt8365_clk_names),
+	.clk_names = mt8365_clk_names
+};
+
 static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
 {
 	struct mtk_apu_rproc *apu_rproc = rproc->priv;
@@ -633,6 +651,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_apu_rproc_of_match[] = {
 	{ .compatible = "mediatek,mt8183-apu", .data = &mt8183_conf },
+	{ .compatible = "mediatek,mt8365-apu", .data = &mt8365_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_apu_rproc_of_match);
-- 
2.34.1

