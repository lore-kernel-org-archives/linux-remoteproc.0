Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB534846A
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722900; cv=none; b=XthUjtuLT26jMQ0PxA+M1oxbOPWaKZYfdW+2a0ddRhp6DXPQFJuqreDUxN9f/OJ9HRl5OfsqyC1oUU4I2fqzvReLeKEXHKosrpe+8pTaiYwKqqBzWBo4c8s1PTc3k2awPZDie7DYRCAOyGIRQ9B/q3MoP7yl1h/vD0A7BCux6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722900; c=relaxed/simple;
	bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEBEZthz+plCOcNwBUQrcu3CpizdN/tSWANa74MSDoBHIa6N+LZvEZpDxzKQh3ED0jCXhlpYH1AiPvpucExlWtIEj5Swbd2E9mH8rOQ5y8caNwxlKM1umRYDhbvYb0liamFBdtb6W4tiZP581JY2+9JhZ9nV2jy6ESuPI02YPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIyLLDxc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qyoy0XBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIyLLDxc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qyoy0XBC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8rVZj3675836
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=; b=OIyLLDxclXvY/TZy
	u3CG94nIb3VbZspA1nJ2ClEVFgTFc/b7gYC5l4XrVWRzc8/nwyk0IbsFx6tgVf/k
	3JN+XA1279ESKyQ6Y55oWKQBijSEjrYyJCgmj1Y2lirnosDYZpvJmjafQUxma1mH
	elCTW0ga3jwCuiMSn61G26WP0q696jq0U70kO13zxyln3A1ddUZ9CBABiK9Y5P08
	I8C5hCAdigijJd6PQ78sHdQJb1QlRtGmcXiodvVr203MbQtGBJrBEYgwFt4eepEx
	/17LauUkGTHKrlD9Cod1LqdRvVQkLPCLUVZ3SO0jNTJVZdBEHqEol6aQiQ5GCCg+
	lOj9RA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj8gm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso2263195a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722896; x=1764327696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=Qyoy0XBCa+ZkOhc6pfCLGVwZAKISIQm29uI+i2cjd8N68+eYWLJXB0a3ykbMR/Md4k
         uYBZsPP0S/OS8RAOCNyzdzz1P+xwHvgKVnqVXpTZbqwbAhPTfp5N+B247bv7jLo1rqwr
         6+rux0kejX7xT3hljnFv3apE1eL7+4E9Egze32xWe8L8U84j3kJoHum0kv/VmYR/bHhD
         5Ehg+SwIo2BDHoQ/ivfq9fF2wgdPbg4tpLesZ4rdM1OF3fVsPExu7S+qXfcovtgLfUyZ
         jLu6qJZHgSsXdjRIMA8hw572u1t0JRpfqG3YX506dBovyfGMpz6nucaQAlnYySr8SYCS
         vZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722896; x=1764327696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEVZCcztr9EOYMu31Bx8peC82HjT/I+z2RQHL73/z+w=;
        b=BuxTZbTR9PjX0KuF53MUUTqpKOK2hMHMgWXYnpne7/Io3/50/EKobSaotbfb2zFl3+
         xDaawPetdX6BpEWnZNmpGGHq6o7CoY70BYBmOxSmaE5Uwmdo2xJ87SayqqjxZATwpB5i
         EcyQ59aO6yN1MKXeQqqNZY+CmN3Euy4Tez7OXfAQSF9l/PR6WILhLhvATjwJQo3qppUE
         TeG08PeJq0u54WSf3pSY9yf2oBezee6/TubLT/uV0wCDDUYTgNsNFAPhHpqRbLEvE/rv
         NqS/G7i3pTWSuyOFFisd8ORQrpsB+uXQ5Z6x6mxRp6Ot13eQTftdDEZNvP/xNOEGhOkh
         GmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJW327du+LjK3iC9hXSKN9jl0DVKbJK/MKrXsTHcQ05g+QdGLCY3mfTP5uyJxt4QqoDHqAlie9nb0+meieDpk@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhKjp6vQfpffKW/h9e8RI49nU+e8yNIgCfj0ypoxDCROMXrl0
	4ufgYvuKmLgdDJpcotGV7wLRyYtdyUJsezbhxd/j0CJ3K5KoXayHURUnpKpBZhT8KCHS191cueQ
	sT1oWujCadAFkQdDDuOBfI1YbFJ4kpjskSfy/v5BGroqTR3YmcLDhCstdiFtXZ0whJpczSY1L
