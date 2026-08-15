Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43741D65E
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800383; cv=none; b=D2h/uAp6ouWyG298JQlmJDSuhwt4MG479zv1SFwWrHA6e6MPcyeNHa8HCKmEGRxcfvkJ3yr1fEMa6evfd8gnMzmYLdDj19CS++wr6I/HjhzUqUkl+OYKs9Yr7ffJbpkZxdUIrEw1o5aKhIFaYY+VeRPwV2Gf+UzlgojCxmLDUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800383; c=relaxed/simple;
	bh=lJR6G5HF4bl1M1j9qzIr9Pod7FQ6Wv8te8xQH+WXaCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgXdCpmiFfqTczcRnhBbIpwB3c5ZJQwVNbD6l/mnSpibIsuwmxpKaHcCIVK40VK1xQKYNRDtH5u5LlIHkYavZwjt8SQ0s+4XPo1iSWRZRuIRo1WlhQlKDWo7RZnXJjhc0IlCj9BoBCVj2bp5kZqmNsIBzIKIxbl5Q0uxxN9SN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl3M/2sE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htWd0/8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl3M/2sE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htWd0/8z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDNQ3H281589
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GXUsTUTY9OU
	wECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=; b=jl3M/2sE6jyZJXYGTyQwxyOvhVN
	XHBtGcbQOM8vrtknabBv/o483i3QR3H4N/zJDxupzXNZU5lq3CmPJJsLCqmOS0Ph
	T8KPaKm+NJ5uPFsyoatMi1hlh4MWpNcI612fo98P2YKMLlIboXBpZSiMv13+EEvY
	v5aOlRim3qe4ce5JALxjHjnhMNMamdaenowmsgMnSCR7ddZVGVy9/+HY59UNaeb5
	9B1R2tiuz59QZ+J9PoGt1zJgO2QbLTZN0ylhIogTwQ7Z1OYhQ9tV/TE4Ck2Iku1r
	2FfOnayIzG8Y7i3Wx1g/lHmQysnwR1hFXSYRqZ9ADnM3pqZWb/yQPlynbLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvcgxjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso2169093a91.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800381; x=1787405181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=htWd0/8zB3P0VgiId1mYUBu9UpHzrQS+q5DUo1/roytAOfmJ0e1T5xkZoTkNt2i9yT
         ddpVBjdpfVJx28uByNI/CTJEsa0txRZyQ8zOrx3rhp2yyOg0nGVyd7kbX5VSCI7X9Xyy
         0uR9uMDPuGYd9SRorSqlQouzauBkjWoRuOgIflFwwKf28uHnxGCZPC/6N9zdL0ztD5UT
         K6Sv8RN7T9J0PaMGaXCu53f7oir7MJv+3rx/cPCKA7d8Qz7eTn9pn2zIkqzE2wUlUwzo
         /0EBGmZxaZ6RjThSJmcenZUeICwbEIK9/wPAsyUNeRIeOi3eYTlQbquIuqyrqP2v5eVd
         TVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800381; x=1787405181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=fZQNC9bpE68BajkiRPw4dTDfpw7d97jR9cWvmwuKovEIh7h15WphgLwKvDfkGab2zb
         9Zm+BtmKUGvb2yrNlf13Rkr5z1VJiItYTUTX8aMYQJPMtCmmWUCgMd+ztJbqVlY6RqKq
         6kqhw8+wBgmUNmhocoAR5JnJP2JrQ7OtlTNw7w2l2iWPwA2lBWgX+D0FIjc5D/tszrOd
         mAJw8jXxuHclh+sZoHBU+HCsGgNdyVBF3oLb+p0uDX58QGWeFRQwkYRzj8D1P62Dl7zK
         +WOYv3BXHW0InZ917nVkXq8hcRmWq2vkVibnNggt2RyigG84R0gosMfiV06iabhE5PWT
         stKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPhS1hvoqGhT3A+kjb5vFdUFvhO9mxRj70KNErrZllBVLv5xsJVdlv0WUjhVC4Db3uzXLWCuKh0pq6c+Fb1+nP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xjmx26QLe/cnddlYNOVBqyWwtWF9hi6HcAaflrXKQWO1acYq
	svSGXrh1AN0YlEXyTGqzkUXp6AuX8jYU7Clu5pW/spBlHHi7oTaYRlI5jRNO+UKV/SFDAMHdtQO
	9403TwICsavPGm3QYBWwvRt0lidddpqh64xcdFhyDkKzkIEMTk9BS3c6kG2opW8lDvVu6j0Iq
