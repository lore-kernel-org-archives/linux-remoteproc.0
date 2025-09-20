Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830625487B
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397327; cv=none; b=kiBaqSejd485RAobafvdrP/wHseDKwqT3y7fekQpVwakSyF+ggEIxXQmBuom7q6x9+lqi95P8z7krLd1H+yi4MF/ej/Qa/6b5TM6+yoybtY7HmMOlWSyF9cfyF2nRadoHC3A1ba4WB+YjtSQw3M3IeeqNLUGD2FPO5+yOtrnp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397327; c=relaxed/simple;
	bh=kbDtLqMnZnoh3q6F/QSYtVvQh8xHtK8oMPDFf2TgxYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwbZf8k39vaRDDGq+pObf3jncHrBZ8HNxzKFllyOQNBINLVGbZqtJJy/BswTJkKg48J1o6HN9akc75TE6T6tYLm843QRh/fQCh8i8YOc6cmr6kULvrJHEGAV4u6/z/+scXbFenu9M7RLCHzvGr0k8+UqSp5HDZ9FiHpSkp3ibmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPVJjvPK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPVJjvPK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJe9FM012440
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykLocDZYUXZ9VeEX3PNr1SzQQUPNL26vUjQg2ocEoJ4=; b=HPVJjvPK6QrJXHhd
	jKDF3csbOWYfPJgSZ6q0qGOmpLVEp3bpglZ/Bco7IoJKnC6d+Nonxm5QM7B8RZAw
	f5YPlUPHbuzGqK3OSTOvTXvcrJzcludhEKKj565VWsADaioT8CHSTxQXdVPLng/K
	NJbEtfTO5X7O+FHsqpKhNT+zc+N3iKCETHB65r1tLBR0U9v/wkaI9QcVmIVPZGmY
	DN7Vq2epDoiDIQKGpwkRUKhnbR7vi8AyYg2q9/SWq7bdJIRoIfcg1/l0fBSBywfa
	ri69Z6m4rKgqDNHY9S6+yqB+Fwm3NtKWC4n+ufEu0FqN2rVnkOxWRrMBAoX6eTC6
	YJUzZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8s2h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3304def7909so3099690a91.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397324; x=1759002124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykLocDZYUXZ9VeEX3PNr1SzQQUPNL26vUjQg2ocEoJ4=;
        b=rKbm8WmB73QGAw2q97DOOsZNMBDfYe4ZSKX/CfngEqy3ng7ubbCbbh4rv183Luf267
         clRbjnBR0ytD7fNQq1M3KK00m3c9puH0nYuTmApvYRGAAV90x99QEIbDf3BhYHFDClmj
         tkbS3Bv/59xaBN8OTcsDeeXweQ1RYri+ZfkqH0u0KkNeA9lB4XrP5KOhaxnPDRQirxvP
         m4D/rF3C6lJ3oxqq7iaWWA3smqLfpQEvrHZaKgSDMKcSR7hpxIr8ITH9YGbNs85ftLzi
         xvrTu5MEIYARsAAQMHgmMe1GwrnceTiIUO83v5PlC05tMvZdupQvaMJqtEqtCy5YfgM/
         UiMg==
X-Forwarded-Encrypted: i=1; AJvYcCXXpRpHaKgVPtOpz3PEbvYJA7oGe3miRtHTBL+8Ds3m8UscBoOcYGST9ZYXEIbuH/zJgmM0KZRJuaWsyiA0vMCW@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPaZnQuKZ2tBiSji2pc2UkyR+XAY8/du3y6+SuVjkYxzRkzT0
	h5rJKJlatPW/IfJxykLLlTFhnHQa38BMptxoPwvM4n2b0QY583GpoU1xBIiK4aqzs7F2plvPyzX
	tjrKZS+uCc1TjKBBYs5FKleSwvu55IdgAFuT35iqevZpS902iYOkSmg0mYfzx1CgBmJXn+SwI
