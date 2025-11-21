Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66C347BDB
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722928; cv=none; b=D905bgCNEmEbHjhHd/85amobmVK91/aeErduyle+TzAENOCmcxW5e4BNPb8cQxkreGgZIEef6pmSnakCbLcHxRYC+5AKoVld/KLYNBgmiujpDUZ7l+CBSgENAIxI8xMgpaU9LRDDS7rjva39FXNRCLcEI0IN8DQxV7mxYx5ThJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722928; c=relaxed/simple;
	bh=IjiqaQegQtY3yhs7JqPzJutmLc2QZs8lmeUIfR6pRdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+YBdtpR7KGXVhsu6ywrQ/EtlK0pePI3QvPBYBVTnYDksKcqcpzgNZO6XsODIyQMWFrHR0f0S/n4qji2Pr+0s2MwQrYt2RWJNilWdXx8mZD0NwRTpNwkVCk+kqdvDsFSyAWaQ5ZgxuuJVzmISUFBw87SuT1JF/EpiP+IsV/sUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6rDVG7e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQM7AlfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6rDVG7e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQM7AlfQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9SZdi3541521
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7DmFF0maGICStk9axoEv3qDKWocIQl5IQ1fKBTN0qQ=; b=m6rDVG7elwEoptIQ
	mMW+GVAg23O7pco0/v1ao0xkEeplX6AKiP11BOiGVyTYh37+q6/OqHspbxiOgg4V
	IZoSJ08g4A32jYapU9cy+4WOPMvUo6ol6Nemlidz6GMZEpaTvH6EJdFsJIqMuznz
	W/SNQDORiPegX/fuiWtJhm2umSFMymFvtf9MlJzhroBWp7AsZt5TMxcrOkPA3apC
	6bp+KdC67+iC1U+Tbrr5qsrgfounuT4b72SQ2mTV15C6tpcukSdW6AQltXlrqLwl
	H2VIsRkm/kW98FApK/oHX53f/5FEcfF5OmJ+2RQJUaisnE9YjXBf/PHk9wPHRn6u
	gAGe6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng009mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dabf9fd0so27407555ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722924; x=1764327724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7DmFF0maGICStk9axoEv3qDKWocIQl5IQ1fKBTN0qQ=;
        b=ZQM7AlfQC+xVSbIxSG18evus8h/+PgZ8/IIiQH0fS/mBLwdP4XrYL4UpggnBIAmiar
         3OWQYB0g68mwMlRpUWMIO/mw6Mw+4UgltOAbckyuR32gxsCRscGAnSj0bNspXBvbMF1Q
         bSKKf5eIXTzj+HxI+ESHOnymp7LXPNoNF9JspH2bbmbNbRjQAmqzC3D1D7nljDuK1Rfx
         JaVwRiZjlx9QqDD4WL4x06/G5HlD93uTMljLnFj7ryI91nLEaGGBv6oVCJ3Z+wBwhbrE
         rAY/qYKhy0rQQEdwVkGwu/bs6kiFUTYKjL4HXbBXvLvzkN9q3iWkqaq5ckafVDu0V8sJ
         kj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722924; x=1764327724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7DmFF0maGICStk9axoEv3qDKWocIQl5IQ1fKBTN0qQ=;
        b=rPcmde5N6TwRLPPrUsHt3bxlEZEjyDv1TJiOFe+uJHzqZn9I1/K0MnykesEsMYGXtU
         lALXrL0feq7nMsx/Htis5EakxeOpeuur6p4VnpOjciMXDI9hEZhIpYT0sXCHFCMNgPCb
         vkDQsx6DyVIDKJi23HkHHSepJVLMbgF5GOKbW1BJV4pKa2y5hZJ7r5SJ0u6j30Ct4c/h
         nLXW/4mJtV9fSKUOIILcnihR1FNp0pF+81PFicp2NujzQjQSaGRT5pit08L6T2FruJs4
         t+ICEdaetc4p1ymYs4ePKZ2/I14RIHdqqQ190tDZxSdNu5ckUnL7kTDd27WCe5+fNOqg
         42IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOgyklDPFAn48NtH3McYYePynXoIeggGaTZ9/6KlyDCjzbgZktX9rdhrohCKMUhy1FQ3XmYOqHpToyajgfLprR@vger.kernel.org
