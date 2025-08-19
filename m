Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17B2D24AA
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622533; cv=none; b=qoOBt7RlbZ6VNxkRST4UblvkfVOkpW6bWqEifgb5EukUTjrP9ULdbLhxRxXr6MI0hvd1/uGjQJ/arEoYOr31JzVw/l9T5OBmiDWbSklEIaOIGcCSGCiKJMv7gvKV/+TSMnhBMdIWf7jUFMMrRxZy9om/zuOd4dVARCXQ+YkrQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622533; c=relaxed/simple;
	bh=EAfpvsi6NVKNbNSOJcBUSNNG3c+NvpwLp5OAM0V/v7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2C86g9yOpVHk+FQeN4Rm7SJnr7mC1vu5FVJWqyIUtByABV7W0QsGoHFjFb18X76ze0pOaoqCCIzBoJDexqOIx9i6W+IXamofRd+VPa4qBGUy7/dh/G5GE1ueV3yE9OsNJT1bjsKFPYLFchQ4HBWCv4io8Ib0oTJcfigM3ZeeYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuPXFo4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuPXFo4U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFKsGI005472
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=op1TPLxV5Hz
	dPsGSHZreogRDWYSb1zFoqqgwkfe5+WM=; b=OuPXFo4Uo6QHDTGKLvzb+mL/fGO
	bUpCnsxthb1nNEBHICaXsn4RI1LRicmjjJZOVM5nfIwnvkE8X2dR6pt8cBSOG6Lw
	jPak5rpI8stp2gOyiotVZP3ua4e5f+LXUn9RXyG+GjZeF8oxxR/2UDCm4Ezmiof6
	7EDPovFg0AtyN6gsxLoujMGTfQ370gt1ySLeN3ekFRPrw1Xs53EFFN2E273m6mN5
	7OWIzTwh4ub31E0bqrZIYw6jH2HmXVvolhoeoA1DclLWvns4jsrHCt+Jvovy+/Mn
	cJH8c2GkF5rrNztwIO4Mzo7+rFxkJaDnHpNcxEXNfpaBnOe57ubDCOKvBcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0ga1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f440f0so60762955ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622530; x=1756227330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op1TPLxV5HzdPsGSHZreogRDWYSb1zFoqqgwkfe5+WM=;
        b=kwj6yWHHY3INh2fIHKMPzVC/gxsvM+Cup17QxQx9s13xqRvqW7A/2SHPYOlwQVZWAC
         1glOlAx9ajRZ72Sm1l0PAUcR2H4XX8Cu16cS3R8SmUpCN+KTJDxMYFa1yZu3m+0SvIUf
         M7hWl/IAUKJZV1cw5wgPuzeZ8bFLiAG9UhdK4ZcEMHs3mxDZ4hhgsEI7eL2/Ukv3WR7Y
         kjkS1XvKnxKa/wnqSLPR3MjDmumyg3Jjig6ZY25qDzkUHX1YTLdKYL0w2HkEMFbkqVSi
         p1o4Df+RtFmxCgXbwSUBEFzWzoxFge/LEfiklI/MDEohKEdWF4e+YKIl3I+JzRe5Mbs+
         XPtw==
X-Forwarded-Encrypted: i=1; AJvYcCVVw3/3m88HlIAvpGX2X5MBFecRh4akIlryiX2ggG8A0qOnEVEYWpVeAXffLKn9g5flAshiJ3lilAP6/hZA/Ei7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5n3YaGCk7aikT5u7+8GQJsSrFdw1iilTY68zW8PNpSl8Cj/7+
	p8k2xzv+qBYBhFf1nU9NiFI6b6PHEuQaZk2Iduht0LjHt9m8S28/RsFmfwGP+TtS1bVQExqVg2A
	Lz/jxEd1zd9Tc8VGxiCWyZIVI4gip3h8+hrdXckVH9znthJID/VLtjra3gB+exeYr80gtoWqb
