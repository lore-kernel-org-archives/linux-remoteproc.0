Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321A3A4F25
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984354; cv=none; b=Swm1bRDv/bkdfcYbcCCiWbjQrvxmPPU91eWcFlwidslA2hGJKQIDK/MVL1qEw6XYI+9kmeR2K4HxQeqWFaS1bXN4wWMSiIdbuNkxPgFSOW/A/PAqXhdCXbrVxYvmk9bg2MmR6hF7yt7lIotJ9KWWT0MPhRqZshHrJNvZIaEfwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984354; c=relaxed/simple;
	bh=KQJqSTR/6zfIqS+06NLh4hO67qHmI3N2AKhVRiFwbM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYMdl3JCZhpx/T1587XCEsASXh0C8X27ZMXdnx1ctVVMGBZ+QwLhOGdGxsUbaK6TL0JV/rHBGRRIaivG8yduF5mDndwxCWDAtC0nhFF84J8GKyEWS21oZMk2n43ibQkNh/wmyyH+tebcSe9p1wV/IzyFfH+usVAuajqMQCbPaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBTw5Ka5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5aZmqZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBTw5Ka5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5aZmqZJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdKWo3882884
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JogU91I7iT7
	9hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=; b=oBTw5Ka5Auo9X/Lros+yZe2goQW
	+g+94a6Q6IdJHVVllk4PO6WW0+nY+4NDrUD/ZXAmW1DgsuHxRDvqDnd/WddMpLeu
	TdjBcJsjvwhV3H3NHto3R41mHrME6/g+VDIn2c+2OHezR1Qmq0y3dtBMcfRg7YUt
	0b52ubrDaIdRr6GFJSt/tmpyZGIzRTt3s8pQpwFPZcr5b6+t+7+kKa/zoBkHwCsR
	oAMHs4DmVcz4Bn17b937hANFMh4hcp+Geyvb+Ixpi+Ap8Fn6oDPpf4ZLidRgmu0K
	9VerrDGNDxcBwbCpJN+DHCzsck51JQBIfmVoyBFrRXEVmfVCrMs1XoeYSew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89utb4tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so137431875ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984351; x=1775589151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JogU91I7iT79hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=;
        b=K5aZmqZJqfthueSkTp8Y+ou+l9Eh/HAoGjoz6Kkn+PZWFuq31K1BTynaqC3P8T2wNe
         UhIbPRbAF7ISIGbSLpAUOSvDAkX0ahtjAgkopfdZORGEbhUkbcmcbp2Yalif/L43fUV7
         gVRL65we8ZOlosa8/PEqD9Gfh11Jle+rxxn4KBEeTBuojdOtcRttHYJbmAJGTN2fOo4b
         E502nJui+kT50Tp4Qzh/5q+cZ2d8Wh1wyw/ZH8i9jL0f685DWgr5sXJZa/F8cgvKBOjs
         9I8xVVic+rk9DYurMfuhYJdy6QyVDfTIY2nWCekmcrVmIyq2dZNJ1nSvhpEvb8KEmtrN
         X25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984351; x=1775589151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JogU91I7iT79hZ5xYUAk8hEb43PrGjv9a2H3IOpQI4Q=;
        b=TwrfqGOFbbsk0Vks80+3qX8tW2J5QRgMt3lkYGs5DVKWQVg4Uc40y+rlp/RsZ+iVpL
         WgxSZDRL1h4Q1huDo0IKiF1yGaCyGW8LrD2nm+Z4uGh55YUpNFd8v6hfDM+YfabCDY3k
         EFLd4fiKUxEwIxKcuv8kEn4bEKibFNIrIreEHOVh506/GRmJ8ibaHVgR7UpP/LHni9GY
         DesuQyWvb7S56LUu14Hm4ncEmjMsIZdOhXUVE0D4KPRP1cFr2QHYho8r/PjWk0QuEAji
         7P3Kii3FsfKUkJA1VdGVGta842MGRHxPthO74rV6m7qJMoVFltvOqO1Ztw2AEr3Sndo4
         0ukA==
