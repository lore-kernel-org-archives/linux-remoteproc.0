Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC53C3F5E
	for <linux-remoteproc@vger.kernel.org>; Sun, 20 Sep 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890570; cv=none; b=QutuN9ytbaaCXlVGPD10MI2/NNxJqeEf6oFE4fGV3dIA2fgIexxGiJ/gvZvl4qO8uffMF3QWD6C6OHjO2ibrhU+3D2/w0h8aR7yScUftvAGF5uDr0i1EndxklhbQocsMBhGk/K49JTgmdo/kO/Bvmzcfl+NPOuoh9SchJuhl+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890570; c=relaxed/simple;
	bh=IITZogkLYPY0D/oJ7DCGxiN82FnPCkU3rYvwIaG8aJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e9iZofChXPGHe/mnVRhcnQZ6Epd4HMvB2noqZVQlQZPqEyyf1Ew89rIpK8XVQqCGmyJyiKLYinkTY+jsqxQOwa28pUIm3BCyjARqlDBVEORbwuEtqqaX92bCBdV+4hFoJngzEZg+v8Wk+Yq2vJe+sNw28nZ6WnN/ApLzYgL3tVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGC7+LGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQYk7xtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGC7+LGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQYk7xtS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54j6J2455532
	for <linux-remoteproc@vger.kernel.org>; Sun, 20 Sep 2026 07:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hF7H/ez5N9peUMcVDITWHW
	+RTIUn0WPJ2VwcLkvysXA=; b=RGC7+LGFt3j481ci0XIv2sBcjQwkf+w7EpgTlr
	MbfCLG/pYtcbalfUxeXrq9EaPbFiAsYvzogE2GK+tgbCPPld8JnNSygRfUUhqQiW
	kmlPtoFDSS6h05HMITLH9M/OyDVXlGYjQ8BejhiAtF0kBtp9LkOO9YiRDifui0M/
	4olfa+pa1uz6xd0iLu3F81C+h3url3nfRLMmJAC8yxxwAFQ/fnKj0KSspYbIbOQt
	wxEqRfnWlR03FsM6gzQ1FkWV0s6Vwc1MnBz9Z719JaCVGysWCsDR2bLDO3XWgja4
	x/xLtrWpMUAxfrCoyw36PKWvK1Tjg3l4LGHLuWfvoiEJR2JQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsanua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 20 Sep 2026 07:49:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1811381a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 20 Sep 2026 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789890567; x=1790495367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF7H/ez5N9peUMcVDITWHW+RTIUn0WPJ2VwcLkvysXA=;
        b=hQYk7xtSlPHL/37yGa9s12iNsTRes83hN0BrUnumOj8P+ObdIYXW5NcyvScQ2fGQgm
         GK+NZcFbEwPmBVQxhE0LCfa2gRlxIYJ6+bS5IS8pqtlB+Ln5+9yC+wtj/2MDc9v1X+Fd
         9F8iF6HRjBzD5PRCW+3YKpfmhazITMPHrOvLivlIY8CpVQThhG9M6BCx15IzF+HTJ56A
         sd9BV/mo6rXEkbqMSlSIycz2wOsxhBnIP+NF53bq+HJdUcD8477zKt/JkU8B1sMwzi6l
         sOmd8kyyO1E0uRspuD5WLgD6mUaKYD2w3fZ4Ecg7OF1nSPkSoO6eG1YrJcJDn0oG/dIo
         ekiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890567; x=1790495367;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hF7H/ez5N9peUMcVDITWHW+RTIUn0WPJ2VwcLkvysXA=;
        b=L17eSfZqpMdOJg+nV3AeuVdfPAsT7qgd0oSKNZx9nmEBqCmgN15g+yC4QKUm9qNPNL
         1+sRcESKtvcBakBWG742ClGorJ4XqLGThrk1Vn0Vga5/yYaPHRmblCfX384PjWbxZiGY
         fOPikcZ3HmeOHSXEx1NwoUSsBiFgvxh59O45IHWxZoDdwVjVU/gwUA7K8O6QgCHCyj8l
         EJdjLhiOC8mCTp8mgjmeng2ejRGlZdRX6J4NEZkgFtiwiJVXr7wzbEyCNMBrdNCiIdp0
         E4tEi9FHAUaVXmpIH6UojzK8H+EsASoUDBlnwgYMOKDK2NKQlN9uwSQ/Kpy0PYPM5I0b
         D4dw==
