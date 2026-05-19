Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D433B27FC
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218796; cv=none; b=uoGGQNlHB5L0yFZHoKqhtgye7DxxVfN+uQ45MjO0dXVzohbC+JuCs424JVzfXowf5dvc43TWp0zN7A3uISNicpmRBqzFgNUvxF28EJVqnoOUvHaifZBP0RVVv0PtLesuQX2K7BYwrvvvtcEM3CkmAPrS6vFPvRn6D9rWjiv9+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218796; c=relaxed/simple;
	bh=3dsf7JSfILzLf1Dg85CYRzK9TPU/Ka/pPnrNYdz/rXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkFKvjTZpf0VIuiW18ImR5LjEcvGxvlgXbivr9P+evU7BJYRHgt084tdj579MmpX1lltRe5IwodRqnKKWsrPq41obNP1s9NhqfkcrLw2uOo2TdfapRgcORjajXxj6BbgDAqlrndW4ti8mraMGBHe/c/+WzmcM35ueXemi75t08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEyWLu52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8s9zTg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEyWLu52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8s9zTg5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx4RU2867863
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=; b=FEyWLu521abaZU+8
	iRw4qMinlJ0a0f/Rkb39/FJaNL8DULpVaiZsvKwxfWyiMi/Frr41lJka/eORFWqh
	tcVGZzG/vHrbREtVSjecDyODkRwckZKLoxwp4p0EsXZc35vUkGiMynIJMjYcBFAD
	vKLYd8XIe3p2JZwgmw/QKZtNU4Cke0hLbsfg8mrXQMOM+lu1IHMpUw5DV0laJluw
	ez9sTQJBNgxLvZgXtoyTrQrt/eE20gMMimukCBwCLc8E9pG0ZvkDGvNSJIHPlPUy
	UN1lgNSIQIr1pJJBEaPHbENQq5TSIXv6hffi2zSrBzuAi1IUIiyPBj1yPSM7N54H
	HcXzfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w951m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9b8137828so41823195ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218793; x=1779823593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=;
        b=h8s9zTg5GlnctuRfOxM/Arecnu62XDtE6HmQ4SsOIQ+Z3g00mDTTxVsIzLWiufjPfz
         /qwWkPHEE9xo3QTKKrgg7sDoYJ/IhNEFyoZEt2+Q55EVR07tUNkDUw9PIXpUPsazgMlp
         PqEDJkNCh93VJXawVKsdepbYKjb+C83h3ZmGcQFGXtv4Xg4v6bVAa0lJmybekIsDNuzp
         qMtZ8RUKxb4kyvx0OR2qi8K1u+WVrsYPT9b0eUHWPXgUCLtaMYTxefGvMY4xMXHiy9+P
         tVUn7M61YNzeOUvMhcmxzYA5ajnFPhLAv0nSUQFvB66lXiieqLEPBigE8mFLxgrFmOvV
         vMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218793; x=1779823593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=;
        b=gmiIZY6QjR+gq0PoIvihV2D3nBNaWohTPIIn9EiFPyhWCBahSk0+XGRHxt83sm/mVk
         si/lLX0/sYeJNetTEFMVAv/wQV6O8R7f/UEzOnuymYT+5mjf61ACy+239at4uyrqmW8N
         Zvlr9ABVXV+Fu264tZL4mgVRkD+sqfFYJSH0uedK3H/hnxSyXMpmvZxFiaBTxS/w16wE
         1gUeTLANNjkEMCzXVQHWFSMGwzbHy9oHUrmuzKT1sNVkcYbOup4mM34/571hdgNzllXX
         L89it2wOkjTpcGgBXrtRpuIqKI/7PDDMRKPHrAyiNF7xmeELOechtULHpzHsxC7pp5I4
         sqiA==
