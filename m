Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F7A34B417
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722935; cv=none; b=ePC97toY0H5bkIbdhCQYUaRNxtQWVei1PO5EjUwiPa6YobmqPUCaRFfwDc22PUP65f74+TMAVxA0ZOnQ8WL1guEJfa1cy+qyjuH1QRzQh3+EzbbCnqQv/BAX79lQVaB+j47NLcRw16J6KtRIG5t5L7ZiQNFQ6/sE+I1H2KNLpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722935; c=relaxed/simple;
	bh=i0l1yd2psvmNReSCrh1wM3fGQJyLpQp0JIKKuUcUls4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhJseM/4xaJg4T8hLC6+ZN9JFYTLQsDMXAO3NXi65NJsuFWRxYwd+z8zP4oXVyYfuxHfZMwY225pU5BNcfflO0QsQahKf4wvUOb2uLWPaefr/ebhDpn/+HH74TXrl8Ys4T9AwN/mm7uI0APjcPdhWiJiASXh9c6QAOQdcenVdek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kviSVaAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbHI0ajd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kviSVaAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbHI0ajd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5TPg52832145
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=; b=kviSVaAUfDQH/BhY
	Nu2qrz5q0Q5T3gvMwL3ho7vlE6ev/WE99AHH3mUjPGyPUU+28/ylf0YaRLfNBT8D
	k5k7PaSFwTn5TY3swoBdolVAoLe09cdhA/y91Houeg9isaGpvW3+zmR30CiwtFaR
	d4h4atkL5KxATiyp56hUvG209emkMitQmFIvIN4e4YsCt2uW0BkAUDx5JlfOb7LB
	pnWZ4q6D95IdtOSGs968gm5sgrBWEqdWSQihcRPjZPt1F/zOKlnPuCL+BW/Afwx8
	U+WZGWkOdVqVvBBUGeDrixodM9dMNG1g/WnMgF9cv9ftfWWnfViZiB7Jd+GtAJky
	Kd6MUQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq14ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34566e62f16so2321556a91.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722932; x=1764327732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=;
        b=JbHI0ajdoiyPjH8KmV4aPjrRrR//J6lAeaD3c35xR1yyw8Y0kK8IWiCRoeS/W3rEfy
         cf+pOZS865JEK8GXU38Yil/9/X+m0WWCyyPqCG/nycSZiD59pxkHWYhl3OTXsk7B1ohf
         cGBxThx+wTPTcsyqMKuYO22empi4BhS74fiwmDKI/+MLxEdZWZjtZv1yI1Rk0Jwu3ZsI
         c+bnXCA5AyQ87XqdBi5k8EYySuf0nG/YuvcsGIA5057AFJfFSt1y+zBIGlDbEuWAAWSh
         LOxe/o95JvlRzAbW79ADdSy9xkdXc0RXQtPiwK8mHctKcq47JogKJw5/OGEMyY4Axfaq
         ynkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722932; x=1764327732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=;
        b=oFW1+E4FXZfXjaUaYS5mm1FNQAf/hEaACdTnDmVgiwU5/hY9n2KWg2+QraK0FZN87b
         DqJljL3PFLXdUeXEiuJxaUWnDWSPhyXNIJEhEuOOkdb80UrJsVnkWHaUeSYtmGPsZipm
         aWkIpMvAJ1mRA+DDZvPjBXpNu0CKucxPfivZZN0sD4/uxKt6WlTlaXaQC/H7/2tuV4y9
         STo5I1YtDz7Z3vsxBUcObMkkhHPAAvyeMCupnWNrUVX+xcGsQ/F3kbbXLl8g4blDlNSB
         iU2cmt9Os+uNwExqN/9Fc0lAAxqTHjZzEj/N1JP/up5JSuRYcLpyBc7QeRodD1mbkXyT
         gTRg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGB0wiW2vc48+LswAokCq0gEBMKST08/CzctyN5Kc4yDcUxoLaHBEIyIg6MtbF/SDSG2i4BFc2ClAkyqaKxrm@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHhVkQQKDQllmQAlRHqs9qO7fsvO6yroCK2CXDwNik5/0ol4e
	KxrNyOjz5sQ+Ee6R7Xx9p4wygc0tsjQR/9BW7eeMD1RVUpXagfmnjtNJa7ms2vRTXNv/im6i7yc
	uAWfuXgsrNUSd9IYg5MSBrohD2FY01eYHqr2duwq3TsHK+vNCf8yVf3guLQDCnKBUELmzeszx
