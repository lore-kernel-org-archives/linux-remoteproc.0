Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1005334DB4A
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989347; cv=none; b=qsum16aAeAPyA6tMvINcWkM6gMbQ7hmQXgG8eRMNm0IllSlFj0qRkAT8UkBqICuHjtbwdSXBjbN7tiGXmjVVgRd70cpXMayDoC5CQkbgK6ZWpjIjb+jOW2+xKPHAQwJP1ycQ+u7sU9a/UqKOSCHxL/H3nSF5AJ4OTW7XPr1iUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989347; c=relaxed/simple;
	bh=ZJpp3JWRDZ2GnhkciNneFccjAnU3FfTec7KHfaDs7Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6VpIb4yi5capCwiX3KzNMyolMfL7noYcjlsSoxUGRZp4ERnPQzgYRF9jqQCYQY/R9JsKrIjyRtdb+jRGeYwzCjYNECcFjp0+qVEafDgzat68Ta/9yu/WOzqnG0z4cppCNoa0lvMLUJZVOHJWZgl3wA975a8cSRCYBCiR4+31cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX1ZrzeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDRs3cdh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX1ZrzeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDRs3cdh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL3Nl2502985
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=; b=mX1ZrzeAwTjRfsKB
	7IjMf9+Ynvme+QAGQwlV8Q9OwEDWIW/9qOzZJxQOuInTSui6++aw5QLvNwyCnMtu
	t+PJJggc6bgsxOjYzRXeRSLIzpgQzo5CYNSnHirchv7ZEiv9HAjZ/JQ0lxJtj+7k
	8LcoZm8PaR8lvKnCnQkJyRjDqxefqsdc73SJSCGwbjcP/JlHMUNwiY6jOcdHnmrI
	JJkuZ0Hwgq2iZiipX6HktKH5kChs055bulIk69S8fkTLszUf6SuHeMeYlpHCYP4I
	6wH70fKar8/C5NEluN/ZMnMPQgBvqOGcrsZ3aPOGuhXqwE7/faf3Fnlo++DU08HZ
	pqLXpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa9ppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0c495fc7aso54925165ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989344; x=1766594144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=;
        b=IDRs3cdh/r+4Q6W+Vt1S+jNbRSKZl2uFPKKVv4Alo/a6GJkmjW8K9JdSjg5aGJHBN7
         4X5VoYFTB8NG6SiNLwNvOXzwlUl2g4iJgKQfKjHO05c37V60B6Hag7c0DjbdXrndKoPi
         vMi/HgPf7reDCAUwxCHr5d233svYTKyro8ytnkPRBOaabVf6UFaLDvKz4HdV6qHHTAK/
         Gb6OlSLNB26OtyUxohrHF+OqCvuYyoPd9TQLvfw5/dxbu1DyD0+p6CsVLQ2LIb4DBpaj
         OH4F1EnuHZ/1RjZdhcb/suVNPZjPE2AtSDlTdKR2L6EJaqp4r4GYDoshhiIpEMeV4yVP
         3YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989344; x=1766594144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+OM//gLCwtklbAUofXvGKyOMQPiApxnK1IIT6gaceE=;
        b=tnleNYsDYlpO0edn1WjXNSIe6UeqKhHPCRzXUBSFXs8LwzAmYYz4VNm93r+aBk9F6f
         jfi4AOMZVBXGrslPPoWgWRp/wUcTTgPzlj3Ieo8DAJrklhcASWxzq8KXxGITZs3okMT4
         0oP5vH02QIZviAWchIbIKhjs4GhYz/SahqjzarYnv7z4QsEAOkQzqVSf5r+50oCah9QL
         bkfKNF/JaCGXklbSEWTEdTNOHrxmK3CV3EZj9C9jHXtGa+vmavAQtTM0KsQF6+rsyHTo
         r+jEoDzGbepD9R34MqWCYphzsptezfqLd4kgMSslxo2LJqsjrJIdxw/OcBw+xX4BG15P
         cNgg==
X-Forwarded-Encrypted: i=1; AJvYcCUqHx5F6whbxP4KAPrtGqLBJRE8bjTpSPRC+O2LvbmYsbZZAG5W9fK5LzQLvk0PWvQ3AQXWMRna9h9Q2s5sOFPA@vger.kernel.org
X-Gm-Message-State: AOJu0YxEudGhDokDyzr0x98pd0Lz7TvZ/WZebHh2usiv5PDXr1SW/LMR
	8VaKy6XJMQ6UGGGZqnGnd0rKbNPQYnAG0Vr/ZML/87QMDXsYCcfzJ1JJa3oEGK+k/fo7Nfn0ihe
	zWZnUYAd3yElab8Pzba04rWwYybVBDLN0lTnX/oOYphu4psiN7uiylPM02KllwHJUP4+WU6BD
