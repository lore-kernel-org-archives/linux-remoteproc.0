Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CA2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Aug 2021 07:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 710D1610E8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Aug 2021 07:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhHYHwO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 25 Aug 2021 03:52:14 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40898 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231687AbhHYHwN (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Aug 2021 03:52:13 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 29ADD20264D;
        Wed, 25 Aug 2021 09:51:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB1F7202E5C;
        Wed, 25 Aug 2021 09:51:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 46985183AC72;
        Wed, 25 Aug 2021 15:51:21 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc binding document
Date:   Wed, 25 Aug 2021 15:28:35 +0800
Message-Id: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Define the compatible string and properties needed by imx_dsp_rproc
driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- add items for clock-names
- change syscon to fsl,dsp-ctrl 

 .../remoteproc/fsl,imx-dsp-rproc.yaml         | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
new file mode 100644
index 000000000000..edf6e4b8d7bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/fsl,imx-dsp-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX DSP Remoteproc Devices
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  This binding provides support for DSP processors found on i.mX family of SoCs
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-hifi4
+      - fsl,imx8qm-hifi4
+      - fsl,imx8mp-hifi4
+      - fsl,imx8ulp-hifi4
+
+  clocks:
+    description:
+      Main functional clock for the remote processor
+    minItems: 1
+    maxItems: 32
+
+  clock-names:
+    description: |
+      List of clock names for the remote processor.
+      dsp_clkx for clocks of dsp itself.
+      per_clkx for clocks of peripherals used by dsp.
+    minItems: 1
+    maxItems: 26
+    items:
+      - const: dsp_clk1
+      - const: dsp_clk2
+      - const: dsp_clk3
+      - const: dsp_clk4
+      - const: dsp_clk5
+      - const: dsp_clk6
+      - const: dsp_clk7
+      - const: dsp_clk8
+      - const: per_clk1
+      - const: per_clk2
+      - const: per_clk3
+      - const: per_clk4
+      - const: per_clk5
+      - const: per_clk6
+      - const: per_clk7
+      - const: per_clk8
+      - const: per_clk9
+      - const: per_clk10
+      - const: per_clk11
+      - const: per_clk12
+      - const: per_clk13
+      - const: per_clk14
+      - const: per_clk15
+      - const: per_clk16
+      - const: per_clk17
+      - const: per_clk18
+
+  fsl,dsp-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to syscon block which provide access for processor enablement
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
+      (see mailbox/fsl,mu.yaml)
+    minItems: 1
+    maxItems: 3
+
+  firmware-name:
+    description: |
+      Default name of the firmware to load to the remote processor.
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev buffer,
+      resource table, vring region and others used by remote processor.
+    minItems: 1
+    maxItems: 32
+
+  reg:
+    description: |
+      Address space for any remoteproc memories present on the SoC.
+
+  power-domains:
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+  - clocks
+  - clock-names
+  - firmware-name
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    dsp_reserved: dsp@92400000 {
+      reg = <0x92400000 0x1000000>;
+      no-map;
+    };
+    dsp_vdev0vring0: vdev0vring0@942f0000 {
+      reg = <0x942f0000 0x8000>;
+      no-map;
+    };
+    dsp_vdev0vring1: vdev0vring1@942f8000 {
+      reg = <0x942f8000 0x8000>;
+      no-map;
+    };
+    dsp_vdev0buffer: vdev0buffer@94300000 {
+      compatible = "shared-dma-pool";
+      reg = <0x94300000 0x100000>;
+      no-map;
+    };
+
+    dsp: dsp@3b6e8000 {
+      compatible = "fsl,imx8mp-hifi4";
+      reg = <0x3B6E8000 0x88000>;
+      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+      clock-names = "dsp_clk1", "dsp_clk2", "dsp_clk3";
+      firmware-name = "imx/dsp/hifi4.bin";
+      power-domains = <&audiomix_pd>;
+      mbox-names = "tx", "rx", "rxdb";
+      mboxes = <&mu2 0 0>,
+               <&mu2 1 0>,
+               <&mu2 3 0>;
+      memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+                      <&dsp_vdev0vring1>, <&dsp_reserved>;
+      fsl,dsp-ctrl = <&audio_blk_ctrl>;
+    };
-- 
2.17.1

