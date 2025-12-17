Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1134DCC7
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989315; cv=none; b=nV3ySkF2RIeeyB30ZkeX71bQUlW7PAvECSlGMMMyEV/VcjrFL/VA+4TSe1ORwlEyjPNE/rBQ61RwRlHSFrbBVnDXXPvHPuKeWpBXCdKxe77WYhwJomJiRC8RE9tZX2tfRi1FagxzrPAHuHr+R+abKo3udwYr7qPjhRriOFz31HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989315; c=relaxed/simple;
	bh=yBYzqc0S1JphVHuD2j55BlKNRj4RzOO+Sg8ufDQtOo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lj3iCyfyys0u2e541JyRhuBnyLkPB0+yyxVsOx5m85jh7oY2RDVmH3kYDzXVCgA4p9TnhUMbqQu2rDTtJEvNcqYgWQkKMakMD1sXWciaBOrJOCEyNSKuKlywv5D7nIe5SmBiOzoWwrtqAerM5rtdhXPQYUe7TeM4xLOBT9q6IXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyIBGjY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5xJUTbX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyIBGjY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5xJUTbX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKn6p3329725
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=; b=cyIBGjY7ANvNA+F5
	LJrlVHP63kNG7nisScP5ZdNcrl9T6qC/Hg2Rz1ucGlj4RwZ8vZxqQzm71QaaGd4O
	/3Lvao4/3HXaQR0PCA+uLMWS3o4eFzYbqNfNTuogdUAM2rnPwldVCQy2iGBNeook
	60HcQDD0Qemff/elvDJtKKAWpdNyPHAvgTrxFEIGW56gkYSKqET0/XU/az26LoxA
	bDFI1RUMyLCr5KdL9FLYwZ8SONt93f3lZ2YlP8bE8hevkWRioBDVfLk4epmypFEg
	KgxRHYerq9hs/NJfO5jroqYcWwGugjlSe76gfX6DIVARnKtZF7HlEn8X8JFsJm9b
	yypnvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkj97q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13be531b2so41964735ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989312; x=1766594112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=;
        b=N5xJUTbXD/j9a5nnRkmfZz/FfWclh0BWpqJ6PVYGUjvFiPTgocdU/YEHyzcbNoQY3W
         4Pvgbv1nSE/X/9o1wJ4g6CJytmyKDkumj3qUdWOUX5WGLhSeqIcuQ3SRzqPUND7lnnbR
         Bg+lEBG5YukZfVhJlLm+xrmDFeCK9E9/xC6GvuoKEAKZUUGziUwtk5Oq50Cr0xdkol3f
         yTkTbG/dpHEpnP6/DGyj2RDQzoIXNyefBqBV6sZlNXxmVf7qB76lRlAlY6t1Gs1u+OV2
         crL56VboI7Ar0MjWeUuxoSc80PaGIMJvyooEXbH15DXYHH7qq/Q/NRDwLFvk9eIza9P+
         nD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989312; x=1766594112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=;
        b=SMY8Vxx2hAD/l3Rgc5jnLWcOciwNALpS9+Mu354E/s0dd0JjN3CtOeKS8cuyYZmnO7
         TKbhHpe/OWfL1CUJ5gbjQNSYDYSVYv2OV2c/+DU6p4ZpDMQTk765WRQ64dS7fpodYbkp
         dpZwKbzpjLabum5iIvVXTjbf3YTPC6BpsBRA6zbFGVNgGNVLTduLo9IC1WwJD3+mzTFr
         bEDTJhvKa0tEwV9utOFBDvc+t1FES+vNoSuIhLF8pXbC/GmOlBlE2KphghBhAfCZdEp3
         aTc6JO2WfHVBATBh4e90JQD0bmALPZBlg5EQLQduIR5XnST3BbEgrgMTP7Nro3nPfG9d
         sXSw==
