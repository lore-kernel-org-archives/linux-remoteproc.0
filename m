Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385FC2FA0FF
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622553; cv=none; b=n89tffPfzoFCMzSdBtExLZtn9B8qZHdjt0rO3vPCJb1CrmFvHMGUw+6Mx9zGrMukqEW3yimvInjSnNqHU/5CmBnxu8/grWmMaBXtrsMb3cSURN9MVFlvuOvi5MI4MVmOTGbgpDmf+0y5p4HjtMBTKvtrpajS3u1jKAIj+eC+kpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622553; c=relaxed/simple;
	bh=aH2ItPDzQjNcbMleRAVtTqLHHkrwA+xhSJpEApaXmmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrAS0wBZn8JCKY73CKvoxkeMp3kwHuqcDbCgPL0+Pn1SqVWdcwKSfTBrA96SL9wh599yHZ3d0IcI7771mI4wlrgZ5uP7OoTpT3IiwPHG52mlUoqtR7gKhlGVH0eZVToExSBiDbmO8wWU/XH1mlDZySvGXKePCEBAOB2o+xkVj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdfZk5vy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdfZk5vy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFKnY8005168
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fwQg7CGB53q
	clpnRXzplcKXl+FhijNK1WRddU0YzXbs=; b=YdfZk5vyRD/5RT0fGOI+DZvnDcO
	abe3W8ro/+/fYfMpu9GD4DS9f5vExsaagwhxOqBNTQ7FsSRdsZ7c9IA9Ex2PHIHr
	b22EKfqZnBAs89w462r6u6Nn6BxlIpbbK5oFvfBccxgZHdtW9EkIpA84sNIHEC77
	+zRpigjTbQLgnc7CBNXobSH2SyNtJgaHwTotmqHytYDWUccUqxxMW/b4fIowE2/h
	DFsEt9/X5cAcfcDJDf7CKakIlJIj+w5DbHkJHGrRHJ8DSIxHM0upFB16yeqF1GIP
	7TIPYZj16QtVn4vRFEp6CpDlp6FqY84HHxFCeR16j+5ciDEfpHam8vsBnBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0ga37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458121274so67179825ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622550; x=1756227350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwQg7CGB53qclpnRXzplcKXl+FhijNK1WRddU0YzXbs=;
        b=NmSlDrrWAqJsnTF7+PjXCcrJiJM3OXnPlSJ7RASMQ4TNRZmDEsiiqyJbocbVFfPOs1
         ofFaDVM25Tp7JvjD6CJ9Hoc7MPUfM//s/yxubz/o7Ga6FPzruXDG6QFHncH9kfgdJNXS
         /0x2Zt8cBMSoLPa2JDqzeteIbLbfAEFOX3iNOTIeNrTSsqWXUOIdgtIIc3RfHxXNrxSl
         vZQQIKRlUwpD9PASJOJ9C+SKtJRnMTPnLjf5XBbAcomBbPzrqOyllFrxsgri8F7pZSYu
         ck6RAuzU8oeJLRxow7wsy6r6+gBG9Mkh3RkJ09Yxm4O98815xeUGhU5HfOszzh3inbVk
         AeXg==
X-Forwarded-Encrypted: i=1; AJvYcCU8uDOi3jdubR5vY4oTJnA/MoUrAY+b3OrrryfnlxR4tNmTpAm/wwgtEk8iyntVFGO1t/tqy8PTTA0BsiLt0V9i@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4lttQg6UdKp3uX/1PzS3SSK5h4ggxrBuH/S/zIyI6y0VV7aS
	i4jFvRuMkqFQUHp/tIK1rIDHa5kt4d6Apn4T0bQX5Tqf+J4+/m6/PvL0Dxmg7a+ploD762foDGz
	v5TSYvt+ipykjxmGrvVDVBsY/nrvpH3EH1SdFNmOhisflQUzOo0OmmhwNap3tMetwSm7Y+X2N
