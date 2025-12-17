Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03262361DDE
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989321; cv=none; b=TLkq1rwfUW6fRu2B8D0/j+K9d3kn9yR99jsYgdNIZbwX/bip5FoACVyTiZDbcV19+GXMd+qPUJlufwBT6eTSufFJXo+JsJGykQAZ784gOovKoZP2CBavFlmJuD/bapUIx3w6SPg7hts6Me2mpepHYxdS0+5opRWZT87nxrlm6tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989321; c=relaxed/simple;
	bh=DXdutyHAGcYbnJrVjnnSAQBl6WcuD1qzcR4ar6uGI8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJE4Mcy3XOEZmbXLFUlx/OcmIy5bjoApXRj4RdIsmXb9FAXHTsS3W12XhpfPaJYyUce8UTQiG0w6LgqaD/YQZhF3l3bCL0DHIifld3zCfnGdKNnxHalPwYrvRGEl7D5P8B/ozsftqiT7i3sUPYCqHI8+eSDA/zuiUy9lfsUyk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlbvmvgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8JcdEAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlbvmvgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8JcdEAH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKn6r3329725
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYA8LoV9oh1HLOGoD/V4Psqum98OyLmu1K1Z5QHU490=; b=WlbvmvgQbfHOfcja
	isLWUW2mJ0yFdd1LZImhTQM4+A5XIPZCkTkHhcW5o02fkiwNsyeLs57o4NZ/G/BS
	wqPLme1VMU9CpSzwpf6J422tAQXfas5XQIpQkplZ0BEZIr1JeoC5QbyDP/+cSkTZ
	pE6MqwPAn0pp1Uv3qeG1YXiPUohVzXMlASKKqS3xFvLXsx1PuCsNlS7ELLLJ8geT
	bBKM4IrSEcmBeMOxEEw/zj9+Y4H/PSv9iBGOBK+X3xARf4btxbkRLaULjm4Slfnt
	s9bKM+Hsodz7WfgzMUlfMgoG9hVQFDXhbIeWhz6bOH4kae0MquUCCFLSO3OGT6WB
	ZNQxJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkj984-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 16:35:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso41706045ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989317; x=1766594117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYA8LoV9oh1HLOGoD/V4Psqum98OyLmu1K1Z5QHU490=;
        b=L8JcdEAHMuj5LS6L4wyXCmzjYci3/tbXv16QI77mpeTs3KvVVaFGZsbBZ4Sd7StWs2
         3NdQpsy/MXp0ZK0NWqEe5+ICnsWhl57bGATbggstrG2MFm/G6EaH87dfDwtABivVT3W7
         Z5Xhp3Tpp1iPLzMntt3+GM7WhdEDP0jBUq2M6Wp0J2jRSpobICSF8YRMf3TOsDd3IN+8
         98h6rgm1C1h/l+SSjtX0SeFEexEUATQ6MQK8CPviu/truO5PtnjGUADrs+jVxurN9pXs
         P3xUQy1fO0WiMYC+9BeYep8fPsVZuZ8UdcL4xpLB4cwTEpiRdRUDVECpYBt7JKOLpKTB
         raGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989317; x=1766594117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYA8LoV9oh1HLOGoD/V4Psqum98OyLmu1K1Z5QHU490=;
        b=lxodzRnKu7r9d8xJ/9TSlu2gxH9aOXisYDJAxkq3PveJufqtBKvzTClYbCszMQtaXz
         IwAytjoFZeew6ZiXGmUHSrbCabCzu3Vv2p96lmr+YRfNeLJZIV9cZCbw8dyh2ZXuzD9y
         HcMB69lb4KIVU23U6NphrbDJNXGSbCEiaK6QRgV0MVRlEooo0uXJ6UVL3j7YD1JbnXc5
         DAIXrwaPcncv2x81BMuAwIdq5mxxe9t8j75MDQ+uyhbAhZO5Ki8dZOlItcvkU3eYpw4z
         pbtnK9XZEUbnDmOG+4IWyB2buCwedUXNdCTrtfXJWRzGK+wjBA5Q1oC9n+YRkRw0XsLS
         mWYA==
