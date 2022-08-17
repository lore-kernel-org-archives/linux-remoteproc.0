Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A366C32771
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239102AbiHQNO5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239652AbiHQNOr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBECD50713
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:37 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w5so18962439lfq.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zKHY3dCKJ9MBQUb1nFG5BJ8dnmo7NmfzmU7KoX4k/sc=;
        b=I7ZGQFpT7TyHMGcPOTq3gyDtAPS8zEGPd42TBrWTkjoqhrt3akPHiIf+w4B76q3aiU
         3XI+IhkIVY2r3Iln2cKulCNu3xUaNftz1cSQrvJOifhtA316/9klkiyve6BFAPV1d6VY
         7IU70Xb7QNLpKjEkw0Nwv2vr5dKAB23qe8xhrOtM2iIFHG8JPHF0X382o+ioejbk7DZe
         VPknovP886k8IVr78GTWmL/eyPg7VtoMZjCn9JTn9iGnbCgPfwiGaZlMQqHoTFGdyKMM
         9sE2tpSW5DcEJvjaVVBPzOadXu6W0EVGWoaIjpd26RlNBHHvh1EM8vjudDsaBcJ7XFrF
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zKHY3dCKJ9MBQUb1nFG5BJ8dnmo7NmfzmU7KoX4k/sc=;
        b=XxWFsxrOzwUzhrbYPqrOQNkxWBDscdlZ14sZBDo+dzrTNUz4y3CWkfj3+73YM0fBxE
         PSZg3yj/JLDui6dY/kBIvKao2+6BUQzZAIKsscE3gKP6rsGjP1MtXLN6b/acaQPQEpPO
         Nq6GIaFZzCwkCigSsZlgXKS8PD+3oqgLZGt6PuZLJ/SF7/+QMeBpYG9q83EX+3Wb9VIZ
         FQFf6K6dP1TF0fJP7njj2/A8cZR7KytLR3lXh8i2Z5U4DWd/D5Z9tN3HoBxmtm2flgOB
         RxuLhAeo8UjXb+unbFaikKlV41GpRcdlwSin1kue9gzAp520VviQo/DQ74IeXHmTEYmw
         SuQA==
X-Gm-Message-State: ACgBeo0RrhTBdHrPa+KXE4ec6M39KhgebTNqv2aWXK7I5ZDvSd+ylP4Z
        ZS3fwlQz8ZCrokXiERgbDx89Hw==
X-Google-Smtp-Source: AA6agR5XGF47v4qdgMgUliUXwW/xR14w/+9RDtpKsUFcdZ7p+r7vapl4D4EGIFCR+LZwwiSCgS0Epg==
X-Received: by 2002:a05:6512:32c5:b0:48b:969a:9c24 with SMTP id f5-20020a05651232c500b0048b969a9c24mr8389425lfg.300.1660742076344;
        Wed, 17 Aug 2022 06:14:36 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 10/12] ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:13 +0300
Message-Id: <20220817131415.714340-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'reg' is a required property
  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 4b602410d72a..5f674aa819ae 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1228,9 +1228,10 @@ smd-edge {
 			};
 		};
 
-		tcsr_mutex_block: syscon@fd484000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8974-tcsr-mutex", "qcom,tcsr-mutex";
 			reg = <0xfd484000 0x1000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_1: syscon@fd485000 {
@@ -1719,13 +1720,6 @@ reboot-mode {
 		};
 	};
 
-	tcsr_mutex: tcsr-mutex {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
-
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-- 
2.34.1

