Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681C4C25B08
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 15:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240507AbiHQPBG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240714AbiHQO7s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:48 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2519D676
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x10so13818001ljq.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uXLJl3ZPkfkVvmcRHOHOBnFdkGCya/Ew5ljctJGYsvo=;
        b=Mz739lmROquora1yZgMUrY9fk/ZIiYOuibMwGUVRa/NqfDXDOyN/zdqWEa7Enf8X9q
         PpqLgDkksGhbM6mxoIWoieKR8OKb5V7XIpqIfekMJSRWcmOfU1xlm/A8l2NrO5WVJMTa
         ZkjpXF50pDioSk4I97iJ3qoSMIad5nGqv3rSBs4MAC33QEXBRy0fQkv0rEY5Mwd+TGGK
         Gpf2xjMhT1uG+ZivPSgYBLIqEsI62Ea0NtmLPQe9KmOrRJUPBIOoP4C3a/esPwXao7rA
         0eQ9IENx3pitiKKmwGXnMnca3ihM3yQ3RWAB2wLpC+TQOPMBSnRzHPblRab75YbkLwcR
         avpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uXLJl3ZPkfkVvmcRHOHOBnFdkGCya/Ew5ljctJGYsvo=;
        b=W3lWcGZOKNUHtiEQOzQ9gzoSnDtoyE6KuYVtZg/F6/N/GttDqzLWNUkrWXtvm6NQt3
         LHlGVZbxencOPHycrXMD57IlqYgRhWdNEyYPlY3/84U59stX2a9fEvDZKYITrhpvrDdi
         SiHQ5iM1riePq0Nhbrkt5aHNJkZYTEp52WQqyT2SWxGNLabLSmO1aQ3Tst9o+zSZ/eKy
         Pm2wdxnMGt8z0Gy9NF4hvrWuoXu9YSOVJEGnfrcooPWMDDgdNCOBiH9X2IPjfkpJLDO4
         MNa4awCxf/yFCarc4ZVcDRPr/nNjqKWG2K+JoOXA/myEccFus9Wx0SJGdH5oYRq44h7D
         5NcQ==
X-Gm-Message-State: ACgBeo0pCJn53RpDCNK2dm14RYd8Lg8gb4miruLa1RnNZLuj+0fEcGVV
        GhzTv5Y4mVJ7c1rry6o4VjyZ6g==
X-Google-Smtp-Source: AA6agR5w1v5MjGtkHGpkRKxdQBLlFkqUldMhJz+J/74QjeTM3pUSxYlINYTlGEqFty80EUNgC4q0/g==
X-Received: by 2002:a05:651c:158c:b0:250:a23d:2701 with SMTP id h12-20020a05651c158c00b00250a23d2701mr8680373ljq.475.1660748375315;
        Wed, 17 Aug 2022 07:59:35 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:34 -0700 (PDT)
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
Subject: [RFT PATCH v2 16/17] ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 17:59:00 +0300
Message-Id: <20220817145901.865977-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom-apq8084-mtp.dtb: hwlock: 'reg' is a required property
  qcom-apq8084-mtp.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 72f9255855a1..5e07255fe5ea 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -383,14 +383,9 @@ gcc: clock-controller@fc400000 {
 			reg = <0xfc400000 0x4000>;
 		};
 
-		tcsr_mutex_regs: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
-		};
-
-		tcsr_mutex: hwlock {
-			compatible = "qcom,tcsr-mutex";
-			syscon = <&tcsr_mutex_regs 0 0x80>;
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,apq8084-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0xfd484000 0x1000>;
 			#hwlock-cells = <1>;
 		};
 
-- 
2.34.1

