Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF12DC33B
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jan 2026 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933265; cv=none; b=kVpP/TMtVuMRUvUFx7uHTpmh7NlNwx4wnXeKUrrXgpV/FqCqKs6s370g/Dezp8kmj4vboybgJVnwtojyHwaAd1KkpvOFUc9XHQ+hnauNCc8uQVx0Z57yweItl+lTC3b28S6UYYIQ4uFHpYOPf7/JyLuDWV3A9QklR3ykD/4ERfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933265; c=relaxed/simple;
	bh=ZwYTrMAmnkdh8YdhuMQNkEVxOPy2CIPYNXYMB5yEdew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh7JZxOjS3G5yLqtzu1XfPedfL2C+OL+tMzjGWwCqkCFGUJ9IDRC9wRUfsPJKaPY+6d1SxCWbLHXComL8GDCHw1LlmjQOiqg4Gwiw2bjyfdkU/5LFoqVJD33QuRBKDPPZIFnhj+e7QrstE4/9J9fUVCrQ49+Rn6bF+TN5Q9JO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNf3ryl7; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNf3ryl7"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3f551ad50d1so1494235fac.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 20:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933262; x=1768538062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=kNf3ryl73cPP3GKq/zB1JzSSfwyN0YTu2eplfmopTlGQbIZrgt2DjjY4eOjJz3T0D2
         iyXjDHy9TLmIAGJ7ldPFc4/gUaha4rl7rfkS0jVTyMSKmYN0nDRX9z0f5gSfpAOEO2zg
         B7oNlwQ5VDmUzV9A6UmyUrYY7vLsKM4kbZHsHeFE4nx59e8/wBAkHQHbEINPvjFjTz0z
         8CQ8TVfCg2HuyCE9AIW4/oZ1nbaDDkmPuKbw2A6TRun1XUZjPVv/OUcdeB6vn5NIgLiy
         D4ZgekwTNsAVKO3y440rvpULstAHFq10r3GgtYv8FRy6OnqLYGrHmrCL40wSfypjrNTs
         Esjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933262; x=1768538062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=HdqBbgqAzHj6ApXw+jMGc7eXSWWCXwjIazivVmZU8vr2hQe4IQVQ0qVD/ZbC5tdFYb
         9Eer4aGS5CGrzbmEkIapUTKWf3nmjdNshOwiPjiWXXLvKvglijLlI9a/pyCcqgToIQNB
         LL6/ok4g2YjHhCQ3R7C2crYNZezV174R1fZkXQy0vXL2A3NVXVR6u6C9qavWU2+fvgp+
         Wgot7LF2JIFUqQmdgjeMXUCakNc+57WqkLkGcfAfIKody6qDaJOLpT3Lv6ABuPd+lItO
         bZAZU5Ea9YamD9IhAUKuopWdmZHzYCa29DaA2v/s+xWLF5h6GeCTLz8CMErV9zTHfTwo
         P2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVP6EOO/EAb931ku2gbetHukYwM46rAhQSKtsXh03TX9+imFHME1rbsHIvnMiWG0Waadq/Fv6Be7X2BH4EE9deU@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLrC2uzWbtV9qzjlJQByXfdCy2zDeaqiEDoS06+mm+UNGjkQ+
	jpy4k/PJGzCMnlMvO94PQUbYuxNzQIcLCdZFQdxb3S55761eW/9Y575C
X-Gm-Gg: AY/fxX6C3niX7N2NJEuC3OnFdQ0zPAgPDgt3xlMqcPUQHZcO7dzlVA9TvEDOq3fWFYv
	u6xZr2ra/gPnc08GcWABKXZ26DebyDPAXVz3VamvZCa5h2Oq5zw+t75trVwlTvJLdrbQcLXEwPh
	tpD6ZoTIF2XEo5y9QOXImHmMUbO+UOF1SGgSrCuIQUJaEp38BtXL2q1g4hnt9us3i+p7UN7pfDS
	5nNIPrqfaynyWziJR15dZGB1pJB5gdboDt7IbcnD8IaOmn+z+j8ryGJ3dks2CqUsWCSKauURnvm
	eg+eBC59UqQYkNOMkNnZBuhmNENSQxZ23WFQanBa3BfPIwER6kQ3pg5ELYLJs3hCBJ0HOIkPgAZ
	+HGXav6xcJXNwQY/cQ4wuXHdrpYVvuSFHzjj9PKwA9qyTlngJoMouZ/hFYajnbzFq6bUR8f0Y03
	8glXoyBExVZAJDdET3cEEMqYd1u91IpUJtV8i3cKlG6r8uKwbTtb7YD+Jp8Ey8X+kbNKnsDTz0V
	r8yehUzh7aLKMc5zFq87Rnov8fcL0CGJuv/lEI=
X-Google-Smtp-Source: AGHT+IFQMfD5BmYuMz67fv5qpmxGsSYuw3YF8lZjbLInnepHp8t3ZgfenUtKZ4QOFw08dY90b93PXw==
X-Received: by 2002:a05:6870:3353:b0:3f5:b004:314e with SMTP id 586e51a60fabf-3ffc0b5e85bmr4715058fac.46.1767933261550;
        Thu, 08 Jan 2026 20:34:21 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:20 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 8/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Thu,  8 Jan 2026 22:33:43 -0600
Message-ID: <20260109043352.3072933-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
to the q6 firmware. The firmware releases from qcom provide both q6
and m3 firmware for these SoCs. Support loading the m3 firmware image.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Check for -ENOENT from q6v5_wcss_load_aux()
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 45 +++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ccf5fbc5be66..2bb83e6afb6b 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -103,7 +103,8 @@ enum {
 };
 
 struct wcss_data {
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -160,6 +161,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
@@ -931,11 +933,41 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return wcss->mem_region + offset;
 }
 
+static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
+{
+	const struct firmware *extra_fw;
+	int ret;
+
+	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);
+
+	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_mdt_load_no_init(wcss->dev, extra_fw, fw_name,
+				    wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_size, &wcss->mem_reloc);
+
+	release_firmware(extra_fw);
+
+	if (ret)
+		dev_err(wcss->dev, "can't load %s\n", fw_name);
+
+	return ret;
+}
+
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->m3_firmware_name) {
+		ret = q6v5_wcss_load_aux(wcss, wcss->m3_firmware_name);
+		/* Continue if M3 firmware does not exist */
+		if (ret && (ret != -ENOENT))
+			return ret;
+	}
+
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
@@ -1196,7 +1228,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1207,6 +1239,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1284,7 +1317,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1293,7 +1327,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_ipq9574_res_init = {
-	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.q6_firmware_name = "IPQ9574/q6_fw.mdt",
+	.m3_firmware_name = "IPQ9574/m3_fw.mdt",
 	.version = WCSS_IPQ9574,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1304,7 +1339,7 @@ static const struct wcss_data wcss_ipq9574_res_init = {
 
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.45.1