X-Gm-Message-State: AOJu0YykOQm+/EBz23BVw5fwoV7A/hpO/irNMUMaHrb72oMzyaBxc73p
	tTEOx9IznDu0oubLSgh+iXkzfKoYPUdgdNyKCPMdGOZ4rFYPmBRbp1kKXZ4GhifbnSiSfkETnzG
	BKyIwtJPHMo1oQ++FHKlbhc7aF2UYgrN1qAtozt7RWdiIb4fpyWxDSNibuhISQBYym+oSTfpx
X-Gm-Gg: ASbGnctKoIbrNsff3Q/eFQmNJGrVxcdUlkis86FHeFxwhG/Cn6a/gqoEQmtnKFp41yx
	WOXAyreWu9weBF7bo4s343q/4epRkDSuqqP0rypSxFpk+wOQE+W7rg0Q4TZHydDRuRM4Z1Ob8Wa
	TncoRa0TK56TBiX+wuBm8ckrLcfezB3YkHSpm3v/7ODnWEUU9/nfBqVsBniYASVeDQPVxE0qJQl
	sHPYLr7zQwED6h4+LTfAUS3bo/QNa4RdLOAUiRrXrE2gkChtiDp7lYX9+LP/B1Z6lb9E/+JSvVb
	VZYgJ6HZFInq/fACy4mTlm+wRVpT39TmXX1kqWSzqg85dMT1idFHoGOQlsO1C9776QRAKZvAkKz
	XteLEYp+3EqifucbnWv77NhplBdWBzzOO+Qdd
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr23305155ad.13.1763722923959;
        Fri, 21 Nov 2025 03:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8TqQ8NqzPErgruOgQAvjYarAEdyxmZ3eOVdNmdtur20R8WEvUdSstxIWZ01Le9GWGiB43tg==
X-Received: by 2002:a17:902:ce01:b0:295:557e:746a with SMTP id d9443c01a7336-29b6c3e375emr23304525ad.13.1763722923320;
        Fri, 21 Nov 2025 03:02:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:03 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:12 +0530
Subject: [PATCH v8 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-10-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=2511;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=IjiqaQegQtY3yhs7JqPzJutmLc2QZs8lmeUIfR6pRdU=;
 b=WneTUFZS8c/a8fbpKIZybd5p8nWJTOGDfD8LrHXN2LMCBu4tBKoC6ul86CdwGomY+Ruspl3WT
 7dZPyQiiHOuCWb8FIDu58gTp6/WO0VtKpkRCTNKsje2sQuWFQUB5NCo
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: cOQm7QpdlTxObwtw4pGt-8oC9xUZwc7W
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=692046ad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08WIqK_J-xaQODWVIAIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cOQm7QpdlTxObwtw4pGt-8oC9xUZwc7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXwoo7/mnEqXIj
 LdOzP+fJ3AZnpCnvS9rcVl0P2ysWc8stWangm4prirnzlBaoaEodSuFT8K/bTad0jL6Bw4yJkZv
 GJHSbT4qYIiG8WW3NEmT+US1ZQXAM6uSfLUNIWYLdh/ApSZaX7/HXJTXsIXxTlG7a8nIbs/B8zy
 l/HfjNLRGSqVSY7/ypxxlmBZJyGuGnqpmdBtGNQb2n7YTRjqYoghUe2LBwfQ8VdS3gLOzNYj70n
 B/08Jmb40KiGCxr0CV7Yfc3gHwchUX6i1Z1FO1vJ9Pgn1QMLNIEc/zO8mMOToGtPD/MEi+yEcsc
 Nm+CbC3UnrplWLJbLCmTn+Cl95kecfNkN1Bd6DauvlGApwy2m+DGXm4a25R6eiWimoKFPoxh2+f
 PiwmP7Mf3iVk0LnUbldUDyrQEbni5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge both for metadata (before
calling qcom_scm_pas_init_image()) and for remoteproc memory (before
calling qcom_scm_pas_auth_and_reset()). We have taken care the things
required for qcom_scm_pas_auth_and_reset().

Lets put these awareness of above conditions into
qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 90649d9ade97..84498d0d2f0c 100644
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
 
+	if (ctx && ctx->has_iommu)
+		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -689,7 +716,10 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->has_iommu)
+		qcom_tzmem_free(ctx->ptr);
+	else
+		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 }

-- 
2.50.1

