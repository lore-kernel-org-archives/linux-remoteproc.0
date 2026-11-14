Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684245;
	b=oTIC7CG1rBbCC/kmwJcWncIajvGPKVO7ba+jSkoynTKEHEOXYyQnQWrr3iQ0CvbqkgZm
	 yhCVQ+a2QbEIuh4Tqtsq5WpGCiK4svA1COXXD1BtlWrY1Qc5RYopovpU+nnulXlq4bnSf
	 uT0oraDohnjqvO0mpgZ+/pvjo7t6Gn8SgLGGI8CAgoYNneKHIaqQ1/IgJjjTqlB2a/c3V
	 chuPdGoxxj+4zW4/y+oluD8QJIFj5v9TWoJirvL9FJVIv7+h0qWciDw3XQhhklctNoKgC
	 +J/KBlRnJ8oTgXGfL7YEOA5ejwBsevunbi5bkf5Up+tmkYZE12b3PIqUii9C8ERy7GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684245;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bSfznyjyyxgW7NWy756/MCGywrVfq6ig5ub7RPY5VKg=;
	b=BS+OFx1EEPlWqR/1RXpuZIx8KjOYKCyo2eOFpAfQMfeJxHq5tzl20eohSGpAqxUbifHW
	 txVBSdZrpz2gLrdYohFI/UZIqGGqPgIbHU6XfJyZua5en4/EJ1XET3V/wotdZtyUSqt6p
	 yKoN+7uqVGLCJhWVXNWaqtbWg6QSlvG5s1Wc4yJG3SRDR5XtNsif819kkHhMljku8E3l7
	 7NxVfrIhApZe81fQi/UlawQc0+8O1mHrxZbaD0algOyKdrVNC5nODrZl30iu0DtHm23ho
	 GuUB8KJusIvfqjHyGn4k2GdiMiSMwTxWMQ7aBvAMuu241nIWO+NRs+egXyF+AkF+2cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=RsV7WYiV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=r28wpaYL;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD986606A882;
	Sat, 14 Nov 2026 19:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD986606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=RsV7WYiV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=r28wpaYL
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794684227; bh=bSfznyjyyxgW7NWy756/MCG
	ywrVfq6ig5ub7RPY5VKg=; b=RsV7WYiVWUtREKS+7CF8mQ4cYb3Jh4d0VWHkADvk/MXrxzWWY1
	KWghW5K+6a/XmR5d4th3RCKxlEJvajC1WR8c52FWVAYhAdYNc339P3KbCKfe+nrV7tIswugrRXY
	rzAFyVnVieRDEqyn11NK8w5ByjRJ6Gx6k7V1CQhQFL8j/V6o6tuzfntR05nOHH1n5JroXBkX3IC
	OYxYjbn7q0X+YSccUQfGWuJZuJMlhf9mtBcZoU4L1cF/4oqFjbuhbsmxduStdQav5V4XgSvCXIC
	fMFOeuTjyy60/tiWwP7L4uZa64+ugV2Tb4lj9+XwT7kWTQVEAIAW99uqTfY52xLagEA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794684227; bh=bSfznyjyyxgW7NWy756/MCG
	ywrVfq6ig5ub7RPY5VKg=; b=r28wpaYLxWtIxJs3cNihqDakGPwpZMMWAo3mVA/cMQ49H4q3qZ
	NSDZboPqqWAofpLIz6hIxGmMatKYTQMSP7Dg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sat, 14 Nov 2026 22:23:45 +0300
Subject: [PATCH 1/2] remoteproc: qcom: change resource descriptor for
 sdm660 adsp
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-qcom-sdm660-rproc-pmdomain-v1-1-980f956e5154@mainlining.org>
References: <20261114-qcom-sdm660-rproc-pmdomain-v1-0-980f956e5154@mainlining.org>
In-Reply-To: <20261114-qcom-sdm660-rproc-pmdomain-v1-0-980f956e5154@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794684226; l=1421;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=oZjr821oVKgTPy6HDhPW3GidnL9QRHRurAqP1nB6LBQ=;
 b=r4G7nDLyM5T90rXt64hEruugJxpp6prl8AzpctVIb1s8oT4GFx+xahwDoEKCQPmnaqSEFtpwz
 plSsV+EMaKlAE//BvsJD1B0Lj7tEVHbvI+Oufd4Z/rVC+xa7ALD84D9
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Generic adsp resource descriptor lacks support fot the cx power domain
although it is defined in the sdm630 dtsi, so change it to msm8996's
descriptor to add support for cx power domain for sdm660 adsp on the
driver side.

Fixes: a0a77028c85ad1f6f36c3ceea21b30dc43721665 ("remoteproc: q6v5_pas: Add sdm660 ADSP PIL compatible")
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..d5b03a433a6d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2050,7 +2050,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
-	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sdm660-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },

-- 
2.56.1
