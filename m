Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C733D6FF
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619438; cv=none; b=J9K7CiDv+Y54TuVYuDdUC8JJOXZJSAxd+nmziJ0avOcI9pOTZsSZK9SGYY54Jtr6vQLRQGbYIMvAMr/nc5tzyNO/ALLMJU0DC9UCYdfjF1Bc7PjlE3PZnef+sPdLEZWQhsZqOvwgXtFI48Qz4ukq5v6W1HRhGOUt5Ld16VgwaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619438; c=relaxed/simple;
	bh=JHAyLsFhkDEAcfYluzFEJIJb2NWskgIjsHullCrZs8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSXuPDXu5vZdwBEZ3L5f1582KMCFyWus5BDnnA1EV1ersTQu3tRTfdh7k/Y4BWnvCoEF0VSoCbSihqfST2scqAgwD4inXFELfvNr9EzWpkJXWEUT/ehDqCiQNZNq3+Q83aMMVXG8TkeyaDqbXk7Ugyvvna/tfyL/ABUqm5nnnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caMLtLHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIu2Wi/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caMLtLHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIu2Wi/5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cjuK610316
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=; b=caMLtLHOTNpKuUfJ
	D9cwyhYWq9VFd3HNwBqVa8jAHof3kTK+/zGYWzvHl63pRqVBTHmAWtjdBV7fsssQ
	slCoUQ1IlKYJaKr7ZFuYlRHiK4Q9yCZ8ivSN9jtSjalc6SkD8e06WRo4FIy+Iw7n
	Vjb5cAmvjikp/Lq7sr1UDSxYXuadcEytuOvlm5dQdQnaV9HHRfCVkKnfIeAZh0zi
	JkeZOEcvkkWWwIKcRTn3og1OCp+KudfF8/Mby/w5HLOJKdI+kZxRXHsGbElyiOQQ
	vnTE5sfTLkkIQhnDL+Xbt0+gib9mtqXvRLCN88nLm56oqBoY9gGmWDckSexXNggZ
	JKgZyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0hka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:23:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b90740249dso24888748b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619436; x=1768224236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=;
        b=EIu2Wi/5M/zCKcVkVTXYGtaA2dwBSAmH0KOPqNAY46uKNZLqOq4I6JMQixGbHcrxR1
         QDXT0hQVEmqhSeW7FUeZIF7bluZPCUxrB5XTbA2VdbnE5oQ+68DamvxDxg/glljy4xed
         vD2iYbo1r0hc3mwVZ+JtNLzn2Tf35eO4Nmyl++lYhLK888enwl9orjcAeLOch9kaH1pH
         8nAG5ON9DF22/w8F1qcJnqza1YyuvDrH5QPDrLBM93O3qDkndr8rm7b1dwKeXCDh4v/I
         abJYw0R+3lHTjJmonau67nixnOyOhlacZqeZwCUAPPOZporfItVqt/TOi9p3a+nIw/tj
         B6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619436; x=1768224236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XRXEzbpmZoLWVEC17zlGvTcHTCfFUbZ+n7JXj3Kr3u8=;
        b=peZ9QOU1qQLpQx6ZftiMIfXuO9uP5QycqpsbLcWv6surzJgSpnPoEyv5OW0lW4eUCj
         wD+0kiSQRzEEZdDgiTie2mf1x7UTKnpfO7ZPVNv/qqXJd/HM4kloEEoQVZSKQ7niqQCb
         wUEpF8zbTZ46koIe2xKynUqgzgSdHEVoCIpocEd3It43ZgdBQC+HTDDU1xxpCEFicRTG
         8BL+WskntoqTpCBsiodBbfy1sdya80viSAMSc7bKpmA8EktsfjAp0/bm4VZ0MyvCyLhp
         lya96/CJ55QbiUYxPhwDEg2+lz5ReMA0G/Un+wjnS0CxsOK7i2j07s0M7b0mv9UVvt9G
         bScA==
X-Forwarded-Encrypted: i=1; AJvYcCUs7fGHospweSHMVdmpIr75Q1utm31sw4CR4xhO+rYZ9e3GwBweJrIjqRsYhCeZcALCOzwsGVPKf+MOt9ruz0rE@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqc2hAHBvdMzRSZaYLatMBSpYVbU668vrGEbsDZ1xBGRYZ6ak
	y+V9T7NlR/bpXI7B/reCdTgQMNdWW7hD4KwvAa1xnH1Yr1AymgPWlapYzTZ8PLJ7dTvcDvAuE9O
	oXYQUST1NqujTY3P0QCndnuYQTUoXbd5KwhSwj/4+14E76fQJMwolnQBg48YYeM6N2xsa4nEQ
