Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E3FC6FA82
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 12:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiIIMyN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIIMyM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 08:54:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64707102D6B
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 05:54:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f9so1784328lfr.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=75CorfCsd+9LhpjM0urxQbB572kQdfftYJf3yRFVugE=;
        b=EjrWFSixA3swGXmE4+agZjoTyXw2COYEhdoVGhqoZfFh6dAQUCjjHXNcBWt0Zo6W1Y
         eT3q+OVG/hB8DK7yLi78ryyo6qtzAxB3tBb9vt8779ECIqYgwjbYWYT1VE568HPDw/1v
         WV7e3KpRn2oPhVd2G8TnG0TpDrT+KedlUVu2quyo6IDjszOifo215dAanza1ubv2Efqv
         wLMEHGyDpZqr/r5jUDdaDnKJqx0zg7AD3O7fcO2HgNcg9LpgD+pH14nEuQFnARcFAk4M
         GJ822onSUnJRmYRVXUJa/Gi6WmJd25bxdyFjqDgjJl5ZtnbnfNfwv+snRkhNTnvMGEfa
         iydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=75CorfCsd+9LhpjM0urxQbB572kQdfftYJf3yRFVugE=;
        b=WjSj7KM9UR6sgYUXBJPWmZloC6Sd2qZ2fC9Pku+/zXaWTEbS0fS9OVe7YGXPY+ThHj
         cImujoQiUUKP5S+3AUQyjo/oKdcdo4qukdliCHEz8q6x2x7wZ0lcv24P7Hg7XWho3Zrc
         z8ppLMLqp/M1vYqzK84ieqNZYkZE9Lxe1TwUQP2LXfPxdoFNSXvDJIrT3Kek9IVbDnMF
         tXiblJIwUn8USEk3D5WsOfvBLmieHJm73WSOcYjm+8JETfsm7er7kECCqnexD3TFgJk2
         r7xJVML0YXzxfsrbWA5WyXZ6mz0y2b5FxBC4gz325d8FKC6PeiEk0SGrkyqolU3w0ecg
         2NaA==
X-Gm-Message-State: ACgBeo27Zbf35mtJdYw1QkVlOB6RU467j6fk2xcqiKr9VUQPC0MI4M6d
        b5XNrTYhJVTI25KyxFD796IGJ8P54Ve73A==
X-Google-Smtp-Source: AA6agR7jxXFuX+Pfxbc5tkTSedio5EIlH8nQEA9HXEU4XdW/wvX1DiiYZpDl7eO5TM4QL54V3hgNUw==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr3703150lfs.472.1662728048697;
        Fri, 09 Sep 2022 05:54:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a2eb0ca000000b00263630ab29dsm64750ljl.118.2022.09.09.05.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:54:08 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: misc: qcom,fastrpc: correct qcom,nsessions name
Date:   Fri,  9 Sep 2022 14:53:57 +0200
Message-Id: <20220909125403.803158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The property in old TXT bindings, in Linux driver and in DTS is
qcom,nsessions.

Fixes: ed18a9b140bc ("dt-bindings: misc: fastrpc convert bindings to yaml")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fixed commit in Rob's tree.
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index f25924d33fa9..4b4072b6be1c 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -70,7 +70,7 @@ patternProperties:
       reg:
         maxItems: 1
 
-      qcom,nsession:
+      qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
         description: >
-- 
2.34.1

