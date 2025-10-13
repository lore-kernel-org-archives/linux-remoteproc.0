Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE82FB632
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349851; cv=none; b=VAHpC/DPb2ZNQWsHiWYyI3KWHsTIjLRRaozs9OGUIlOcXoEWqae93nVhyNQNyUxoUz+9GLEPlZwVBqHmtlBkhtOdaLyezz04PDypeFZEDpABcccrbkjlmygJxn+EItEqKbnyTYJ+O8ALwJRoGTTjPu4ajVO4FAP/dI6TUGxfDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349851; c=relaxed/simple;
	bh=bHcT9eRVWhvFNTu4y4V8eqKAF9VAGKEmNZy+vNLhXZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOxnGj/Xx+f1IRiXXPy4zgII3Zz7djaUdm868OpX0PDIgNfNzueV96LzgrhSLC6nkhAV59P08U7ndci/qTh7Vn6txxUphEvSz5UK6TLwReSd+X4cBFcIpcp0XuS4gWxG2Rxx8TznBHEjtHev0iJHgQC9iJV3z0Zfl/yvOwZybpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeJcbWNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeJcbWNV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nJ5h021533
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACMa4Gr9K8Co2xpy9yKtrPi2uufT1PxmA4l9YsdDMic=; b=DeJcbWNVbhf30+Em
	RVsrkPfI8Ij7np41DV0R6VefhxjGyn0+mp8qz8Iw6ipri4s3v2fPBm3iv2OkNn4d
	HHqtKjHrKteXnPH+/w0no678FgTDB/N3spygLL6MRKcRivgIelGo9eBy2EGEjv98
	GWG2QRp3evIaHvAT8Yz3xt+O/5ytx6KO5AzecTe9/OxfN/X0d78nwq9gJHuqXMI4
	ShB9bDvPKbIMB8z1Efyjdy0kPX8BudjkYjrwIXZGItXiIMD65uATj0jh+h2AegJS
	c1SY9ARqim97RdzhsFUagCN+seC2SnunvV8ytUQ5Jq7KKFxvfcnb5DByvPWhiozz
	nfHhog==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh642y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso6188072b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349847; x=1760954647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACMa4Gr9K8Co2xpy9yKtrPi2uufT1PxmA4l9YsdDMic=;
        b=g2eV38V2DBDpbQPs3zcWIDV4N96Fo+p2NCRTUmdhIKAU7GUtWuFoSaLDv77BPHgiNH
         Y+hoLGLOENMbXNXrHX0Qcjdbxj0dUYaQwYIzGRxZyjDY0X0tcJRmFQT1GkgyVqCyv8WP
         Kk5s8LNYLsgk+/hE92VLegl6f4cVrnHwoXtGi3l4HteTlfvGhgHxhI6deotO9eH4wuf9
         u62XvSXYVFELNUfK/sqknJpMxfTypCI0eYvJUVZJut04DmHGXlzLtRcvewEmVHCz/g2w
         WnVId4ZkPyxwDkP0aSwVBF9azp6PRNyVWK9oe9OxwufzqOUhdnvZGFwjI0nr3YHeUqV2
         3CJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCu/dL1eocpqsNR9xqAlkTpqZOAMnkFJmwcdLyhU/HkTv8mjcFu8cuab6Cl9APgVrXI/GiW1PXuJ0DGKokcneQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJiYYTShFumUlQqinJ3l7kSUEG7CBXTS4agyZoRTDayC2OHc1
	BNVOMRnMn3URBppYItzkytNaL9PmEt3AJ3BDXg2Vs+q+9Mr7EsUCcC0CEfBTyd4i5LIhMfMFFRI
	w2cLYATo+tBbwGP8/beaVd1POMw1UzFY52XF2SW0oOUCAy72pIMLrmEswIGQ/bFr/bQdV3w4Y3D
	bq5OaO
X-Gm-Gg: ASbGncs1FpAGJxhU/xafDExWLtfTZJaCwqHA3FLCwwh9tgFSBJ2jdDfSmGDET5FVmYQ
	xM+5CkCld2wtjhF1MOGL2Fje4jbZLl/r3UocXY+8KmJsINtJyHCqQ/5zaeRR+gEOHaLMe7NNCKt
	KtieQaSuGdO3W2LJywurMG7S8X2+rgoyvVwUH0Wv1EbbRNOKbLs7jX6kLsf3UC1a0hTBCoXHwGG
	eq7vp8krs56majxQRpnYDZXNWcNyunUlL3XIACP/ZFEuUkkeqA7dgqOVOwIpyPChOLP+H9wgcVr
	wCJcehjDVckGMD9B28cG1Ox2G4il31VU1n42f+uIweF2cBWJnPCz7rXtqu/whZBkV80=
X-Received: by 2002:a05:6a00:4605:b0:772:397b:b270 with SMTP id d2e1a72fcca58-79398c97361mr24306124b3a.10.1760349846561;
        Mon, 13 Oct 2025 03:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHVDSMd1Jx4tzbSC+QOIfWvM7wKblLoUpWeftkBYmimkaMjy8d/eg3OUTDGQU0ANvi6uTPQ==
X-Received: by 2002:a05:6a00:4605:b0:772:397b:b270 with SMTP id d2e1a72fcca58-79398c97361mr24306091b3a.10.1760349846002;
        Mon, 13 Oct 2025 03:04:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:10 +0530
Subject: [PATCH v5 06/13] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-6-d609ed766061@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=3482;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=bHcT9eRVWhvFNTu4y4V8eqKAF9VAGKEmNZy+vNLhXZ4=;
 b=5wliMXRBkU8Re9UF1QCQi+z3npZtlITSFh8/Q92wtlb6cttaOIU9voL9MpZDuKJggt46tAtq5
 vYzQy3k0QzFApifmXrc3JmjfiN2XHxsTI3Efal8mJBtDi0CaZlTfcdK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ecce97 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfX+XvUs91smE8r
 82bmBiHKK4OfG+O17QuocWvL4oKalUTOl/X/y1C5thNYBBwU8CwFSN+F1n5AFw9dLN6wv+et/me
 ENsqHI3iFJSLfvyLnv9hVASLrMn58kuIOMHamrxq+wsXF9/xWsBdiXupq7cTXaQaGZkUyrToOvV
 /Vgsl0rUn6U5riUxA+xlkvbfucCb/PieuShyXSUUmhwNFM1dbuDHjbTzX0osWUKuHBmSJADrLUX
 Zi8o815Z1YlFBggdTwX5U7w6tF356a5JGR5tBGTVgURC+ApWgzWUMmsf4zpyVElqYuLxt5o5tzp
 sHkrsC0W8uT2U8eZKlwPot99zysn0YoDlONa24qm4ASBeMTGUEoSCtCKHKLZQ6Ko9EDRSzsbhiM
 tlLSEyIM7IcWJ5KY8fIJqN8Ld4uThA==
X-Proofpoint-ORIG-GUID: m56bmOZnQhgUidO1NJjHXEgUvPrpXTX3
X-Proofpoint-GUID: m56bmOZnQhgUidO1NJjHXEgUvPrpXTX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 12 +++++-------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 52de8adcc4f2..97e6d11b8926 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -238,9 +238,9 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
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
 
@@ -508,8 +507,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
-				ctx->metadata);
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

