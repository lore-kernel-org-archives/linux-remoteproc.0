Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976C3D25BC
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081905; cv=none; b=nI7bCz+5MZfpYbHjW+/LPNg8DGra/BXy1a8CJbQSepmJbBdeBroUkZlrxRGEMNb5d4pJEmFDVsu1qMdv5vqq018zD2iQiWNLBBRgxJbQ99z3V97SY6/MqudAABnLZKVhdUmfsLS/iWpUFy2q29U/BzqDI/xCAmFJxl+y0Otlm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081905; c=relaxed/simple;
	bh=ZeKYCoDs7FPwodBAJHK0//8K6Py72kGbK24x4nRRC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTy5KVwgOzqRoYYhYnrIEwmi+5flCiQz8L0+G4qxTUV+Odq2/GwCEHmfAr6uVJS2927UbIhLNHhNp75XPNF/rnV7tK8ibVonnc3XGa+tyFQu229sU7GgKn20htq8X0VGEqmT8X2tiIkfGpSV7GH5VpElAxFqY4etkiMkkyAb58o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENmWm7Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCX+1HBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENmWm7Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCX+1HBW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A39003773578
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 12:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=; b=ENmWm7VkIFs/dTtF
	1LK+pM7Hpk+apaR2+vwUbAW/3br72lgYEtXabTLoH7CmHBnjO+Mf9jv9wBH1oZle
	vPTnfZbCJxv068IbtSqMtad0NswznXbtMx4c+55Hcpte8VcJyqAb1B99K7p5t5Im
	qJ/yDTfSYrmR3xeiskgG9QrUK8iwSoWR2FP+a3pCnlv9m9lgjfAHCuOLWIXhojg0
	m1QALgEdAb+qjyUYbStppR1+emxKOCq8ER5OgXyitjwWwlNhZI5zPsBlWkuTSrV7
	fWQIzKWIGtlJdtKbIbba+nezNq+DF+JZ8AvwGAt4R+Z1jgPJddDxMf0Sjpeci6AT
	ajbpzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038k00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:31:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38096521198so991419a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081899; x=1783686699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=;
        b=MCX+1HBWXeXxN2FNgJB4bHumgwVK1B2qtgCIaRg5mc1hevAgQ8QPwE5/Xufzdr+amk
         RK2YudaD9GruL48FVoXTQsDFPljw4VlheQhjEyt+7c8lTpmkNHcLJy0Cm6eYuyUDEckc
         nOeHl4WTbh/7Pepthmf3zlNJNdEwHgNWPzVdfuOqUhHb1bjGZZN7cJB+F33l1UdnERuq
         /ABw60w7B1bSiG0GcTg5xoOG25GnnlK4+A3tZpcXxKg0LVcDgIpjEvXj7/A99HAmQdpY
         CN7tmw6634v8xCKwuPNU72CWb+XsgWiEMNPvY4fw+peHM22gYRjOKd8LNYSz4fj5mEXU
         xHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081899; x=1783686699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=;
        b=cSui83nmgJT5/0t2Irz6NWCP1am4ByDLNL+kr0fPg82hUl/GTmU45+7Lrx4HaBFS5Q
         JqX2ad7lN78Kf+0vTv+tglmAGiJAzCwxocK9i0RKexQkyW3o7+X4lQWkcIEQVC1sqdUj
         FrYzhpYQImgDzvFu1AlAJOgpsJ2UzE9VKIXm0vULCoaBqnZfThTKVAkHW/c4WOWtGcDz
         8hw+w+7v0JGIGlaCFva+W2G++bGpg6l59c4q2Ut8BdIlqcOTtO07fo+ZzMCColedmfGC
         dslr+6Q8XFfWZmNbBMr79hOeOWEysMfa6sYWtTP8CBHA8odCwhDy48hbL84/D9h0N1aZ
         mLpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUkrhZy9x/dQ5Fq+dZZlbXbWIgbOFd4YgfGrEW+XIiEq0tzG/1TbEb8AKM21qJl/mR7QnfY8zhMT+e3HLx1PPv@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTg0ICmi7zbG7acTNNE7J6De3VauhYwisdpCZqKGUYwrxAIcZ
	ebK27kkFdfuySZUAaC7qHvO/IhgTndAZ+uoSOBQmn4GOwtSSnQ93UpGKw+zW93aZJr74Z320bDF
	h9iltizulODMDpI+sfYXjkjLpvTktJowGZeDcRgDmxx1nlAhF+5UBLxL20hXWryPHOYiLmjSt
