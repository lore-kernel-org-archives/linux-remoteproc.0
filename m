Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A247DD50
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576416; cv=none; b=mjKENDMKcb0ocx1OjBQ1PrqhgR17iCDxZkgWCUbGKUqTPdXe3ZNCQkg2iZL6Hzy8rRs/F5czw5I4DmkAReX6seDOeMjAMwF1Df+Dz1h1/U9GtHJTnMyz2MS+eRGKMtthuC1lrrifMDpQPeYrzRq1nRMN271VQvnAStTXHRt1ADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576416; c=relaxed/simple;
	bh=gQWNsHl91ilLNjTSh7RNOaVTObxlwn2h8QvMOHtZWew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzyNzbaxzZp/xYo6j9xJw3iyh9GG/JSEnQS8PUR99zdagvsBMfrCUnoPEroqFd/VkEMsMG8TytCjec98DflOtME1IgCpyWQ4AMXcXsu4iHwQIk9YgsB8fTk2/1UfUEvyrgZuWnx/Izc2pLrJH7N7GY54dhyQf5T6/+Lq0jteXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heuouaUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi+K8y6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heuouaUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi+K8y6R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UI9fh41988252
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fg2lzz8NOqj
	c+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=; b=heuouaUFx+1y9s1txSMyYBX2793
	+9XmG9DbsQl7+fAek3Oxl1IYXrlezi83ftbYckPWYB+45FA7e4cjmm1pOOGLgQV/
	n1SYwZWu2Zroq9WFAjALAskcA+drIYjst3ev/nTFqFbLczIoo543wj0AcyW4qgmG
	KDfsMqsm/xrHXz5cJqHEl9W+vHWAaCdd9cBYgWvyY53hYicZsTAkgPOTQO4hY2hm
	kHlc9I4a//rcmVEIYWrl9u7G8NL1R466cQR81UqUUJhDuwy4Ie7o4GxX1DL0T1DT
	q2yVSR0BQmDfoevMdAMqNfnz6Uu3ZeCvYSSe17UFa//+wamYJDRYdTs2Peg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc458aty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f71437218so941024b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576413; x=1778181213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg2lzz8NOqjc+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=;
        b=Xi+K8y6R9tKYntFJBQS0hMmuZyxuwOk2UjyvawCnguvGJzYCkFytpvKXEKo384a7vP
         Hv3nrG0YJ7NNI5vE25qPjbV9RSeUESJr3nWtdvvxWpWAPjrdeL0xiC/QLusyOAX+4NSC
         oAfiHiAv4JwKzJdKBSZcFSOc1Agay8nfJFXunqcVHHLKs0DURteJWtDQkj4winb9jJFu
         iBbK9HiHuMdu8LZSd18w+KTVL3vczk50fE3+8u6vv5q7e+x1hMp46ceyXBnrNHmrn1Y6
         owJfkivOpht34dgry5uVPLMbEsRKOE7SHiAhbbGzK5QoIla1PH1z/Ufn57JiZUVgIQFW
         raPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576413; x=1778181213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fg2lzz8NOqjc+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=;
        b=DGi/HHNEM9OY1Ak8SZtJqRcOz/gMTkPvbO8l2rxyHkRnxJFnTVExV3cRVkg+cC93Dl
         XVNjUxjyTLaCUErhidSP9OcrKd4hLQzB8b1W3G2hmhQcTzMb2DoBnoM24smRprZysVNB
         xu35NLdqCaRwSQmgtlw20jgVNpNZ6lzJLfflN+y2jlnPK5dlEAZpyVwh78vnas4WKwnu
         Xi9XpuA1/ijrb1wot7E/wRivxzqvIqoDZloYgK7vApUx+eM4jBbXmllBoH12Mj2o4JzP
         +tfF8AHGkTn9DfDPPbDTzO63Vf8SnmxFPLdnhJGk1kHg5t6BoCFgJmPQKFSuf2A6JGue
         SUYw==
