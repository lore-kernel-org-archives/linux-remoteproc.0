Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93833468A
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030187; cv=none; b=mWilA9E1/rWxX8LJegY8z3nwLIFl0ISN+nsjciE39QQDWxFblUD6LxedEhzGtXltoBY7ocIdwPHYSnJBaiIKVLZ7HxZi9uLE+0qMRC3CCVaciHStGeVJBH0gM8FAByl8aVSu0tUfMTURKtdb4DEqdeK7AsL7dd5TygkmAe77xhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030187; c=relaxed/simple;
	bh=VVCR+ENypbBKO+M86kQWm+8VtQ4AQkNx4S2dX6qeqes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrY1r4dIXRs7Xye2TYRm2ZkCoD7i/BkeHCVZaV6tmqJBfZ6JEu/UGa6juy1JpXU9lmw70dT9jriXsPPmcizbECOotiKC/h8OThgBvO0zoOY9CMEoqN/MD0O74VmV3Byz/eUefwUFIxWj74k4M1ZL9lFMOLqEexoBdYrzQd2pmsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIghybrT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyRNGeNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIghybrT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyRNGeNo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6haa23801258
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rR/0l88aDcNP0Dih5MxWezK9voyuEZTIWNeSppsdn8s=; b=RIghybrTaMxsMxOM
	8olBtVdmtx7ZA1obXqx1uNdIAVICziDnOmdDRlylNJCcG98c5eQtdDQ7nabMYchn
	pp6R4Z9BW0glPdCggwGfGczeHZKGMV/ofJu/vroAe1EpTJ+Ety4eKKos/WxDGyes
	kyO35EaxHkTONd7qsyOVDVtJbw9q1Y7XFuW/EAVLBc5gtc0yN9ei1SXWSZJh4ftR
	rLC+XRquKEjDk2fP3k2pq3n7WwjFz9DBuP1bCzpi/CPCp2/NnagbGgKH66zLTxWZ
	0npXC21vHCOU+U8WSaFMDbqxASzFhzy4VX+q102etLsihCVb/rUPA8Kq5XxMsQwF
	bQ0jbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam8qht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so610885a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 02:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030184; x=1763634984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rR/0l88aDcNP0Dih5MxWezK9voyuEZTIWNeSppsdn8s=;
        b=AyRNGeNo0DJWwKdxR+jDZdokI0Ym2rk+BTGy4u2gC3BqggP5kz5hiW11J846rgJmst
         TI32YIAPM3LlWr6XM7h6zXugh7mreVaspmUEZ7GpAvT3i19ZJ3pdzI6sDGeC0mkPl0rQ
         rio6aOaYXsM9a81/K1ItuEHnD67PJ1JHZjX1xZ1dvzh6ITttjHmUfP6jugQJ7BumVj07
         UsGdGk+8M/8KNSbtESXl6USa4vZ+zKJ5JZvSqqPtTDYPuYLSnQHHNEzPKu6fF6XSb94n
         GT+2wj9yXSwXBpbfS4i0bqwcsETxDG8394BDFfdz4AH0AXPwzEPcWoBxCRBKgrITc3K1
         /06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030184; x=1763634984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rR/0l88aDcNP0Dih5MxWezK9voyuEZTIWNeSppsdn8s=;
        b=TV3wTjGdrAmkrezEpoQjPu62JzGADpUl2tyBRrJUE665W2yhNetqCfD61L+K4Q6hV7
         oRARmkB8LkDCgZuN5ljiMP0lzuRvasgaANAZggGdf5R+dtD3aeeRmowsNUVYWc45vszg
         0gGSPSP+O+I0KhaPdoJlyUAeTqqTakE//Z4NeaSBWlBdYFXxuCziMWmlqlWkQj7JXdUy
         wsdjXwjZw1v8CEECZl6YA1JvkmsqMKFXq++7V13FqA7ChJFt+t0k0iogV2gJGtQ3Ctrr
         sqJHgAlfo2ss6H+gnlo6UT7LrQr6cegbFuWir0MePjZD6FNjjkaEX39CtGo9um+WySnY
         oawQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVSMdjSiEU90VbG6/+gWfnA2slBAyq/4sLfUl313YJxg9uywhlZPutA7uxlTIY/5ZwF6v2+LvnCsebFRbIJjEd@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmhzQ1/kANO3QNUL1ajnaTNvhrR8bPWuc2OUoXyvOiMgBiYvE
	IpnGqX5Re6rS27FE0JJVRStNbLWoTOPbRtPfPng2gvZ6+C4xZcIapzHWX2ZvKQTprMCzSghWpG0
	GIRaq2cJ0J/WbN36zLxFD1CHJgcB85bOeMtx7bmb+Ll2rLCTymdhq5I3bnPvoaHAZ3f0CRPeL
