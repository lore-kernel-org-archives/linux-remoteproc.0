Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2572FE586
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349846; cv=none; b=FN/LpPttYSMu8CCOTH7k8Qo9jrPWYp/vgisznY2fBfKhcDRe59twatfS32eI3uRdMiJWLAtezfuwPii6tKYf8ljehQHis3lKHQ/FNp9Ea/lTTC/ouSCLpSPDOcaY1MzCir3pM6LP8/Tj0bhG92aqT3VLYFIiMnox422up3bngfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349846; c=relaxed/simple;
	bh=Icpkan34cU9+IqUCWwoIEvjWttbgIEHHCj+zspriR4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK3/R4hg80j95z3lXY5Ns0wmbJhxaKYL+KyzQYBTWteLsY9eTscZ+I5IqgufZrIuW3pCZ5d99ir9RPrDCcq68HLyqMHcliBDUe0BRv2M5PuY0/ijKX3+tttls3+9/Wp7c39LPB5n2mvz21erRUdut2WrlAbKrT/KPMOHj5ydfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyCPyBRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyCPyBRf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n6Gj010592
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+eo4qyKVLGcgAWX38pSnEzJgrOcwP93t2BBwbeh4iI=; b=OyCPyBRf3F4TLU+C
	N2J9E7p7v9OnfG0oaAOkjvq9exyL+Uk97CTRk7/ph3fL8Jy7SlOmK4FaMcQJ2Tr/
	wV9VlR0PYL+PsowC6nseLoEFaIr7iNZRdyWswAQqWVdiTHtNoWD3Wq4qeYaTeCxL
	jS4H9LtEf/He6lj36mtfGAXjyX6LGZ20wnckXrXAwt2y5+LMxTRolNGbNKB26ZHz
	MSRcJJNNM2tFyfRSrb02KmYFuwDI9c61JmXBx9bVqQfR7yH1NCq1c3Z5/VQ3L3VH
	RY3R8sERuspdXzZIdnOViB4MUOMTMsPMFHN/bomRE9d+pr/aSxpfJ7Lo6yhfgphm
	tnKN6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bv47k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7811e063dceso7224591b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349843; x=1760954643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+eo4qyKVLGcgAWX38pSnEzJgrOcwP93t2BBwbeh4iI=;
        b=S0JferzRSeGrq9ZKECvZUYa8Y1xQL6o9+KWDo1OP605DqfMSLpS62h3/XLVSG75wSD
         wxCV+/eyb09zGvqCW6qmc/WE2RIeSNULp9gji9PK+FcwdC1Gr+O3ArEnxxl+5qh88SFx
         SsdP16om2SyO3LG7SQpg874drzRlwPRjDhnV+48mnC3iwmRg7b52ZQ8A0HugjSnTlOIr
         ZN+mphwoD+VlSt4Uplc6Ymf18s6U/D5kFPhy2orrdCfitvHyWUpB3TtUA8Zew7cffnKj
         SKpeFD/A+rPDPklyyxrDtepufzzVe4FUu2Sga2gDZNn6HS00awWU4bJtHF7Rhi4whrx4
         2Lug==
X-Forwarded-Encrypted: i=1; AJvYcCXn2ffgdVgm85gUvnulsAKwAaePUlXfdXxOLcCOJkr91ndkbnNUbFdQfintFh0jc10NoiFPFJQ6zrOqnzgRjkia@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7NIx5K62rEd2wcQG0Ah5DPo+kQ9Gd0iZIlqad27XurIgA4Ug
	tnfgesbPLkWWFfiWNG6ywGWLU+VXrMDnqex7HsNYORVssOymp3842ZYSCWdlCi0L7iBvvDDyBaM
	i0xsKRq/qaeeG8edQSyv1f07m5h5+VtgWaEGaKGUTjxrj0zbPhjTO+E76lSaAHhE3MxIAnFqhDW
	87MESC
X-Gm-Gg: ASbGncvJhrXAGQ+ziK6mQqNGPjP+T8ey1xUyAWn+TBcR5kYA2T3A7x2hYE9MBbY0kg2
	qjsq+nXnjKqUxwV1xIkaKtQkitWJqRYgrRiNq9zkHZC7ZeGhOvuLnfCktXjnnARr9auFuClHPkG
	08AvETgOTUZqkqACzwK6rWZiUs1WM08WZcaWkg7FCNpQbja9RJO8RwjfjUYww6N8+LAp7VW3A+h
	7KFR2rXm2KmU+dLNIzBVqqmsPnMnbxxvp4DxTSdAwLv30fbZV/3DI+iQyEqhFguLAiIvpM3rTzp
	vFqsIdc/2aVEh2WxqB74dcy9gO60QpNxVFSF3IFn/qcRxESt/w285eNTeTuF3rgQKlM=
