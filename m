Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74543C1085
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282325; cv=none; b=nnSCx7Hf7kgRU5CeHNAN1V4y7i98X+UTPUH5vZPnKfVrV2DWt9jklREi4wU/gcFncChhcEva2ypoeR+yPDcFNeJCrRFvb5Cdt32Nu5sm74egDFqOHt+R+XPh2DvTJAoBdf93C86ymxiU8sEz6UHhHkjFDlkN8OvMhKRk3EboKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282325; c=relaxed/simple;
	bh=Ve6yBk7ITkHlXZiTQ6apz02svhUHfadmlMNT57Y8PmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UQ0/KjB+fmppNyVc6SKaDEf/znXFYsEJGAoCo3qFs+zxi84OcwdvS3Fxj3GEjBJvJcwWiXIdUsD0dtEmaD5VZFnaqCbxeezueYicUYpE7LtWQHAHF8Mfa3fiqOmIvqCBuSZVTS3O/6qZRnuKbwcYujqwN8NTUEWO7Z88n+ZFp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7iKQWUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jxh/2YPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7iKQWUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jxh/2YPy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cbDF979985
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJj
	Xst7s3kU=; b=T7iKQWUVbCH5wTYZOe2DsThVhLNffU25dNjqX4PWynvm6+wln0Z
	Y8MoBYOEVHcxefItDfwZIiiK6LtIvVMKD+UTJb5fkNQAT2G1tWurk9+aEhUQGRJe
	OsG5oi6yMvpgTnKwh8gUg3wzsXGoS+TzXpPYjYLasfjFjHy9WlSGdjKj5Bb9Msmt
	LigmNVild3rqjdrNneBboTFhAa9qUd5+PoL4fvBxDqSLrL1NDdF4v+dH/AipYn30
	rQA0Cv2NVqOfxk6Slxs+bgSMsubwZFFQxseaflbMt57PS21ERXC7g2iS5mwDGPyr
	PEvSz1hPEh2bAXC5HuUNUAfeCoYHwKtcabg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grs2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso8224959a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282320; x=1784887120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJjXst7s3kU=;
        b=Jxh/2YPyU+nlXSy6XCX9tighab+KiU3DlERuxriMxHqGtEUw/wrOppgmwMi5mXEbe0
         qfRiXMyxdh0QRE1NDxWlMwkTFoxzTwpHEG7Vncs9EDQ4C0s4kmb0gy6q3d8qxlXF8qn1
         w/SgefLkJ8Py1mmh8HCOrX77uVuc/6rU1R083dzpmfWMpmD66SvBRDgW1/3cmAisZ0VG
         tDRQfLJW13qLN6xly29J9kzo566H4Gvft6xsdP29YWL+SEGKSF/MCmpyPGBswqbtp53g
         psUeg+nVkZUxY6rL00VUBKM/SUf993WQt7exhDnR9jzUkmGsv/Teexg2QzgknW2j93oN
         rFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282320; x=1784887120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSpE6gifVlFZehnqIGyvmBQPC0rPkN4PuJjXst7s3kU=;
        b=VvxzzLLEe4gPTX3T704vWHBaLLobJBCdZlaCSt9ZumAt1HK7Jx38aj125/Q0sQozZ9
         Ek8tPZO/DEcAuSRmpZCNA3TD+FhA0/h9Yd3kobbMMoPZk5+JL0se8FsJnYXnGrczAJH6
         DxrtXCzX8h8Q/rQkbncFrKhUIUbqwTm92lXMlebzNvc6mkGKZne72XB/uXLwEIW552+3
         mWIhx+5gXXtc3UpL4suu+UHnv3TAj/h+glgndaxUIFSzKXYbGwUV9s2dP7BDuZ7m1t4W
         flH6vMM4HZ8LhF8jNjg1AaB+tPwGY2Tb9RRoSkFNmbtNra+cycUwovMaobfPgDbQWfK+
         GX1w==
X-Forwarded-Encrypted: i=1; AHgh+RrQXQ6QGUD1aZC5hepTpKgSZR815lpKndQ/bZV8Cr/uQ6TpySlW61a8BbsaNvdFvRySwWEQ9tHXpVfDT1dkz1Yq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kxa2Eq3bbgGRPTqA5uL6u4Z8Xq7K2N/g/gXCMGn9U6rhTIHr
	k0fGcaoiPYXpiNjzk+Eu6ympwfcxM2kqK2mj2SH4SmbUvBpcZaa9C1cTtXEcZAcv2Gi904YXs4P
	RbFmgMJSlNLBD9UXbXzL9GPD8sVrS8X0/jyMza2P7RGD5e7TzonkmvNGXHwyPUq1qek6Q7R4h
