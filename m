Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D7FC2D0FD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1828D2492D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDywye9W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732101AbgEMAzw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 May 2020 20:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732100AbgEMAze (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 20:55:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EAFC05BD0C
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b190so1472322pfg.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUnboi85SF121UrpH3bFZwKuXXQdWqb1eY3bgMeZfq0=;
        b=wDywye9WHHKlG4Dfqc21+Ymi2c2GhfCM0ndcG4w9gBx7gisAbn4XX9/yj7tDGO115V
         abVKOSJEUOvd6HoJP5oJpCXpWvka1K32OidCK+B8/6Jx40lL0mr4aXfEYJSTnCTl1LUI
         kgXiaIugTpwmRc/fuTUgNjtbo5iC7uftSfZM7cd81+K/Z4qfDiTgQUN/UoeRsAeabvEv
         ejL1Hehbz54YHGyo82eRm4yjvmrwTHHr981Dp+29CVSDPEt4AjHetPeMYtEJfRBtxIDQ
         1dyTYk1mY7y8sQr/uRKYp4w2rlVlQXl0f3wPGSwuk13zlP59aq/7d41SYBYCw2u7qWI3
         QKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUnboi85SF121UrpH3bFZwKuXXQdWqb1eY3bgMeZfq0=;
        b=We15vzAIylyFXgnI+sDLlLj3ypDojwViAuexu2ZuHMBNgwHLuUN9C2QS9ijBLYAMjZ
         u8ip3cuiLPAKjCqkOw+MD5GZRbZdd+LGy2J4L1uqbANLMCpiAYgV1U0S8ZpZLnwnl9LZ
         XoPtmEMyUNdEDXMfGeRbnpdXd5OK5zfcBwOrXpb+FG6LD8U6ymnWfg0Dv13iod3UtVlX
         AJa40s24tCm3LUDsU0HRD1GuZEHYIOcWPg6I6xNL8TrQnzONKPD9nHhHWs0di1Fd7SKK
         c5RIQMc8Ytc42a7+FUMMZukYcai8psO7pR+jS1SRBK7OxeYQeQLywavnFWnQmkjdYcmi
         DZZw==
X-Gm-Message-State: AOAM531ODIM/cIwzYxYjvlYmokw34hmOkIPYajCnzDok9areB4DfUArC
        igplhlicb852CdsX3KlRf8hTCg==
X-Google-Smtp-Source: ABdhPJwIlsG5NiDBXR0Xm2F0/KvNmdfVmcPTDcQEKb3c9MavHvcvGtJXMUS6fhDsJSWryUxHKLA6BQ==
X-Received: by 2002:a62:8c0b:: with SMTP id m11mr3886830pfd.105.1589331332342;
        Tue, 12 May 2020 17:55:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: hwlock: qcom: Allow device on mmio bus
Date:   Tue, 12 May 2020 17:54:39 -0700
Message-Id: <20200513005441.1102586-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In all modern Qualcomm platforms the mutex region of the TCSR is forked
off into its own block, all with a offset of 0 and stride of 4096.
Update the binding to allow the hardware block to be described directly
on the mmio bus, in addition to allowing the existing syscon based
definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/hwlock/qcom-hwspinlock.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 71e63b52edd5..88f975837588 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sfpb-mutex
       - qcom,tcsr-mutex
 
+  reg:
+    maxItems: 1
+
   '#hwlock-cells':
     const: 1
 
@@ -31,7 +34,12 @@ properties:
 required:
   - compatible
   - '#hwlock-cells'
-  - syscon
+
+oneOf:
+  - required:
+    - reg
+  - required:
+    - syscon
 
 additionalProperties: false
 
@@ -46,6 +54,12 @@ examples:
                 compatible = "qcom,tcsr-mutex";
                 syscon = <&tcsr_mutex_block 0 0x80>;
 
+                #hwlock-cells = <1>;
+        };
+  - |
+        tcsr_mutex: hwlock@1f40000 {
+                compatible = "qcom,tcsr-mutex";
+                reg = <0x01f40000 0x40000>;
                 #hwlock-cells = <1>;
         };
 ...
-- 
2.26.2

