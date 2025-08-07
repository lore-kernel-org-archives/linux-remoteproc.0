Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3C24A07A
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552617; cv=none; b=f7176dEJjC37pxoWO5x3ma1N6Iz1iUD6ykOv0/FGRQ20avFpVJnJzmYgENHoo6iwU7yypFD7biCZzp0Iqs7EL9oJAJ3UbtKm/UJqrDYu6mrOiXW7Tip31PndFEUdOTOfNuatE0rgEvE8+6VaGt5DNxgL9CR30dhwZlUMSBTrtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552617; c=relaxed/simple;
	bh=RRxiBs16r7KTIHUs8Zak5jbdXnfM3F+ay1jRs1C93GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPXXH5tciBAFIcwuIJFMds5DNLl7QNR7EjKAfVmmaxM7h46Q0JJ0mik5DI7CHvD5wfSA/4jVG7mqlhVC3bNTWcJiP9hCsWVii2gzAIHRD7X3ye3XEVB5jhF7qjHHZ34nXhnFUKh1FbZxjYFgYyuA0XWQUdCny6iI2+T66iLQsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kq23wH5D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kq23wH5D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57722NaO013283
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 07:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAd5Ze4vzEv
	wh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=; b=kq23wH5DE2+oLegmUvtX/zF+xtk
	g/FzoL6TijTXlnE32k18k+uqSgh8GeqMAlROGd8glIE9JimOn/gvrPY6p1yT/M6c
	hvUYYjy4mKzw+PWBhlybCB5wlRK4tCqB0FCGCASdh1dyJ9cLEs6wAAtNrJ2azJPT
	SKfMOV/BLmhYZPeropj9mMsLU39N7O348ny4KPgPgyf2PN8cRiTk9ExORGz8YT64
	ueOIL8NOdJKbRwlbVIpTO626RO+4buwTgyDjSliJXBp/cbm1jPai0e721awRoUc5
	WYQjTUZUMkAhiXrnLddJIHwL6ITOAcnK7Y4a4wYDy9lIm9U/VAf+qaVK4Og==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvwf1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 07:43:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24004ac2ecdso11593115ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 00:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552614; x=1755157414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAd5Ze4vzEvwh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=;
        b=Rfq6mv6Io45/nxL915rYNUhJLW9IcxUi97UG8gttu/DrAGyTORygnWOx9tykuKt/Bu
         APDAHoAApyickJUuczU54MZM/63Lx6dpImuwj/RQRQGiMky8NTueIYiNNSKN3CXtk7NC
         xVxjIvcu/jSPJ53DrX61QGBLt2RkQB+QZfExt0yikRr5UOoE2eQifVxbquVwG7lMuaOm
         dGKHrTqyqD4+tTJfd0pOrJC1KJD5hyBbvoEend+4oyR+80IMsZblq+UHAVPEhkYxi9BN
         9h96Y893tUZzeXQrB+8CABsQsu4fal4DvclOHW4JMLWSFhfZn6zsOwueEFOnTRwdCGHj
         iU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzFb4KXuv1AUBI6ogFdVfmP17GMPHXrCtFtVsvYchDnEW1Lz50VW12M6OYX9PD9Cta1kSOf5n/XOed1crSykB3@vger.kernel.org
X-Gm-Message-State: AOJu0YydXhB5vDsUXqb8e80/iG+yY10OrLao7fu/XOXXD/Y8jPh+WxHr
	VfEWVUSSvxFnDpRrrhJtdXAPvs5pCEzRHPdvfIh2PM1+yrz++uS/M8a1Y9jax+APpu+ldjWMkai
	Adav2G9sLC7P23u1d6eIsOB2B1b9QHPhcTNYtWzzQCq4CMrvIjgIZ3eiIk5Rm7AF/soKXZv9f
X-Gm-Gg: ASbGnctVueD9Bb9UnSxRM+1MtCk+UsTOH5KvYNwZHe+O6wO0LIJ+rek5R6vWMqBJyQJ
	MAP0PjZNg00A8GPQ5FHmVq8xbhVlVrywHLghuscERMmEptu9IVwHgT7yJrrV/597Wm8ZoAAJ1UP
	CxtLrKirhyXz8Lq8j/NjR3kyx0ZCt5t9qLH8+kgNjNwqKkWv2gO9UV4Mds1vIDTvFmIYgxdHtBJ
	fTw3r5B6mzQY/i7iHz1DxbuaUqkmvKM6dX5r5opyUIVu1knTwpi7tqG9xA4q254+Vgi8yn60NXA
	pGTzdmxjpW9G0C+6Pn8RwfHN1fuVndDwVtuSnpICo9fZrv007NOGf20f69/TIZwoFeA=
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270695ad.33.1754552614134;
        Thu, 07 Aug 2025 00:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmQ70xW0VJBqeSlIUWMJPARL1fYQTkCAlkasjy9//oof5xTgkO6mW9mVoX4c12poiyfQ7JHg==
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270555ad.33.1754552613777;
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:11 +0530
Message-ID: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iFOlXc8TiaJAlTgktId8WSh3nTGmgin-
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=68945927 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wln2f8d1oZJPYHCAfSYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iFOlXc8TiaJAlTgktId8WSh3nTGmgin-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5Adb7MF1+tZA
 kKhWhjtgl/9PQxlPufX6Gy3NTttKkQFW3dj+1hrZZ7gdxek1TiOyxXM3WzQDeE0WVv4ZgAiGb6k
 x8+3rpXXWFWcG3pAD4WHhziqtP0s+Ceo/LhdDc6+zu9VMGWQ52GQdud1ITPYbaMFl1Bl/Jgh/dx
 2TMWHPaB/7HlmrB6IARnj70ySqXRe2X2qqby2jFZ90bTuV5nE6pEu4Zu63eBFGGV9PT80twy1nV
 s3LyRmmkCXWAIeodJIYLUOKjG4e/EAs60qi85nrQ0EgI1MrYi94X+UFJjFdzBmx16uof3+apW6m
 wHZ+ByRFgyCqLWSvXSJxC8/JjRM1CmHr+a3CYR7ZVIWjiXB/6F+Vp5JPfCPQcyaSlav7Cj6dMp4
 biSLwvV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com/
 - Caller of qcom_mdt_bins_are_split() was modified in 2/2 of this patch in
   earlier version, bring the change here.
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 74c415774657..7522223835f5 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
-- 
2.50.1