X-Received: by 2002:a05:6a00:2ea1:b0:781:2272:b704 with SMTP id d2e1a72fcca58-793853260damr25668164b3a.5.1760349842780;
        Mon, 13 Oct 2025 03:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6i6nuGn+P1BIm9lbVj7yDxa2McgSYNKD7vdGfdIn/WKRA32N3oYYdTDrYQP/v1UbanNveRQ==
X-Received: by 2002:a05:6a00:2ea1:b0:781:2272:b704 with SMTP id d2e1a72fcca58-793853260damr25668110b3a.5.1760349842149;
        Mon, 13 Oct 2025 03:04:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:09 +0530
Subject: [PATCH v5 05/13] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-5-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=5658;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Icpkan34cU9+IqUCWwoIEvjWttbgIEHHCj+zspriR4Q=;
 b=ZtKuOgxV5LquwO4E4dWmMzbw3ZqqnB4suE2tk30MOgMLrAucjqhXcqN4uQ7N+12+ZpOAkDRhv
 xXyFebE4QvVD85a0bQPdltgLlDGEM29ANWqNzN+iHdeNMwZQyXe8DiL
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: JbCfxsQ9PrZ5KdrrXQyyOAocXy_2dKHt
X-Proofpoint-ORIG-GUID: JbCfxsQ9PrZ5KdrrXQyyOAocXy_2dKHt
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ecce94 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tZ3jCLSBV7jl1JjQXpgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX8pSS6l47gyRt
 SuJpce8G+bJlEiAQzvLhIgnv99RZMv3a4tBwH3zYJDPfYB5GhvAUx1RP5BqTFZ+lplL7O9Xia4U
 rWBvv9hDyJqojRJyoj6XPYxDxRO7H2pIP2Ym1WAzWQ04/dYklbhH2Kr80BzMwfiDGP/vjPuox7q
 ghAM6iMLfFvSubArB5ZEUKB9qrp5yWWuEkyPCN7BO+wrMG3QscZHuDWfbznl099cmuNvPqqI7eu
 HmnrjiCsK8vtiKzG3Z9FkJvgxwnyStGyTprmzXdYYD6CfMaZWen347Xirumzztq6Jfsme94dJFe
 OfsYNlWx0XIFl9KDaYOhb+BrNTWVjq+nlMcgZYkwFAaLnRFO0ARz+HXZCZ/VgVv0nFTHduYA7e+
 MmHD5p+isBrS+6+YHzS91qk3e17/Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Introduce a new PAS context-aware function, qcom_mdt_pas_load(), for
remote processor drivers. This function utilizes the PAS context
pointer returned from qcom_scm_pas_ctx_init() to perform firmware
metadata verification and memory setup via SMC calls.

The qcom_mdt_pas_load() and qcom_mdt_load() functions are largely
similar, but the former is designed for clients using the PAS
context-based data structure. Over time, all users of qcom_mdt_load()
can be migrated to use qcom_mdt_pas_load() for consistency and
improved abstraction.

As the remoteproc PAS driver (qcom_q6v5_pas) has already adopted the
PAS context-based approach, update it to use qcom_mdt_pas_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 24 +++++-------------------
 drivers/soc/qcom/mdt_loader.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e9dcab94ea0c..ee0ea35803c6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -239,15 +239,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			return ret;
 		}
 
-		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					pas->dtb_pas_id, pas->dtb_mem_phys,
-					pas->dtb_pas_ctx);
-		if (ret)
-			goto release_dtb_firmware;
-
-		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_mem_region, pas->dtb_mem_phys,
-					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, pas->dtb_mem_region,
+					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -256,8 +250,6 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 release_dtb_metadata:
 	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-
-release_dtb_firmware:
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -305,14 +297,8 @@ static int qcom_pas_start(struct rproc *rproc)
 		}
 	}
 
-	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, pas->pas_ctx);
-	if (ret)
-		goto disable_px_supply;
-
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
-				    pas->mem_region, pas->mem_phys, pas->mem_size,
-				    &pas->mem_reloc);
+	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
+				pas->mem_region, &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index fe35038c5342..52de8adcc4f2 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+/**
+ * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
+ * (typically contained in the .mdt file), followed by loading the actual
+ * firmware segments (e.g., .bXX files). Authentication of the segments done
+ * by a separate call.
+ *
+ * The PAS context must be initialized using qcom_scm_pas_context_init()
+ * prior to invoking this function.
+ *
+ * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
+ * @fw:         Firmware object representing the .mdt file
+ * @firmware:   Name of the firmware used to construct segment file names
+ * @mem_region: Memory region allocated for loading the firmware
+ * @reloc_base: Physical address adjusted after relocation
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
+				ctx->metadata);
+	if (ret)
+		return ret;
+
+	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+			       ctx->mem_size, reloc_base);
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 07c278841816..7d57746fbbfa 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -23,6 +23,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +55,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
+				    const struct firmware *fw, const char *firmware,
+				    void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,

-- 
2.50.1

