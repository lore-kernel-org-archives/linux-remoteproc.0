Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B634B40A
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989352; cv=none; b=sgNwP6jWmog9UAILc8uEDwp4H7xflixTIT05TwkUQTdhZsyF7OaKPhT/pi/yXfsLetnOU4EwWleuA7Se5xUn5M1+wSuNcGb+znvgTtUWKxooUZpxSK6mTZgFYs28pgINW7wMVq0Yl68qmJ41g2wWTmXEIhXCiqt3YmeOwSAv6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989352; c=relaxed/simple;
	bh=zLbZUBAz3OsEv5CPTK00x2QcznyPaIeKJ8kyHvbExRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCBUA3O3JN/HPQ+O/YanauPuq8pYgu245RpV/ceW3Z3AUvB8OoM7Pe83Ok+IqGDBCmiUcIj0lNx3FOEHY24biFTIXOy35+n+IcnMMQae3ok+AZPyU+J2afZ1G6MTS1I32iLIZs0+2JMVvb38BqVCoZH3BLcLTxcvsC+znDKE98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qjhl7rFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7JeooHe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qjhl7rFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7JeooHe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCLIvn3049696
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	po5GLfe8Pc+JIoowc3HqSrvGc7tQKe1kRH4Urylq0LY=; b=Qjhl7rFOR8YdhnL/
	LQ91BhuA13O4sATKjNetgFYIjDquAfYvVdiSj7H6DxAji19yEsknX4VgYxwEl98E
	QT8DRDh65WPwgWQ4zUcr+dJY4FhX0maE7laH98Rq8BiRMMrgPtkmmKX97igKe9Wx
	AEOjP1fcZA47KxQYaPicoGYrONRORBW/s5YuaqqPymxyc6VXL8h3+/hCATDVrEB0
	6YiYGsI+u4Re42SuZ3xOEsubR8P4yC9tszSsHPzX3ZCBoL6V3CqKv/SrPP6s8CFI
	b8K1XsHLhCpGleZuC36UNxJAOT6BCeVMONl2pUYriFlWL19I8OGBYu0qwJc55nMD
	GBcz5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqar9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso41711575ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989348; x=1766594148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po5GLfe8Pc+JIoowc3HqSrvGc7tQKe1kRH4Urylq0LY=;
        b=a7JeooHefZ898x4+yIVKYkrYc6aL1dGc+F4nIM3kVboHKWPKH5nX9MhvC6g9XMvWnt
         W7tCBHUHtc/yzo/DMUej2F0vin7oNnXvzUEI4wVt4bdPVq7isn5WUDgoWODfwZLFWkGf
         NJ+LL1i8eHdFXSYj8OdnJsZeHnHzngGojwDKO/8aX1n1S71aX8I2E/X7il+onPfOSWVM
         sQGdAfytFk6GQSSUE/j3HZ3o/djjeMUqMV9vpZbUjXJ9pCDKuzqhLAoN5W4UKIHZ66Fz
         CgtbHYe7mK9qHtmHmkfEfrGSqswKr/TvebDjaNHiZjSG9nVX65M48d6ya37s07x2G2+b
         ArIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989348; x=1766594148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=po5GLfe8Pc+JIoowc3HqSrvGc7tQKe1kRH4Urylq0LY=;
        b=jx4s8d8SVGRVVExtfQn7wTv8fzdOOcU40/USQ/5G0byJNcyaOWi8RB7hSBV0M18erp
         DZ07QkuwrBr5bNurt8luu1RFv8kg6MF9k0j/l6QR19K1+x5rqmsxZ+SR35K0etMmjIQI
         zKdy65GIPxzP3pp8Fpfq3TJQ4VqUCyfddQhWPxiBpQr01HI8/huSoMWzXFolLu3fWGt2
         KRn4/lKPeQotqfai0T8P9+0s/czTRtnxNKhtSJBDTDvS3kVn3FPzImkyHHoRxb53mESd
         2s6+TK0ROP9rdGRT/NWJp0C6kueyAR3dINLO9DFSy7JiEkwqImlpRg2lOdyI07XGtH3U
         /gsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCF1bR8mYOThpfF3jMuxrQfwOcbZhkAfBWEqyeTHbmrbZvktEyw07YNnMhbelDOFbJQa9oxBEimflWsbSrGZN4@vger.kernel.org
