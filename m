Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69847DD4E
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576410; cv=none; b=qPCuzGZpXqQ0s11qrem8gV8XV6/bD4Oh1D9LMdjzzPybhjdeLh+0IIkw1qqiPrPY4q/teWIxd2I+UlwFXnH0AVlZkUoFnVwYb/GJYRLRMPqRM5VDf+6t3UE6S/PF8CgL5TaYPWwt0wqVeHuN+X6zGv9J0OXo1aZAZhwXKWOS2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576410; c=relaxed/simple;
	bh=eLZPPWBv7NLMx7LIGFjCzSTWf/lVoUk4bi+hIEigfWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLT/Zo5uYXQHN0iL2bo9BAKrpgNPFLOqu2gRqWP6xQg8KSmEHJeYeCLqLxufBLkTOiahrmS3FGTsijmzehN7z5so8NvNH58qCV5vJAOIgHR7dglqvpliQ5R5bjygQT43afXJjz5aDOnk0jkjHHU4dy96ZWwT9fr63BpYlPZazFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAHkrXW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NI6VduDo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAHkrXW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NI6VduDo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UITrIt563955
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/uuZUqN58mn
	BcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=; b=aAHkrXW8vhvWqNhMOmlJp5+igy+
	vXJp7t4HmcEIJcAgofxXSUeCMKgc82unXaaDcFU0/YcfJrAAobCXNvzF0glA+aWb
	FficgF6XxPbp5UvwCvShrbnAWwg/wTIKWSXEWN9MajFA53yvvDxKopQP19GrK40P
	y+eBbbFw89IEJyZSVqwiLHaKEyHs75NlVUUTff8zRfA60JYMilAvI/HdCpbSScuJ
	Nl/5TxVBmcJPuy1rjdHlznrvRreB8RqL8EeKVf3sgtldw2kGndL/ZPn+f3yFJBfc
	39d51aOHTo1UcveVBrsP1em4zZ2E254kh3OAzM8bT7FseZQF94MzQ5RX/cA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7wussjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso1014318b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576406; x=1778181206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uuZUqN58mnBcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=;
        b=NI6VduDo5Pi8AI6b97sVbe0JsE4dz5KBMKgsgQc6OmpiOzaiqk1gAa3EVDg7v5TBJN
         CzAOcxdCZr58hxWCPicVHeUaUmtdK3qafKmmTvilwacl1SQg1Waz9t1Ob0mZK1KbOadt
         1ZqB7ldOW8IY0frpW4pYpKvEQnrhG71I9J/vI3mJkaw8bUIlB6uJG4OFx9Nb6iLYlCds
         rLeUrfAzJV3PtacWSsHmCPZpetsF1fM525tQdH7X4LXVwiHsjU8nN6Wez3xxMhqQ1m70
         PsBqhz+zySBeCrn9sJSkAr82N8ore4Os/0EpnM7iiKP/c+0RExO/UVtPKaQ5QEW2HC5h
         3oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576406; x=1778181206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uuZUqN58mnBcEF3QT5HgBeQvhVlZUW+LLbfOlfhT3g=;
        b=UscwIhd+h1MvNCf4FjC3cKN/nTsfQo6Nao7qpqTK0vP9miuNVNzgv5GdH53mIbJXvM
         LrpW9Wh+fa9Sj/oxBKNnK3IiM+mZC90+3y3k5Vgb+BtRBvS2A4mUaVgykY/NW9R0eMiz
         v8vujUdqAdfl7i6wynIA/cRR4RzN94ExWTAAqFLsvpgxelIIvEfI7gtBLQfVi4tC1U1R
         uScHd1ajE/lvU+ypaszeHvbJcM6iIbGLOxx1XINYSXDiWqZxhXhFHm1OhnIVt3tAgPvR
         6+dNpQmbiqWDAdbPn+2M0rHQVYwTgJSyEK2KTjsm5BCnrec8rkDNvoBMcnMERiRzZchq
         /oow==
X-Forwarded-Encrypted: i=1; AFNElJ/HdE2+wDxLAxDYgzKWTWQVWgXzr4yKU52ExoGFN64e9XkjqgAGdUOF+SgU3pd1ltgl4H9x5J7OXxHqjy8Mvfo5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CDSOapKsYTK+8fgZSIRfe6ym1bcZ6AMfOHSAQ+wG0In7yQC+
	ZFVsZj7ZawC4BknkKImiYPLgWy+bFO/KyozQhFXLD/h/XdeLCIY5aItIQObKlU2Ff2dj5xBKRLA
	o3SJKi0f6/Sjtf0HQK3CAIeDJ9eAqKtvDYEvPseMHfP6okCGx8fNJgUl26DhMMsySnp6GaIbE
X-Gm-Gg: AeBDiet8atxx01Dxj2E6XROwBFVBf5C3gfaAFxLQDeD3cTYjwfXo+avnD3YeprlXlBS
	pdkYdoJF6CnKbVxaMJJvsDqg948us1kKohJY9g6fZtJO8kiAHzyisht+XFCOOkyTyt9/RGxbKpa
	lqnugptptiFqezHmlF0BDF048n8zqafJzjWCsjFr/BhVE6IaX4awChajyimQY/6D8qL7WFXfRV5
	WpBMs/d95P6QqVy5a85XTIkv3pDtAq4dNg181u/c9WjUFQ/hIoWoiDqgc6Q+RqjJ7K7x8GUNoML
	h+ndbFzex09Aab+pF3jYmjT7yY/jQI/GBkqhnWJvQ/s06if2oU2vHvVoq75+wnR/qkntmluAwgC
	77GVM6ju8uczREU4bCzcNDiG1B5DfT0AT/tf1Bbrqpw/d5QA/vkIF50OCQ4w=