X-Gm-Gg: ASbGncvauvL9g6YhzqKbM2TatY6VBSF4OWHXj4aRqrUF/LnI70eY50Cc1/ca994HzKx
	uHbnA4T0xpvq1yNOkkP326V0GrKXiPnvK1l2L8s2z1p7pMAwYRj31/2v0hclHeL/ydxQcEgPiEH
	9CrelKlEyuafwh87E4bj+HLk5wiqPR9AIUqpFxcCuJqERzaS62KGkLHbUhySPHsPEhZEdthJcUY
	AJpLd6Bke5yf2e/jF984CIbgRISMNkppJhrA3lvmPy9CbWuUV5/JQfp76ABu2J+5F1dZyoYdDuS
	OhaRthIxN2iyymHUCaZY5OBoP0C9cMk6xNdR6UuqvmGGVAnUR1/YZK5wJhYXoWRSq+I=
X-Received: by 2002:a17:90b:3fc4:b0:32e:329d:3064 with SMTP id 98e67ed59e1d1-33097fe4fa2mr8290924a91.9.1758397323611;
        Sat, 20 Sep 2025 12:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO5sUPxrAqmm0MYW8RCNNP/9EhdH0gYwCUJ8PmRKUlxYM5vUp1i+jo+v85+POGyCteueKz9Q==
X-Received: by 2002:a17:90b:3fc4:b0:32e:329d:3064 with SMTP id 98e67ed59e1d1-33097fe4fa2mr8290904a91.9.1758397323050;
        Sat, 20 Sep 2025 12:42:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:03 +0530
Subject: [PATCH v3 05/12] remoteproc: pas: Use PAS context awareness in smc
 and mdt functions
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-5-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=11028;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=kbDtLqMnZnoh3q6F/QSYtVvQh8xHtK8oMPDFf2TgxYQ=;
 b=NRWKPYZtVwXXKRIiU86gBny9PcBCNVgcBQdZNf9sjAM+cE5xKQNbV8qu8VL0ZhZrjzeyWWy0p
 IN3fDeM4YeQCI+OTCjoyBydj4/kV/Fqcahmim6whOVEpi9ve/xoygiV
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cf038c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1JlaEvupAcNU7l7u1ZAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XMdtgrCEXIDYREhWanM4x_Knn4n6z2G3
X-Proofpoint-GUID: XMdtgrCEXIDYREhWanM4x_Knn4n6z2G3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfX7bGEwOlopYp6
 QehPCh8FMxMhG0WfZfKvPFiTyhH05KRFhTmtShwlbENuqxdFIrKh8xqaJidXy2goIsrIOY3ZOAc
 2oWl9ZpOoHB6p6yjjRa66xV4Ls4kLQlt6Amrm7zM8GdhycnHXDJpKYMrWK1FUy5CfdvOblBbOJo
 YaT1hHqswWrIkfib6JEpWyZL8f2Umib+jlSrO3ojHBCeqP0euwbOrLecccptX5yF1ASBjIFr3Ly
 n7vhefiXZrc4Vu+1kpR/wJ0XjmTMZ+34UlDhHonC/qtPaLKlvbcvZDU5lcEwKcv0rkVkEdXO5ff
 1IM1R+AhrumfNNi2EI3ZsKWRgfSGtoeaJbgOvG7iOFRODtWSAuu4+WhIPzsJrsh+R5UC7b4ZTZD
 YDYlrnPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

