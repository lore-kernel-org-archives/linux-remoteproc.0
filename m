Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B88C072AB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Nov 2023 08:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbjKMI4b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Nov 2023 03:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbjKMI43 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Nov 2023 03:56:29 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461B310FA
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:25 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9c2a0725825so638723366b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Nov 2023 00:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865783; x=1700470583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7LwuWo/xQR19drDlZX7ccinmtAJFTBRZl3P7VkhCjE=;
        b=HMvEqzIm3huRRk/LvVMyldJayReJUcIvxGNx6551nf/ecvuReoVKyPJYDRc90kO5D0
         4ti8Svgmr4NyuuVql0OtmxNYh53osg0cNqB2uul+sNjsv34Sr5Z2XD+5y+/S724wU5Zu
         RzPFWBIXQ90vubdusccSXjhLxWlkNCANazc4OuTRcQCiLB7qXPCHb3bao3gWWBAYkFdC
         eltMxQm3y4ZZR5h9nBL9sAQnoiERgaqI9h9Vpg2Ahio80+z1ekgGNQ1Kq5htWmebkfj1
         ICnGXKUe5DvTm4iO0bE36ELYdJ7bh1RA1CY52h2vSIEmyQWDO7c9W0GZZhdt1OEUXp/k
         XkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865783; x=1700470583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7LwuWo/xQR19drDlZX7ccinmtAJFTBRZl3P7VkhCjE=;
        b=PuJKiiWqCk/iTt+KLktA/5kVGE+NiJUWXh/44cGrLXcL8uEyUkM8RHjaSvsk7Lc8On
         5J9ePICl47Qjb/WJC7efrvF0+0Nq2un/XtB5HQHFSIAvXQt4EMhsiZQ3sqsk7UF9wLpo
         iRXE9ZQ1JjIz0eHBx8xuqWmnw5ZkE+fjm8sqE0eG7cZ9WGsOGN7t2FKfWAJF9K21/JK9
         pH3XgOBtYDSaPG72NixP1zm3W++SI4oyRNrRW3uRjUEaTQJTRWgzRtqZS+MfNpbYOfpQ
         urdWK24And1pxS9ZNJOucFZZmUe07EeDBjNW1vRQoYS8MxF4jARjxDLDjo+XWMbHB4YV
         MUEg==
X-Gm-Message-State: AOJu0YyhfFjsKGLa+AmHDdlJlV1iQjw0uuDHSVvFNaceP/hMss1w/ee9
        AqAYGz/2NuSBBM4WpNInSHq0Yg==
X-Google-Smtp-Source: AGHT+IG2SPX6L+vKzqIsrr5ZRHSaYCS1SjrAy3heGkk0fWSk/LQ6Ns4+4rDVY1OcAqIObc2tESSX3w==
X-Received: by 2002:a17:906:44e:b0:9e6:c845:dba6 with SMTP id e14-20020a170906044e00b009e6c845dba6mr3579811eja.66.1699865783665;
        Mon, 13 Nov 2023 00:56:23 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:23 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 13 Nov 2023 09:56:13 +0100
Subject: [PATCH v2 02/11] arm64: dts: qcom: sc7280: Remove unused second
 MPSS reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-2-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The bindings for sc7280-mpss-pas neither expects a second reg nor a
reg-names property, which is only required by the sc7280-mss-pil
bindings.

Move it to sc7280-herobrine-lte-sku.dtsi, the only place where that
other compatible is used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                   | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index 95505549adcc..203274c10532 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -33,6 +33,8 @@ &ipa {
 
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
+	reg-names = "qdsp6", "rmb";
 
 	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
 		 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5db468d1a06e..0d9cc44066ce 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2848,8 +2848,7 @@ adreno_smmu: iommu@3da0000 {
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sc7280-mpss-pas";
-			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
-			reg-names = "qdsp6", "rmb";
+			reg = <0 0x04080000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.42.1

