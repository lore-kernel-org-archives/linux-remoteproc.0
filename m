Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874D3B19AF
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355174; cv=none; b=OpJE2A8ZsEcPEGjJcJR3AFpuOI6jTDRqxvb/0JQLHaRHgiKhz/4nXFlMxWo9KrXkTukNq0yzBRNwnsz/ixsqqRkQg1EvvkdVX6JPdB9r86LlCl8PC/oL8QvLTYs08Y7X5CV2V/D7FeHDCz38S+ll1vl0oCTxKkU6Pfeq1q7wwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355174; c=relaxed/simple;
	bh=XPMq30xEgQ8dtmDEF1xK65u+nuNkxIbYPl0WkEp5J+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikAOuTvTLf+FX9ovGVAmU7FZ6hSiFyQxEnpF/5bTt2UTY8d/ow7sOzzezJqwxVD238tYAi+3X1m31Dbx4nSg8sWZgGCdtTjpvbd5CWtrUQiOj2S+jtn7LjEdAHOfrYgQWhweAT8rjxdd4E26wFpNeRaPwV5M8dGoceGKLjGNd0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FH2OnJUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYeQ47XR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FH2OnJUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYeQ47XR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0fLN1964685
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 16:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+i
	kneyzsNs=; b=FH2OnJUcJKzR6etr06VCWY7F2vTLkk0/bC11smXGZVZ9kR1/lS8
	Vz1CBjPIbRv91wP8mNFKYKMXRBFsSQrFgnQEq3rou4vP5TFj4PgIiX5DtzXgDiU+
	hcIoYlY1ICPsvB6LGUvhsrR2YWpCnkA9s8YNSANAylVuLF56C/Y/7ea9RXu+jfjf
	uoV76KENCzuZXcnNkUbWyDlJCBrUX+ZHdnyCqK2rOA/4EHg52/ds1P1vtpq0/PzZ
	sJsUsl1wrnH/wavJLnLE205F0MyLobWfiTweoghpEbA7yNVxotrnskA082tfezop
	t9Lw1OjVb1p5gXpE6HG0ZckXBGxRpZ7Fw9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt9ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 16:52:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91054f537f9so20839966d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790355160; x=1790959960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=fYeQ47XRsrQ5spF35+ULNLoMSbuw85OhIJ8JjCD+rTBjUo5r4vhBAaciM1junK6kEX
         n+u21KjESV7GrcUUl5+lHvnuvVuf6eluprouhoUHZqD/aXwkfY0x5eDbIJW7OUHuBRwK
         nJS1RBaOI3l+CY9nmGisCZyg4UsQapFJBCRnHR4zDR8J7n1EfyoLsAueEjpVGwenSfi1
         Jb2qMB0Sackd2NpSGxKzqct/Y+7lRbzbo0llG2/PX/46TTCaGm+uo1Rjv8kk3t/Na4FX
         RgIo9Z1A4Ud/yVMbxmEgh6p3BVdi31SmFjDroz5izlN9rtCpj1d1eJtKgsZcik8d7PMZ
         Ztig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355160; x=1790959960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=Xx9cjx+b0XPpIO94PJ3Ui2FBUhMK3h1tL5cJ9fB7mcF8i+uv8tyJ8oaWah4LOxFPGS
         P7SWxDpliA46Deha2T7ta35GJohZdmGZ3wOecdd3t2S/A5b166Skr3eYmclgDXt9ds5v
         Z+GgR3bO/wMTcFIAqDaCVJyiB+VQ1t3o0eCLByTPlV0JwSy7990EXXhvQDdwtjCZFCNi
         onZgy487uHydaB7EUV/v8dsiLC9iqmIE2K/evn0kLPmrn2cWGbCeMVJifFOORIEzM6Ld
         n1Yq8NXN6R9hiqyyP2Z/s139erwFJEnLo079+hY6e8LbmKWf4ukC9G4mAgYL1xtxnqn/
         +GUg==
X-Forwarded-Encrypted: i=1; AKwUvBwRQ25SLF3NBEFbrj+HE49f+rqk6YHujRnQaj/P/3qYBJp4McbPHpSJpUq1lM2A2UBLCvX/DgC3o3MYqKbI1Txt@vger.kernel.org
X-Gm-Message-State: AFuF++lk4Iyu9B6/B6LQ2dJ+095PoOOkS9sgTkNVZkY7RMpg/bZnR7Jl
	EsMKWLyRgQ6xcwdw6DfAxCat7VFT4WNkCcfaUkGbFQLCJ9XlovWTVsX6AoMqzkpbKwrqKFv3QZn
	QsX38xS3/PF48m1JQOPPEFLd5/QEds/NVucokzpwtcHa0hTnAMlE5Fgqkjh4tmf2XSoXxOaVB
