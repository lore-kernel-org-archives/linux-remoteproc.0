Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D931A56B
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739085; cv=none; b=pq5X1PqaFux4rIJqRcHVd2DSckvg3z3YFAcmzrCHhWs6GbCeVnNUWq2kSiVZvHWJzw4ovZtpsD4Aeaak5oPyo59lN0Yj6wj5HY610avr6Q+C//tzerfw5BsCKT+oEAH/HBHfTWOE8P6zLeKT5v7Xq5YDatP4Uv6s5eW5bQjkr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739085; c=relaxed/simple;
	bh=x/yB3U0JOrNOZ2V9rL6+/azkb/Ffu+YJQwvpcwVJLj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZGnbs19NRO7meuKZ1Z/r22sYVGG9SYv6LwK92O82rbSyASoyT+ubQWj9/jGLiQs5Q3rsFcPvLZlBZLv0fFOVbK3js6wpAGzg9JA+j9N63NApzxYyj4YjPSgO5JXTambdQ+WhvY19/7A4fIIvUeQBs0WUB+ccvnzH8KpXkXYbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX5D/B7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX5D/B7o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3cji028188
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9RNW1M1uDCL
	xCSHh9UIK713brM5SN9OdS/M6VDwK+XM=; b=cX5D/B7o/uCfC4dHhPFpLHqpeEt
	ezYPkmdcqQBHHuuvo6JTlQotW9CQES8jhMUnzIarfPKGzt9RXmcDdtKXa3v+r8xw
	hATn3jqd2XHpcj6JJKwFy/J1aQ3Tlr0EXXsbJ9eckymWqbf6KubVhMWrQy47MLpZ
	fABS32iNjRoF1YECqTyZi1BxYcKB3BFeuwmPjRsDkoNGO+/E7dZeg1HmFOdUWZC4
	hT7K4fTZ59sT6ffiZIRuFwbq+sUHyikuvVD2mo2K6QdgV1rvUYqazYpjZm81Iaho
	0gSz5TOvX8sVgf3Rbuoro2uyxuPeqqr/GmdqVRLCzRK2JmglWt5HHxUwtzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnws3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55251a4309so73563a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739081; x=1759343881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RNW1M1uDCLxCSHh9UIK713brM5SN9OdS/M6VDwK+XM=;
        b=u2KJ23lMS6xmjB484Wup63qdcqQURgbuQ0PyFox9UNO3S/+dgXidhWLmkxJLntSPpA
         Pls49fXeVagxGWqjFD5WXh2FOhW4eay38jbjXtL1Te+b0bxE3X2PFkN6OGZ/opK9ahpf
         pxMGfCN9yWT6GyzB7Zsk2dx7gtUsFvB/cjb2mRP0dJhC2JLjYLgZRaDOWyIFoeYTT2N6
         vJBL53wyYoth+LmzyscbNsVrt4U3V33eZnTwbWjjjtBQvXet05AvAt6YMlMvf0qj7Ieh
         eiGjwuLLc+o1Og8MEmhuQ5zprVJMSDRq5uz/l5vRKoVfWRd5472gkA4bJIK4OES8Kqv8
         2a6w==
X-Forwarded-Encrypted: i=1; AJvYcCXsPZxfv/U1mR16uHpj4q3VLlNITfMTnXexcVpNnD0Wo8BEAQzfOBW6q/C5a1F6f4GCnsk6Oo5HIEF0GuDKv9RS@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeqFCf/TxGpSWKw5O12iJLB8IFncOHtQLkwATvmT+0NWCz5tO
	TjXDL0o7SdHgJG9greQFtKp10EutJ8+wBRUd5XyD5yvYi0b14Ihp1HUPhvSL2sO/G6xQuV461Io
	9TP5yecbDEBnD25uG1lv2sFQcwHkV8IDVE/BI2sB9xb9XZ+9wPtVTlF7mKbOj2+enYG8Oya/7
X-Gm-Gg: ASbGncu0D+8fQ52UekuYJig0JBRmGKnFE0o/uX3r6HTvNXurS4YjQ7oiKPx7RoO5ssQ
	ftwD5Rt5zPOymVTjFC8X1cbnNSY8KOMWc45g3bj/cajjfmLPSAx7lomUrbN+AOBk07/rROFh2Ms
	o/GyebceYG1Dah9V5Vx2U4lCn6D5E/NkX7/QEnxd9V+Ylbtgnu0RUSm7nFIBDxPghUHNdVnDMsK
	JKou2Qo2AmtINFGoZmEmnMb8VGGr9Z9puhdRQnuulHnLjugwHQoME+Rz2HJKP9PmXma5HLmPLoe
	jL7uw+2cigZ04aW44y8QfvGm5rb2TpQAsfjyYHNkEECLRH4wQwIQ9I8QmB88MyO3dS1SYociAXk
	hgg1zUXB+KRNDPCTF+qcveCAKygwj5JgvsBSj6sV+YzXVJC9GBBvlTQQ=
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr754840637.8.1758739081490;
        Wed, 24 Sep 2025 11:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQozrNUM5/5vTV2ruPG6yCF0B0PeRf3UGyZidkCzWFRA+CJQBk6NhKsxQ/GiS8C6ISg1ZxLQ==
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr754806637.8.1758739081070;
        Wed, 24 Sep 2025 11:38:01 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:00 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: mailbox: qcom-ipcc: Document Glymur physical client IDs
