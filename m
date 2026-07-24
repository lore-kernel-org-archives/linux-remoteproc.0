Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403244C514
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917764; cv=none; b=cuxWKKyXXOk+1vXkbE2SQGuEaGU2m/sHM7cW3MSOmS1mPGcFlXxn6vDe2QkMEP04fWlGooKqjVVRt3zQEz+wdpZ3L1lnAZHkY5cNBnBZAN0tsY49o+Ln0Z+3Wm+8xp3Su6r9IUJSCpRNxXjgrtTr7+rW3tal+l5sYJZ0iT/P+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917764; c=relaxed/simple;
	bh=hk/7ubGPWMHf3ExLeXN5MmJ64rS6xLpNKSDdHtjRwPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzEryKZ4dUB8XaiDaSMCndtM2qwchskCFtVH3ixatPhYG2k/wLWbjf1n+5dsQQGzZsWkMKVvRbNG8CrItwzc0ZLv9Z0Ic9KSOTyPdHXe1A+CefUu40mBQDHv8GA7eWkko+QcO4gC8GYAyUH9hmdXRLPTLh4XTMsnmMdIuCnndzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV/b68DC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rh9q61eB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UV/b68DC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rh9q61eB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqIU13377429
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nBq8TxCsSEK
	bJFCImF72Xj1Hz4ZPMv+oaYD4rv7ZvrY=; b=UV/b68DC0EI/t+PBM/GSd/5rzW3
	yMjLk+Q5k/9wI+PDj0E9XhSRLWuF/vjcTApvhfojAZpJFfAL7/Mw1pYI4Lq/MAnU
	vAt3B/nEkMyeYVHw/x1YIad36w3sUxNVetHifwTi7IzE3wbFGC5qf4zUDMEp//aT
	ZkgLu3nKI4a3gVjiQd9x1Qe84KwPOcICXzX06lWSaWfWcIpcjQejimaQeCGfd/bj
	r+0Pq9u6EvXt1vRAk7S0VALNsswrIRwvR2ZORje330UqGowq30+RZ+578D6TxORs
	1rRPD+txN1GEi0t60IS2ox0CXrkRlEfZ8X4vFN9loHhMrixJfAA14gfqBbg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj97dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so492027a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917761; x=1785522561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBq8TxCsSEKbJFCImF72Xj1Hz4ZPMv+oaYD4rv7ZvrY=;
        b=Rh9q61eB1cm7t3ZwvbiRdYMu6PdkG88EQwH0GEhUbYZEOAIOjNzjuaWgxpVj1I/yCV
         itkNuHwG8GOhKN2dD3w7z8dFf2KBSrGTs3dYbdgjOgpr5nZ/a0UvVdPUYSOjm8dIPirb
         rR3evif7AmiGZzgDjmTstW4RGwE5qRt0WXuDBiNci7cha7eQEIeR6w1D4laqUl5Zp8iO
         /gpU0lz1d4LuAONf6Wnwao36FZNWPTZeBErijqGrWn2xOfQD8EVAk/Wyq0yDXCXbwO+P
         HUHtbibO3y/bs5DjEyRQOeSdFZh/PSiW/AKhrYL4ZEt074hyD8+cmQNQuTRZln/WvFPu
         rfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917761; x=1785522561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBq8TxCsSEKbJFCImF72Xj1Hz4ZPMv+oaYD4rv7ZvrY=;
        b=QFQKYFAqQE5KaGk8pD6DutFPbrGLn6+k2K25ruOB6ZPcpeXDYh2C62VCShX2krd9Om
         Z2/44dI3z9Dmrv07t5C2jbkyYTnmHGC8MEuJ7J5H1tKSG62ZS5SlNJsa44bduwI3t0Gj
         UKXRO3+/cCea1fvCIl79KiyGAqR90ZB7xwL0jpJ881VEaO6hrVuCs/8dZeNR2sbdWZPt
         JDizdyl5Rip0yZ02SCnqxrfCIBpz9qZcsIDJ8xlKuC7IALxB3rSMmGug6Oc6GcUOfYEu
         1MwkUAZJgIRlmo6fNcIaWaTz+R02jRl7uKmEN2zKrWwKuXwMlVjnoE6tKC9kB8gvm5JU
         /AFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/6kgcSKDxSroWKr99kCfTnofKfflIL6Uwb7FUUIE2M640AfguFeuZmcrbDgZ09V0kjHP93hssfN+s27Hu5lrr@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZysQOGumd5AFfNzpO5plutw0DS5ca9RF6GPpQjuusFaLJXy/
	n10zA4u2lq981gvSX53Ua4qD8IxLwgYGmdTnJyWZDzuvE5kvJAcD3Kqrdr1we7mTuqk3jLWNd45
	MclEbd/ox99FPX5UyUbyMk8aa/eyy/9SUHnWXUlMa1nzPvIroo0v/h9dP/y25Mt0aHcXZtpiY
