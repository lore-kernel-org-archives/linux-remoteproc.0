Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E033D4E4
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619426; cv=none; b=cnYk8NXIg8RFCi1e3qxKw/TA2NjdsQ33AqAZWgz/stNzyLA6qWxqa0DRVtw49e0U5KvfGT0zfUZCY+4jNIXb0AZNqWBrcITZEGx9UeKOqugw1kJzPuuIlyWGOBIqkzdBhrC7k7KrEUgQQoKmZRdLfEy1RUgtOCYxO/uh6MchhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619426; c=relaxed/simple;
	bh=L0f1qWRMFAeXFyR0rIUg5ggvHEBiDcRfJhIUkFhR0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAVHYGOReYNHuFYiKvGHvayFnGmA8SWt0rbIu5au6DFKNVRBiRbfjRrFmqI3zX9F2FTuo4H/70vcPPLk6ylcjTWFEb5sm5pxU9Br3pbBmZ6INuSxxaaImDP4bqVrxBdFUznB78gciSsrfyPsuKSqKhTdfLV+8R05eXxXjA2pFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+EtdG+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP6OREGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+EtdG+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP6OREGE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059eSxr3542060
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=; b=E+EtdG+qWT69sJUa
	tOB1TWR9vkJbKZKVgrQQ2YUNdnGdX4ORL44C+eGHCi2b0tPiHGhnYp7/uJfsQXm7
	c0PwBPbfLaYlIp2ixD1m3iw1iJfDvKwa3qu4lDHsBCy+ZC1XspayCrzX9/3Cqv5T
	Dsd68i7Zd15RftScTaE2vyeQrImZtLJ98sJunoAEMV5jmwlT9xZDZV/e2LxdThnF
	0Fy8ze54TaZT/sbhQftGAhO/M1uiwA1U61LD+4TXlX4Fen+vZ8g6VwXQ1PWx8r9p
	qrDDv8OK52Rl9KU0i9Y4wOHq4HFV2x63ohKwATi57+EGBEzUj/foU/ffKoUh5kkH
	6KER1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shkg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:23:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so19406105ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619424; x=1768224224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=;
        b=NP6OREGEt+z/k9BQqvA838nJdVzUoEzuXzpeTL7sLQYPqXbLvET+N9hWEBG+Ri9FGM
         RZIcWs5Bx5JTI2ONnIKLAIqSRx3pnRj1uBuzaXdPj/1kO6wq92dCq17AO6vXI6KGV3KV
         aT0i8ZIvryjfFeI5W2+7pCzS2R86IZkqaoX1zjJMbQP+paUMM8mj9bZY3Hl4vOgK3z25
         XKBRCEy65srNzhLjKU02r1NV4b5E0c+zpIqQXlfVooMeS20DSw4Ux6t0El16lnx/auZ7
         MbHaopif4QmcxkDPdWeOdTdqpHGonD6rYpKLxFPzL5K7OLStd/awLYfQo1dY91U/demg
         6JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619424; x=1768224224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVFFkdNsP5gHrb05VtnrWWMCJqLpes7QIYPNx6a0/HE=;
        b=UJibdsKverNjEf6rvo5qzVARRxXtegq4/GpNGh+4EAqx/JsaIECtoCYu0NQvv/OqDF
         FLum5HwrIc/FEKBI09MBfUO7BHR4wgplEqH/ZlImomXxJiIa6cm4KgoQYBd5IMuiRCov
         7XiI72/k9fCvLsnMyBHRonEYYoFnGh30CbXg9CS6VW5ZAk0dR8DtGcMErIWxlhc2pKLI
         zEE/IrFLNTI+dPIIiMBsyrTsG+k7YevhwrJogRs57PbIO2TkD0gBgBUbsDNEwEhxNWEg
         1UNIbcsL0/bLf4LOC1QjwpsxUcOPxaN2EHVIsA/FNQco+yxxw536UH8P2t2atVa0GWib
         5Brg==
X-Forwarded-Encrypted: i=1; AJvYcCUGF+/q/Yn9qYtFYP7tQ4uKryWp+d5h8SqZcK+leTknE6iAPbrBMY4hTw4MYllDgXalFA2eYOIFPvnRYez2arA/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CX1y7G8cxW4PKzX4eTKauDsMeb9XFOMGE0Zlay5l1CiVhcXP
	28Hoo2k4CvAkfI6Y1G8FNFvlBnVeOzdLfj/nviFilfnF/7RboeYBv1e6IcR45OQ+5tsy1qU98YJ
	i2/z5hKB6y+3+ix10Seq31+57L4AeGpzsRv8fOup2MrOl9IC/Y6Nxj/0FkkZC7A0mINXsVxSI
