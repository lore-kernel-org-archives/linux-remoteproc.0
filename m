Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7628DF33
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757053; cv=none; b=q9kshSumcEP930vK8NDm6PyERAalUiyjWAzvcNtKtQRtaH/CX7B9VqAw/hpYHwCV4BbRgUqai5Q0UkDHE6HD7JWq2kaNhmC3DQPVdXQLlYgC9yyTCgP/hVR7gqc2OdFjpwu6JZo9mWcSXhGGgs0/+UorvdGbVnpsGlZboyGQ3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757053; c=relaxed/simple;
	bh=VhAgW/dnywD+u4kxqj28b77/K159FY5Soeolgkg1/Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7ZfHrAwxlTgO+2dZDNdw3Y6Qpq6OvMuGjUFCLkZnfDBGNXCj918GhTl3ie02hDwmMlnQifueP/o+aCVX0AcjvncxGAlgRDtsrnCpXeaqMWJ/VJd2saPvvm+BpNcpq6vaEwureoG85miuvIQDpSReZhD9V0rqZiLNAPLTMTjJRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTsOALnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTsOALnP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCkJqQ017438
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sr3bmZYIkPrHlHUer4SaFc+7DYW/FxpmFC/DXNrVSFU=; b=jTsOALnPBC0oL3Nb
	KL00NmMG3fnK+VT2jz/WTlg2uIWALSHalOy9P0t87pwb1tg+X8aaEsMKdz6L6pJz
	PZ6bXWp/lKHemIoC77ZzdTJ3WrRU2BUdQ90NzSwZo1YtXZ6h0i5fwl8zS/LkaIbb
	LeOHGva3BMpNAXZ5s8jlT5v2xqyadSYDstl1wc0n7pFrLrqZJ0PHnZEA2moswBAx
	aO6kUpvWZGU2lCRoYAqYFEbPW2coIHanDhvnoKz2bbt5y52XqrPclgV7JprkzLzY
	qxC24dLzNm3EJ2HzUu5kN6sqBf/2UVUZNKN+wvWeiM9ElbeOKlIC5BDNzu4l966v
	FZlstQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjycsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e41e946eso549292a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 16:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757050; x=1759361850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr3bmZYIkPrHlHUer4SaFc+7DYW/FxpmFC/DXNrVSFU=;
        b=rEhE7+MTUWgGqOeykLcjA9ep+tyKG47cjsNFSjF4W4h7q5ER0I5c77MbY1g1sgjJMJ
         4/E0/H89hpIFuUNRI44TY80CMhth5GaQz/Vhe5q+AghsyEidGLdXEeYePr/se7dyHr7J
         ul51EAAcNYIda2tYkspwyxZAiQzmNssDsQ0saLH9rHPjLrKATu+4Z4ku3qNcQX54jwTa
         gnWvDjs6vyGILqCC/6ol70xgGfEqXgWX4NnuM0Xx9i9JojanJlI4ESTfI3Tv8YcM6xRy
         a2HjN6ItI/eOMRMD/Q7IvVrXp5oj+4CtfFVWcLFAGpKutm8kzwk0Y2uXO8UWtbOYCs28
         b7qg==
X-Forwarded-Encrypted: i=1; AJvYcCX71VEeMU3W1a/JriQdGRr7n2UO7sHa4Ne4twwQlol7RVdVFqJxe1RdB1mjQw3L3iQU7685yOZ4xPy99dHEIAqf@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLu7eIosgvKqugsy5Y/7QriWy+kqnF9AzcBgVfChQK798c926
	h77v5qhusioCz9y1aup+e0+dQVQyuQ/6kJioqFMddybsEHplQ3gccCr3sl4OC2WVxQt5bljMRIQ
	UzwsPgG4bK4hgpGfhJvSfK4+wu+Csf3UhwEjL6/8jziB7ZHlzY3JmsK1tKdMOv0iKIQtJhU4aGz
	zYoO/Ya6E=
X-Gm-Gg: ASbGncvHE8aCgydtVyB/Y0rJ2rum6qQF6dp30L28+8a+VaOCoOJRQifcXqe0XONtfy8
	QkWcmS1QFWb5gwuDHulYekq1bHYvBv51BxIgC7FhkTyiutFiiT8LvfW4/p6Q2ZScF7yUDdGzRJ4
	kvaDtLgLw8Uj7QNynr4kT+HAVZoZfX2v6SVcTU8UTgONX59Dg/G/rVjBp3Q4Rm3Ik9M9wROuBJb
	8hJ5+0IH+aRbEfGMSIycJlA7CSniMvoVqiJh8eCRTlbvUKaBFW2O7Z11vf6g8neb2xvYdO8Yht7
	7cjEggdY3PVHHSHDSbAnStR/39Jejcr5ib0Qa2nncXYMC0O2KOY0ko9yKrq44b0iu8mqU1xXpyY
	ijNJaIr1D8pYNL/M=
X-Received: by 2002:a17:90b:4d8a:b0:330:6f16:c4d8 with SMTP id 98e67ed59e1d1-3344ae0aee3mr651569a91.7.1758757049654;
        Wed, 24 Sep 2025 16:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb1d2hwh+kDjpa297ZpIISZ+RbiXSGQA/VaPwnHBRNX4G95Xh4r8MGW01I7uk6O6hT2XCc2w==
X-Received: by 2002:a17:90b:4d8a:b0:330:6f16:c4d8 with SMTP id 98e67ed59e1d1-3344ae0aee3mr651541a91.7.1758757049237;
        Wed, 24 Sep 2025 16:37:29 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:22 -0700
Subject: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1544;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VhAgW/dnywD+u4kxqj28b77/K159FY5Soeolgkg1/Zg=;
 b=SIPKgm1bGvoRtqAyH8aI/di/jCkXLR6jj6oSX+WKhVqi9+qcf/Ea2nRMH7lxKNmTxccmPNQXn
 K/ABy/COHVLC16Buao0XIWaerMxGjMPg6nwaLJGFsCTmdoCdTfcg06s
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 6wY-qPl_84my5LM2VXpEmZ5WM4Mc9BU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXxj+qGbhB8RI6
 FnARCZXOwNVV1sH8EgtOG+wVs5QKGjpSRr0sFWL03dYBk5YmEEDfpm02yl/dP9dXKtocQancssg
 BMpnJY0s9WikRIK1H9c1o/6HL6T00mvYK+bfSFma4dVxzz15z4PdHsNIyfbW2D0gHLoiFN0bA6c
 sYD5/+oK3QaIqHTv5LApoVRjlGvIhsmPAaq3AXB2swUJkty1ePpznNiELRXRMUaNaeOG3JcYHz0
 ydjt0xMbYapy37fKLcMI3TNavs9McIAG4oTI8pxOoqPXrgMxe8MqnUVFbEr0SxQiJYQUvPAVpc/
 h+TX+6zfxl83/2fZ/sOXA9AyvuN/7kH/i+Uz9dWfDPEqHTuBd444VE1OJN69x64hdD4KajW8fiQ
 MNj+/jTS
X-Proofpoint-GUID: 6wY-qPl_84my5LM2VXpEmZ5WM4Mc9BU9
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d480ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..be9e2a0bc060 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,kaanapali-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -185,6 +188,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas

-- 
2.25.1