Since, we have introduced PAS context data structure to better handle
the code when SoC run with Gunyah or in absence. Let's put these
awareness in some of SMC and meta data functions and replace metadata
context as PAS context structure is superset and will help in unifying
remoteproc and non-remoteproc subsystem uses same set of functions for
Secure PAS method.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 32 +++++++++--------
 drivers/remoteproc/qcom_q6v5_pas.c     | 66 +++++++++++++++++++---------------
 drivers/soc/qcom/mdt_loader.c          |  6 ++--
 include/linux/firmware/qcom/qcom_scm.h |  4 +--
 include/linux/soc/qcom/mdt_loader.h    |  5 ++-
 5 files changed, 62 insertions(+), 51 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1c6b4c6f5513..917341308873 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -620,7 +620,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -629,8 +629,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_ctx *ctx)
 {
+	struct qcom_scm_pas_metadata *mdt_ctx;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
@@ -681,10 +682,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 out:
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
-		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
-		ctx->size = size;
+	} else if (ctx && ctx->metadata) {
+		mdt_ctx = ctx->metadata;
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->phys = mdata_phys;
+		mdt_ctx->size = size;
 	}
 
 	return ret ? : res.result[0];
@@ -693,18 +695,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
 {
-	if (!ctx->ptr)
-		return;
+	struct qcom_scm_pas_metadata *mdt_ctx;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	mdt_ctx = ctx->metadata;
+	if (!mdt_ctx->ptr)
+		return;
 
-	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
+	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
+	mdt_ctx->ptr = NULL;
+	mdt_ctx->phys = 0;
+	mdt_ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 55a7da801183..ad87e0334a7d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -115,8 +115,8 @@ struct qcom_pas {
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
-	struct qcom_scm_pas_metadata pas_metadata;
-	struct qcom_scm_pas_metadata dtb_pas_metadata;
+	struct qcom_scm_pas_ctx *pas_ctx;
+	struct qcom_scm_pas_ctx *dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
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
@@ -235,15 +235,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			return ret;
 		}
 
-		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					pas->dtb_pas_id, pas->dtb_mem_phys,
-					&pas->dtb_pas_metadata);
-		if (ret)
-			goto release_dtb_firmware;
-
-		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_mem_region, pas->dtb_mem_phys,
-					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
+					pas->dtb_mem_region, &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -251,9 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
-
-release_dtb_firmware:
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -301,14 +292,8 @@ static int qcom_pas_start(struct rproc *rproc)
 		}
 	}
 
-	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, &pas->pas_metadata);
-	if (ret)
-		goto disable_px_supply;
-
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
-				    pas->mem_region, pas->mem_phys, pas->mem_size,
-				    &pas->mem_reloc);
+	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
+				pas->mem_region, &pas->dtb_mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -328,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -338,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
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
@@ -774,12 +759,33 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->pas_id, pas->mem_phys,
+					     pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->dtb_pas_id,
+						 pas->dtb_mem_phys, pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx)) {
+		ret = PTR_ERR(pas->dtb_pas_ctx);
+		goto destroy_pas_ctx;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
-		goto remove_ssr_sysmon;
+		goto destroy_dtb_pas_ctx;
 
 	return 0;
 
+destroy_dtb_pas_ctx:
+	qcom_scm_pas_ctx_destroy(pas->dtb_pas_ctx);
+
+destroy_pas_ctx:
+	qcom_scm_pas_ctx_destroy(pas->pas_ctx);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -802,6 +808,8 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	qcom_scm_pas_ctx_destroy(pas->dtb_pas_ctx);
+	qcom_scm_pas_ctx_destroy(pas->pas_ctx);
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 2ef079797f05..24da6e49b2ad 100644
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
+		      struct qcom_scm_pas_ctx *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -492,7 +492,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
 	int ret;
 
 	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id,
-				  ctx->mem_phys, ctx->metadata);
+				  ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index e3e9e9e9077f..9ca3218f0948 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -84,8 +84,8 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys
 			    size_t mem_size);
 void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx);
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
+			    struct qcom_scm_pas_ctx *ctx);
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 36b8b331ce5f..ce2346b66af6 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,7 +10,6 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_metadata;
 struct qcom_scm_pas_ctx;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
@@ -18,7 +17,7 @@ struct qcom_scm_pas_ctx;
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
+		      struct qcom_scm_pas_ctx *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -43,7 +42,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 
 static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
+				    struct qcom_scm_pas_ctx *pas_ctx)
 {
 	return -ENODEV;
 }

-- 
2.50.1

