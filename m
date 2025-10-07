Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C72E8E03
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855796; cv=none; b=IqajzrwOFgk/gaw61j2w2j8XX1Bp5ooYjjCBpfWyDt+bPv6KezeWbP/ADGlHs37kUOxak6A1ivEkMnLrX0PLvZ1BaXCD+zBzGHIhPITiO+gunre2dcHC1zIs5iepU0vMoOS9S8BuA8iwB+wLaPo+vxKlsjv8IIUi1T/0CjHrA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855796; c=relaxed/simple;
	bh=z1QANoF5R7XjUfSd6H1T6pJE0Sh7B2+LMNkBRlo24CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAzU4XxdmcpvyGgluvDVsIHA1CiBJ+PhJA9pWDO+qLDUk8J/k/zWEwRsBdH+qCzlexTfMW+ikD+hMY1GYTFv9uKc2nkt1dWECh7RU1/P3+AbKadnvN+RC+fZN68AvvNPoYSifROtum85dL9tOQeZFotwcDsQbXFmJhhofhdGeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvGrNIO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvGrNIO4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Ek3kk011184
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TaLai26LIfDvmmGlyEsDFdePOfnLzruH3EdS7qMRxcg=; b=MvGrNIO447XQc8ee
	5xU2eigkt/BO4IwmbYNijb0O/NWzJJPl80l0S8KpNP0+ShI/eq4U/FXhtDl4zMS/
	6e9meMrjQ8+7TrQqZGUZK+8Tbh7m6SWFBDbPbfjT9jBwF6NBTKwZubGFuai7cyqb
	bQ7lj6sq7CeGIG37m6exyLem9BJexxo7ceuJdvsqXcEEP/p39GzMEf86jVlsHyNQ
	MR9B6Q0rC7cqtxgcCIRi3VbE+54Ry/ZtKR4DqcWDdN7RZT5wo+CpQd27YR+LOCIA
	UBmxwe73SydPVE9RQ+IOVFyT5eCHSp53CCfKM9+/qpbNunkWHbmJb9aE67JxbFoW
	T1cCvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkrctu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28d1747f23bso61803885ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855793; x=1760460593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaLai26LIfDvmmGlyEsDFdePOfnLzruH3EdS7qMRxcg=;
        b=X6J8oLsvmEBvA9btQNnhWZean8IM+1mIn6D1ohcb6tVLCEtqA5AdLST22qavBzWIl2
         +ZXsCkykpNFrT9C0t9Qld4w3naxwVFdwmVD9o8yArTUkbDv+gMyL0oYtRRXpFSfDtVZD
         CzZyLQnmEWCZMH7vXqMEcf6d3rk77swnu5EpxZ6nuMujnOnkVOo5SRCz1vtNVYtlpijZ
         ixoTtfvoTdd5gIZmVwtvgKri5nXSYnKtrORXVvf+YQ25QgcFmrY42MU0anXembDARR0T
         9zZOSod2g49x3FGXHQmMRhdtG+Zo/Aod2ww5BvE4PLOtn4MQfgWPNYR9XUlBSOJnG6ek
         T+nw==
X-Forwarded-Encrypted: i=1; AJvYcCVnW/6BrFTDPqeEiVj+Eh48glMg36gdLcijXu40dKEzKy31lJzEG4SXPV4bPLyU/Pwgd/8zBMxTKOySLyir4lzA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1kEkuIs/HdMMFfx2B5inFcc0Eq5rTjyfDqqxh4odv0btHA4Go
	Ne2jubava+9Lh4Gw9nIW18uL1KAkGZGuiMoICR4pvmu0ayR0uUOBNG4e/BkKJpmaNmBw0pQnidr
	svpvCOOQfXqmYiEUUEFMYwVdqCO8SS2UrVz8BvjugXE3+Qz9lusZHFDwbSvDC+fmnPPH6Wue/
X-Gm-Gg: ASbGncvsxj1nMbTOLL6Y8qrugikRPNQlon/G0lISesxmwmn6gY6gBJVH/q5hbzKHTKe
	f3rSTMgMi6WEWkoREE8sM1f2/iAaAfDf/lHYUfZK+fdoEAE3KMeAU/6VENUBBMsH0H8pJvTcwB6
	sBFXNE+O2OD8d6Ai8fX3UdBcVSMZpuWdS1J16/xZiz0geGnPvbASQ1juz8aEDERJLWqdmz1vYon
	Kpkvk4zkNy5mP+tyuRo5dxZtdU27aFoLWpPyi5tZJp2MR5Hk2HNJpSZFSCE3uhybmPUzlQ/EAhO
	fnxXRVZvLg/YAsBwYGOJntAmWMZ7XzwtrIXDZErvrvR4M/IbxOWG4OgClN9feXEuT9/xtraP
X-Received: by 2002:a17:903:fa6:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-290273748e4mr5773135ad.14.1759855792485;
        Tue, 07 Oct 2025 09:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8TDfVd+6wKCu0QMGvlQmp8DxYDliBXJBLtj0ipRiCfpZtBbh1EWFROLGdmlDrkThvRevybg==
X-Received: by 2002:a17:903:fa6:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-290273748e4mr5772775ad.14.1759855791791;
        Tue, 07 Oct 2025 09:49:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:55 +0530
Subject: [PATCH v4 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-10-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=4661;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=z1QANoF5R7XjUfSd6H1T6pJE0Sh7B2+LMNkBRlo24CU=;
 b=1gI4rCJyvUWYmOCWI4RG2FEdbbUbSzgmpvJ3M26s9x4RPeuELNYZscH/BwFu7TPAM80/lxxZU
 k/88Q3DY3RECzrs7mqi66xAlVCx7+2icbpB0qpHb4Rc1Xo54un2KO5O
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfXyhD2K8ab6pHY
 sNO8jNkQgtnKHxRKFMRYP8jfkV/6ZPgWQZT7TvqFajv50lmpRHE2rDkXNIxxfwEklPQ/dZASWHA
 uz+bYET+L+hJaPQeNWbkzGrXaduq5qNYM8Nr76cvVOnMYj+h8up6ZJNW8XqYG2cR/dk8TLSmK9v
 zbOwyn4mqG0iuEDD+swPDa1C1V32+8ued6RMi97HwvcOf2ZwGMZJWt0//dDgfkMiR9i30FB2nlL
 CAKZBaZtTYcQK60dXm+vlc7+93q0VAI2zLNgWvuwpizJd8B5d21k+UsOYY//7d5xF3geqAO4yq1
 F07r63KsUDh9jWH04Ckv1SZsiiXnF9oLD7ZJPlcYqezowz5VAqr5/UIpnJgVsa5M8JuJnJl7xhs
 1PenLN66PKp/g+IaCBsx5SRdkSQDlQ==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e544b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Brgr57X5AUh4lgjQgsQJJz4VwV6f3EPy
X-Proofpoint-ORIG-GUID: Brgr57X5AUh4lgjQgsQJJz4VwV6f3EPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

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
index 46a23fdefd48..ed7bd931dfd5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define MAX_RSCTABLE_SIZE	SZ_16K
 
 struct qcom_pas_data {
 	int crash_reason_smem;
@@ -412,6 +413,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
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
@@ -424,7 +480,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -434,7 +490,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
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

