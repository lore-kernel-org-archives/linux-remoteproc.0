Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FEF3218D5
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601707; cv=none; b=LmoF8TK1awt1JqDYZDQ+l/PF1jXjmbjN5dHn2SyPBhqUR6Lh6UYySni2FuuEZIW5zQZcV4NZRqe3rlGFLBq3TCKVXZKW/9cOO2zD8ttuzpnP7myz/Nz6jGRk1P3riZgfmcZM5xUS8m8LmpEBSzw4klg4DXIwd7ntacMCwvdtcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601707; c=relaxed/simple;
	bh=5Cm91oSUyXHyy6yreXV4rGUm1byh8yAeFEZWmdl7qEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8Nko3TqUtrlHi/YRXupNADGFuw4YsB1f1cwZxJ5/XOW/nFhyTL8gUkpgCVfJFILN9Vx357QWRYsR9qcbH83/U2A23FU4IvQ3xK2zRg/Fz2nC+XqYJKx7tKuFAqVaZTaCdJ/17BWkagJFFwTmBxUPEd5BKIE5fbn2QzchMgHV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImeXTpZf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImeXTpZf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb72d51dcso726216366b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601704; x=1756206504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpDAKcv7fLih20nGtOlLdXsRYm0EQxxtEuxIHxz2kTE=;
        b=ImeXTpZfjkqV5CVBFpw92I8cX7kNOI6rR4SgQgh9FU6T6HCl0HVkG0WABHME1bIr26
         4WD7ijmXA/DQmwcHkp3I0Yea4Slfle96l6nbhhPOaGYdFGgyCdufiO+X+libA7uBBnqP
         Wxer5K0+RG0HjlNbJxV17NO/7+f+MrTLwCiIHFJtp1EgV06v/XRP9QCVDsGqKORDyWEH
         FP+2L8EFsi3+Zd8j913MDWktbR3mslk7pgmhaX/seHe1hwbEeKDXSheEKI8V4ooVar1j
         69D2DphTA5o2KKeVoLa7TtWen6FFh2VqJkQsAmonjbFBnO28V4fxIUMLq3oXE/CrbtZJ
         vENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601704; x=1756206504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpDAKcv7fLih20nGtOlLdXsRYm0EQxxtEuxIHxz2kTE=;
        b=vyPFdfkBqdCzuznYlxwpth6m9rJmSxgcgrVsY55RmYHj5hZzddKMB2UfkOBnkfV6pX
         OlVkfw6FE1cxiVFMtIlrWErqA8a1bJo+PA7FsR1hfcDnFiMcf2teRz82VBM+uKn1YJvO
         Rg7LFTEv+MqvXBWs1dcRRNGkzwmBijjeUGzQQBujBfsx0yBvkhNAXKeSVzNmYtYGUi8j
         4ic7/pLA/cZcKcJ0Gq6X5x8ITeVDsTXVzUoNnA26D94QIHbzFUlTLLI8DEkDYlii5nP+
         qw7XHobJGVhnpwcIzgmtDz4WDlMSyvdxfstC1fK55nkEhx7uNCM/nVu3j+PPsr3p5S00
         ELtA==
X-Forwarded-Encrypted: i=1; AJvYcCX8NAluT3nzUcJvhoS/qLXK5+U3wmPdtCYjtnDanZLLHjNDPOt1wISQhLAw1sEE0sr5fIHHeFtvBZEErqPIORo5@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDYXwNiR6yzwNnIeJ4Hk7QV41dTx18sRTXqxjDi3cF/ZdAHZk
	F8wjQN8I6u2IH35obVu2d13QZFN42JVfFpoVChCw3vgzO47N7CmsvwyUFQ7DCpwYXcY=
