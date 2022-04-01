Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472ABC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Apr 2022 20:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351738AbiDAUMp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Apr 2022 16:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351712AbiDAUMk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Apr 2022 16:12:40 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE8B21C071
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 Apr 2022 13:10:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bh17so8100926ejb.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Apr 2022 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9KUw4q+j+PkM/aYrJwy81EirlGgfz0uvY4K3Ls2IZB0=;
        b=BpFwrRepLyui6gXaecZa3WVCkf/wzwdD1YlV8iGfLjjORT55EyQWplOvSvoLViR8xI
         uAAHTh1eccIdfJi7b73lfcDaXLAGRXGRqYJJFXPZrcfm7BDp9wY6GKrL4BC8GlL0Hzy2
         wg5ztOn6Ar8uQQkgJGZfDgxCgmAWm1WHxCHqxkZ0u9ycwDWInZdp8OKItOsK2MIRsn1E
         CT0+wLRWJPNxnQ9VlGYTs4ZFj6WsRo+q0Kg8/OdIsvQcdoKPd5cGQFOm4rdrj/3iJVXT
         ER7/hvLmRk/KlVU1ZIu3d0cie2kELof6Kav2Z0HSBwaJpkpqO4YEC1zxW3qbSye38t1T
         ka8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9KUw4q+j+PkM/aYrJwy81EirlGgfz0uvY4K3Ls2IZB0=;
        b=C9Rd8tFrPK5XLJknm3CdXCS8XePuwulPl43iZLM3twufnk3QQOb/edoJpV+gi/FwgX
         F1YnKz1b6JvWQiNTKAB3MDd+qpEo1Zokk1nWiz9YDQFvEuPykZG21qF6zT9/gzEEFTeZ
         J0Kwh5OS4AAK84cMVKLkQwHhchAqA5vbFkDWXz0VSMG+Vne0E5rfHCj8b58TnQaIb/et
         dzy13yP3X5/crO4JyfWQo2uGcXhcdwvIKz6WvUTNXs57OijzBtmO2JY97VxA6XC9lQ6Q
         bfDVEznyDV8e8Y6eVanQ8xKIDux+JegymBHSgp1QsrH45XpmbPWLJKHLOiP0a3rbaNJB
         ZWqA==
X-Gm-Message-State: AOAM530uz4F6PDavvPugJhwd5X7SZscc20gGYhKhW0Kx4CxfnlzLUUdT
        8YejmjhHCs1HmQbjOR2KnllfnQ==
X-Google-Smtp-Source: ABdhPJxlK455fS4hKBklASLqBLdG2YFxVh3hWggdL4wwu9rjt+VAJTGViomKGuj5Q3ubvKQ4HPoO8g==
X-Received: by 2002:a17:907:6d0a:b0:6db:f0f8:6528 with SMTP id sa10-20020a1709076d0a00b006dbf0f86528mr1272712ejc.466.1648843848774;
        Fri, 01 Apr 2022 13:10:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/10] ARM: dts: qcom: msm8974-samsung-klte: move gpio-keys out of soc
Date:   Fri,  1 Apr 2022 22:10:30 +0200
Message-Id: <20220401201035.189106-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The GPIO keys are not part of SoC and they should be defined inside of
the root node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 64 +++++++++----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 96e1c978b878..6e036a440532 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -20,6 +20,38 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin_a>;
+
+		volume-down {
+			label = "volume_down";
+			gpios = <&pma8084_gpios 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+
+		home-key {
+			label = "home_key";
+			gpios = <&pma8084_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		volume-up {
+			label = "volume_up";
+			gpios = <&pma8084_gpios 5 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
 	smd {
 		rpm {
 			rpm_requests {
@@ -347,38 +379,6 @@ bluetooth {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&gpio_keys_pin_a>;
-
-		volume-down {
-			label = "volume_down";
-			gpios = <&pma8084_gpios 2 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_VOLUMEDOWN>;
-			debounce-interval = <15>;
-		};
-
-		home-key {
-			label = "home_key";
-			gpios = <&pma8084_gpios 3 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_HOMEPAGE>;
-			wakeup-source;
-			debounce-interval = <15>;
-		};
-
-		volume-up {
-			label = "volume_up";
-			gpios = <&pma8084_gpios 5 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_VOLUMEUP>;
-			debounce-interval = <15>;
-		};
-	};
-
 	pinctrl@fd510000 {
 		blsp2_uart8_pins_active: blsp2-uart8-pins-active {
 			pins = "gpio45", "gpio46", "gpio47", "gpio48";
-- 
2.32.0

