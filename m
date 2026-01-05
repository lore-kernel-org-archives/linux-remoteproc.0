Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D833DED9
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619444; cv=none; b=JCwxXBJzWrVORfbiZC21mWKsfSJhGcjQR9JgvEgM50P/xbVPOEiDy3X0bZU3PTWYMbCICUiatz9zFP/a2yu2SrW36GBQTCbMSeba5PdgPtNuthwNc5oAJaKzh0GD84ONVR2tvNlHdA4/bEq0QZsxiMU0AgSRXduOKm5aWA0FE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619444; c=relaxed/simple;
	bh=OBUteaRyPxiyz5zA0egTZoNR3ABp8TcImRV39mtF4ZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/yf2UBQmhAN1uHjbaXYMcfgyTZC0MhJ4/ysLf6Blb3u2b0jEB9C5p4k0pmiV122XnlB4S2Zm+gLOBAannxHkVbnTMtj/pSxwssHbsrhiC83/v8ktPI+gLW+Nq9eYmtHmfXKzqWB+cH2CgDMAh3W87I8ZDnakoTdNMwBC8pY9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtXNVYPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efg4XRAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtXNVYPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efg4XRAu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AXK59091265
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2M4jUuN4/aAv+qodILi/HaluXH+zF8KwR+gKrgh72o=; b=CtXNVYPFJAxMBs/7
	Ky/snMNA5K/cLdTjiVH1GmjwcZin6UK5oE5/6Y3E5BBNJP+HaNi/S4P7q50PkBLB
	+kRGENXkqMh1scc4LJBz2EblMk9s3tXXd2hFKS2CdPrVKMl89aEdP70VC4Yhz07Y
	5mtGy5cqueSQTd3AhD3PVepQGirjPyPuVfrV+rkzvY1VTduYgiP54Oj9N5Gmo+5s
	Kkc+fG/tzbA/imz8V+pqTybScUtuHvkCr7IdULLO3TAv4rWDeSAPC9AYkKhGpbAl
	LbEXXyrPx7T4Em8SSmwH1DVYbOHucZFv6wsStoaDd9dK2qbA2zpEWQhhEaiJvl6w
	q9ye8A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v61m5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:24:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so24358608b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619440; x=1768224240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2M4jUuN4/aAv+qodILi/HaluXH+zF8KwR+gKrgh72o=;
        b=efg4XRAuocfned+Te6SeMx4+DVebeRsT0A5YA48GQ5MvY1QZoAtxHX5GdoYoW2CBku
         8JhtoDoTxmsRQtKo8Pp862bV00gXAj8tbyRvcTeexVRwo4RFwnhO8IuUwR6HkR9DeBiU
         rRtIW6YdL930xrhWUM3Leho5wrSg775vzGu0LhBsdwkrPDF7IxWcF1nSsHxVg11VDtNy
         e0xfkUP/JoZO29cvccNImOGuExvN8nqrX0MlKRTyd7/2QJxlwzjZU8cbS8g1hrVCPv9z
         upey76S7sqhQgKjTgSYhEqD+RlravS1iDsCIJ4SqNmbeoIwrPRPXt9zwFEd7hPYNOfoA
         GK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619440; x=1768224240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2M4jUuN4/aAv+qodILi/HaluXH+zF8KwR+gKrgh72o=;
        b=JpOLH+veSFK3tm2oY7dzSPuKWq6aphoCTXz5cCWM8mzXjAcrEltjxFOlLGmUFNEpPV
         IexKd9CVUtpLxAnw1C/e/Pd+5XlfQDMC6kyxspLA9sQzm0Vnou+r86qMbKmnZQZGgAjX
         ohZNwqcu2/orXmU3mjb7TnFepu5Thy/lUmTi3Nz9fTk8mOkss7zNEcGcW9hDc8tIgKY8
         LBMx8AtaIh2AQ9cUjaVmudjqQIHRgqKmD6D1ki4eTN90Q67Tctt/STAj8BsMWV2EBhJw
         q3mh3ReaZzYUA7ghBoATADlWf0PVgZdxKxB1VvWlLfNSNLSYNdqzG64tI8LvQQvPeOYW
         Tgaw==