X-Gm-Gg: AY/fxX7LAqxd22XzLhG5QDHXPZtVd2xpWyWHE8lKGSJXyCpXnhoPo/aJNkJATyaaLj2
	ooDxH+vIzXsMMwT5J1vrRZN3IK0kAvhKWgZT/u8DRiA9PoZdfHNr3tLIh9GxcWjsxCJzqxnw0Wc
	4j6zXEPVG33guIRktLFaL+6j/B5qDf8bOmx4640BB1ywkP2mxqvUlKOkTGLyULQNp43k41odV22
	rTI2Sv3YMVuOO/JOxgcrfKfyB8p6gS2Q99nuSZnWUExMu/QYPM0dAUjS/3BNGSFvsh1ZqYy6J38
	IZeFWtUzqGQnMQgty5/vMBlDRzj4lq+uZmayfeCO0fPrzqdjFurpftEAhTEZBC2Uar6YZI523C5
	jX5phtf3Yy01utaU8AgEVGQt1cQZXUPckz65f
X-Received: by 2002:a17:902:d54c:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3c097b89emr75230585ad.12.1767619423347;
        Mon, 05 Jan 2026 05:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESxIUEbWDZCgLHhKsCl+niSuEBPAq/eJ0HXAs0HRi98Y74GnLxyBSNkVetg60DtIYkzvYk1A==
X-Received: by 2002:a17:902:d54c:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a3c097b89emr75230335ad.12.1767619422728;
        Mon, 05 Jan 2026 05:23:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:42 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:55 +0530
Subject: [PATCH v10 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-7-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=4020;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=L0f1qWRMFAeXFyR0rIUg5ggvHEBiDcRfJhIUkFhR0Vc=;
 b=UWtwg1PkJV8qhyhGt8CHS53ydxNgM2IbTvUJaSWNggjthqxVIRhHX9u/Y6Jk9EHbwqaYu7g7a
 iCnMsubFrLsCkdd22Ihfj7J0IsjtJIex4XljP9x9rQ0NtbvaBuwp0b9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbb60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXxW82x+KmnLhh
 IjUWWutFZ/P3Eg4jaWKuCDEOumLkK7KMlXuyQywO1SN1ukZu8ik6FKTPVdrD552jWGT+c2UkjQV
 FdLpw1EpGNXVtOG4t1Hy+94easOxziF6BGprA+XszBKqgQqdw2dLGAd4IgToE8sJxGqK34itH2w
 ADI7dQMnI4GAiasfpZHbN62geif8+TStGodrBUdhXnVUviS4QOvSC8w27ObdsaUQTBS9quUV2N8
 M/htwlq/J0ddq8lB3LdHkdHtR0BJqH6e212V+he2IzPGPosOeVLO9Fu1YfkmLdQRXio9dUd+6Ip
 iXuz2xaoVTn8i999OPFvoDBxsDHby1XMYeXz5Y2FIg5I/X00PLzQk+0xHzn2JpuXZdzNb/BrD6a
 CN6GDqJFFnS/8X9l+mINgRlAvpeTG7EvA73pckIQCeBPJd1iJMgLpRH/2VYfKVuCOa64Zk05Ed9
 s3rLh+u/IDMyGnbdk7g==
X-Proofpoint-ORIG-GUID: eFs5P5r_lqWVIo2aITrPXTO_md_p1Yk8
X-Proofpoint-GUID: eFs5P5r_lqWVIo2aITrPXTO_md_p1Yk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 22 +++++-----------------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 50c6a3c6b2a3..c004d444d698 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -227,20 +227,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
-/**
- * qcom_mdt_pas_init() - initialize PAS region for firmware loading
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_phys:	physical address of allocated memory region
- * @ctx:	PAS context, ctx->metadata to be released by caller
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +291,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -469,7 +457,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -500,7 +488,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
+	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 7d57746fbbfa..82372e0db0a1 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,9 +15,6 @@ struct qcom_scm_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -40,13 +37,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_context *pas_ctx)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,

-- 
2.50.1

