Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA4BC6FA8E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 12:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiIIMyV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiIIMyR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 08:54:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E07E10BA43
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 05:54:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w8so2484313lft.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JVmh6rRJJh9fFbvfhhGsQ4CvxM0Mj/AolpCm/GBTJoc=;
        b=wOfgpHvifdpE4+bzN3l34seJRMNWvZhRIbBGmUwvWaUvhWKCASEoKuwIOG6o+8ZZoh
         77phVf/VfC7+kvLNg3XnaV5fIbQ5U4AVFxYyTwbFnMQPh6fDYxHeFcq3Ne6Z7uLWPS4g
         mMnqmZGmG4qZIbja65BVyblXatYAxhupEkqUxchXnznlzMrAnftCz4eDFPeiXOJvVHi0
         zWyYnkq5N05hDQ4k2N5ca9h6FX+8KuXROzzMzF5q3AV2tDgew76buO+dGFI14OG7g9p+
         kwXk0eMiDsrNDZVFGJ5/X/Pyl4XPjlyXEcIAG0QM+T5O/xrENHcQjmOD/R7vf9ooGl0l
         RWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JVmh6rRJJh9fFbvfhhGsQ4CvxM0Mj/AolpCm/GBTJoc=;
        b=4XNwpJnhGLOn+2jXNIs1x8mznqXJp/NLqpiexoAeYAHLGjFyq3YHmo655kXXKEW0mV
         qnwvul5og5Uvhlx9u6zNEcv8pFTdvMeFFbyrhuJnxZioPVDqNkMQKswV8QJZgkNUoEMy
         xZKz7s/8Ih/B6NACRJMYGRCaiv+OVXllHn/GZEx1cmm4/6UXnO42hcc3E/OJRkxETs0b
         AHaktNbX9DyUhsiZ4bzQxBWsq6d2bOrCLR8SK+2A3qcpkv01neFhHqZ76QKhu2yrCFsd
         htqaosdF3VmgJGZTBZrdeiujDvaY+MA0w380V0nFyuj07b7b+e4DjrhZRPbh24nYnOFK
         osAQ==
X-Gm-Message-State: ACgBeo2gG2n4OMKYmmbssS6/3FvqvH2iVXkkvuynQchf+eHonXEOQMb8
        wzCP/0dQST9UQVYS7jmtnBrmzg==
X-Google-Smtp-Source: AA6agR4JumIvJUyDuU0nv/yxtZRsqeAU42EMRkWqEi4H2x2NXWWNqJp78Wbm5zFZ7l/I8O3YC+XiAQ==
X-Received: by 2002:a05:6512:3e4:b0:497:a649:6627 with SMTP id n4-20020a05651203e400b00497a6496627mr4780121lfq.326.1662728053556;
        Fri, 09 Sep 2022 05:54:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a2eb0ca000000b00263630ab29dsm64750ljl.118.2022.09.09.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:54:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/7] dt-bindings: misc: qcom,fastrpc: correct example for GLINK edge
Date:   Fri,  9 Sep 2022 14:54:00 +0200
Message-Id: <20220909125403.803158-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The parent of FastRPC node is GLINK edge, so the properties should be
matching GLINK, not SMD.  Correct the example and extend it based on
SM8350.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml      | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 1ed0ce0f3cbe..439b3f4a801b 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -112,19 +112,28 @@ examples:
 
         fastrpc {
             compatible = "qcom,fastrpc";
-            label = "adsp";
-            qcom,smd-channels = "fastrpcsmd-apps-dsp";
+            qcom,glink-channels = "fastrpcglink-apps-dsp";
+            label = "sdsp";
+            qcom,non-secure-domain;
             #address-cells = <1>;
             #size-cells = <0>;
 
             compute-cb@1 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <1>;
+                iommus = <&apps_smmu 0x0541 0x0>;
             };
 
             compute-cb@2 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <2>;
+                iommus = <&apps_smmu 0x0542 0x0>;
+            };
+
+            compute-cb@3 {
+                compatible = "qcom,fastrpc-compute-cb";
+                reg = <3>;
+                iommus = <&apps_smmu 0x0543 0x0>;
             };
         };
     };
-- 
2.34.1

