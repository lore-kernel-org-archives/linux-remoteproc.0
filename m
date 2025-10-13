Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C42FF644
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349873; cv=none; b=uPWvglAaLHJbvMKupqtBeCymhcbYHVFDBIGy8dhvGCGt6SHK67oNCoZPf5h+yH0zpnxGz2ucQcYvsqB9CLWZgH0ciZ+Hk9vvpOHTZQWZV+6p/79y9lPpnR/o1YJlk7bfFq0H3fBZ0vXC/tTmWuFC8hn3VUgAwKQzIIQ+wWBMKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349873; c=relaxed/simple;
	bh=VNLUfg0VTMrMLAfssDOHBS/ywOaH/J6hWRjnKH7tG0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsLQuqxH0mM96WzqDixW3KE5MkpOnsC1QMBMcJbqTJxeBMj2FIQXN74BWf1WSa9Nqvto/4oDAYAafVUJcZwYGJIOfhcej4SqtyRALf29Q32RarzX6myucLx1LYe7UggyGjupb0yfjmHTj4M3xORB4ZEk2MQbk1sluunwzC2tg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnNLzU+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnNLzU+i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nFDS022573
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCuKX9XLPL59gzeynIkI5vcGYQyfxzjGKslvVQaoJJY=; b=SnNLzU+iaMBubhe/
	dYgtEERFpo886G9lN+oHgvfDaCgWqQxx9xNdyu7RrlfXG0iqOhhcpMW1qx5EifAm
	sq+qAHTOlYhQF9JUSMcZ06DP3zquYqhXwfNJ0x2/w1ZKytBjoDpBe6NNLl7fUkIL
	s7/yzvtHgfZiIU/o4FwVRETUOvrAc33bmNq2K9usJbzXT5kudfKovfBUNNQSnXCJ
	NPBK9q8rd01lMk88WUbtaMOOob6cSTQAqizsMrDhSZPUJbY2/rBFrv00h6m2zc91
	qTkRWpmJwkuErLH9jDik5L3cv1OENGzZWp0dBbmCm5COb0pGxMfoOTJad4eGiiC8
	GUUTqw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfv2dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-792722e4ebeso7164385b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349866; x=1760954666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCuKX9XLPL59gzeynIkI5vcGYQyfxzjGKslvVQaoJJY=;
        b=hyujFnwUkPm0iUC9jXtHUn6y+9WWmVLHueew4+io1NISo0RsYLZGw5JoHHJoYFn/C5
         VWUT+aL6RON9Irv9kTCdgMkMO5aVVlGljQExsiXsWrBB/hegKH0zGBBxCyAtYH+De21V
         NX1UHlyx5JC9aog6qgvwHa3PvvyrDZ/Uo1BaPJktS4y0LmnCTdCzktPJ5NNP4VGEs73n
         TckqywW2l50hFB3X4LdRYJg7bEpI2nnLIENPIebT9oTF+cziswwFg2gzhA7CBkB5OoKx
         28Pbmyq9Kzwhlfs6gNKUSbfAcg7VelexfKM7C85nSotoYQ3e1QRECT6Cata80UQqOdYa
         Ledg==
X-Forwarded-Encrypted: i=1; AJvYcCXdpPGYjdxn6VTW+KBC6Ur92lhwfXPN7PvcO1CMfYwBkPITIO0fdhwlN4AysddZvx2mKTU7IFPT+9MwQJxz8EcY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2t+wMqzsRBixZajrcT/yMqyHrrlK03eu9cBmUWearKjwkTmA5
	NRkQgECgDgYcaNfy0kgQLtnqon9qp5/nttKaT0LJVQu5amtLkJpRUPbJHsnTCiqsA5NtOV1yvrU
	+/DAnIlr7q49oA8ojfF2dM3F/GSl1p7BXgRJcALwGHKPk0lLvnp3piLkf6JCJMXFHP+xmMsOEoo
	PQYGts
X-Gm-Gg: ASbGncuIuRMlAdSjkiqO0DcDVS3+olpiGsl6tpg5RwO2yV/O48uWVeeI9d457P+HuRt
	lURyIXmSETC4YDvGDY13KHWF9AgTzfee0WPcrJqRYgx6OD1RILwpqfSga6aZxkWnqfFAHSXR+n5
	fEzVg5ZwJRP7IU7NKNwqjvhIbSca8jK1k6lanjJ+HrkW1vG+HVouoZ1EDU3SaZ7u1M21G9s6Vrx
	1bMLgIKJffBtAVrOnL2bnhLMJxjpC1DgenKzpCm1zTQh6bcw2mIT19bO1Etrgtl0DyDnYB6XBa7
	Cho6mxhcS6LLLw8KFcjSlbccQAHXC5ZWxrCD4/mcqMY2/444FNQhIdVtHpTpFpTwR1k=
X-Received: by 2002:a05:6a00:cd3:b0:781:27f8:d2e7 with SMTP id d2e1a72fcca58-79385ce1171mr22405051b3a.10.1760349865993;
        Mon, 13 Oct 2025 03:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwKFN5Yiqp2cQ01LwFms3qJjhy7wGHDj+GAyroqt4GpVGhRA0gNrqB6LOzar1OB3V2kYCqPA==
X-Received: by 2002:a05:6a00:cd3:b0:781:27f8:d2e7 with SMTP id d2e1a72fcca58-79385ce1171mr22405006b3a.10.1760349865301;
        Mon, 13 Oct 2025 03:04:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:15 +0530
Subject: [PATCH v5 11/13] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-11-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=4665;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=VNLUfg0VTMrMLAfssDOHBS/ywOaH/J6hWRjnKH7tG0A=;
 b=Hs0YWDva1dXdF1lXvU2TISdQhUfia8JQNTUeedOomuY7gru/DCU/Maw5FuqqO3Pt1lvS6bhxN
 hfHDTbHvu+ECLirErqtB9TiZKUyLcMkI1blaL5YCCjzckeOxPEDm6kJ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX7+iMFSAzOivQ
 d8WCaO49n+/viJr0/C8aIiynLtsncmd7bnFJOkCvzjneAQtw6uazQOQul5IJzJHWjpTCW5quP2+
 0IknPH9s+CyEKZrv8QV8ccMedY+PF30bMUeSShfSgv2twteqwACuGqWh3epxYALgHTLxBgK8daP
 njBYoblBWKCC1hKJr10K0B2iNe/caZ/zxiK/Q4kirobgV6AAUvEsEKsNSuqBpvIagy8uEFT60jA
 g1wk06no0u55IIpfM2R6mJl/EjiSQGgS9ZxdkyhQuqRbTezygt3YJP0sj3sP3wO+GaknHkQmUAJ
 n2aOAy7/mignd1eWI68sOfvxidXVYf/I/0zYfSTU2x84bvM9JAfo2Ww9fb0m7jhBOSLsvOAjPeK
 b5+L2nu+sBrt9ztbndlPakeNA/rFTQ==
X-Proofpoint-GUID: XNlWTfcv9vdiBwBDJ6lWqTazWaxCDfeP
X-Proofpoint-ORIG-GUID: XNlWTfcv9vdiBwBDJ6lWqTazWaxCDfeP
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecceae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

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
index ee0ea35803c6..1944df49893f 100644
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

