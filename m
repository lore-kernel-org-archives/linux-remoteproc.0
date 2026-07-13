Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4690381B02
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924431; cv=none; b=paHB00kxYiF0vpvpq7S0hAgieNxJngUQ2jK1V9TThI5wgNC++iLDZHqVR6VlqUyCKOPrEho3lyHHa+UvcWMPLZDvVjdx/fXWJ23wH8qVglaLaJzBz0qEA4/OCvlgfW4VsUAYSgVkonLqK+rT1+UTBKQXoI9a0cBCRU/Lu8vups4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924431; c=relaxed/simple;
	bh=aBpC69+QsRh15CfY3z6X/LotXnJw/IfvtS5JH0p+HFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZyUiuX3+XS7QQnZSlxV9DYGtFs13PpT3dVqIo23M/6X9chXwBllG7oRUnpZXfOVB4M2ww6jhMB+I7c9JYH5OWu1MssMsI7OVVVnFuDhwS90nseL0Wj7qHsJAA83nXlG18x0B3sPqoTCqxfvzjeMCycTWUkwr69jdDKz6IrsN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N90xAxAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J19aGvQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N90xAxAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J19aGvQS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhOZ507010
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=; b=N90xAxAxwKG/jqiZ
	KDO8pZErdEcTQrWJPeqQ72LJxS6Bdw5x7Q4eJumopjTJFZgt6duG5vZdXQH4yvsp
	Kmb42AWrkr4mJbhYCt7MUen4A/E6CjRrsh+HgbiFSw34zXeFOVB/zyYE3pRSgyJf
	HyywwwuXogDDFJLuUhYB7A8nUTzsDJgHzmPtJG2Baq8pSkv3tzxvuMagpf5m1g5p
	NZNRnRv3DbrVvoDqXjLnf9atlEmvnEZw668BXXS5dQIxeudW+d1wT4fiUYvbdgiQ
	Juco2P/64m1XT7qTysZLJMrbKMpmO9OGIPQ/A9XuAxqFcgRXHy+HzN2t70wF+FL6
	LJ8qFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8g4gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:33:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84877b362f6so4521616b3a.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 23:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924365; x=1784529165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=J19aGvQSVxCOfbh4Y/0jQzVr5dObRt/rE0fgGyWCu28XO+OVwbrVZu1K2y9Ocq1RCu
         H5f1VBGLx+Ub156F17af8yuTNDi8XaSGCxu/da9jsfUChcJj3tsdyNUlIS5AzHU+MZKy
         bi98kJ28A8Z1wDILMeqk9J/N7N7KMI5W6kEhDG9E8WctQi+OnfJwIqA0tjS4SabvSUm1
         +DpnPDAKd/MpXj/dZZjEEmFYF+xBF/3DrFpwkxJahcSZ+g+e9dVikGGq/pnyJqa6Q7cU
         dfBOvCWRq7eUtyeZfZpWprK5loSpzBw4pqZqjQ64+VGCSh5Mog0pQgUbTbykjKzEThAf
         Uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924365; x=1784529165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=bhtkIoLawlwDn71SNs6tp4yrCSF3xFeR0QLWYEQ9actYgTbKYXs/Xe4WHgjkUWYHTI
         SkEng0Wk/rFJ/ADEEbxjFucuCZBATbtIHrCFtBq8gq7rBoFHqjRSDVYvsl9GgnAgaOA6
         erzTQ7/fLckjINfL2rJZHs11DlReWYBY6HRrsV6OcFLRNzwSwzlIh2U4XzP1Y5RkbnS4
         u4TiKFUFNqwfJgYxI7eUCbv0X4CoWHW1sTlEMW7qH4CKgke0wJaqrdryPyFrOBbS05l8
         GBPl8nM3zFHFnMJLSTnq4Ws3bsucXKx8yjwzydDZL45YxTYOof/WznbUj7PoGvdi7o/y
         YtFg==