X-Gm-Gg: AfdE7clHEqzHmhwI3WzBp5JEAcjscjd3r3OuiRcmAv891wwUhrq3GiOEmh40hP9Zdlu
	OL+QluQir211nS8PyfbkERXIJpoFETscymTEn5YSmavWKFwqZlNXkowqGs80R/fqycUbyC4cyqg
	Hx6eJh05yTwAwiRKun0+9GSzweJk9qjHEXm2UnrOasOLyOtpBOZ9tTtD3wjkHc6wuI4lme78Luh
	p/qY479Wzi4IunqJILnAJ6D554gZ++YKqZRgYdyYBD7aw8kDWh4RqcAHJ/zEk680c+3OMpDDlv7
	aNeqjK4Ox2jEfCiIQU5Gut9GshllXHbZAT5SO970wLGx2OXEb7nYuz3A2bErgbsCo8cgCfzSLU4
	5X9fn3qjGEB1AGvla7oBpY49CbRCoAMsqbg6KYaF/ZDP5XjPgVcnv9RRSok/o
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-380aa07e089mr10813273a91.2.1783081898495;
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-380aa07e089mr10813208a91.2.1783081897853;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:11 -0700
Subject: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=2712;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=ZeKYCoDs7FPwodBAJHK0//8K6Py72kGbK24x4nRRC00=;
 b=FdpZHcPYOUQtw/HeSpZ5f5sH6IU73Ruw9Hq6hC8pDAVpwVE4ByVEAtSkxBCNCnAssv1pM41Al
 YlvBaI8QifDALggqzjJOJbLD0TecxbCInOYtn/ucp/AVX2GVImBHVTN
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX1U0IG4XZSTa5
 8s1hPJQWF6Mj/y6r8TgB6KBKbpFCL3aXZA1lgVeWGZGQ2gUeydXtToSlu2rZtTg8VjScMe4eF79
 3EGM0XN8cnZkXbxVn5BcEmXVSEfZ3Oc=
X-Proofpoint-GUID: 9QbEKmS2UY9N7-yvpA_ny2fQUCkf8JL2
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47abab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TBRyIjXBjLUW-Ng_AUEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX3KK51kNmCwL4
 WHqay++EcECEhQaQzHxDj/WT5EafcOMQin3diP7G9D3NxlgN7lawYKA5z4p9yWD7YiEwlJ9jkab
 r2+mIaQDv6jOu9P6xoxUlmvVTinVvZMWKMVx9GkkGO54i+l68VulcXNFxJ+xwd6wT1eHxXE3cTd
 LPxGfgYE4qnIWsyujKkcQ2VYUgU5MhKTFosgD5Agp7/dNy2+u8jGL/APhCCoBVLwy3t0+bPgChI
 vC2/f3nwHuj6mgQqBHaHs70ll4hyJMPDOK+3SSthHQUlojwpr8AiA8JzyjiDUHs77WPcXorQVf8
 quFhv1NLeqC/ojK9ylS8UbAtzGvmtPzIpNn4/ZAETeNRVxm8lUiGW+HeZYYguszWtX10rRy2lnw
 qDMt7iAqzOxghssVWFQxKd+YeFzebt9+x7uNDTN9wapMCiKWJGf0ZW4P4IH4iX5nwzxfaXqaxax
 fJn4O8mw+GJB87UNVJg==
X-Proofpoint-ORIG-GUID: 9QbEKmS2UY9N7-yvpA_ny2fQUCkf8JL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122

Most Qualcomm platforms feature Gunyah hypervisor, which typically
handles Stage 2 IOMMU configuration. Additionally, SHM bridge setup
is required to enable memory protection for both remoteproc metadata
and its memory regions. When the aforementioned hypervisor is absent,
the operating system must perform these configurations instead. We've
been relying on the iommu property being present for this, but for
remoteprocs that are already running like SoCCP the mappings are already
in place, and any attempt to recreate them while active would lead to smmu
faults and a non-functional remoteproc. Fix this by adding a needs_tzmem
flag which ensures tzmem and SHM bridge setup is performed independent to
the iommu property being present.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..cd7273fbcf98 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -61,6 +61,7 @@ struct qcom_pas_data {
 	bool region_assign_shared;
 	int region_assign_vmid;
 	bool early_boot;
+	bool needs_tzmem;
 };
 
 struct qcom_pas {
@@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
@@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },

-- 
2.43.0

