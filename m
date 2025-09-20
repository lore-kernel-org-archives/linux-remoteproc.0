Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A8246BB9
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397315; cv=none; b=skblBKZmiSPu12Zj8bxDQaprZEZBOeujwOPTRt/58QkzYKMq8YiHoXPWUmL08pJYGDFP0XxHJEyD0B7sWN7eBgAL8PRDtXm8tXikDpZMSRfyOwHyIOSedAdQZgrXB85VuJt3ip2plrXCqYavvoA456jZ1kLA6A8x9TyZCnsCY10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397315; c=relaxed/simple;
	bh=VjNbYY7aaqKShUXgm3Bl844wtAfc/SbWgaQ17r4q8zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CApoWDJEfRQBVY9zJroe0Dy9iKKOzA8K56795rHXmBfvikCntkjCPwBQpSM+IFpRKiubGVPoLHNenMktVCBJmOfwnqrutSPvviJNNag5M/0NBzIfNpTMoElvA8z4cWTONaHXa8i8rPScq40Y36mJ+DR39AgmYQ4mXzYUIzow80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcD53B4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcD53B4g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJeds2015694
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kifMgFPT4OZ3vmxFBQuyI3bPmyDtJpE9SmJKfH6MoTI=; b=hcD53B4gcaBjCqpu
	2A1/UNo3ma2hHY+K5CHsDJFTEpNo4PpaodTjbhR8JxZoAd7iZfCoDtnGr727ZSz0
	tL+9EQbBInzREGXmKsdoNU+B/0xsq5ycwVWc76t7o9w9RkaLNzVI5rnlteTrpyBH
	us1aalSV/ULfMOKFBMTN+5XAn89wOAi31X1QbKHvO3rN+UA3RrRt52xHAeL3FBqo
	EIfBnaAHwuvkUE6a8wLVCJQqZksDukg/s6E2d/H3wg5xKxiHWvI04HoxhrgSndcs
	fKQxziHWo+/p2vaGqBmjqQRY4OlmGl5PfN10fpUUxvpNt8SfFgq9/lOJkBE3cWuP
	lHJyeg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8s2gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2665e11e120so32494765ad.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397312; x=1759002112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kifMgFPT4OZ3vmxFBQuyI3bPmyDtJpE9SmJKfH6MoTI=;
        b=va2xa6Sd1JLvVngFkNQ0ZFBh+POLJ1a6thIss1N3JOqpV1fjZiwk9ZBphpmIAuiNLa
         7Zq9OFYHI2nkqmG1uqUc3Y88/I0Wx57PEcON71+mJ+EkyObyMbUyn91+BKfX8KzMkXFd
         EVo0mhUaEAuJOJiMkQsLa3xXtniVBqNZ/ZQz3ZbwhbBW+XTJL86uA3it6E5FLwZXJBXe
         B2vA7lq+VZQmwLhqABGLilQeSNpscSeCxjhIfBzHFiBz0M4iGmVLDEMyLi36vmXPD5HM
         QGn4wC1qUGuIlM/0NmCGOdqxB5VWGFouyLFen3ShOE35dDmypKfi9MLNYPsk/vH9mnCJ
         /lOw==
X-Forwarded-Encrypted: i=1; AJvYcCVIk90S8PZmw2/cXbuoH4ZOb7z2kV3QBOibnCNpFdPWfOnjwlU3HQxHhCWnFdWb2x26g3idnxfAp0SamtMtTjGM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhL9eQzpAAsJmz+5EWCl7enVMFYPhVRAqfhKUWolgyypHDWVtj
	i8rmcNLrf2qhU4Z+UuMHUtUQVBji2nBEQs/0aOlPkTdWakbvl+/cfcJ/u+/xjRs3hIq0CqKkCMM
	JUUZ34jLvGE3NAaq8erMgG+j8CczSsKYSwjFMJWq65sY0TXKZ3ItRmQMFL2F1NvtskoI7HXHh
X-Gm-Gg: ASbGncv5Qeta4DGHUrwYgQuoV5hn/9o9liiluPHmIl7S2kSGWuai4kAz+ODK1D4FskS
	nOrF7SIHbyqgFMKHJwuhLHk7TcZxbalP0JvK49vxZKGEAASJOzwwX2sdpQQy5YvyU3Aw7sgcDA5
	MD/O55lTc/2HC8zdo1PEbUYtlQ4M4BuVApJRLQB7UvtoJODMSaCLH9Pk4IYPWPjJqnGUVV58BiY
	qfohJ/mu4blq2vx4uqT8f9s0jN4XKwNr8ESYo2rsZNaj+t7wutBCr1q+1Ub902dTEF876GvJBrs
	TGsCYA4UrCt9Fe18xz+oTauKgluozbL6T5DtJAtMmIbqxzQ5FQHPlHtrkIKYnYpfZEY=
