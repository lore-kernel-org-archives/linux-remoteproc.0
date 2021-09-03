Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D09C43217
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 09:52:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7D5560F9C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 09:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348951AbhICJxb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Sep 2021 05:53:31 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37536 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348943AbhICJxb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Sep 2021 05:53:31 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E2BC203044;
        Fri,  3 Sep 2021 11:52:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E63BA20304B;
        Fri,  3 Sep 2021 11:52:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 95918183AC8B;
        Fri,  3 Sep 2021 17:52:28 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v3 3/4] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc binding document
Date:   Fri,  3 Sep 2021 17:29:36 +0800
Message-Id: <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Define the compatible string and properties needed by imx_dsp_rproc
driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../remoteproc/fsl,imx-dsp-rproc.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
new file mode 100644
index 000000000000..98e70a47705a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
@@ -0,0 +1,131 @@
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
+  This binding provides support for DSP processors found on i.MX family of SoCs
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
+    items:
+      - description: core clock
+      - description: internal memory clock
+      - description: debug interface clock
+      - description: network interconnect clock
+      - description: message unit clock
+
+  clock-names:
+    description: |
+      List of clock names for the remote processor.
+    minItems: 1
+    items:
+      - const: core
+      - const: ocram
+      - const: debug
+      - const: nic
+      - const: mu
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
+      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+      clock-names = "core", "ocram", "debug";
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

