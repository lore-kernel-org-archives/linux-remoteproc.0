Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFD13AA20
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799458; cv=none; b=GfiWoLZzmqxE+EjLs7E5lUhCUUChelM9obew8rR4ZgMSO+XVB9FjWoBLbnJt7JZdiyVQKq3N3i7MqquFosLTtfkCWGTIXzvgJqGivp1b5VtArjcrN0RZ8Vd6IpgrRi1SsLTSFqJjrxaXgGqxlbTWG15vNKmCEqiY2ZkcC5FC8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799458; c=relaxed/simple;
	bh=WC5t9WJX9lXcwGywBsZysQERtwOQQGRD77DNGgPmsMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Etx+RjYsORwDG04U7jfJW3bVk/4nPo4zrZP7EvKKtOyhmjqd96/0zdZiXE+pvyKDdrvaEVpI1YMyT1MMZtBQ1KkOo8j0c2SZBTOkICFeIprvA8RnGPeMEzzs8JzkC9vpnhdlscX+jW1YThEk80jwzOYJ273i24YMlIhglPnCKao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rWGpU9n/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rWGpU9n/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a7622cfso34172101fa.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716799455; x=1717404255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Whg0Dc1FYMXBytTq0QfKHAfxqeAkThzFIKkCrZ14fSk=;
        b=rWGpU9n/Dct9b+w6SmnETXuD4DPPWt9f+DUPsaPNn1d1MX2/iuZnTyRIidjyVRzxaA
         fc054S8b3ltzcyKZV3bxyn0wxpMqOFMJspqsXp3UnVG8iI+GXajlsoDRaVld8DQh92Gl
         pCqSUlGjA/DBqxAr+JePE7HlacBv/pFpw5oc8jpFvuOJDtCDWx1g61p+/Az0JjVFIR3E
         hNbCBdaSwYywy8cWH8US+NInPH3JSijpdmy6EPjr4eWTCwTZgA4or/HFAVZvtzaP2nDr
         JpvjBu2iIhj/hSdqdNm8xze+pMa+6C0oJLzULtOD6mhf3TEKcfVTj+mWEWpncdLQngjX
         tOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799455; x=1717404255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Whg0Dc1FYMXBytTq0QfKHAfxqeAkThzFIKkCrZ14fSk=;
        b=EtlN9ezW9srVB/BlqYndmIi7b/f0L8M2m/rp5a0DyG9+yuQGaONSYbifnNppT13elo
         S0CwWwGmSNBrK+Ze+2DqeRgIhFP9mWEzPvkl0VpoDGVFRgika62AVbK1oI9vgVRpFGpZ
         lU14G54zKASUz+nbsJ0yaxKygRV8IY5ImK3y+EI0Ppj2v77lUDWh6db9gUkFYPyekXDf
         Ay77J8RrFGl51u3UBm/RQAixAy3aHmbsydIL5eXBrarKJnfkqoJZEeWDk97i7ELPmKVv
         P4vuHmwr80n96a1limEvCKIHJEVkDHFoYLASaVHCwKF6YpQPXoKc9XC3V1MePOPedydZ
         OARQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsCds7t0JgDVe0jpC2GZGoIDz2M1EmF27P9lYR9XAsvoO1Wowg7Lw+0fode4ziYYj/L6yHLCoeFt6PyoUtVxua82ajDQUjgYJzx0FuWD/qcA==
X-Gm-Message-State: AOJu0YzxlITccBMwNl8cZm94joPcrrwWQGgDXpBwYrn4HZFNIPNB3djc
	jRWb6Ye3/OGgWDnF9LVnqD0Y9GNEb9j9K2yGb8oAa1JyiOc54k/S37QXRL9gdC0=
X-Google-Smtp-Source: AGHT+IEWt0u/t8Qaa5BYXiEFGNwc5PwERsRrwFb9KhoDMobp9TEkf9v4PF3TQDi0k2waH4ei6Goz6A==
X-Received: by 2002:a2e:90d5:0:b0:2e7:2d1f:edc2 with SMTP id 38308e7fff4ca-2e95b242205mr50404141fa.38.1716799454709;
        Mon, 27 May 2024 01:44:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108966682sm101365575e9.2.2024.05.27.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:44:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 10:43:50 +0200
Subject: [PATCH v2 3/5] remoteproc: qcom_q6v5_pas: Add support for SA8775p
 ADSP, CDSP and GPDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-lemans-iot-remoteproc-v2-3-8d24e3409daf@linaro.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVEfZEPjkG7EDeDr+8Cja21yKzpf1H0zSGheZi
 pYtKf2PX26JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlRH2QAKCRARpy6gFHHX
 ctdwEACK3txeA+4QXB3RGBWW4+2bCJftoYBQkfd2qqyVmadFu3lp+Zi+1sw6Y7BctzTcpTObEby
 NaquBekLgZVRRg8AFCOwBxUA9OEHvd+V2TByairVxO4BjfIiz0GfmDbmzxKWJJ+Dr4P1RwFE78O
 SO9QqQ2cbFz/28Av8nqau8rUysBkKCuYHaU21nf4LY/5VxYgYF9kCNDg+aPIhI/1sW0Sl64gMEE
 ZgL7tqfbVRFdBixpjsGhMB0GkOAf3XpXbHg0Yv/k3k86yunCl5eSfIDxtmkwPac4NvF+W2Udk9D
 +iNirb8iq+0GhckhaO7AUQkyCjPlQag89wy+CioCd7OFDkVe9ZQeoCbIuk86IxVPy9W6bUKV/YU
 T/uHTRoYchG6fdWw3paMgYQz+ANL1iA0XwrkyP121Eb8JzHHXi8wrzh6ulP2rPDdHocViQmzKmN
 2pnuskqMFAVengJ5yLttkAgQ3SDOH8YBHVsJTYExXE4mNj+wE1yFd8HHuSg3JW+keEsmCZRliCT
 lZWqAh7EoqEDRQWMrrrukZilIOrJKYFCJdxh5o9ppTTq1k1gOnVxkEEgZcVus8Lw4cYlJJz4TUk
 +UsT95XiwPQ+zQIp9oKXBYJFfUEMfNJBFnY6w283LrYBwLO6tfyrpIBuovyf1fgBlejqyufSf6+
 MqzTX7CdxqDBgCw==
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