X-Received: by 2002:a17:903:298b:b0:267:c9c8:3b49 with SMTP id d9443c01a7336-269ba43547dmr108966715ad.5.1758397311975;
        Sat, 20 Sep 2025 12:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzm6swY7g3ljdJ38jcL/w68YVOQANM53hR8yfTX1LvBKsyzTsSQaPaUpp349mFafgecKzNSQ==
X-Received: by 2002:a17:903:298b:b0:267:c9c8:3b49 with SMTP id d9443c01a7336-269ba43547dmr108966555ad.5.1758397311560;
        Sat, 20 Sep 2025 12:41:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:00 +0530
Subject: [PATCH v3 02/12] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-2-458f09647920@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=5995;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=VjNbYY7aaqKShUXgm3Bl844wtAfc/SbWgaQ17r4q8zI=;
 b=X0qq0JQVjMg+Hwn5EDAYYezZITmRLHpQDXvOADQMFsWrlJXtXsWtTPdRbiWwNHPTdMW+sblRq
 UpXCtP35pBVCEWCsMQR1MItGEJXTJvqfq+k76Bsq1qfGvd91ol7h0+m
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cf0381 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bcWw3dkznkfw-y6_B5AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: INB0frDmq_amHEVEvDW0UuN2AG8YT5kd
X-Proofpoint-GUID: INB0frDmq_amHEVEvDW0UuN2AG8YT5kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfXzfXwaptcLv8D
 t6zOM/tY+/25IUw6dpz03fMh9V3FUcWsJwmE9dpNG13KkxTHeuKvwmWWHgUVHG4MV/ZdARYDNkm
 XnlvR8jMVI/i5BTulXSAhwKRqwsZzpwYxhg0LYesJAWs9MExqiKLY2wiZ/Q3Wjl5us1dXg1Kj8m
 Jkr+YUh2cdTxuGenUwH39h/oFJiM+CJ5bM+aEHxzXM1FaiUJU+EyZtBhbnSrVN09Pxhl9LmmHIy
 9q7iKRUUY5sXmL2Sy/MFjAYFRrPB5G16h9LPAXtpi7qXmDJEtiE1CDrUOCtqPiAV3HSU45b0XZL
 uLyO8HL0dT/vqMujmWJCBV+aPGzP0ggeV6em4/kP20c/8tbHymXhUfC4jILuh465Szl5iNhb8Lg
 2mwKp7Bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

Peripheral and pas_id refers to unique id for a subsystem and used only
when peripheral authentication service from secure world is utilized.

Lets rename peripheral to pas_id to reflect closer to its meaning.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
 include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..3379607eaf94 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -562,7 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
  *			       metadata
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  * @metadata:	pointer to memory containing ELF header, program header table
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
@@ -575,7 +575,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
  * track the metadata allocation, this needs to be released by invoking
  * qcom_scm_pas_metadata_release() by the caller.
  */
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
 	dma_addr_t mdata_phys;
@@ -585,7 +585,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
 		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -658,20 +658,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 /**
  * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
  *			      for firmware loading
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  * @addr:	start address of memory area to prepare
  * @size:	size of the memory area to prepare
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
 		.arginfo = QCOM_SCM_ARGS(3),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.args[1] = addr,
 		.args[2] = size,
 		.owner = ARM_SMCCC_OWNER_SIP,
@@ -699,18 +699,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Return 0 on success.
  */
-int qcom_scm_pas_auth_and_reset(u32 peripheral)
+int qcom_scm_pas_auth_and_reset(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -735,18 +735,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
- * @peripheral: peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns 0 on success.
  */
-int qcom_scm_pas_shutdown(u32 peripheral)
+int qcom_scm_pas_shutdown(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -772,18 +772,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
 /**
  * qcom_scm_pas_supported() - Check if the peripheral authentication service is
  *			      available for the given peripherial
- * @peripheral:	peripheral id
+ * @pas_id:	peripheral authentication service id
  *
  * Returns true if PAS is supported for this peripheral, otherwise false.
  */
-bool qcom_scm_pas_supported(u32 peripheral)
+bool qcom_scm_pas_supported(u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.arginfo = QCOM_SCM_ARGS(1),
-		.args[0] = peripheral,
+		.args[0] = pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..a13f703b16cd 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,13 +72,13 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
-int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
+int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
-int qcom_scm_pas_auth_and_reset(u32 peripheral);
-int qcom_scm_pas_shutdown(u32 peripheral);
-bool qcom_scm_pas_supported(u32 peripheral);
+int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
+int qcom_scm_pas_auth_and_reset(u32 pas_id);
+int qcom_scm_pas_shutdown(u32 pas_id);
+bool qcom_scm_pas_supported(u32 pas_id);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

