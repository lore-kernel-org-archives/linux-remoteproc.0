Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D77C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 22:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31C5E64E5F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 22:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhBQWV2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 17:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhBQWVT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 17:21:19 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCE1C061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 14:20:39 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id l3so16746685oii.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 14:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1p7xR+x/Ax3QtXp7hvf7+knlfVhECl9PbNNQU3Wa5CY=;
        b=TFEYl9E2ZTFElf1eNyDDZQVG5utiIcCQZoQZpzqazKcomE0pvgDmX9ehhPAPthH0kL
         eOrW4djT+f3uvJWG1IVolbo5/MfAf4MAPoAJfiixWxt0l10vgncALueCF6MXGO3/YIcJ
         Ppb/0eoG/QV16TsDEXo+MX1zJiM2wpEPqpeDry8Y/rdWTF9E7klQ/9rriTOU3o0M+GsE
         DIep3ZWbDimjvunJVihTONjhBJ4oE/UMkV9gLqShlMYN/3ryMvnMOQWAlJapxF+tfgaf
         hp4tpBZSqEYH1HsguLIkESuUUs2OkggcxnWkqM6wbXjiIn3BR2ULmxvcOtSCjlbQz6bo
         /apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1p7xR+x/Ax3QtXp7hvf7+knlfVhECl9PbNNQU3Wa5CY=;
        b=ITltxaMWc/+bnwN4PUVAmT9xS98VtE771RHoiYeBbi4yi7DWHlNu/HQLGXFnqEWXdN
         43kJi696JL1LAeM3P0MXz2ZLgEPNFIvO8QvlR6orS3kxmKe/hmwt4vrHinqv1QzG1B9b
         SA6oSZROJCKisAMyqRGttjQQmzfRpTlobKxaMRrR24FG7/RcfV4UtrRjA/WsmtZOuxFY
         b4r1gqEzD3xe3LbtdTGaRsNHVVVB7By5qb4nB/lbXWRP7FOXwHO+J3scMUyYWzOSwbm9
         OF2UtWPSuyVxKsM//Rz5PLH8lA8f6nneWm7SCBRSFVq0REuM7Buh8eXj0u19FYbX4TpR
         fgGw==
X-Gm-Message-State: AOAM532Ye/O8ikviagz0FUdyJWshg4QRt5fPxvbGY72uVvw1yXCCqfFC
        GXiJFmQhzbSAbvgSffBcMS7EdQ==
X-Google-Smtp-Source: ABdhPJz9Tp7sfz49yJeFgIVsuHF6V75Yrbkk3I0fz/SY85kLex9Fdy3o3FOxKrkkqD8QeVWuBwCzUw==
X-Received: by 2002:a05:6808:30e:: with SMTP id i14mr706537oie.50.1613600438791;
        Wed, 17 Feb 2021 14:20:38 -0800 (PST)
Received: from blackbox.Home ([2806:10b7:2:8299::3])
        by smtp.gmail.com with ESMTPSA id f22sm669028otl.10.2021.02.17.14.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:20:38 -0800 (PST)
From:   =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, ohad@wizery.com, robh+dt@kernel.org,
        =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Wed, 17 Feb 2021 16:20:06 -0600
Message-Id: <20210217222006.1419164-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20200108055252.639791-1-bjorn.andersson@linaro.org>
References: <20200108055252.639791-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index d420f84ddfb0..00844a5d2ccf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core.
+
 - vddmx-supply:
 - vddcx-supply:
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index e2573f79a137..ef80f5b8f20b 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -465,6 +465,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -482,8 +483,13 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
-			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
+			    fw_name, sizeof(*wcnss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
-- 
2.30.0