X-Gm-Gg: ASbGncvy0J2MT3h0xCJSJ50wlb7J2ruZZoz9ASPFxBCLkLR2dGjc5JCAVp0M5LpqWzt
	MHJ7VXaF/fvzYfxGu44ZGzwks48G9LpHZ56BSN4d0ySpjdDmGswlX5t5rMbDcsUWVFQQWdSoDbX
	bisT3dbXuoEiwjWu2kz0VHAgvVGIn7BV9NTU6ThVIApTP5l43tXI+6ni7Gz6HOpX8jrgvH3joT0
	Ja+wz9UZrIrmSel9v1NJUOoYjALGgmSnDKv11uiCiV69FWN/V+EluMex3lZNs4ED9hrMe03aaZR
	/Qzup73TUNbp2iYweRyDi4VytmmgSo6H/JmHi7t/WRfgiKzOvFQGeTWGafx7+8Yoiov2rVKbhWL
	/IXCyxxUj3ZhGg68r7CPjISRY4vsZHhcGLgBE
X-Received: by 2002:a17:90b:5544:b0:32e:2059:ee83 with SMTP id 98e67ed59e1d1-34733e4c8efmr2697505a91.7.1763722895944;
        Fri, 21 Nov 2025 03:01:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrc8AZ2Iq3QEg/QC+qwSygGiOivK/qGNgE0h1CyEBx7hyw8ywZHo3+0ygzvW80e7rQOniRAQ==
X-Received: by 2002:a17:90b:5544:b0:32e:2059:ee83 with SMTP id 98e67ed59e1d1-34733e4c8efmr2697422a91.7.1763722895243;
        Fri, 21 Nov 2025 03:01:35 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:34 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:05 +0530
Subject: [PATCH v8 03/14] firmware: qcom_scm: Rename peripheral as pas_id
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-3-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=6116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=KUuA5AXV3d7PwlEmiR2ZurS0DdJb3IamebuV5ckZzmM=;
 b=S1fUJVjdmIXkcbBArv2lf+kkveJc/DfSR0SLuYtk9rZManJlUISfhrs3hoi7eCop83xv06Htb
 Tjr/UK2sDUTDpiuEE0mdt6awOLPkJCMkr0UAhvM0aRCCfAJ527G4blo
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69204691 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bcWw3dkznkfw-y6_B5AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX8IFPFAir+F3E
 /rVzp4N+w8NpTptLuAQERpyFPjR1qSFuaBU82zwZEvRu1BIAo5xq1d8rvkZOqmg0c6+was75ZAc
 dDkSYctVqSvq/OsNmoB7c5jQz7+LpOZJkJtAL9jot6Qk6J/m31DripP45AYaS5Fl9C00jLv1f9E
 N3aVk2nCBlo4wJH1pHpVesIenL+5p2dOJWNhyHzZbZz2GS7Gd1bdE4BuRT9ureoNHNItTfEzw7H
 xYo/e2E2QOHnT7NmPcJPgKzCcwQH3lhpkzaMDxCS6Z9t8DT/DUOKwkgMJAac1sPpeAFgicMikvq
 fUGMxD0SSeR/dECFhnzMs53c4ofoyrCtBJV9i9OnTd4jVJafserbfJY6CHkLVA8YrJwn5gixk9G
 VrFVtH6puGsfSKy9D7amRIOwoM7s7w==
X-Proofpoint-GUID: qCyYnwzT_eImduT3aOYjw9Lh_aWg0SUq
X-Proofpoint-ORIG-GUID: qCyYnwzT_eImduT3aOYjw9Lh_aWg0SUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

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
index 26969bcd763c..0a0c48fca7cf 100644
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