X-Gm-Gg: ASbGncvJS5TTFdZJvXmdgx5R9HTO4HzikjxyF6XbW21L0P5ivhsvDZ8OZXjSHysdofJ
	gcuDMbz+2qkQ7sCrI8X7D7B5C1W/NkCOvg/V1/zYiMOj5j516GJyvKKfsWt3zQqP3dQ2STR4S3I
	AO2E2fDgRrfRhmLp0e6hM+awqodHGl8ON/HDiZ3PYDF7yt3PSMgqJwL1Rk6qytWk7GId5HxLA/y
	FrIPpxTc2khojUMzs0fwMdAdszn0yS+D4hseHBWR4anC9LDtSTmHasG4Ffqn45BeqIni6QVxY1m
	jn7UWfoiFNcMi9N9AwuP7Pj7Y6oaiZWRduLb7AVw50RayYsN2heuLkQqtcHMvaGSjrg=
X-Received: by 2002:a17:902:cccf:b0:23f:cf96:3072 with SMTP id d9443c01a7336-245e0541d78mr41647715ad.26.1755622550238;
        Tue, 19 Aug 2025 09:55:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHOfhh4kDIVCqOF/lgln17dW403C80shSMtreRS1SuNs3fddXQMYCMEL7XlPlGTIovsfgYyA==
X-Received: by 2002:a17:902:cccf:b0:23f:cf96:3072 with SMTP id d9443c01a7336-245e0541d78mr41647415ad.26.1755622549726;
        Tue, 19 Aug 2025 09:55:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 07/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
Date: Tue, 19 Aug 2025 22:24:42 +0530
Message-ID: <20250819165447.4149674-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jdk2KFhxCHDavZN06GA0QWfgz8ZPQpkI
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4ac97 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NnWisg9ZSMKnuRCoed8A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfXxEOb8gWNOgJr
 q37f5L7qUppxvzQRpTVcuyRNdkowQT896fzYe4AS0YjovdGNjIeVy4Oyw0/38rx3OOicyu7nWWP
 bBCQidz32TPuAybo2U5YAlrZlI8yumbfLrFIuNMTfiFnklnEljTNRyv32a1i9amzOuMShWhnWEh
 O09QQJUH0/Bq9gdiDfTc7WBWY006X3LAlXfxf+r7s6sVlElbctAV9k4h26WGE7r35+85I0EbBI+
 0hiph0ofIDH3jjH6F/C5VvW6NzNtDtPLXKDg1PdjbzuY4fgXd89yZXKZLLbQ1Jm3EbctseIVeEt
 sbidoxpH0Z4ej0yOSZ3aab8F0ZIqXNEmZ4upvk1rjQxWJ4t5HbVPKKWbAR6cs199oEvx7ubc+F1
 ognnxyI8
X-Proofpoint-ORIG-GUID: Jdk2KFhxCHDavZN06GA0QWfgz8ZPQpkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

Qualcomm remote processor may rely on both static and dynamic resources
for its functionality. Static resources typically refer to memory-mapped
addresses required by the subsystem and are often embedded within the
firmware binary and dynamic resources, such as shared memory in DDR
etc., are determined at runtime during the boot process.

On Qualcomm Technologies devices, it's possible that static resources
are not embedded in the firmware binary and instead are provided by
TrustZone However, dynamic resources are always expected to come from
TrustZone. This indicates that for Qualcomm devices, all resources
(static and dynamic) will be provided by TrustZone via the SMC call.

Add qcom_scm_pas_get_rsc_table() SMC call which will return resource table
including static and dynamic resource for a given PAS id in passed output
buffer of output size.

If the remote processor firmware binary does not include a resource table,
the caller of this function should set input_rt as NULL and input_rt_size
as zero respectively. If the firmware binary does contain static resources,
they should be passed in input_rt. These will be forwarded to TrustZone
for authentication. TrustZone will then append the dynamic resources and
return the complete resource table in output_rt.

