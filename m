Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579C244688
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552613; cv=none; b=mWhEFLdkXP+bo+zPCqb+PpzIogUpReyJ9EIg3RXlqZNuykg/kCbA4kfXA1D6FDavI4xp9o7BVg6i9pmEn8/dwXz7ZN+7YicxpqU3CJ3eL1nmu2d5Y57vygSh4OPZk3oyVykcZWbde/eFuOgBL/ZPJJPMu7YiiqQohRhOeKCu3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552613; c=relaxed/simple;
	bh=A3O1xl8RUBsoa7LYTvI0IwWA+Bo0PVRRbpnvD214+oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqTXlWDMTesxMei0FvcnlXiYjzNXRUsyNDVuvqRYMXmfTSVS9xuGFzUF4/9Kh53XjGgsi2u9qdeIjRBM211ihn51UCXRQEnoydQlioSbeE0nSBF3+koSDw3I4Io1eV1qSE6aoXEE2LNiEoSVDzTA09gUQOTai6Xr+suq44+IK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ky4Im7bc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ky4Im7bc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5776eaR4017733
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 07:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WT+CIeVJn2Q
	FhT2o5F/6uWjOiW3WFLRnB3CG6MAoQBs=; b=Ky4Im7bcAHZKRPWHasfRsg9EbTP
	3BopkN9ED/RlBjrMlH98/qhwL2+BIKESnKmvc9zaSFViETARS50dviyroQ4m5aZF
	mShEAsGNki4b8aof8Qp3lGleKILeH63rTZdsWStljsaJfiapPPwU8SnBBj9whGHT
	88PhG814YfNxS23NNA4nBAK7phVISqMgaqVjI+fOvjCWcU2Hn7MvJVsQ7Fx75NUG
	HtTK7BuG5XE+BVm0jZPsGFt4ehxOBPCZR8ue6ZVPPee9BL3iwlwtB/H9EhqWhG9i
	2Vy2alWZUvxParTbG3uxEE2J761MQA36QD4eq4fw7DpsVzUnk9DHyTeEdfw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586b528-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 07:43:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36951518so1099739a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 00:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552610; x=1755157410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT+CIeVJn2QFhT2o5F/6uWjOiW3WFLRnB3CG6MAoQBs=;
        b=j+ftHHthsd8phOWT5EdLMgGeUnzvAH5G4OZum+et6JT7jIeWIJMVZ/9Qc/Fdk7cIHq
         HP8t9z0XRNRTxx/zm4EgGZiziQVTErwMolP1AxLN9ufJ4et6zTv/2Sa+eklBmphKPtDu
         l9iyz1T4/LoOKqM+BQUn6+OpRr51AU9bfBCKyWC+nmVde7lBBa9vCr37FTSW9Tu25t+J
         VD+pDXVplB84J5kMc1Ij+zRUuq3ZRi87RI1wqmeNsKU4c/tJwOQOxrwdEgUwqV3eKe9K
         HRzqAIIjBf7RtRqwKyocNeq1lQoIYenSIaZY50AOcL82xnmiX01D7uX5NlqXY4wEGAn5
         3Qcw==
X-Forwarded-Encrypted: i=1; AJvYcCWCl5N444mNvVBYn0zaKwLaTwOZQ3iETCJRvma4XzXDKeeZMsMVDMXW6r6Fh581kWuCQHh1onl+hslxTivtLVYz@vger.kernel.org
X-Gm-Message-State: AOJu0YwXRW/FTqOD26jFnSZHZQ708etL8OWyBy7RyhENIsATMIHZT4c9
	1f70KlERyR7PIrnPYBsGjJYmOtByx06poDgr1vRHeExvXb3zk4A3pxZ7C1FGCHwAgJ+gyrOMRKn
	TzEeqesor8YjMBXgAOSOGwq0eSIN6eRZxFZDCVYoGWpHB1Sm8RKlA1gdK0c8NphKmId7xnbxn
X-Gm-Gg: ASbGnctFFqZCzGUlFdLx9Jpw0tzbgTzkVtHqlFjaxve9mowxXw9393DgEnlWeTVf8GT
	3exa3pb7hjqMYWJjmUWXnSjxyM+/tAfjFnkBLpK/dokcSJQAKCBVD13m2sCgfJ2d8IeP+cWTvRi
	XdRKa7/0ZPUCnm9GkRJyfOeId/OA7aaNqOsjqpiBFea4eanMH+DoYY36vD2Hi6YHKKGlP7XifuI
	TcjDm/NUXY6wYn3KTe4/g5VWCZP0OE0p6+Qhkz2vdwQxykLy4tVIPUc5Ne88JvFSs5COBO6oEA4
	8iIf8d48XANKCnqSK00iAFuAOLNhZ/er6kocWyFVtU0zWUOADR/nQoBa9oR3Ui2NAqs=
