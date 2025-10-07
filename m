Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E732E8B96
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855774; cv=none; b=Ryj5jELqJGw5YRReYDfuc5iA81A3JKxWs0c9x0OD6HrTn24Uz49EQ7Slk1tAmP62+rmj3KpfqTp1drKLlhBM+F7Vk6UGKmr6nQat89ggLD1V3TGQVlTuOcEV6az3zX4fOsQjjG1VwS9XQnoQO67GnQXWbWz/pLIwNAptlP4oAA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855774; c=relaxed/simple;
	bh=5ySg3oqdhTBFKhYF19nJktUPZz2jX4cWgK5IfIezTP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAexX7acvM18ghEzVknak0VUD4doyDSwZTEaSmMkGxC+xDQtBjBTVPgizXiGvgLaFXrQmJs1bRbnQHtc9OyoRukJVgV74ZipZGyjRh/4+q70fbrC1xDZJ8SFSogLehK5TGxldS/T4rg40TjbBrmO1yyfI4/BhZrHY+VIaiSBr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfJbtc7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfJbtc7L"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET6lj026297
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdsdQmoQzXdnVBOtp02PaRgYLFkPY2o3v41AlXFLZR8=; b=SfJbtc7Ljo0j9IXj
	WDHpgM5a7S/9carLBFAm/rdBLcwCky/CXcz8bSmZ61y9UFsQHZ7416nB3+I95ayE
	gFXmyPrTXGudDupDBqZxPpnMvJL1gG0ouJCc8RtRBlN5+MPrZltH0XEqXewLbTE9
	ui45G+NwVdIl8d9XNwMvWc6sFjosxkDy91K/8L0/PLjnct7qiHfKSs/bsWx3tYMC
	ZYXxBTi/rWfLeDwLC2I7gvMLim08YTCE1/+aMZtSQ3XZjJEzKbsJzQLLJSuA+hbK
	DF42Ls9yIa8Odeb4hDbShOYf/V6mnXuvzLdXLl24XeJ9YgEnnWIsutkteqGbkGfB
	vorUSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6yx0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698b5fbe5bso77346985ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855771; x=1760460571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdsdQmoQzXdnVBOtp02PaRgYLFkPY2o3v41AlXFLZR8=;
        b=jzQEbyETIcsmKv0LhMFN6BDs8Wriqp65XRHv7wrfYjt1eq6aorkSHv2bgG7vBhfIs6
         u94EUcrDTFOcykdI0y/X/lZlVCe+hnuI97epnzVBHi6dDmQbIRojKh0DK+kxDNToPhje
         m6xBNSpwdmz1OdwtphsHLT+1tQkaPtl/L4tEvGlwqCv8B2geqqf2cCKVh/+laePAlTQI
         ZXkLQv1p+YVQZehfe37l+DzqXVDjA+B2fXywsSlMdOo+y0dGEGtHHp6CsYYH/nGQ4J3d
         AlPLt09jetUmCi0joH8znIJkjAX/eRlCPnbnbRC1vdsNS35fZ4ghE1QxFAfoH4wMzIJY
         A5lA==
X-Forwarded-Encrypted: i=1; AJvYcCXlzOezxoDx5xHkQ75osT23zcD1Y7Tgyj+TVm+ktaJivAVCCXE3XfoZB/mayW+0ykT3IEY8JGCb904aPmggPN56@vger.kernel.org
X-Gm-Message-State: AOJu0YznWDITbMi8tCUJOuzqHodVoWNLUdWeBgtrPpJ5RTj1HEHDJx7V
	x318IPrfVkfS4YVb0oUfOaGo2fKrMHTTBnz6mUgdX/d0BpUwpBBUX9O1yjWxdVTV+uPtY233PDQ
	X3rOeQHdUWOM9WTASL32Qef8KidKgTKAYQt+MDCf3WmtLylSms/HxCXWVmugjtFQ8AvIvhr65
