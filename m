Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA3346E60
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722908; cv=none; b=APnuN0+m1DOyMd6e+olMggA3Jf8/dDdmBCfhGJrX/Sw9SDp2p/8GOaSOIJisHXCrRcp4waPPOEGE9YJZMUQlFK5a1U3eoqi2QMGKNvW8G+/aeKDhFRQaRaK7uYavxw/dgD6hN0zTIRsVdIPWLh2+HT4tDC88vk4Jlxd/mTfN9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722908; c=relaxed/simple;
	bh=aMItD6Cdfz2tfyrkelFjtbde9k9QFcsKS11a8RLC6jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmRDASCbx9a9h0IBFrIZ3bVbEUy2S0Qj9qDVhVER7UnDtchpNjBG94nJEEQkBzP6oIZq9/mQzsaSSXJ1IpbaG9MSLDHlV1N+N5KIWwnY3AskDqGYQHzTALTllYloEC516YjYADSEqrYiS/20QRT0Igtcihxrvwef4V6goj5X1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGhX9Byn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9yrrEx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGhX9Byn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9yrrEx+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6ffnJ1989368
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2h39R0SiBLsaVDxDlo4kG0nrAdErn9QL2vsrFBoSHg=; b=aGhX9BynrLiDgJBU
	p6HdrUuBUNVq8Ovc6MfFjqg+T0RQ/KiS4UX5eoPPggLQUUY8BN2X8Brz8XuZ6N/L
	MJewwZkbR7fY7hRJ/nu6jfIOJ+rhAzr0TEr9GQ5wGOzzHzRznhYWqRDSOZkZc/OE
	XeGIR3jiYkViplmZ02rG8DPgq5icTN/mMxbXevtv/sveviOPSKj5MjIeyYsdYIk5
	6g5KDcus0U+6MSqip8QP4TbIPUlhgM8kQthQ0ndtocngsGq/oOg+HUAcsokN1fvZ
	J11R8NmCi2FeSdQBWdG3NyXNsLNmNtJ2IAxhLR5GejK1WqQ1cKjhthQ4KX2I6nT2
	Vtd54w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj1vac5pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so3288131a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722904; x=1764327704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2h39R0SiBLsaVDxDlo4kG0nrAdErn9QL2vsrFBoSHg=;
        b=J9yrrEx+I4nGO2+j/16vdWxcx/6L7YiXiA/DMS0fFCQmH8AdrA4Sh1hkjLhpyw5FwG
         hq986z09sQiEZIG0BJTtasLrcnG2LwoGuM6wNTDO/KoUJNm1rY/hZ+p7rNmd7w8nkALP
         Lm/IZIoZPGm9Q0W68fH5EFw8PsCGy7XYt+zjoMU4TihEjzcrQZt+KpiuohO4EJsEVv1h
         EQaIhbRyjoC6gO84EEd9/t2r+P3MN2p+N8NuwaYHWQ5nm4QAeydTvGKeABoGtqEg9b/D
         2Bp4t6cMjoA+PV8wgK36bC7QMIBwNQRhNzKONG7Ufo58ezU7pr5rpb57sZGKwEfwKOna
         OiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722904; x=1764327704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2h39R0SiBLsaVDxDlo4kG0nrAdErn9QL2vsrFBoSHg=;
        b=LnqzKfLUjqXlOPI6+8WTLlEScmlJ6hKsYAqO93M2TmFMb7wsGtdfjOT7P6tmHGZawq
         JCootwjp+Phsr0/jjfk00uLs/ygAWPzbT76vALPsOh5skaLUdZlQHwX8W8lOVk/3gvn+
         1qf+Eu0t1CZfUlwLYhykLEFaaHWERRL77n8KNHyjWEjZaddATY4dQqKpRn8TLGWzbhom
         +A4q9EHCZ8FGLhD9F5MLCuFN65hcXwY7xXVC2b+9CVpJ8MnAaPCjE20vTSXFMbrUKWTm
         WPTFN7vykRGRO5cXzYOwfoHsQD01etH20Lo4piFmoOSaQ/GM8E5KcpFZthJApckA0+mS
         Etog==
X-Forwarded-Encrypted: i=1; AJvYcCXiGegZLaovNq3G+ZTLGglsd8Y6eY1Emh32s4Jkb331lEeWyYr23tSZOZHwCu1vAGkFASWXT8pHyhjt+eOWRuWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZU0jybituPvouwSlIWJ5f+K2Ag03oZS6TCYODTG3HnBmlOK3
	/tDm2GiSFI0QTZLh3qSm36OBCFTcFgn1F9kvV0aghBIlo067DQLDRzdl5zUX4jhrDkcrmAPIwUT
	6F5iwbDbvo0Hjm7EDlZgqxRWPrOE/T9N2Iw92iRJ/RNJSLfgcMV62Em1qRyl8vc7EZRvR/Dsd
X-Gm-Gg: ASbGncu13nwW1wnlnsyXFv14RPcw2yyqfT9Nt+9iiukbggJFPp1M6ukuf4B9LK1LwLN
	gN6h/51v8uliC9yYwVucwEEvDhWUJQhXzec8qwdrGdrRitGTJ+c0jJcp+NB1r8cSDoD08525W81
	2ZwR6WleTYiaci2e6me+JpW0+Yz038hSlPCZhlexAAYprYA/uaYqNhkNh8e+IWUN3s8SVsQpd+4
	O3XQwD0imHHLgQDG75qaG3YkOXaNRbTbXN4VzqPeEJjiMnmQ08oPccmsKNM80O7jztjT+yIkFXy
	ppL1+bhIQc2qnp6o5LG0HApvwhhNOZZr856K6S3Lo9MNMSRvQcZSHWrAn8qOj42JDk1CB3WX+en
	pM0KPNPMtRfjQXl8H3denJabqg82Pamaljpg2
