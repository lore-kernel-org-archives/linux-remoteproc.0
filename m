Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F64302F3
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352258; cv=none; b=ujbWwFph/o2hrmMnnZMfbPOk7AgRpN2bmqkA+TS3J0QNaeoafRQA3bTyXg2W2+HuD9RlqxxJyhzneD1APZjS7WKP+D4/cdVRTqHfzgMsOb4K9MXzB96Cz37gMh1A1Z4X89t9cjfpUUOIbrn4iyvEVsdzbd9o+Ce8uDEjdqDqi2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352258; c=relaxed/simple;
	bh=TUuEJNqU4wLzG01rIl4chtZAWRhzSH3iv8oWrKxgGA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFP/umwgBVR2K9DQRkHB9WKrQXfzWgrfGH70NKq6HiebwmYzjjFWYLN5KLyGudqtmFzxn9Yk2CX59JhxL9uB2fZ68+lPF+bY/Lhz3p2EqDjpocmIR9TM0NrgexGEB9EC4Z1DfI4/JfLyvpK7t8lDCGqWMGpbKqIbPCWZ50jUQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0HxWENQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0HxWENQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so3310880f8f.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783352255; x=1783957055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IhjzN+h4g6gki0ay7/Layv3WiGV2FztEG2doa2t06w=;
        b=I0HxWENQka9jsFtJ3EdMrgvxc3l0Wz6kXFc0w54MI+XkC1ZXRtbZplkGLKPPj5zvMN
         WxWzoz5zT2Ru4SLtPJ/IL3c7u9RIcXGTXvk3GrDlTi6RJ34dUHT5yYZmdcBLW7uGDj8/
         iBmVfwGmGpd+DVaIP0k2vJassjD7xW4r3L3i+IGnq64ow27llijUKAuFVkk+bOhKgkOK
         /+MA/whqMTvogvJirZvyVLRBcBIJa0qRihFPfD1M+OVWedoGSSdLdF9VWv6N9l9Vo3ra
         S0yxFuo/p2dSvzSEDbyYOdE/kmuolB8JW1wwVkNpm5palbbReplBuV8mDOn8gDJL+HOt
         aPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352255; x=1783957055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IhjzN+h4g6gki0ay7/Layv3WiGV2FztEG2doa2t06w=;
        b=L0QXtsXK+t+McdgVYrgfQ5yuBjkOBiyhONbZi0b1RITdLgsggbFZxPheWo+4CgSdAK
         e1vLNIx4/AAneh1tTq/nelw019QfI6E+wbmG4xYex5kTQosn51VkJEcQ+HsHYwGPsNTK
         pYKFNvwj3BSmmL7+vwqcIT2TcWs+FJdePlJ8PjLnmdnRhLoHUAn+1VX/m1UKQ1l+fdTS
         J0eofJRUFCD2kq1VGnwwDejtiPcJl7ZaqBBIy+51s2jdV2fhQ/hMLdq+IErFdRan1sFM
         Z9tEAtu4O4RVHQ3CmjuFTyhnT/W4OYzM/zVA63PhUETOY/l7ZqbvonXJBbFcPoRhwf/6
         7OrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXEXb7iAtG2D7Aagft20gK2p7ksjPalCVN1pdnFBi9mrg8y3ej4KbkGoKNTISEIZ6LJ6Qkv9ZF6XU/B9vtSRMd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qUPLlzcuAPkYRWt/3T8cvZi2ORaEm8rpZ033U9R4KAdiJ1+i
	wFSb6NGrynYOkKglr20Cr+SHzVR5aCHg55I/XwuDWHblPfB85QMB4ZAM5jYu09Op2jg=
X-Gm-Gg: AfdE7ckoB8dgvu4T7/vpvRWHtZnEBiTdwxQ4XjPhrnTps/wQP5rDuxIhU0hmilnsden
	+Cp07eqzi69jHPVVigx5JwzdCZOHmmLzDosVm1ThcMCIHSI7DPP6DTcnhdsDgGY+8VgTSkqzqin
	S100Dm6d9ujhVDcXlth3RTRQXm8IpiAgpggt5fbnDXNw3r4LYer2FGdK257ZO8brcd+kkGiS4BR
	+WzNUczVIbhD/MJ0aLqeDeBa1aTwVsLdVuaXquA7ki4HxfG4h3ZGfkEGdr1DEf7KWFX8IoNLvC0
	zwK0My7CrP/1DNNE7jWBb0nGcUv1aVEzyy7hsFAwwWQ4+7xS5qp9SK9wYi8yixX/N24Ke7+zIuT
	oidFg5izTMh++CT9O8zLi2FiDqNW04hbZOrswyP89Z2xXsp14t56/ZIEnVDxR+Bz+vUhKcHgN5l
	06e9Nyfh80MqpA1p8y0tQj1rvlwA==
X-Received: by 2002:a05:6000:b49:b0:47d:df96:c9ec with SMTP id ffacd0b85a97d-47de66d3108mr711386f8f.34.1783352255234;
        Mon, 06 Jul 2026 08:37:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm26216613f8f.5.2026.07.06.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:34 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:37:16 +0200
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable
 per platform
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
subsystem control (ssctl) QMI service. However, some platforms (e.g.
MDM9607) provide the service with a different instance ID (0x22).

Make it possible to override the ssctl_id per platform by adding it to the
platform-specific rproc_hexagon_res struct. The same pattern also exists
already inside qcom_q6v5_pas.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ae78f5c7c1b6..425601af50d1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -162,6 +162,7 @@ struct rproc_hexagon_res {
 	char **active_clk_names;
 	char **proxy_pd_names;
 	int version;
+	int ssctl_id;
 	bool need_mem_protection;
 	bool need_pas_mem_setup;
 	bool has_alt_reset;
@@ -2191,7 +2192,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
-	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
+	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", desc->ssctl_id);
 	if (IS_ERR(qproc->sysmon)) {
 		ret = PTR_ERR(qproc->sysmon);
 		goto remove_subdevs;
@@ -2271,6 +2272,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sc7280_mss = {
@@ -2301,6 +2303,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sdm660_mss = {
@@ -2334,6 +2337,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sdm845_mss = {
@@ -2371,6 +2375,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8998_mss = {
@@ -2404,6 +2409,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8996_mss = {
@@ -2444,6 +2450,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res mdm9607_mss = {
@@ -2479,6 +2486,7 @@ static const struct rproc_hexagon_res mdm9607_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MDM9607,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {
@@ -2515,6 +2523,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8909,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8916_mss = {
@@ -2562,6 +2571,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8916,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8917_mss = {
@@ -2606,6 +2616,7 @@ static const struct rproc_hexagon_res msm8917_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8917,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8937_mss = {
@@ -2650,6 +2661,7 @@ static const struct rproc_hexagon_res msm8937_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8937,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8940_mss = {
@@ -2694,6 +2706,7 @@ static const struct rproc_hexagon_res msm8940_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8940,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8953_mss = {
@@ -2731,6 +2744,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8953,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -2785,6 +2799,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8974,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8226_mss = {
@@ -2824,6 +2839,7 @@ static const struct rproc_hexagon_res msm8226_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8226,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8926_mss = {
@@ -2871,6 +2887,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8926,
+	.ssctl_id = 0x12,
 };
 
 static const struct of_device_id q6v5_of_match[] = {

-- 
2.54.0

