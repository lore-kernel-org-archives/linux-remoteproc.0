Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF4C471418
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530319; cv=none; b=YJqJrkPeyEHRZMmA3kQpLzNcYjU1bEv3HldmrRTseq/BEmUZSJiWlWj3uMpPuK/5cPSkYgYnsk/fxubkW4qx8QKxBOBP9lOmHpYglfI+q4SPx8lEIT/q2SioI6XxIRKWQ4++IUjn+aTGWEUjTgEINQHhvr3gE0uVS0qG0QthZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530319; c=relaxed/simple;
	bh=77mtKIo4BSW4i8qwL4OoIf5/wqFv77EuAuZPWJUyXAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiLlQS1l6uw+DBWQSlIfMi6xsGJSsn3W95pZURGDfHaCZQxFOGIldGcCgUL/1ED/UkitsAd6z5v3c63RWFGVlLcIhC9YdioU+DXAtuMNrIOFfYQgkphjz5gwLTRuHXZRQfsWh0ZnTBzFCNb0wsg2V0/j6QshdhqhTpqvJqudm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFHNs5DX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxotFHfE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFHNs5DX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxotFHfE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIuq966430
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXRcM0n5/vIBtdrd6TH2nUedfWDwyfSE8DxpxgzsVD0=; b=DFHNs5DXBBxacmMC
	hL7b69u9mmNgLDAMkcTz8IvR3H2Y2BnMq37nUod5kJTwQVsiGaipN/Yh04qXu/5U
	bXT6sTF/HiEGY9ysC+lp87QGAvoDbnz/NPLpYytRXv3bvZvqr3ynbyn38K5Iw8Ty
	BmMjeJxvvWX38ZbW0ke+vT+iX06VjaPEg32K03EcwUHa+qkTtWo6t0xIEQFjYb5Y
	MF0a9YxJQS0IXmAkHiTuwRVcRTJT+/SuW41VyohXR/4n3YMOpGMH9sG9KNq+Jdmk
	diJPtW3mZaNL+rMsi5Vjav1vwbeqncHQ9dNcrIhVisV4et/lQSZOhogkAR+SP5GW
	vABidw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2d0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:18:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso958065a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530316; x=1792135116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXRcM0n5/vIBtdrd6TH2nUedfWDwyfSE8DxpxgzsVD0=;
        b=JxotFHfEeIryDBxPpIi5cXuHpKKfilkbd3XrycrF68bfzV5HWUW6s2S7GBqnBI7chE
         PhF8QowuY3gftzT+6uK3/9fNgLXjnL//16tLUCv2NO4IfJA+FataNd3uGiFrzTnAuu/Z
         m5Edwm1G3rw3DbT5aTxg8vq10HYnVfgH6Ak0jkAnbvK6F4p/K7aGs5oqk7Z5JbU4eiv2
         BwFyC2Mcn0Cvg5Oyru0JaYa9PLnnzJ5MXRb9mpwbp9kyhbWOzuDRDaFcvjGu8Ar7/tUI
         0XsjtJEV6QcgX2jtSasbHGBydATsKOw7TSzB8WPNToBQO4QAzxr2ivQ194ywtboU7b5f
         UijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530316; x=1792135116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXRcM0n5/vIBtdrd6TH2nUedfWDwyfSE8DxpxgzsVD0=;
        b=GaXiZfrA5IE6cKRyD5dFE6YSp2f/L+6E0Hf5C1DNkClLx29P0UsAxJM06kW3oYWH1/
         oo86pQd9lTgjSTIGgUFOLm+H0Ns+WfBVY8jyFqubR83JFnXqiDiax3Fqevotb+eF2mz2
         YqN7J0o0iKNqiXi8bb4DZ/3QkXJwdfPj5/L8nKXjA1Dxlma4k7yZXmS1RmAYbSf55jB9
         SbONVjt2UVOZA6F9id/1V+h54wZrasWF3Pxzc0Hi5k7A8LKMzhFg1yZjCpa2w9tFW07U
         xgX8uaCnnAs5LsKA+yVQu3hgzO94wfEGTZIqkFtW9ZhjSfeZB4jG8y9LDug9SzZXaSrP
         aR4A==
X-Forwarded-Encrypted: i=1; AKwUvBySdDwk6LhmYRBfay31K6QXhYDRR8YntJV6uev5BV7xFJVnIXe+DsY8V59MCSmS1AhE3U7lKsMpjusTeJk8CIOf@vger.kernel.org
X-Gm-Message-State: AFq9FYJDHCoMJrM7rXbyViGxdRUF9bxD+kpZdSfoRFA273DJ9SPL1Ixr
	vTNLaO1YXmh+RLAvtvNQcN+KIqoSL2s/ErXoVRDw0HGshoVxKydRJ5aMLmhHQWRNK7xuRsSIYvB
	jrAIN/vEZvE0DY/yFExNNcT2lkz5BhDUnUHsdGFeYAcL6ib0w06kq3DYzy07EFblTsv+MZnlT