X-Forwarded-Encrypted: i=1; AJvYcCXnDFBm9ABgjMJemg+uc1cjQ/plRv2UciLK6chIzJN3WzHWYJJH11gmmiGEQtrWHQ9B2Fl5M3HvKfwHMJ3yqDRH@vger.kernel.org
X-Gm-Message-State: AOJu0YwicDFTv1TlGOfCxkvPfJkIvIYyWNqp0FCKXp/ARP7rp1cgDDYM
	SVGeHIFR9iHCWYpSvHyzzmnQHRbPbvKDSpKLCgyP6jUBWWb0KdP4lSKO3c1cDqYMMXp0ua8M2Bm
	bIfFllynVWpk5XUpaU/cvzdm+FX13eaaBaVIA0n7mMdL7cyu9hlDET9wPs435FdgbXPTfYwre
X-Gm-Gg: AY/fxX4Y8A4VG3uPcuC0/KTgPngGYcSFortLRuj28PhZMONmIpWRC7iHQ080OBnWnZS
	h3JCOyqnL0vADgo47zH9jh9tsKe3dyn9jTxsDx7ZrHrI7+HNaCF48XdvcBpGnHSDJLMncSEDbVu
	8BCX3rZXOji1vsCmgaoZwUr7M3zRG38PvBL9iLY60/Zc2nb6XgEIirN6bAKE1DrDHAH48ZtcFr4
	hYDKgN5Mn11Sp8v19PnyxrvXtnD6NNQHTmQE0TBEXQqvySPwqyZfDOIlsD3L/SxE09Vo7S47PwD
	YXdUdX0ZLh4cCZA9fMkz+I2yippQnV+OLFDJLvgdjNaif5HNg1wqcGoDCAClGH/gbS5C79y/d2z
	TSAPYsSkQ37SAMvN5hSckIbpy05DW4vc3ZRl2
X-Received: by 2002:a05:6a00:e11:b0:7fc:da5:f84e with SMTP id d2e1a72fcca58-7ff66f59172mr36913659b3a.41.1767619439633;
        Mon, 05 Jan 2026 05:23:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqYEqG6C7YeFEavmhDhLM+ZitOoPa8qtbLHxXs9L9GS3aRGo/ND9arNZL+rGcVL7BqrCZDCw==
X-Received: by 2002:a05:6a00:e11:b0:7fc:da5:f84e with SMTP id d2e1a72fcca58-7ff66f59172mr36913645b3a.41.1767619438868;
        Mon, 05 Jan 2026 05:23:58 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:58 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:59 +0530