X-Forwarded-Encrypted: i=1; AFNElJ8dN6jndoYjxb1xX5G2ZgZdsh7oobqTI+ejpFTiMTobtL7qiJIWVdKvF49JeMZsPcqoW3Tsp5oWSyhI6U10Ph4i@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4QMbFViwXb6Lmc9+v7pj8HSCB0Qc3MMmRjomZVpau7Mkl0Nz
	Q6Sd8P8fGkFfhmrCtMidcPLgJ4uxc7q+iSfTmQIiB4MkXGSdpG7kygYv2QrjGSQcJqhLdT/ZoWy
	EWEiqdqtjUs2JBPOBOBzQ9bNAOiN8T1Ueb+CJidEXn3JAdTLk/sBnhWt15tsVXqtkPJA9z6Uxmf
	du0vUL
X-Gm-Gg: Acq92OF0J0WUTfJTnLxUkEmc/cN12R0kDeL7eX/hkzJgOq2ywkrXBI1SMTskop/TvGF
	/2NcL9+A1Ds+15FgQEWOypOmlNIgn5ImjttmGD5v5J6lmYQY2eKrTGhx0dWUeBrpFQ63ND5+pCm
	u5R9rFG60MdmayDYyqRdOe9F3M891dKFokFAfn3P/0rvuQSvlotU1Fl5yZufBdnw2uX2jDIUliA
	CCRGKZ1AEsKblQ6xk95rCM+Cz8VHLI5zVeeVJymToN96h3g/ybrB3vDdzA8JYFv4/Lp5qo2EcVS
	nGqcmrdleAQr0MXkoLz4Pjo1LdQv6e0UTfU9qT6ltzMKRqM4EEVnioA8z3BPdH+DHwnFZ6cp694
	poWAecyWnpqeiJ7HV2xTK0WngcnpoIM8k29On/g77Y16jnsEPuByJsCB4BP8sMEWqDfOaIToKsr
	8xKiVBZckcTT73dCab8YObaM1csGQcyUe6c/sdQQuDojHOoxILVI4=
X-Received: by 2002:a17:903:3890:b0:2bd:e01d:eb25 with SMTP id d9443c01a7336-2bde01decabmr114697845ad.32.1779218793126;
        Tue, 19 May 2026 12:26:33 -0700 (PDT)
X-Received: by 2002:a17:903:3890:b0:2bd:e01d:eb25 with SMTP id d9443c01a7336-2bde01decabmr114697575ad.32.1779218792460;
        Tue, 19 May 2026 12:26:32 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b06sm173927925ad.22.2026.05.19.12.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:26:32 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:56:18 +0530
Subject: [PATCH 2/2] drivers: remoteproc: qcom_q6v5_pas: Add support for
 IPQ9650 CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ipq9650-remoteproc-v1-2-542feb6efb2a@oss.qualcomm.com>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779218778; l=3938;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=3dsf7JSfILzLf1Dg85CYRzK9TPU/Ka/pPnrNYdz/rXI=;
 b=DuGvqjB7RNdINxtQi2DZN8hG8e3gXxlEqaGklJPHQ2BwM+P7sAvOvpLvlO2x5dfbkvg/qvxBi
 XzaE7oEHiYUApnI30o6bzFcouBIynsiczXc/YcX5THoi7V13xqda21L
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MyBTYWx0ZWRfX7a/x0C06UQU4
 +QH3QB0C50a0IR2SMmAAKXqleLrezuvT6RAM9ZuKYbEQK9IxILZA3aURl/6yMc7pHsKHwfJycPN
 FIqZ/BaOSQM9L7VL0ZigrWNntZ6O2ciz6iwfsHBtyndlzDg6liWwwRHZF3pk4VgM0Snu9t6jNx3
 YtBa0rStye9zHIWHlpbySRU7zyIWOywLRTqrlBBLRv9izhhy5yXZ9KC22mhjoq23xCAIRJnTI0J
 +5Sf8U5xzMqEENOgpTdrp7EVyAjCVLGtwm7/sRe2zhOasc9Ed1Dhmdjy35Jyz65TAXeyMx34CEo
 2Brx5NpqUnV5jJNsiKDg7UK/mHOsv4lqRm94+MdpqVbOKhgJwZitVygpAVM/6N5LIY3+DAShEGF
 b9LsjhF3wwKTelcjydhc3WtGQGqq2qCEIlsB9Db2VZ14uMrxzalIXWBwBOdDZDPWBno6sm4ooZ9
 VzS5+27P78gUF4PGhiA==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0cb969 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cwY15C4hyq6VauHatZ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dsgeu4NiHfunZqm8OtD3iywtn8znkF4g
