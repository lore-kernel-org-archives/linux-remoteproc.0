Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AAAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 26 Sep 2021 03:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AADC6115C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 26 Sep 2021 03:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhIZDcu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 25 Sep 2021 23:32:50 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58242 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhIZDcr (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 25 Sep 2021 23:32:47 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B8DCC2035F1;
        Sun, 26 Sep 2021 05:31:10 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 55D3F200EB2;
        Sun, 26 Sep 2021 05:31:10 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 884C3183AD14;
        Sun, 26 Sep 2021 11:31:08 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: [PATCH v5 4/4] dt-bindings: dsp: fsl: update binding document for remote proc driver
Date:   Sun, 26 Sep 2021 11:07:10 +0800
Message-Id: <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

As there are two drivers for DSP on i.MX, one is for sound open
firmware, another is for remote processor framework. In order to
distinguish two kinds of driver, defining different compatible strings.

For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
are needed and the mailbox channel is different with SOF.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
 1 file changed, 75 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 7afc9f2be13a..51ea657f6d42 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
 
 maintainers:
   - Daniel Baluta <daniel.baluta@nxp.com>
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
 
 description: |
   Some boards from i.MX8 family contain a DSP core used for
@@ -19,6 +20,10 @@ properties:
       - fsl,imx8qxp-dsp
       - fsl,imx8qm-dsp
       - fsl,imx8mp-dsp
+      - fsl,imx8qxp-hifi4
+      - fsl,imx8qm-hifi4
+      - fsl,imx8mp-hifi4
+      - fsl,imx8ulp-hifi4
 
   reg:
     maxItems: 1
@@ -28,37 +33,63 @@ properties:
       - description: ipg clock
       - description: ocram clock
       - description: core clock
+      - description: debug interface clock
+      - description: message unit clock
+    minItems: 3
+    maxItems: 5
 
   clock-names:
     items:
       - const: ipg
       - const: ocram
       - const: core
+      - const: debug
+      - const: mu
+    minItems: 3
+    maxItems: 5
 
   power-domains:
     description:
       List of phandle and PM domain specifier as documented in
       Documentation/devicetree/bindings/power/power_domain.txt
+    minItems: 1
     maxItems: 4
 
   mboxes:
     description:
       List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
+      or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
       (see mailbox/fsl,mu.txt)
+    minItems: 3
     maxItems: 4
 
   mbox-names:
-    items:
-      - const: txdb0
-      - const: txdb1
-      - const: rxdb0
-      - const: rxdb1
+    oneOf:
+      - items:
+          - const: txdb0
+          - const: txdb1
+          - const: rxdb0
+          - const: rxdb1
+      - items:
+          - const: tx
+          - const: rx
+          - const: rxdb
 
   memory-region:
     description:
       phandle to a node describing reserved memory (System RAM memory)
       used by DSP (see bindings/reserved-memory/reserved-memory.txt)
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
+
+  firmware-name:
+    description: |
+      Default name of the firmware to load to the remote processor.
+
+  fsl,dsp-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to syscon block which provide access for processor enablement
 
 required:
   - compatible
@@ -91,3 +122,41 @@ examples:
         mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
         memory-region = <&dsp_reserved>;
     };
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
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+      clock-names = "ipg", "ocram", "core", "debug";
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

