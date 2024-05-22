Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9D13D8B0
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379737; cv=none; b=qsgXU2CuO9pjHGGja8Jwxm/XYDeIO6yfBq6HsGbLxGfoerF1A63BM+zwSJi8Qy3oj7EMvP9DJl1ZOnJy2ZaLS5mgCXWcGM2zWZKrGVfVN90TYrzo2jj4FICrkJQ6JPth04h8AwUL41wAY0ockYKqaO2OTe3RoGWoss/rsFAVQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379737; c=relaxed/simple;
	bh=WC5t9WJX9lXcwGywBsZysQERtwOQQGRD77DNGgPmsMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdyDE3cXoJn8X2pOaptdIfE708Pf4kYqaxX6K6wYSioY/4RfYE6L/N5GyfFQ2j0IlwK87/SAhOMbvfPSCwK8h2vaMyol7SlzGKSvPbILkuTyEqHVm7Yq/5e6Kmun81XyE9WsezahQokt2C31fVUfZdDXtDL7K2q4Ju/uz1ZyM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hEF1BFSU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hEF1BFSU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so764055f8f.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716379734; x=1716984534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Whg0Dc1FYMXBytTq0QfKHAfxqeAkThzFIKkCrZ14fSk=;
        b=hEF1BFSUkjw7Fi6o+VHaDSlxfk+vqWBuymhjNbk9iONAJHsVaSW7O37minGc43Aa4x
         9/U3S1JJMFAhGB/2tZOnd68CUv8sJccyzhPXFuwHb9aoyTQlojGyT9a1M2Sl88cOYUtI
         QKQQPzdjqHwB6wU7xHPTgXd22mHejFrMCCWxGy9atetjehvRy5UfPK3rCb+bTnvdjjLz
         92Akn9xwY6+245axcjUlnxE/jwwyanLiIP5bJjYPEWfIi+tA3iFXvg0sOa4JLe6GwHpd
         Zcs+eJQIwAAuQqhrA+Q9EBYz5oTIOvARiLAHnRL0kJ9DYDIMx0WMcN9ogHQeTMP2fKBV
         AjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716379734; x=1716984534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Whg0Dc1FYMXBytTq0QfKHAfxqeAkThzFIKkCrZ14fSk=;
        b=PadQLonJle2QZX8T2PvmgJiYf1Es1/EAz9lAwTPBvq2zIdNwdmM+zx7uNmejtlLojn
         36x6xXJkI6al8OkMvQORiDT4XHZ+rJ9nuBqE7mSzZza6QeIEe+ucNpPvgX3ek1CEE1rs
         cEEg9y9CUikJt3sxkuqJlnnUKUrKIaVYuWZT7f/hM0j6pHVjn0eJ0NcYYP32cqpRyGCs
         X8J3gB3LlNqiKAw5Fx/vus5JrrYykKPgBfWyNBPYnfT0qSJMAthhPi2SIH82zc769DGu
         KGmS0UQ/cN58fzAe6KLcOyx7ywzIqMeN6WHfbJi/5USOnppTthfhoNfNpGiSsQhLZkJl
         zOfA==
X-Forwarded-Encrypted: i=1; AJvYcCU7p8OvUkgROmT6mrpk+YQ3w7jkgPVAi4d0iWM0YA3BfVLxWjE7wewbXPMTXvTU5D+5GLBMP0uotzxplt0tSwSBGjUKFz+sy1C0Cdf5dtIGuQ==
X-Gm-Message-State: AOJu0YxM64wAGpOJ77WLekklGpGP7LBF86fCfIi2TBQ75Yluu94MgbTh
	O+91UiizZwA/OTni6mskZA93rHUaaWKWUYr/l6jewNeFb0ySxRZRXVIVRaxXNeM=
X-Google-Smtp-Source: AGHT+IHo07Jx5ij8sbkeV6u8oetjeGw6O1oXQG+mRdLh3SOzk0Rx6W+jHTGfGXv9G2hb3fqKG2GbaA==
X-Received: by 2002:adf:efc7:0:b0:346:dace:5310 with SMTP id ffacd0b85a97d-354d8d0a89cmr1370629f8f.22.1716379734130;
        Wed, 22 May 2024 05:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:82c7:3445:3b33:6c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354e720d9afsm999226f8f.113.2024.05.22.05.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:08:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 14:08:17 +0200
Subject: [PATCH 3/5] remoteproc: qcom_q6v5_pas: Add support for SA8775p
 ADSP, CDSP and GPDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-lemans-iot-remoteproc-v1-3-af9fab7b27f0@linaro.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
In-Reply-To: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8QckCTJd4Kk+SVsJgULozGfhpAdR9WlTYPz4JkRMW+0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmTeBQbzW7BWneOlP3mnPM8LDJSoRMlEz9Ai2zs
 Pn1xUhAmYmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZk3gUAAKCRARpy6gFHHX
 cgavD/4uhgPaWaDufEei0vUaW09TZrS/WLFtDUB9dO/lusNrlAQ1tkkU9wOaaEvKx+nlOVJVX1j
 FxYxLSgB0tJyN/PfssOzb0Nhh7vc+3j8FoKtc3f0KPFolRbEknDK87VMJ1FqrRySjm8i/xWyTrX
 TdJqCErz0FvSV3BdITQJg54fFgwldS3LifgfRpo3qsypcBLWr7vn18OTh3TzMP5SW8kCjthowEo
 JS8zWd4Az3hdnvMx0j/4Vc3bBUylJO09PBF8pplCE+IJnP3A57zTVaHlbq67hhatbdQ0dJNldER
 K3MOQCCeNI3AtbM3zicxCZLJjb3Y/rnoDZuixllrNyXkSTd/IAnV8R+4ZHiUst5euyi0FYtR9yl
 fJdcfvB0qk2mcKnBi5gCIQrHYdbY5fxADDSd3LbowvkZ6afeAj6575vunMWdX6yWOVfxqWQ/ZBl
 r4lK51sX4s+7snBHoBXMValtxgq81SI0GpCE8xFjov6yMJNRh0CZDQY81gs1yEnMfLP/J0Aw9UJ
 83JW2JprVFPDjHD0ifbUVbrFoKNIpNQugYPrRRPCoPdCg2Srpkh+475/lEanSNRFxXoj4RSnc4G
 X1+sZfaTmwGYUwmjLAMQ3ZbhQtVxnCB10wenZp9HhoA6ez/zQYsOpUsATuD/QXhxcFbgSjSp9WL
 2QfRsROIfxxUMvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
SA8775p SoCs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..16053aa99298 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -820,6 +820,23 @@ static const struct adsp_data adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sa8775p_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -933,6 +950,42 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp0.mdt",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp0",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data sa8775p_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.pas_id = 30,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp1",
+		NULL
+	},
+	.load_state = "nsp",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+};
+
 static const struct adsp_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1074,6 +1127,40 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_gpdsp0_resource = {
+	.crash_reason_smem = 640,
+	.firmware_name = "gpdsp0.mdt",
+	.pas_id = 39,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp0",
+	.ssr_name = "gpdsp0",
+	.sysmon_name = "gpdsp0",
+	.ssctl_id = 0x21,
+};
+
+static const struct adsp_data sa8775p_gpdsp1_resource = {
+	.crash_reason_smem = 641,
+	.firmware_name = "gpdsp1.mdt",
+	.pas_id = 40,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp1",
+	.ssr_name = "gpdsp1",
+	.sysmon_name = "gpdsp1",
+	.ssctl_id = 0x22,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1315,6 +1402,11 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
+	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
+	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},

-- 
2.43.0

