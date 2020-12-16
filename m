Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55247C2BBCA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 16:54:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DFF5225A9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Dec 2020 16:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgLPQyQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Dec 2020 11:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgLPQyP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Dec 2020 11:54:15 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68247C061285
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Dec 2020 08:52:56 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m25so50004796lfc.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Dec 2020 08:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5+8efIdVtbBOyRgwR2gsKbazlVl9dyJTRR6AM0J3hA=;
        b=naV+sYPr/FeUiJPKbdTmkFZhtvKy2MlJohFV1u3ZnaiKvZDrGjU+Z2/US65bBUa7im
         ak++7BQirUk8jgjX4Wgfy4hhi9QC++hUHWbpYH+EsPDunSA7ztqnvU1TlD+E0CUzIA1n
         KahlnGo+D/L5gdYR++KqfeC0lo4rLpbNLedOwuATKjyX8cdyLhNsE0WyaxaElzxj7H1G
         ZxDoWdPKVyihee6Mf6O3HbLlSzPwWrrK1e9CRKgGaUmRrSGisZ3JQUmUr48q7Vwpad5G
         rGEDEcAezUrak2k2C1gnJEYwlGwgymjWFX8LZ8fmfmxYvkSLSh5S6GHOEjBYArh73O/W
         28Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5+8efIdVtbBOyRgwR2gsKbazlVl9dyJTRR6AM0J3hA=;
        b=LRjA0KsY/gseW+fAxPVOaU3kvKcwVQQjAQWM/tPhhFM/QRz7j6WsoCUSrLj7w89IUO
         5fOUJ1GiPADquWtuP8TLnLZefSr9QbyfO3KM5XN9B+t99kxP31wW60WaBQg7eOtqnesD
         cw30AteC9TCtcRfDMXwuhYJde64MpqPon9CfHorFB57/6+83twDtyVK5xtroo0U3WWjA
         vUdXgw2MKSVyW3skl6TOsYqymEIMI8EpU/3iLcnQho7JGkmAG+SF9YS5S8oJpRwMEHf+
         vJNGGNMrUHiPDy8LdBXUObG0s5Qcz132P1Hd1uk6QkbzLsO0aefdgSmYoEDBIuMURdWE
         QuQA==
X-Gm-Message-State: AOAM530YBMfvJnp/+wcJs8c99yQeQunjBN57ueb6tgsmjrXPzdrO3d49
        ZMVIh09BFgQS6arqpIcSD+/NzQ==
X-Google-Smtp-Source: ABdhPJz6dLYEFbMk50Y/Jv+SKtcOl2M/+YqNdLfUXkfBdGXJO8ecriLaUdGxdKhrDWMRvcdFMS2LdQ==
X-Received: by 2002:a05:6512:687:: with SMTP id t7mr12789469lfe.432.1608137573634;
        Wed, 16 Dec 2020 08:52:53 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id t3sm281645lfe.263.2020.12.16.08.52.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 08:52:53 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com,
        ssantosh@kernel.org
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com, t-kristo@ti.com
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Date:   Wed, 16 Dec 2020 17:52:35 +0100
Message-Id: <20201216165239.2744-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Add a YAML binding document for PRU consumers. The binding includes
all the common properties that can be used by different PRU consumer
or application nodes and supported by the PRU remoteproc driver.
These are used to configure the PRU hardware for specific user
applications.

The application nodes themselves should define their own bindings.

Co-developed-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
- Change the 'prus' property name to 'ti,prus' as suggested by Rob
  Herring.
---
 .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
new file mode 100644
index 000000000000..d6de34f9e6f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common TI PRU Consumer Binding
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: |
+  A PRU application/consumer/user node typically uses one or more PRU device
+  nodes to implement a PRU application/functionality. Each application/client
+  node would need a reference to at least a PRU node, and optionally define
+  some properties needed for hardware/firmware configuration. The below
+  properties are a list of common properties supported by the PRU remoteproc
+  infrastructure.
+
+  The application nodes shall define their own bindings like regular platform
+  devices, so below are in addition to each node's bindings.
+
+properties:
+  ti,prus:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandles to the PRU, RTU or Tx_PRU nodes used
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      firmwares for the PRU cores, the default firmware for the core from
+      the PRU node will be used if not provided. The firmware names should
+      correspond to the PRU cores listed in the 'ti,prus' property
+
+  ti,pruss-gp-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    enum: [0, 1, 2, 3, 4]
+    description: |
+      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
+      This selects the internal muxing scheme for the PRU instance. Values
+      should correspond to the PRU cores listed in the 'ti,prus' property. The
+      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
+      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
+      same slice in the associative array. If the array size is smaller than
+      the size of 'ti,prus' property, the default out-of-reset value (0) for the
+      PRU core is used.
+
+required:
+  - ti,prus
+
+dependencies:
+  firmware-name: [ 'ti,prus' ]
+  ti,pruss-gp-mux-sel: [ 'ti,prus' ]
+
+additionalProperties: true
+
+examples:
+  - |
+    /* PRU application node example */
+    pru-app {
+        ti,prus = <&pru0>, <&pru1>;
+        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
+        ti,pruss-gp-mux-sel = <2>, <1>;
+    };
-- 
2.29.0

