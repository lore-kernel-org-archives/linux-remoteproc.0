Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63329DB8B
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 Aug 2025 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501171; cv=none; b=GlE77CpTEiwBCH2jGsOWXsdED+OI6Lt0bgB4rvekUj0h6IURQqu7rflqLrj4MHhWab6IDzIqahOx5vgch/B2z3P188RjJVmT2vTLWWfm7wpg7Y8N9df1hsiUk3bZQ6qL+U8h4iVW6GoxweOmDTfs1/VGC6pBUCbLzsBKJigByqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501171; c=relaxed/simple;
	bh=ISijb1E0+ZD77bkKk24Ne4W33w2AVxTmXoDiNWMIs5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFmafOuUFOAPT7dmda7/VGAbKjJ3Wc8fB0a40MCoNLbSsE62ZaKE5KmtH3314uchF4+KZFpYItxKx3ImTl4/ppYkbL4JPX6zlpREW/gltsMTe9zNVQGCSAOA4Jil6UMPJvM20SBvA/Sq3p8zZ6Xk6SYFW9peawe2Rmi56CDCqOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1ETTCVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1ETTCVE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576Celtj019350
	for <linux-remoteproc@vger.kernel.org>; Wed, 6 Aug 2025 17:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5V4MfdEEJjF
	qpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=a1ETTCVE3M5VttGfMhCLvribLSA
	V4YlRLkXvHdLKyegh+w89ShSkseZsFeEU3LABX5s/QN+a5Gr5l9xBneU8bCPju24
	3L23tP2zJUvKmYeqraXw3oBhtCpPf3rm3LRZtwY1FkHHKQtu6cyRjj3atDddp3EQ
	zm1IIko37h2pG/INl1SpHLGs29wu7NgosGTwYSU0AVGiuSO5H+Ux1Dc3MFr9Gwt9
	B5FGrcZc+1WxNsOeA4PnhUXLPGNSHjGAlkswAm5cueZziRrEh/QHb6EB2Z6o/4yh
	rRrJkhkD5+sSN7CcxrerbMd4onb5CxSMJtOe3Bn20Qye74m7zuJylCDNgqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6uh81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 17:26:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bf8e79828so274303b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 10:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501168; x=1755105968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=;
        b=QpScC18DTm61p1P27Q0/YHQ+/LHUid7AyfaCuvSWXtBpw4UaXa2rThZKaIiEWrjzqP
         kc+AnRdInu4eFCOz9guN8Zrry4qrqh+pvEiXgl7/XcSa6PhLB/CPi4dJzRfnaJuC87h2
         NEUNCEQBlhSxyFRCsu+OQ0G//wt3q4FMH+GI5x3apiw0FtTguY8/eNcaK7ufPVjsM6OE
         SJzRpgpX42N4HCv4W4huincVVBh1SMnfX2RytT6y68XSmYcubcNm5xatjpZYYYk/TTjz
         c3KpCe/mKIh5y5ypM2XGGS4J4aovzGgjRQLw4GtDeKZIetI2txjSL6JyY6odENODpxtU
         qgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuSz1uKfAhpxKSOwem+SW1fPlAD/b+2dSgDL3Ia0R3L0r5Je122IIyP9IDm3BgsgWN0p8zg/CKg50OEC8mWi9C@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSY1aVanC9e13fOSrXxyjd5rrTnhdnumDFT51MXN+xoQlnV9c
	YwDnyS0sy1T9x1Zm/lGFqHgUDDdLJkn5hYTjZFkfr8Za+LrCdoiTpfyI/L7xgNzrTo18zlvFWQa
	Q08pSE2YBwfFgjOkxM4lsfdcBYzjw8Lllie5Iqy9H/xlf56jOEoE3ltQrJo6bytakHeNW178B
X-Gm-Gg: ASbGncullHkPILf7SdaqloJ1E2R/CVHr/kqLHtjV4JqFrYMC8k6tFhPcQ7Af1xy1I1J
	Sc2GPbjOnNN20CmaVHJ6yOJe9hFInUxNuELJiB5UNnfVSW9vNYYL0IeXTTqCdV2CJvJXcwORx8g
	gTCzYG70ghOATaJB93Uso7AJAXVU2FALZC/joSZX3z5qqfGL1HfqqjxO5b/ECW48MgMFFzgn37v
	JiA7+lMqARuqDXuSJ5SR/myNYPnVobbPFc95R1MfKgwnrTefDGp9vdHkrDwh/MjFJbp2/clhOGJ
	+BzsNx7rKZst/2k9w3P5D1pkkZ7wXSVSOUpJEppZgReqECe292l/uMrwVVxCAkOrZVQ=
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844978b3a.23.1754501168292;
        Wed, 06 Aug 2025 10:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJeF+hA3Sf4UAVGOsX40s2DjOot938v+1PjGjJpA2MdTWEdlqDKL/EvOlgI7sVXx1RVnBAQQ==
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844944b3a.23.1754501167795;
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:31 +0530
Message-ID: <20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3fQDWGahLhHu0DmvTGxL1xAgdzseJBqw
X-Proofpoint-GUID: 3fQDWGahLhHu0DmvTGxL1xAgdzseJBqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6EeGloIWKahw
 BKml1NbCaPLr8DRrwWqcznPQCTcbyAFg5022SYD3U1tYQfs2mb+oRm9J6t6kn/c4GK3aF37UWR9
 a9y90yulXJARs/NbeXjbXZ7z4hgWvEdgSMfVZp8Bhz0KdQk49pA/W4JB428K8OdhnirZpSEaB6O
 78DpeccGglp7I45aRi58IPFQ/N8g0DfIzIzWlRBbEz62Km4cuvAxgrMQdy9WKP3Wye0OMaGNd2b
 eOUPZ0NZUj+b/PQGueG95KeMTzaZMiBlG3GPPQyOol95bV/sQ4TIrdEXmF8oRIA28zCNg0jIUVF
 PrBZvpsdQpAwVxxoKp71S8NEO66aTXBN43b21NKPWubycHdtMi79O+CqkFP+8GQpk/KCfEUNoNA
 pZ7t3q56
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68939031 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QQi8RNdjS96tJPzaHcwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 145bd1374f07..8210fb3dd51a 100644
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
-- 
2.50.1