X-Proofpoint-ORIG-GUID: dsgeu4NiHfunZqm8OtD3iywtn8znkF4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190193

Add the IPQ9650 CDSP remoteproc resource data and its corresponding device
tree compatible string to enable CDSP support on IPQ9650.

IPQ9650 CDSP requires an mx regulator supply in addition to the existing cx
and px supplies. Add mx-supply handling in the init, start, and handover
paths to support this configuration.

IPQ9650 CDSP does not use an XO clock, so make the XO clock optional by
switching to devm_clk_get_optional() to avoid probe failures on platforms
that do not provide it.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..0f1a0358fefb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -72,6 +72,7 @@ struct qcom_pas {
 	struct clk *aggre2_clk;
 
 	struct regulator *cx_supply;
+	struct regulator *mx_supply;
 	struct regulator *px_supply;
 
 	struct device *proxy_pds[3];
@@ -299,10 +300,16 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_aggre2_clk;
 	}
 
+	if (pas->mx_supply) {
+		ret = regulator_enable(pas->mx_supply);
+		if (ret)
+			goto disable_cx_supply;
+	}
+
 	if (pas->px_supply) {
 		ret = regulator_enable(pas->px_supply);
 		if (ret)
-			goto disable_cx_supply;
+			goto disable_mx_supply;
 	}
 
 	if (pas->dtb_pas_id) {
@@ -365,6 +372,9 @@ static int qcom_pas_start(struct rproc *rproc)
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
+disable_mx_supply:
+	if (pas->mx_supply)
+		regulator_disable(pas->mx_supply);
 disable_cx_supply:
 	if (pas->cx_supply)
 		regulator_disable(pas->cx_supply);
@@ -389,6 +399,8 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
+	if (pas->mx_supply)
+		regulator_disable(pas->mx_supply);
 	if (pas->cx_supply)
 		regulator_disable(pas->cx_supply);
 	clk_disable_unprepare(pas->aggre2_clk);
@@ -533,7 +545,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
 {
-	pas->xo = devm_clk_get(pas->dev, "xo");
+	pas->xo = devm_clk_get_optional(pas->dev, "xo");
 	if (IS_ERR(pas->xo))
 		return dev_err_probe(pas->dev, PTR_ERR(pas->xo),
 				     "failed to get xo clock");
@@ -559,6 +571,14 @@ static int qcom_pas_init_regulator(struct qcom_pas *pas)
 	if (pas->cx_supply)
 		regulator_set_load(pas->cx_supply, 100000);
 
+	pas->mx_supply = devm_regulator_get_optional(pas->dev, "mx");
+	if (IS_ERR(pas->mx_supply)) {
+		if (PTR_ERR(pas->mx_supply) == -ENODEV)
+			pas->mx_supply = NULL;
+		else
+			return PTR_ERR(pas->mx_supply);
+	}
+
 	pas->px_supply = devm_regulator_get_optional(pas->dev, "px");
 	if (IS_ERR(pas->px_supply)) {
 		if (PTR_ERR(pas->px_supply) == -ENODEV)
@@ -1530,8 +1550,22 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data ipq9650_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.auto_boot = false,
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,ipq9650-cdsp-pas", .data = &ipq9650_cdsp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.43.0