X-Received: by 2002:a17:903:1a10:b0:235:ed01:18cd with SMTP id d9443c01a7336-2429f577b53mr78378085ad.44.1754552609682;
        Thu, 07 Aug 2025 00:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGx6K1rPHdZzRDwso1fe5RcL4zn/OIDD1dI/Ux46JXvnhXFWnqsvJ6TnWvFgdc/zt3A/9Vvg==
X-Received: by 2002:a17:903:1a10:b0:235:ed01:18cd with SMTP id d9443c01a7336-2429f577b53mr78377695ad.44.1754552609259;
        Thu, 07 Aug 2025 00:43:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Date: Thu,  7 Aug 2025 13:13:10 +0530
Message-ID: <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6Fuj1SzqG5EYA8ndm-dKQ62C7yg-ik3D
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68945923 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=8m4FMoEBHb0BRpTWb9cA:9 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6Fuj1SzqG5EYA8ndm-dKQ62C7yg-ik3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX9Ucr+GcXstQO
 04FNJyb2dswCVsynkaCxossMo4ZI87gTYD8OTJ1BY6rz5jjtGwy4QZ2krHeS+RT7kfl66Uz20hG
 t+ZSnlVyBFLM7ADLUF/KuwRTeMcEDSUSsHenzrTNKP1trboi8QfKRovWU5SRbo1BSwE0fG3mYbD
 m3BPlc0qY3Kz5h2YZomI1g8hfUltyTUtpfcQENNWnsr48UmDxTclijHDuFhkBixPPEdJ0/OCyDI
 a8z9q5B8mIwDjfbQ6gbYraaQyrq/dufm9A8qg3Dy0vD3ygdpfUpjQXI+lrWjo7AjVUiM9nCLfrq
 Fqp2QReeOhVaQGT+0bjOmySJyO9hrfnEZAeSMUIEeRz6R2EwFqlwre2mhqaX0H4uDyUMhVPdSVh
 Tj1CAKKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com/
 - Some left over removed from this patch and moved to 3/3
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 -  Added Acked-b and R-b tag and its order in the series.

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 10 ++++------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..862d0718f694 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -136,8 +136,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
 				    mem_va, *mem_phys, *mem_size, NULL);
 	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, VENUS_PAS_ID,
-					    mem_va, *mem_phys, *mem_size, NULL);
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+					    *mem_phys, *mem_size, NULL);
 
 	memunmap(mem_va);
 err_release_fw:
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3b983f4e3268..b30527c402f6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -414,7 +414,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, pasid, mem_region, mem_phys,
+	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
 				    mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 94af77baa7a1..e98b7e03162c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -317,7 +317,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
 				    adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbe..55a7da801183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,9 +242,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			goto release_dtb_firmware;
 
 		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_pas_id, pas->dtb_mem_region,
-					    pas->dtb_mem_phys, pas->dtb_mem_size,
-					    &pas->dtb_mem_reloc);
+					    pas->dtb_mem_region, pas->dtb_mem_phys,
+					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -307,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (ret)
 		goto disable_px_supply;
 
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
 				    pas->mem_region, pas->mem_phys, pas->mem_size,
 				    &pas->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 93648734a2f2..07c88623f597 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -757,7 +757,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				    0, wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
 		return ret;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index dfd15d189087..74c415774657 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -331,7 +331,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 }
 
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
-			   const char *fw_name, int pas_id, void *mem_region,
+			   const char *fw_name, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
 			   phys_addr_t *reloc_base)
 {
@@ -458,7 +458,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (ret)
 		return ret;
 
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
@@ -468,7 +468,6 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @firmware:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
@@ -477,11 +476,10 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *firmware, int pas_id,
-			  void *mem_region, phys_addr_t mem_phys,
+			  const char *firmware, void *mem_region, phys_addr_t mem_phys,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 9e8e60421192..8ea8230579a2 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -24,7 +24,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *fw_name, int pas_id, void *mem_region,
+			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
@@ -54,9 +54,8 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
-					const char *fw_name, int pas_id,
-					void *mem_region, phys_addr_t mem_phys,
-					size_t mem_size,
+					const char *fw_name, void *mem_region,
+					phys_addr_t mem_phys, size_t mem_size,
 					phys_addr_t *reloc_base)
 {
 	return -ENODEV;
-- 
2.50.1

