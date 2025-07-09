Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAF291C2D
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Jul 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059605; cv=none; b=G18PL+WJedgXNWS384/Vn5Z62TpeG6KHyGULAjHHWc3ahIqOzZefg59jkPBUplQP0j0r1Uo0sqvrdlaBsZ4ku0Q0CKUuS35Tn3ceT0ZMGi+8EKheMJR+Bu+c8FOgKe5AIEPEAhr278urEaoQS0sKqcsxcUQ7hgwLExZImlVm2ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059605; c=relaxed/simple;
	bh=OJvIgyuj5zHbAHydPvWzJJbjCtffTewHwXPSgao+2c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfpNj6M7+ZUhukPPmXqz7ejPGNzIUlKXtxXHgZOpM3b6AzUfMqlE0hIGOT4WUO0shaqA/Vq4oULNYgwmqfzxRn3zsUg7FwcjFBj+CCEkJ87cQ0G/Y/LrLjb0WilFlfd2Auo/xlQyWRcPhFkXBjM0sMOiAtkmpiXSBa8B8nSm5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=btCO22CM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="btCO22CM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso152852366b.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Jul 2025 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752059601; x=1752664401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ybiFFUL1Z57/CU2gYjZ2nwMXvOylKu9ZrRdZ3JW//c=;
        b=btCO22CMagTtmaMG9WuvFmAw6yCITeeBGvy+hAwNjZk7oyerHtFDQlDRPn3OYOhl67
         4gSDsgA8A6XROVFfeErtXiDiW0MoBfaQl0ycMx6SIDk5B7fSfIlgXDOzl4J+8irQlMGc
         MJvvJ0jqhXNou1b1aRhg/pn9hh/8iBXfxhEUxgCtmZsLIrAlJfCIuLewXYw0UyD+RRGs
         1xNqMThcnQ1SZPazZzsh+5B353cw1RYoYRsCinR6BCoIpg5wQm7THOeetD7NBjog2+eQ
         rDDF78vh8gx89plcv1JBQJlkNqsgeUrkaSdr9dqzAEYn5E+em6A5IU+Ib+lPeulI3V/X
         pTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059601; x=1752664401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ybiFFUL1Z57/CU2gYjZ2nwMXvOylKu9ZrRdZ3JW//c=;
        b=FBuftNdpTXzjr50GZ7zq9fWZB0WyNserykvVQh0i9QYiBHCJRbM7Q7NnbKlA/6XUbI
         xB8R+NK6gzLJttIiZj+LEhvlAYGcJlbjG8fJq88MyP5lAjhARro+49g4Ia75z/F+V0vv
         EPkt79YK40ZqEhnjPtYTv2oetGDW+gc0oSunn8AMVbGicoo5B5Fd4LqiRuoZFE6Luboi
         iKQLQRBhqy4f0/Ctvsdj7WrMmbEbbKbRXfxsqc37e3y713Jy/DJa2bCbmB0+VdNCNagp
         LJNSl1jOgLV3crBmkRha4kVQ82DiCpY4pjGNrRB4jDHW7kM8G/p63+x7Elwt/ONEXbzG
         2VRw==
X-Forwarded-Encrypted: i=1; AJvYcCXK0zwTtJjE2cwpKvoVgHgaRUcON9+j+30rzn/I2isKwKu1s9MzbNVWeKmP4V+1cp6DXzcm7GTpWpxC4m1Zu37H@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSZglUOLLUlMEe3fZ1H13FLy8MTDJ4UsoOflmTfJLS1eZeZ3S
	2aB4EyOAxA67kuRBX2asgUSFZO6GoxsrzCRWrMmkAYGAqiDmJ/S07kFICfP4s8oGwN0=
X-Gm-Gg: ASbGncvGrqKaTRY1lRQe3vpvUrx4zq6gRfg9gt6y4z909GOAYIgudwb8rO4+ZnTcDr2
	CZI13cjgNCkVOfiBLEzUiP64etakzLWNOWF7iLlffGIiTq15gp8SUqOjx7Aoc9vnk9xO6BbE1Ax
	cu1NxHqIgbzATRtO0LEQp5USyQeO7z3b2kqs+nyZmGnC4vSOCcasngjePQ84OFJj6TgWoCcDtTF
	9D9SRC62sB0VIixrJgteft50yzf36upwZq/aXTFC0pnOD/8swB1W3Q8EQu3i4C3XP+Y882HLTsK
	f6yy8wxGa44bLvh8Chx639xelD6l+dyJqvo/T4aXckKTDETLgzHXmCQ2nmfix8r6O1NlfEF2kW+
	pI6NwhWt2kcAtBThxWEBS8vxEqCyDReih
X-Google-Smtp-Source: AGHT+IHXBll9+vo07ZfbksnE8wLMF4LIAQ2GbDeL2E6iTV/VmTgWRYgEkhIVvpcQIDycxaI0d4YQZw==
X-Received: by 2002:a17:907:3f1f:b0:ae4:123a:7fe3 with SMTP id a640c23a62f3a-ae6d142d7ddmr206899766b.20.1752059600885;
        Wed, 09 Jul 2025 04:13:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6daed7d49sm27191566b.114.2025.07.09.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:13:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:13:08 +0200
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Milos remoteproc support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-remoteprocs-v3-2-c943be976180@fairphone.com>
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
In-Reply-To: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059598; l=1914;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OJvIgyuj5zHbAHydPvWzJJbjCtffTewHwXPSgao+2c8=;
 b=lHLNcjCgk/GHlzx8rQbUPfkZQox5Dk1Ek78pJsnh1xN61wmSbZQ27bMq+NZUW2SjHZuhrBEeA
 Y5xdyzw4YQSDQO/3aywFk7RFzDsgE2OuticVijqzXi7+hBnOYC8aZvW
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
index b306f223127c452f8f2d85aa0fc98db2d684feae..7cc67ee62a341d56c92bbf2e4222837c0e34cb20 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct adsp_data milos_cdsp_resource = {
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
 static const struct adsp_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1435,6 +1455,10 @@ static const struct adsp_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id adsp_of_match[] = {
+	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
+	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},

-- 
2.50.0

