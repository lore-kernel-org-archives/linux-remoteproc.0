Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9B33A9DA
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150736; cv=none; b=GSBgtoHHr1wDMtCYomERdGZrDRWqbH41cH4m7ODA56wBfslF9Fd9LHnLq651TS4X5RQHKExDFbke4iAfqipkdQ6D/UIAYZTfigea3+X+x0SYZNEqNTc+dD3f3ba5RiXjCZ0eOK5m3sdDEGS2vrdHSA4DQk7LjrYjyW0fYmlJ7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150736; c=relaxed/simple;
	bh=qEhVOURgjmKZcofjoKjsKX5vda8WZAM1vsEimNH/fEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3f66ZpKqZEQoD8z89ykEmyLbNVZqC5QO1dQF81MRphBnxVhJN4tGDTqHH7R39+hFcbM6sl4BNhUbtrqX+vHVdh3f2f9wsHzweXpaIkVzuXcin+bx1QGhQYT+vrDVoSGFMZzzASVo9iddMnFZQhBZPE8ji3/QyyJPZa6x12+uh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvqnY2jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx+VHYBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvqnY2jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx+VHYBq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACamii790143
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qn
	sJgHmtXg=; b=bvqnY2jPazi/tsvLcRN+V5TDWd35xhqyThTI9i2IBOgb46XQJ2H
	VETFqvFMo5r6jI7/FzQxeWxty/h/MPWH2opLlckx5fC5Z7xKcYWplepLR28FpzEC
	KbTImlZGL8vVKnYvYt1+W/fzov83fPWHrTQc44ku2zY5TIxU6Zbw4+wH1tuV2E/q
	p9Rd0LD7WI+QgrMa1X1HPhSplUAH9DCGmwx+p8D27KNblywEckzJ+vbGxl44QxlW
	/Ov5qCJ+KLSvVcE6j/qnewd/SQIoGKfJg3zMVNqS+LIC4/NrmOt+BtCMKEyaCPWh
	8woaU2J3JJ5u+PAfc+Pb4SfOTx98qTCJnJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekv4cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso61260633a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150734; x=1773755534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qnsJgHmtXg=;
        b=Yx+VHYBq88HivBUbjrJkRlrA6n1VYBFFmpLwlcYLWJZZZF8x3KBx5iz6og0R0TDJBs
         ZzAiEQMWq6mVUJplNIYUBFYbmLt04j1IiWG0D8/n4Jn/hC7dSOpkP2Uv1ZMRyxDxbTLH
         f1BVICD8jzKtyOjMhbRofGnwa/aGR51NvIvsvqkVSTy0vLPoj1RQdmWZEEQQTd3uv/N0
         KXpbSHInVX4kPPEU8/+yQHnLGML6P/sUmUB5kcl/tgqA1jTBili51BcpGqPUfx6plkBc
         hACG4n6n4voXz8H217AqFaCYkm/Mlz10BXS5njL7eaVy2woa2RwY2GyW5RL5L6L0sGzq
         2Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150734; x=1773755534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec26YDNl2RQt9urDzAThYSRYy4h33GcE6qnsJgHmtXg=;
        b=vJ9aFoSoDSbDeigdzZarvIaifyBwTQc3JKNqqyF3/F26kWoe8pqbGxt6Q7GnTbB7H9
         KPL2hkLmU46IPn1uXm9op43NxfbnPb611zjCwZoU/G9RwhDkgXPfgsiLkX2Q3eAc/w9Q
         j2ZH3jJY3VGGjToqU5Fy9JYM4NiOMP3ysZEEPvb3fx9kxFxddpN2aK3Mr/Afp7JNKC2n
         1Bo5HEju/g/gRnAkGFW9MBi+o9iL1+JOKFJClcHU5BbGpXIIHljErD09GV8cZavAIIgO
         TWEISmMqZKG0zxHZXIMX1VBM9YqI8Lnx4JYMuzhvxDbE/DOlJJXInLEtm2Mrwu/yEy27
         qPGw==
