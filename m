Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92172259C93
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397342; cv=none; b=lYGeKGLpbbHTDL6sAmahiY3l1v1m+b9e0RLqQXWTe8kvAIGhEN290NA5L3dluaWFqYiGzNuYRzaBpxUrvaYYPuZ2nbEY38qTPLCb6iZtXxiO7XjrRfcIS649ownnYeH3T8t07E0HSv7AmM3du5tl+zfDUbhgLynxvsxz6sGfZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397342; c=relaxed/simple;
	bh=CVa/FYPkpHIm4NFwoiJMEzeZ1cmCDutZGXrVk6JczuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGznb0NloCOtJN6s6Edde+8bDk324BvClIluvMSS0xcy6wsvConCYv32cBySokYlM2jVleN3XtGnFaYl9tA2sQDiJv0q6z/jgSGh6y5Kca9UcKC9XD5F2A1CVwvaS2uiSXUV551CeN/g+/SGwWkQvZ8kkGLnUnsO10ukdDcNJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wy5Qde79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy5Qde79"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KEsFHS005166
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blueAC31ZMCd5WfHaOI8sEyc/DJJjpjEwF6LGeGEEBI=; b=Wy5Qde79nWoGV7E+
	wC+bG6ypkP+jUbk0Sb/2itFm44D8+/IXxIAIS2+8wZU/NfrqvXc1VUp00FO7kZIq
	bzJteIxOSWiPAP01BDJ98ygR/WVM0YY4dMxRbk7YBlnRll1VxRV8aMA/eRxAuU/b
	C6RNgWpNdHxBKFQ1Qwn0bEwnIDQVfS3oiZ1VxiFlammEFvNUHhSiUDMGnZ/8TVeo
	FqVIZz1GccWfaEVSQ5NP9BymG1i7rZVnqOQ5jPlBmeUYfa6gMnHpmOmw4mgXZujA
	UZY05reLD1buiLReY3WjDt8oPhKpZb6Bobm0VqeFG9oei1SDxK4XszeS96vJtGhY
	6vsVrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg316cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so3215954b3a.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397339; x=1759002139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blueAC31ZMCd5WfHaOI8sEyc/DJJjpjEwF6LGeGEEBI=;
        b=Xq7pLnJQYWLKh/SY83zx5sb3TEsk/66UrOAo6oPVWiMrjl3cqVX7B9fB01oSW9gqO3
         71AQQIwHYu/iyLDU7saM3gJ03qhbaay839Jm/+HyFFTgSry8jIqsbx7vrzG/4us4HYYZ
         G3HrYW5bV0saJZ9WnIW8ohKD4KRGlGEGd71g96mfilInjw2kHD86A1x5XnfHPY2vW8Tb
         IlwbbxabFhYh08lLOPseJpjlGe/eXms1U9UB0V9LoIOyzP6guY0UGZJUlgj9F/6HJ6jO
         ah3S70oOX3JTM9C0K207KhxqCrRpQh7MwQDHxrMLwt/lbdy9SidwdKBxx8VIFeXSjhql
         xBdg==
X-Forwarded-Encrypted: i=1; AJvYcCWqhXkQse0gctIWDN4HRd9cEYJDeubChVcPvT2P5QowffBBNM+yWAj+fKv5pi/Ad4KJS+Znp+h2eHrXB7PQofZ1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88VQ9M9jgCXk+iEXa0Uh+vpSnXC+id0BcSRVmp2wvUTirdY9F
	T+c3/gIM4ejkF6Gy8JiMLnciqL/L2adiip0GApJG49ZtF2NS4B/sWJAe96zYouZPwFQdmXZbvMR
	vg4awp1cPd7PHRRzKJHBLbeq8N4cfeXJHFikVPWT1qXbLtSqtKg6GDqhETzBYJNdO8d6lJ6+L
X-Gm-Gg: ASbGncvpsHpqfh/eC8A80An7y5ZTrs7S5ZacZXgCwE9xAeOspElQJGq+Sx4TBasLMyA
	Ubc1C3wiH8B5J1HejJgWhW8JCpUEP9wTITul4FMCJkJdY6Of7RF7eYhCNwze7FVgVfcNhGkhtyE
	UdkXBY5N20UjupMwSaeXCd3Ai7cSDLGJXTnSONPrWX5K1CvAs/weGX7Xk7fUFbCPF0oSd3l+83z
	Ui493ShGZf08AlDvIOIaGWDoaggQPWWQ3UPN8E1iVOY5KQtpmWZZzPhSEDWObSJ40zDa454LXlY
	nenfEgHISJzf5wKqbb+qFRBm2k5CDrebNAOLXlh5b1kapMdh487SxFWM7EKsqpibI3Q=
X-Received: by 2002:a05:6a00:2d26:b0:772:a60:6c04 with SMTP id d2e1a72fcca58-77e4d31b752mr9707949b3a.2.1758397338879;
        Sat, 20 Sep 2025 12:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmYfMBv+6+sOa+6+5Wf0Hl3tSzGoPIgO9xU03RSOfHE0N2w5W2V9ex/s6nsxIfXjyznhSNkA==
X-Received: by 2002:a05:6a00:2d26:b0:772:a60:6c04 with SMTP id d2e1a72fcca58-77e4d31b752mr9707926b3a.2.1758397338423;
        Sat, 20 Sep 2025 12:42:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:07 +0530
Subject: [PATCH v3 09/12] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-9-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=9161;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=CVa/FYPkpHIm4NFwoiJMEzeZ1cmCDutZGXrVk6JczuY=;
 b=ZJqz3I2UTcL5cBzsbooLXPILWLmCNoV2PV9BesMB1PHJpBroa3DCYILSpmcZhJoYyUQmidsqT
 X9OoodPN2qNBu/T4BXIQnkDdhDQLshTI0HeRCAPAqD+iD/Q8nstUjrJ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfXyMu/VEi6zx+C
 iTz9M7eHchhwfpcntCYITgxwB+jRfiPjtWAGMiHLy2jV7gxoLsxCTQ4Q6YcIdBTuHT7FfwOsGys
 VQT93GGt28XC4Jr6DB1o0gXReEdJf6sqo+NSd+KJT63KQEKZO/GSz4WbJmKg0fNR8iZGDe0sPdj
 j1N70suqZKznATUn+pwNcljja2ThXNqS/6ni5uujvfHngKIXJcA16jwUx5/7dE2BR/a8OFp47cj
 31W7BzcvCzx2cN08porc6BETnOPVPXwZDm5UwO4UToaoDVQVoV81gNDXWTY1VnBPcBeHHrRBKmh
 NXWyVRIolP4ZCPPfx6ZJsswMR8Jclhvcmq4RXOwpdQMJz3X61k8hmq8xLqJRQBaiXyHlVdEXECM
 eGo8Bht7
X-Proofpoint-GUID: y5t5ReH3Y3-kjdsLi7rsS3tl7glVJkbq
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf039b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KFEUUOXM5gBsW3BA6b4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: y5t5ReH3Y3-kjdsLi7rsS3tl7glVJkbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

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
index 6376a58a059c..9b40996262b9 100644
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
 
@@ -801,6 +806,158 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
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
+		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
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
index 2fd42493d07c..4d3d4c6fd374 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -94,6 +94,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_ctx *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size);
+
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);

-- 
2.50.1

