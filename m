Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EC3A48ED
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665593; cv=none; b=XViIUdTN24gg8pf2hth3ApG55dstz0cOvJf4cIYzskyOiOS2ND3EmrEpbixcYBOcKe9JNAjjo3Z3+RUTd++LvArBtCYGI7/mvRDVn+cuXVia1ZDLkB8/BjHUU5OzQIglLG2ogIRPFgrADN1Dp0Qutp0AOklwHi3FYfjKZKrGKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665593; c=relaxed/simple;
	bh=mKBVAwprFD3QPKX2iaWQSUvxXdf3vfd/iUrSiDA3sSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhoAJ/qBFFw2SAV8HDf8DoRK/xeQLkHMUDkFpnpnov/p5+DEwO7OA77XhmuSJq9lW5y7mHNOuWEWjFF4N92wi0cpOwYwA3eyn7oDXpz9KBlHZHe7BFXPqCqRtAQFpHgsDLpe6FKBYoTVsGh+E4QTMzEsqBTIC3oGG/8mISGcr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJYtcPeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKSpKyo5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJYtcPeD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKSpKyo5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nS8D3848786
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=; b=fJYtcPeDfSPdozuR
	oeVuQlKinHi51K3y03bh7QMzIPWGqq6xLmxs6AvM3caOHOmlWLNn+Zrnzb7JBSE/
	d3OJyrtsBJfIzYfdrOmRCdWrhif8KFx13Sj2p8FUb00UC2Zi7EyfIL/3ubBu9fBK
	KOY0rz8pSe90kGeAakGjbrxx9wXyyH0i7YTZJz0gQnzuFTNIHBfATGQqY2OvX25H
	gacZU8pm9GVZmbyDBNT36DjzgCNZBhj4ahSXSIY59gHYOn7Bce+hfxkfluF7J7Ib
	RWXskA0Ge+j4b/t9Y4Qhx0g4d/7dWgStInuRUvlqK3NUM7q9TMOgB6IxuJvnKg5q
	p64PqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesu4q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so606353a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665590; x=1784270390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=;
        b=kKSpKyo5x0I4K1IMGNtJ02j5MfoLi+vKZms0keNfr+DDBOogmB4tt7LFZx2kEBgUdH
         eDlkclgKuRVMW1s8LWffcBX85Nv4erqZrwEJ9qQq+3gDGH1fCD4jx1s2C+13tVvnePEr
         havjtdRlUBbJTHqAtB3RetVYsyuYE/P5lLY27JCqScIQhpUtCesP7dWsE5lyCrODTu92
         hlTSFmIsV3vvz6BsH1XskjuLVdMxTHaDdHQmOoxc4iVWK3z8hY+Lp70EmP6l6h8Qr6dM
         WTbn2MxdFeLSvUuZzeq4uIWF2yKMm6P/PpeomPcDSHQqRmaWZClzWLn8XNZ4QZwV/PRw
         2XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665590; x=1784270390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGqQNVb4rdlrqtuYQYJ4Nigd3UJJNIYtvJUuDfImg24=;
        b=Zl/4KCglr99A1o3vLvfAPbs/cFzEWaSVviW5RriU0d5fp+22udpA0ypG08Y/f9xsG9
         +oA952JLSKQ8ogPBg7xgIpXKlU+vCIwolFsiquuCe+Cp9ovztCrpYJKmz9LY3QvlE904
         gsKNq8G9P5CHpp7mwzZ/OJmfNK7SOzin3j9pek9oKJTynxmyZpurSfZARIR1/gdplxv2
         6gGuDVlbZ/PQX+U6zwl2z4+qckZClM/7TJMhvUNokV1B0rlbne57MHdbxKPuw9vcUHjo
         XLIaaagHST2wkJHAFxTaLfIkMLNk6ruKHvupVJ2xTrPa0OJ3hdVSs7LW5bahr7FpFAMj
         QRXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpikncO2O6YZYR/kEeCFQPfXucV//MD0//XUFgpQxixtTWTPOdbcNlZ2izs4t1Jz9KBgjGwjnomm/rmvd4azU9G@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcZhb3QjxUq0CAnwhQ+i++M+TSD8GUYN2HB6wrhQ0qPnL836U
	7QQ18V0ssZh+MdQmC8rwHiKUiZhWNSp+ZZSA31PPgw4jaET2O5YarszZ9w6TnHo6L4vmKkTN5Bh
	4h3okkotycF2PcxJKg5o6BsZcmkxZR66Nai2SY8X4/CtZZglgjXnTfjW0IbHZyV7MV3PGc8v9