X-Gm-Gg: AYBFou34YhKpfR4Ym0mEgdO934Jdf6wSIKuzlS42h6rytIL8eJg4kDYSWzWDWdN2Ssi
	X5HYPtruuAhhzDwWUb/qWbEQyPjOaubnxtSy6IhP0SxoGWJZ8MilrDgYgLpr5N0hJjByPxXKQfC
	LdCUt/mjrAZWveB4ZOcuZ+ZuYVdgmmgO0W5cclxMaIny4V/giWbtMavPZR8KYhszkUMVmugRPVL
	gEDm8GeHlg8UQk7DJf5ZLFm2cpvUOjN1r9asGUYSSvMNHCAiwKpJmb7T7dqBEnE0O0+jvu/cs9d
	mHe+VHVQ8e4X6fW4FI1EkB1ty9kKSbJ/7NmF6CDlywWwhpENmepy8OKTD7YhnSf+40pVrj5c77u
	ro0uPOsO0GTxm+i/Fk3BzbDZj7ZGWKNXtCH7rvTOzZvkc8ijJLy8m297VhTpKsE9+dLR5y/Qljt
	dNH4Hz7pDuSZMP
X-Received: by 2002:a17:90b:57d0:b0:3a8:b2c8:8c30 with SMTP id 98e67ed59e1d1-3ab36d24fc4mr1008785a91.23.1791530315910;
        Fri, 09 Oct 2026 00:18:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57d0:b0:3a8:b2c8:8c30 with SMTP id 98e67ed59e1d1-3ab36d24fc4mr1008768a91.23.1791530315420;
        Fri, 09 Oct 2026 00:18:35 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:32 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:42 +0530
Subject: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=4626;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=77mtKIo4BSW4i8qwL4OoIf5/wqFv77EuAuZPWJUyXAs=;
 b=d2ju0xybSYEadoR87KvkVTFUHUEdY/7VoTW03S7zWXm7AHEnb5TthscYYBS5FHWpP9Znp7xyZ
 cvhElXjmA/5BiP3YE23dsLbrGTjwl0Y1G17zuk+1Le9OOwaoKJYpUz7
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8954c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zXOaa8qRCUFxpe-OOBQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: YFnLxWFRSq_JgdZc2WndFI1t-iyx1JxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX9Yj3Y0Wx9XWF
 ve8iBUUJELXcau/PbLXZ+rx5k3nFNe1u7n2kA7WA2aQOt5sFhBVr2urP6SgISU77+D10kRanCao
 spGoplbpJvhewCvfbl+Yq3lZ6UIKDtdxZItj0Ij2x7VsXnkzgFV5fdVK9f5kSx1i0xJQJjzQScZ
 sYu39qzDRxOmGDAaksM4YeWf/SS6QYCJeOasxLa+iVP6P94DjaUgIr9ODooEbLsmzGeDg+yf97Z
 rTcgpkpmuTaJL5OHmR0pH7prkmF4oc3vpQ5VwPo5fh82nhDlG2Bl0qKRLlJT5u1CrwFcaPsPdx9
 ykyROj9WObR3prfVLmevDPftynJlvKhi8ROU8VcUPM+wRAJiblbrbXCxqYR0Wb+g4gLEtxKkUM5
 6jlMtZFh7wF/D3/UjYOEcX85kOnTHJ7xWuO6Am5kcpnaGCoWbYIxnazrVW9Dfj1UTZt76zbDzTt
 KPJT52E+enBpExz4eEw==
X-Proofpoint-GUID: YFnLxWFRSq_JgdZc2WndFI1t-iyx1JxG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX92kuZAeXDj3g
 BdFgnIrdtgo6ZGRP5gJT9IuIF+fWzWCqIPvoLpMZ3Os8rO3NxjWl16tXPa4UuRrXdsKtfyKjyCB
 qTz6i0YRe5jlQfrzvDA2VR9xd6ByzOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

Add coredump support for the secure and non-secure OOBMSS carveouts.
Register fixed dump segments at probe time for attached-state recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 31fdde351bed..0dc9985f01f9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,6 +117,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
+static int qcom_pas_register_dump_segments(struct rproc *rproc,
+					   struct qcom_pas *pas)
+{
+	int ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		return ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
+					 pas->secondary_mem_size);
+	if (ret)
+		rproc_coredump_cleanup(rproc);
+
+	return ret;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -572,16 +595,29 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
@@ -593,10 +629,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	size_t table_sz;
 	int ret;
 
-	ret = qcom_register_dump_segments(rproc, fw);
-	if (ret) {
-		dev_err(pas->dev, "Error in registering dump segments\n");
-		return ret;
+	if (qcom_pas_has_secondary(pas)) {
+		if (list_empty(&rproc->dump_segments)) {
+			ret = qcom_pas_register_dump_segments(rproc, pas);
+			if (ret) {
+				dev_err(pas->dev,
+					"failed to register dump segments: %d\n", ret);
+				return ret;
+			}
+		}
+	} else {
+		ret = qcom_register_dump_segments(rproc, fw);
+		if (ret) {
+			dev_err(pas->dev, "Error in registering dump segments\n");
+			return ret;
+		}
 	}
 
 	if (!rproc->has_iommu)
@@ -715,7 +762,22 @@ static void qcom_pas_coredump(struct rproc *rproc)
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas)) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region) {
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+			iounmap(pas->mem_region);
+			pas->mem_region = NULL;
+			return;
+		}
+	}
+
 	rproc_coredump(rproc);
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
 	iounmap(pas->mem_region);
 	pas->mem_region = NULL;
 }
@@ -1130,6 +1192,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
 
+	if (qcom_pas_has_secondary(pas)) {
+		ret = qcom_pas_register_dump_segments(rproc, pas);
+		if (ret)
+			goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
@@ -1141,6 +1209,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	return 0;
 
 remove_ssr_sysmon:
+	rproc_coredump_cleanup(rproc);
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:

-- 
2.34.1

