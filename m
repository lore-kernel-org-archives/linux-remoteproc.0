Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0C30CDBC
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241795; cv=none; b=MGiX7bo0LcZeq13842wt3GO5bWvS8f0YFRcZMvWqeAmA8h5QHpHu4JsYI6r8dYv/kuThdRDgpfKzve9VfcfJAb4GrSixGCzPXuEWlzhK2U3tMkPYqQ4GO7jheqgWmOIJ97eISIQBQxQnyY0Ji5+RecOMtarCmwxzyNomsORKH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241795; c=relaxed/simple;
	bh=iSmU3/X+HtLXbDnGxOipwzxim2WZlEsSp7frdNDuVEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9M1NY0qbSEuJhl086xLr/1lMoExXqh0zR09PivMzPgM0NqPqgNt9SeHKJUmCJDz4tUMx1xC022D5yL08l9bQhWNZN/SclCCordzFURFVVvUL71ofJpPtT6CdEQP2n3xY8kmD4GLd+tY6RktWWjg9x0hkh6biNgYkHnt1ksBRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/9eeHeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APXfF+CG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/9eeHeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APXfF+CG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A46QMcD1191936
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vavCqxPgT/mS8RNiu7Esfm9e/ZvRfzrt7fzsRF3r3Yw=; b=h/9eeHeH0pIDPKsq
	NtH5FhwFo6+FLQ42zDSmZGZHq+TX+bWRmfSeVCwWa0ANJ8uB3xIvJ8eA5RLgsZgc
	XIT2/MVC0Wme81JcLW3dBsWIgzyoqgvGMgEBvgpQS/W9MToszKoHt40cjzFZy4yR
	bX29qtSfFDcphkc6AWIZnItz/rxpkfnRAWlFpkCM9XDOX3iVmACWRsCteyhx/dEV
	KbVYHKkN4B0lvuKBmXktUmuF/59ej1z5SAKkZZBl+r8f94zITmLlaBUKCgLLhH6e
	J3ODQvNq0oMykwcFUhbMQZh16ufjZanirpHklUn5DHqplI5i45EMi5zhksgEWrtu
	5ds4Mg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jg6gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340562297b9so4511770a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241792; x=1762846592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vavCqxPgT/mS8RNiu7Esfm9e/ZvRfzrt7fzsRF3r3Yw=;
        b=APXfF+CGme5QGtYSbOF8p3G0aieyIbTAln6gXfD7hgA+ysn6WvNYZP3ofUyzgrik5Q
         jox7dPKcTF04c1cRum1HGHcv2Yg/D2JtT7SmUyp23axUTNWGljP1SKpJlZQV27z1izcR
         7dIRAp5vpgiToWAYM9/0mAhYA6JE9LgdnIGCYIxI+c/6Bf7ikkl8Mx/IbcI057cm6rpv
         yFDe02V4aKkBVszsZF8CiG6juj5eBlpek6kkA0xcHuBIs1ptltOt2PDznffopN48ZOLH
         3dP/Ysv14AFdsVkV2zbisftKoaELjJSs/7aXbbVZQjJhkYJfXDMlNPsWl0dWMp8acQz0
         0Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241792; x=1762846592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vavCqxPgT/mS8RNiu7Esfm9e/ZvRfzrt7fzsRF3r3Yw=;
        b=lZDGEjLuCEGrUzsAE0f3G7y6N1s6p1Z740lGacI5CfPymdP8rR9v+Z0H/BqabZcziu
         cVXp7R9nPpTHfDXiTUi3fyYBMvCWhWk3+smc4cBG639D62UfFacUsgc6RpiWMCFEIppB
         U/6oS9Q0mwdZUq0S67+YxtqeqsxWdioRLzWWZcagf4Qcm2gtr05YqnreFT3QjnSbWdUY
         Rv0dKeUTvSA29zEoZUXAxtJuIpb4dSCanKXdrYcYJUA2sAGNUnjSaPD/ba3DEhIOpUX1
         zgup7Hgmmj6W7YdL3zwxcHylH7cN7fbZmjm/X/uxpMGUuflpZBgljxKvhxVAmv6ht7j+
         18VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeQEu1H8R1JbxlsJOYqDrqMSt79AzUnmoCl26KFvUtb8L5/K0iS1QMt2XiE9chfw0x43LlCucU/hUeCYCjcwv2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjq9kiXDZ4TW24AkvRq9GXLbxRd77eupnQ+uqSpb3xC9FEF0PP
	F0kzcjDH1TxEXN51TvflErsrlNYQLO64BPiu1RkVZsv29ls17tvO9LRLeCOQXcLSGs1q+9YsZ21
	FKEngXSEjGx45jrtsam5M/CVhMBrcrLkoT4K3rcDsdJmED+RrXrh0RGBfMIQhuV5rshC1pdrJ