Subject: [PATCH v10 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-11-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=9696;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=OBUteaRyPxiyz5zA0egTZoNR3ABp8TcImRV39mtF4ZA=;
 b=20GaNRcm24bff4ssRPmodYB1cRDZCDRj5x81jGOqe+poITs9nti2DBFtvlnPbPC2qwyjwVfH0
 c6b8NYsF51tDxctpGg+sIdEBDSvpydhBIgBTKeRptL7JCHp4k+oxsTE
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXwd0CM/g2nahc
 rTMWt46w5BgwL08VxFYAaumuc0Ed2I9Uvpsak06ni6umJ2fiifkrfFMoGFQ8kMAbdUzW7nA4ulM
 DmK5qAYoSVHIZSKjIO6BweR7PU9mu7hnmeipQmf0nAOx413wq/K1JvE3Ki1OG4xWFf2e33GPcmx
 YRfFvWCLtx0Nb6PJaLpLPbQvyY2+AYof4yxNuX0jxLLyREWho7bXTz4WH9vO2jSsyv/YkXm1Xh1
 sK6Oi0r4e7TRPioFQdIqWSWc3ovc3wmT2hEN8pvHXFyZ3p+XcnCCygNc0HTtUgYHigJg+taHsMU
 A1TxHob2ZE3Q1Ixu1NpYjMS1VaM257zdq67qeSD6UqD3uBFHe77CFKnRJloGzt47JyTDnJ2fpMZ
 dcydydHzPTQm8fhGpltHGhPIJeFEyuK3m6bWrxu4tlIebTO4hxzQ/Vbkp7V8O350/Y3UxZFg8Js
 duXO4/QzheGj3w6by2Q==
X-Proofpoint-ORIG-GUID: jRhBtfm5PSPr0Oq5P1SZAFSLS20rVgPR
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695bbb70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EfaUOOzmSyh7LFfZ1SoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: jRhBtfm5PSPr0Oq5P1SZAFSLS20rVgPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

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
resources and return the complete resource table in the passed output
buffer.

More about documentation on resource table format can be found in
include/linux/remoteproc.h

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 171 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   1 +
 include/linux/firmware/qcom/qcom_scm.h |   4 +
 3 files changed, 176 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9ee673193301..723bd7fcd9c9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/remoteproc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -111,6 +112,8 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+#define RSCTABLE_BUFFER_NOT_SUFFICIENT		20
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -766,6 +769,174 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
+					  size_t input_rt_size,
+					  size_t *output_rt_size)
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
+	void *output_rt_tzm;
+	int ret;
+
+	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	if (!output_rt_tzm)
+		return ERR_PTR(-ENOMEM);
+
+	desc.args[1] = qcom_tzmem_to_phys(input_rt_tzm);
+	desc.args[2] = input_rt_size;
+	desc.args[3] = qcom_tzmem_to_phys(output_rt_tzm);
+	desc.args[4] = *output_rt_size;
+
+	/*
+	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
+	 * size.
+	 *
+	 * If passed 'output_rt_size' buffer size is not sufficient to hold the
+	 * resource table TrustZone sends, response code in res.result[1] as
+	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call
+	 * with output_rt_tzm buffer with res.result[2] size however, It should not
+	 * be of unresonable size.
+	 */
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (!ret && res.result[2] > SZ_1G) {
+		ret = -E2BIG;
+		goto free_output_rt;
+	}
+
+	*output_rt_size = res.result[2];
+	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
+		ret = -EOVERFLOW;
+
+free_output_rt:
+	if (ret)
+		qcom_tzmem_free(output_rt_tzm);
+
+	return ret ? ERR_PTR(ret) : output_rt_tzm;
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
+ * the complete resource table in output_rt_tzm.
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
+ * @output_rt_size: TrustZone expects caller should pass worst case size for
+ *		    the output_rt_tzm.
+ *
+ * Return:
+ *  On success, returns a pointer to the allocated buffer containing the final
+ *  resource table and output_rt_size will have actual resource table size from
+ *  TrustZone. The caller is responsible for freeing the buffer. On failure,
+ *  returns ERR_PTR(-errno).
+ */
+struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
+						  void *input_rt,
+						  size_t input_rt_size,
+						  size_t *output_rt_size)
+{
+	struct resource_table empty_rsc = {};
+	size_t size = SZ_16K;
+	void *output_rt_tzm;
+	void *input_rt_tzm;
+	void *tbl_ptr;
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	/*
+	 * TrustZone can not accept buffer as NULL value as argument hence,
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
+	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
+						     input_rt_size, &size);
+	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
+		/* Try again with the size requested by the TZ */
+		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
+							     input_rt_tzm,
+							     input_rt_size,
+							     &size);
+	if (IS_ERR(output_rt_tzm)) {
+		ret = PTR_ERR(output_rt_tzm);
+		goto free_input_rt;
+	}
+
+	tbl_ptr = kzalloc(size, GFP_KERNEL);
+	if (!tbl_ptr) {
+		qcom_tzmem_free(output_rt_tzm);
+		ret = -ENOMEM;
+		goto free_input_rt;
+	}
+
+	memcpy(tbl_ptr, output_rt_tzm, size);
+	*output_rt_size = size;
+	qcom_tzmem_free(output_rt_tzm);
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
+	return ret ? ERR_PTR(ret) : tbl_ptr;
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
index d6d83888bb75..5747bd191bf1 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -88,6 +88,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
+						  void *input_rt, size_t input_rt_size,
+						  size_t *output_rt_size);
+
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);

-- 
2.50.1

