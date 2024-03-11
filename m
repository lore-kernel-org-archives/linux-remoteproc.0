Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053546449
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171252; cv=none; b=Pvs2K4YfGyCGyQBQV1Syd0b/JWHRjUA/a/+XceNj6G1RUqMlu5DwCIu18t9EsmQn1z4Z3edXtAcdW5rt+hoKUnY/SwEvGBgdXBmNIjivxIdbXrm4ZKk3zncIv76SWq879nrYEGzKdZxvYR5pfpAlG7qnYXP0t9qbmwGWJwzSmU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171252; c=relaxed/simple;
	bh=/rRox2SCMp2aPtxhw0s9fG7CibeCKgCzG+KHihK7+cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d475Tt/LRp5MHkgoaAuioAu/4bjFP+1045Ph5zKr06nHoyxdvGDWAS/sb9mHVc2qqkxgLV2IuoN8AFsiVlB6z1LE7+fwNjVIO9XSDDcj59QE420IkJccmXzU2AEHT7Nv6pPfN6UeWtshh4wepmoKBarF6yJIF10uXj2B2fwZ+3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSHpmVzO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSHpmVzO"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d382a78c38so53474331fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171248; x=1710776048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9pNS053BRSrQf0GTpDy4CzUV8zEU4LHHAl3/IMUQ5g=;
        b=qSHpmVzOPKnPkq9m7Fx/yDI9Y8BemxD0NFUvzPKEPg7Yw5p2aFkIO9Tvgdl3GDl7zp
         9y1jWk8q2lKm1KjPGXRrkh1yYVWKGutjzt/5XfoK31yALhwAJSSwbf45V3O1ox3W/zIl
         JeTMfwTCI3a/mzr7PY0A29R4nbegAWo/5UCyUB2wNTXi+jeqtn+2Sxp53j6VBCKDIeQl
         dkv3D/ZTaFmjfVndQT2LlxuFcVNK1AoD/DYpR7VkE4l7gLX3dyNAwqup8wh2eDcQzYAA
         CDuHl6fQ6w50xx44NAgZFoXp6hZS4tiPUX4WYdjN9rMwCA+SOR5ljb8r4vuhJVigA5rv
         BP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171248; x=1710776048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9pNS053BRSrQf0GTpDy4CzUV8zEU4LHHAl3/IMUQ5g=;
        b=u5DErECDSqIZrWf1P5m8EFCSfitMaLN2tiuxOvB4DVFYnqd5B7S76Y/kS1EptQ4n21
         VKPQ20dgYR8GoSRR94+GO4qd9ASnXUhEmSq6oc5lmZ9gWC5t2+JPsLQbkVLGKlnqL59K
         n/PEiGKh4pB2PEtOFEvz9N5SR0GVQLHIX8vdNMkdsgmRQ9MdJH7gLEDkuNMbsAYYFND1
         RK+fWlkGpgfDY7MY85V0T7agSiOHoAHYMUFBhWarJd/sJNhKk5uyrpBhaokwFOeCthGx
         cSPNE6T7zBtA6mTHCFRLdji1sodVg2nC5yuo8Ml2dV3W2J/J77lT7N4KqJbKFsVt6+Mv
         6xQw==
X-Forwarded-Encrypted: i=1; AJvYcCWnLDxHDyfNqtD9Pvc65sSV29PX0A9bAfzHbmyW8Q2io/UAHoDeDqd9AC0Xnm94i/XEvh8J1Sa3jcNPYXFvUlTbG6Rfh5bnIPr6TOdJG0Gx7A==
X-Gm-Message-State: AOJu0Yxy5X9ABmxpXKluX7gPW5NnUKIhSdtutVGGItwt0tuGFR/dkb8u
	1v+ovwB5OSXj/6vP5lD9GzpwPB9KT3uks/HtIwgvQbvZBWe4LEsRcCGbr3HXGVs=
X-Google-Smtp-Source: AGHT+IGHrr/40zH6l6XcVU6ripxwLJlGeA1jdobwtPgb87/UbiBVpjR2tKXNGtH9WVT+k2K0SUtqZg==
X-Received: by 2002:a2e:7a0d:0:b0:2d2:e44e:a5cc with SMTP id v13-20020a2e7a0d000000b002d2e44ea5ccmr3952716ljc.46.1710171248533;
        Mon, 11 Mar 2024 08:34:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:04 +0200
Subject: [PATCH v4 4/7] remoteproc: qcom: pas: correct data indentation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-4-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/rRox2SCMp2aPtxhw0s9fG7CibeCKgCzG+KHihK7+cQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRr9pHLjHae9zAu0qKs64ChMHNWt4YnJ11xz
 +F9j5HYDYaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kawAKCRCLPIo+Aiko
 1Zo+CACZp8M/mhg2oF2BTzPGLm8EAWhyAwUGCNLIhyET4QAAxo4W99wudk6F5b6PHdoVbjAfZEm
 e5X1HQ9MaVnjLJx6Ri0rlwN32GUxcyz8z30Cf6UB0CWjMc8ABEFKIkTDeIw8i8jCYZcyWf/iftC
 7IW4CuOeuBxCDY56FNwicovNyTD4ZpLFkHkhF4al8eIMDL8eMBawGF38AL4+iRtqLCiV52nFZtg
 Znxp1l52sfytQWGg9vQVrPAYKTOcSeC55wFHc2P5hPRifL/jt5TJmZ19E/XQtYlA4+ixpDDPyQY
 TpP4ke+nGdyJ1dpjeqz0PaitItyxUawAKsJgR4JWvYLRi8Sf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Correct indentation of several struct adsp_data instances to always use
a single TAB character instead of two.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 124 ++++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d0b1f0f38347..3235249d703d 100644
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
@@ -906,17 +906,17 @@ static const struct adsp_data sm8350_adsp_resource = {
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
@@ -1063,33 +1063,33 @@ static const struct adsp_data sc8180x_mpss_resource = {
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

