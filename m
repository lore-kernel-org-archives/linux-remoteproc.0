Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83D30C603
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241789; cv=none; b=C0VWIg0RNb36KVAnW5s0qBG89pwRe3Yz3ZVxFF7XAGyDqIVhlpbSn4TpS8jAxQgjXc8xrzlRxyrWU5IiIhzGoFH/GNi0/EhhyfEj62t/IuxAKClfTptndiL/lz3Im9SzU/NByQ/wyC1RV6T6wlKYe/oSOFA9iapjnAYVgle1Z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241789; c=relaxed/simple;
	bh=rmozCYG/Ljsh7GMxYF8mDZZkLJE6jlmjxWPOEdA8pAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GXcZKfkG+jVXpXLM07XgtWwom7ppHtMOClHpzv4FvePElTJLslisr90FPyQyLzxypyW3HuZPemRWU83QjAfw480f0aQbOW+FeGaRTeXXa3ho1C84zjW2St68l03FYC5DPh84sj/9AAH8OmvwM3cqVipNd5gG/SRmKh8LobYsoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPltCVYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fsuk6wdr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPltCVYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fsuk6wdr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43OjME3693369
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Qkl41O9bWIzcRWMGMULQ4Tz0JkXETLeZtykrnuB7Cs=; b=fPltCVYYx7KHgHuI
	KcIXtu/xL06sVM+Ttm9YkKsbgBnOonaluJL1y62qGuG/xDvG/hBACiXM7z4cKs3H
	aKvGwswg01HrrCbnNoQofNrlHilPoNuW14ZZOCg5fmsncNSFdcjorMNxJxMVPGbe
	axCMRkMnQWqEdastXgfqO5+1t1zos5gRVEUtO6ITERuB1E7nQJBPUPMhMvjYnwXM
	XmuMfu7/dYxMynHeUX26DT+BOzUOiCva/wrA9L/22r6JmSVjMSep+0M6xIsZU7HX
	RHa3mcICtSlB/MFhlOHZPttMoCic9641o9da+AT+Cr4BP/SbJM4MLaN1x2T1qSHH
	rAoLMw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b31wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b63038a6350so4432113a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241785; x=1762846585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Qkl41O9bWIzcRWMGMULQ4Tz0JkXETLeZtykrnuB7Cs=;
        b=Fsuk6wdreaEU1gk/Mw7BzftpGMLaIYZXSi+wwBcvTs7AM3jK/FK63cW1FAxMIp17Fg
         A7pbvB4tFKosZ5p0oTGamFbzwEuu18iyhBuLBJn1XHOyelgPeQK9qI0R3/mhnAsB5NCM
         pSFdngBauT0znkoNw0Kt6UDu6AcIB8HQHJ16HjA03CvNc5OnIMXle1FruUqyTyhOJxTJ
         01iFlWt7NMi34mfPdDUStOWXFoJQznNicXzPtNdwSqFMl7NjUrYSYL3XqDuRAIOYx+0O
         WUchsohIg68gvxwb1C0vuv+3XL9ItT+A+px8i7oCFUibmcKuwDeyrZdpKdYmLtI6sk6l
         lZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241785; x=1762846585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qkl41O9bWIzcRWMGMULQ4Tz0JkXETLeZtykrnuB7Cs=;
        b=VOobsFk4Y+Y5fjfs6Dq1UcMaLWorDzrOF4GQdhkAv42eFeR8eWIjXsBdmnPr06tr4v
         SldPH4QXZmY0QZHvdmm9vCm4K+NcCASYZP6Mc6ITMt7gclHvzk/Xzy0tjwiEI2LMdSva
         QpsaDXL2Z/LcDjVh7+OkCOFg6F2E9bq4XonrNR7YzIoZ47xvZuNG8PALfhH0QpJoeJ+r
         p59BzkViRkQiOHkYKi33qwslpHs7xLeJF5y1Al5V+iwQ6+kwvKFSVc6txcJ8sG79biJn
         1cNN0hxLtDxjOlW0RIO10UoE1Ax961j75jdMs52OVbkj5N3k1b77cb7m0/7T2jUxY/D/
         08cA==
X-Forwarded-Encrypted: i=1; AJvYcCXptVNW4/pNCenY00fTl6+x/+AGedB1X/cYFhGYvOKaGWGIMrJU0k0Azs6QpqIoVLbzUgiPlw5H635KZeJmf7Do@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5b6tXaqFlETBIS7BYYgj60bkPfamauVpz5dBw2EkgEkDHHEwG
	ghJbFubhsfnGUM6XjiiYN+o10PGwSc/rMQjRktDk18RamvMOS6zZKjRC2J/dP6tbgf+9+RgRkc2
	BvbL8j/qq3eqfLf09MT787lIgGMwbUtndZfQBy72CISXxYNAVAAjv1g1QjRxRUb92A25RiE8d
