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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04708C43381
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C231B2075F
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbhABVAa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 2 Jan 2021 16:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbhABU76 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jan 2021 15:59:58 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD8CC0613CF;
        Sat,  2 Jan 2021 12:59:18 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id n26so31436251eju.6;
        Sat, 02 Jan 2021 12:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fNImdkdixBDMY8G5W7g30TmcOCbr3RJns6yyKJP4osQ=;
        b=ZKpwmouWmcKt7BrPdBAWBVInM7masm8IZD2Bec8BCa2QNoNmnlfgyQwVh9RRP1YGTO
         9Gax1OMGHpWbR12OvPFW9ZWRuVPaWFdIzuggId8lxoRjoB0lURHUVcsfz8dSFNhCsOCL
         PnVMBaxkf2x8zJ3L0rBzrPhPAdgVqg4kzA4z+girU+E2GqvJCFuKyPZcDJbCka9xiiHL
         Lbssgh1PTWvEWefzTV9PmIREv7xM+uPOnGAcJJ5VOtBWJn9wYVv9VlQawW+AJZugLC47
         BKpfMvqI2rztEsyhgVCp+97W9zNkiMMyKVtLQkw/ZrtlPzfdVbGPC/C2T36Qq2oaIrbk
         UpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fNImdkdixBDMY8G5W7g30TmcOCbr3RJns6yyKJP4osQ=;
        b=A9fXukodx5hQelpymgD8vX9o7KDlR7n7nDuIeHSalosRPrPH3tkDCD/uq7bCRIa0ws
         ni3n1pHafUciwwLHku82Mj5pmz9V6FMhUUMNgHjo8RWeaX9gBy1PK8txTIA4GpUzD/Kj
         xTGbI+DmE5bZyO4IhUJcdhfvCkGXsw1X+ivClNYXJWRXqwDi+Fipb53YnRPlOoloeaRt
         DyHNbCdNZQATNe3zsuEQHs4vzdqyxfgUaHybXNnznY6W2DJYba2ynxMlm+s7yrSS6VV8
         CTo1eOGd8eKPTjH04aOgOlsFlLg1U2CAkwYE3OtXNITe+6jyqw8Sq8K8XaA1vaa5X9sY
         Kbrw==
X-Gm-Message-State: AOAM533iv/efBzXpw82AQ3z74ma2fOBYr+5KLcNIsIyb1AGHFvA8f0h8
        4VXF5o1rJxAt2Bet58GwXSnqhQ/kQyU=
X-Google-Smtp-Source: ABdhPJyqLNQ/0eSqUCEcVyKKi2vo/nrCvuuILrsWkYg4Ysxg3RpO7hipdr1kt1e/+v53Hyfk4iPXTg==
X-Received: by 2002:a17:907:429d:: with SMTP id ny21mr60656211ejb.290.1609621156823;
        Sat, 02 Jan 2021 12:59:16 -0800 (PST)
Received: from localhost.localdomain (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:59:16 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/5] dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
Date:   Sat,  2 Jan 2021 21:59:01 +0100
Message-Id: <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
contains registers for various IP blocks such as pin-controller bits for
the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
The registers can be accessed directly when not running in "secure mode".
When "secure mode" is enabled then these registers have to be accessed
through secure monitor calls.

So far these SoCs are always known to boot in "non-secure mode".
Add a binding documentation using syscon (as these registers are shared
across different IPs) for the SECBUS2 registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
new file mode 100644
index 000000000000..eee7cda9f91b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson8/Meson8b/Meson8m2 SECBUS2 register interface
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |
+  The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
+  contains registers for various IP blocks such as pin-controller bits for
+  the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
+  The registers can be accessed directly when not running in "secure mode".
+  When "secure mode" is enabled then these registers have to be accessed
+  through secure monitor calls.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-secbus2
+          - amlogic,meson8b-secbus2
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    secbus2: system-controller@4000 {
+      compatible = "amlogic,meson8-secbus2", "syscon";
+      reg = <0x4000 0x2000>;
+    };
-- 
2.30.0