X-Received: by 2002:a17:90b:48c4:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-34733f163c7mr2555938a91.19.1763722903849;
        Fri, 21 Nov 2025 03:01:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbb9KF8t2cBkVhvwZ02kTI3tg1SXHxArvV+zbHyCwWFdbkeHj/3azaKyej9bg97ZTH1Q5xZw==
X-Received: by 2002:a17:90b:48c4:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-34733f163c7mr2555864a91.19.1763722903026;
        Fri, 21 Nov 2025 03:01:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:42 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:07 +0530
Subject: [PATCH v8 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-5-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=8840;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=aMItD6Cdfz2tfyrkelFjtbde9k9QFcsKS11a8RLC6jc=;
 b=/s2vfQH5CY1i6iCzOwFOwZA0Fro3yXchRe26j37z8KXEQROLOJeYgAth5Wml1qz+ZI3NXIZ1x
 senywxbgX09B+UGZiQ/wqdzw2rYvu32UAFqyrB5VnlWI+aigXjk/uNw
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX2GYpPj4O8v5y
 +8cMK/rpJHhp9tanuEfYEkoiyQ8RFM5tsFLJequFFPsIEEQuWEN8AJnziuK0hbGCI4uG6IZDxHZ
 DWAlESXL2s5XojCACkQzhIq9tTdtNczignanjbSd5Krp1hgILLG56vUD9JSBuc8vTMukBtOfbOR
 wFXrJ/ljoAVMfQiNz/FrAUjGKutJ72UFo3naC8SyHLrfQ8vmbsD9gagf0p2cVBMqYupLnjQbI0r
 XYSYErQZNH6Od/L0+vzDVKCVaKyy4wEsfoEACP37o7BjyRbW2Pb4iMpY5bQr2NFsMAdyqO3kyga
 5lzQvM4WT2YS2XMGAO9S5MYqm3YyKKxT49892zTP/Ox2NOi8eTuy70Qe6Ajyy7l5r7XtES9BtLV
 PnccUN3x2sNk1ZSnnqVjuNq5UL7e6g==
X-Authority-Analysis: v=2.4 cv=Vpwuwu2n c=1 sm=1 tr=0 ts=69204699 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FPhKjH8jRcijH9SIsZwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Togq5BdLHQp0AysBExOvpHPKW-XTJAAB
X-Proofpoint-GUID: Togq5BdLHQp0AysBExOvpHPKW-XTJAAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

As a superset of the existing metadata context, the PAS context
structure enables both remoteproc and non-remoteproc subsystems to
better support scenarios where the SoC runs with or without the Gunyah
hypervisor. To reflect this, relevant SCM and metadata functions are
updated to incorporate PAS context awareness and remove metadata context
data structure completely.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       |  8 +++----
 drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_scm.h | 10 ++-------
 include/linux/soc/qcom/mdt_loader.h    |  6 +++---
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e9e9d03ea36a..5fa974683ee0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -601,7 +601,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -610,7 +610,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_context *ctx)
 {
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
@@ -674,9 +674,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 {
 	if (!ctx->ptr)
 		return;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..729e7b9bc183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,8 +117,8 @@ struct qcom_pas {
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
-	struct qcom_scm_pas_metadata pas_metadata;
-	struct qcom_scm_pas_metadata dtb_pas_metadata;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct qcom_scm_pas_context *dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
 					pas->dtb_pas_id, pas->dtb_mem_phys,
-					&pas->dtb_pas_metadata);
+					pas->dtb_pas_ctx);
 		if (ret)
 			goto release_dtb_firmware;
 
@@ -255,7 +255,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 release_dtb_firmware:
 	release_firmware(pas->dtb_firmware);
@@ -306,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, &pas->pas_metadata);
+				pas->mem_phys, pas->pas_ctx);
 	if (ret)
 		goto disable_px_supply;
 
@@ -332,9 +332,9 @@ static int qcom_pas_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -342,9 +342,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -779,6 +779,22 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->pas_id,
+						      pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
+							  pas->dtb_mem_phys,
+							  pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx)) {
+		ret = PTR_ERR(pas->dtb_pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c239107cb930..b125140100db 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  * @fw_name:	name of the firmware, for construction of segment file names
  * @pas_id:	PAS identifier
  * @mem_phys:	physical address of allocated memory region
- * @ctx:	PAS metadata context, to be released by caller
+ * @ctx:	PAS context, ctx->metadata to be released by caller
  *
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *ctx)
+		      struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 4a57fa676513..b10b1aeb32c6 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -66,12 +66,6 @@ int qcom_scm_set_warm_boot_addr(void *entry);
 void qcom_scm_cpu_power_down(u32 flags);
 int qcom_scm_set_remote_state(u32 state, u32 id);
 
-struct qcom_scm_pas_metadata {
-	void *ptr;
-	dma_addr_t phys;
-	ssize_t size;
-};
-
 struct qcom_scm_pas_context {
 	struct device *dev;
 	u32 pas_id;
@@ -87,8 +81,8 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
 							    phys_addr_t mem_phys,
 							    size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx);
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
+			    struct qcom_scm_pas_context *ctx);
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
 int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 8ea8230579a2..07c278841816 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,14 +10,14 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
+		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -39,7 +39,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 
 static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
+				    struct qcom_scm_pas_context *pas_ctx)
 {
 	return -ENODEV;
 }

-- 
2.50.1

