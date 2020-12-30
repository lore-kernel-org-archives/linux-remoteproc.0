Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF04C4332E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CC74221F8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgL3B20 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Dec 2020 20:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL3B2Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:28:25 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5188BC06179E;
        Tue, 29 Dec 2020 17:27:45 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id y24so14101409edt.10;
        Tue, 29 Dec 2020 17:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MtPxMqkjwt6sHKWiGsuZVZg8bNgwsNd2+f6vgAqxoic=;
        b=geGfyg5Vu+VI3OwPgXC08gM9zGH8+v/NvBZUaAozHsn2Y3GrUSMnYN9HbUY5sMzNzN
         meg8W6AlAwe1IOpJ3r2fUdx0SR0s2aBB8vYn3ngpYylBgO4iSJwbok0bJ0298wD0/oWs
         SOXhXwpQkdjesylCihQ9Lz/l2be1hN3PMLN024SRQLbUIm64H3+y3KCnSFc0ubxd3xWN
         npLWI0+sKZo5j0713TDbZzpVj6P55tkmgv7edsLSwXDvMywgLov0pDxXNMVIaO9zSRUm
         OfIxF9t7bBjs8SCX8/xiChdJ93OctM7zQhsV2hJ8rQUJ942cg5SI7p7h9lFd+6ulqw/I
         JmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MtPxMqkjwt6sHKWiGsuZVZg8bNgwsNd2+f6vgAqxoic=;
        b=Qx3Phy7rv31J7vp/z1w3QP39bLX9SSF7dTCTMMPtaEn+fT0ecQbVB12nxjMxAXnPNs
         dcQ/hr+zDi7GPRStdZTLnI7nFm8STjrATdYycpw6wotti0RY1rMb5a728dB2cInmfmqH
         e+G200siO/4Lo+Z1cisDiwelVGrnBj5wxOpTudiRWN554dXzW6EJVaMFVD+Fqm7bwNog
         7Q88Mw9ML9/kWyXyDWJPUe4ri4XzUOUwauQVB2xTovnPowYj/9X2DjSpkeS/Wsm/buQw
         uXHbY3YVQ02MVYy+5FZ1uUQd/aXc3u7049BFwfUA2XVXjDo476y1fpCVApKUnYmwkYFF
         m0Xg==
X-Gm-Message-State: AOAM5307dQpvgAzKG0h/eJi7CEpMfk6wI/OA9BTqd9XrAtijbV/Dpo5/
        SQzC5FG1B2O41qS7HFSOTDQgt8N5tcc=
X-Google-Smtp-Source: ABdhPJznEZmybn/NgvvEAfXc3C3cLo8e2RNuEOZYYNX1XVxkerwE6Myr0sk29i+aG7EOSKKSil7Vrg==
X-Received: by 2002:a50:ce13:: with SMTP id y19mr48656745edi.241.1609291663889;
        Tue, 29 Dec 2020 17:27:43 -0800 (PST)
Received: from localhost.localdomain (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:372a:4000:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 17:27:43 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, robh+dt@kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
Date:   Wed, 30 Dec 2020 02:27:22 +0100
Message-Id: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
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
index 000000000000..ba5deebaf7dc
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
+        - amlogic,meson8-ao-arc
+        - amlogic,meson8b-ao-arc
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
+     minItems: 1
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

