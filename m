Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE6257820
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397334; cv=none; b=RpIyk2ut3cKCetm5vnJ6HkHhH/X53b3AX8Th2VHUpZ4OywcCqgMsHCW2UOOSeziaB3jZFekRGt/i6ID99JjsWPuEGwq6wnLJb80HsPSTccKtbONkc54Mz7qpAQtuBlD7Qc/e+ZVJ8RMfNGmHKuByyR4uQ0pKtPK30Eff/rYL/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397334; c=relaxed/simple;
	bh=DCAkrbeg7VSOARVBAGpw8sAUXiiiJgS/ed13HN0++XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b55pSgpNMcJmX4YLox/pgYbdhzpg3Ooo9O0KhKY29dJyG9svAVp+ujpsYPXiavRJZdeb9akZTsoYxwItboeut1R22jw9Tv09mgPUyxqZlqHHuHxCadZJxeT0QNctFqIlt1iLhpyhAQCGAwQ5yw18jTtWJH0AdiTBE6brYsjMdvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrZQRQWb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrZQRQWb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJEqIk026648
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pj/BgSYMd+ehlZUcqfWm3Wt8Oa5dIWUJg+URzA82Bvg=; b=CrZQRQWbXR2sQRlC
	csTrAc+Tzb6WSJ3rjHVRv7uyrD+36/b+H+btmfjeISwA17IgiOZW08+FdmT7uShc
	6GtGEg/UWjY9wzg1eVFiczQLA/8fTBgwSkoVz3fywdekKxfyYy1pP0r5uciSjD9L
	D1+Amgvq16FmaSkssngU93CUI/E0ObW+dObh0qcLlWUNNHOZFA63PKg+8xuHUnUX
	b86CkFCMcddxBleBGiI+R7LJZOBgl3AFHAlMOm8fgj+WZbFZTr0oXIChyn3C0KHv
	IJPK8Q6mEfukgON6MGbfUe/dpnPbrz3NYMqaNaqEoExhK12fCbUR0VjLDobP8TfE
	+TUP4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ssa9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so3011431a91.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397331; x=1759002131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj/BgSYMd+ehlZUcqfWm3Wt8Oa5dIWUJg+URzA82Bvg=;
        b=GFyXyKUgPMmp+WK7XApPIqkQl4PQZl5aZ94eD5pleSYq03ctBwsdhkl3NCd7xhkEjY
         teLKO/EXMVLEoTxWEBiNy8XEoyN2BJuICU+8Aw8xmehI9vUwcpbYoYbefcf82V8n1Ovs
         tglGVNBs1gHu/4pIHb/WsEfMgsSGFy0uXuFW2K9BZV+Bxw5E4tkD9vhoFrnfb1NidIBv
         4Mb0/9NA9Z8rtR77x5ZVZ22DlSKqTr/ey/4LzeH4csOLBRLvDlWr5U/fWuCpvB6AlJPT
         DKrN7A9RdG/BSv+NFGEFFst8i9ELnjRFFoULAfEA0hXhSlBI2dnRvp1MvQwQYQceqcMI
         D6aw==
X-Forwarded-Encrypted: i=1; AJvYcCXBJ3mZd39KS4zK8Y9qfxRtjZtBEVX0FPpFfY7xlXeDk/3NifRtr5sQ8WuEooKdfUhI8WN9qTrrqWTFwmASFtIO@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnPI4VZzdZhtQ29B0kb9c0XY6sJoMInSpz2DdlKjqMGvEZ+SJ
	aGSLS8ZzDDkasM0e9J1FQ4CPjKGzcrkY7JkA/lYjYZMKbEq9piMW0YkadR5CtYP8lGhihP/WErd
	OJcHsjBleG/ILZs+RMNbNcB030/QLLBiA/jtoRXGmhpWNcw2DWaKi77gHoRdwP/Y9iCDmUXz3
X-Gm-Gg: ASbGncsVbIHLyJI71Tm1KKkbPvb4h7l33MD2XJCYNyD6UWUQxU7KPCJcGglwcMk5km1
	ZCcUGsjvyOMCH/r3i9+VCf0cW8+HuwNO1KDqsQ5sRvFQFdW4KzWUPo4vCIii+/RKBN40+58BLMS
	8Nf44DKZZCTyVfe+00PW0sL4Zpl4L8iJx3FbZvx1reOB3BcRuz8EpyPNuh4+nV2v8YU8NMN+U7N
	d543PTFzfUqmtAd9sBwPBqC1ClWZDObMYMMEblHg/c8ufI1DoTnl2e7Q3grUo+sVbz/kbyU6LPe
	dJfM7xTomhbtN+MwAItK8WtBk31jBaqCxI95+eufciU2nachwGbJiHxAHDBVcSnezD0=
X-Received: by 2002:a17:90b:3b4b:b0:32e:ef4:bc7c with SMTP id 98e67ed59e1d1-330983417ecmr9161435a91.24.1758397331313;
        Sat, 20 Sep 2025 12:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsXPhiZq+EnDOg32hHLi7TdPyUKuwR5jLj1GKkzUdXiT9NbgRKwTNf6HFkUYmTR+lRrHf8JA==
X-Received: by 2002:a17:90b:3b4b:b0:32e:ef4:bc7c with SMTP id 98e67ed59e1d1-330983417ecmr9161407a91.24.1758397330886;
        Sat, 20 Sep 2025 12:42:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:05 +0530
Subject: [PATCH v3 07/12] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-7-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=2836;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DCAkrbeg7VSOARVBAGpw8sAUXiiiJgS/ed13HN0++XM=;
 b=wTfDa8mkr3aCDv3ZpWTIWkrvMPhc4CtFWvMjvpe8YLkmi0MJc4R0WKbF0utzZjAspuKJ+brAX
 3HLYGJKKA/YCUzB2wjTKsWmAeD3dl9qnSlnl0O8VzRgPEizaKs2Sg6u
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2qmjwFoaktRb
 SHr7tKtpAz5LiUvyTRnHR5Yx60raR8XOMB4Esmum+3qtXf46acFrupeY3yYZbMHVHpe9jPuLG7z
 I02RVa/Hp/6JdCIau1fyhWPuJqg8tVvX1CpQ/IQsTO+PqvqIf/XUB6thMqrr0l9rM2xcmnvGNHF
 wpCb340UVutbsF90bWnUMr0ZZib8IQ7pwzgJ4hhteRN2rVVyvEk1Ny7eB6b6zXRp41DoEmKt70N
 kEI9vwV0QET/Yfhu0IW9eqO3lzwYqRvNAn+WqyawhrNw6GoCEDkS3kTs6X2g9PuH9q5j1Z1IGwU
 xiqAJ2qljIERTtt1zJ7k5Gmt5bOhUVd5w3t/jevlimmY042mQaqjpFgKtZ/i/8xMBa5PkkczPaa
 cN9rabjV
X-Proofpoint-ORIG-GUID: YFzgsjWWyNgQbLqVtrrHxdkfK8KNLQ4E
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cf0394 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=2f531HYpvKpQLZPe_fYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YFzgsjWWyNgQbLqVtrrHxdkfK8KNLQ4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Simplify qcom_scm_pas_init_image() by making the memory
allocation, copy and free work in a separate function
than the actual SMC call.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7a86b27ea666..022529778f84 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -611,6 +611,37 @@ void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
 
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
@@ -632,17 +663,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_ctx *ctx)
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
@@ -663,23 +687,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
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