X-Gm-Gg: ASbGncu79rbRlbv+B/jtE8oqlfSrtYB1QhMai13aZzn9ShyAPwWKSRd/k1qILONBaKc
	u5qLUdj8gsRQDhGLq0cFt7CjPkdQvtn0qybHEqvvFt83XKHR7WV4xa68bJea2Vskd4zV+ZzWxIV
	dcCGnzJdOpRuuMTDLOhR4ssNWCEO7PWgd3LGZZiV/f95gO79n3NM/645GdFvw/qJtbNLQrqR63w
	4irKCIySi2PWUvBczROROwj4zQVpkqELUeI+a5AK4iZArUnWRPThJPVFa/R0pxFCYbk24nEtLMn
	1vJ0UxJOv0JyYhclPgGwdDH8ASmaAro2/zsqVnleBdYmi58mVwTN7qc8A71fOIVLXhdGEtju9nO
	qjoVCuD/reSA7nOldCdk3fJYa/w==
X-Received: by 2002:a05:6a20:94ca:b0:2ea:41f1:d54a with SMTP id adf61e73a8af0-3590c216599mr9041037637.55.1763030183814;
        Thu, 13 Nov 2025 02:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE/WGRXIgdKDakNktZ0qm+S+LvqAvui3zQTOhtcocikgATOeehZpZplyPg0+JiJJmaF0kF3w==
X-Received: by 2002:a05:6a20:94ca:b0:2ea:41f1:d54a with SMTP id adf61e73a8af0-3590c216599mr9040998637.55.1763030183216;
        Thu, 13 Nov 2025 02:36:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:54 +0530
Subject: [PATCH v7 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=3953;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=VVCR+ENypbBKO+M86kQWm+8VtQ4AQkNx4S2dX6qeqes=;
 b=cC/tf3rnrqqWy8CWtId4ou3nEUEHC8IlJxTfvNaPOg8RIyscvS9Fvgv9tVY7E5Fju0KRnigbR
 5bXSF8CNs9WDvnIx0/VvU7goRrOcp9Ll3rVlFqfpZMy/rwk9QMTf4L0
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX4C2g8inXBS0N
 UbgtezzrpA2hnhyeEKb/C2E4tlmn1B6ck10V2gevFvRysmfy/C5uMS6aleSiH07Jr4PPg0iE+Lf
 zU6wXDn8KjsXrDFnpSdnXQrTrOuW/UQlX/oqtKuyzFqZHhh+aFl/A3VqyqVLxhPi1ZCbVpiGDHK
 fNFSllWv6xWehrflNWN7YnW76mJghQjCdADiMMUmvTPGrTyQV07haJyiQ7ncPRi0yKSpEp2sWtU
 vJyb2eeYrpj6gEc5YTFTJjRUz6BZtEgUozYUB7AxM/NmwuhtTPD+ngquppMzoQSffOnHiq2vQLk
 NuMjud+sNbOMNCa1vDJc2Uvy7Lyit0/nUjuWvysPIwOvdk+QOyk712/nxpBOwrpblfMBvuUjJ5K
 vTrShE6pMf75C67nXZWyEeFbTO4yug==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915b4a9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SCFUegkZw-2WGReuCShlN50phFoypsIj
X-Proofpoint-GUID: SCFUegkZw-2WGReuCShlN50phFoypsIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

When the Peripheral Authentication Service (PAS) method runs on a SoC
where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
reset sequences are handled by TrustZone. In such cases, Linux must
perform additional steps before invoking PAS SMC calls, such as creating
a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
these additional steps when Linux runs at EL2.

To support this, there is a need for a data structure that can be
initialized prior to invoking any SMC or MDT functions. This structure
allows those functions to determine whether they are operating in the
presence or absence of the Gunyah hypervisor and behave accordingly.

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to differences in
metadata context handling. Remoteproc subsystems retain the metadata
context until authentication and reset are completed, while
non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
retain the metadata context and can free it within the
qcom_scm_pas_init() call by passing a NULL context parameter and due to
these differences, it is not possible to extend metadata context
handling to support remoteproc and non remoteproc subsystem use PAS
operations, when Linux operates at EL2.

Add PAS context data structure and initialization helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0a0c48fca7cf..e4eb7f3ab7a5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,38 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
+ *				      context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
+ */
+void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				     size_t mem_size)
+{
+	struct qcom_scm_pas_context *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..dd07dce7833a 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,18 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *ptr;
+	dma_addr_t phys;
+	ssize_t size;
+};
+
+void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1