X-Forwarded-Encrypted: i=1; AJvYcCXakAdST9TOLb+yN3+nhBO11zQqF+SHulNg99rTZZGX7HpvRx7yv53ipr/kB2Zgt6bo20ubOJDDO8g//SVlfmIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVCcCwXA8Jh8VFtgn2lzfX8CR/QcpsAKnBWixNiSN3SnPX0lk
	Vae39H892Vo1rwQ24gYMzKuaCZf1DOC8MyZ5V6BieKsxmAKCzx1u0mrrH/Axj8OxS9wbpcEVz2v
	32szEpCh10ciKSGQOK+aF0gPMlmTradIP6VJR3rDv2CkXUJ+p6Vy6xeEfpG+8QkzI+DPUjo/o
X-Gm-Gg: AY/fxX577Dot/U5mXOK9xr0I0P4bnSarcCyNm1UbiGDNib4koixR+7c7ITvSLheM4Q9
	hNtvT/damtKC/Z4Q1/IkNTiUo4Q1M0n/1lnpUZo3rpW2npEiRbJ97yIQKqgA9nXAegSWOmN5pZe
	TdfFNXOeX06xz8OqNhW3J+jNH9g45sL84L7nUse9TfbR7ZleYY2D+9UquT92KhJy3m01ivkGSYC
	hhnjNA7wJA8qc+IJ2wc4q7A/WWJbRHqC+XN3eIuSvbMMuoeadABKTuK3IDI0iKC+WX8yVrFUZEK
	ljML0InPgDB7WeQMeusMy1/lNHEyc/Ful7nK0GhaxpkYO6gw1HCMbyrx0Xgp8/IxohnldfnBeiB
	uN/S9YWvsFsEEOZhhwCWhusLVzz/vOpYuL2cT
X-Received: by 2002:a17:902:e94d:b0:295:6d30:e25f with SMTP id d9443c01a7336-29f243879d8mr183053415ad.53.1765989316362;
        Wed, 17 Dec 2025 08:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmKEFM+BwlVSmYcrEzhY1oJ+NNet8XTffvuffrvJ2KSerrby1UaksydNS0f3S/KAtKvq2nlg==
X-Received: by 2002:a17:902:e94d:b0:295:6d30:e25f with SMTP id d9443c01a7336-29f243879d8mr183052975ad.53.1765989315650;
        Wed, 17 Dec 2025 08:35:15 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:15 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:39 +0530
Subject: [PATCH v9 03/14] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-3-ab7ac03e0ff1@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=6116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DXdutyHAGcYbnJrVjnnSAQBl6WcuD1qzcR4ar6uGI8g=;
 b=1Y3hAZdmBvnICDXoSOp4PzRSVuCgqtnfRuzaw5VMvNY9KVu7PqddbDIJiQNlG0395ZqeV5Pon
 FmzOQ1VnkEVBrW/sDThCH9ndaEwNQIn2OcjONb1JyBu+zsDH2oMHzPv
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: mOCYWkusEr45fWA99-Q6kxw-7DQjpwpy
X-Proofpoint-ORIG-GUID: mOCYWkusEr45fWA99-Q6kxw-7DQjpwpy
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942dbc5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX34QiY2PZkv11
 sSbsifOERIQ8U10y8JXM+D51tJv7TKN33+OzgDuGD4Glp3oEBXyvIdR2YxY1fE2UAC8eUVgPnpX
 3RwuNeyjHOWyhmyYFinMqwyX3IlzZyP6UrylGDoyzf1bJ/P3FCKiZV0lEnkOgYsXKd4U07isXBJ
 wAt7uYRSBJDC0lM7XPuss7ADne2eK6D3yRrr1Zih+t2aejxoXKOuERjmq/xvkoHMU80VnDplLxK
 1g0+G40XpySeiXeH7RbWujOuyM7rADNGBkm8UOp3jm4TeAPYirTLipb/77xHyxem5dQYoz8DjII
 C9cOUfaF2DZIDti9CAPiP9QoAw6kd5B1j3nCK1qoFhovx43FzsKi9Lv5YCMtnOQwyYSJO7SLApg
 CwRU1zkxs26KQ1256Of6z1dm5W7PcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

Peripheral and pas_id refers to unique id for a subsystem and used only
when peripheral authentication service from secure world is utilized.

Lets rename peripheral to pas_id to reflect closer to its meaning.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
 include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6461408c58a3..1e1057638e98 100644
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
@@ -656,20 +656,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
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
@@ -697,18 +697,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
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
@@ -733,18 +733,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
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
@@ -770,18 +770,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
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

