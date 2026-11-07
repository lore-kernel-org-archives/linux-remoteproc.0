Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018357;
	b=EouNqsPZX+9WEzlX/OtWp0iTfnud8JVN6Ftr0kcpK4dRdJipnba/kzKW4Kuxmq1hV4mJ
	 6+aEINOR+fiGB3XuohCS9XFRorZGCl8mIB8iYw6h5TAN2bgFT84UMhnqGq33XnTB4IdiA
	 EfS37SuG+KBAh9LE03e4ks+qHwZibyo1XCVHfhAOrNSyicbTBI6atFxuuc3ZjoaQdCeoD
	 n7ZK7XGY+D4sFK2jGDr9T/R7JEeoRsCcgXniO5lZRDFwk0EzGdP/ZhKFlnfrtQpKaQrGz
	 nDL/LRcOzOzCNOTSYFkIuJ7lvW8cggnLeNIeo+rnwp7wrWORg6JKtbkZb/6zO1y1PhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
	b=B+mE+aUNhdcf2TIQHlwRG5NDntowc2v5JUYFmfxeP4Hr7b1iphPl0ucz1kVs4VNZiDZn
	 hgeHg77vBgAqPuvzKjk2xf2vwgy1lEDjQwyLvz/UAz7jLtdsdyaiiSrl5Wl9I3o2t1kBZ
	 5Zf90OXwA8Rsh8f39QhPKhDE+5kL8TfrICVtlz4dLH5mK4X8uatFl8ED/z/m4dbOwPMfK
	 ENMJzhxfkLhbFABYnORY1ZJjTWXieMvy0LU66HDnXcBbkqtx9qnDeEJ5iBYJAcAnGk+EQ
	 B3mqSbeAFk+zX/1RA5+CXrMxrrVRY+s7MtsuFZLTW1wLxk5rDormctiuky4HlPTh6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E487C606A330
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E487C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eac4855401so462890e0c.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018356; x=1794623156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=lTeLhHPmBNApRqmkaGG8d9jRp+H2mIbSGZn1OPdnd/OK8qL5F4IM8rppC2adeTD/b0
         FRKNJBT/jErzUjnpfmJaZeeV6QKbZYRaXB5k0ubAn01Nxvl2t4Wa8RbFQ3AdhhJY2Fzo
         Pg94g9hSwiJ5QVI7W583jGP1/fX6n0pTJ0MHLJSuIL5n4rCFRxBIF6yfYlFThAotdsiu
         NWqFRJ1YXzHNhFmSl7PvogYjMvNT3rVXoank8ZD2VKfe2BlUGI6pWsVTJ6lQ+Ff+JNk7
         Pxwm0vz+VynGt9wAWiWqyFh70PxDG59wWV1ntpiR+FJI0ygrAjDwV2oF3B4zMB4z43Zc
         5mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018356; x=1794623156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=Lh2noQDG/mRjnOFURqrvgOkHLoV1+epGg5m/CarbZsX4ghcI2wvcG8FceU8dK7yo5W
         xQQ6ru/NpSTVsRsxqLvPF8pok0io4ybi8s4s+wxfMOAoSLIFTiZJ5lAtfMK1zR7yCmaO
         gEkRDAwML26aOauLLF3W0ubVlAyX28addaA1b/ZzeyidzMUWe8vycrwuY5G4TwIHQMW7
         KuSwGK6WwottqlhijI9aRnY07mXV2sjGXJSh/4guDdbRSRFcr173HK/9LwQNy5G9/I4f
         H0HSKjgFYNmeD0zc/bXW+hCpW6zqkb9Vco+vAIM08zzD0vqeffziteMts2akygrOTTdh
         w8mw==
X-Forwarded-Encrypted: i=1; AL+hErFaan95RfUCL1SAOR0T8fCm0aTCkQ8Jn2Y/TRQss/BSBk5vpDnpmdsj+cXe1eEW59GkTTjJ/PNGgIaknMqUHgMH@vger.kernel.org
X-Gm-Message-State: APuU4Z9J4efrpmywPlnWVIYo1gbcCJTp2roskX+JZomXV81Mj4cU1pAN
	b5589sJbjVSV7RmAg57KrC2hOM/ZmmQWhXbBJqPp8ZKhvDoab0losQiq
X-Gm-Gg: AYBFou31xmswORnhBPpV1STyp+aR/Y9hL2XXWQzj+tlYGClkZwsFTECziAyXhkY7rpc
	KjtqJmF3fORsYoJQIhQDyWSUim9ACOSV3uBUaApejCI13JtPH3ch73cmOWXAFgXS4PBT1JfrtL+
	PeJ8pqYmeVOaI6B3YLHygq9DCnrKcnZhg3sZw2QfLqC5HiTidWXUCieBn11uoUwZ642O+MRdCtG
	Nr7OKHWUCNcsNQvC93sv0JIe5sCFK6WI0jZQ25u1/63/Y9ShKqLEKiivFsG2oWqK+KwzePXPi5P
	VXOdOCA9e0i5FIvAPLmg45vfzbThrZt0sWxpeACo7xk6CZIJw4NV2ganQujGbdzFMC0UyU37hO/
	MU8sFRjHSKArUCAxu1SgRtORmiSaJN9Q6ZbAWxzE3YOy7sIPAre96pzaFRRsaXkGog1h/Y8p17C
	9NpNnYFqcwPz/KI3UOnYeT/pYTM4N25w0JcgaDoVs2JoCtlKnpwPYbRwQ4vqvMkmpVkmVqCnFWm
	GHWE8akIW3B+1H43s5BFEPoXk4nLzBhUg2bXynsi0gHbcw+otkH70TbXgqXWJDsfZ7PrYDwhPrj
	Pk4hPjTBN5BUyoHR2xRkenF7M6KJ
X-Received: by 2002:a05:6102:15a2:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7d2a1593194mr1895441137.17.1794018355909;
        Fri, 06 Nov 2026 18:25:55 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bab48acb7sm3106680241.1.2026.11.06.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:54 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 4/9] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Fri,  6 Nov 2026 21:24:48 -0500
Message-ID: <20261107022453.159341-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 except for the LCX power
domain.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f37b77ae187e..57a111a0d75e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1122,6 +1122,21 @@ static const struct qcom_pas_data sa8775p_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
+static const struct qcom_pas_data sdm670_adsp_resource_init = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct qcom_pas_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -2035,6 +2050,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0

