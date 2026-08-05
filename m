Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C88471D0C
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937092; cv=none; b=ilCQdZUoLzRzOXZD2TxPAblxJlUnD1MrgxEAhyix4UWagkjTRNR3vAYLIcb/phHBE7/7FOH4jjXA03rBBd236g7qtEhwdQVOtKmoxqCsMoybbCTUHTiiJHqCJ7OSgPp8KRxbjTNWc+EW54QyU+4vfPI4XHhoUtVruS/X//CqOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937092; c=relaxed/simple;
	bh=OnRjT98dZqNSmeCRXSpJxFYaJQEhd3OrCpvIuT7vOV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ts4l83y5Oe7ljR2VRC9rtW7+uPjBDfbfp7OtawDJW09yUG+L3jV8UAxTIKtMGei3IfCd/E5FuovbbqdNkWbxkkSMljRveYMnWMJLCEm68YfsxJAmMpitiEdAhiCOB5b4hx/ZUBvEx7jjB6EM0QepUGlGS8BpJ4K7Xk3Tov1qV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LvbqC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/VkoCX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LvbqC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/VkoCX2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CfpN43472158
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 13:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vw8PgTmZdhvQmzo6d6mfcJ
	lCGMwMbx7pkqiQSYNZivY=; b=T/LvbqC3MHGfXDO2q1cEZVNT14owJJlJWQQmdD
	dTIaZv/AdToNu/wi3P3KUahmvWfUzzQ4sE3jOYg/1K63N8LskhZdhrKNeJVj2cRh
	i4Ysk46EasmL1oK9JdlUc/QHv/peceq/LidwlVF0y2dhWrejWjJ00ne8YrTasx/3
	UgYdr+Q5YNPxX3vM9KPvYSvduoTOYHlIWln8FgkGhzjv2uM7gYNp4qF1S6l9BgrV
	9uNRnxwuSf2pUMxMkYxuBgfEk/go2KHM3PmCFC4EDk8PtEU/aGZ6Blqr3i6ZU1aT
	aSdHye8yfniYZIpOtDCT0LMiaA/rx5BGkiGAHd6R0U7dGLHg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk08dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 13:38:09 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66898a9bc85so1276966d50.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937088; x=1786541888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw8PgTmZdhvQmzo6d6mfcJlCGMwMbx7pkqiQSYNZivY=;
        b=F/VkoCX2Uzfr1ZVvnuuOxUBX4BTMOCqi6AoEH9Ep3Y7jZHrj49gx2n7BFv2ZoPTR09
         4/VIfpHRXSKa1tL9BZippYVhRkYYtF24wScpqYzvktLFDpaFX9t1wi5xKt/s7TPHHBFp
         VJBwMCNykYjUOliq5mI5WmJL72MZedsW4WFPQw4Lj/opXEXJFG5G1hZUgJ/2jdqsRON3
         kDona8pLBktkiD26jI3jq90svJy+RSDM5EpCSCz398qaPD3pyE1YydKJnbo4QbuiS3+r
         9sll/KXC4yDeaVNy9UADAva2DVldyIA9DE475WFEoD6sD+JvtI9IWol3s9ez93Ij4BPz
         SOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937088; x=1786541888;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vw8PgTmZdhvQmzo6d6mfcJlCGMwMbx7pkqiQSYNZivY=;
        b=R0mV1iJk4otDHP0FqdVyLb797GyJ3PDRjURqHH4ZGidRxiG76TrtaJH2wAR0SgrQpv
         wNXmce6aikhiTLGeVCqFmS6qv/JlNg9H2fSWTM0ZPQ6Vh1i5VWyJDkltF6MXt1CZ0tOj
         rf0qscnxYLH3xd4nJ4Ad2Z+uDSL0A2gYSFjoEbO/hfFvyI3GNy5MbUaJR36UI4kBpfzs
         YF530Y6dQLYnSq2c/SEDV29KTZbbIO9WW66KtQMupIRLq642KbeNH+u7kQ0oyl1FJCpe
         3ojg3SjF/xaOaDUJUQqWnUywBDjErJdhXwCFq5al8aMKsA1K4KEjX2K/fo98d41FF3Vs
         kVRw==
X-Forwarded-Encrypted: i=1; AHgh+RreVXK7+dEF283yaLNehM8ktghkyD4Hi+8+C4ghRLVSm9nFe9kTANebia+hpbfF3f6OvAB85k/kA5nJN7i5oR0l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ecs5DxXgbsbzi9jEVE7hZ5hekvZWAnNJVZSImnf5oXi/1Zm1
	CmGpSu0Dp4wYdwJnRIA3KoyJhnZklPwTplQ0Wr2e47lT4p/PZeosy50TkBSC7wfwSmiTE9LhKQF
	as59PiZXH8OfdYSCTG+lXxlMlmyCQpubTLqLgqLhAFJvThEorvtSV4ARw043LGASZ6+Nl1w+x
