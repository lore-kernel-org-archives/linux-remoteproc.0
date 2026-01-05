Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDEA33A9E1
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619405; cv=none; b=nteCcpPrK0OWX/6T83p7TDLoPv0/ESM5cy2VTLnchLK00FrrJoDlVAnbaPK0fPPb6MEd7Mryqs86Qv7XcwLymt8bMmZz60tTb+YEUSJSEDuNhDHuJuHUw6LllUyCZlerOFIRtOlQG/H+zUg/HubZ6UeRffwns2BMdWS9KcRCozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619405; c=relaxed/simple;
	bh=f3jYdsijIVBEzZgPAfHN0jwD0EYovRmBDqXW9rNphNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeTOvji1VZJazqvwBJrkUIs2mGIMBaJ/Xw7puf8eVWfIwqMzl3P95uuLtvQ5610qW6tgPZJHMlzp9IWBbCkCUhk7gPxAxYXg9zdiRHUV8jMAoLZqbhnlvKTAyYNHNzdT1stIRKByVB2VNFd//uJprAsCg5o6tC7OryZPRNlh7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEz5xDZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ftb5Ydwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEz5xDZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ftb5Ydwr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059eSxq3542060
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5upYUWOdvpOsm/yxMLoPNEuGEBTstWRpnFFFwvgaLQ=; b=hEz5xDZv0XKQ2Zfm
	p9Yk6lcZnvO0Nrsu2BcFag4Xi/ZRRtmMzbPy37srTD7fqTKhQgae4WBQyBBeB1Ce
	V0VelIEw9epD7znhfFSp/EEsX+yMF2kvVPOIPpFfwYT9WvKj2ETjKTvYB+xdxVh1
	Ldb/QaUVZb4uwQLEskFCepBllAYcYxQvwG1hGXxdEyVhDZLg3UfwDZzhltfMQmwl
	Lmw6CO9ATIAJgL/WB9XEDKpuDH5dYOoBMsRz3a23dgelalo4/BlvZeznxm3mYuAe
	8YBRepmMUP7TZFmEPZZCXxXBwo69hJdKIIuPEGDJ2fEmbkBAMb5cMv+YnkffY/w6
	r2Noxw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shkfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:23:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d5564057d0so36966395b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619403; x=1768224203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5upYUWOdvpOsm/yxMLoPNEuGEBTstWRpnFFFwvgaLQ=;
        b=Ftb5YdwrXu3wbT2NQFJFfTlFEXeYA8+8PqZxTSZzey/4QrKLyS6klAebR0RP4iq/nC
         lQB9enaxdaOhLU0rZQThFVtE2AxF3n0gkx3TsXgab7afq9i6ByegC2rDNrwHHzR2ssDH
         OLXCTOxDCxD+hgtosAsWHM/o78dx+pCohzS0/11JdCsDBZH7y4BA5WNum+yw8iioeip4
         LJZWsZATCob/ofi6DAW2RSvunUP3hSN23jk3IdPrO0hGtVY8uT7nIgwzQdFlrj7JHVQD
         YpWVooH+TDiJqYd4p5xzBsii1u2rWShGITXls1yqTCEsMcgPqLX2k2DfWKH3HQXDJ2Qs
         d3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619403; x=1768224203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5upYUWOdvpOsm/yxMLoPNEuGEBTstWRpnFFFwvgaLQ=;
        b=mYr29+uIbCn1jXh9HCgerOyHa2Ey2+KeqgYXu1vcUz8K/nAIOqLZ6SkeDRHmjhrhTs
         IpEq094HCL700mTw+2FYmNrdS1MARY1owZamcuCgFXJR25Ay0Mkh8+sQpWls4FmA4U+s
         AUREP1n8G6TL2U12rZSkgoMVt9PJRZxsSwyJ53W4YmLXJALb7eVdPIq9XeEYjoJ42TGM
         b2FH4nJrZESmx6p5RY7SeJXq++SpX4eI1UsuatXt2K8iThSvPugOGD+gp6nSGSc1Ct73
         eL7z6kDwC8411WihFSchFn4veKy/k9TOBHIUPlHmnjfIH88cnMreT4TpJ1sagY44cz9q
         lt3A==