Date: Thu, 25 Sep 2025 00:07:23 +0530
Message-Id: <20250924183726.509202-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d43a8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QlhcEh-tmJ1xmMBebrMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Faci7T84H_iTsU2tBBe6Mx2D3fbfqrIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXxKoo8e9agIJ+
 QHABraPJ8Pc/RH47MP/9whIOt9HOfhdS5iI4J9bSflhhQkYgRQpbRggLaA2MPBvGgSwOINIv6Ow
 PCnlONaxEubXWf76TTq//IB5g4+YLkQapl+YRFja6vwRsJmzXlDgnA1pgfwL7+Wu4Rhznyg/waM
 tGN+gJb9oxBJVa7DsUgj0/0hf9FBRmz7xKdhd4vLurjwu/woN+DHjtoxvukZmfYWjdbZnaBf3gv
 OKM27B3d0bESnp7tw+wnaTWpyausUtnP0Ywc1FwHO82SCelGri8IToPvOcqtRTy03LKHmnfsLQB
 aZPGZgO2WaBWZiOgLOYhaCXaiZTrqc1E13PhYAA8iuqFobFB3tAjLda73x618f7Ipd4BweboiPh
 sOfv0yO3
X-Proofpoint-GUID: Faci7T84H_iTsU2tBBe6Mx2D3fbfqrIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Document the physical client IDs specific to Glymur SoCs. Physical client
IDs are used on newer Qualcomm platforms including Glymur, since the Inter
Process Communication Controller (IPCC) HW block no longer has the virtual
to physical mapping in place.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

https://patchwork.kernel.org/project/linux-arm-msm/patch/20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com/
^^ patch seems to assume physical IDs are common across SoCs but it doesn't
seem to hold true on Glymur.

 include/dt-bindings/mailbox/qcom-ipcc.h | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fd85a79381b3..61cef29e43f0 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -36,4 +36,65 @@
 #define IPCC_CLIENT_GPDSP0		31
 #define IPCC_CLIENT_GPDSP1		32
 
+/* Platform specific physical client IDs */
+
+/* Glymur physical client IDs */
+#define GLYMUR_MPROC_AOP		0
+#define GLYMUR_MPROC_TZ			1
+#define GLYMUR_MPROC_MPSS		2
+#define GLYMUR_MPROC_LPASS		3
+#define GLYMUR_MPROC_SLPI		4
+#define GLYMUR_MPROC_SDC		5
+#define GLYMUR_MPROC_CDSP		6
+#define GLYMUR_MPROC_NPU		7
+#define GLYMUR_MPROC_APSS		8
+#define GLYMUR_MPROC_GPU		9
+#define GLYMUR_MPROC_ICP		11
+#define GLYMUR_MPROC_VPU		12
+#define GLYMUR_MPROC_PCIE0		13
+#define GLYMUR_MPROC_PCIE1		14
+#define GLYMUR_MPROC_PCIE2		15
+#define GLYMUR_MPROC_SPSS		16
+#define GLYMUR_MPROC_PCIE3		19
+#define GLYMUR_MPROC_PCIE4		20
+#define GLYMUR_MPROC_PCIE5		21
+#define GLYMUR_MPROC_PCIE6		22
+#define GLYMUR_MPROC_TME		23
+#define GLYMUR_MPROC_WPSS		24
+#define GLYMUR_MPROC_PCIE7		44
+#define GLYMUR_MPROC_SOCCP		46
+
+#define GLYMUR_COMPUTE_L0_LPASS		0
+#define GLYMUR_COMPUTE_L0_CDSP		1
+#define GLYMUR_COMPUTE_L0_APSS		2
+#define GLYMUR_COMPUTE_L0_GPU		3
+#define GLYMUR_COMPUTE_L0_CVP		6
+#define GLYMUR_COMPUTE_L0_ICP		7
+#define GLYMUR_COMPUTE_L0_VPU		8
+#define GLYMUR_COMPUTE_L0_DPU		9
+#define GLYMUR_COMPUTE_L0_SOCCP		11
+
+#define GLYMUR_COMPUTE_L1_LPASS		0
+#define GLYMUR_COMPUTE_L1_CDSP		1
+#define GLYMUR_COMPUTE_L1_APSS		2
+#define GLYMUR_COMPUTE_L1_GPU		3
+#define GLYMUR_COMPUTE_L1_CVP		6
+#define GLYMUR_COMPUTE_L1_ICP		7
+#define GLYMUR_COMPUTE_L1_VPU		8
+#define GLYMUR_COMPUTE_L1_DPU		9
+#define GLYMUR_COMPUTE_L1_SOCCP		11
+
+#define GLYMUR_PERIPH_LPASS		0
+#define GLYMUR_PERIPH_APSS		1
+#define GLYMUR_PERIPH_PCIE0		2
+#define GLYMUR_PERIPH_PCIE1		3
+#define GLYMUR_PERIPH_PCIE2		6
+#define GLYMUR_PERIPH_PCIE3		7
+#define GLYMUR_PERIPH_PCIE4		8
+#define GLYMUR_PERIPH_PCIE5		9
+#define GLYMUR_PERIPH_PCIE6		10
+#define GLYMUR_PERIPH_PCIE7		11
+#define GLYMUR_PERIPH_SOCCP		13
+#define GLYMUR_PERIPH_WPSS		16
+
 #endif
-- 
2.34.1