X-Gm-Gg: AY/fxX5a2l/A9Zm5BcYFDyGV0gX5DR7hGx7p0Z+L+GcXDi/IVhSDtGpniYJrGQ65Ett
	xeGwSrP+/2ZR9XWs4eS6oobdeNeF2d67NEyJC7TAa3qZ1WS2pqaSJMuOyRllcGKri8sCvfiVlQu
	ThzFDRUPjlaiJlcxcxOvwWPw5Abujege6RAWN4Xw/q6iZ66ywwzsRljC0hmiSJpJZZFQrZu9kqA
	VPFTVrSup6pEMQfOZuRAqvtlO7sU2pjZhRU1uxyvTU9ckY8j445LAI+urme3yxNGNG7taHZMJ9A
	KHahB8PAXxmWA3s40vZJTKaQ9NcdqNqW8O9oI32QT3vju4G8C+c93TKE/R7Mfy5VHa0hQmjSyY1
	e3kXzic+b2dFMxCm23i4lb0J/QDZa6eLMQOTR
X-Received: by 2002:a05:6a00:2a0c:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-7ff6607bcfemr39160878b3a.41.1767619435825;
        Mon, 05 Jan 2026 05:23:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9QSNQ45E6pm9WIqKpv7s+2aGOeq3jGRXUnf8Z4LGYwWh16ZrKpdKTPzYTLY4yPkjlXQ2rXQ==
X-Received: by 2002:a05:6a00:2a0c:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-7ff6607bcfemr39160856b3a.41.1767619435221;
        Mon, 05 Jan 2026 05:23:55 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:54 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:58 +0530
Subject: [PATCH v10 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-10-022e96815380@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=2509;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=JHAyLsFhkDEAcfYluzFEJIJb2NWskgIjsHullCrZs8A=;
 b=kWlzfyRrhgtOfbGUFcndw/B5jXC3d47Y3XmyPjHijUUFyBFDx8qnq7TRIeVSXRxf5NkAzWSPt
 F+XObqnslRaA8EqSIrb0Aj/e/EmFnAg+fqbWiuRAl35ttcAuIBoPCUi
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: LzqzD12Pptb25lBbGXuUl2Lk2UX1myIk
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbb6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08WIqK_J-xaQODWVIAIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: LzqzD12Pptb25lBbGXuUl2Lk2UX1myIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX6TpyMe5wfDC2
 ncs0FdolrjPdSoCtnK0+pwy8/jluHwWHyEYhGC3uTkhlVX1YUDh+WQ1KrDtyDLKG4YO/yspMFxz
 +RsH2zT5+hjl0ClF7jZH+9yIBtTnDsp0E2kvbeVQt213HuLnSxUd9/f1Kziwly3ITJnTLHBYCs+
 O7C5mU5vbaWfo7Hr4/iURowbYRmkjM+Yn9ANN5V57+Qt8T2AdFR6+X8Rnltm0+UYx7RVIDAwVB9
 kPalqs3Ftz7XQ++wphBGnx114yoThOdIB84NyToGcQtgiZbs8VthDxZxGDMhxviaIacIIvUw0Qz
 YKDD8JaPcRxVYsjSUB/7x4xaoTrwU1sG3HUTA3yANHTmOsVHiv5nYlCt/z7hIq9TsxUWhkEHDxw
 JJIHsgS00ckSYKoz8Aa8yz0+/3EmmQLqb2LRluhwMhI3Z3qhzfVNYG2lXsBgXJ/0u3vpZ79kzKN
 0+FU6hMttruYu31lWNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge both for metadata (before
calling qcom_scm_pas_init_image()) and for remoteproc memory (before
calling qcom_scm_pas_auth_and_reset()). We have taken care the things
required for qcom_scm_pas_auth_and_reset(). Lets put these awareness
of above conditions into qcom_scm_pas_init_image() and
qcom_scm_pas_metadata_release().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 75a57fbea74b..9ee673193301 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -623,6 +623,30 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	if (ret < 0)
+		qcom_tzmem_free(mdata_buf);
+	else
+		ctx->ptr = mdata_buf;
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -648,6 +672,9 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->use_tzmem)
+		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -689,7 +716,10 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->use_tzmem)
+		qcom_tzmem_free(ctx->ptr);
+	else
+		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 }

-- 
2.50.1