X-Forwarded-Encrypted: i=1; AJvYcCXMcyDJN8rBe4THPPdM0Y+A7jkZKxUGavYoVEoRb7CmoiOavrshVMiRJDW79uCbLd3L7fruZgYduXZDidXxWTUb@vger.kernel.org
X-Gm-Message-State: AOJu0YycrRMp7Oc76SKTwFphb/O82P2VTa5F6AU0mG5UAG3xIx7UaUuB
	lAba8TWo2qe8pth6r9tEdfKgKr5ChOURJjd1XIuSvlcTl7DYVcXzcdT6C2Rbi/j0+mOORp5Z6j6
	tmUoPvFePAhZJHnKwgdKXI3b0rKuHTNhwkgwnAwULqaE01+HvPSQECaA1FZEdhd/7q7duiHwJ
X-Gm-Gg: ATEYQzzbPY56RRbs52fxhZxJXScuBztbGE7eiuI1ALg0709UIJfAYD4leyKyptGGqbZ
	0XkMmR30pOGw6o2g42jUeEvVsz6bkunuodQoxKIBDU9xwf+1I85eNZztWmxt3QurdRQuC/D483F
	woINQgLTjFP23AV5RwzlPscyxN1S+o/4Y7+xqOSTLZwFtuTo7QoUOb/IFn2vFaplVpSwLDEqE66
	5GGNJJuuwvggVCyEPo+PvfI6c/PVqhwiNypZF0RW0vcpW4ETfiFXEi3QftbHy6NBEuZVudbauqK
	BP4ad1CKttXq/CvU/lPZAlymnD7uwSf7hY5bs2ceKyEfUb2YH8GMiPmUb8whfO67cgDX1jhk1Qv
	N+jWf8Y9RJUpqcxCySUPnUhoSD/7q8LVmqn6wWn+UwbUq+zD0
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-359be344cbamr13628217a91.20.1773150733565;
        Tue, 10 Mar 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-359be344cbamr13628184a91.20.1773150732920;
        Tue, 10 Mar 2026 06:52:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4bbsm3333149a91.9.2026.03.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:52:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Tue, 10 Mar 2026 19:22:04 +0530
Message-ID: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nWwZ7R6vXM2ROFRor6vamKExtzZ30HNa
X-Proofpoint-ORIG-GUID: nWwZ7R6vXM2ROFRor6vamKExtzZ30HNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMCBTYWx0ZWRfX15YchKPn//t0
 txX3x/jf9HaKEVjOaGIR9itdos887oALAmHunhcjm6uN5FMURw6VYrQX7QBPfsd/amCEoYE1Rua
 gkYBJhguI8iowjVBT//Bcu9ri0ogBtJowHEwMCQfTbGIpAnApKmcG7rwGNq0zuAc4p8P7iAV0Ej
 /oEeoSBXTLC1ir3o+cT+mYzOBrizrA37sL6FohP6n8ZzzRL86nobg+T1cah6J5tjbDYFNrnUlYx
 6UeTWsJ6fyuRLSLVNRvp3GlueQaqkw1nvtvrndAJbonVDIL/2bRBxiIbizY19L6NSWr+6wabXMt
 Uj4OHnc/AyvvJm+50OFbCOYU15Ma/CVuTe7uHTzakpvYIdEwHKAMaFYQdlCVFeDu89jiL6g4Z1X
 tCJek7+Qak4k7H9CvFRorT+Sv8WfUIfmm8WgtFR1e29AG2e+YXN2gzDxp0fWX//kRoA+ZaPhy1Y
 ishYQ6nBati9RySyZSw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b0220e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Zzg8c1LOEvFJJv0PgygA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100120

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location and, while at it, fix the place
where the DTB PAS context was being released unconditionally.

Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
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
2.50.1

