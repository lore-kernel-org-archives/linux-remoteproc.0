Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E836BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 10:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352515AbiELKAx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 06:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352453AbiELKAt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 06:00:49 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE0E231085
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id j6so9086174ejc.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MAlRyJ0IHfdwsaWhxry6um/UE2vHbyKkhoLXrIb+qPA=;
        b=HQIdXAR/JBhklqnlGGuEgsJU1ko85OEMvZbET4FVuTkS/TTDxWbpsRpsew3xKXbcaj
         /G5Ol+0q/ZlDx0Z/Pl0ui1lNEyj0bQV8fzAWFHrG84sISyZ+XRZQGFg1JWe4CEquN+xX
         GxVjc+eGWPDg0xSWZd2n6urM72qu42CB1a1ltM+adEJJhMVgUijkACDrFFJ9WWZx/V1k
         5aEup+9P8KjxgdRADLEhrcvsRHWYs5P1QTgUVNs5tCDzmp2Vjl0QHXx3uPgnI3Y0TVxF
         sJVU/enibj3KDtfWPj2RvoBw8VmSZd9VivhdrgF09VHE1EAyjuKbXrMUF5p4XtudoNh+
         xijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAlRyJ0IHfdwsaWhxry6um/UE2vHbyKkhoLXrIb+qPA=;
        b=nfoGQA/Ra3WdKIiUDcAg25RUISLOnSKx12rgBjVj8KPb5XW4XgA6o/yv8jT9w2lyED
         rOt4QCfZyY82rajdwmaYOQVBOFGC51SI4yJwzvsL2XdT7xM/oLQyPOgzpFtQnUT37mzJ
         1nCMHr8hQT4RZ1MA4rokDBM3hpo4NQKZ+axf/YiA/H5kboPZXciG73NgmTMrwjSJLbEz
         NM+xIrl5KxAooc0Jz+uivPgfb/LPA28nH4Chw1kdzD9MON5xgo1nvVVgoIv75dg+yfEC
         xlvldJqrvES2FuxQHGjktQJY0m6reoMtQhFXOVSFThUdlYBPw/0mL2DcoluGb7jKVwIp
         kFYw==
X-Gm-Message-State: AOAM530fe8aRyNiSf0hXx1Ii02V0ryCbQAKk+YVlF9PuNPYxDsmmkqeJ
        JDusL+UR8xK0mFMrTdtQnhQiuw==
X-Google-Smtp-Source: ABdhPJxGNv2EEGDkjnxhKKuaa6cDWZmaGOgjKIXE75pBz7nY1wlq7c8pHtcpcsD3Aki/Tzwhu9tyfw==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id h6-20020a17090619c600b006ce98a45ee6mr29302193ejd.567.1652349628444;
        Thu, 12 May 2022 03:00:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:28 -0700 (PDT)
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
Subject: [PATCH 10/12] arm64: dts: qcom: sdm630: remove unneeded address/size cells in glink-edge
Date:   Thu, 12 May 2022 12:00:04 +0200
Message-Id: <20220512100006.99695-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

glink-edge node does not have children with unit addresses:

  sdm630-sony-xperia-ganges-kirin.dtb: glink-edge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index b72e8e6c52f3..8e32eb3ed599 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2158,8 +2158,6 @@ glink-edge {
 				label = "lpass";
 				mboxes = <&apcs_glb 9>;
 				qcom,remote-pid = <2>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 
 				apr {
 					compatible = "qcom,apr-v2";
-- 
2.32.0

