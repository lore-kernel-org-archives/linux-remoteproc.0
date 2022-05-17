Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF23C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240623AbiEQHCU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240524AbiEQHB3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF46433A20
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:22 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id z2so32809039ejj.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=HQY/XKhJJ47vJX89ecJOgBcJXEoDja7yEsRe5wcWIsu8QaGJ2m1Dcghz5EmgQ3FIJr
         oTJk5/mqhhfdh1m/eCuJ2iffLzQdvYxFus6pfki7RqQ9iRuQFVkglT7vd8zBzqNWMRB2
         7OBCSLwbi8LSEX1ZKUC9ZdHXZ+XfO8o3eTY3UpkllrQvjJWD8e4NTY5jpoKyzVdFQbZc
         0oQJe2FoxJi88Ddlb18TiePefyEKxRuO+uTs+uk9Az/mraqj5tGef4HIyIFnFOR1akoT
         1C9/lt0alTRFJOdRVRSpwCjZhAaKafX4lRgAd0F2FLibWsiG/cmrU/vsiRHMA54O7UPQ
         /DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=bealswqxCO/7XzJ/HMwdQWhrc08fNyynoJe9HRliPyt+K+OD/R7ILhol8kXC2zuwdu
         xi346RL7DLDwyQp6Pwqs5/lRzcFyqXiOwnEcKv8SRsrLaWa/1kJCi4nHhvP//TmSTRb7
         lM+ephIEYcnP3nBPNhKBZPIT0RfBR/5st9ElVvy9b508z+4u4FnhSZlAAnY3RJ1EhunY
         Vbo3wLmKCKAYJpHrkoOoo/CoRVf0j7AgdnpNkzZ+iTt5wLNQGjAemEGvyRgfpQ6eJbDs
         FTWE6DR25+DfA62OarQUekbdldVdp5on8tumFv00yl5AxQJ/QJ9QMfLlzIE5Psj3076J
         INzg==
X-Gm-Message-State: AOAM532bs7oawk4J9jkuy5IXAUqCghYik5o/A2Hyi3piw4RRSi8sI/os
        X7MU6acxc/xGRw1anVpnrRNfqOapo905+rOz
X-Google-Smtp-Source: ABdhPJxTPLYtnDAjRe9X2IdxWarT1jcYAAPfoKCM0yNozDKFc/Ek6ZjA+hyu70A8B8uGnhpicokqAQ==
X-Received: by 2002:a17:907:948d:b0:6fa:7f00:ed57 with SMTP id dm13-20020a170907948d00b006fa7f00ed57mr18079250ejc.761.1652770881471;
        Tue, 17 May 2022 00:01:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/12] dt-bindings: remoteproc: qcom,adsp: add interconnects
Date:   Tue, 17 May 2022 09:01:04 +0200
Message-Id: <20220517070113.18023-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SM8350 ADSP Peripheral Image Loader already defines interconnects, so
document the property:

  sm8350-hdk.dtb: remoteproc@4080000: 'interconnects' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 810ef9d2bcc1..6e1fdfe91043 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -67,6 +67,9 @@ properties:
     minItems: 1
     maxItems: 8
 
+  interconnects:
+    maxItems: 1
+
   interrupts:
     minItems: 5
     maxItems: 6
-- 
2.32.0