X-Forwarded-Encrypted: i=1; AJvYcCWmI9f0lPwlIS/16UiIOTWdThHM1vxn3m8fuy7FuabjAgTYZfhRsPQEykPWFNC7AkLpWRhj11fr55c+eCclW5zd@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNX8E9CP0XjonB5W6H1Iff+hrjJaj2ULc8xudOQzcPVjHms4F
	oKSs3XDQq53FvYztttwfpPOcIGfXvJfWJ6dZluC6hEvs/eoYHSKbAnma9nm8qy4zE3IcNuvHPT5
	0kElg5V41O0hDeekZ51I+cJCZ//x7OtTeoY1vr3TovMEAxgJtMzbpZP+npJVoB9tIKPDw0hSZ
X-Gm-Gg: AY/fxX6uWL7YpWx4pgboODmoHXAFPpEaggZLY5S4+VkKZuAp8aJ6AZZgpxO1Y+mfPm/
	Aou94BFwpL0Hjrs/sdaTWw+HbCqqVGpuBhJ5dP5nTrAh0hg2pDEmywqfgkOKapim/q7g7EtA8nS
	S4u6sdI/s75C1G9F8GfjKm69WA3NxTnfuFsgQAHyI09PmmL5T1Dzr8qbtovv7oPnTCURWFd9sL1
	y0qtFFIFRW5f7N+LnPNDtIoQtj5qHig+pb5Q9FDWdHsrUT7rrSxwnINfzIBcdsDn/tNmx0M7DPv
	sWcz1ER3+7E02jTf+bXzlsP4U7oSGSFE3AgNNkiKb+hfKbfTnxHHoq5/KD5YhrIvonz3+I/+4DI
	dL6alQ3/XFklq0ndsE56vLw0PtadWbpYCdsYr
X-Received: by 2002:a17:903:3bad:b0:297:d45b:6d97 with SMTP id d9443c01a7336-29f23e3618emr197363775ad.14.1765989312029;
        Wed, 17 Dec 2025 08:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu76/RdEU0SDBR8aBaXkqghR90u41/dQnfZUGn0J4HlRjXSeRxIKQx+zyA6K+BSJUGHSMFJQ==
X-Received: by 2002:a17:903:3bad:b0:297:d45b:6d97 with SMTP id d9443c01a7336-29f23e3618emr197363235ad.14.1765989311371;
        Wed, 17 Dec 2025 08:35:11 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:11 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:38 +0530
Subject: [PATCH v9 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-2-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=yBYzqc0S1JphVHuD2j55BlKNRj4RzOO+Sg8ufDQtOo0=;
 b=/2jf6vhjy4QLGEOUszAhuO/B64Iqi4w47ebi05Xomx0kqSrrIt2AibMsclR/gJU8gCF/b+VKt
 sPH2d2qYjiJCMwLNWI/qf5tj5R8+TQ0ctn0KvFVsmp6EWCXAH1faTHK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: A1EwsE0HUM3diz3pZLLvMNMjJ__mR4Ih
X-Proofpoint-ORIG-GUID: A1EwsE0HUM3diz3pZLLvMNMjJ__mR4Ih
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942dbc1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX3Gs5x+hT2KiG
 QNPMPmREr7ypltw2sKHFAUEKI8wDMnGxvn0XsfeKdt3bMycV7r8QqPPLh8//cVepJSwb2kFELm+
 m+ZJWiDCDyihuO8OH8BoZmYQm4Rf7pvpoW6gsUvPoNlyQaoUQ5R2RvopyVG1JNuFKZFRueseyhz
 ksaPTNJvBkACZUd5pZdIfk+tPWQoti/mpN2K+oW6aBFoKRqGbv7hxx67P3RgAlxMVqgT34uaCaK
 4mo8gEaGFSdsn0CkWsPjQE8QOPlch4B1KrlHnrKlp+JgHEMrp4cyz4pXcu+79qbKdDD9GT+/MPR
 c1dkel8wPJQNR3MvmTzRot6L2G6MG1yPbdKkz7h0H6zoEHkYDqqXtVUDMrS6k8anDbbprJUQcdo
 fyzPjtOqYzLMkjBHKHMoM5/KK/q74A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release.

Lets removes redundant assignments.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..6461408c58a3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1