X-Gm-Gg: AfdE7ckSwU7XFCmc0YPgteOGD/R60+LteYtcOMF4/UXAXlhpIGmLF/K0rgEVFUVWKVa
	Bjx9vFj40asEm+cnDv+uMU7EhEDV9t2sonYTJjN86nNnqAiZlBAPsPwhsDLNn2gy7R58BCZMuIc
	UccvnAVKr/tuZucrkNIfesgpaxomNit0a67MAz6gyVRJRlAKjZMYUxSRKI/+Q4KTZ4X+E7/DvYW
	y07XWrpN7R55pm20WfBLb242peQ8/N6DkJy4C3FLJVhQuviKjbSJFJqKxj6zPEvN9/uN8pDspbu
	CxbDhumWedZJR6dVjXFEuvTyCuTKGPMF5+XBo6NlmzYgrfjHG2m/3xWyopOd81q8A/UUckAObiZ
	QgML8iwYza2GBzEib+Elkaqpl2wD7FkRFweMAE4Gb9d0ciaxvIgd4Fv3xDghq
X-Received: by 2002:a05:6a20:12d0:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c0bce1c020mr12815339637.13.1783665589789;
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c0bce1c020mr12815293637.13.1783665589296;
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:43 -0700
Subject: [PATCH v6 2/4] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-2-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=3076;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=mKBVAwprFD3QPKX2iaWQSUvxXdf3vfd/iUrSiDA3sSg=;
 b=QlgttbScang0KkpbISH0OCmqWGEsp14j1FgL1CIZ2Dj8XptLoiixFVJ2kV8THm2wy8JPe2u08
 +RqGcqnWHkDCZ/le4f49kFuYcoBESlkrmHlP/cJi8XndSOabHGGMa0x
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: FoLikJUckwAH8UwoyjhqRZe9xGkH5u9S
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a5093b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sPHwxj-pcbBuakODP1gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX0iG3LeEXyVud
 Gg6KhgdEkDuih5fsOlnDrC1PJuzCmx5L/PQIGuPj/hCN/e3yzoiuYbEswAnX+fXaF5p/V9IE/WP
 a/Ql3Oj2DItLdGLcBvrvxBAao2XnKgo=
X-Proofpoint-ORIG-GUID: FoLikJUckwAH8UwoyjhqRZe9xGkH5u9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXyUPUpijEwhbT
 0FmHO5gBMVhkVUFiW48oziFanoXlbkX2/Fg8QItwfj3s6JOz4l5pAQRAutZL+lCDLdU/vgRH8zF
 Ta+SkqddnVyq3q7zyMGyHiQqtX5D2PEq8Fu6A3qdOC/oPnrVkPLissnzDrcKbvJM/RtVdkmLJKC
 t0Ll49AJr9pjmPvoT/jixbvgkltKIEHMZcVCAxFzkraZK20eeHEmOoQ06GktisBXs5rFXFNzt1k
 EQhFGv+IqCHG9s9K0pv7ClLusuEBkC9YF4zCAbUeIYh/JS+PPGeE8jRCDt5lR8bNy+fRdbO550y
 zVfDceCt/4OsQd0OYwweS4x41MOev9uIpwhsPKaDv7OWPeCEQvZtNdQWA4qNjl0tzdD8T+KJ6vD
 mHNoOIEWrJALMwwa2Cl802XUHdtSQ2BNcnFUXe8jXuokHkh0cwAQ217qbDSQ1eYb+3zfUBcmH8u
 95yWLGbkVyI23dGna3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs running
non-Gunyah based Hypervisors. We currently rely on the iommu property
being present in the remoteproc nodes to detect this.

However, this doesn't cover for cases where the remoteproc does a late
attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
Management Sub-system) that doesn't have an iommu in front of it. In the
former case, any attempt to create new mappings would fail with EEXIST
as they are already setup by the bootloader when the SoCCP is brought
out of reset, and unmapping them to create fresh mappings leads to faults
since SoCCP could have active transactions on the bus. In the latter case,
absence of iommu will be caught by the has_iommu flag, and SHM bridge
creation will be skipped.

Fix this by introducing a needs_tzmem flag which would cover for the
above edge cases by serving as an alternate trigger to the PAS helpers
to ensure that SHM bridge is established.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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

