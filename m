Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B33BC4320E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3051861168
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240040AbhHSPMm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Aug 2021 11:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240009AbhHSPMl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Aug 2021 11:12:41 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBB0C061756
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q6so9645834wrv.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfmux6GbWpn+VVXwtphpKIQmrZ/1kSy6Z3ImiMnN0Vs=;
        b=lcrAdC4OCKjmyR31VaQQFRKzwChBAkCfFWMkE0MAk2DfBx/PEY4yq6AguEujOhfmGB
         GgJLswHgOOdbTwe4nKJLbK+BW26/cqHhkn515aEdgjvXwKYvQauIl4Y+U/N2qwGFxjWQ
         VHFWanf1ruuGk/6cWgJvpvBSsZ0DZ9cuv13JJdFTh0CA7Iv2UzjZWKvVjB+AJDWzkWGh
         cqayulxEPXRE7KKDFR6+GAr/i7KMotMmTVTGEVWk1tRuQkYvkpwDgu3zIa0TAhT+ucXp
         Gygyz3zYsq5iylKXQCz14eLv84ASVt41wthP3N99qON3iczcDBqVNUospE/wv3my8gV/
         0rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfmux6GbWpn+VVXwtphpKIQmrZ/1kSy6Z3ImiMnN0Vs=;
        b=nIK5q73bAq145OsWCEQAjdV6A6hlLIZwjcl77O7AkjJW61/n9LDtrDIZpLzfFnER+D
         OFzVvcyxhV9mAs0i1JKLMpJopC3lgEn2TmvVXCuZ41IKgf47hbaqU9fMBRkCkvhrow4r
         vN/vVy5zAaqpPF4Lsqxi1cS9D96aju+AdHDRyRrDa2Kia8grgHTTgT9jJTvl6tj3m9Oy
         zveMtp+htujNdY/+PGTEPDRG52ZA0v3JriuXYlfcFkOMSgqZWZDXm0kPlCDM4dplVN3R
         RaEugU0ugT6lx9PPTavwnaY6oL+/zVj5ZXyEkTFOv4kUTaXp5CzOEjbAv0blRv+wb2+4
         1UTA==
X-Gm-Message-State: AOAM530huGA1N1Y4HyjnELhhjvh35EzmkcqhefFoVWAcrl1TNeA7cUve
        SFEWTNPvQe47dbBvrHgR3lAyUw==
X-Google-Smtp-Source: ABdhPJx2N0q5v4rzhnN/p1JmrlgjdcQCVDLdFnedbIjSQmrnlyco9hMsvsCBJZpTRLBPR2NMskz3Lw==
X-Received: by 2002:adf:d227:: with SMTP id k7mr4458318wrh.285.1629385923673;
        Thu, 19 Aug 2021 08:12:03 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 08:12:03 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com,
        khilman@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 1/4] dt bindings: remoteproc: Add bindings for MT8183 APU
Date:   Thu, 19 Aug 2021 17:13:37 +0200
Message-Id: <20210819151340.741565-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This adds dt bindings for the APU present in the MT8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
new file mode 100644
index 0000000000000..d5da6be66610c
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: "http://devicetree.org/schemas/remoteproc/mtk,apu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MT8183 AI Processor Unit (APU) a.k.a. Vision Processor Unit (VPU)
+
+description:
+  This document defines the binding for the APU, a co-processor that could
+  offload the CPU for machine learning and neural network.
+
+maintainers:
+  - Alexandre Bailon <abailon@bayLibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8183-apu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      Three clocks are expected for AXI, IPU and JTAG.
+      The JTAG clock seems to be required to run the DSP,
+      even when JTAG is not in use."
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ipu
+      - const: jtag
+
+  iommus:
+    maxItems: 3
+
+  memory-region:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  pinctrl:
+    description: pinctrl handles, required to configure pins for JTAG.
+
+  pinctrl-names:
+    items:
+      - const: jtag
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+    #include <dt-bindings/power/mt8183-power.h>
+
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      vdev0vring0: vdev0vring0 {
+        compatible = "shared-dma-pool";
+        size = <0 0x00008000>;
+        no-map;
+      };
+
+      vdev0vring1: vdev0vring1 {
+        compatible = "shared-dma-pool";
+        size = <0 0x00008000>;
+        no-map;
+      };
+
+      vdev0buffer: vdev0buffer {
+        compatible = "shared-dma-pool";
+        size = <0 0x00100000>;
+        no-map;
+      };
+    };
+
+    apu0: apu@19100000 {
+      compatible = "mediatek,mt8183-apu";
+      reg = <0x19180000 0x14000>;
+      interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+      iommus = <&iommu M4U_PORT_IMG_IPUO>,
+         <&iommu M4U_PORT_IMG_IPU3O>,
+         <&iommu M4U_PORT_IMG_IPUI>;
+
+      clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+         <&ipu_core0 CLK_IPU_CORE0_IPU>,
+         <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+      clock-names = "axi", "ipu", "jtag";
+
+      power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>;
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+    };
+...
-- 
2.31.1

