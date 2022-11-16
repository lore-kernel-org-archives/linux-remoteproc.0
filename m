Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FD3C43219
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 10:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbiKPKUO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbiKPKUK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 05:20:10 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C6D21829
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 02:20:09 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j15so29146536wrq.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcm4FzP5Zqll4vx+qLC4Zs+d3QrWbatabIiC6u6r60g=;
        b=kxws/zHmdiQFoJ0eF54UCY9nbuWQ9mbC4IGNSA5IcisVZ6M5MY0eJjRgoKDOYUZGym
         iIzr9SUaDi695Pbvz8Xy1rfbUY1tVLVTefUErWMIspw50cwFD4WhuhFcsaARZcEcI2Xd
         98iyUzINb+keCA5Tbb/0AIL55TNLylh/2WX9HlzpXZ9vZaQZnnfMSoGHHIVzRQw+hdU4
         Su5B1NdY+FtUfKFRqZ5VhPNPd+o1roQm5b5kIwarQ6/CwDbDp8iOUuwF8VW+F+SWWxso
         yUKgjQVt9IDuI0qW2Akh36oX87ER3t2Yv+wy6WD/C1y4+Mjmh4hJ0tvCV/DfHI04Mqcz
         am+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcm4FzP5Zqll4vx+qLC4Zs+d3QrWbatabIiC6u6r60g=;
        b=xTKme4RQsd+U2u9fzEQzpwu/8XBIf5VVFrICM6uAQ16Tezbj6pp61kv9naiz8W1Nkq
         AGX6bQz9FCkS+L6CCTOAU0kfhd5dfu3jeerXWFVR2XQT+229va92iXETPWSuz/YyJhlf
         dZUxbGYQ1X52AxBnNp6h9HjYPOLynTvqvZfxwhanjpDXAK+8BVY33BBigHUJo5T0sp3O
         46RzCzPojUwKsUTsnqVOaplYdnbMU44QU04sZDJxmxMxT7BNz52/UkKEMFboDVCVi+vU
         V38/VNj12h0lNGcRGk5GFkO32FRGEQfsBF24IcHssLF2Bbbgj4P5fGnOYv7zjgTfEJyq
         T5Pw==
X-Gm-Message-State: ANoB5pkHHeF9qJkPZDCockP0SYTA0wm1qMileLxUY5CLJJ2fC2LsPz6X
        OiI6nRkMSwLm2IhBBnqng1TfAw==
X-Google-Smtp-Source: AA0mqf7OyflAEmqc6dCA8VV2BTVg5hL8XYlI7G/+OCSqOxDy+T3BLdadJXZXgwOKDU/Y47R45OBB4A==
X-Received: by 2002:adf:fbcd:0:b0:22e:304b:cf66 with SMTP id d13-20020adffbcd000000b0022e304bcf66mr13304375wrs.308.1668594007976;
        Wed, 16 Nov 2022 02:20:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b003c6f3f6675bsm1709900wmq.26.2022.11.16.02.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:20:07 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:20:05 +0100
Subject: [PATCH 2/4] dt-bindings: misc: qcom,fastrpc: increase allowed iommus
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-2-104c34cb3b91@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Abel Vesa <abel.vesa@linaro.org>

The fastrpc components on the SM8550 SoC can require up to 3 IOMMU
entries, this bumps the maxItems to 3 for this purpose.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d7576f8ac94b..1ab9588cdd89 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ patternProperties:
 
       iommus:
         minItems: 1
-        maxItems: 2
+        maxItems: 3
 
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32

-- 
b4 0.10.1