More about documentation on resource table format can be found in
include/linux/rsc_table.h

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 158 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   1 +
 include/linux/firmware/qcom/qcom_scm.h |   5 +
 3 files changed, 164 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 301d440f62f3..1b45aafd6c05 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/rsc_table.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_rsctable_resp_type {
+	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -776,6 +781,159 @@ int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static int __qcom_scm_pas_get_rsc_table(u32 peripheral, void *input_rt,
+					size_t input_rt_size, void **output_rt,
+					size_t *output_rt_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+		.args[0] = peripheral,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	void *input_rt_buf, *output_rt_buf;
+	struct resource_table *rsc;
+	struct qcom_scm_res res;
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
+	/*
+	 * TrustZone can not accept buffer as NULL value as argument Hence,
+	 * we need to pass a input buffer indicating that subsystem firmware
+	 * does not have resource table by filling resource table structure.
+	 */
+	if (!input_rt)
+		input_rt_size = sizeof(*rsc);
+
+	input_rt_buf = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	if (!input_rt_buf) {
+		ret = -ENOMEM;
+		goto disable_scm_bw;
+	}
+
+	if (!input_rt) {
+		rsc = input_rt_buf;
+		rsc->num = 0;
+	} else {
+		memcpy(input_rt_buf, input_rt, input_rt_size);
+	}
+
+	output_rt_buf = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	if (!output_rt_buf) {
+		ret = -ENOMEM;
+		goto free_input_rt_buf;
+	}
+
+	desc.args[1] = qcom_tzmem_to_phys(input_rt_buf);
+	desc.args[2] = input_rt_size;
+	desc.args[3] = qcom_tzmem_to_phys(output_rt_buf);
+	desc.args[4] = *output_rt_size;
+
+	/*
+	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
+	 * size.
+	 *
+	 * if passed 'output_rt_size' buffer size is not sufficient to hold the
+	 * resource table TrustZone sends, response code in res.result[1] as
+	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call with
+	 * output_rt buffer with res.result[2] size.
+	 */
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	*output_rt_size = res.result[2];
+	if (!ret)
+		memcpy(*output_rt, output_rt_buf, *output_rt_size);
+
+	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
+		ret = -EAGAIN;
+
+	qcom_tzmem_free(output_rt_buf);
+
+free_input_rt_buf:
+	qcom_tzmem_free(input_rt_buf);
+
+disable_scm_bw:
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret ? : res.result[0];
+}
+
+/**
+ * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
+ *				  for a given peripheral.
+ *
+ * Qualcomm remote processor may rely on both static and dynamic resources for
+ * its functionality. Static resources typically refer to memory-mapped addresses
+ * required by the subsystem and are often embedded within the firmware binary
+ * and dynamic resources, such as shared memory in DDR etc., are determined at
+ * runtime during the boot process.
+ *
+ * On Qualcomm Technologies devices, it's possible that static resources are not
+ * embedded in the firmware binary and instead are provided by TrustZone However,
+ * dynamic resources are always expected to come from TrustZone. This indicates
+ * that for Qualcomm devices, all resources (static and dynamic) will be provided
+ * by TrustZone via the SMC call.
+ *
+ * If the remote processor firmware binary does contain static resources, they
+ * should be passed in input_rt. These will be forwarded to TrustZone for
+ * authentication. TrustZone will then append the dynamic resources and return
+ * the complete resource table in output_rt.
+ *
+ * If the remote processor firmware binary does not include a resource table,
+ * the caller of this function should set input_rt as NULL and input_rt_size
+ * as zero respectively.
+ *
+ * More about documentation on resource table data structures can be found in
+ * include/linux/rsc_table.h
+ *
+ * @ctx:	    PAS context
+ * @peripheral:	    peripheral id
+ * @input_rt:       resource table buffer which is present in firmware binary
+ * @input_rt_size:  size of the resource table present in firmware binary
+ * @output_rt:	    buffer to which the both static and dynamic resources will
+ *		    be returned.
+ * @output_rt_size: TrustZone expects caller should pass worst case size for
+ *		    the output_rt.
+ *
+ * Return: 0 on success and nonzero on failure.
+ *
+ * Upon successful return, output_rt will have the resource table and output_rt_size
+ * will have actual resource table size,
+ */
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_ctx *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size)
+{
+	int ret;
+
+	do {
+		*output_rt = devm_kzalloc(ctx->dev, *output_rt_size, GFP_KERNEL);
+		if (!*output_rt)
+			return -ENOMEM;
+
+		ret = __qcom_scm_pas_get_rsc_table(ctx->peripheral, input_rt,
+						   input_rt_size, output_rt,
+						   output_rt_size);
+		if (ret)
+			devm_kfree(ctx->dev, *output_rt);
+
+	} while (ret == -EAGAIN);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
+
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..50d87c628d78 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index bd3417d9c3f9..4fd13661ecdb 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -91,6 +91,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_ctx *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
+
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_ctx *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size);
+
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_auth_and_reset(u32 peripheral);
 int qcom_scm_pas_shutdown(u32 peripheral);
-- 
2.50.1