X-Gm-Message-State: AOJu0YysQigo1yFXp0H7ktNN2QJDl4YT3mMk2eeNcDYKAmAv8MCYUPrD
	jX6AvfDnJ24Xy9a1/vsJL/7G3RoaQgnj1j2HwhuLcnEvGOSrVDDJvVcoqMkLPsTkHa7nXw+gSZT
	Tyj4IKdj+pjG5bSfswHqtPExkViyXSG4KeSuch+ixeMT32qOM4c4bucmO8aFsnAzt4iT8uuiW
X-Gm-Gg: AY/fxX5z7JLyO14HgD8TS5MN6z5DuCu9kThx+yDNd2zQSmhWPJGu+ur/jOm8fsjcfO/
	hA29X/G9vtojowHavd9gQSboX/cM9BRaGU0cbRIHPgq6iN1PlKlXtxxp9jTkTrlGB+veKv1G57b
	SkQ/Q0LE5rlrwdNXDSVZK3Mx+btSvTGZng2Q4RZL5waXGik3k7BHijwTDi5Xub6rY8DOcgK9avD
	Tcr4qx3Zla/1vBf5G9uz3MlhRcTJv0FUhWMTVJE9mXEfycE8pl0DO7dASjS1OsjayQK2OXryyOw
	kMfL4AqVQLlLFi91QpAweCM/4CAZ3A0hvBQbpBBfzFo17TH6kg3uxTwdX88t8pSh7o2KpOCMovC
	h58KuICG4S2nmIm0mqiqFfy7ARuRhbphJUFeZ
X-Received: by 2002:a17:903:289:b0:2a1:243:94a8 with SMTP id d9443c01a7336-2a1024396b4mr121499215ad.49.1765989348117;
        Wed, 17 Dec 2025 08:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxuz62cgD708eigbhZOGRVkxkHSfIexe9A4AyWbsdy35q4EHrmY9GTFYPq4i7LqFOj6RZujA==
X-Received: by 2002:a17:903:289:b0:2a1:243:94a8 with SMTP id d9443c01a7336-2a1024396b4mr121498785ad.49.1765989347406;
        Wed, 17 Dec 2025 08:35:47 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:47 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:47 +0530
