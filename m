Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99A30F529
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241815; cv=none; b=mGi9ZzZOCDpOpxs5r/HnVe3Wk+p5Ux3WmK/29Ci9+mznXR0Yefgb2sNr8PVLZZEf7fQlKwfJVuGOT9OlO4oMBqVZmGZaanYi/M8gWdyb4LyGnVxJ4MINQhMMJiUv3rplQAx7k2xQva6TXPT9EvlDWAgvDwdiWyO/NOE4kQyOa2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241815; c=relaxed/simple;
	bh=s7s7sOF79lQQCASxTvnJsYq2tTEsPAx3qwKM1EyhZCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzBjJ3qhBO9xeaDC29/Efig1EPfJblNeoiMjMcRvxXyHkGO3GIC20SCuQyN32w5FR4rZvur2GGMLhdXBShV+FsnFETcHKdH+1OuCskBwldm9Kn3Fh5exc7HAtYXYWrBbU27a4CSuOVUTWDcp2+7phYgn3pWhDq+heW/+QK7iEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4kB+Yhq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/5uaTo9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4kB+Yhq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/5uaTo9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43P2td904583
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjgwmRlItSYeMiNR8SKnTdTbcpETK7V9rbhJ9i9SeHo=; b=o4kB+YhqdrZ0j5N3
	boKN5FYSRnVhMplMATFbIr9OmXroOzLBLaoRm/5FBvyl30I0TjcuLJ97f0YesemX
	10z+tOxxXOeT4xh5qqZtmV4ceakru2YOUdqDSKGJKvg2Pfswf6xkYf8qXoD3rIul
	iQGzGZvd+x3kgzQu60Z9rKfXV431ZR+6Q6S3ynrlcooxudzVFTrpFyHJhqP/B8j0
	jpW/d2Ts+6rhdDrvy1y5x1OEiyd7LQ2NbowDFvdmgEg2QlXCDt/OEtjQMpmlCTxB
	XbhYtALj/tjFuYfPNFSgB9lwcglpBfNNwC0SB3qm4asEEbYdWOgeaKADdoTd6EPc
	jTJ6LA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjrkr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfbfso130301945ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241811; x=1762846611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjgwmRlItSYeMiNR8SKnTdTbcpETK7V9rbhJ9i9SeHo=;
        b=R/5uaTo9nSOk54X5k3VS9GQCzdfcL6HB8UG1C0dsnhbMD+SZT/Yg7CjThgdGqQThEw
         EM19SY9o113awm6beQ+uyBbK9XTQE6oOKt8S/JObmqbGkiZA8qQM1b309Tga0cUAqiUb
         duNfS0ozhnQDz++S266q80w6qjqOyFfl6L2epe7KoHtn7NmM9ctGh2xfQdm768DLTR1A
         8HCCHtcfaZaKqhtu/hwi/7DVhTgnkHrsuFcrmf4U7ZnmWqOyZw5NDNQQD4FCJRoqbO3b
         rNXCZJyg0kyYjHeVxY07ebO7Sl12mxhGLH//A7l4nWTnXDHAz2v16T4lUJILVPDDS89S
         YrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241811; x=1762846611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjgwmRlItSYeMiNR8SKnTdTbcpETK7V9rbhJ9i9SeHo=;
        b=DmzRPmZm2F+Iq9eEFWH+S+17AFmZ0FrMdSqIfvmcqP8f/wWy3tbc36+BfsjHY9QTrA
         SVkjMLeNL8qiouB1BzoeFzPnU3FhBxttqbescn2Gz3dtFhzFK/DxVVuXhS49geqn/DOL
         DPtuLl1GB75+Dus57oGyHO+4kU5BWSDtkQ2FbuANRpdWLKgSqL95jU18kSBwS/4A5OCr
         mpV53Czi9yZUuFFAEJrT81ZlDSyOVhfurxARg7R4EH7Il5TNu6X53Dyd/OBisD1n4WG8
         m6ERjx7qm+qQeMjrPf+VgfSIfNZ3W5T+HhTKQwXMIhlmNbpbwOIhCYBvjJJSo8DC+V57
         8wsA==
X-Forwarded-Encrypted: i=1; AJvYcCUZK3dBlPvv0MDwxfyT9PTjqpgm+TNardXkiAD29Lsqg/iuUVRt0uMEQdA18V2LEcKUAPHYCMaHz6myKcleXXci@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2zqDZAXdVg/pkM4g9/0g8TGwzzRkxcvEQhze5qS8Cv9WrBei
	lFlAEDXhPZ0tXV2eJuf0XZgHXiIOVEX9DM89tz+ggO8aikwZe8qMDQhjBegcl5KRyvNnavPVKzU
	drODyW6khlkYjjzz9dtWry/yZXOBxRb65RyZv9wsHx2Rb6Uehn6FYYy7n/dxHvv7Dya1zuh5j
