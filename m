Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858AFC433E0
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 583342075F
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbhABVAF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 2 Jan 2021 16:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbhABU77 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jan 2021 15:59:59 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BC5C0613D3;
        Sat,  2 Jan 2021 12:59:19 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id u19so22990090edx.2;
        Sat, 02 Jan 2021 12:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NGzJTaWs2ZS8AEwsirv2BgYJFSuAwUWvelZNyl7tzMs=;
        b=Tg/pmAPZCNd3zQAFNQCWeZ5zvyCApeVeQKiW+gWJyvwl9mgWktozIyDe1luQ9VXlnL
         99ncXwaQjzzrgzKsbjygYbDj0fZQN6AL1SiXAcYk6RtV87WOeOfOAFVZ1Yjd4JjdbpN9
         NvoTX5iz4x2Crsb5hy3D2m7Xx421xHpdTicXCnK0Mgf+BRfuoUYk/WftQAZbdHofOVHa
         LzbNa+TveWRq2E1ENMOIJMx/QEeUlpaRVhaAYojj4xCLnrcX08zG4JNaDCKAPsRCT56+
         wPzJJBEPJrvMhgRYPVjjrkR2Zs/eJweqpd/kTq4Pjsl6ISpK1w71bfgoYccTtFc5UkxI
         s8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NGzJTaWs2ZS8AEwsirv2BgYJFSuAwUWvelZNyl7tzMs=;
        b=uIt+TBWUTg9o8pVMl3NNcLhISKm1Xw8GkcKE5M45STZ98hqbGt6eN1qxm+EmfDP/Sw
         SlQiUUsilDCmizI7CnTh+UqA+BoHq0HW8lH+m+AV5QGEkFsPPU+kOlxYThURCuESqJ/A
         9RFiHhbzFokjI9eJ4htaUi3GfYaX36u3sRSmj+9CInI0j2stBGKYLfNrrzLAtkozJ756
         YNTWYRPt3e2HJZJWc+11njY/cpG0qfARKn6F0auNl3PVNObh/bvcqhAcrIRvsyCNx1NX
         0aG7t8pyNf5CDTn4acdwAg2fenbQOU4GYgNyMUXQTG+58v5jwpzP/Zt6S5OfDxQaoXNu
         7mUw==
X-Gm-Message-State: AOAM533J0098X/YGn5IkdAKApGYzIiT+KAigRmzqbYYfC4yPfdc/fzZ8
        d2I4RRTvXne1raK0DggzE/Yf+rdg4dY=
X-Google-Smtp-Source: ABdhPJxNjL3jVdnY7FvrXUle/pGeYWEwsyGUIY0+q1xwGunJf2gHd111vYmjSNdwOjN/a8SLQ3JjnQ==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr12883539edr.251.1609621157745;
        Sat, 02 Jan 2021 12:59:17 -0800 (PST)
Received: from localhost.localdomain (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:59:17 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/5] dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
Date:   Sat,  2 Jan 2021 21:59:02 +0100
Message-Id: <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
controller for always-on operations, typically used for managing system
suspend.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
new file mode 100644
index 000000000000..d892d29a656b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson AO ARC Remote Processor bindings
+
+description:
+  Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC core
+  controller for always-on operations, typically used for managing
+  system suspend. Meson6 and older use a ARC core based on the ARCv1
+  ISA, while Meson8, Meson8b and Meson8m2 use an ARC EM4 (ARCv2 ISA)
+  core.
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-ao-arc
+          - amlogic,meson8b-ao-arc
+      - const: amlogic,meson-mx-ao-arc
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of the firmware which should be loaded for this remote
+      processor.
+
+  reg:
+    description:
+      Address ranges of the remap and CPU control addresses for the
+      remote processor.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: remap
+      - const: cpu
+
+  resets:
+    minItems: 1
+
+  clocks:
+    minItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandles to a reserved SRAM region which is used as the memory of
+      the ARC core. The region should be defined as child nodes of the
+      AHB SRAM node as per the generic bindings in
+      Documentation/devicetree/bindings/sram/sram.yaml
+
+  amlogic,secbus2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SECBUS2 region which contains some configuration
+      bits of this remote processor
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - clocks
+  - sram
+  - amlogic,secbus2
+
+additionalProperties: false
+
+examples:
+  - |
+    remoteproc@1c {
+      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+      reg = <0x1c 0x8>, <0x38 0x8>;
+      reg-names = "remap", "cpu";
+      resets = <&media_cpu_reset>;
+      clocks = <&media_cpu_clock>;
+      sram = <&ahb_sram_ao_arc>;
+      amlogic,secbus2 = <&secbus2>;
+    };
+
+...
-- 
2.30.0