X-Gm-Gg: AY/fxX5e0oKiCgil47Hq4FCVLsjRyuLxw8vMDubg/bflBEBRC1sincce4GemJslk3rP
	Sj0ubuFBJjE+JCIoESYWN+8W6BwTzd5MeTwLhkVTPR+TrnkZgggUVECe0HTLk97rFi1eTEZQ5Cb
	L/ZmQFKaWSym5gDN947r81bJubrnp8IbN7yTXKFX8oOSCkHhSxWtzPm4yrJchr1mjcEnVs6VDZD
	HWYlNInwtc35syBrc+x+VKWDCW9wEbMf6weih30d+LYThukKvpkuySnpjBP0ql42ks/VcgMuJTz
	mXIpnxtfDnMJxvcroAZnl245gZsiGdtmwiWelDXDRC5epyE5orGdKiVwiLp8A0rQ3SEZhBs8vk4
	vEJC57Nwh5/T4PhEfKps9m38SC3aesWBIJPOY
X-Received: by 2002:a17:902:da8c:b0:2a0:bd93:4dbf with SMTP id d9443c01a7336-2a0bda2946cmr136309975ad.13.1765989344207;
        Wed, 17 Dec 2025 08:35:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxk8EC2iuBNKVxQi6FD2QZfoSwG++mxObmlHXqMkY+kzfmt2HFyK6oOK+NSSC19kzQ4oZPmA==
X-Received: by 2002:a17:902:da8c:b0:2a0:bd93:4dbf with SMTP id d9443c01a7336-2a0bda2946cmr136309675ad.13.1765989343577;
        Wed, 17 Dec 2025 08:35:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:43 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:46 +0530
Subject: [PATCH v9 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-10-ab7ac03e0ff1@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=2509;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZJpp3JWRDZ2GnhkciNneFccjAnU3FfTec7KHfaDs7Ss=;
 b=UHye5xh8LIVlYeAJ0tlM5lFW90FxijLZBwYiUBeuwTCEld1f9pnWwQGlVafxE2HEPF0caPqZC
 aZbBWgM6h0XA/W1Y1C5xwPwQcAU/wytk8AG+ahm9HcYvAIOpFSJtOB/
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: 3hl2BndyJ5pprGZ1vtB_ZjCIB0C2LFcN
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942dbe1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08WIqK_J-xaQODWVIAIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX3ojQLpGlIg/Z
 1zSeovq6yItOL0X2OXmPgF/kkDumxVwm8dQvDqUC6Xw+bGK+r17YO2DO6zl2jLerPew3ZyvRQsn
 PgXHwu3Immwm4JR/kzjBj57kmN1qCx54triUGar6nU1zGWPtCB1pBKlJQtdXRxr7aKnyyOTAYJj
 OfE0XcnQxjekzpOnhp1GLEmQPqMGR2ObSPxuM1JV919IbI57T7OoAkq3o2KXw5s+t6uY8f2oQtF
 XlJGDIwMOxzGXZWeUbCY8rJ/HqnLfIKjuH2NXJ/616vBmQK81taMOuvGBYZ/EfI2uFvoxhEewsL
 XIOGrd9p3o0wmPFdgrYWqdwk2cK+czQNUlQriQ2spi5ZbsV84ouMqtGEmOV3XSteZzeU4oZexSk
 ejSrIZgOwpFpmWJJS1lPb21gb7lOvw==
X-Proofpoint-GUID: 3hl2BndyJ5pprGZ1vtB_ZjCIB0C2LFcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170131

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge both for metadata (before
calling qcom_scm_pas_init_image()) and for remoteproc memory (before
calling qcom_scm_pas_auth_and_reset()). We have taken care the things
required for qcom_scm_pas_auth_and_reset(). Lets put these awareness
of above conditions into qcom_scm_pas_init_image() and
qcom_scm_pas_metadata_release().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bc3b8dc7d3e4..4ce892d8fb25 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -623,6 +623,30 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	if (ret < 0)
+		qcom_tzmem_free(mdata_buf);
+	else
+		ctx->ptr = mdata_buf;
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -648,6 +672,9 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->use_tzmem)
+		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -689,7 +716,10 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->use_tzmem)
+		qcom_tzmem_free(ctx->ptr);
+	else
+		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 }

-- 
2.50.1

