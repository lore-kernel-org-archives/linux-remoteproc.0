Return-Path: <SRS0=6FrS=AY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A76C433E8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 13:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF44F206F0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 13:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mm7n4KSQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgGMN3u (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Jul 2020 09:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbgGMN3t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 09:29:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B262C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k6so16551080wrn.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2020 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1L4Fd0ydGXB1tLJq49wHyxg/8oVp3tIdrwadCHK6MBc=;
        b=Mm7n4KSQrzuIzL5V5oAkygyQJZK8zxZPRPWSKVqHAT9JGioQsWMBEhYVvUKCdvZ5qk
         nLEktNB+4PQs+YC1AYQ40rQPY1h/mssBV76kXxTD9eS2QLXV4HhBsMuTNBI1KaNCq3nH
         ElPJHUjYX36UTba60MYN5rdXsYfuPYcBEzH5Zw+374d1AZ5YlG0ZqAawK1AgYum1b4e1
         XwIfBVLmSLzPzyGRur2HJh8m9v4Ri3z1GoUxesRy0e73/rvpIXw7LyWY/N8mif+ZuscX
         ypm/lS84F5l4VhYEeo49NcBQJ2dealR6xBuOF3ezU1P1edoaMRebYsEhc6eJldWcsEdS
         Kdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1L4Fd0ydGXB1tLJq49wHyxg/8oVp3tIdrwadCHK6MBc=;
        b=SXaU3vJg/rsWI8nP0MZdsDUZ1ctcPw++ScfHNtdaE7QWMq2ckucRLPIXjZJkvifvuJ
         shUAIJEKUdOqtauwQkwtQsP2dn3u6m+FztQKKNIVdtFxs+oRNIM1i2PovGVDg5xv4ZeW
         NcNcQltiGY7g9BCGHnH3tx5psixy4AvqpP9n9ClumTjoVvp9RSpGb78XAMW9o96no6V8
         UDZBr8as8XLe9cU8Wz0ziZHeCsqhEPEGUf/hP/W9qAcZj4gZFDV4o/h28hKuEa81x6L3
         tfDPl4li7hNjWwNOAnmMvDnJRr/3wDmXniLPuabsTKsvkbo1x/IK9TlOdXTnA8XRX3Uw
         o7EQ==
X-Gm-Message-State: AOAM533rd4CzqS8aoVRNk/0BatPzrrkm7Fbe+8EhEyhI/WBScFcIFcVq
        yfjem7hpQOgsMrLAreOE+YWo5Q==
X-Google-Smtp-Source: ABdhPJwzZlcUKbMf7yvv/ipKPBNj0GCeAedKQcrzHWzFJjvtRWFrPMYVOGGBdMWDjOPRwHglztjNig==
X-Received: by 2002:adf:e90d:: with SMTP id f13mr75056890wrm.146.1594646986821;
        Mon, 13 Jul 2020 06:29:46 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j14sm23896642wrs.75.2020.07.13.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 06:29:46 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 6/6] ARM64: mt8183: Add support of APU to mt8183
Date:   Mon, 13 Jul 2020 15:29:27 +0200
Message-Id: <20200713132927.24925-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713132927.24925-1-abailon@baylibre.com>
References: <20200713132927.24925-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1e03c849dc5d..6a2e9ee0b566 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -720,12 +720,54 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		vpu0: vpu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
+			reg-names = "mmio";
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE0_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+			memory-region = <&vpu_ram>;
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		vpu1: vpu@0x19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			reg-names = "mmio";
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU2O>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>,
+				 <&iommu M4U_PORT_IMG_IPU2I>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE1>;
+			memory-region = <&vpu_ram>;
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.26.2

