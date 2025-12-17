Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891383624D9
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989325; cv=none; b=YNGBi8ApKl1Ub9+UAGTneEvAAiyP0NHIg1EbOaBabGKwCp5GuJ4fTSte7yDGmcgnLEM3nL/a1zN5fB1+oPpfwdCz92oHAe0iuClOxFF2NbcP1nwalSlAfsRw98YgS4IM3Q8DpFeP2KmwpcUVjV/j0xKPTSA6hRAkluyS4T6C5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989325; c=relaxed/simple;
	bh=MTke/QM0PFjN8QJGwMVznBklB/oOZJSHHEy6N6Uhs2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvOdIobOzsVRftV2p8uxtIgHVhZYAIad2I4UQdkoQ0BOeK/4yQHqMhdHyRi+r6dWcn3s/+HnsCxdwZpFlo4/c7nrZuu/wJ6zF9b2sxKGyB4UUPvVM3elJeVGQ74WXUnfpVr1lSQuCQy5ntJq2T/S/2lUWSjrb6C5NjlnSz2He54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3dAjfRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsDtlY/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3dAjfRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsDtlY/N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKmpK3203709
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=; b=Y3dAjfRadBO7r21m
	c6UXwUoqGL4OpqGvN3b/bF0Iimc7Gf0BdTmSqE2nwG5PSw8bEgwU4QM8YFbgStUS
	WKlsh8+sDln1EbIapbcLOslXZt7WeTgCajavTLBbwMqQq36yb7770nFwybqGpiG7
	DCPBYhYBH6+6mVznuyPybLxmEqbQpDuzG+6dJB3r1yTGIaikBcUnNe3ftsnubuER
	+IG6iVFF7iyyTEW0htiWSDgabaSBjLt5kHQ5EWO7ktHrFAHV5ZkdE8a0qaP0iFVH
	ANrb1wiWZsdsIDJXG8tj2n2sTVYYs9H1n7wdTDyKcG46wUiXSE3eIP2RojZQJ/FE
	pIuNwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39jtcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so63707015ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989320; x=1766594120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=;
        b=AsDtlY/NgutsUy/9gogioMyQ/yHx/Vi4fR/748SKzJbSRLMNLpZze+UfB/Js8vX++M
         yM7nUIay6LDAsc9rAS0K/aoWe6YR65fARTpRC+MGjxxkttmlzn56i08wevJjDnfxExD/
         UjpDS5WHx+nvhLsfORxryyBA0q6YlOj0myNgRLwWGASqFu4lGlsqtRdiiDWVEklHeeX0
         qTSBGFrcYLVttLAqeKxR4Luj7cVGAJnv2BQDETsT7BXNJDe940rzM1h3qM+buJrSb5Ni
         UeR72ej+7/ktyUC7QWmv8r4SpbY/+QIZBWp8jRK+nYe0dEWXZfDbPVzzEwdoqmoj8wgn
         cf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989320; x=1766594120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAAYF+70CB9eB3ACXAKpYiBOB9FD0mSsanrWwDwQLqE=;
        b=Bpu9xOWwvV4/igrlD5kER6OXr73IHQsZbciFFjQLVEAiFaloARGkry5bnPyb8ajBR1
         RD++4XyZPHWVJnDyUPxhppf8kvNLP6ECkBfNMkyGEHe2bC/BSpVlNZCwDQvu1BVtsDX2
         T6ZQoQImJukBhtknNijjaFbWcFt9ZarnJqbx6p6C6BpE4obLK5RMz2VSUnAPbz+G4Vj9
         /LCW+9HGdPeDJglrh6rTkcFciYNv4KOesMg2OOiUQT1ev+Wkyhy4wlQod2PcWbbvdGn1
         JDfxc/+DTIAQfGJyMYMVdwTKO6Tkms/Fu0kccIrO+918u6W69dAOdtQBLKEDaZL0sudj
         45aA==
X-Forwarded-Encrypted: i=1; AJvYcCVKDauA0yAichDBjA0qvv8SA0NdArqTl/TeoQFkv8ZvwkD9Ll627eTX7FYhsqNFZrQoMFW6X6py3Xz8X1WsR/jO@vger.kernel.org
X-Gm-Message-State: AOJu0YzcK44mBxeh6ejZfLLENeQ9CLUKJ262DIVsa8Ix9K7OyvGMoGkS
	QlK7vEDzmQ9YvOn1osRTXBAqtFtXm/BgsU1YpKMyvwFs6zkh4rKjRtIkyXFPlVkcM8TmzA/8WjK
	O0L6kAPkk63oTb38+twcwCteWoCTpJE1NXtmWGRR72s/1Z+N56RxT0GETD/bFX3nDOinbVJVK
