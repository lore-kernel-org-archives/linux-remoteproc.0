Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EC1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240441AbiEQHBh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240676AbiEQHBc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:32 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2873814D36
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g6so32842865ejw.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=KyCAbTTMVnROhAWhKMIJxpaFtqhASwLPlQnI6zyJnMA861UhvrMpV8uiyyYbcenumd
         pUsni593woFCYfRxNtulIrbjduv4JLZHLJXxaADspko9cA1csQmLvt0WXd0b9HXf7DST
         NTkmBaqOUXT6RnVjf+Pv16SYYmIvtRwbkXSCVoWMO3lW/5C1hCgLXLVFTL5z7CYvd5y0
         kFdKMONi+s7OXBvunWgezadfXxn13GJMgevy5L8VOoYfe9MwJ6eAbW8qS+1OFh+wb4fB
         JNFqZShDE41K8Js4Tn9ZaWLeT9SZt8VJvM5s/cJlXKzBDUa0FsXpIk/wdp2lX5DfeDNV
         YsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=EElFfdQu/wHxa3PEsYN5ZgA0k957GsqKQWChG18P2egqZLennsU5566zlhW/7LZi4H
         6AzIqJ6iKDorvuc9ui4FbvReOSMqXuRrBFxfJ/WSPuhNle5uP7lqqDK74OfBdMQmrZrp
         3CJ3+m1JGZKEwh2qrv+sCGUuyS+HRLQSebaiPDD6AbAXF/FbiqNQDL6XvI59xZg+fyQE
         JD+0+LIgDuK6qvcrxtnrLobU5NOLHoM521y+3gAdPwZPdixaKKaMzgAriHwkoGd9J7BA
         MfPfKck9CnQjwGkfHCiE+XULnLMpiw094UXlM6mo+lx7vqphAi57uZZj24mq9GirgBBa
         xjsg==
X-Gm-Message-State: AOAM531/od8IAYCli+85VT/j+a7wStOGZJEzSFxNer6rdrC3mpe/Fq+K
        eEHm/2rpoTNWuZLId1le239vcg==
X-Google-Smtp-Source: ABdhPJz1Wy90bvIuITitIqGO/uaK5LgSpxtYb8P9aCGxTkSHFD0DXaP3Gg6ENrsWV0WPKNQTxSgdxA==
X-Received: by 2002:a17:907:1ca3:b0:6f4:d185:9f46 with SMTP id nb35-20020a1709071ca300b006f4d1859f46mr18061789ejc.165.1652770888746;
        Tue, 17 May 2022 00:01:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:28 -0700 (PDT)
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
Subject: [PATCH v2 09/12] arm64: dts: qcom: ipq6018: add label to remoteproc node
Date:   Tue, 17 May 2022 09:01:10 +0200
Message-Id: <20220517070113.18023-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

glink-edge bindings require label:

  ipq6018-cp01-c1.dtb: glink-edge: 'label' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index c89499e366d3..9db30e7da7bd 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -621,6 +621,7 @@ q6v5_wcss: remoteproc@cd00000 {
 
 			glink-edge {
 				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
 				qcom,remote-pid = <1>;
 				mboxes = <&apcs_glb 8>;
 
-- 
2.32.0

