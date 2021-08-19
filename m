Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEE8C432BE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 935A160EFE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240231AbhHSPMr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Aug 2021 11:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240213AbhHSPMp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Aug 2021 11:12:45 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D8BC0617AF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id z9so9593536wrh.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+6dCR2Sy8mCxrAUvzFLxowXAhP/YWerIYxie+COUDA8=;
        b=D+qk5dlqFo0jmmTxYR8xlL6FOklZcMqO5iPvRvAlfi5N/HEdno4ZYQBdAVJuXM+B2Z
         befESi5L9nqCWmXPT2+GfckVRrmOz8Bbs2IEhGvuf7RnfBA9/trCPrWm2ufAJekGfAS+
         qGaLA7OY3GFofgLlHEIA8uwEN5uPbJ+AEpXa9Tb63g044wljrq4tC5p6UkndlVP2jo4m
         XigVJmtNRMkNsRG4xx5FUx18cdKI6sNA/VH2oQ+nxQb2eBykWlJZbYUeUAsjag0f20Qn
         2/HgNE8vZi/S2wROXbBzXKiGbw28ZrHVO1U0QixHX+oXyHMD9z9OiCM2yJyJRVWnp/Ku
         Frhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+6dCR2Sy8mCxrAUvzFLxowXAhP/YWerIYxie+COUDA8=;
        b=a/oGyxZr+x2mWeeHqUd9Q39lhjqc8BMk/euyJfUJYk2Nrk9DJ5uYcyYmzyYqb0K816
         pPpjce91FzkGUmZNcAZVGtwMM+7lc0Sf+2J1gcD5oAT2DR3WV2x6177Wbzu9A/R6Dxmz
         tvW1dHUv8xJ1rYfa8l0tWHpO9hVRfVJcayG9vWnks8VTyT7l3O+boVm+UYzHDRTU3rm/
         5axxUS3eC6hd1hj8PMrpcIdlJd3pFY4apir4s+kZ/Ly2hF1HugIyTy5X/tzg3y+aJNLl
         9jmMxkn4Hk+vuu7m5qt5z6OcmnWFQc+hKeVhG/jPhbjZuUzIMjZtymphYt9HMQJIM49h
         F+Ow==
X-Gm-Message-State: AOAM533FYyB+/g1kHY7PBBsDwW074hNlVhJxKB1yUZgOmQcoXGIp+brq
        ZR5wbnoa0tn8k6ckr2Y6d325cw==
X-Google-Smtp-Source: ABdhPJx+KruGbNeoNNy4aHQddQo1BqnAXWQBy1dX6kFWZdVEtQ3tSFx9ReF6fkb5oze+BzJ52AboeA==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr4484675wru.182.1629385927100;
        Thu, 19 Aug 2021 08:12:07 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 08:12:06 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com,
        khilman@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 4/4] ARM64: mt8183: Add support of APU to mt8183
Date:   Thu, 19 Aug 2021 17:13:40 +0200
Message-Id: <20210819151340.741565-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 48 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 40 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index ee912825cfc60..7fbed2b7bc6f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -37,6 +37,42 @@ scp_mem_reserved: scp_mem_region@50000000 {
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
 		};
+
+		vdev0vring0: vdev0vring0 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer {
+			compatible = "shared-dma-pool";
+			size = <0 0x00100000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev1buffer: vdev1buffer {
+			compatible = "shared-dma-pool";
+			size = <0 0x00100000>;
+			no-map;
+		};
 	};
 
 	leds {
@@ -381,3 +417,15 @@ &scp {
 &dsi0 {
 	status = "disabled";
 };
+
+&apu0 {
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+	status = "okay";
+};
+
+&apu1 {
+	memory-region = <&vdev1buffer>, <&vdev1vring0>, <&vdev1vring1>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c088..bf3f315ad3b2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1447,12 +1447,52 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		apu0: apu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
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
+			power-domains = <&spm MT8183_POWER_DOMAIN_VPU_CORE0>;
+
+			status = "disabled";
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		apu1: apu@19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_CAM_IPUO>,
+				 <&iommu M4U_PORT_CAM_IPU2O>,
+				 <&iommu M4U_PORT_CAM_IPU3O>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&spm MT8183_POWER_DOMAIN_VPU_CORE1>;
+
+			status = "disabled";
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.31.1

