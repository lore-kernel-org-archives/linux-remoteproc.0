Return-Path: <SRS0=rgFL=6O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCF3C47247
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 18:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 526E82082E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 18:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIx1oXjr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgD3SBb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Apr 2020 14:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726380AbgD3SBa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 14:01:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045C5C09B040
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 11:01:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so165510pfx.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptgh2/1279PcmgwwRPQcmLMSq0T7hBYsw3s8yDo8jLI=;
        b=PIx1oXjrOK7BYxhAUE+LXwRfI/GBeEr4ErdwjOYMNGSaB4a9NUgrr9/zN7DYHZ4b8k
         UsSW8WXpaZvTSF5+idEz3jzZUl5Pa1USyJU5gA+OnhVHLwMo0DrUIpQMz4eVor/55qWg
         zOL56wRI1C7ug6sqZeAS8NXsxj22pXkzKJKKCbBhNOeF4RDd8PgMiEzrYoaffwhRuR2e
         ffET6v166TCBaNtoGF7Drj00Faal2lwUAUIcRJUrFn8ANwsfu0JoJv1B0nhNL6vKp5/v
         95hwCTtzAnEnntJCoPCRcdaO4iTJe3nKlRblHnW3mJ6hjs6SRWQqeUy+YrSJRayK0F39
         OilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptgh2/1279PcmgwwRPQcmLMSq0T7hBYsw3s8yDo8jLI=;
        b=hpD0WKxs1gT0yzKHAomLe0XPvBrfYlwrdtpv8RtODWJ00IxNh5WLcx+4YacSV2mCS4
         /7pTXkfxbelly17rcNIW2GAF2gqeSLZURg2x+sg0jMhlepB9O9rezrtzXhnRiEXVv+Sp
         hfxtnjz9ko1cmFV8s+Of0YDeLe/emlhdc/102b9yrcnaannC0VZz9pf1Abs0iUL7ZC2o
         JrYHWS7nE1JlQzD4fgoc/JvBOtDftD615DqXrV3d9gJgPAdQbW/oIUtPppwqqOqVFuEf
         6Ceh+dKSV9tk3h4OiBgZsfJda1K52yIWZtiBGjciII3gHJJR4j8z+9rJLC77+hiubLmP
         KIkw==
X-Gm-Message-State: AGi0PuaHWFVzffXhjc/AhkTiK3Kqw1xF192sYudpvsRbLU05riIqFsm/
        mpTRinZ8MudTHaxqDANr3xjp+Q==
X-Google-Smtp-Source: APiQypJ0DI4Z4f+sjCwlpGCk/Hib857vv5XoecESdXSZl9HnFZ8XO7QR6MZ+M/LyLNg3gwfpVswZYg==
X-Received: by 2002:aa7:9a4c:: with SMTP id x12mr492559pfj.263.1588269689346;
        Thu, 30 Apr 2020 11:01:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o68sm357741pfb.206.2020.04.30.11.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 11:01:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
Date:   Thu, 30 Apr 2020 11:00:51 -0700
Message-Id: <20200430180051.3795305-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
References: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
binding and driver.

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Renamed adsp power-domains lcd and lmx

 drivers/remoteproc/qcom_q6v5_pas.c | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index fc6658b523b6..efbc1777000a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -508,6 +508,26 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm8250_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data msm8998_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
@@ -553,6 +573,25 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm8250_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -604,6 +643,26 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm8250_slpi_resource = {
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
+};
+
 static const struct adsp_data msm8998_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -644,6 +703,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sm8150_slpi_resource},
+	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
+	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sm8250_slpi_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
2.24.0