X-Gm-Gg: ASbGncuc2YBWa+2HEEOcfEB/nyYf9k6k69tYeTO4rNDys/CV7FONd3/jssGbOZ/COEY
	TsKEao4xtNj6AjlW9MuhKq0wP+yqYu+yB5w0MtElqTjWoVXRu8gt9abA4PG94oi5x9XYrlfbiMg
	3qsHqHUigt4IW1P0w+5Y56M8qJ3aDfZVFju6pNq8UBb9Zn1wvXKTw48G0yicj4Iha0xByI24ziF
	4bTELRZHiT7uMPNHz9+7o5+ps51n271gKhVXLxSzaBIIpGrkR/I0oOyVGZgnXb0DooPxlYzn5TJ
	qZ1glYuADyhqidjFKXycnGlPKZsB6ivy4p2dhiOEz82KFeQawQ2QWFmSqqepx9f+rx0=
X-Received: by 2002:a17:902:d50f:b0:240:25f3:211b with SMTP id d9443c01a7336-245e04c7029mr45132995ad.51.1755622529569;
        Tue, 19 Aug 2025 09:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP1fg8V0NTh0vtb8DSC8js3l86SxwQ5bNSKBheoxb2Ujnh1eu6S8wkXVP3Kxz1CvGgBsp/lQ==
X-Received: by 2002:a17:902:d50f:b0:240:25f3:211b with SMTP id d9443c01a7336-245e04c7029mr45132485ad.51.1755622529018;
        Tue, 19 Aug 2025 09:55:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
Date: Tue, 19 Aug 2025 22:24:37 +0530
Message-ID: <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uK0XJMk3CZrUeLAKDtnXFNJe2ItUPCGj
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4ac82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DsNTrw4wbpnc9IaBGIUA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX/t6bdoG7BK0Y
 DPonQfeK08O6Ivfm1Kl9E7fwi/flq6wXryHuAIfHPaErxM+o5CInwPS8hrsWC6lfSf6Y6DiFzjd
 mlaWEltRBt3YRLDZ+iXGVetFH67wN57gpZkwCgReyLu/T13ugEiJR/fK1MFZ4bBgBZE5H3LfGbH
 cK98kp0On4Cyr+77qBzvZ+ACLjNjWl2ZIEZQt4ZpBWvYDO7uBqxSZJz3gR86wqUPy+da0R+aXQg
 Jc/XZzKHod/zg5b+p5YkCnH0hKoa7CZQKq2CDcMU2Y0Kh7jh956VHPI5HvirDNu+8vEZTC8nhZj
 aS82yuU2PCwe9AURz0sfTVq/0rTmAnLrCgBY0C/vv1z3oerZx7Ljd7qs7EozBhlbIGgtr3DUdfg
 m5LoSuQ8
X-Proofpoint-ORIG-GUID: uK0XJMk3CZrUeLAKDtnXFNJe2ItUPCGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not require it.

Add context aware qcom_mdt_pas_load() function which uses context
returned from qcom_scm_pas_ctx_init() and use it till subsystems
is out of set. This will also help in unifying the API used by
remoteproc and non-remoteproc subsystems drivers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
If this approach is preferred, will convert all subsystem drivers to use the
same set of API's using context and completely get away with qcom_mdt_load()

-Mukesh

 drivers/remoteproc/qcom_q6v5_pas.c  | 53 ++++++++++++++---------------
 drivers/soc/qcom/mdt_loader.c       | 26 ++++++++++----
 include/linux/soc/qcom/mdt_loader.h | 22 ++++++------
 3 files changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 55a7da801183..e376c0338576 100644
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
+	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
 
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
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
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
+	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -338,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -774,6 +759,18 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->pas_id, pas->mem_phys,
+					     pas->mem_size, true);
+	if (!pas->pas_ctx)
+		goto remove_ssr_sysmon;
+
+	pas->dtb_pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->dtb_pas_id,
+						 pas->dtb_mem_phys, pas->dtb_mem_size,
+						 true);
+	if (!pas->dtb_pas_ctx)
+		goto remove_ssr_sysmon;
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..509ff85d9bf6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -228,7 +228,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
 /**
- * qcom_mdt_pas_init() - initialize PAS region for firmware loading
+ * __qcom_mdt_pas_init() - initialize PAS region for firmware loading
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
@@ -238,9 +238,9 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_metadata *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +302,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -456,7 +455,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -486,5 +485,20 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
+				  ctx->mem_phys, ctx->metadata);
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
index 8ea8230579a2..450fa0be2af0 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,19 +10,20 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_ctx;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
+
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -37,13 +38,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,
@@ -52,6 +46,12 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,
-- 
2.50.1

