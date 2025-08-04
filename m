Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756F25EF90
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Aug 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311363; cv=none; b=LE1fubr3uSrkCrrE94U/bNU1HKsyhOP+nH+nq2xPQ5Xi7A27eqIkJh7I0HLX1p8KPQcKU2uee5YJtH/BUzOhBs0SFDBUchPplSl71Hd/fqn6p0QOwGl68jsd5diBN/UiQS41uZWFLm/aI5rwtXZ2UM0pWhRoisM2SfMBSGQYKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311363; c=relaxed/simple;
	bh=F/VAeubVw+7Ebvh24oFSsn1MT1FFSrUw3oTOjOE96As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XT60Sb5A6h3R1IFr0Sxr49Gcxb5+/+icUOke41OPD/aPuy6zIu+eAQRH0P9xp1swl8J+vLHaDVnyoRWn+OyPiE0u/b4jk1tboJk1BUtfyrwD9+yPrmcgmlIa8qn9Vj5L+mbvWNQHVgG6HHF/4Uc7humHt6a1s5ljhb6RlVxbpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APpA4Uo8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APpA4Uo8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748m6R0003942
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 Aug 2025 12:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euPMbICaYz4sYTXfiuz9KHR/6SowX7Y4n17wo9kNeSE=; b=APpA4Uo8Oda10L7J
	b+a/swrubD3CiYkEuUx43Tx7rT9QlEGaO8a/aDwWkjcxX3Gc9yqGwAWkfjDOXsh/
	s9ApeyB0K5/CCJjQ0Z+0L+9KL9h11MNBeH/98TOjCRqdUWamO+I+J5sW42DG6VD3
	OJRbobsnIC8lcBixDnbYmF5pFtNYMmrjelswH/SMriN4zQpn88vPuF4/482Q5IVf
	Dc+YntLQxhVbiSxTe7tPpkLBRpO0/8kjEvurFxTMdK6K2OEEkuF/Ebo0k+G/zQ7D
	3HtmjG1VetmdelOT0QX93o9rLHim1n7v4nEv6OtCVIvAQ7tA9bL2i2BSmb48H9Cb
	Aa26wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke3365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 12:42:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237e6963f70so87233785ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 05:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311360; x=1754916160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euPMbICaYz4sYTXfiuz9KHR/6SowX7Y4n17wo9kNeSE=;
        b=cfuv5iNM8QuM3a14gvEYxMlYU/YCB7phDpqItujEBOX0oc+HEgzvTeWG8IAZh8tnsI
         9v33tujYNFckGHjMXQkpIRJE/2wIHnYNbwzCVZFcHm012V82CgeAE2zgIZ8rtSsM9WSl
         IIocxS1b00m6sy5uFQK87LKxHkPAeLdmsBr5KciKdjlOGOdI/M9CA5EMi+2Boto2vOZS
         EAJwx5gvosWaR3DNhI7TE0Y4U/7pCO9B/EHN/UL0mNMbw9oHO5kW280CzDku5R+t6+UY
         VCWJrq6GwvhaRLZfj3YbmMVg9uIIhhmxwN2qlDZxj7rYN0b0mhw+cf9BZTgpMe4GW30D
         j7hw==
X-Forwarded-Encrypted: i=1; AJvYcCWI1MpFdIsut+jk8hP9/qY43dHo4p9T7CZjaiUZnIhXFAYSFWWBhiReanlSAO0dEsXQJZvRvYDJo9Df69WEdFr5@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAesvRm7oa6RMLp+aiOyZuSQ0100voi5IGJEZUbyV2+df+ot6
	V0Gy/8fTSz6A/x27c7dr9i3zshgbuN1QHpe98z/cpBePuK8w9f4wfEIQDrR8bZRIQ1Lj0oP6Q2e
	1+q+HvS4R+9DMFQG7zvcjB3tTMLlbL/O7yJT5CR2ZGSisxrFPJyY0AArjHW1NFKqFiv42ukCB
X-Gm-Gg: ASbGncsTAARsfD7mz/g37gjq0iDE68sy1bUSgqJPNmHl8i0uyAgdxEA78YuUCskhksG
	mlFaPubPytSdUx8S248PhG+ST8sEkcm0XnmKvPTF+W0zo5kLnnEHbOfGUWH/yyk26qLNxLKElBe
	6sS468v7BDhmUJ9ZkbZBQpi9/vc2iFzphpkaStBtSaBCNDxkEQ8YUHZilvXozvTDRFdLqsB9e0i
	76yb7Uv9NEbuvsMYSDIAdYc0Q3awHwdzwvQMxwV2FFrcaBh7HaN9CnuhRz/278HGzuTnqaYgFRp
	+eUlYM7zTou5mz8IE/vND36SbmvjrX/l44hK4uzJqiwT6rhUeGH7nh2w5UY8f86vhvE=
X-Received: by 2002:a17:903:41c6:b0:23d:d348:4567 with SMTP id d9443c01a7336-24246f68df6mr148128595ad.19.1754311360453;
        Mon, 04 Aug 2025 05:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYqj5c+gIwk1mnIxx2ce4F76rKrGqlwyIVz1AIrOhm0r6nHNc02SPcnNUal7tSAdMaoY7hGw==
X-Received: by 2002:a17:903:41c6:b0:23d:d348:4567 with SMTP id d9443c01a7336-24246f68df6mr148128195ad.19.1754311359991;
        Mon, 04 Aug 2025 05:42:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:50 +0530
Subject: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=8001;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=F/VAeubVw+7Ebvh24oFSsn1MT1FFSrUw3oTOjOE96As=;
 b=Mkcw1bDdbiqVAT9mbABo7MRbkbP3OmQl9LTHR111RUUTJ8s0JLA/4hSX2SafpvxpPft4utXbX
 jtOHGb6h6d/DXZP3zVGyNtXg3hlgi9WwI3Mmf41FegM/27KWUp1Cw+T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: ULBI6jSEAawtTOrLYc6ALweKdaa8Gp9y
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890aac1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8m4FMoEBHb0BRpTWb9cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfXz2UXx2x04ar1
 876YY7YahZsmLP6cw8StsXXua4vqBCM7zOTPtyX9EnUOEAIq5cVf5GsJgJVhL/YJ8g/y3eeHmp5
 2p2cSxfUY3MvwlAsnFSQZsnnrEO7UrvvACVFYrv3jXcAyr+TIf/TUfnfPo+jb3de4SyKT1Tiy6P
 vg7bE8A8Ai1P4VlF1J85X1jz7Bc3xZN98CI2oKZhPmPgRHzeA8k6QQQOmkZWvY0i6yWb1i4ng9q
 mLxJ5fYjtyCY1SZrq1aTuq8FZokLrm9uvBVu7N/Rgr4ETpeIFwAe2VmH3BuWZAXDrE7GSkwtZUW
 z0i1syFEFkLXd4sLVaipo8+Jdk3epqlQUkhrxmmXODxCnkiNibX/3/XpOPwgvM+ZEAoY1LDsNHQ
 PkyjeTEywacYF93PC/zbZBi26dpVC0UvB6+o7qwuw9K0rtN2f+cUR8OXEiWZjAcD9NP9i9DY
X-Proofpoint-GUID: ULBI6jSEAawtTOrLYc6ALweKdaa8Gp9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 17 insertions(+), 21 deletions(-)

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
index dfd15d189087..7522223835f5 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
@@ -331,7 +331,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 }
 
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
-			   const char *fw_name, int pas_id, void *mem_region,
+			   const char *fw_name, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
 			   phys_addr_t *reloc_base)
 {
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
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

