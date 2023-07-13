Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61ABC04A6A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 13 Jul 2023 07:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbjGMHXI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 13 Jul 2023 03:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbjGMHW7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:59 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630F0213C
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:57 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so2918015e9.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232976; x=1691824976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFUQi6OnF9bs8nJtTX/TRFzCi1Y/q9xnjKXZLWVR1u8=;
        b=M5zXkBkaxgT+Hex0mKeW8oex+TyLNEeNFdX5fTrR6UyMnTEJZxJqFFvQqQFH9Ct0Z4
         tiQFbeeMEPR9Yr11FFGwP4iZTQCVsMn21YbtXYSlrGlqdLQhBsKNDALTP3p8dLrbCi+v
         ZHxPxfF1em4N6bsUpkAhH3kA6xydKv6Q9TIoITSSwzUtF+sjiOe+Z5DpdbAj7EcdSrEA
         PXNsL84UXIgjumjZXLazeFYanKJkfrnsSDaLbutHv4xi4Cl6pHyk0tLuGegEz2fc9fVn
         FIDsFqeF4L7FU4roCQ4a2QJXGkhxZci//P8GL9t8ihrtUF69MCxHIGTfM5CfW4IhzmdC
         p1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232976; x=1691824976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFUQi6OnF9bs8nJtTX/TRFzCi1Y/q9xnjKXZLWVR1u8=;
        b=fP2aAjraqK/A4OJ5jS0NKOeA9KarmC6GCD/Z/C4vZE/ShTDuE+/uEeanEsCQXMQU25
         Zc5tmSxkMNOBf6bTQe/x48eh71dmqIDOjgaZ/InviesAbtcA+UiOEPr6G+GQr8LRQp/c
         Q/YjxXNllJY4SHKVg8aP14xClEyco4UQEs2LLKFikLRYO3ZKBwCBv965fwe/dJ976lrS
         xNqNzVhjKwnhD7O8MrVh+FSrX1szOkdq313CgbAAvgIeXKu+BRxKbLYZBzQDdsYky1H1
         HcJDhzQRA8dfV6mPTnZi6sSVXR/ZotD+BlcX9b1spHPBFo90D/AHytU9ucfjlnwvQLfc
         HsRA==
X-Gm-Message-State: ABy/qLaxsk/svXs9F7WTV/mcYxcJ54jgblEjxpjgZRtod9QTv8MZ8yRK
        AirG4XwJUtWtcADSfuU7o6D4Cg==
X-Google-Smtp-Source: APBJJlFnSB8t5HOJ82BbWQ3NZaaQFwrdEwGuewAhihdDKEuV+JMDlgd5cfplq6KiK0mtmi1RpYa0sQ==
X-Received: by 2002:a5d:684a:0:b0:2ce:d84d:388f with SMTP id o10-20020a5d684a000000b002ced84d388fmr726600wrw.40.1689232975910;
        Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 4/4] dt-bindings: remoteproc: qcom,adsp: bring back firmware-name
Date:   Thu, 13 Jul 2023 09:22:42 +0200
Message-Id: <20230713072242.11268-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The firmware-name property was moved from common qcom,pas-common.yaml
binding to each device-specific schema, but the qcom,adsp.yaml was not
updated.

Fixes: cee616c68846 ("dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Use maxItems:1 (Rob)
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index b571efe6d550..2edadba91dfc 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - memory-region
-- 
2.34.1

