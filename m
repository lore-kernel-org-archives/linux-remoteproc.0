Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401512EA156
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855786; cv=none; b=UkrKmefDbuXAF/0s5OILngEd228nZFegY1YcV0XANgqeYOUm3AHv3vBhr8R+awVTf/+F9TAsDOU6TcqrtZO3U8vNRR7ZTJ0VgsHbW4Nh0C4vg/kwMZ2Ej57W2Vl/U4T/zi/PRsb3ABNEuXKtb+1yS8AnQJZVYLW/9S4PlSkPLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855786; c=relaxed/simple;
	bh=9xHPgyydOeXweGUGYLP/L8fGDVmLTdkNMJ4AMabbVsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cqa7rbwnGpaRePJfdq7nFZpa95tKpJNqg8hgoer5c/4juo0qwQ9iX5mjK03ywwGEAhKdPkDGi0YZ8neseesmT4b81PDdWCaMhvQ17UGV7zutZdhxcXR/AbuP1G6uCZbEG8bsoBfVHI5OFx275TX3P0WgIPpL4ZaRrJ/W9iXgcIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6elETUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6elETUG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET51Z000445
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxNeeJEXNpPeJTacph3hwU9D6rTjPEzDWfJFAW/Pno0=; b=D6elETUGB4FEA2ve
	v9V8DudIneufWVfS3frJkzM98R1AoAUzuGk4jK0GzFp7xqwrQKiSwWzCvB7AI42p
	IcesIE8Jfhd35pK93rjlXmIpJE2dsGitL7GaJ7GtPdNluth0Tz1bTt7DFqbFvPqs
	fV8SriVgyhakGxzUsZDZ3c3kbqfHr70080eck9S8fXxBvkjxNMKarZOyuEzK67yv
	X0KkZx2/9tUtIaKNuGQWo2DcrRs6UGfpv6Tuz/Oz7d+cr34qsPKOTne21uB+arkF
	7oa4vQlbZ3au0l3Vf933sXMz1i32/rrtyWd0kFLaptU5O5XRr3Uv+vOHKjDxLWgR
	uMDsag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgr0m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681642efd9so63169725ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855782; x=1760460582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxNeeJEXNpPeJTacph3hwU9D6rTjPEzDWfJFAW/Pno0=;
        b=hYSx4lGB9SEa+tQzrn9o9HTXu8OpCsBlO4FnmaPmh495/SvqBuW6IBSxZ+CuY4OHU/
         BsSZ/bXnwuxwxyUFrtt642xOBzkjD9bKPImGWjk6yy8MW5tUQrQEhnbL3XElzEX+ZdPl
         wJZk6pbZWIoTHWjCHXNRRYl75l7ZjADn14NuFmfi8qsXKWT+pz2cpsQlTTJe5vY3ZN5i
         4xqPqOiLeJS7h4M6EyHoB92pkokJE9rSCnzAIM8N2AwgiHq0EBlT/MsScaJvNQ/yxP46
         5k+m05dw69kHEXabDzufkYQ7AwdsOMW4JmmsWJ90xk2/yjzyGa/UB/DXjap22Khxrmhy
         eLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSKMRmvg8rDPkZEIiWOZnv1A9cBxwFVfquZUq3SiXkA7yiGNMYDEk7a9WYIqvlybrxMSobvCPoPpkFswuZYTG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/t0GgLC8UzLEGsP4iSUN8dcp/7670I8dOljyfqS67XOqPUM+R
	73M6PmcD9MMZJEzimFr3nGsCScrJ/odnTZ9m7P54llRcb3s44bEYIwsP75FMfCIV9k+gn607Fnu
	0NW5TtNqYKSnkAZMKmq9DL7zgXWxJ/e+kM6ZAFaxTEO0pONISIqzzNDHudI3BtazWSxZXSOLK
X-Gm-Gg: ASbGncs++JERzzOUgD+hH20LNJBNpN26Q8zygiX7EyQI8vhnoPjiqISqJZlIXZnXjaV
	ExvP/ZJnhCxigk7JWyAFbv5qiO9V6al/hPHPsgIb/h/wF3GTVsXbBo9qr7psAP9kqupyhXxtWe4
	KcC+V2fC390zWdwsm4VdcGzbPl+VIXM7yeLjGCAEXsQtav5mDGBIyfZpq8SBa1paFrLMfglFsb0
	0poQwGOfxA3TWiAYaSXgQ2DPtwzAkiB2YWu41V7Bdnu01WOBV8cSSVawL+OUjF0EbpTIsbU+PPN
	ZcWfdalS0dashnUu67VEiuqdDY3r6eioQc47I/PTuIqqxqBHfJWZ9WhJBYguMdxKjMb3dBI+
X-Received: by 2002:a17:903:2c0d:b0:24b:164d:4e61 with SMTP id d9443c01a7336-290272b27b2mr4396725ad.13.1759855781547;
        Tue, 07 Oct 2025 09:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4ojBOTf4hVzlcnJUwx3Xx5342YcDt22x1MRR6j2P8Ub0QP6gMv4na8Kc9xIoK/FL1oCbYuQ==
X-Received: by 2002:a17:903:2c0d:b0:24b:164d:4e61 with SMTP id d9443c01a7336-290272b27b2mr4396425ad.13.1759855780958;
        Tue, 07 Oct 2025 09:49:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:52 +0530
Subject: [PATCH v4 07/12] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-7-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=2863;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=9xHPgyydOeXweGUGYLP/L8fGDVmLTdkNMJ4AMabbVsM=;
 b=VrZ32SCvIJGeIMMpBJYfzH1o5GGbYqNyMoNI4YMe/smiKv+k3VJ16nVS2TakCuuqjKkevo5LW
 HI1UfSpKyOpCoaBSor8MRCK151+NSib1r9s3/zsZMHkmxmBJOkOxH4s
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX4LY75m3HGOne
 us1phThteetADGWNYueRD3hSxDGuDGjc2WJBNPfq81GEasYerfGDhcSTserdXeXUs/6rUrMkypy
 Ru7bPoguocfM+Geuni0OVdJrV/6OpnyyZqm/CVehVMmfkgBRBwNm/ZCpXSNd2kMi6nfB7uyhA8t
 G3/R7Kuvk1qExFR/xWKwx1qAiKCELPK5z9wlI8XGYBA5ju2TOv4xIcYWg668hcUTED1cOGAxjyk
 Ev76UAo+GSkoYv6fZo3G3nwlsSuJnr44Aim6iRXYZ/rt/l5YIb4w3f2mzYg5MIt2mc+05tAJf90
 c+iPdt5jBcF9UPLvxVrrfMM/iB0NbxqaoaoFpwMvq/Mta7jOH8x+XstKA/oYN/FtYDXhTeeNwyt
 mUqQz6JFyveMvuedVfyVdUKJTl1i0w==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e544a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XvkCMQ9jN2oI-PQncDkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZJwnhaVyMC5z9njG7LBjw1ZkUS_HY5NB
X-Proofpoint-ORIG-GUID: ZJwnhaVyMC5z9njG7LBjw1ZkUS_HY5NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Simplify qcom_scm_pas_init_image() by making the memory allocation,
copy and free operations done in a separate function than the actual
SMC call.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ab2543d44097..b8626897c8a7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -612,6 +612,37 @@ void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
+				     size_t size, struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -633,17 +664,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
 	struct qcom_scm_pas_metadata *mdt_ctx;
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -664,23 +688,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx && ctx->metadata) {

-- 
2.50.1

