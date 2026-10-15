Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F53DA7F3
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043806; cv=none; b=dwm/4Jmfa9BnqCY2h4XwEaz3hlmJ/Ap0uF2+kOkYA0ZWQwjWuGUbOEEuhbUhpGbURCE2nu4mgybv31Uf8mmLMiT8LKg/kfWb2eDGP7fWmFiPYDvMANEYaQ6tWyjPPhIgWlTJZKFw9Xzqx6HvNT6oIod7H+Ci0pK3C73ng4SAcyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043806; c=relaxed/simple;
	bh=d5CKNaTVFgdrvAvPHsddfjYK7AzuQzPwzKoasTvuNGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ia/DBIhvArcKU0GLRYS/ltkbu4K6ja8BgreIGc6QX6kYyQ16B0wDlb36DH13fgle7x6yrE3mDUgS6H/56RbQF2oVFZubIMGT29GpUwvgNaSsCUwGngwY4IGlH08uUlL719uRqdjwhBQIUu5YE1qZx0oR3PnbzxRGd55mQgK2YIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STrENOpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBQUILU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STrENOpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBQUILU1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xBXC1640485
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=; b=STrENOpIyz6anT/D
	LfpB4rSy58WPOnaCH9L0+RVBUh23vYcC3Z7fKsweeSvLry+7d81fl42HfEyrDhej
	jS3Xk/UlTnLOiPzWu1JjgmEduvpBR5ixOJzvEnhhKroWqV1vQ7UGenLWyvxOQ+2j
	EFoK13WQ+J6K2Wkd4bIlOf92O7se6FiISRiWfFUhVcOVhPyOk9kWU14dCMSX59l5
	S7BcF8+gIPn5EGesjVoLD6nCJjSswrGZieVJd2GfheDjkt5Uo8U+jkSTJnYHxaNy
	QXkCLmgA9m309m/XiMK2/QjsnKSxBUP5VQUo+6VNgXDAKhGuiKY44KDHExG8JNgo
	l03YHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhgcmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so5234072eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043804; x=1792648604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=;
        b=aBQUILU1OS984UPR1cazYnLtZeD7kVmt30xUorA+LGAanPEhefldp0/34fOACw2bSV
         BGqHivgE9JJ4y9nF4mbisDKDhbqtOnFNRPZli1wBDd05bhiSrdnwUvXs10UWsgdAB00p
         +7o+13CTZ5AJFCQyfkxedBOfi3dY1sjACS6+c79ezJY11FmO/2kfBYjtxY49NTGe74Uk
         FJDYt5mEJhTEqtoXEztwFaM+DSILlTKumzCc9f8Qntj0H9KAEXLeYkCmwKIqEhPirgaM
         8XqL94MA/W9tuneZsGXGJABs9IxJ6lGtR89VNYzeanHjHTHTp8qyCvx2RS68jdeO/pii
         Ioiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043804; x=1792648604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=;
        b=RGiOkYV95E1EtFngQPOHZb0+I/y97ZvHhMTf0w/uriyuR20UQJYn+1WN2D+krargxx
         DPJyhSBJyvaBid33gPtNiLH8DCEPKoPzt3uDSK8n2iq6v1hev2hNthmfcXVzHO9n46VY
         8aNdoHstl75D5q+CdsovQK21kGeIjTM+yRNXwg7BsSPXmUa+kNe06+MswP4aUA0BxVKL
         HgiNPLTR02nfTHasz9plZxXDTPZ5ppmHBCkxLI2DyTxKozi9ZKZZIko1vOu1d+HV2fy9
         FDirV5X52jZ9tytO+JfyQ314BE2Nwjk+pBDBRJcjs1QQfX+iq5b1kVfI4utmkTHHvk43
         13zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd7VUgyezHVAihREOgJiCyEeI3INMMlqDbjDu7Z6VRHykQmThpvFmealWRZCqC8En+S/aS33yuMyw+QBQQxpUQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJX5JDNdBQndfO5yd6v2uN9W3TWGMSWo1pKX07Xey412IJKar7T
	JsywaXE2nHsUJjc4S6ZfKtIyLPysyiq+JHDk+tB34TAGRux/LKqixGk+SrCWHnUqd8COdtX/PXc
	IrgkiIqL9agxs9oVPhngISlpzbyTvJeO3DbLkDLxoRd7J7ChDbEZ/sm8yPxy6bkoNGWUy63xp
X-Gm-Gg: AYBFou3wA+SWxzD7jn4tQqI6cuRPgbwLlmfG2rtOFXKlHQhddfZpJN5v5qej8qikUV6
	tGCWdKHUWsdeGa+4gaZV/6r4VbC6uj5jSGUqrC/5Ad1QjbxAhCCiqgAlKfGb8Vse9mO4Vn9xC7y
	gQrVVuF48Ni6s34dlgBIzr1aTKWcjx4xDn8u+K/XHWjZhHKaUfbAF6OJ2KHPFZA1zyP69h2seBm
	xzMAmNAavzv2MhBzLOk+KqYOCaDXPFuJojnRl2YMr8AuuzgCLpuVXqYgs8cXwipK+AnfzsQiyFx
	TseJur67503+TZalSajgnXm3A3MfIzAbF/DT5FGL79BfX+cxWboPPKJf7aq8+CfK7FLJdC6NdIg
	LsYZZChXwbt0FEq7uKMhdczZD5Ps9K3J4CQYZ9RCXZQ78O6pN+fh7+p/ifysjnWa0b95IiehFID
	eg5Pd5xdFLtkk=
