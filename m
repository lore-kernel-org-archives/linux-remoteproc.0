Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5834CFD0
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465997; cv=none; b=rzY/nUNjpBUDx2vbJuJ1Tu7eRcosNxSIYKsYmpxMtjuYPKeFfMZmRMX+sfhx1NAOf5Xgi2s70gytMMoMlYoHkbadf46JmgkCyAuWYjpx1czRKwETnxN4zp+87eFneGk3OEQNH2yyR18X555QJecuQMo24LGK5ddlbA306m8iB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465997; c=relaxed/simple;
	bh=XAfXEMmLhgt3Ev3ztnzBcZ7U0WQb0eVAm9tujOALPlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2WDenSRJi/KmCBCbzLMO0iP7OPTa4NAte92VnDJWGY3tI95Vrp6e2gg2d0iD/h6Qnpt+uLZ9vvrNm9AONOlciTX/D53EKS1H8ZxXMFjT0hd2WJM5nWNuQA9J68MCnqBlqSMy5GgLXQqVFzHDhHnDkh8zFzsLc3jzEb9YiyKLfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGH47zeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H975ebwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGH47zeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H975ebwE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH8gW2432183
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=39JVIfiZ+E3ziBmhCIG1ZmAZRfRWCK1sG+2
	UOPUq+8s=; b=dGH47zeJdwhnzdP1eB04WNnyAzThfSOxYsUjkTUzESmAKYhGDlT
	1MgIjuCLUCg+3fyUcTFQ/YPotkzX3PeshF1Zw46FmWSGvO3iDuFcI/lGggl19YJD
	HlpGujORBGbP6qUclLUCORYri5oTVc3FAjWnoXlVek0tcOlflwWcs/keVNETQb3m
	AblArA+sR3yH8WrQSs8OtHi8s/JiWUPtXQBT2kuwHLTWONuar0UNsCXlU5pfjRdM
	vypMCN6vcFCYff6Qt/DtQdy23fWMwLb+78cNqvo/3bqEs4ZDzoEGEHn7AWULgUwA
	X3P0oaEU6rYmLtb+/TwCLGIS683eRG86D4g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mk9fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so246627a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774465993; x=1775070793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39JVIfiZ+E3ziBmhCIG1ZmAZRfRWCK1sG+2UOPUq+8s=;
        b=H975ebwETuAVfPoi5CF9sZy/yjHG/Ru/0SbWBrgs24D0794i6dxIKoBWc8YFkaA2C4
         aj6v7fjXplYqONuPTutsXh4kXaSFFjCFwnHoDFeyxk9yfrrOSc+9Nd/ADrEf4TbpeHLZ
         GmRSyucdAty/nGLvfpEesh4zEz5HANlhn4f4Yzh/1Uqj6F+fQPC18gy3jGAHuVYroIEN
         09tbotiIXWGNOlp9j4a4CGFOPMg2NNgyagS2sbHcXYCQk1bekTaZEdE1dAQ49diesFst
         kVspXzenCMjnjciZ2OLSeuOgpScExdOyzyHIE45XwdK2/8yrNc7Aie78/KWwTXo/v1nH
         Ww4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465993; x=1775070793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39JVIfiZ+E3ziBmhCIG1ZmAZRfRWCK1sG+2UOPUq+8s=;
        b=Z0wV9UHOnLNV2COch2BBlmUn+/IVDclukM32mWNZ3dvYesiMWlPmp2rIW3zcv+IehO
         qGKLmtY0+7PmcQtxr5810mR1p56fv9wArsMj7o10AWFpf5a2edewcf3u+EAoWlitWpQ9
         f3yA3ktILSFmFtOy1u/fE04/r/BL6C1NI/0JhEWAPKrNFnIKxclw3G7c/eIBV/qx/ysN
         0kSXC0W4WdRCKrvU3g5n7xaqbfW+hnU05MQyHj9QUvoMMDzDOgXUk4V0w7+0TVb7wQ1D
         4hfUqfDSOG9ueHjxyxMqt0JPvDs0cfxyprmBgpRXzPGUAc/vrtgrlqmQkh45X/fGv5ys
         ysYw==
