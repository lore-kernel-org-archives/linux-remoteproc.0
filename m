Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD78C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2654560FDA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhIUT1t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 15:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbhIUT1l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 15:27:41 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714FFC061757;
        Tue, 21 Sep 2021 12:26:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i23so43712wrb.2;
        Tue, 21 Sep 2021 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZBRZMgSz4LbQsAfbH/YjYm23oNfOhnsr0h0sD9TjzY=;
        b=apX3C080nmKllk/RGBMUY2ZGD6plFGqepivO4mqAX548/G/c6d+UgkpxlXPx7UFmeh
         3uWdvq5BIyyvvRGb8XpoOQOcf1fpN3lSqu0deqWLK/YIRsQQG7dhsBZ1xx6Y4JfghktV
         O05gXdijAI2jKbLa2hRVwsSxXT6TVhLSAVIHMV0quBWw5sOo/4AwyNWB5LKXhTIHr1Xl
         OgtYExmrL8eq1l3V3inFpKuflIENuXLqM4EENM/MmJfYt4Py6F4AuXsxIwwce47yNy4x
         NzX6gMl78zx5L1uJY1Yjf1/tSvn40ESu1Jk8mLdQ8gkwKh7kdTCJTZnciBwLfXzUS4+l
         QLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZBRZMgSz4LbQsAfbH/YjYm23oNfOhnsr0h0sD9TjzY=;
        b=mq3v7MJK9IEv4T8H5doQzXX80DB8SsS4Kr6VR0hj8H+SH6jILMAx6aKlMmtmoIoHQs
         yFwC3ejs6kCdgxWx98J0boXLcbnRqTmH84mxVRhraLRR+FnmELicO0aiXGGmPRMh+RSI
         JMopsYDGUncYPVA/eiApDuw/Uh8kdEm/GrSauNT75QxK2jyLhaPkKq2lMd316HLF8hr5
         lUMPqV/21gdDCKToGlIO7iHo8IoX7LhlHn9hXOCCbSPV6RkCi2alOLL8MEkhhT7aTyxY
         6ZPrhpXB5aGEpgXWwKbmgSO14HmljWIucsqYPWqzL9+Ztgh+dnJw9VBbfiUJOaT3SOrz
         wDZQ==
X-Gm-Message-State: AOAM533lc1l0XRPvlJQOi3/4u3JLyRavcPsuNWRFYdSIN2iw+vmwqKCB
        RhgA1B47Q++XjMd+ZO0f2ptJA+qSQnE=
X-Google-Smtp-Source: ABdhPJwgpJFatcnTGrAJhOX5voXLw/TGpmm72+jzXbeeTjdNqvxTFxUpdgq71gNjQbO/N8g+6e9rDw==
X-Received: by 2002:adf:f98b:: with SMTP id f11mr37783857wrr.333.1632252369859;
        Tue, 21 Sep 2021 12:26:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4aa-d500-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4aa:d500:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id h125sm3980771wmh.9.2021.09.21.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:26:09 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        ohad@wizery.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
Date:   Tue, 21 Sep 2021 21:25:56 +0200
Message-Id: <20210921192557.1610709-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
References: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
controller for always-on operations, typically used for managing system
suspend.

Reviewed-by: Rob Herring <robh@kernel.org>
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
2.33.0