X-Gm-Gg: ASbGncuC2u/iCjiUpLcdLIbx2gusFVPRoUbJeMZYsMVIne6lz2+2gKSlNr3sQkBqU4Z
	ps9DwI5VnfTNUM7gOKfdnK3sBjj7NCYcGPlOLRP/n+f5jF/Y1siIOJBSXurg+WE14iwePBW5nSl
	AxZjJ6VqvKO1Pljv8mxR6+HuxvrjKPqun8bU0QvW9QmiaKlMD/N7J5OmUpc3y7HCoRz/t67Z9TF
	QmgTYz9JpRiGwugFcR3xtgcTGwOyBJW4evuUG2AVNJeD5lYc14t33GQBClP+Id5eFljTyd49iD+
	LhMsFV+y5740No/OOV3m3TvPkN1R71ACEf0+Kz/e2qVnry8b6500FSOOM5OWz+9AMWG0sCJuJjf
	QOyp6GHlXJJ7yyoMQ6PQQeGDW0QTGBqxxeJoD
X-Received: by 2002:a17:90b:578c:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34733e734f9mr2018548a91.13.1763722931532;
        Fri, 21 Nov 2025 03:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZyBfliX1taeiA8tYnXeLxjLCQb9p3ax09FQZM7jo0MPAhWPaVofZjyYvJfymsad1E6zSGrg==
X-Received: by 2002:a17:90b:578c:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34733e734f9mr2018499a91.13.1763722930831;
        Fri, 21 Nov 2025 03:02:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:10 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:14 +0530
Subject: [PATCH v8 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=4665;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=i0l1yd2psvmNReSCrh1wM3fGQJyLpQp0JIKKuUcUls4=;
 b=LYCjqV9aANLxV2tv1O9a0YYowzUv+ssFnf04PIj1dwISr7QrZKNripbfjHn5pN95Gw2cAYkyF
 hdM6iv1GdWCBJ7uzbJrXyMZW9PyZryoGGHTxyiEaRSaZFyAvvMXvnFR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: HuO5h27OvTgvIaGSrg1bkzCG9UGgYyuM
X-Proofpoint-ORIG-GUID: HuO5h27OvTgvIaGSrg1bkzCG9UGgYyuM
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=692046b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX9lcdIGgACpeA
 RFv/Afbx0eL16S1bdu+S64JcunJ+xnc2uC6YqJKJjYVQVqDWBMivECcTQTbI9x21RNQnAUNmWE6
 HX7HEYV7Jkqq9Yo19wTlH/4kj2To9cunbN8RvWXDx2Pb++LPu0wJxnRIHRMzKnnNCVMwa10VVko
 vQloeahobysDNlvF2Ijr5T6zAdEPKsovDGnd8sHrcg0nsfpTfU5m13q8mI2e2+KhY1Xm7F2vH6A
 sNGUvR1qGuO3WFs9wq8n2PEHMgFBevQeJeLtsbO3ibW6NMfPctklWqMBBcS+qGBoQ8kUxXNOypL
 FYubMhNRiQZZ9Sjt3BvEzQ1DHXvSY2/39sPQtt/9x10omBfQiscZjVwyKFU10WRkaC2+34oAr7e
 wKqTngTFpbeJ9Q+yP1+rInGoU1ldgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

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
index 9feee2cb1883..186a90d6c83a 100644
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
+		return 0;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
+
+	table = rproc->table_ptr;
+	table_sz = rproc->table_sz;
+
+	/*
+	 * The resources consumed by Qualcomm remote processors fall into two categories:
+	 * static (such as the memory carveouts for the rproc firmware) and dynamic (like
+	 * shared memory pools). Both are managed by a Qualcomm hypervisor (such as QHEE
+	 * or Gunyah), if one is present. Otherwise, a resource table must be retrieved
+	 * via an SCM call. That table will list all dynamic resources (if any) and possibly
+	 * the static ones. The static resources may also come from a resource table embedded
+	 * in the rproc firmware instead.
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

