Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF36C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Mar 2022 16:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbiCDQQS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Mar 2022 11:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240474AbiCDQQR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Mar 2022 11:16:17 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC68D1B8CA6
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Mar 2022 08:15:28 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u1so13387596wrg.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Mar 2022 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qo1oLJMa/Juuiz/8tm0dlUbpsAehCK6hY4TsDvEil64=;
        b=4ucNsu73371QER1iVg/SYxU4sTtNkFz4mcETt58TIUbIzHX0UQsNiv7/hpQbphueQp
         uE41tjRPPJVp+8VjH9CzBcNeqohZ/thG3VeH2awR9qE8+VdDciUao7ZtKsklp2Q7HMcS
         4MFMXWb80oYj5s6RUBwMkBasfLcAC3kFBfxZDTH2oFa4Zbf2w5MNjrHHTa70XJyYta//
         iv7RK5ax6bqFepe4Uuz0kwBN6Z2qVletNxzWFgc+MX18zxn024mFy01NHrKFkMHUDCnE
         c3I369eg/D7s8/pCtCAwrkXnmc9A9qotLgCQpCQn9rmDz/m6r3OM6U6LksGIJuV9Fl5m
         Qsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qo1oLJMa/Juuiz/8tm0dlUbpsAehCK6hY4TsDvEil64=;
        b=F4/3okiBks60SdqbVK1Pd/+DGRfZcb+PgAlqIkv0QJJ3zb9nZDw54GiANgGAyIJ+p1
         qYrJ2X8beqKgsoNpTEV0enA2QGIHPW8aqjMTlE6edW8hcN6w+raV0LsAs7vz/QWe5PI1
         c56y58MG4IIqLqA8FNM/1w6G4WiJgq0LbXVszC8s/v+J4g1WaQRPaA0JeJT0CT/3fPWG
         WY2aFqFsntdZ3qOgOiqfHrim84+9HJXf/MPNAwpj3Bq15KqdwALhkQBonsE3N5eCml3u
         ejZdPS9G9yiBzxZDQZOiuDHP4tmkofWY/mpHS9xVvca2Wm6f7HCpFQCGZ3Sfn1p+cwZr
         qAOw==
X-Gm-Message-State: AOAM533/6sRykZwNU57jBx6I3ONDzhfydPqEWzDtsnqB/8nYnXQoAxi6
        7oEuP6ecDJqvt3154Y506hJ3yA==
X-Google-Smtp-Source: ABdhPJypiVdEpBXufX/LYg2TlJODChhaQvP/Mg/mSfLKFI5Q9apmvXFWuBYOHKLyb5PE/15fMYRUaw==
X-Received: by 2002:a05:6000:15cb:b0:1ea:7db2:f5bb with SMTP id y11-20020a05600015cb00b001ea7db2f5bbmr29322769wry.709.1646410527460;
        Fri, 04 Mar 2022 08:15:27 -0800 (PST)
Received: from xps-9300.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:15:27 -0800 (PST)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.or
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, khilman@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 2/7] dt-bindings: remoteproc: Add bindings for the MT8365 APU
Date:   Fri,  4 Mar 2022 17:15:09 +0100
Message-Id: <20220304161514.994128-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This updates the Mediatek APU bindings to support the MT8365.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../bindings/remoteproc/mtk,apu.yaml          | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
index b640aa96d678..388352ccb2b5 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
@@ -16,7 +16,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt8183-apu
+    enum:
+      - mediatek,mt8183-apu
+      - mediatek,mt8365-apu
 
   reg:
     maxItems: 1
@@ -26,13 +28,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 3
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: axi
-      - const: ipu
-      - const: jtag
+    minItems: 3
+    maxItems: 8
 
   iommus:
     maxItems: 3
@@ -69,6 +69,39 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-apu
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: axi
+            - const: ipu
+            - const: jtag
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8365-apu
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: if_ck
+            - const: edma
+            - const: ahb
+            - const: axi
+            - const: ipu
+            - const: jtag
+            - const: smi_cam
+            - const: ifr_apu_axi
+
 examples:
   - |
     #include <dt-bindings/clock/mt8183-clk.h>
-- 
2.34.1