X-Gm-Gg: AR+sD13QfZWlowDL6WVxaC0ZFrUTk5AnQVUE0dCTW1/0AdYUH0/YhwhNxdnInBg8OuA
	N7j9Oej5HMVHGVl3AjcgxFpVD0+ML/+w8Fit3qCwa9lZbTjeGET4jshd8m6GRQx5OE3a57CwdfJ
	/ojzNv0B8w3lvuiGKeF42GxvY+5J7FpOkPqFr2sfgfVtfQKB5oeEG/ibwYHyI2dV+n9Nq49I1jw
	kRRDrBsIKgVd7lcYAfq1Pjjfr8bFtiPbbTUSJdRtlCIwnyIZxm/vKyfUFsMLf2gv/+Zf7AtGHyb
	WV1vXJL6qabtqhGAn+t8rtUCuAgi7azs8I6cRqxMomAVbB64Ubbjs425+AAAH//viRzQr3E1L23
	jX8e7Nkc7MNd2t+GFoPZ5YJnw9yA=
X-Received: by 2002:a05:6a21:9206:b0:3c3:9746:1fcb with SMTP id adf61e73a8af0-3c44b1eb341mr9040976637.35.1784917761137;
        Fri, 24 Jul 2026 11:29:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3c3:9746:1fcb with SMTP id adf61e73a8af0-3c44b1eb341mr9040940637.35.1784917760630;
        Fri, 24 Jul 2026 11:29:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:19 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 3/6] remoteproc: qcom: pas: Fix the PAS context creation placement
Date: Fri, 24 Jul 2026 23:58:55 +0530
Message-ID: <20260724182858.1868271-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a63af01 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vHqpxYNXqBXYHKvWcGcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX65lLchE0B5Ya
 QrhfF4L30vSJ0yGbHzl3AdifVI5NJm3wPZY+okmepprP1MEK8HZ834fRfgViztPuwS/DZULmRKA
 kbXRO8AJuIwGuQKambaPaHkdN2wkaV4c1AHdMgtqq4REQzTRopowAjajrGO+UJOcQ6vP6Qk7Wha
 0huPaO4cdjomCZS2xCQ6v6f/f0YexUDzfeKizWnFqG7Lalh7+SWEDgPfBMNogZPPgxKSVA3JOlQ
 WPFt2L3Z0SnL44qJKxSOVmuX//Hnp48ye0oyR9iyfrS6rOD+RTHbYKTGqDXH5NfGcSCpu1YRgaI
 JB8CP9OwlQkXHCd7SHZmxYSMRpEFg8BWhTey4az5DgTFHuQJJX3wfp6kLm5OzAgC4zLvrFGRyGH
 6Ya9ifujWaCgBMK8YUeoQY4rdHrG8cyjchJ3Bwofxd7MK/vvbnskbdqX+dRDzH8889l7bt2U4ew
 e8UcU2XJZK7IonS3Jzw==
X-Proofpoint-ORIG-GUID: ibjmPLQLSinPWmxPedWv-QynESGbeBtw
X-Proofpoint-GUID: ibjmPLQLSinPWmxPedWv-QynESGbeBtw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX2GGv6YKMHBFB
 uFUPa0RM1uepbFo0oUCifHPKYH88p9HqviWBeCM86r+t/+W5nuspXfRVH8Axp7y9ZBFj/jwe7zZ
 S/aqY9FJQW+cweni+qdQwMPXoF1o5sU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f70836cc382d..997b3a7ce672 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -702,6 +702,11 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->mem_region);
 	}
 
+	pas->pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->pas_id,
+						   pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx))
+		return PTR_ERR(pas->pas_ctx);
+
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -719,6 +724,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_mem_region);
 	}
 
+	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+						       pas->dtb_mem_phys,
+						       pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx))
+		return PTR_ERR(pas->dtb_pas_ctx);
+
 	return 0;
 }
 
@@ -901,23 +912,9 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->pas_id,
-						   pas->mem_phys, pas->mem_size);
-	if (IS_ERR(pas->pas_ctx)) {
-		ret = PTR_ERR(pas->pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-						       pas->dtb_mem_phys,
-						       pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx)) {
-		ret = PTR_ERR(pas->dtb_pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
 	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->dtb_pas_id)
+		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
-- 
2.53.0

