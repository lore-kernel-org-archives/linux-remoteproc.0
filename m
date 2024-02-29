Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1056D528
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247637; cv=none; b=hVcZUh7AZ+/lVaIrge7/6/ZiMB0uzKiq9SYbvgCJHxy4kGgUsKGGfTnGEwSNvOzhbPGijR/Z4t/TW4jEmfWRqoW6KijE2FwGRNCOjZMznhS1ibwIhT2HZIRTKvBnOD18ZP8l9HffVTfkt332fo6LSxl+TRqTgLkkl6qwBF0PckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247637; c=relaxed/simple;
	bh=XYGX+zF3BNyZlfkUIRLibz5N2K9RVk8uHgn6Fgxn7YA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P66xLnB6T1THBVr8MP55F1BaKjcyvXqHCoMGLY97ruBRuqBPxphZuvdqG9k5BXpuceulitQphinbKaug6wKiay+dmtqzpCiIP21BlsI4bT2QihI6gz+3/OZbRbgqDnMQc5eB6bNcjw8ojrUwK0I4rLzmQMGuE3Rvypl8OmMTOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEX1iX/O; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEX1iX/O"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so1543149e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 15:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247634; x=1709852434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FHv5TL8WSnGkR0H4zIeY6ZYWrWfrxNh0+ekkxXEzqk=;
        b=OEX1iX/Ou3OgpmvMLeMCXs/1DqXoHH0qkRDFUFPVzGa9b+b0oIDkHgDoQRBj+6jM8F
         vDK15J1J/1YyHVLzy8ilGoU0F9bP7YPelpBu+Ghi5IU5CFZr1yOJSDkzk93yCUu9nasN
         TcTIOO45Pz2LRSuhi2rUCvFhn3Z8HsBZE+uvrV3FvutwqOxAsuOHB1QsrUz96ohudHbs
         DySI7BMC9nraci4ro4O5RMaTKxbKM6ZPEIp+rTj98MrsUbvKVpubah6vW9O6EQ/HYPfL
         QYt5S3G69VVo/eh7EuWCM83uwq+MGkMRtwDCN6A5MB9q6o7Bb4b1sS6sT9ohiNGUO2tC
         RZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247634; x=1709852434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FHv5TL8WSnGkR0H4zIeY6ZYWrWfrxNh0+ekkxXEzqk=;
        b=PEsz9XcqxaYmLEs7ErY0PlvhYABrUewLZ8adxuMRfXg3hlzPgvUhx0tsLKUWJf0k0z
         4Bp7nvrV7oojfkBD7hqO3aawq360gbPKby4bsO15GijieAMPpt99xHtwgDz2GFIqoKow
         LFBpaas4c0I8GsmkWB1s8saWEmebbzu9aXeDOLVTwgiryxRUEzsUZ/4UEJjlS/EGOM0t
         C7R9yXuBuH9hTwFlObH9AuUK34uWNMzJ/KirVrcS2DWmXuLgJ37Ru52u7MG9LlToPStK
         g8c6uyvMAfeYUnadlu7j12pA6Sc0Tgb4ozeCQXz0CRpsSBDZQt4sRG5qKJG/sVUcwpaz
         Y3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn2cqxSJ+kzZUs+WM3w1TtOTKttnLNyG6A+at4fLGu35dKs5Rg5TD2Sc+nrjYCrLEoA7f6BXwWtrcOX8JwTpMWO14FniC6KvPTik7GQPSGnQ==
X-Gm-Message-State: AOJu0Yw303QdKofUDkiu7Tvgvu0wp0nLvzZQ4LG8/+7jUVbWVOQ28xxp
	89IxrViTO+JDT6KaEBVqUZ6N7nZbEisywP0p4xnoMYY1+dacwAcf3njNry+CkMg=
X-Google-Smtp-Source: AGHT+IFwgM3uP4QjuvyiZZus3LfbyhwT03NnwQtcVjUP3Ho2AlAIHvTfLGrJFPArxjKlgNPpGqw5xQ==
X-Received: by 2002:a19:5f19:0:b0:513:2999:5ef3 with SMTP id t25-20020a195f19000000b0051329995ef3mr14852lfb.7.1709247633894;
        Thu, 29 Feb 2024 15:00:33 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Mar 2024 01:00:28 +0200
Subject: [PATCH RFC v2 2/5] remoteproc: qcom: pas: correct data indentation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-qcom-pd-mapper-v2-2-5d12a081d9d1@linaro.org>
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4415;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XYGX+zF3BNyZlfkUIRLibz5N2K9RVk8uHgn6Fgxn7YA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOLW/aCpp6W6/Plm3+/Hv0SVOwd03ztXN0a
 mhtvXFSBAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1aPOCACUt763i6HGMFyRy2V7JylBhRBSrRrsa7DRBdm77IW7+h3NQg54u7KV90hFmlsLU/uh574
 7yyXAdkysQR7K/PQPjHEBsqVyh2qG4KqnZVCfHpEDEmaw8a9sE5AfnoTw5IA8q/8eYUsg3HF/95
 kJjs/1MNncTdQWgCf7NY9LOUI9ImUZ/mjEpTdMszM18L4d+NwJcyntOrM2e9MhrB1XVGP0ZrqK9
 AKj3lt0+7QHkqFS+ilFHjjhMZMe7ujt4S9SA6sVJLpXrrcqfM2ACCXUubJXMX3Hb+Ts9qoD6sf5
 uJHbQ1M5QOHI+MssprPH1FCgqR26GHjzAfgMTLaEdcNXhKau
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Correct indentation of several struct adsp_data instances to always use
a single TAB character instead of two.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 126 +++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d0b1f0f38347..3e34b9ff38ae 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -807,24 +807,24 @@ static void adsp_remove(struct platform_device *pdev)
 }
 
 static const struct adsp_data adsp_resource_init = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sdm845_adsp_resource_init = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.load_state = "adsp",
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sm6350_adsp_resource = {
@@ -859,18 +859,18 @@ static const struct adsp_data sm6375_mpss_resource = {
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"cx",
-			NULL
-		},
-		.load_state = "adsp",
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
@@ -903,20 +903,22 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
+	.domains = sm8350_adsp_domains,
 };
 
 static const struct adsp_data msm8996_adsp_resource = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"cx",
-			NULL
-		},
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data cdsp_resource_init = {
@@ -1063,33 +1065,33 @@ static const struct adsp_data sc8180x_mpss_resource = {
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
-		.crash_reason_smem = 424,
-		.firmware_name = "slpi.mdt",
-		.pas_id = 12,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"ssc_cx",
-			NULL
-		},
-		.ssr_name = "dsps",
-		.sysmon_name = "slpi",
-		.ssctl_id = 0x16,
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"ssc_cx",
+		NULL
+	},
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
-		.crash_reason_smem = 424,
-		.firmware_name = "slpi.mdt",
-		.pas_id = 12,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"lcx",
-			"lmx",
-			NULL
-		},
-		.load_state = "slpi",
-		.ssr_name = "dsps",
-		.sysmon_name = "slpi",
-		.ssctl_id = 0x16,
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "slpi",
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
 };
 
 static const struct adsp_data wcss_resource_init = {

-- 
2.39.2