X-Gm-Gg: ASbGncuANSKCxQkJLchEvmXz7PU1qg4/WQRLxiziANTJFXVfTyhPQBNd42iovb6J8YL
	eDr8G4swupwX9hkQXIKmcfzGsdNzBkGkc1DvxPtA+VyL9liE0cKDwSj8pG/24ptti2ama+pR9fu
	LqQj6K3ikcDNA8So4Ks/G/3UhGJVnI/tudTvoZUX5hEhWqLi1ysj0BZyhce4UMiFlk86ke7zc7h
	SK9qlQBTcmWI/vjaTJNXBBbb8BM/p66/Cj43bTrReLOzEKKyzOchfHifNw5jLZh1c60H6BftIM8
	tphAPCKV8/AX8mukK592eKHB8vs7Pk6EOPzEEDyxqHSw+TmZ58deyrjrzZe6Yq5j/HZ9glT74iM
	oLfQ2/IA7XW/bfc53wLub7W4j4A==
X-Received: by 2002:a17:902:cf0e:b0:295:592f:94a3 with SMTP id d9443c01a7336-295592f95ddmr137469355ad.48.1762241811079;
        Mon, 03 Nov 2025 23:36:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiz5vTizlqbrn/gaWJE+2JCvCD4NjTSsZizWh6d2Dl8Zt6Mo+0QunSihEUJbqKbV/1j1ABbQ==
X-Received: by 2002:a17:902:cf0e:b0:295:592f:94a3 with SMTP id d9443c01a7336-295592f95ddmr137469125ad.48.1762241810442;
        Mon, 03 Nov 2025 23:36:50 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:49 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:51 +0530
Subject: [PATCH v6 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-11-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=9143;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=s7s7sOF79lQQCASxTvnJsYq2tTEsPAx3qwKM1EyhZCs=;
 b=ylK348kSJn44nv3mHDl0bOnQoysxnQDfffV4aJDjy4fJpkjs7RV9Js32DwWvKoV+RpMAARAz8
 teLyIO/474pCLV3AcILTxe88Vn3tJlZg2gkXbdwMFH3tnpomYxp1XiP
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: _R3kzqPzx49zC5O317dMT9SllZ_3LuUu
X-Proofpoint-ORIG-GUID: _R3kzqPzx49zC5O317dMT9SllZ_3LuUu
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=6909ad14 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KFEUUOXM5gBsW3BA6b4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX/jUz3vkWKkgj
 RFvO6fvEjNX++3+JXoQ8v4Nh/nrSinuqsIAlcnHROpN3hgrxaaLTm/rtY0cQSOwEaeCvC9oC0ef
 Za/X+gQiLSKAVh2jXvzVlqBEUBxb/Tlz2VGr7Rv/jniJxB4oabk0tmdb0MmfCf/ULqB/EuQJo7c
 9didV8W9SqGSyOeovJOciwYbG9lgIOWF9kHKeUt9XAVGTBlxGXIWxMf2wAbTpeuRNsL9TC9e3L5
 Uzsw34IvGcFJVnYNHn/vsaiXqJNXlHVUnDuq6Z0LdnAr9eOhIyLjOjZMMlXYiMd+xhc9EsqMohc
 JhbbBa8fuQky7iv97les4+DvERZ6MxQXZz6zGmgPn+ekQIvFli1040D9y1eS2qe3HgkB3hLhqh2
 IQksx6wNrhZgR04ObuitGWnV6ZA7hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040061

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
 drivers/firmware/qcom/qcom_scm.c       | 157 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   1 +
 include/linux/firmware/qcom/qcom_scm.h |   4 +
 3 files changed, 162 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9d3e45ec73ac..5769d9a400e4 100644
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
 
@@ -776,6 +781,158 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt, size_t input_rt_size,
+					void **output_rt, size_t *output_rt_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+		.args[0] = pas_id,
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
+	int ret;
+
+	do {
+		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
+		if (!*output_rt)
+			return -ENOMEM;
+
+		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
+						   input_rt_size, output_rt,
+						   output_rt_size);
+		if (ret)
+			kfree(*output_rt);
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
index 345ddcd53b42..f19fdabaa3f2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -90,6 +90,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
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

