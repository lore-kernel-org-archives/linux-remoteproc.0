Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7430E843
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241819; cv=none; b=D1lPnkswSTDTpvoqG8xRiSx8Z34OocSdN8ZG5DzyV003p22qAMh96kKu1qhKsVTB9fIYLyDoTKw8mhFqAS1VspRIGvtng/KF8tF2iY48RLlA0J8dIabQwtYFy6AIPCBrQF4aty2ggXC6MUaWrjfR4LU7jUDmLN1S7Ks4ZoasbG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241819; c=relaxed/simple;
	bh=SPbBPSi10R6lHblb1vpzpsFayZmQBr0aoeBUarYvBas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3LnKRjhQl22KuKm8c088YGa+HT+HVUvNljx9AUt0QHKrlhExQfaQTmDNG5IlOl/9FUJN1kKkx5si4teLesavl7QKFNRYHlnnf0d5M/cQm1i2B2etXwmrGrWJ/lPtLY2xwIrPgVPyuapWwprs6kg7R4JCjAnHNRDmgJNUKUclGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHAwzN++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITjnEyjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHAwzN++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITjnEyjV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42Xa2m3682876
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN79bYgLExrHMDLw3jtkYM5FTuW1mphr8s/36p5UKqM=; b=WHAwzN++1n7wudld
	lEIM7fj3duHH8WmYX7cxJMW7xLJnxSkejADlBtBflai9h+lYKXQpR86O3tNvSm0L
	unoSsXuqzRwjgOxvyG5gmPFNAKc9jk8He/CPVEz5s2QfW62nWuTa6xPyKNy0y8pc
	Dhb+l/+D25EhTuV2O5SM8OUENDv9h5+xW38gsm6Juj3hR6MaebxCIprDoRcYEnFN
	7ilvma888vMj2ix8ss7nqjUMRa8u8xIlDRzz02XFWi3DZhJ4VSCzIkemj+1qkc1r
	Z3wQn3DsNv17JH7fQe1A0mm3DhuIGXormyPxC+ceIyEn4/T5dQ90Oswvs+JlQ6Di
	atv3qg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqthsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340562297b9so4512004a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241815; x=1762846615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN79bYgLExrHMDLw3jtkYM5FTuW1mphr8s/36p5UKqM=;
        b=ITjnEyjVCb/rQ1rloRkOzTlxSmiItNd5VgYx7RxuJrGHLTSKf1ix4VOYvzx1yXnsTe
         pvaS4OzFEbYq7lwE3Fdm2EwKEmrFag6vS0p61e43EwUIDyuJ6mYT1WP9jrB3Bv8J52SA
         WutTth56JwszwkR7fxon146PvqWNltFGfDsi65sBQP9GDsVT/vJuGUuZWkUR6Y91avSF
         62wzKohI5lQwC64gAnGL8ughBMqiIfUw8Q7yktE7VKD623o2O3YtuCS6/IFoft3qW1bg
         KijvVD86YJg7JJJvA1JiuliNvW1Ml7etVB2gw/ardLbQB+MIZucDQnzJ4MG4Ojpq+Idc
         LjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241815; x=1762846615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QN79bYgLExrHMDLw3jtkYM5FTuW1mphr8s/36p5UKqM=;
        b=BrScX5omMMlCEx8Sl8dSuTVTgjLwrzXkrFS2vy8ScUFSIZg2auaC8n9HMAdzrlES56
         F3Ih1W6vSLbVFgPObr3IjFLQlXMaP42U9BRAxc5SP9BN+U1Fmf+sqti142qLa3gZ0JlE
         yzJYnRdHg2EFIE/I/x9aR6wq2mEaMsU0ciIzjzO/DSwF3qDnXBGrW9GfzApwz3UfqgZ4
         4EFex/CQXczgc4YbcJU4pEgrr9RlOE/BrSjMqCDZc5vMBPHVv5mCIaRYw4iJpDczGFhG
         5Kg8uglP+GpIu/6u/frfdsDCjneb8FsbMp6C+kXulaH/wPP2ihCekNpEFEJxpFoqTEWt
         VByg==
X-Forwarded-Encrypted: i=1; AJvYcCVsvyosI3PzgYJ5Jaz1kQgUyU3px0ktxgEq92bTvTmKHcyEU2/5U1JJ/tHR0KHkOO1Cxk4gX6YaW+/+TRzY4SAu@vger.kernel.org
X-Gm-Message-State: AOJu0YzahFL8ncX2E4cVN9yDAMnNjnL1J7brCaLIBxfbEt13aaIGXl61
	/DraAzP9I8JErpmK4rCJnyuQgbLRLdAOM8d0bQDapgLfavuW9oEoCaupUtH6GxGDY3nZUH1HsWR
	JXMfYYDyYhJ+aeW6t4bKcl14IJa3j6gS+Fnz2in52RA2dk8G3yJOUAqYqtAu+32gGWOjELXz7Yk
	hwKW+v
X-Gm-Gg: ASbGncuaUI57K4PtjBgZUD6yT5KxhNBVHsWThw/DHTMzzBO4YNGTM7lJDftxGuhz358
	SpZJDNHccvkkKEzXJSHtIDnchvJvax3qnpW79xCeNKSCoun+FphMiLaKEmOMgBHiQ/EBcm64Wz2
	v9KwxVg6yIXAhQzKmDddkUm2lKx9Ca57hkrUjv8S21am6YcBuuIubrkMqTi2+/6bTRXCoUgzppM
	M9nVHoYf8xmb2LME2J/hkM+8bvDhk7asXlTgMc3k5Ms8KTrcXkjHpqor+zN0HwOrW0n8kZHa+g4
	nwjMrjZBRmtrj4uyzbR8D9BQdoxUcAVysKqJIhMuYfqZQO0S/W6OY21K0sDtvY73ZTwdSMyTdeh
	VhoH5/UrOSHmx13HG2xDf8/qlBA==
