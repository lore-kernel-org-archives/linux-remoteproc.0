Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F033C43217
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 10:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352424AbiELKB5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 06:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352438AbiELKAs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 06:00:48 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1F6230225
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:28 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id kq17so9155290ejb.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=oQtJ1P1ICxbjuMvyKGc4PrOAjOYiXbWwf9h50atcRuWJ3tVM+EDUHiZUwhHWJRX3oH
         KkcXY+UDJL4iCFU+LPkUAwmbiW0xc+fR53Z7Tiyc7BmzupNQSbNqNvoikVrwctwew9HN
         Evnr3mYbJv2yxkkoUTsjSqEKXAiSWHn2z/D1ZGnSjJ7t0U90qwvUsieqTIvlMRLXydhP
         jBIwSBQAMGT4icJxcJZRrjFhYoUGwlzQpiIZF8qmEgXBBmeRvXOiw/tISK7utNTNxYaD
         /IexxpPTLBnJzv0kUIAMI66JSMoKjOCrK/CUS7LMU6FdtR7L2u/+E/ZLOl4OFWhZXrvu
         3MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=6+eOlYkXAfrjnAsVaAnZ8JWlUQzhIwHieQmQj5SuxUH8cHctb5V97op5fqLv0bfsYt
         Tv23ztB6Ay8xmcUFRmT/UQ5gwGdsyA/+ANffeHP0xRdX4t3+chXES4uXZPlM6kxqxKOw
         4bcgX6cmXcoUJ019I+lHr958u9fPbNVRKCOjdjQ56ETlV0SDEUCuPcnnOhqbe5XzHGI0
         dUKvfOqh4cJZmM4FKwrimiiIzvRaVkEd5CUZQL1m8Smqp9c3Dq4ubCucVzSnJYx9IuTM
         jtbe7B5WGBwli3/H/+wakhRKJR6cKVYxJMCG1v/oVvliT1h6d4Dku8LWuz5QghqjEBOV
         CovA==
X-Gm-Message-State: AOAM530PqHD5YhtTZnJZbtqKHg808QstR+sSFGuK0Uz9roUdEmswqpA2
        i0cfrqJIM6tkx77QUVSEYntq7A==
X-Google-Smtp-Source: ABdhPJztglS/DsrXYvgSkRA9NmYg98rfTUoXDYryxBoafF/ogKr7ATiW2uZke/W9R/xOYWc7cKdl7g==
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id nd41-20020a17090762a900b006da79534df0mr29302869ejc.316.1652349627443;
        Thu, 12 May 2022 03:00:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] arm64: dts: qcom: ipq6018: add label to remoteproc node
Date:   Thu, 12 May 2022 12:00:03 +0200
Message-Id: <20220512100006.99695-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
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