X-Gm-Gg: ASbGnctNlk7yNVOv+Izvu8JlOiO534hwShLCYKN4MSvxyeQhnihnxoa7kcSkCe9Edgg
	/Li0gQuflKV5bi6YGvVq4JvVs1xsdJ0uzx1z5dRZOeuybCRau2FsMktssvDYpiR3pi835F/5cEt
	M5BHwxUhE6YwA6ASO1BWsTDS2hIC+xWufN33cvMskUBCRzgWdbtfuzm9BpBhOY/WRMRiCVvurNA
	6y6hkbqUtgRoUHFpWW594e9A12TbEbqA+OxBzrPPg7kWLzwFf4y8uQZyOEHed8KNcCejUh61d7q
	maD2zw0NZSAMzEFmEF+yteoYyPMEXWmhRMMymWPBcDtC6tAM0NeCdiBMMJmZj7W3gweW7bmWym1
	O7fOfAq2Hs94v7JM7tvghd99w8A==
X-Received: by 2002:a17:90b:3fc3:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-34171851b38mr2755159a91.3.1762241785014;
        Mon, 03 Nov 2025 23:36:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrWhNz/5lskpuFXtezZ31p252KcTwTvxSVuYrLyKHiTLuk29MoKj9eV/9jO7V6f926JNJ16w==
X-Received: by 2002:a17:90b:3fc3:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-34171851b38mr2755146a91.3.1762241784284;
        Mon, 03 Nov 2025 23:36:24 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:23 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:44 +0530
Subject: [PATCH v6 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-4-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=4074;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=rmozCYG/Ljsh7GMxYF8mDZZkLJE6jlmjxWPOEdA8pAM=;
 b=oOYzziovTwf6Ughn9dTJjh36FrBQQ3aU98ekJTlAytEDzcwSaVT42Kg9NHMFnRam5HFDUiO2K
 t2dV/5qGkInBjN8dwqinAKUETXkbfspfCL6NXI7MLNAdK1f9F60idO1
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX6Xox6AD+CKZZ
 NmSMNwHXlKFyCKi8Em7aSyLg+LN0farjg/pDFEYycYqwn8dJmVuqiLAVkR/tTLCpgob41uTjEv3
 0tx0ADEUJjWwYeQ6r1oJzk5oQS7ANirZGCbIE7C7WSUVv9um1BOYgMNVhp7D59xYZEXCw+EYB4j
 tTod3A6V0nsVKbROr572frmrPtOsfdY4OSAOaWPkW10RKItvEf8VQX3zPemXYwhb8TV2KM/wBIC
 bWguLk841HozYHrV2nvxVOU1ARbfUh1h+ewA9k7/n8VLUXFerL811+4a5F9X1aSS3/junssinjm
 U3Dqx4J/yWkUx3Incpi1VsuwEMcb4yHRzjTejeMaghnuLoaACovUvRbSy2/KfeVLeIYddpEMjFb
 CQKD5jRG3SzXZmW73SrWS4dUBNZ5kg==
X-Proofpoint-GUID: VeIGyYzA6F_am9mXBCuTRtPJlcDriNdO
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6909acfa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VeIGyYzA6F_am9mXBCuTRtPJlcDriNdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040061

When the Peripheral Authentication Service (PAS) method runs on a SoC
where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
reset sequences are handled by TrustZone. In such cases, Linux must
perform additional steps before invoking PAS SMC calls, such as creating
a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
these additional steps when Linux runs at EL2.

To support this, there is a need for a data structure that can be
initialized prior to invoking any SMC or MDT functions. This structure
allows those functions to determine whether they are operating in the
presence or absence of the Gunyah hypervisor and behave accordingly.

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to differences in
metadata context handling. Remoteproc subsystems retain the metadata
context until authentication and reset are completed, while
non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
retain the metadata context and can free it within the
qcom_scm_pas_init() call by passing a NULL context parameter and due to
these differences, it is not possible to extend metadata context
handling to support remoteproc and non remoteproc subsystem use PAS
operations, when Linux operates at EL2.

Add PAS context data structure and initialization helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 36 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0a0c48fca7cf..5a525dbd0a2e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,42 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
+ *				      context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
+ */
+void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				     size_t mem_size)
+{
+	struct qcom_scm_pas_context *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
+	if (!ctx->metadata)
+		return ERR_PTR(-ENOMEM);
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..f574fdf88eaa 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,16 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+};
+
+void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1