X-Gm-Gg: AY/fxX6m4uTzv9tQ8upSw3hXmnjak6Ww9d4y0n3yXy2KZFsqiT7Jy5Aj0QYMgOYCO3t
	hQXCN0En/3y9/attLISzoTBxO0589JvP42dsWAM/cIYD4NYe+wG3c5XrNc6URuIOXXGbGCk0p9V
	LyTB+6zfck+BLOz45HYZPVtZCzeh49E4h37b+MERyX5y0kIqW7r3pinl7c1cQkCQjPk3HfXbja7
	UJyEm0ieP47RdrsVO1QHZKsy5xRrMk4ir4jC8OOVs4bcbpPnxGsWGkEPVpFfXn14bSY9ihvUh7I
	pod8SNQTeRuGZ5WrR06U7+POkxfGAS6BBI/4qLxaInjFRa0A9fP8TGrcr5rQZ5gzlwFt18FWJNL
	WEI2wo3BBm/5/Bkwi5ziVX4MrmfghcqT3xxm2
X-Received: by 2002:a17:902:e5cb:b0:296:2b7a:90cd with SMTP id d9443c01a7336-29f2404b710mr169876525ad.32.1765989320115;
        Wed, 17 Dec 2025 08:35:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwOv9nHjP6e4rUF3j6KYca1AcLzLfSlGw7UOAw1YHneczpAa76mOInSGYfud6yFOrzEM7JDw==
X-Received: by 2002:a17:902:e5cb:b0:296:2b7a:90cd with SMTP id d9443c01a7336-29f2404b710mr169876255ad.32.1765989319461;
        Wed, 17 Dec 2025 08:35:19 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:19 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:40 +0530
Subject: [PATCH v9 04/14] firmware: qcom_scm: Introduce PAS context
 allocator helper function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-4-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=4036;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=MTke/QM0PFjN8QJGwMVznBklB/oOZJSHHEy6N6Uhs2I=;
 b=8qm9J440ImkkEOrX9lhBxIjnEf8H3iYB7vQriZ/Zw7s7iQ9LpFfqX3Q4Pp2Q0i8Y8D19CPWTj
 frbqu0b1cYSCXMcjCT55EsnHZZeaxy9vRY+TmHbVM8jM0pi0FxcfPRK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX0ov++uInglYL
 gJ9hKcyA6AKsdMKGZh9OrjR/OzYRzenq91rT3bYk2pVTtl4WIIml2Srk2Puy+HlR+own+Y7P2tn
 zpC2o3hPPqnXx0kq871Gx7YN2IZQHDTyEye98kKZyrsDER8JLpIpRRJLYTQ3t1AKnZKiqRR7TIT
 HsGnxlEVz8VIQR+s/AJwhIRfg9U/yo1OszLsFoHNaGKeXMOJ4NnLSZp3Ks/ZU/h4+gyCTHplWj3
 xgXq+5ks9yygGiYgTEGVW24UaTDLavxXFCpCNrSCdF0xBgJZ+vl54g4Z9NtQFl2JudiGHrgvw6O
 Wi7j+JqtS5YQE3JCbqWRv/RM0wzM8c3C5TFMsRf3HtDhBxnaFfyGP7WAIWJv1cgy0vhfg4T8/2i
 Hw6P48TPEQJzin6Fg3TP9gue+lk7AA==
X-Proofpoint-ORIG-GUID: 7QPlh0Dx4m6EPKa-dfbjz-c8v3q8co3z
X-Proofpoint-GUID: 7QPlh0Dx4m6EPKa-dfbjz-c8v3q8co3z
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=6942dbc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

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

Add PAS context data structure allocator helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1e1057638e98..5162c02f5f88 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,40 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
+ *				       context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Returns: The new PAS context, or ERR_PTR() on failure.
+ */
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size)
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
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..5045f8fe876d 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,20 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *ptr;
+	dma_addr_t phys;
+	ssize_t size;
+};
+
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1