X-Forwarded-Encrypted: i=1; AFNElJ8XVNZzuJsHzOr8TqFLh6CTuUmj8ajdo1vNzENoasU4we0ro784EXCqCAKLGsNSDLUipv0etEk5LWI/1aJNVWTq@vger.kernel.org
X-Gm-Message-State: AOJu0YxyX5o0l8qVO8VilRFjjSQwSOINWTzjp/dzHyWB4uZlRWxWBY18
	y2hUj7nqZ/TIoMD9aNVtbDrM/oR4BPlJPZnzmXjp0X2UN9Ls4+K8knJpQkRn1Chc+4czkAfjI/O
	IDctNsnxdRUUUm1W3lqvPH3M6JIn/nBUtLaTha/bPl9dtqG4JnbLGKyZi1qD6hHpsJOdC+Xyk
X-Gm-Gg: AeBDieuVQN/stJMJ/rgmjUrfOhB3fLr8L1lIHQP7hHLRyCpk5Yyjs+TaYN9X5Q5ofGs
	OamxqHXtJkD42EXMJuNL+BJex6S7vevmH7KumBTTfzn0xBeYxD0Rh+u0qTXJxE8CpeVU97tGPVx
	8eSmgfzguZhg5T5QG+cThJkKu2QDqzH3KFRPrcgCaj5vkwnLSnujYylfU3IrhKv74y5xxgruhul
	omBP+1Mu9uAaudySTXmyUBYXcXCkwh/X5PNdmPkcMDV3NZkl/gotUVbbHphuqDLQ31+H31SrXMe
	roPbF2MShWsKqGYHFqnffvmn4VXZjSJvUaXreNX+M4HuwQoXMRqdjPN2RDPzxkPzwl9uEZz5sa+
	rXE+c9NeF68R5XXzO6/urYRYbRDxWDOw7EMetRdMXeLYCbCpSSvllDhXN3X4=
X-Received: by 2002:a05:6a00:90a9:b0:82c:9c90:58c9 with SMTP id d2e1a72fcca58-834fe06049cmr4393899b3a.4.1777576412666;
        Thu, 30 Apr 2026 12:13:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:82c:9c90:58c9 with SMTP id d2e1a72fcca58-834fe06049cmr4393871b3a.4.1777576412099;
        Thu, 30 Apr 2026 12:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/6] remoteproc: qcom: pas: Fix the PAS context creation placement
Date: Fri,  1 May 2026 00:42:50 +0530
Message-ID: <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX2m5T6rvIKHfC
 DXPgNY2G+1D5ZQ+gIGms5rrkj2jrAKyUyOfBn17XMasjSliNNEr/SLMrWC2NaH0eeZdg28X7FSq
 KxtWGOYIgRxHlLyCqzE0juTFRTVEGRNPSOsTxIM6+EuKrPP0yWGdBDp4BSK5n33pMaDioSHvFz8
 fseXiR9/35Q0+wtwrwvaILfPYvtPWG66jzmHvu7Wed1Ea41suEMh82HkwPCX/WbAw+RKChRrUir
 NI+YnN+iBroVtIvjyGwxC1H2wuT05up6NwuQf2HZyuLr6Vj/6kIRAcsIFBUwvHySF8B+19k+Zkf
 L0/eCkdsYIemteGVVCTphS0TJfFzqX2OhfbW/FhmfxIwh6mVAU+g1FYlLlPfeAJjH+/vKAeYVvT
 d46LKgT+MQMMTVoghMCz0IEILYEzZTF9hxceWpr3Dp5KwGBWk8g4WGIulCo/jlW0RWCADXLOLQj
 vrjxbTUaRbvQP9I96UA==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f3a9de cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vHqpxYNXqBXYHKvWcGcA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: A4rcoE7_xhkSh-sIR2Ldnq4UeM-MDtnx
X-Proofpoint-GUID: A4rcoE7_xhkSh-sIR2Ldnq4UeM-MDtnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2785d19408d1..a64fbf7225aa 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -620,6 +620,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -637,6 +638,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->mem_region);
 	}
 
+	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
+						       pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx))
+		return PTR_ERR(pas->pas_ctx);
+
+	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -654,6 +661,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_mem_region);
 	}
 
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+							   pas->dtb_mem_phys,
+							   pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx))
+		return PTR_ERR(pas->dtb_pas_ctx);
+
+	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
 	return 0;
 }
 
@@ -835,23 +850,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
-						       pas->mem_phys, pas->mem_size);
-	if (IS_ERR(pas->pas_ctx)) {
-		ret = PTR_ERR(pas->pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-							   pas->dtb_mem_phys,
-							   pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx)) {
-		ret = PTR_ERR(pas->dtb_pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.53.0