X-Gm-Gg: AfdE7cnSdk1PZD6ezWHa22sC48bHUrnQOxgA50thPPMxW2EPjYEtjfNtMVXeS0Z4Qsn
	1QdllS6ouDNorwYQnF/Y2gI+zeFy3LN6eiEJZA0lvjLRJ08J68P/pvpjTvg0oO2LFFTjq848yqj
	f3ANFW4Fae/9bNlwvGXpwECzm0uN3byArfO1y2EAYzN+YO8hHHFiSCqJiUL/+N60KzM3crpyfhh
	3OLHQNVm+1MlsXLV01XRC3y0yrn/crcvQbU1gScQW7NzQ1VVAIFBh7lxpuvZxlVUNkP1lq/TMDy
	CiZiIwnUJynVyKKtTaWq94ZkQbq9ym2iLO4kRd3u+/uxWdd4vfWfWEtniC0S/CSv/B8AoeDe6IA
	nf6CNFujGt6vbwLyB1LAIm/NKH4BDOpwaqlMJ
X-Received: by 2002:a17:90b:5824:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38e4b51447emr1813854a91.25.1784282320129;
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5824:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38e4b51447emr1813831a91.25.1784282319686;
        Fri, 17 Jul 2026 02:58:39 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:38 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: enable audio ML offload
Date: Fri, 17 Jul 2026 15:28:22 +0530
Message-Id: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX0VBzKx+zrJ1S
 w9+RxGGx4CSYyEtuYUos3FNCRxULhvWkr3LeOk+aHiG6CrTZXLkKNiUHOjRfc/9jOR3PDHIcKqs
 mo0eTnA7kvPKv1KHxlw5DOCgwEFwja4=
X-Proofpoint-ORIG-GUID: fAhtdvznCjv3Dz6IidCAL4VvDO123Ho_
X-Proofpoint-GUID: fAhtdvznCjv3Dz6IidCAL4VvDO123Ho_
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59fcd1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4P7nMa8YD1JmJx7unSoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfXy8zinCZpMiJO
 Swnz95NDifU16+Ym3I522NOWfibGNNFsw4LRz/4BBrrn/VKBr5kgQVmuLq4F+Rfeh9QyrapW9lk
 2H9xuOsCYabeuT1/jwib/oVsb4GY0dcSyvR99vg1XQ6zWk3kQaNbnNTaSK8xvRz8tztD6EnnkuX
 deH7FwOHlUgB7FDOi2ehF33TTT8oUH7NYDg0qVs+emuVMa0ON4nNE18Z25VFkRsRs4Xk8Emgkuk
 LwBVG/cFdx6qTBgn77qXFNAk/EM9enBmtGXNpHle2Px8TjKNuZXHZf95fjjLkRksfseLNQOkudq
 w1uNlFfGmOmzb05bqD+wZGUa9wHIfwQnK9BMl0QT4nY2HNi3sEe3K922njncrd21/8g6iN2rlZd
 eMjntt1Sh89AQvrD9VtNLoPQzKkf2bBxWmqUmnbP32BAbJ69h7ij9FanmUMhAYZfgiHwANq5i0c
 6E6hvOdlUvkqxxBYBIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170098

The audio ML offload use case on Lemans requires a dedicated contiguous
memory region shared with the audio DSP/SPF as well as corresponding
SMMU stream ID mappings under the EL2 configuration.

This series adds a dedicated CMA pool for audio ML buffers and
associates it with the q6apm audio subsystem. It also updates the ADSP
SMMU configuration in the EL2 overlay to include the ML-related stream
IDs required for DMA transactions during model offload.

Without these changes, audio ML workloads may fail due to unavailable
contiguous memory or SMMU faults caused by unmapped stream IDs.

changes in v2:
 - fixed dt binding issue for iommu.
 - v1 link: https://lore.kernel.org/all/20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com/

Pratyush Meduri (3):
  dt-bindings: remoteproc: qcom,pas-common: allow up to 3 iommus
  arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU
    mappings
  arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU
    mappings

 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml  | 3 ++-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso                 | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi                     | 9 +++++++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso                 | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi                     | 9 +++++++++
 5 files changed, 26 insertions(+), 3 deletions(-)


base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.34.1