X-Gm-Gg: AR+sD11724VKCTcEuomvhyen8PTWJX6h14eJoFfJ0uaoP2SQszWP7DbDmqplwoWz9Em
	s+g3mEtD4QbEgj4AwsSDlBs+lAPZLJkrVlFK5+kyAI1lQjW1pAmCGG+KNr58Pn2GDkz6su16dja
	HC7rxofyBccwh7eQ0sNZpl/dAlD6qBvKi9paP77+nNBvUuktXnsAY1ajethH3o3cwhtM3xer92l
	qwg7g4KU77rfXW5XwxFBzFw3RK9MnwXJh6cX5d8uD/nGogL/EMMAC5fuKGiq58/4koRDCwplmbc
	dlybjNzHta/k9nVeY8NsSjy6vAWF17Qprs+Ge+5LhI4w94iROPsTh5MASSNF8rw4OyDCLqIusbw
	m+lhPb1ldvpEZwriN+6abmCpJKCs=
X-Received: by 2002:a05:690e:1a83:b0:662:f376:ae0e with SMTP id 956f58d0204a3-6699aa9cb6amr2618106d50.32.1785937087959;
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
X-Received: by 2002:a05:690e:1a83:b0:662:f376:ae0e with SMTP id 956f58d0204a3-6699aa9cb6amr2618081d50.32.1785937087351;
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6699136a3d5sm3107401d50.1.2026.08.05.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v6] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Wed,  5 Aug 2026 19:07:58 +0530
Message-ID: <20260805133759.2790755-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GcmWX0RIUD5WsjVxnRjPJBk3FEiGtVPl
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a733cc1 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX/7DKYJRVfZvJ
 q9K/xTVQ1/5Ml3rOIBneS9mTbsjMRAURrz0YvpX2OTFB2ZT3Un5a40UKMdjX+pIe727z5Y8J4F6
 h1Y21Q35U8vP0Y2Q9lEjYYpkM0fP0KqnY+lmPGbgDUyZrwat9LMv7tQBPoUTEmX9sN89582E2GU
 YqJAvgy8ydzY/vYNjTEEDDxlsjJRcKhlAG6oH1dI2Ri1e7TYdZCoHvWj+zTWVFVJqpiXXZEQ+JI
 MAYAboAocTt/m0A8drd0hQb7+ney+w3/ELWJrgye95octRs0n4t9/boJFEW9ISMwURIInt2AENT
 HXZiwQCLLp9nY0A5iRIxscB3rFunmg+mQdIViKBDTtRgPL3opnSesBwmgA2m5iEPNoWVYWg1gOH
 hskwvYXRVAzBBmIR0L9ZDx4XM4K56gDJf8D2gFRcGyw/4zOOO7c0knntMoWI4KoOYTXh9IyQ6mH
 NpTHCdCFjc0U1Xhx8tg==
X-Proofpoint-GUID: GcmWX0RIUD5WsjVxnRjPJBk3FEiGtVPl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfXxtQ19uo5S8oz
 EzceDvxzWlmKOlD9M/RqMW2AVumYtGJ9ho05s4WgcZNYg3IkNvp31LhvaZZxUhCozWcl/iR+Bik
 R+kO4VLGqtx8GXtF1LUkORIQ8cPfSlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050110

The PAS image initialization path always retains the metadata buffer
when a valid qcom_scm_pas_context is provided, even if the caller does
not require it. This implicit behavior leads to unclear buffer ownership
and forces new users of qcom_mdt_pas_load() to manually release
metadata, which is error‑ prone and incorrect.

Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
retention explicit.  Metadata buffers are now freed by default and are
only preserved when this flag is set. qcom_q6v5_pas enables this during
probe for contexts that require retained metadata for subsequent PAS
operations, while existing callers continue to work unchanged.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v6:
   - Other patches from the series is merged.
   - Removed dependency on below series by adding keep_mdt_buf
     into qcom_scm_pas_context structure as well.
     https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
   - Addressed minor comment on the documentationi.
    - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com/


 drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..0528a15903c1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -645,7 +645,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -684,9 +684,13 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 	memcpy(mdata_buf, metadata, size);
 
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
-	if (ret < 0 || !ctx) {
+
+	/*
+	 * free the metadata on error or if client didn't request us to keep it.
+	 */
+	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..6aff24d56ea8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -722,6 +722,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -740,6 +741,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
+
 	return 0;
 }
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..1d132e89536e 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -22,6 +22,7 @@ struct qcom_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..6d8d3deb02e0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -75,6 +75,7 @@ struct qcom_scm_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
-- 
2.53.0

