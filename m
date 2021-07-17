Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE8CC636CB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126FC61106
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhGQXwK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Jul 2021 19:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhGQXwJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Jul 2021 19:52:09 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F77CC061764;
        Sat, 17 Jul 2021 16:49:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id f9so16518494wrq.11;
        Sat, 17 Jul 2021 16:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bT1+fPwFJ9flWJpalc9w5DJNPuQ3S3336QWUFAF7Nzg=;
        b=MX4ao7FsMDbMFDHM0HBg1o5Vka3eWBtFWTATqUoGK7Tv01xDX8zaRsuG9sr3csWNQo
         r3GjNQWjHEO1M7/GR+vU8rBy9gCAH/4ae9BJLARD8QqSh4wQXry7JJBsthQ7hazbFhrt
         moUU/AvbYyYg9cig+IAIUwKsALiQ5chduykZ4r0bO2u3JED9utY95Uimj2Qll2Li6rPs
         bv+3MoRQkFnRUCYErJguo5lA6AjhcLL7AV1nPdG0Xi0JzeJDflFn01x34Ih3ILjsMWz/
         xEBMDU6H6gjC52h2ujbqPtR1vaMJwOmtIpyrkGcFdofeA5fHdSTjYPoHKbT8FRXn3nqb
         KVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bT1+fPwFJ9flWJpalc9w5DJNPuQ3S3336QWUFAF7Nzg=;
        b=faJMMuPUZGxhFha2nYMkbLrPSGVDeLT/lJbWkUXPRc9Wef3HJxpptpDT13pEZTxpkq
         i/RM8OFIxpNDq99YxiEBubchifpxwMgRt/C3aQddQMeyQsrJTVNGGqVpip+DGd0bxzoz
         GyXj/jHqLnaEdA2HtlUCXIJvdJ0ce23EMCZ1BGQ7mVgA3BSWm6Bn8X3FxqdC+ZTHtqLV
         33e/V+xR6Ph753TNNicyIbt/5VwoMDzzdXvbH1aFyqt5qLk7A6fy0mh2HHSYB71Vo3W3
         5r0lXElr1eUKQREvA2XlafkK4YDha5AzNdMjyAts3ZtQQRZQxazW5yF1bFAcrmZkpDiw
         g4Pw==
X-Gm-Message-State: AOAM530QLahRffrYhQCN9ckza7Q3bn6r1pozHJ/qdnMHHifT1XCdZwv/
        tqBOVauHvOnUCwM5ZztUcSRFRvf+mzQ=
X-Google-Smtp-Source: ABdhPJx7hpMPMGYC00iF95XI7OMBCypMiepPby1ZWDAXHuBTefApnReU1/cPQgrg0n0cffiS4Nq14w==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr21395971wrp.351.1626565749759;
        Sat, 17 Jul 2021 16:49:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id p11sm14505044wro.78.2021.07.17.16.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 16:49:09 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        ohad@wizery.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
Date:   Sun, 18 Jul 2021 01:48:58 +0200
Message-Id: <20210717234859.351911-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
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
2.32.0