X-Gm-Gg: ASbGncuNX7Lxqy0Lo8iNniQeE6OxdP6Wc/yw1FTltHAorleUuYUm11Y4mJstBjSSkMK
	zsumZDv2KHLuo8zjG8UoUHQlbL1ekAs2Ycr9B3bhGI5Ull13v0wnR5w2N5bB0k4A6tNVIE+TC9y
	iPLS+L6Q9beBg487NDG5hELXiBciSOSGP2BORHGBQybIXfhJg9B6CSMPIdnh20+w0I3J1qOVk1v
	uUHs+Rls9xma7b7Rg3gyhyYmTrUujhIfw6B6e5FFnNuWpMqhqL7qxwBGN+QOF0TeebYJy0/YadQ
	lVlTMGeO3ltM3XPuqZi/8DCVuz9hfJrOdBUzSsozFxgQgtc9UpMDNFoSy3ijt8pDz2ERawI8cSY
	R3Fm3tc/OGKz6eL0ZE+A6/vDPwjFMUgFXXOdhzVGgRvrZmR9j
X-Google-Smtp-Source: AGHT+IH9vzrOOzeP1dBM4pFoF33YFeXNtK3jHXKDBLebjoeZjTOHNNMM/dRMFIrqI+YVvusdLzCH2A==
X-Received: by 2002:a17:907:3da3:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-afddd1c9e57mr200862566b.53.1755601703592;
        Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 13:08:04 +0200
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on
 X1E
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-3-de92198f23c7@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

The ADSP firmware on X1E has separate firmware binaries for the main
firmware and the DTB. The same applies for the "lite" firmware loaded by
the boot firmware.

When preparing to load the new ADSP firmware we shutdown the lite_pas_id
for the main firmware, but we don't shutdown the corresponding lite pas_id
for the DTB. The fact that we're leaving it "running" forever becomes
obvious if you try to reuse (or just access) the memory region used by the
"lite" firmware: The &adsp_boot_mem is accessible, but accessing the
&adsp_boot_dtb_mem results in a crash.

We don't support reusing the memory regions currently, but nevertheless we
should not keep part of the lite firmware running. Fix this by adding the
lite_dtb_pas_id and shutting it down as well.

We don't have a way to detect if the lite firmware is actually running yet,
so ignore the return status of qcom_scm_pas_shutdown() for now. This was
already the case before, the assignment to "ret" was not used anywhere.

Fixes: 62210f7509e1 ("remoteproc: qcom_q6v5_pas: Unload lite firmware on ADSP")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbee2d305827365ef7d2241b6eb786b..6faedae8d32ef6c3c2071975f2f1e37a9ffd8abe 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -42,6 +42,7 @@ struct qcom_pas_data {
 	int pas_id;
 	int dtb_pas_id;
 	int lite_pas_id;
+	int lite_dtb_pas_id;
 	unsigned int minidump_id;
 	bool auto_boot;
 	bool decrypt_shutdown;
@@ -80,6 +81,7 @@ struct qcom_pas {
 	int pas_id;
 	int dtb_pas_id;
 	int lite_pas_id;
+	int lite_dtb_pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
 	unsigned int smem_host_id;
@@ -225,7 +227,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	pas->firmware = fw;
 
 	if (pas->lite_pas_id)
-		ret = qcom_scm_pas_shutdown(pas->lite_pas_id);
+		qcom_scm_pas_shutdown(pas->lite_pas_id);
+	if (pas->lite_dtb_pas_id)
+		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 
 	if (pas->dtb_pas_id) {
 		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
@@ -722,6 +726,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->minidump_id = desc->minidump_id;
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
+	pas->lite_dtb_pas_id = desc->lite_dtb_pas_id;
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
@@ -1085,6 +1090,7 @@ static const struct qcom_pas_data x1e80100_adsp_resource = {
 	.pas_id = 1,
 	.dtb_pas_id = 0x24,
 	.lite_pas_id = 0x1f,
+	.lite_dtb_pas_id = 0x29,
 	.minidump_id = 5,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){

-- 
2.50.1