X-Forwarded-Encrypted: i=1; AJvYcCU6hrijJ03vSptih11hHidMdZCwvVpdJ3mU/rVpvhKIxLDY8wlvRVvvQBkmqG8MVEAk74pt6+QxW+BajQU+2ryK@vger.kernel.org
X-Gm-Message-State: AOJu0YwGta2FWA7FQ+sJivbnx3vK8jNwmnvFLJrqlN7lZT4tJW9liq1e
	fAkJQ7fsWB9E5zk9FO6jApxRFH8Jw/w9THJrvC6CWjSiTU7z24MgkvoNrh6iqQsJZV6xnS0t/qC
	TtAKzmi6NwDx9fa2haJWKNzmzvTVPVijxIsn5wnCJ3SW5esbq9It+bGU38VvInujc7rCxdz00
X-Gm-Gg: ATEYQzwk4Sfw/yn6xO4TenVR8WkibqkwssFzmRkKxIs0TO1a93zv8U5kmQiTg2yTe1a
	/ysJZdg4kPpUNVcqVohR4EsqVkLZlNzS3beQ1b1vhoJoZYLq2RzRNC8zT7CPh40GHFgiUHastP9
	UnK/7s8jaTvOqgadToTlkcs0XvxgZZ1lAcwmJXQmQisRPfDJSi0IzN8qdQTIYscpLN4Wfh1Anlm
	g0VZhYe4Uf5H2LIkVnjplL2RtDZ2G3xB+zzI5jftbJv6OLbIr0m7VinMcCYlj71uSJy7DuBlPlp
	WeMf9ssxCvWJEQvCTL+i79XS2odeduHvlZfnGQT/NGNh/fRZDNiiExco8pzrNWhYooQ+uFBdDBR
	KN4LVXvOJGXw4135jvqIKWAfRtyQfurWcCpmj5aBWtbLbGw0m
X-Received: by 2002:a17:903:1a88:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b269ade174mr3550785ad.2.1774984351428;
        Tue, 31 Mar 2026 12:12:31 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b269ade174mr3550475ad.2.1774984350758;
        Tue, 31 Mar 2026 12:12:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/5] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Wed,  1 Apr 2026 00:42:08 +0530
Message-ID: <20260331191210.2019758-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
References: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hgs89bO-_xRNaLkV4jQOahyJOSO9aKVz
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cc1ca0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FdsSGlRMCwIuTpVkA_sA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hgs89bO-_xRNaLkV4jQOahyJOSO9aKVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX7A4wAltxkqtd
 8WrQhp/WP72ikIl+rmJi5GHjkNUH8vlbaGiSpqzcwAesnQ8vWf7gVBnT2stOXTvyedMGjdBKOOP
 geP6jrrgquunQwRilHPEOmI/k0C57e+luxXNMEdxi7OWl6fIUlwxHhQKrvDLI38N83tMMIs803P
 0dJ3WJCKUVC+zPsnRj1nHVFXwhf/ZO3jWCUDiHcY45jZ7MM1PvWudRMs+W6qZWDbZcqTnf+eorb
 E2ELWfQn3viQb5Q2fYEGPaYsN8wbGxO4cLsancfEGCiFOidEUCxhtu3rhuMq5B97hQdN8qBWqpJ
 OYZXkiDj8utIcyxZMwBx2ZBx/osUmF8yvqPQJl8F5Er3rT5HSto5hHT1BvRR4KZA6HB8CvFodqU
 LwWzAl8J0Drjl1Cji0Jgyo4oJcZKFYhvKW2E7V6M7AwXpNun/aAhhMClRJVinbRE9nNBvMOa44Q
 +V2tVbau/uyCaRlxsjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310184

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: lore.kernel.org/lkml/20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com/
- Split the changes compared to v2.

Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
 - No change.

 drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b957bfc86cda..4768e5b5e350 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -624,6 +624,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -641,6 +642,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -658,6 +665,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
 
@@ -839,23 +854,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
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