Subject: [PATCH v9 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-11-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=9363;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zLbZUBAz3OsEv5CPTK00x2QcznyPaIeKJ8kyHvbExRc=;
 b=urlOBLmZkOyBokIgk82zMAdJFJCW70PeJnJDdCwGFySLDfJZVVQHdr81/fD377r/TT0uO0u/y
 Dt12TzxRTEaB5BQ3h0mqbZv/A/UHMPCjyVS/HE49rNEQ34EGfWQOqP0
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942dbe5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EfaUOOzmSyh7LFfZ1SoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfXwP3keWM84onO
 1b3Foyqk8RyhlooTdGYAhp538ky5RDD5aMg6s6egmFt+StCS0lGDVkCC9fsj1sueoFMXOGbFXHJ
 epLa30WzM1+NsGp5rAiU1PoyxU0ZFwfGgF1AlP4V8/h5Qph6Atejvq8rbEsE2MugYLrwwJorTan
 YnKkJaolOqqGKxfuFhhda/krTnNE0gY99IVqC+OYl9dBrwmPQKZa9n/eEsrRZ6cpzVraAGFu1Dg
 brAutAfXwqlxD3bjUdNTNUWe5RGDgaxcMKCO03PRGXjY+R+r4TUH4shMmZvINUeWpGLk8qvpd6w
 F3OAcSbN0AaFoS6M8NQJtgoWpXsxSwwLygfOkEFk1MzBNtczrFz62h6VM67qZHALojMY9HR2FAc
 alSCoYH6/OXw0kLmM2Lj9ZOlyIX2XA==
X-Proofpoint-ORIG-GUID: Qfrr6KQ-p-9WUcKqTqMa--kxMapBGHaQ
X-Proofpoint-GUID: Qfrr6KQ-p-9WUcKqTqMa--kxMapBGHaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170131

Qualcomm remote processor may rely on Static and Dynamic resources for
it to be functional. Static resources are fixed like for example,
memory-mapped addresses required by the subsystem and dynamic
resources, such as shared memory in DDR etc., are determined at
runtime during the boot process.

For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
hypervisor, all the resources whether it is static or dynamic, is
managed by the hypervisor. Dynamic resources if it is present for a
remote processor will always be coming from secure world via SMC call
while static resources may be present in remote processor firmware
binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
with dynamic resources.

Some of the remote processor drivers, such as video, GPU, IPA, etc., do
not check whether resources are present in their remote processor
firmware binary. In such cases, the caller of this function should set
input_rt and input_rt_size as NULL and zero respectively. Remoteproc
framework has method to check whether firmware binary contain resources
or not and they should be pass resource table pointer to input_rt and
resource table size to input_rt_size and this will be forwarded to
TrustZone for authentication. TrustZone will then append the dynamic
resources and return the complete resource table in output_rt

More about documentation on resource table format can be found in
include/linux/remoteproc.h

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 170 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   1 +
 include/linux/firmware/qcom/qcom_scm.h |   4 +
 3 files changed, 175 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4ce892d8fb25..a589961f8225 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/remoteproc.h>
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
 
@@ -766,6 +771,171 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt,
+					size_t input_rt_size, void *output_rt,
+					size_t *output_rt_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	desc.args[1] = qcom_tzmem_to_phys(input_rt);
+	desc.args[2] = input_rt_size;
+	desc.args[3] = qcom_tzmem_to_phys(output_rt);
+	desc.args[4] = *output_rt_size;
+
+	/*
+	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
+	 * size.
+	 *
+	 * If passed 'output_rt_size' buffer size is not sufficient to hold the
+	 * resource table TrustZone sends, response code in res.result[1] as
+	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call
+	 * with output_rt buffer with res.result[2] size however, It should not
+	 * be of unresonable size.
+	 */
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (res.result[2] > SZ_1G) {
+		ret = -E2BIG;
+		return ret;
+	}
+
+	*output_rt_size = res.result[2];
+	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
+		ret = -EOVERFLOW;
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
+ * include/linux/remoteproc.h
+ *
+ * @ctx:	    PAS context
+ * @pas_id:	    peripheral authentication service id
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
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size)
+{
+	struct resource_table empty_rsc = {};
+	size_t size = SZ_16K;
+	void *output_rt_tzm;
+	void *input_rt_tzm;
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
+	if (!input_rt) {
+		input_rt = &empty_rsc;
+		input_rt_size = sizeof(empty_rsc);
+	}
+
+	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	if (!input_rt_tzm) {
+		ret = -ENOMEM;
+		goto disable_scm_bw;
+	}
+
+	memcpy(input_rt_tzm, input_rt, input_rt_size);
+
+	do {
+		output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+		if (!output_rt_tzm) {
+			ret = -ENOMEM;
+			goto free_input_rt;
+		}
+
+		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
+						   input_rt_size, output_rt_tzm,
+						   &size);
+		if (ret)
+			qcom_tzmem_free(output_rt_tzm);
+
+	} while (ret == -EOVERFLOW);
+
+	if (!ret) {
+		void *tbl_ptr;
+
+		tbl_ptr = kzalloc(size, GFP_KERNEL);
+		if (!tbl_ptr)
+			goto free_output_rt;
+
+		memcpy(tbl_ptr, output_rt_tzm, size);
+		*output_rt = tbl_ptr;
+		*output_rt_size = size;
+	}
+
+free_output_rt:
+	if (!ret)
+		qcom_tzmem_free(output_rt_tzm);
+
+free_input_rt:
+	qcom_tzmem_free(input_rt_tzm);
+
+disable_scm_bw:
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
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
index d6d83888bb75..7c331598ea15 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -88,6 +88,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size);
+
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);

-- 
2.50.1