X-Forwarded-Encrypted: i=1; AJvYcCWGYc2KPnlXoDjgheFh+HHC9jAPr2mynhj5I9oIk6dxU8sYR8h+CNIYzRj0nevg2qQ523xKQJewRrtN3vzBt5t/@vger.kernel.org
X-Gm-Message-State: AOJu0YylRng2W1MQCI4KZ56E3a+5YmeW1MC0oS6K7y78vBCzvJJqB9i1
	Ti9WuMeA/P8FDjJplhtlem+BjEJXzkULJ+H6m6qYcMJHTyFwcwifanUcDfBMfnDr936PQ/SoNww
	5PfgeltrJVIdeJg4my+0TFxwkCvFgU0Y3wzVLBXNdKRqx+ZEkxfulBO9Ck+bTwY1obRAFg8Sr
X-Gm-Gg: AY/fxX7ZsDgSkvUkyNlcH3P+15gpx5cPeSzpwa5VKUfmf/0yd7xYk/0qTzEF5tZobgO
	YBxL/RtI3DCEgEj2rUNLPGicYYBY9oge3za5y+aAZM3cSvy1DKW/7ZkYc260RNCxNw3y8eE75Qq
	NaK2TyMGoJLV7ekowGOqudZsR/ZytN/4K1m7UiPYhhqsICFm7A/1RLH9JpObh+xlJ6AIPvf9RDb
	ODjyhMhgtA/p8Hz+BOHi5lCw9OObUm3r9ivEeW3yHkOpIDHGpkrTmWKu2nTugnfrEiYiMR6mNb0
	Ysw9ohz/YK9QX6rdNUrPok8dxLAOWvEOmpZ8GtGJ3zQEaQE4YP6bcqQateTYjl4gQ/KMN5MuOA9
	5cq7Oz2tjcmzn5WxUUAFnqy7616eVU7BTEH1l
X-Received: by 2002:a05:6a00:3286:b0:7f0:4694:1c21 with SMTP id d2e1a72fcca58-7ff64cd8d46mr40843362b3a.20.1767619402712;
        Mon, 05 Jan 2026 05:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxveuL87kJNHh5nfz18Kp9QUBUrVDW8mtXxjkXMmCCGbHxKJw+wtfTwu7owSqxrLFOchDAEw==
X-Received: by 2002:a05:6a00:3286:b0:7f0:4694:1c21 with SMTP id d2e1a72fcca58-7ff64cd8d46mr40843328b3a.20.1767619402110;
        Mon, 05 Jan 2026 05:23:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:21 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:50 +0530
Subject: [PATCH v10 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-2-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=f3jYdsijIVBEzZgPAfHN0jwD0EYovRmBDqXW9rNphNg=;
 b=pgcAxwIg7lKniSHznYTYZDP0GeACkWbxO1ROZNw4iJv+mVjU/kTo9XMGm9TrJLjglxmyf7bRv
 tMA8jl6xFqTAsEjbucBIwkjYNoE83qcSRV3Z7Nepxx5GOg9yuT4UEK9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbb4b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX0CIScnhxWMAo
 DPtKDvevS6iU2UA+GBAVk97h2iFpJ7/oa/M+heCK/MQ4hz/EueJix9EEko8q/dt+4RoZo73WaWE
 b+LKaqYEVfzWfjaeJmeIEbz5rZjAevlQc3cBhWtd64Er4LPJydc51mZWgIVSqSo1C1JyUEOmW/T
 ttzwHGU8/uyVAaDP+tKNJHDgIMutAg5/GlQnArI0NmizUp/VBEVB/l7FkZacE0fdsGEhMq3HHHq
 Ro7MPWYq0KCeTkM3Mdu4SwKKQ/S/sTXiCqX4EKnsiof/L18+MdW6CQX/klToDUntgCfz1BtcG24
 894OkLadw8l42QARvJ4MnyO0t6PqQJrYN9ATxm3aYLTDYyJPftzLrL86tyQYsBBToMbadHmw3Zu
 9CfLs0GgdpWxQ3PqAlHe0Ue2SzuHJWcJZ8Hgyvdz2chSAZQiH6wQH8ygq6PEGKNcOI6p7oh3FUO
 pS4cxOAzGoRpr/yHALw==
X-Proofpoint-ORIG-GUID: 9kcnABrFkhnZm8as92mnz4ViJDWmiUI4
X-Proofpoint-GUID: 9kcnABrFkhnZm8as92mnz4ViJDWmiUI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

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
index 5ae5cc72a4fa..b298a529c84a 100644
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

