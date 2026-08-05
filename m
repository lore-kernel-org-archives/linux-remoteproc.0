Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAD47143D
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936108; cv=none; b=AzYtQ1NuQKth35qSkV/7vpJsLz0iGMB9IBZkxapyfwGuuyxwdM1mp7B7DVLCYB+6aAW2TG6iVe3IlWw5tPPrGngE147GodYrDr1PiO3kR20DfwpBDf9nfWgbXMuOXgOxCHsu14vtdG+711ObyWQkwXhR5TpWq5kPA8UzwH/pkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936108; c=relaxed/simple;
	bh=qqssz6IAbBbmca9JLdbkbyj96NpcQiOlBuVMR0m1Xzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOKr0AykrzpnszlaF7hubYTleCsO2xwRMwRkqh9cxvmQMKRjQkZivfvqVoFvbz8zMWTQpJAGruMvFdFJuQ78bJFRTxlY6e7UD0xdIFSOv2ghgNtxnxb7lelfFA3PtFYs4ZnWH4LRmr6y2IL0BeSrM3rnf/ZWi3h9Nm6lLRehfkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmaNVZ10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuikS8VV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmaNVZ10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuikS8VV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvRRC2865810
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 13:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6bSVO5mGpfC
	x4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=; b=pmaNVZ10/NfWj+6ZXvG9/o+gFLB
	BB+M2+u+Alit61RR1zgPveP7na6ubzZAc72nZ2DMO3z4Vc73ZINkSwkJrD9E1HnO
	+oATETM4kk5oA4cBi+2Mi2Qw8b9YY6O33p+XGJ/KHrBYFxBbXxp48ett5Sx6Ueb0
	pAApOTzni5VKOEabfQ9YZzSviBFLICFZ+asWQJDh8pRQHiwZAI6x9BgHdh86K/sA
	bb7OIGddrGv8nKQBoRCArXfzqXhBx/cB0GqvtAzmM8EISBQqax2m+lil4bF5qc5p
	IMd7YTL6tc74Sl87Q0AJE26H9bIlzCfGlRnvibm4LMWFRRcMzu/BNLK0mIg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r60ud9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 13:21:45 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6ae41d34275so740583eaf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936105; x=1786540905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=LuikS8VV926U5yUjmnibtZUew9hcuVZbI+pdh1LVJFUsbCImFsRJgFD35zYTpJQZBY
         dOQmUOBf/MSlWNy/Av1eCa0RkZMR4JgRFZ8+DoCW6F6ipkAKZrhERK0+/ZFD3ODoLSi8
         US2FEoObFSmkRCQR6OOTq5iLRN1IcFQrA7LH9MYLZpa5W1+QPsLINZ5qxgm8+8GWEzHC
         +B2qvJ7D1xpN3FzJu2NHBmJ+p1pNfsJPmzf0ywqWS2c8m3nygYT71z4k6sy45u2wtOPa
         rgbINOP3wxr8tcWWrF84t3Z9fEfz3tQX/LfYMsgNwZsbB2cYE7lWlUhWiFRtiSUwoNdl
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936105; x=1786540905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=IK86/kcJMEyFY3lh1APPuuspwXZ6gAlngxZ/wT7GSBMSOZpj8qxU2dlt+tF5Tt5yfJ
         oAu72jyOXPlRpL4RAkuDp6lVaUQXp3MTFHk+eue0MuYTZLymMwTm1Kg3Yw4BZ+Frhvih
         hwQodK6GaMsS6R69+8LvXbwYsCcdXddrMG8ihZcY0stg2wqKy6mQabaiPL/oLFmJpD7K
         /XraJ7/tHlmFDE9m3n69U/5pQBNRLpEgQUduUsBi0SuZmG0CfPb3S9+yBRGb0KI/IoVt
         Jc3K9lhR5iEGiXY3eF+YHvVwRGW+dCdPFd64NjtKKYdZeWFKBVQK7pph75zoTbu5Eill
         z0kQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqo2DZfulT8C5j6/GKZ1eOE/n7SBwwGjHTnQyZk7nL+uS0GlMuSFpyE93GTGcNZLDbrfgPeLnBiSaZ7A7aHf0JA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgq8nMZEa16xPa+OiUG9Wckzm1AWVtOy0u6LSrE5c4lqR//yVE
	iLYzchhI6YZ8UhPTv/79++HjSRN5phiXaqjQJoXTP1SWprbWRvZX9SW3AwweTzMBpTkMIez8cjp
	uPPXm9O4lcgqusw4lseZi9ld8x/tiAdRhZkSIqPRxw6yJAn1Fsykev28E06uDpe74alSrFR/T