X-Received: by 2002:a17:90b:518c:b0:33d:ad58:cb6a with SMTP id 98e67ed59e1d1-3417187536dmr2597614a91.8.1762241814873;
        Mon, 03 Nov 2025 23:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/DMF+EhMqUVtc2g9eEHl4gKchAJbU8OscDik87oWC0apUaH5ar1uUgv3iGcIE1UDZCfpn5w==
X-Received: by 2002:a17:90b:518c:b0:33d:ad58:cb6a with SMTP id 98e67ed59e1d1-3417187536dmr2597566a91.8.1762241814220;
        Mon, 03 Nov 2025 23:36:54 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:53 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:52 +0530
Subject: [PATCH v6 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-12-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=4665;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=SPbBPSi10R6lHblb1vpzpsFayZmQBr0aoeBUarYvBas=;
 b=x4jQH2sLeXvW02fYEgGlcX6Tivl1hQxt/Rf8NiqrZhz9/Z/HL73VufuzT8YaDeQK2aa5DbHPT
 KS4CUvEtFFMCoqpVWasUPxQrRkjRII3Ir4CohYicaQ/HHgmkQ/8xHy9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: HeWKmjaVvXhgSIjnnK7FtfeNzZtoul9D
X-Proofpoint-ORIG-GUID: HeWKmjaVvXhgSIjnnK7FtfeNzZtoul9D
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=6909ad18 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfXzjSdHN+ovhNb
 DbEuvOO6FZEuZGvCsZUA3NAl8yRVl0MiPNWZCfA5il6zAVKLh8nfTZ0257pU55hRzsmpUZrwIoT
 OdoDdbiQ1ld4FNw99sEP4O1K697FHwJzDh40pghQMWwpff0uKjP6EG0GTY9zfuiqBn20jXZF+Cx
 bVMv9SxbRKgTOw/1xcYL6QWiWe23ZywvdUrRTDC2UYYo6kFYnNcH5WtaqNc59NbSDeUUQDGbZ4v
 /GJ9D+y0ssEh3uhmV/kMXdRn/zW7LzezKnI9rdzrcos31Emt6JZPBcvDnvpZv2YG/M7AHFn9vE1
 1+/eOKuzhfg4CQYmUo0eRCsHD6Vzs/uyMlx9cpaFfr+xdEbWtWs+xB6CBDM87/9SDznnipwCezK
 5ple9GVHEsnV8NM6OgGGx5SaW+uqmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040061

Qualcomm remote processor may rely on static and dynamic resources for
it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
or older QHEE hypervisor, all the resources whether it is static or
dynamic, is managed by the hypervisor. Dynamic resources if it is
present for a remote processor will always be coming from secure world
via SMC call while static resources may be present in remote processor
firmware binary or it may be coming from SMC call along with dynamic
resources.

Remoteproc already has method like rproc_elf_load_rsc_table() to check
firmware binary has resources or not and if it is not having then we
pass NULL and zero as input resource table and its size argument
respectively to qcom_scm_pas_get_rsc_table() and while it has resource
present then it should pass the present resources to Trustzone(TZ) so that
it could authenticate the present resources and append dynamic resource
to return in output_rt argument along with authenticated resources.

Extend parse_fw callback to include SMC call to get resources from
Trustzone and to leverage resource table parsing and mapping and
unmapping code from the remoteproc framework.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 9feee2cb1883..a8d3d2e9a70e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define MAX_RSCTABLE_SIZE	SZ_16K
 
 struct qcom_pas_data {
 	int crash_reason_smem;
@@ -413,6 +414,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	return pas->mem_region + offset;
 }
 
+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
+{
+	size_t output_rt_size = MAX_RSCTABLE_SIZE;
+	struct qcom_pas *pas = rproc->priv;
+	struct resource_table *table = NULL;
+	void *output_rt;
+	size_t table_sz;
+	int ret;
+
+	ret = qcom_register_dump_segments(rproc, fw);
+	if (ret) {
+		dev_err(pas->dev, "Error in registering dump segments\n");
+		return ret;
+	}
+
+	if (!rproc->has_iommu)
+		return ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
+
+	table = rproc->table_ptr;
+	table_sz = rproc->table_sz;
+
+	/*
+	 * Qualcomm remote processor may rely on static and dynamic resources for
+	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
+	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
+	 * is managed by present hypervisor. Dynamic resources if it is present for
+	 * a remote processor will always be coming from secure world via SMC call
+	 * while static resources may be present in remote processor firmware binary
+	 * or it may be coming from SMC call along with dynamic resources.
+	 *
+	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
+	 * or not and if it is not having then we pass NULL and zero as input resource
+	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
+	 * and this is even true for Qualcomm remote processor who does follow remoteproc
+	 * framework.
+	 */
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
+					 &output_rt_size);
+	if (ret) {
+		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
+		return ret;
+	}
+
+	kfree(rproc->cached_table);
+	rproc->cached_table = output_rt;
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = output_rt_size;
+
+	return ret;
+}
+
 static unsigned long qcom_pas_panic(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -425,7 +481,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -435,7 +491,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,

-- 
2.50.1

