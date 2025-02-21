Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81661FF603
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153790; cv=none; b=h3I2CVQhbazHoeVue8Yz1AXQNl13fjfTitMJ5j4jvd5jOEBojiwHmzv8oYcUGkJ/iHZjVs3knfI0Ki72tQS7E6aTW0eSDMeI77PI1QwjE/2Wd0yBBWBlgD9FT09o2ySvPfUqbVrxQ20Bxt4GqWIee9nSrvaqGbvazqgvzp/k6HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153790; c=relaxed/simple;
	bh=jNpVKLpJOZImpyW3PpLBE59YQPImFyESp7Aep3FgeYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOW61f8mRGNyAe4RAdD+4Xp3Nja3dGvskQqKn7SidgHWA6l7YlKE76bln+a/O6ETYikxv1lyBG4IQmRJc4v01/dw93cEIOBaYuymjBDgCNyMqjUrBmVDk/n8uW1uuvig3XpQpKM81Q3K7zoQ5l0sKb7v/GRPCg176EhdlMv7lMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtksPI8d; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtksPI8d"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso461311a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 08:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153787; x=1740758587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OXcF/TG2PCFERI1SWimzKBOweiSs1ZB9MJg92lP4jc=;
        b=DtksPI8dHyXYI3s8/lSvEydMFfe1Ml0RKpZXT9qDgs/XJbs+PrPqJzY5eEQljcQ1yq
         jkIpdnxGsPPsDxaLEK8t3ylKrCX2nJuuhcuPj8YYyFaTYR/+vU5ylpUaVN76ck+KBx+A
         fAzUfz7YESVaN7xCiDUNZ2pCB8Epg7QelzWians6hJUKJN0ezGNcA2eE/cOKctmmd7te
         0o0Cz/vNUoBdmG/LXzcjtJuYZcCzh7MAcWajWtjkD6rbTBT9M6HqUlsb53eAdkI8jFoN
         WojTZ7JCLrLBDTkoih+dOtJmhOZ2U4G7JlNpm48UCtY3nTlbDZtXGg/hLwLQGWDgVHIk
         z3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153787; x=1740758587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OXcF/TG2PCFERI1SWimzKBOweiSs1ZB9MJg92lP4jc=;
        b=IPVUWxl2eyScGxDRMJ13l84OKjatWxU1fm6bHcN2C8Y+Gzppaogtw8QW3Ss+FXhD9X
         vxO2mjbIfpenLFRRllpsHHOCx4SiiJkNV5aeJOF4W673UrgGzJYJbKsai9JNuq8Nh0Ft
         2NckNOjB8BSrM7Ymf6ToO6zznl/nhCh5M0BdCPU/qtpBVR0nRlbpXgfryZfjTUArde6J
         bkyT0Fnpq2EQCnuPARNrYeX+82XrGRcp/XlwMAeF8BrB4ElgEKnKb8kVgD6B80wzBA75
         7gTN/1Tgw5Xd8A9fB38POGJTlsgPTAB+sZWWUIDOyUEE6JsyTnqCWQySVFnRW9sMRFhd
         RMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCULs3Rk85t8Vh31/+8DIaCuNJ83a1IzZqCWdYNACOXyn6ZwikIU3Jwj1unmlNME215CHjZ58L5RULeAb5i+d1cE@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvRhlXHhpzZB7p66AOlzmbjv4MOuWLTrbEdthtFIVsi6+K/4j
	HcWgCn0GbsKd5HzC5vVvD4Bkv3bE0Xlq4MF1dIMkyOW6b8HH8LnJA4yjAoW3gD8=
X-Gm-Gg: ASbGncu/9ftAArK1HwdEyp60La4lZJoaRX9dW7fI0qZ4nMrwIU9VW3HD/L8iFQK9iBA
	p1piu9YQgy5LHN0u3tbm1cd5JYFaaITA+8VA+4/sGnFQRjpppBrhtWoZmezFREM7IdhoeHBfNQ6
	b7rdCEZa2Q9mwh6PsP55cn7IXfMnac3ggIYuBCC0vFGc8UEZgkYsq+lGYde7f8dGxxyQu9EQsGu
	em4zDr1TiNSXxdmWB07q/dhLoR55PgG4C/lyPfLFSjCZctwXlFCRdzSWwAfSMgzx3AJXKLYyuOp
	J+8SYy6vWjBL+i2Y5g3Yz3xPoGEYeiRgxdx6eRxiZld2M0m0IHo5xeWdSaVu74egER7XVnSzfWs
	=
X-Google-Smtp-Source: AGHT+IEkEFcjqxp6Jb7RRhAg97Jh8Ki4FzCRDMhO8xX32MsiOvuIBNnukhiVmbZ0l7ZZyA6t7WA3Rw==
X-Received: by 2002:a05:6402:4406:b0:5e0:803c:2440 with SMTP id 4fb4d7f45d1cf-5e0b72311b3mr1279503a12.8.1740153786941;
        Fri, 21 Feb 2025 08:03:06 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98640619sm1040782766b.54.2025.02.21.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:03:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC v2 2/2] remoteproc: qcom: pas: Add SM8750 MPSS
Date: Fri, 21 Feb 2025 17:03:00 +0100
Message-ID: <20250221160300.160404-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
References: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loaders for SM8750 MPSS (modem), which differs
from SM8650 by lack of fifth memory region for Qlink Logging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
None
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 97c4bdd9222a..c34b7780f786 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1409,6 +1409,30 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct adsp_data sm8750_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.smem_host_id = 1,
+	.region_assign_idx = 2,
+	.region_assign_count = 2,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1474,6 +1498,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
 	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
+	{ .compatible = "qcom,sm8750-mpss-pas", .data = &sm8750_mpss_resource},
 	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource},
 	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
 	{ },
-- 
2.43.0