X-Gm-Gg: AR+sD11h4Cr3UDWyuz/RQGC0RTcWCuHE9GACu8VTtwtkyipcPUHA6JXvQdO/87STzz6
	52IUs7+1grBWON+0miBYMKDl/QqLShWcCmj25JsoAyaCVy3VnjaqEXJNj9ftn2LmS8dDtXX99/H
	BH9EZLcD0a5wIWygivVGPIH0HSiAPWzWdD7xBlMfwKc2flU/yvwUvW0yP4jyJuz08CQ/dnPjtqG
	8kDkBWXlUj74tQOJPgNYqiK+D0LiaBOsdkbQdhbjN6fTBjkvpUXrIbkZ1scmmjU+SAazqZUdrAH
	ctocxZIwXXnZ9kHzTt5fiCKiMMiW5wnorGVSkRP+rDExE2tBtjEWMeCxdTOiup3c96r/372qCXb
	cxxMVrRCUQLClvX8kNuxFkfGSV1k=
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3269019eaf.29.1785936104900;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3268976eaf.29.1785936104303;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as SM8650 fallback
Date: Wed,  5 Aug 2026 18:51:27 +0530
Message-ID: <20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a7338e9 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TCzjUf_GE5tPdZehUmUA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: UoBSz_8ntP7jaAUuRNLVeP0HDjR-hj0v
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX3FVxMU7t1REV
 yzvQNSMFw8DcDdrdfZk5PiICEcVLrzTVu3omjZ3H9BUgeDFmHJCWHEhe22sgucgl5t4ZglRmTmQ
 65szORHOfd9myUcz+F6KIRDVYy/nZEM=
X-Proofpoint-ORIG-GUID: UoBSz_8ntP7jaAUuRNLVeP0HDjR-hj0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX5cDbGOH5UzfT
 Xf0Hkp3A/2J9XIu1sHhvio4M5NPE/IBfJR1th3zRgLSRhKQyIPuihaF990anGJClkKk0SWYkBCE
 2pEx8YXmKm61D0aXhp2RWeJp/JZ4hIIK6I+eEBjnLIoOrJYtNEsRSbRTBnX5Nehk24BS6TSZwj3
 R8AcAEKCeP2R3JV+2SdjCTNN9sY06JoqbImqUxTHIeomzNlUpcR2xGVZDuuBjkj7kDK0/nZP+T/
 c4py0omSqvam9WXQ/8Q9y3i0QibVG7VrVhdO259Ifk23dvWs1o7KxbJm2laazCWhXjPZIsamLkU
 u+X0D1Z/K2q93vd/GdTYsXwfdjDAzfkQ5BTuL2KLao8k5nhYy0lKR52ByfI+YlcSzZeVosDYC/X
 oTjuLOy9Hjd3t6WNxiXouiiP9OlilPCXFokKDbylKeCxtDY+J2JSpBLOPABc39dFicuabDEbvz3
 yRC9QbF6O4cLN1roJyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The Hawi and Maili MPSS blocks are fully compatible with the SM8650 MPSS
with identical interrupt, memory-region, and power-domain topologies, so
they should ideally fall back to the SM8650 compatible.

Introduce a fallback items block that pairs qcom,hawi-mpss-pas and
qcom,maili-mpss-pas with qcom,sm8650-mpss-pas. Switch the mpss
memory-region and power-domain allOf blocks from enum: to contains: so the
constraints apply whether the compatible appears in the standalone form or
as part of a fallback array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..ae74aa4bb6cd 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -47,6 +47,11 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,hawi-mpss-pas
+              - qcom,maili-mpss-pas
+          - const: qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -203,9 +208,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8650-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8650-mpss-pas
     then:
       properties:
         interrupts:
@@ -253,11 +259,12 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8550-mpss-pas
-            - qcom,sm8650-mpss-pas
-            - qcom,sm8750-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8550-mpss-pas
+              - qcom,sm8650-mpss-pas
+              - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.53.0

