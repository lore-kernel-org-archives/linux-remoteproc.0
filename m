Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5D31C82E2
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Nov 2024 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732265795; cv=none; b=r5UFuJke//WFWsjFjwRkrHm6+/nfBGzgKkpGCwIL24vKEfTnsI6oJBDpfM5+Tuze7gepwqqbpo3xAUUx4Y6OgP3xe7yJ3D8YMCj53jGk7HM8pEBsBu5qX+Ss1ZfV32s70DfxWibraOPpFqweM2YPkBCTlx23HX8IaWpGkfUnK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732265795; c=relaxed/simple;
	bh=iDnkUJ6+qKrz4yi0lcczfYKLL8cZ5N7uOIHYPvi8lfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqZMLCNJt0Uwi9pq8A7C9gWCT2s1ZC/dgBmZbUMvYuHms8veqF1TzqqyBP9vDIgVKJEGZqAuCuouei2I/6cylb7v3C+6X9tBFrMBJp0T4BW3b82APUZInbkEC+l8jeubHfp3hqLyLqGmfvGEbu+eTuBtpSZMxeNz8y3vs4vQg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STjR9WOA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STjR9WOA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso2759825e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Nov 2024 00:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732265791; x=1732870591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMexPyi4X/XFWoEQeqC/jUtxuZa+FuBdiAX8hec2Nrk=;
        b=STjR9WOAU1BhogK0WnpXaPCmSz1cgKONAl7SKKqFCfjsjl32iab+Ee1O1E3aEguSUd
         U2JJIwWSnM5VrmSt7uMm5JCsXMa1md5h5MEXM700gy4AuFS2xLGqpe+yWyBuDwFeJ4Wu
         b+W23qE0eJYz/AtXgrMlETP+7WF2dfMd7rw3mYE2WknZktk8Dy5BkVhKhPsGj3bK2Srh
         J68olxtQw/Ogs5bOpYFE6Nh9NoEZ9RjN8obApoRsO63CeCGbSyGLOuse0oRiVg8hxhJc
         d4E4RICM+M6A8Jre9OhqYnCDutZtYZ3KV4gj0lHeUWKW4YunDYt/dBhigh+qz2D2g19W
         yVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732265791; x=1732870591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMexPyi4X/XFWoEQeqC/jUtxuZa+FuBdiAX8hec2Nrk=;
        b=jScl9GwmVWo+3xTBDrGAOlRYuUDgiUEo8+nbCq9JUQdRi2ql4gXPmoIDeEFdmG7grl
         IQVxFOycPu3MUO4dYnGQcomrzgZGFNRaf41krlJ6MOqfJzcue2rij1eLl4xiIEB6QmKw
         ShmtGwSawxsY+tVO8BHnRePhgi+2WmwxKlkdM1BLD1OjvDRO4d5DPg/xtFmeZvDLrD/t
         r1AtFXWmJyt7+7bPp/9gSMCPBiQus9f7c3FeqAf7LgvvpDV+QsdbvnFVQG16flFa3430
         pR/h/LFOAAGH/BCxfnCmBQoh+muoADQ/Zni8nyw4NJNR91X1uKUc1YopEUGc3sL3aE3H
         SbdA==
X-Forwarded-Encrypted: i=1; AJvYcCW69c033644iVQRnLqF8N+SUJSuKJKtCl9TR75Zss4HA+iBqJjxcYDj5veE8P6Jmw2WTr73ruIkU0MkbHuh4w5e@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEVZaod93vpm00QvkJmeNOwMjxgfGq6SoYp8QwYy3ijitVf0H
	YK/QreTCJQ40SGHbEEUiI51rmGhprxL7/gJyrUNTbEb0nH3kD4jLN5nN8aO9Yrg=
X-Gm-Gg: ASbGncvcHaftl9ixdKMqH0TTHpYw9UAGNFVdbaB5cp12NmUc5iVVW9wVnunteKG4mf5
	g7/hCMj2XTGhZSxHJIEpPrx3LCTY1ETqDG81509Acfyj5X8moU7YzON0Sz29nhe3e6aDdDX8SXI
	fHY6aH8c0A2HHr5RJB1q5a0BNE+FEOqgGzOtPUrAcXisQZqe9GGSJ72bdxTRPw7+8HTTdWAmxxC
	6lqaWl623LiCSzVAu6nGugCgZF2GAL7xjZ7uhQ6/wtDJFWZhIo7sgy7D1YOQA5N
X-Google-Smtp-Source: AGHT+IGkV8XGhRtLXA/2oeLLvXbpa9yNqrwoZ1wN+JqNTZm6ToUQ8b+at7MqfHbeoQ8SEFNb6oTHFA==
X-Received: by 2002:a05:6000:4028:b0:382:4e71:1a12 with SMTP id ffacd0b85a97d-38260b465d0mr560916f8f.1.1732265790809;
        Fri, 22 Nov 2024 00:56:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97c68sm20320695e9.36.2024.11.22.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:56:29 -0800 (PST)
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
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM8750 MPSS
Date: Fri, 22 Nov 2024 09:56:23 +0100
Message-ID: <20241122085623.19988-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122085623.19988-1-krzysztof.kozlowski@linaro.org>
References: <20241122085623.19988-1-krzysztof.kozlowski@linaro.org>
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