X-Forwarded-Encrypted: i=1; AHgh+RpqWwRE/CDoc5DsTHpEnlLqwghgGxsjYu3K6POJMWhnLHMMo6Vo5VpCJVGDnCUAmiFpHTHfcvHusSXEe/ixbUie@vger.kernel.org
X-Gm-Message-State: AOJu0YxrH6hOS7OwwfQ6iiRnfGRU8MTxvTa+XjlbUazd/8uwm6Ty6FQW
	/OhiV7ekxhfbCd7ClAtE0POU/4XF9oD0qbBoo+RTPKZwsQEiCu4x0JdnjoIFQqKNVv5BYQv2nmf
	8WwT99o6FrMO/+2ew1z5E2oT6gdqr1eqemYTkRzbeFzXASVifeRpycumNSmC3dVn7vVZWHsEC
X-Gm-Gg: AfdE7ckAoHwsGBQRSN36AalAq0t5toj0v/3eHVXdnTvNd3bi69lN/2tdTOaspTAWsJ8
	+MkDTVmr/DURjVAzCchsjv0KFD83sgIHr4+AsS28vsX89Sdk8AEtGjSpEhx3Zd7gBPN1qmTS0An
	srAEQGQaYvNlWP2wVW3DKS+xGWKofG7KcrxARXBHkAsWTUpXn78tH3ah18ilhcaqKY9Hx6qfEjw
	CLHq4YQUjxqGPTKM2xy//dN5INCpbnnqiLvrFGQhqvuIP60qFrv2o1pNqTAYuY2qcuKoUlHnrlQ
	YZPoFegMLxc6Uqz2DlBpwr9pbuaYyT0CcaW00zJmoVUxtajZ2OAS0CeNLWeX8HwiZZ9gxBMQ7Xk
	x0PLf/ZZhGxuOD5yzyLmUe4cc8Z/mocfHeCcnaErnBaHfR02EXKLSjdhNVRu8OeWpsVPLPJXzMS
	FQoUFEuJkNp1OScHll7kyRAtVGdpk/BAsNatLKaNno
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223265637.17.1783924364771;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223236637.17.1783924364350;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:17 +0530
Subject: [PATCH v13 1/6] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-1-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: WqpmNS41uvyV99HAEUDOao8n_LJcH933
X-Proofpoint-ORIG-GUID: WqpmNS41uvyV99HAEUDOao8n_LJcH933
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5486cd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX8qH6Togh/8fE
 eLP6rL+b2NnJ+rk+eZ6vlhdTtjSAMHrRAnQCuOfNTrUCgaeHJuea7vn0QQCyzrRW3QSnC58+7qJ
 M3nj3z68dTUp5JJ/OWGWn9Pe5tu4Dpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX/Hd3QtU1o8R+
 PGmU9eWdbx5y+QoviwXYWwrXOp2e8SZ9C4oRXfF7iknDMKC9tjngX1q4V1gGhmnREpC+f+gBVvu
 hhqUJvZEsFA2ccJZcVhh0X72RClAd28F1jtnvpyQdu8C3ZE3BlVfj7l4dci6eotJ4X6ZaGXpSkU
 gY+lnmCOWf4trt32HmZ85ZGGiOibb+Zie034/2T5vdoj9eRbMXk00bSTM70hv9Pl+QMZ7zeFhWK
 nHgkG4xX3s6Nm2qLOnKNE45KMOzHBMz5x+7WrqV5owZGjjWozQd1rsQeVoZH8bVpSC6ikjvh+M9
 wnMA6TSmaW1oKR9onJN9qSXulkZyiYUuQEf/H+9bFacchsDnBz3pO+L/H8RWmVe46McWl4eocVQ
 1S94hsTu/GDdq08Dp9iDNdw8pLUQ/xpbJk5ETdmRX/SvsjedYKUfofD2USYN/kqKVkXr839nzNI
 nyTWM60nIP2VpcfX39g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7933e55803dc..4a51d2a2b519 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -575,7 +575,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 				     dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -596,6 +596,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -621,7 +629,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -660,7 +668,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05

-- 
2.34.1

