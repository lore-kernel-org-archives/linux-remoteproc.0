Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD252C2359
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622540; cv=none; b=hfw4KTJYynZmxXaPTY9Y5xbywt8WR70Vzsw6sMD7cGmrfGqNEKEVb0OJuIE8/JQoAdlHPnW1fddaGOReICZERmXSDN2YdmY/GNGJnZLsGQC710OV06gtHj0+JfBpzCvfBWjg+i9NV/ojWXjjaRT4EPjCRr3zxThWu7RvJoC/i3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622540; c=relaxed/simple;
	bh=Jz5i0hb8iPyBN4hHz1WzlmNjotDeNcwA9V2rf5gcWrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGw1jxlOnTIWxiZWH5UlGmL37oy8y/vCKLblxZ8EqE4Db8nnLZXdgwWXOFUdozOMzSM+08BvAtpSVUok4W3Lxktj1D4at5rk4xmFJxPMYQ4WbrTop0I0a5+o6YlVvRR1HdVwf6AU7CDD3SrBv4GN3tz996ypNDhnHqUyi3hqPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUr/u2nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUr/u2nm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFL7og006540
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MHzX4m9djdY
	BrCYq6RUgrrQ8tJswsBpsxDwBSp7qf/U=; b=NUr/u2nmxmdVRpXNIpi6Bv/ZqJF
	QaF80JGuChksMqQWy5NghH2UKhmKs/DyGXhWImn0feeIlofLOqVX9jY3q7mo38IX
	kepnbVDMivsFl9nwsC/IjIL7rxMI3voD2/CDVL1tpyduMjPWpoHpKCPFKVF9X/Fv
	mRdjtAy50pwfxZ0vbwX+bcDaB5Kndt//uW241ypCIczKc+CNUDtrxzJVgx7Zb/bf
	0WlLgwbdIcFtn+ZxqhfgyMWY0+/oeElA2farCiWXCtqbt3PABUtQNVApONhHFl77
	2eTn+FS2HFIdzSZXtEigG6kCG9XsWmyGl3HBNFyaDF3JgJJkOoLON48PEfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0ga1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445812598bso149521595ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622538; x=1756227338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHzX4m9djdYBrCYq6RUgrrQ8tJswsBpsxDwBSp7qf/U=;
        b=Cm9dEqSdvYIsgtH0/x2TNJfzECRaVcKBuPBP1xuwW3//BGMrZxekkDmWZoFolBgyz9
         wEMe8/yKIkBA8TWZbyTWBlu2LtEsn2heuNEz+t+zC3e15bkAkv6TMzIYH1ZnAp0j1IDX
         PFXyfhia1lLTJ1Zb7x5O5U14qVRf25SxP6/pk8PC71ipmAXf7SvSyUuY1D73jacvw7b9
         RfBcp2o6HpK2FbgRy4UP67eyhgBRNXzG3iyUdr8U0RyKkTeXuJTxfa68VlG+OsBaMqYy
         asRtG9+YZRiJ/VOc7v27ZZLVGs8CDFSQac41l3KQBz7JuSBrPA6BbYnpB8EelSQd0rdd
         769g==
X-Forwarded-Encrypted: i=1; AJvYcCW+vCCAkDnIKKhhclvMsAtMR7R9sEWN3lXpB/CDr6eVf2fmYKEoMHwLMDKRrhC94ZRXIO1CMEvAEDp2OAjcCogn@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbLSYVnqgCqc5UJ+IORNDxK5FznEOuT+9M6NO/S8JMgYcMnMK
	EMsTg5JjH4u2JLgYW+TJqMIXXkmc+ZX2fAar1H0rpV+jab9FLNmtuMs0Xr1i8iUmSDD4ifRdn95
	CEoQXbK29Su/cXVAbNt6wQgeCbZBAKKyqUZk30IYLqiyAQ4o5F7MlcaG35YmW/w/iy2PuYU6d
X-Gm-Gg: ASbGnctoNAfWdjBCsb+kI/1x+r6p2GHF3PAHYkcA8jxBIh5uVDE4veApLM00yI1K6fR
	eumF8QHQaB0UjMf6lKp+wS/zq0lhm3bSfpb3joJPrdmKAuHqULNyMHt9SA6d8j2/17udM2/KHnD
	kR73pV4Pk9oqfBFo9DMQP11yQRFmkdYdIOrZuki04m4RE13fI87tJvmpsUOOheZdE9EONA2WzY1
	peYFqwc6luC4F3GWJ78o4KLs7StBav9fUOXb2IIKTXrrPIDPgwws8GhDPUkNU/umK9zcLPvJ8hp
	8DJa31SuwdwZjOo5JLoRtT2atz6yi+XmDE2CfPx19ISVp4yXNKoP/w60kj0kZDw1LXg=
X-Received: by 2002:a17:902:ea0b:b0:243:597:a2d6 with SMTP id d9443c01a7336-245e02a52ecmr56406625ad.1.1755622537707;
        Tue, 19 Aug 2025 09:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdZh+CflCKOL+J9L55ubWiuqFife6t4XkwShQjJuGcwmfkYC9b9mA7fxGUIeUJ/HsPN4t1Pw==
X-Received: by 2002:a17:902:ea0b:b0:243:597:a2d6 with SMTP id d9443c01a7336-245e02a52ecmr56406285ad.1.1755622537275;
        Tue, 19 Aug 2025 09:55:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 04/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
Date: Tue, 19 Aug 2025 22:24:39 +0530
Message-ID: <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hMehMjzbH8Y3rJ9xOAVTzGvUu1_i5U05
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4ac8a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7vI4Mn6wnVF6ixtUiuoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX2cGwsL8W6PH5
 JC6pgLy/rxadqts9APWQ6QSAuZxMkUXntIylpQsPAVw+bjJClYpUCLIfnBmv8tL8eLfapkXsvQm
 usRxhQjVzAR2vCrM6EwNFAszaDBvG4Fp9di8xwnHfUJyxH9g45oC+ubMkgDt238DcSVNFln/pJx
 Q1DaImERtnakNabzLEaNsMKUKGG3M9MF3PZHWIAx1HXAPEZYqkBy/tOqqUMEuwcZgSRYwFHq4jG
 Qbm9NI4TslfnUvxI6dNurGFufIdc4TPoVDzCsYndw/O7kYbJitYaEf9aMPU0JnpFEPYcviBvfzy
 LYFCL43/JGMqaiDBlIvCoRGacifRZFKBNMZ1wAtriIFVz8LGcAcG7aJr0/bVow/B7EgpLfxgZiy
 pUMxNKnX
X-Proofpoint-ORIG-GUID: hMehMjzbH8Y3rJ9xOAVTzGvUu1_i5U05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

Simplify qcom_scm_pas_init_image() by making the memory
allocation, copy and free work in a separate function
then the actual SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9a5b34f5bacb..7827699e277c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
 
+static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
+				     void *metadata, size_t size,
+				     struct qcom_scm_res *res)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = peripheral,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
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
@@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
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
+	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
-- 
2.50.1