X-Gm-Gg: AR+sD12Yeaq9X0ci+y7Fa+s6hhClKClbFWXcQIyF2zcpWRehd/HxacHUXxFIfU34GO8
	uE4jJ28GCUeOr3qGQtyP8epi/z9BHVoF+FSA96fKulNrY6Ky2iI4cvKg2lerV90zkQFrtT327YB
	zngdelTtRGb1D+Xt4Zn8hhSpR8nRgJiK5hz+tQrTfTs8zLiwsz6waQpgmnQ/4SXsZHIf9mqTX+W
	wW1vsZeIzdJNt1KIbObZhFxLYo7ZiIixrtLFbV1HhBnU2eYufKGO6Sk56C8t8XwfKB/XSqWsvJG
	5RlSBSLQSk3cJMJiXJ8U1GH9XMzkx7VrXDopjaV1XGshFeg6UFQToH1eix7mTFSeIFzMlH83vb6
	uMXRnLbzWbCOv5xzYqv10w3LRMlbg6ce/JmCmA5YByXwGFawoL9SXvbX4wvsL
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646179a91.1.1786800380716;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646140a91.1.1786800380243;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 8/8] remoteproc: qcom: pas: Add Nord ADSP1/2 support
Date: Sat, 15 Aug 2026 21:25:41 +0800
Message-ID: <20260815132541.1575121-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX05eai2IkduzN
 yyToi5CRHjqmfmvH5rRSQYh3N4d+EYjbxN4WW1U/OZSwFafdaRIGN/TvxKJ7ajPqK/3CEy2r64B
 bnw36fFN8o0EhQZ1OLLtl+l0Se1N3Fg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX7mAc4hvWvVTB
 U7sVycNqKbHcaidgyJWHT58lrJ1q2vOVQMStC50ChchPmYD1zcIl4Qa6orMjDGF76xdXMjlQX8E
 PEUs6ranvZFIWE8TPn2nM0BI9IcJ5Ds2tRXl1qJiz2rkp2aXxpoQbpq4M3T5uQvFBSJ1dSvX3MY
 pHJXaoyFbQq8suxuDD6GFfNnC3U4WkGTRkGLtVAxStu1KSOOa3R/Rl24JG9sqdeLZRDc4l00GMV
 XrjJn/FqMYdmJOeh3um3yZqxj/ETUFHAF2nicYpPVmEPFTOjgzsWABA3PkCjVrDgWur1IwtFJM3
 ARoD4U0oiFoYt7YbCLAojN2oifeyQ+roDw0vCld39e1VCl3D7F9zGGaoBnFoilE8fYvo3o0ppId
 G4KX9JTBJlF3wPpLN9zUZMRseuJRd/kroiJJeX4umlMVt1ohovbDZ522DkIFa1QQtiMccP7gVKX
 H6hL8rXEjniSCtdwSoQ==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a8068fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Y5oKQx0N-h3E-Ucf2xsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ehdqfqNcA2D-mv4MOPDoCTxLkN84mIrQ
X-Proofpoint-GUID: ehdqfqNcA2D-mv4MOPDoCTxLkN84mIrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Add support for additional Hexagon ADSP cores on Nord (adsp1/adsp2),
which sit alongside the existing adsp0 as HPASS cluster members.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0cf0a31f1f1d..96e2a7c74927 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1937,6 +1937,48 @@ static const struct qcom_pas_data nord_adsp_resource = {
 	.smem_host_id = 2,
 };
 
+static const struct qcom_pas_data nord_adsp1_resource = {
+	.crash_reason_smem = 663,
+	.firmware_name = "adsp1.mbn",
+	.dtb_firmware_name = "adsp1_dtb.mbn",
+	.pas_id = 53,
+	.dtb_pas_id = 55,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp1",
+	.ssr_name = "lpass1",
+	.sysmon_name = "adsp1",
+	.ssctl_id = 0x1d,
+	.smem_host_id = 66,
+};
+
+static const struct qcom_pas_data nord_adsp2_resource = {
+	.crash_reason_smem = 664,
+	.firmware_name = "adsp2.mbn",
+	.dtb_firmware_name = "adsp2_dtb.mbn",
+	.pas_id = 54,
+	.dtb_pas_id = 56,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp2",
+	.ssr_name = "lpass2",
+	.sysmon_name = "adsp2",
+	.ssctl_id = 0x1e,
+	.smem_host_id = 130,
+};
+
 static const struct qcom_pas_data nord_cdsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2316,6 +2358,8 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-adsp1-pas", .data = &nord_adsp1_resource },
+	{ .compatible = "qcom,nord-adsp2-pas", .data = &nord_adsp2_resource },
 	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
-- 
2.43.0

