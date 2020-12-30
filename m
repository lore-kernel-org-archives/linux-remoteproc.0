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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F7AC432C3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECAB6221F8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgL3B2j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Dec 2020 20:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgL3B2Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:28:24 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C8EC06179C;
        Tue, 29 Dec 2020 17:27:44 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id q22so20289315eja.2;
        Tue, 29 Dec 2020 17:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=imrJKcMY1s8JA1VMBRSaaZtkdQdYVBWQyZZ2ZjhBALM=;
        b=hAABnlye+GbQK4TdQGvjwPMR9PQbrndwo9E9Bx/ndweH2aXp26ibb/WBmmexHiaOiO
         9eh+2xWTTWcyEzeNd7JPDmI0W+k8ayK7lpyOfFafrX3rDO519y01b4Kq7IoFwlxF8hgX
         6jR8K4n2Gn5Sq3pQYOgYStaXNh0rJ3so2AzCz/KCiRGEKYu22fppijSY85Ha5bpEC49V
         sNx3cF/hcYorO/BxhzV6bzcDD4jwkrQkQuXOXDJzI26bsyGim9RCEbYM0uy1/BqJQMBP
         u4cJ3iLZRVtNr117ZHK9J5KUOnfF1pj975OC6+z/2YW2TvIErfihDjSF36cF7J77+SsM
         2Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=imrJKcMY1s8JA1VMBRSaaZtkdQdYVBWQyZZ2ZjhBALM=;
        b=ZdrrIUXeIzSou7IHAO83TE31SEuDlRYQJofohjPTB+8qVXiqtmwG0OjA8PvQmnsebC
         htrgEROV5bEyyq0M7hK6C+jpauTBrLyUsmXe2YajXlS8y3CIhipFVdbeiOKkJrTMxoPY
         Ta5j6vSHrHFWwxKj4Zk+Holpcy/l0Aelfi0nIdSBhCYoDLh1vNW2Lcs9UBhglmia6i45
         s+OmDvIAnG2Bsyd8GuUB40RC+zlAMd2br8WrEMTfsKiQhysoSLV8PmKFFIBhIlYM44uB
         AQdxxGoAqUxGiuh92+8GzY+0+FQAF+jdZqTkBtV5lhQt1a66lpBrEAYhqvVRlmcwg/1/
         bvbg==
X-Gm-Message-State: AOAM53307fFG8pdqApNDheOr3/jWJX2d85gju248/RTnTXMLyRg4pPiR
        Q0EH4ymkvX+FCtWASqtFeDGglSjboM4=
X-Google-Smtp-Source: ABdhPJwShPofrfvJIRzJpMlIT4O6xPnONzNS3zWXwCvFAQNcxMUg5Fe/b1aISTX+RbgFa+YfNFgWhA==
X-Received: by 2002:a17:906:154d:: with SMTP id c13mr35357439ejd.471.1609291662846;
        Tue, 29 Dec 2020 17:27:42 -0800 (PST)
Received: from localhost.localdomain (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:372a:4000:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 17:27:42 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, robh+dt@kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
Date:   Wed, 30 Dec 2020 02:27:21 +0100
Message-Id: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
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
 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
new file mode 100644
index 000000000000..cfa8e9de6c28
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
@@ -0,0 +1,53 @@
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
+# We need a select here so we don't match all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,meson8-secbus2
+          - amlogic,meson8b-secbus2
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - amlogic,meson8-secbus2
+        - amlogic,meson8b-secbus2
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

