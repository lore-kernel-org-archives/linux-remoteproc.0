Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C94C6FA82
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbiIIJUv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiIIJUt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:49 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECE2B2DA4
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:47 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z20so1110378ljq.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NUd8YryzxRUKn1lcURqTFfrnvxH9vHeWn1VsvKW9iig=;
        b=xJWimhLub0oXBQsfHFFzufsAIM5B/G6nVkeC6YrI1H0WFrdIQGUkQ4Go9ZyN2o/WFA
         TXOe4IjLCQY70Z4zJoFDqebtmtTwQG+cshbGhY+Zb6jCYUDdHHACzp6eoLJUp2UPQ8sA
         iD2tuwlMi0wbpQyYBUS9BSLg2Ulv1QeJ7vxefK6nudSpz2opVtxAoJ1MWIJQ517SuJpA
         +eyjYI/zRox6GhZ4X5KFS3Vu3U2o1p3WBmNUtZ8K7rkKxoZ6MjAkt6nWwAmUuFrN5Ftg
         nO9jeytQhV9rfIOToUiZhxKGXheAcq+AlgnEwHECljEuId0PhpHEIMks320TPcw+aMy6
         94Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NUd8YryzxRUKn1lcURqTFfrnvxH9vHeWn1VsvKW9iig=;
        b=LM5cGImEeU7+sNsapS8KNDkXfPQRKopoxVsWpMmqdeoryQ3n9mwomTVrxCExV+QpLi
         BaUuDclZbt6MJWAg+d+KX7ihrYu/gWhiIrDJRDPQmt1OrbvLYjD+QmNFdWAzlJ4azS05
         YPtiXV8QkHkOAwV2/yzJAkiSvFoi4wjOWnxkN6pBtKAam2vEMnZjMNdSSrfLUVNzx36w
         OYrNbpvmBpz2WcpnSJvsOCQTqMEXnZl59cHyNrXxVbGgHbxeggizdePtnJqIyqI9AzDY
         aVL1rmAXa7ZvOErZRk3hbJYZVi+SemKa7p5vG6DWHFDmRiuqAKUBXAP9WlGr0I/TmMEw
         H4Tw==
X-Gm-Message-State: ACgBeo3lLOkUoRvdQOHyvciArtS69bPe2kKw4YQ0ddPj+tc5rFyx4H6p
        gw5+Cqd2zWTqhme9g7XWuUPrFw==
X-Google-Smtp-Source: AA6agR7iLxrcgl7jOT89xBXW7vAZ7vXYL3jjRlLx4KhM70KIeve8MuqL76+RDNtEkl+BzLZJRoXn9w==
X-Received: by 2002:a2e:9653:0:b0:26a:c786:a104 with SMTP id z19-20020a2e9653000000b0026ac786a104mr3419773ljh.183.1662715245632;
        Fri, 09 Sep 2022 02:20:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/15] hwspinlock: qcom: add support for MMIO on older SoCs
Date:   Fri,  9 Sep 2022 11:20:24 +0200
Message-Id: <20220909092035.223915-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
of 0x1000.  Add dedicated compatibles and regmap for such case.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 42 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 9734e149d981..9cf186362ae2 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -22,6 +22,7 @@
 struct qcom_hwspinlock_of_data {
 	u32 offset;
 	u32 stride;
+	const struct regmap_config *regmap_config;
 };
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
@@ -73,15 +74,42 @@ static const struct qcom_hwspinlock_of_data of_sfpb_mutex = {
 	.stride = 0x4,
 };
 
-/* All modern platform has offset 0 and stride of 4k */
+static const struct regmap_config tcsr_msm8226_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+};
+
+static const struct qcom_hwspinlock_of_data of_msm8226_tcsr_mutex = {
+	.offset = 0,
+	.stride = 0x80,
+	.regmap_config = &tcsr_msm8226_mutex_config,
+};
+
+static const struct regmap_config tcsr_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x20000,
+	.fast_io		= true,
+};
+
 static const struct qcom_hwspinlock_of_data of_tcsr_mutex = {
 	.offset = 0,
 	.stride = 0x1000,
+	.regmap_config = &tcsr_mutex_config,
 };
 
 static const struct of_device_id qcom_hwspinlock_of_match[] = {
 	{ .compatible = "qcom,sfpb-mutex", .data = &of_sfpb_mutex },
 	{ .compatible = "qcom,tcsr-mutex", .data = &of_tcsr_mutex },
+	{ .compatible = "qcom,apq8084-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,ipq6018-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8226-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8974-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8994-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
@@ -117,14 +145,6 @@ static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
 	return regmap;
 }
 
-static const struct regmap_config tcsr_mutex_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= 0x20000,
-	.fast_io		= true,
-};
-
 static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 						 u32 *offset, u32 *stride)
 {
@@ -133,6 +153,8 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 	void __iomem *base;
 
 	data = of_device_get_match_data(dev);
+	if (!data->regmap_config)
+		return ERR_PTR(-EINVAL);
 
 	*offset = data->offset;
 	*stride = data->stride;
@@ -141,7 +163,7 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
-	return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
+	return devm_regmap_init_mmio(dev, base, data->regmap_config);
 }
 
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
-- 
2.34.1