X-Gm-Gg: ASbGncsnZ++OaZ7xtT5QWvv33WPF7DoOVs/TfvmjCon2m4lrekXWW0Q2Jl4zuhQ8aW1
	0Y4fC7wDxLeFLfkt0xy3tjzJoB59/dx+DZfS7i7WNkg3fMiUAU1/IvZfIvHLDliMAKlSKKv3IR0
	FJLtcRE9LmvvduoLBY6ACGFpBN68U8IPzERQ3XrlkzMUiNneStwgGlA681DzVfDQ7/AVR9+hcRs
	EPaQ6YIBzZZLUsCOURQS0jTIg9vOIGMPPuShqN7pKZHmLpZG+BrgSGxzFoL+vYKMcf3DlcwUmAk
	IhWfjEQ/lz80YA7ZzGjmWvxYqulGL14s0IUhWxaFwdP9jpKMi1aihhFCykZ9/FBS2724Y9qh
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr6280125ad.12.1759855770339;
        Tue, 07 Oct 2025 09:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVotSHakAVyij7LAvIdycipiWzTF0uipwSGfGoro8jW/NvSSXvJ3fMuHUryk7LKXY/WOybJw==
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr6279705ad.12.1759855769818;
        Tue, 07 Oct 2025 09:49:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:49 +0530
Subject: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=3541;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5ySg3oqdhTBFKhYF19nJktUPZz2jX4cWgK5IfIezTP4=;
 b=dranwIFmcuDiq+3Qde4Iv70b2uPlZfq+4LBNMZ6WAwX9GPmAAUFsITTiomvc+Du/xD5GeuOak
 qLYnyxHXFi7CC6chA4+Pn+wBq5i/NGIIlKGy3Nxattu4kcAUucLKP7z
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e5449b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=fdpGjgpQmjpGYtS5oBMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: s9Rs9oIus-60L76VX3hA8fsQ1Zv_mSfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX+ZxS5w5bRWXx
 Ie83WWKfPr0ZmBfrZDotpbCRcmAUDYEfoHUtryqU1yohkNt+YRi0cyPhbpsGO+1AedkTXe60KAm
 B42wO0ZMThERtIUqPZyRa9qZccRCZzYVLEVFT8UYxaWgchpQi2MURaS4xJhfS+lwFcjdDaw+0og
 6u7oP0AIu79N17bdc8z1WYPV5K78eJ99N0MiVPvID+/90a8l5bg+Hpe6ak4Mqy/SH0SG/VDcHO4
 LY7jiKIhuPlriiMHAgD0ZiqhIQLFeYXzxeH6t/VsKoa5cUQfhoVLLWDRn0cLTez7mWt7qe5be8t
 5Dz4TWulN1Mt/4eiOsBvhVfBlD9DA2vCbkQv7LlSTBww1B2hZnKO+DiZWkh89//l1Hz1qNxeeov
 QYueOYc7BWB0kmy4tzmtLGxX0k4UYQ==
X-Proofpoint-ORIG-GUID: s9Rs9oIus-60L76VX3hA8fsQ1Zv_mSfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

Add a PAS context-aware qcom_mdt_pas_load() function for remote
processor drivers, which can use the context pointer returned from
qcom_scm_pas_ctx_init() to perform metadata verification and memory
setup via SMC calls.

The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
similar. Clients using the PAS context-based data structure can adopt
qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
could be migrated to use qcom_mdt_pas_load() instead.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..31855836b251 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+/**
+ * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
+ *
+ * Client should initialize the PAS context with qcom_scm_pas_context_init()
+ * before calling this function.
+ *
+ * @ctx:	PAS context pointer
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @mem_region:	allocated memory region to load firmware into
+ * @reloc_base:	adjusted physical address after relocation
+ *
+ * Returns 0 on success, negative errno otherwise.
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
index 8ea8230579a2..2832e0717729 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,7 @@
 struct device;
 struct firmware;
 struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +56,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
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