X-Received: by 2002:a05:6a00:3d4a:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-834fdb84e79mr5073970b3a.16.1777576406140;
        Thu, 30 Apr 2026 12:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4a:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-834fdb84e79mr5073931b3a.16.1777576405495;
        Thu, 30 Apr 2026 12:13:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
Date: Fri,  1 May 2026 00:42:48 +0530
Message-ID: <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX4mwaxFNUvziL
 KX9dYFn4BMKF8CJ7A1Dto6YUcHl0hP2jYExN1KFgadJxkdeez2LsFr7FKBq21O4G4gszysriwA1
 1Y6ljYih8KoRAvUPR6CY6D12tftRMikL6ox1KVWiZxRFvIJ90ibaDoJqaQbWLWJr0OYZWVqfZTy
 F6kpulbug752kfd5r6kp7WCPJI5koGEwQAQtf2emGhxzc5nw3c/lp44ATEj7gAsOLfO2kWusGSv
 Sec+WD1vuCHkoH9VpSS9EOwZUx1mrjhOUp9FJlrE3HaQpZSzpy00Agu1HbfxAN8ktQj2uwkhBg5
 AEaYRpxSY5wmhHX0cWANseYufm+avV8rLs7s/RBJ5ibB9PUOYMml2+dvgG+9sy2kn1+Bpuc+I2G
 RshGzOScp/RcLkfnMYbfgVP3LOoCSpkIhc6WUInUBAzMT0Hprgcb6lIRekbfssEDrNSqDuV45vE
 d9Xci5Fni7whjZ7gfKg==
X-Proofpoint-ORIG-GUID: FFIeojy2o3poiX0uJxOaN1B4UaenhhmA
X-Proofpoint-GUID: FFIeojy2o3poiX0uJxOaN1B4UaenhhmA
X-Authority-Analysis: v=2.4 cv=GMk41ONK c=1 sm=1 tr=0 ts=69f3a9d7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ctNy7iMIxOgxZ4Gl-TwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300199

The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
return void __iomem *. However, the mem_region (and dtb_mem_region)
fields in the respective driver structs were declared as plain void *,
causing sparse to flag address space mismatches:

qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_adsp.c:639:26:    expected void *mem_region
qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
qcom_q6v5_pas.c:141:45:    got void *
qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:637:25:    expected void *mem_region
qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
qcom_wcnss.c:540:27:    expected void *mem_region
qcom_wcnss.c:540:27:    got void [noderef] __iomem *

Fix this by annotating the struct fields with __iomem to correctly
reflect the address space of the underlying mapping.

These regions are subsequently passed to qcom_mdt_load(),
qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
void * and use plain memcpy()/memset() internally to write firmware
segments into the region. This is intentional and safe: the mappings
are write-combining (WC), which on arm64 permits bulk CPU stores
without requiring the memcpy_toio()/memset_io() accessors. Changing
the MDT loader API to accept void __iomem * would be a more invasive
change and would affect callers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c |  6 +++---
 drivers/remoteproc/qcom_q6v5_pas.c  | 10 +++++-----
 drivers/remoteproc/qcom_wcnss.c     |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..d2b50af6d748 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -105,7 +105,7 @@ struct qcom_adsp {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 	bool has_iommu;
 
@@ -318,7 +318,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
-				    adsp->mem_region, adsp->mem_phys,
+				    (__force void *)adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
 		return ret;
@@ -491,7 +491,7 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iom
 	if (offset < 0 || offset + len > adsp->mem_size)
 		return NULL;
 
-	return adsp->mem_region + offset;
+	return (__force void *)adsp->mem_region + offset;
 }
 
 static int adsp_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..45be8c5049e1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,8 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
-	void *mem_region;
-	void *dtb_mem_region;
+	void __iomem *mem_region;
+	void __iomem *dtb_mem_region;
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
@@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
+					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
@@ -319,7 +319,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				pas->mem_region, &pas->mem_reloc);
+				(__force void *)pas->mem_region, &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -445,7 +445,7 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	if (is_iomem)
 		*is_iomem = true;
 
-	return pas->mem_region + offset;
+	return (__force void *)pas->mem_region + offset;
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 4add9037dbd5..da68bc1903be 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -94,7 +94,7 @@ struct qcom_wcnss {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 
 	struct qcom_rproc_subdev smd_subdev;
@@ -158,7 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    wcnss->mem_region, wcnss->mem_phys,
+			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
 			    wcnss->mem_size, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
@@ -327,7 +327,7 @@ static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_io
 	if (offset < 0 || offset + len > wcnss->mem_size)
 		return NULL;
 
-	return wcnss->mem_region + offset;
+	return (__force void *)wcnss->mem_region + offset;
 }
 
 static const struct rproc_ops wcnss_ops = {
-- 
2.53.0

