Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684240;
	b=F+d9V7nnDw0/CmPtMXYMN5eUdXMaCorelwlnIoAXFsTR+8rdSL4Qwl5AN9AK/SGkTF7X
	 XX7/6T6zcInnn4za+g5gVlaYuOmy1ECXh1Oegj8KMrJiYy/3VtMtFFi0E+FQfmPjsrddV
	 xj6yuMPajprqjToHHdB6MM+VW6VtBg1AZ2GC0z2taPv9DbQJxt2ZWoH/ft4tbJureYI4s
	 cqHqpjnhjWNISeGePypWL0pJWIgchV+CFI2rxlQwIXUiLGOJu1FcSI2+AtYL0zoiBow0z
	 r2MMKxWelA11cn45ohqQne20lMCl7dYTpRFNzUk19GIUA0AdbKnkwZ77aOnc18BtuQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684240;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=faJ+4FRS4YBjRuUA1Kc3aUj2xUF4DfAu3FisINY2qOA=;
	b=Xs+uIyx8k75hGtKaiteKdzFbvFPi+TITpoTZt29FAq/cIdFnwXEspNcav3gmfdHTBWdR
	 UYmzdX3AZ/9u8Fypv8wkaUYAnv3jZKEJjt9esGUxcI+iBA5lB6L11tOG27jCocHlkYJQA
	 pPUKsIy4MACMYmR/ZWMFVlEuHYCTqmggeAmirh4NShLbhXr0sFnx9plMtdATl1vfnnvzC
	 QlyUxql/DXJOK6Z34q3FpQMG4+Jj+2hmzIKFQUuaKp6EuyqNqeu4M+H0t+tE8iMzqzqko
	 pkR7QYhLklo4l2qzgFfs09p1swkWKx/0aJpYQkWGTTqyFqQqbdZqcS/Kmwx7uG0BZ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=qZPgLM+5;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="e/L7rrsY";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E648606A32E;
	Sat, 14 Nov 2026 19:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E648606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=qZPgLM+5;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=e/L7rrsY
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794684228; bh=faJ+4FRS4YBjRuUA1Kc3aUj
	2xUF4DfAu3FisINY2qOA=; b=qZPgLM+5XAEjRQIvl/pU5hGh1JZAu5YmoM73znhyuFX5k+OTti
	cUQIxed6uipdl9wysx+lfbD8biAjkfFUK7YMQoNaxiwUMhejVrI8R/C85K4FPVUDaKFOiP/oOQn
	RJB38Q6tuI7tUEFY0eVOWfVaSPznFedVoZYD4KuEF9L9pz6/A+xSL15AsVZXY0kjdMyd1u3F+3J
	65GxheD0/AiS2ND5dEjldK41bDwRwtI4BkK1/TcaUd38W3M8rtAzN8FvioIcWcB2CMR6Ajbhjge
	xnnmWASregTrCmyk5fCmguYWDh71fpNZWmPaMIJHfhiFo2m2KvLLgnYOcztemER/P7Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794684228; bh=faJ+4FRS4YBjRuUA1Kc3aUj
	2xUF4DfAu3FisINY2qOA=; b=e/L7rrsYclDDxkHsCVHzIdPCbVu6qeJcxSfFmMFRVE9ocLx2jP
	u7r5iLqaV8vSv/d+rjh0IQDGbGHelIDVloBg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sat, 14 Nov 2026 22:23:46 +0300
Subject: [PATCH 2/2] remoteproc: qcom: Add sdm660 cdsp resource descriptor
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
Message-Id: <20261114-qcom-sdm660-rproc-pmdomain-v1-2-980f956e5154@mainlining.org>
References: <20261114-qcom-sdm660-rproc-pmdomain-v1-0-980f956e5154@mainlining.org>
In-Reply-To: <20261114-qcom-sdm660-rproc-pmdomain-v1-0-980f956e5154@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794684226; l=1875;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=s0XUHWTfHT6/tkY5QsqU043/LHbikNchMss/Bo0VRrM=;
 b=hitsUgqBA4xisKdWgVhBnC30hIsIGjg5Lqovu+dhQeIipyH+A4rlDb4evTL0tBc3qNIIR16ZP
 W1FrhsMpk8hBS9nSe61yXeVtZB9ZKbB24kicoxWne9t4QVCbPQFqcRx
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add an sdm660-specific cdsp resource descriptor to support cx power
domain for sdm660 cdsp

Fixes: 950c74fd6cd80ae6773aa3bf4cb4321b83f194d2 ("remoteproc: qcom: pas: Add support for SDM660 CDSP")
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d5b03a433a6d..32b90718555b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1295,6 +1295,20 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
+static const struct qcom_pas_data sdm660_cdsp_resource_init = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -2051,7 +2065,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &msm8996_adsp_resource },
-	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &sdm660_cdsp_resource_init },
 	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },

-- 
2.56.1
