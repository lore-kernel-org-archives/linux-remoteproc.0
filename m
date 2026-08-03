Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09542369D74
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753993; cv=none; b=gySYSLReN5QE584qfULHZWjtUdBXLl0fxvngIb3a/FLziXUZtCTdH5FclqOsQAwGKqpOIBwMie2VnYG/LXbGo6SjpQ/5PtOvVdNs8tx5NP2damRMTQS59I6rSabDvwkOBLC1SeP+V45CFGvRLDoenl5rOg/P/t0NtVRf4jd5DPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753993; c=relaxed/simple;
	bh=IbwG9kHZnawTbsgRLjU97u4gzWRHSSuxX21hSvKDT5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gx/tvRsZIP64WaDbYxct7qC6QCfBkPy5c5BjcVrU0TudJLR0nMcPXaF7DoMceYYXiW+DqlkUqPbMsjc8NxIW1b7HEduoWFSzMuC285DzrhnQvhrzR1G4JWbktsTqFP76KMVZNwVaCRbEAbWmQvqYPfOlc4WPLaovsSJVxGpg2e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJiFIaIr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS9Y1ODR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJiFIaIr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS9Y1ODR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737O6VQ2211223
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=; b=DJiFIaIreUdz4ZTB
	IqNBDkRCNiOEmz6yOIouneaiIerJ+rLTc012EvpL3ajSBKngg1BmhFpZ9+elYbcP
	vy40320NkaeF9xFv0y3g7UmZszdUrur/1kLumbXXTq93+PvinpNIgvqL+uVgA1FR
	DnUDoLSRwVO9aZdrtKCfOKAK7Mwz32dJXxZ9JGwaM+mN+Zryr0H6b5tM4n3lOLzH
	23FB0W4857wUeukPD01nMB0Vtj0QNbM/T0PZqPDVDZ+lH6bM8P7Q7kdhyckFgAI7
	VDzKMdiC4/ZlPXzMguWNnBVx+wSVvF807szA3TeyzrCNFOs+FJA3IqUTf5MFNiut
	M6EQXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaa9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4499518a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753990; x=1786358790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=;
        b=RS9Y1ODRGrVKfWRa2i+RHFaO3ptC/mnD8SjN2hnEfKnpjT+lU5g4lnfkljegU52kZT
         nHbKf7JlKbLhRcrHGjKIiDRNz5OE7cqMQAb05YpbOOnXtC73AKpekFBbefnclCThRbbP
         9KODzSJe+zwaXg5rkG/dvoOEGFiqULv3Q7aVG4El+On2PVVEPxYy16RPygO6+aRFjDly
         9qqsbR3t5x+53DYN7tKbdw35jadGASvryQK+TwX5BefwVj2sbRTj1iDIw6o2YVNoZ9H8
         AyldilV3M15nZ2l5zSDh4DAniOPXIColM08jbm6mGQDu0FzFpISMQ8zmz2KeZZNHFRnc
         uF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753990; x=1786358790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZZ9yrQc+ehot+ZdvZIBeZ57GDuCcRUeTsq9WWzRl78=;
        b=o6E8JX/MTuNF5dR0/gyciEAjNsA+5KoHcrkRSu4Mf77BpBSZZcpBc9RQAxH09eQwN4
         MsfNKBC6JUoWR86d4KSISpnYtCLX+tup2xEhNqpmWyb3bJiZ12YwSBxGPOyF0Y98ZNQy
         6Qo2skSKlPMEirGfOuzfdv51xoWbh4AZzG/SYF9Mz4S91qr9pbCnsYXbxFP3zOii6s9T
         4iNEfs9b7J8K7KLRvx9BZqtIx1p1K35VQQa/Vgaex8lq59hFsBXqujZxy0mcbL3vrSz7
         7htmvoND/x5uuk3Rg1xgmDcGl1UM+pKEUdb5EGI5pR3XoSc3+CibE9OVAyV8cbI7JSrS
         lVpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rot5aZh6xWY9noqvz48c8XW6IMq/ZaqnYLGv3plQYlZ7IkNXt1j91sfMfiaHqNovPLjrofRKP8tnBw6pEK/sPJC@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJkHBW7wjxlQSp5ahLMPjlqRg68fDWDYLCCpkCYp8ozqeUbQU
	uxQsM4mmOyHEGy0uTOknSuye8LgV2ZyEIXEQF+lGxrnhYck3+gF90J9oAPNVgI10FOMUJwYEAT2
	3NmyqnH9CPJOEw8rh9HKeUzA19V4Y6f8+pZybgcqxSP6o24wAsHUvn2UK1eaoksyuz3LshT+QL6
	4Fcjcf