X-Received: by 2002:a05:7301:1c18:b0:35a:22a4:132 with SMTP id 5a478bee46e88-35a22a421c0mr15630584eec.34.1792043803900;
        Wed, 14 Oct 2026 22:56:43 -0700 (PDT)
X-Received: by 2002:a05:7301:1c18:b0:35a:22a4:132 with SMTP id 5a478bee46e88-35a22a421c0mr15630543eec.34.1792043803199;
        Wed, 14 Oct 2026 22:56:43 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:42 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:51 +0530
Subject: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=5776;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=d5CKNaTVFgdrvAvPHsddfjYK7AzuQzPwzKoasTvuNGI=;
 b=XeHUVgEYElpnLpWlM7K0h4VVkqFzRIOYnKRDW5guHRl3Mht3oXIlFjrMjbU8RxVuZBqB9X4Rj
 +snMoThJciwDLa+HYhXqUWGd6DshSusZPSL0g7Lrws+Ne+WKfbX1M8W
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXxpdosZFatyTC
 r1wGqZauA5SpBUen8Dyq3R9dd632c6l4K1deONrxt8Ic76kGdbq9Su5VQY3lNxrjK2ip8cGuoGO
 CBYJkI6wab32/UUjf3rLC29iXNNn1uEwgQLlDFgIKcKrP+qa0FDhLhqNEa6J0deAcU//5TJqD60
 edq8NMG2A4zmT6xwX29/g2shezUq0c8w7azcI0IjwGeQA2HmHgPKZiW9wqdRQcADCcUqyMU0TE3
 kWMW+axilPAgLV/tio2iP+uBDAChkijj7B30MhjiCkfO9vy/ds+cSXdRxgRNs/p40C/LzLol4ZN
 Sf4/sQC747Poz9rQ9QkX8duOhWniaF9jBm8EsAwZdQVJyPgBNPFK3aW9qKorkHz3FzomXyG4LNU
 +n6fD09L5Zk2UKfQFNyy7anAUcHJzM/UkqhL6+ome/eEXwwNTNSOhKT5HnrxbfDBw/87rhVRBRj
 4YQXGlxQvKcArC1o+KA==
X-Proofpoint-GUID: m-vgGIAbujygjtbCfHQ3ohlRU_fXEFYk
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad06b1c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2xi1agtghtcIHK6HCRgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX1glGs6ottRsm
 iViKFDjoFBv0Ve9HW3bU7ZDU2Tc+BokzqtbS00gcZ/GWez73Biz1GrUmWBnj+c8IrwAI4lmCtpF
 dArKmi5x27YNdPjKGiSCgE4qCXgDGiQ=
X-Proofpoint-ORIG-GUID: m-vgGIAbujygjtbCfHQ3ohlRU_fXEFYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

Add coredump support for PAS remoteproc instances with a secondary
processor by registering fixed dump segments for both primary and
secondary carveouts at probe time and mapping them during collection.
The attached-state path is for debug dump collection and does not
provide operational device recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0bce2f0d5b4a..374cafd04b62 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,6 +117,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
+static int qcom_pas_register_dump_segments(struct rproc *rproc,
+					   struct qcom_pas *pas)
+{
+	int ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		return ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
+					 pas->secondary_mem_size);
+	if (ret)
+		rproc_coredump_cleanup(rproc);
+
+	return ret;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
+		   da - pas->mem_phys <= pas->mem_size - len) {
+		base = pas->mem_phys;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else if (da >= pas->secondary_mem_phys &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_phys;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
@@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	size_t table_sz;
 	int ret;
 
-	ret = qcom_register_dump_segments(rproc, fw);
-	if (ret) {
-		dev_err(pas->dev, "Error in registering dump segments\n");
-		return ret;
+	if (qcom_pas_has_secondary(pas)) {
+		if (list_empty(&rproc->dump_segments)) {
+			ret = qcom_pas_register_dump_segments(rproc, pas);
+			if (ret) {
+				dev_err(pas->dev,
+					"failed to register dump segments: %d\n", ret);
+				return ret;
+			}
+		}
+	} else {
+		ret = qcom_register_dump_segments(rproc, fw);
+		if (ret) {
+			dev_err(pas->dev, "Error in registering dump segments\n");
+			return ret;
+		}
 	}
 
 	if (!rproc->has_iommu)
@@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 
-	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (!pas->mem_region)
+		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region) {
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+			return;
+		}
+	}
+
 	rproc_coredump(rproc);
-	iounmap(pas->mem_region);
-	pas->mem_region = NULL;
 }
 
 static const struct rproc_ops qcom_pas_ops = {
@@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
 
+	if (qcom_pas_has_secondary(pas)) {
+		ret = qcom_pas_register_dump_segments(rproc, pas);
+		if (ret)
+			goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
@@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	return 0;
 
 remove_ssr_sysmon:
+	rproc_coredump_cleanup(rproc);
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
@@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
 	rproc_del(pas->rproc);
+	rproc_coredump_cleanup(pas->rproc);
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
+	if (pas->mem_region) {
+		iounmap(pas->mem_region);
+		pas->mem_region = NULL;
+	}
 
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);

-- 
2.34.1

