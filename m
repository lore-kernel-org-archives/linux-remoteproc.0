Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA0FC2D0F8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E06552078C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vAPOs+dP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732084AbgEMAzy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 May 2020 20:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732081AbgEMAzb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 20:55:31 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB4AC061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:31 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g11so2908587plp.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=etYHxN3ySLIwR6cL/4LlObYwmD9I/trb9bCtQEgj1mI=;
        b=vAPOs+dPJoqTXGl2f0d2ZiQWsvD5qMYGMtd+J7/radx3hoV5Cz7loihgG0t9H4rOIk
         8gjTOq0oNVGJ1Hqf8FHbsPH65BQfll79RXxraX3PsK2Ihfu2am0DaqEjyvUQwBKbWDkH
         Uar95Zege8VgBwuYeVpv62cXlyjcp3f2rOcpWtfVXS0oEn/puAvmmd2xi//It7mgiwBV
         /FM/3FyXRLaPT7+M1Hheq2sun/OdX0CqEW8pARly9cdfmJK4xoRmO5nyecLyLeUJ4UX5
         FC1Te1YRPgbOUHoC7Wx4rrocswWBb/zuXUQOo9Z985yKG71rx84EfCBWoBLGyR2U2tkS
         SYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=etYHxN3ySLIwR6cL/4LlObYwmD9I/trb9bCtQEgj1mI=;
        b=XHTqcm0k+S1RxX4aGK1BPLN00CsEdIEMtSo/6guVs75TowvhpKlIlsNVmCsb62HmGK
         xsHv5aqdPLjBnunDQ/l1veYBAXvmbP7f23A/oRlAsrrlqYV6ZGOYxkTZoR73NKk/njzW
         TUIqt07maAilrJAtMn4Wa96g1CSxjxa/oGT7/nJlY1dsD+W7t9uCISLcqSA4QrK1m2IA
         4vWP9gTKUclRBHnPTCbW1nx627yGzEc80NNpUv/o4/FUqD60prcnEjV4F+Zx5c8jIK2N
         H63Bx3EXGSzVHErswXh2V7LJ9HKX9/oZFx/H7gLadTW/RaEeHg3/2HYL2ovu2CEiL6ZR
         lPJQ==
X-Gm-Message-State: AGi0Pub8LsYGrhzkBXOHKLTT/7/fWMsBGIdPVNLfcugNVfyyuVuo+a1g
        qEfgA5VG/kXyBzK2dVtJlT8xxQ==
X-Google-Smtp-Source: APiQypJELEN+lza7wUergSkDB14XjiFt+gaaXMuPkWE6i6Jl1gi9geM7ftxaomx0XeS0zRkZgmeGrA==
X-Received: by 2002:a17:90a:2c08:: with SMTP id m8mr30936109pjd.102.1589331330776;
        Tue, 12 May 2020 17:55:30 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Date:   Tue, 12 May 2020 17:54:38 -0700
Message-Id: <20200513005441.1102586-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
new file mode 100644
index 000000000000..71e63b52edd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hardware Mutex Block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The hardware block provides mutexes utilized between different processors on
+  the SoC as part of the communication protocol used by these processors.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sfpb-mutex
+      - qcom,tcsr-mutex
+
+  '#hwlock-cells':
+    const: 1
+
+  syscon:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Should be a triple of phandle referencing the TCSR mutex syscon, offset
+      of first mutex within the syscon and stride between each mutex.
+
+required:
+  - compatible
+  - '#hwlock-cells'
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+        tcsr_mutex_block: syscon@fd484000 {
+                compatible = "syscon";
+                reg = <0xfd484000 0x2000>;
+        };
+
+        hwlock {
+                compatible = "qcom,tcsr-mutex";
+                syscon = <&tcsr_mutex_block 0 0x80>;
+
+                #hwlock-cells = <1>;
+        };
+...
-- 
2.26.2