X-Gm-Gg: AR+sD13BNJLlOe/1vOuPvV7ROIuNdIY4DMJ2z+NEisPFDTfes/oGnVgL7uNI1mOxJmd
	L0VS53eou1xIzvT8RolwgLPpYinXiNNkL9nWcq2IU0Ur/HUrxkZ4VguoDL0W+HnxEnzlSWnUoRf
	RzLANi/rfqxDSdMUuiN1r5A1txxek2iOlAdlL9v02qkUaFR8wH4eVFMTPFKB+u/VIV95eF517G1
	vOhSSqFG0NILDnYQx8RslVcxj/TYCWd8JlSOB1GdJGXRoNT4zRGWY5dpqyoL64Ap+J9b0h9qGjd
	5bLUU+dF+vxlmIUXG0Opcx6VU8AIA0OCBddIbddm/0GBoaf6ndulseArET3xdVkbELTH7GoUtW+
	AYTR3wAT4K8wO/9yVYQvqulajuPdSvz8eYQ1GiNGG7kfwD+IajVMj8N6VYngyMIPM79lCbM2BD9
	kBjVJT3gMzCzEp2eyzRMToK/fNT020Sg==
X-Received: by 2002:a17:90b:5143:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38fbc506b07mr8368083a91.32.1785753990352;
        Mon, 03 Aug 2026 03:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5143:b0:37f:9ce2:348f with SMTP id 98e67ed59e1d1-38fbc506b07mr8368057a91.32.1785753989966;
        Mon, 03 Aug 2026 03:46:29 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:29 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:07 +0530
Subject: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
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
X-Proofpoint-GUID: gIYnjBOcSzxTGIleFRcwpfej-kAankQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX4KXB6OkIB2pK
 w1g5yt+WQwjXH5VFLg4daJ5AX9BEJLzkiztswK5wHrUvVrsI6lGpBNwaWIMMp9s2oXPLycrzKFP
 /hHtT9frXhfPvA8BentsGd2S7EOmqqV4/V2lLz7KEDBMEuTVqig3Yjh94YuslrNWPCOODhc2pI9
 agdFLdSmjPS1Lq5QujNixVL30oRZuiYR1EUpcVSrh/8HTL2pWn7B/X4Hm31WhUJyfraMGS34q3r
 S9JkzwY/e0d0SJSm5eH+V6euGhDbCV7kqqnSvNPeoNlTyf5Tj/P4X2maK5aSOiRq7MQpm/Qh6Ax
 kYb8GCL0Gr6aWKQUiAZh4HpQLgQQ0DfR7R+yC0RjRpb/1JDldQH3q+zgwuVbyiG+GBPhGiO+z7y
 v+W60L0277rpJ+1LDIoEtI+Ya+bgO1f++kSvytTJwW8t/Dqv1ywyC5iRiWrko4cZjjmGIRB/vIf
 TDu9nk1nuZXS2JXOTSQ==
X-Proofpoint-ORIG-GUID: gIYnjBOcSzxTGIleFRcwpfej-kAankQL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX9elG229BxFtr
 1U8wGYYKiWzDQ+vGBYbhw6VvWdCQz00nmfWGTkfoDQnl1bzuSGdFCl0VERabcJmCTA1A6z8vtow
 IZsmVC57rrNIJ0kiXBNBwA5WCkLv82s=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a707187 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030096

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
 drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..8902c445cf19 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -598,7 +598,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 				     dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -619,6 +619,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 
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
 
@@ -644,7 +652,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -683,7 +691,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
@@ -2528,7 +2536,7 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
 	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
 							 NULL, 0);
 	if (IS_ERR(gunyah_wdt_dev)) {
-		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
+		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
 			PTR_ERR(gunyah_wdt_dev));
 		return;
 	}
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index cf90a565fdfb..e58c76aba45c 100644
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

