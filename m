Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705A276057
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Sep 2025 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065036; cv=none; b=nk1NFIePOkjuYfG8Q0s8ZIkzGxWXT+7gEG+zxwj5pi6K5nCgwov7gAjd+BkHasngRRTaX8Wltk1bP0UT1AsRkeWVn1LCQ9bjPJMt6ci2SM09lituNbnwmpQXtWBvXYgB3NPo13pBrNx+7t7I448ncKBf+oPbyNi8WxfNQniJjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065036; c=relaxed/simple;
	bh=w6GDFIJ+X63yvl142zHgW4KfFmPUnPR8J/fwB+G5Rgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNku/0eMzYH674uWJTGs4LuTwW7TVxbWQ24C9afMIea2LArNwHOcicZU/1jlTlNsDit0pqWLhHo9CCpAefcnVqt45Yw55G5psS6uiJCNdbAFEkUX1a76vPwFFlGadGftLHOHOqiYRgghRNk9kobutdZsOdk9mK/Q1nhhdjNfTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hMXja/y7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hMXja/y7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0472bd218bso341786566b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Sep 2025 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757065032; x=1757669832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI/TqVlWRD+p2wdRTf7lXSCZ6jSplSGXljjBzdG21/U=;
        b=hMXja/y7jm5PvKmTPqesLC2fOa67KslJLaBebwBHFi7IMrX+FhZfuIkCnCzC9M/QDK
         1irkN54D5MFhFbYNNvMVHq8UeG0D5Pl8dPEX13srjehmziX4rtKcpEgz8IBZyAcASWXa
         tFnPSmExokB6QdZHThIZhv4a+pPmxN03DtfjgVJcJk8nYCotINM/am2KRiHycXEOo/FX
         7yYv2SeOzbT4jt3bmbYD3AZq7TBMlBzuJbG0K+sm8wUVQJ1Xy39g50j+JmjdZww89nD8
         5AzFYsl8qElwHWebiWNYfV1lf16234p3VsPp3iIS+NuFLFDRkxWQMGtgInHO5Asvq5vY
         X4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065032; x=1757669832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI/TqVlWRD+p2wdRTf7lXSCZ6jSplSGXljjBzdG21/U=;
        b=d15E/PemKpwzq18UEzW8qCwwo8biUYxIufCtpwhqR5Qn7ZuzFX5hrP2YWqYkNqruYw
         70x31976Y3HIDD2epT3+kTyH1NsXz+xOwEBSsZrVOw+KCNOanaA04es7Qwc1MiNixSOQ
         ICMkfKz7yTuOizsoTwbh09OOVbPJb25K7RCRNyhnnQ4UavO2Tc2AFK4uyzLINUjg03gi
         JbQqiuosZDGGkVN0Aj5XeN0AEJCrde3oDEz8tamI4nYLI1Z6wo9e5iMl7gnsVO3LQvgE
         dJq9R/Z1WBNrZNf2YD09YVssau4GBoSQcLIKD7GNWzVIXo18CW5t4OYeEVbfseVi/kcG
         k5wg==
X-Forwarded-Encrypted: i=1; AJvYcCU/A7fIXfBqDTgiIFSqjUI0w7fSkuXYnvw3wkvu3C5UVJEdZa0S8lRTFRq9fyZWIoVoBb35omK67MOfi9gq87dB@vger.kernel.org
X-Gm-Message-State: AOJu0YwEacBTdeQQSQ/u747VOEAOY6Myk6m/L1/gU0MKcOi8/vqkr20f
	kiMtd2zzgznI37BJEq0wXmDQRozpyW9hmzwXMDP89zxPnRWRhLT7Yy0xFX2znuDAc7E=
X-Gm-Gg: ASbGncvUPN5nqul1LAOtdQBkn0OOhsQ6sT1/oR0n6lcIfSgzE+X9Hai1+H7Z27MwBSE
	GmGC6idRtZS0+TDHJcc6mvff1yWDRHG0/Yw7qFWeo/WBaFxs/BYhT1DqOx2/K6UesJ78H2yv3Y2
	fU/ns5ISdw78CTli4H/El/iCRDB03ny8QDMk8I4pMbT3gYa8O4my0iZ5Kr87l2+j1i0DmWUyMYW
	Tyo0rRmxoLlrxFJsD8QZrZ2T9NzqlsheT7jwjLocJZK2DFsxcGhGQOBKTbaePWfUt33nzcXRl8n
	HxdMBQqH0+dxwZkhGheCTTHRlN2qWopVhf6x4ABsT4dBdyVX+zAZkBQ3ZBck2yH4RJlFRJAz/KJ
	ho4wzuWC6q6qX6m/cdi9H8hEt0CAHwnndx8vmp3hE05gbqiSDavSTv80T6CCN2q3gxA45OCwW5k
	ZRhdCM+ffJoE1fSa2qXv1RC/nzevKYiQ==
X-Google-Smtp-Source: AGHT+IGWzvz7Jd4OjcFPWdH5oL6V/J6WBtEASHEF1I5b9fS5dO04CE1hh46ZiWnFvbAOp5lSYlOmsA==
X-Received: by 2002:a17:907:1c0f:b0:afe:9880:8a9b with SMTP id a640c23a62f3a-b01d8a30e2bmr2250841966b.2.1757065032263;
        Fri, 05 Sep 2025 02:37:12 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416842ffasm1361597866b.38.2025.09.05.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:37:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 11:37:05 +0200
Subject: [PATCH v4 2/2] remoteproc: qcom: pas: Add Milos remoteproc support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-remoteprocs-v4-2-9e24febcb246@fairphone.com>
References: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
In-Reply-To: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757065028; l=1934;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=w6GDFIJ+X63yvl142zHgW4KfFmPUnPR8J/fwB+G5Rgc=;
 b=0B8vnxm1AvzPVVeUgAQf02vyF1lJ/7BCN8e1OLXPuvneDRXLt2hKLZh0rYQLIiQjv9b4ySsH1
 mG3q+u1RqC7D8G0AoKe+f0cx1Tj6jej7gUFhxAQnBsqKO3/8nnFmvzi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the different remoteprocs found on the Milos SoC: ADSP, CDSP, MPSS
and WPSS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 55a7da801183d54569452dbb48041fdc52bf9234..be4edd0c3eeefb80d3b25a48f6dfe0b7590bc624 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1255,6 +1255,26 @@ static const struct qcom_pas_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct qcom_pas_data milos_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1429,6 +1449,10 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
+	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},

-- 
2.51.0

