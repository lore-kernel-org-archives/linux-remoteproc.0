Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950625D546
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397347; cv=none; b=ByBJiflixgvhgM4J1mYzcsJB40YrEOhzU0pOfwJZMjxi83d5WwFaXKH524PiFc6Ko2Lrn7J30fA2GaaqdqD0oJRAgT+/CUOti151BTe3nyPq+OTfIoY6War7xTVFMgGFs3bEkvOw6F/lZHbMzVs33ziYrLztT5btgPaDs8d3R2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397347; c=relaxed/simple;
	bh=efDtlZwlqNXGsUWnJ/IQc4yEv4qeocOc8sks53saQPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUpy2EvaaO5BCWjotlm+R49aBOXpDPq1fJeKG2I5FEMx1s9mIwo8JDeIvoo2ioEtlGwgyEvQ3TJwxamzMZe975fOxTlGdPUTbq3gi3E2TYXWraI4lttg+msFdq0LWcJxVOK8qpdjxJab5nHgZQ5G7/ZyDKsPQyy3BDdHqx5BOWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOxsqf2w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOxsqf2w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJcme7032463
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7g4iNvouTJwENle4AlFxNdwzHqQGIBcKvohSVdSs50=; b=jOxsqf2wl4TQgqhj
	awnL9M6Sf+YOzpWS9ZhqRGABP4FNWQjjCJqfuussnDByDx4FVk5FxI20/2nS/vX7
	xP4pCM+MxRir7hFMSVDW+SWEB3lk0hmfuotwsQkRbgoGbpxoaWuk87/Ja7t3/gcS
	55Ya2vVwghE8wmUgREFzLIBAf6sBTlqmGrT1ivaicSlwarc5fmJw6x6xUQnnWsbG
	7qAJK2ojBEm6XyAEYCkeR51/+rauqp3U3MBg6jXnCQr7gGrccI6oy6NgsOQLQA8+
	JDwM/2KYYFdB43E+EG+zrmAZ/y6BabZN+q6YPTAAfXaOZ2iTlWAVh5Y8gCQSQUUy
	2V3mFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv1738-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so4924054a91.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397343; x=1759002143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7g4iNvouTJwENle4AlFxNdwzHqQGIBcKvohSVdSs50=;
        b=lqxtnfQQ5WLIkm71V1o2diH6HOGS89eEVI1mbTZS6F5Ds1vFkWHmSgmtmM+BWDkmqr
         PaqSmPLovyBDRUbJ0YWYJsuX5kjBoZ2T2DL1oJw+MMITy6wpn5ZZ9hMsDZyYaWxVc1uH
         ydwITNFWwzafZa+0uxuxAbzsN0F8zMaAXXbTSGQQk9w31ze6O3bJ5zXFGQ6rhqrflOFe
         NxrgwHyuI488DFd9Bzgs314AP4SU+V87y+YCWfs1I4nR/nlQCYRQHNLn+PyWE9V4W8Q+
         AG1LWh76apIum16W5qyOptqSMnUHeWh+lwArfRo9YSq0eudQMuLzIhpX5PTWHnUMDojo
         UfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMldQ/j8GwbZXx66u5ZEuJppkOkxZXjvAV0LAFtoIQvVoe1CLmVXAKMnjppW3T7COgmwewmMr0MGl2zzrTJQSR@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTGCi8KABJDNCaSGTjzZIUSdecesfx6PqWx+iOwrZIDTpWucN
	d/C4nZdFlRVTpFRtQgmQ+rdkM63IkBLzHvHMwcIgtoZ+FChGkaSW4hkh5u2c8Q3AKUlvXp1iAS8
	UvrSc/ot6QHThO70aquvuYgFn7pfJmtFqhn52aB4EXLmVYpULv3DkzjSNVvVcjW1PC/cUZeI3
X-Gm-Gg: ASbGncvYMXkwGZBoWQZY3i6q+AtgjllCIx8XqvHp8NxqkuUoV/t6yMj1dCKqR7rpNlN
	UzXT8ph+1IRTemPzsnyMW4FvVs5k5LHIxmm9X2+hEV5bLNQ6GcVLhH1xWWxrcSMUH1TM192NUVv
	xDBvLmO2BodWROYGOGQe78sjYx9KE7L9pTeCtWIIV0Qm7aZdG311CZdFaRva1mEIw94bY2kEfVw
	JP9asQ57uNMdQXR6nWuu8GJKjZh+FVY20Iso6+ve0CgHIWJ7lYNseZOmNItORurpo4HlGk7PF/Z
	QRJovjZCAn4tbpRjejbGV+IwoWqoMnfFq/mR1uFNlJfzv+mlbBnW4FBzSkrPAc4oCsA=
X-Received: by 2002:a17:90b:55cf:b0:332:3d8c:eca9 with SMTP id 98e67ed59e1d1-3323d8cf9f4mr1815992a91.33.1758397342570;
        Sat, 20 Sep 2025 12:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSzqdqtKfbpof46T3zhOk1h9BHVrN4p2HbKSnYPa386l3mvYjuE5wUjCDIwJn1T4s1yrfmrg==
X-Received: by 2002:a17:90b:55cf:b0:332:3d8c:eca9 with SMTP id 98e67ed59e1d1-3323d8cf9f4mr1815970a91.33.1758397342159;
        Sat, 20 Sep 2025 12:42:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:08 +0530
Subject: [PATCH v3 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-10-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=4660;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=efDtlZwlqNXGsUWnJ/IQc4yEv4qeocOc8sks53saQPI=;
 b=mKk9cwx+rjx7jJROUIoaTbJofNcPTE6Mw5Vn4tEUzipcuIDC0lf0mEyxCw8TVtkNgTfcEQ9Nm
 kWDUvLjVcB8Dt394EkEZkY62Ya4SirnUwJMKqqk7q02GWc3tRHp/4Bh
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68cf03a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FTcZdvcg7IK7QEJlhdRZ75EYJL1T4pI1
X-Proofpoint-GUID: FTcZdvcg7IK7QEJlhdRZ75EYJL1T4pI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfXy5bOln0C9X1y
 0d1RYeYOZCB1F+ANM53wC6KN5oMtax2va3Os6xDSWdBY14on4LAvk0XH6lDaXfuKDn4oBVNihto
 3AuvNQ3yOjOmEYjOtZoHsJyGZNELEbBliOQgKxUfMutCwcDxOK+Stw9hBvzVGTK5g/dh2+PoZEW
 b7df8Vi25ejgEgUV1Uv/JTp9/sv7q1oaJ2uTADEFr4SznlHPMm0giU6DKDw/ys1Fsv3E/AMXK7E
 86kt3a1iwIHNGwlQuZ0eN0YaVM6NoFCw0KG0rVrEQZDTbnLQ9kamXy4UV4GpPIkE/t1PA8RrbRy
 c5rs5oLrGsM7//55oMo/FznOqPDkralcAgl7Of6opQ/oRzW23ftzPSFKHex/dInx/+RYBu0+7cb
 HxqD2+Pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031

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
index ad87e0334a7d..9a0c0e8f5506 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define MAX_RSCTABLE_SIZE	SZ_16K
 
 struct qcom_pas_data {
 	int crash_reason_smem;
@@ -408,6 +409,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
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
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, table, table_sz, &output_rt,
+					 &output_rt_size);
+	if (ret) {
+		dev_err(pas->dev, "error %d getting resource_table\n", ret);
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
@@ -420,7 +476,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -430,7 +486,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
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