X-Forwarded-Encrypted: i=1; AJvYcCXjmDlkOsW+zZplrCGOY57Ut6e4DlW9RrZgGRx6PsnFzh5xVExx/9eZIbN6WjfGq1HsTeZ26RlrhakDHZ7OX7/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pRaUWC9q6Sf372AAyh9AHRZtMxhE+nwghiLkcl1ooL6zSDzL
	+ki8yfDyiWyXJwRc6wgUpGsQJ+Dqtwz9XDEQCyy7lF41UdUhVXOLOdPSDPInkhcmzHRrHidn5Up
	apR1I8g2iI+1xp69yUqCmzF2Y4sFnoc0AEOBjDj6ja8MO6U9+aiR/hTPW89lyU0OQpDapJ5PG
X-Gm-Gg: ATEYQzz/56JxDdzf8XB5DFjfbqarrLD9Pwh/ln3xQVhMU0BIU94T8Rhm2PL9++xC2Gy
	1HsqnHtzw4b1txSxbNnYaGjZDzOSYftF8cN02hZ7I4rrvB44R1WImdgQ7UMzArM0XcU8KjUrnOW
	4nsC6cBvo8BTw+wKvGUmnf43jyMZV0eaYcozvDiIImxLaN951CuetIdqtqzLHM9vOdD1Noj8qyH
	yv4GjUtsJLEAL8naZEwsnDTVbsABKqI1IsKWbCH0lEChwTgvNs0/Efr5udCnkgyOOKAKtKaEa90
	cUPmUyvejm1VpH9Iag/vp9/q92E1j7PLdTEDxok9U0Gl1GbkIbuoxDYEDHf7kYGvnqCm3T/4xmT
	jKcsg1MGd9b/ALaTJKHwoMJku9YzPI4EiVT2SciJ/GXSsc5Oe
X-Received: by 2002:a17:90b:1d4e:b0:359:fe72:3554 with SMTP id 98e67ed59e1d1-35c0dcd6cffmr4310742a91.5.1774465993056;
        Wed, 25 Mar 2026 12:13:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4e:b0:359:fe72:3554 with SMTP id 98e67ed59e1d1-35c0dcd6cffmr4310722a91.5.1774465992358;
        Wed, 25 Mar 2026 12:13:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd36ef9sm76379a91.4.2026.03.25.12.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:13:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Thu, 26 Mar 2026 00:42:59 +0530
Message-ID: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MCBTYWx0ZWRfX+w/89oQhBKYX
 0RQlkBlu+a6dacJfxP6tN0avvfPmiOjbESlQauykYLUXKRS5gnKHPTfQwXZ5ek+W0GtqymCKeaj
 focxvfhB5TvxVuMq1SF7DY208TmjtSnj8/y3CXFlpD/YukeCx4d+/ooBMlXQq1XVdlcZdSNKzlz
 Wzc63Uw5nEmmjg3wTVK2sSr5YxnL2O+/I3AoTzRQ9T1HysGkRVwVsHAEAYy3YJyr8nrsJJLH11M
 LlO1RqiSrq7j9rT5bZfDku99dZYMlM1jUyRaOdIy1JA6eiiVcJyZz7JMOxvaZahsF0CBPHE6lcX
 sBAk0LKiTFLTyB8g59kTjQiQ0znbcp8lmUAyt4umOLYFdEmHMPdgQFl2w7jSOuOQt0wDkvLzNvp
 lYdtyMgDKC5rUC4OtbwSvbZAK8vEQVzfJVKZhv+rVGkd/vfcKX/wn+aNNzUoHTL6KtWycT6XxW/
 /PziUupNe+U+Jkhpyqw==
X-Proofpoint-GUID: S1aRDqMxlVPslc42m412tIZVEpJEG7ln
X-Proofpoint-ORIG-GUID: S1aRDqMxlVPslc42m412tIZVEpJEG7ln
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c433c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aZQ0vRG88Y53XpRQ6N0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250140

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location and, while at it, fix the place
where the DTB PAS context was being released unconditionally.

Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
 - No change.

 drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..3bde37ac510c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -623,6 +625,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -640,6 +643,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -657,6 +666,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -838,23 +855,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
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