X-Gm-Gg: AYBFou1V4LhFa6d2PEfQm0y+kA6GXIwIHuEx6WbS3zUvnDq8k3fFLLM2NnP+9lzQ9kC
	aOmh1AQkIHn1w/vEvmdf9wDlv6ZNVKRuKfavMVF1lAQdzqxdgvYXQO6hQmBGRTjuUWbWx3YJkeU
	wTGHlq3cojDmSpCQmJZArYkrh+zgvl1FnHMMF6PiaJ6vmuesHaHJRf0aSVsoaYQ/GgBvdbh7bst
	2GEN4Oaxg8tFfyVdzioWhv9frF/5i5FI5LTXE1jv8p5MXXIRMt/tmBYAgZVQvfQBsAXuaXA+VB4
	CrZVLe94odxcNAMRKMeSLjafH0KaKB55TjYNnFIEfjHPSHsFMIKPoqihtML7LByJVGtmSLhvr39
	XmP/xrCNOtdj6AfRhsSAGXE2qLak=
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50170316d6.16.1790355159883;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50169846d6.16.1790355159275;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430da9123sm21023336d6.16.2026.09.25.09.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:52:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
Date: Fri, 25 Sep 2026 22:22:31 +0530
Message-ID: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AwWc0byL-xeAfc9ZqohxhZF9B6Mjuyu0
X-Proofpoint-ORIG-GUID: AwWc0byL-xeAfc9ZqohxhZF9B6Mjuyu0
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6a6d8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bTXooOE2z_dFbhIuKS0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX9/5gunpEUjYf
 tdD//TPwUyE3qfTaomQCajwkbEjAMkRCS/SbgZqtDFmm1sMKjjgo/elkJP8aJfoFrA/kSOxjsNo
 SkSi3iNLiZJqfq1JcJ5axvO7eJGme0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX0AXfXme6MlL+
 nAk5Fso9MdFUrVySO1UjRPiB3nEQEyuYV9PJhR8yuUxUW3DmyytewQg0cJdQ2Ob7l3cdm1yAUpf
 0dDMhc28T7oEHzmhi35BT5XT9mF9cZUbPv2naS2vCAMPXrgver4umbYP40SIleQkfSXE0PhxFBE
 n1YpNcZw0A8laXF9bw8saY03FMYSQjB6uqy8sQLCAkgbrjx+6P2+ACApoQA5z/hA8H2qhWwxiRg
 46qfkDV1VU9xpQOzglvGLzD5Dp5cqZwlWaKfjjKUguhnyN7cvgaZZdY9aS0HWLPx/CLd8+ihbxk
 0+e9BY19TEE0ClMfUnglb3tDtulz22VPVwc84nFyC4bRyKmRZkJFOXN7VOkj6G7razCuJfw/TEq
 DDq/Ly/7LWRCqI+979w7GnEfXjOL+OZMkLOgoUemDWUS0wUWIjbVToQxUnSUnhLW6hLBA/WWyPt
 tYmRzZB0181g07J+Sxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250067

The PAS image initialization path retains metadata whenever a valid
qcom_pas_context is supplied, although callers may not need the metadata
after initialization. This leaves ownership implicit and causes unused
metadata buffers to remain allocated.

Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
wrapper release metadata unless the caller requests retention. This applies
uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
for subsequent PAS operations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v8:
 - Commit rephrased a bit.
 - Make the commit aware of all present backends(scm and tee).
 - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com/

Changes in v7:
- Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
  the changes related to it.
- Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukesh.ojha@oss.qualcomm.com/

Changes in v6:
   - Other patches from the series is merged.
   - Removed dependency on below series by adding keep_mdt_buf
     into qcom_scm_pas_context structure as well.
     https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
   - Addressed minor comment on the documentationi.
    - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com/



 drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
 drivers/firmware/qcom/qcom_scm.c       |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 24485dd0fa10..93d78a5c1201 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
  *
  * Return: 0 on success.
  *
- * Upon successful return, the PAS metadata context (@ctx) will be used to
- * track the metadata allocation, this needs to be released by invoking
+ * If @ctx requests metadata retention, the PAS metadata context will track
+ * the allocation, which needs to be released by invoking
  * qcom_pas_metadata_release() by the caller.
  */
 int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			struct qcom_pas_context *ctx)
 {
+	int ret;
+
 	if (!ops_ptr)
 		return -ENODEV;
 
-	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	ret = ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	if (!ret && ctx && !ctx->keep_mdt_buf)
+		qcom_pas_metadata_release(ctx);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_pas_init_image);
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd754..dc57c87870cf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 879c465c4a7a..ae93f693358c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
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
-- 
2.55.0