X-Forwarded-Encrypted: i=1; AKwUvBwhDCFH/iQ5NVqN8Y5fNWQblaY/xUmfLYJG4ZTUL1yO4aEbt+8gDY+ONxVzQHS4aHOHwmdfWOqmFG6jF/k724i2@vger.kernel.org
X-Gm-Message-State: AFuF++laZFXcX/Jh4/VUbRnI2UdtQSzoJjLnJHmCUXd/x/T/airh5n+y
	YogCaa9WHTLZ2oXhPcywrr1q3pR8b+UBxJ9nJN6n3sYRHjtRR+z4AkgGg/7AxmrBY/kT5IXQ+4j
	9LonjEkUF059piZxUAtr4uiftaVMiCOYP8m4TcgrcJTNoTDGM2hJXDwOKBtuVNaY3jliUDoGp
X-Gm-Gg: AYBFou036y7taRPRSsJ6CEVhXiEsBbdKxErC7vF4PBSibe7XT+brjnvCqnI6SBNce6r
	vOxH6DoyMBCX57vB8LY3T8JgnmVvvCXwhn0ZP+BF+HOAzkQ2hOEgtzssJsklSVsI63jswPC/aTj
	nIRTtoZO/VCoXRWJbPOnDh/0lchD3ksnbIajLdrzej8/PGz40M6cjh64lwR/hwGe6WLa1343/3j
	42G2sklIjA4d215VvG7xGQJcsyDujsgHp+1aaCdbwV8KGsgSycRroFnJiaSky2pRGKGfTEDVQW7
	a5jY+o3Sqy86Fu789rpPmoevqHUX9/XjXM8wck70H1rlI8LyfoYnRdvAq8hd2qBiyl0UZck+xSW
	5kUrQqldCZiMTzcUXrFFlZF5abA==
X-Received: by 2002:a05:6a20:914a:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3dd8c55deb6mr11813664637.25.1789890566967;
        Sun, 20 Sep 2026 00:49:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3dd8c55deb6mr11813646637.25.1789890566463;
        Sun, 20 Sep 2026 00:49:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aef9bsm10695755eec.25.2026.09.20.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:49:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v7] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Sun, 20 Sep 2026 13:19:19 +0530
Message-ID: <20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DSGVlJ9CdsifAHpk4q3_YpaYiRkQZIph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMSBTYWx0ZWRfX05qPKMWttxfI
 UpXx7sCPaVkHrHgADf+z2flIr/O6Hs5SZDQsKNn06ADI8kiVNxcK/f4dTIEZW1cyXMfBcmuxcu8
 p0cPZfOCwdU6C6ec42o6vdEEtSYAsgu39/vFZqpqOJCNOLhqbPntM5CBXmlIA16uHFGX+2PlzHi
 00kqxX866u92Rk2XzWnjcUsl2VMn0SnL8vTttvxPKnK4yI0blYYCD8RfoR+4Ut85hw2wfaN/2LQ
 lZWBi3VsM5ghZrUVFmlZVi8KBsj7oFeSpq0mL5EX4P+bUcg+TPzpr+kUN63CwDAfo0GtFdVzyHE
 mwuecJ5vzkTjwDXCJWnxQ8nPIupZB+0nqHJGl6FubPExkfm4rDncNZVU5dw0ekDIA7b2bxhmQeu
 ggdulrl6zgjxvI7WL9VO6PWWCP2oKgbAhjSUCINHsRCE1RpBFO2lCwoVrLm/Azwqw4jElQHRMte
 HL8/3RRHYyaSueLJQUQ==
X-Proofpoint-ORIG-GUID: DSGVlJ9CdsifAHpk4q3_YpaYiRkQZIph
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf9007 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMSBTYWx0ZWRfX1mPTQs42Hv2X
 xoYbiZYcW1ZyhZ4U5wAByYt+dod/o6ra/M6e0zAapoUAAycMiQQuvweLT0I/Ys1r/ntpcLmWMY4
 jNMooG6oV7g6yDP6FUHb4H8cfYB/EGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200111

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



 drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28411a76d1bf..81bb38401d54 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -664,9 +664,13 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
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
index 96a2436b777d..40cd0f101a67 100644
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