X-Gm-Gg: ASbGncsxH0eGEcGKyzkINHdWcQDvy1Jmyn0XlicfkaxHEnJWW5kn6f1MZz2RaLPAZfU
	J2EGz3xNoUd10dLfGN3m4iZf3tD/kHZlQ8VMiT0iJWq5SmooXGmKan+YUFbQ/JGNFTVg8lJ6aG6
	i3tqTcDGm8UJQlg0rFbN32NlmU4c/8SRJeEPxEJ9pej52w7NdV0LIneGO9XGtrUSuIIbha4bbLG
	vgTzixDj7yK4XTaAk01ksDJ2vDnnLBy4DkHATnw9FmkJoTRB4bNLovFLDivaDrMoZ8mj0OELn4+
	6Q9gh00NHBN0dlBgy4/TkQp7fdhKyOae0tFC3nti2QySL0KS6lc2gXbMNzN+LdYFagK9JwcKjh0
	6kMkPssdX65oCZ3orLWth9Verwg==
X-Received: by 2002:a17:90b:2dc7:b0:341:1a50:2ea9 with SMTP id 98e67ed59e1d1-341718e877bmr2898560a91.16.1762241792339;
        Mon, 03 Nov 2025 23:36:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSrcZj/TqeJdj2ge+mKKhSSdgLaFqWApr9mX6pP2aNG32jQlezJFb7S9/tn3ZslxIM2v+pXA==
X-Received: by 2002:a17:90b:2dc7:b0:341:1a50:2ea9 with SMTP id 98e67ed59e1d1-341718e877bmr2898517a91.16.1762241791643;
        Mon, 03 Nov 2025 23:36:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:31 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:46 +0530
Subject: [PATCH v6 06/14] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-6-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=5648;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=iSmU3/X+HtLXbDnGxOipwzxim2WZlEsSp7frdNDuVEY=;
 b=YYX+Wk5P+6lFrCsY16XiKCwsUw4ZE6TUdYXhtsBNt15hmlv5BkHHB7zjnS1a1YD8vDJxTH7eS
 +pWP910klePA62fPYP4BrlEIUrP+Wmh9zb85z5x7JY2WqP9QwT/c336
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX7ih9Cd/G8FbQ
 GW3zx4/jeOxzpfjq01g3yNcMdsYOu2iKqxy4cTTGZCCiEPdXpxjqiHyZIvDUFa09Xrksv/bkrTp
 VJb+UD0SlyVeu19sn2lSHPiHHMYQ+OFhz6Th8b8RpZda15Oo6cL1rgr+s9LqjJ1UqIfJg1NNnYa
 Y+tIj9AGW5XqDXUcIzXX3xGOrUo8QpxLBHIooDqflrB+bSM/cxMb+bEpweZDqP2TuGTC1J55ZvG
 Kx+pzyVLVD3J1LiChnjyTBphD7h5qnpwbvGI1I/te8UW4EckXAJ9N/AIYJGtUApNAIr1NLfI1vi
 e6rCYQRMxmvVDoQ8vxNdxPWvLAhUyUZouKnwqJO7eFD9W71d7n2/VGrNFCsGFZUrC4xMuTW3PpI
 zBkWqPm5Ed7jYOs5mlHmHa+2PvzkYQ==
X-Proofpoint-ORIG-GUID: bQErca-9h3J36XQCzjiT5OrmL0tnG-qT
X-Proofpoint-GUID: bQErca-9h3J36XQCzjiT5OrmL0tnG-qT
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=6909ad01 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tZ3jCLSBV7jl1JjQXpgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040061

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
index 729e7b9bc183..9feee2cb1883 100644
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
index fe35038c5342..c868b9c416e6 100644
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
+				ctx);
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

