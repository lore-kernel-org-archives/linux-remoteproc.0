Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3143164BF
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725158; cv=none; b=daPSMdyZtz3vsQFz5HhEDTsUP2OS5NP0SJWz19l6DK/oNzUEgLmt0maex5+JfThMLC78LXAokvFO/qbUhMnzCb4hKISNuAImEeurbGracEmHd15AhrRCWDTJReQQwgd0vZl+BDObvobM3axwR8i148jbBbMDwRFx7fG0xAUupyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725158; c=relaxed/simple;
	bh=lHEUneC8ZRFILfNpU6bdJg56I1ugvFyyWle4SHV6vRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJSwa01WEB4XO25NYe4r/ripBRLXUABKEe97X9fQs5LtUCQLzfjJT5g+oK/YONXqRordI9qbYNH6G8TRUfL2eKHkGIrCBie2Ll7kk/wSMW3fm+noBYPPH3ritlGIVA/39BYjVr9EKZeoO/LRwDd8Wu+x4X/rsX1Ry3On/R3L5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C89gTu6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhHDVnkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C89gTu6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhHDVnkR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v0lf3664607
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=; b=C89gTu6RsSLWPS77
	0rupFkGUaZID0MJ04Ex9X06Pfbl1DliJyHpXRJWM1+41ymoCEIxvkE36ABhpL22J
	Yuw7PhJg3RTqeki4qddbP40XpAZdmYqXX3lwuscIVJvwAqptpgEiNdCX5XAdHUvM
	Oirg1ARVEklCqvEDiamT/HZkpi2vneP1Qq8sAYagYQ+NaCw0CNbXlM8V6J+isc+n
	+bQzHR+Mz9nJ7fFScB03cPL4HaHBV2N2i5ffXE9hwSHQCKI3+G7QegEdmrqrdFK9
	oRz/hY4Uirhh+Pyb3Y4HD2vJAaDLR/7v+cCLDs2ehpTxWcC8iOI++KlVVTt48+f8
	BkuuQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3sqah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28c58e009d1so148027525ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 01:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725155; x=1762329955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=;
        b=OhHDVnkRSI3XCryVQxShTKuj8DWKeZmZC6/wY5Azwlg9mahsBZLot4LDFKIvgQx4gP
         P+TdgKpWL+7vyT1l0THDs0GG4XrN5IUKZxOVp/pNN+N9WzEFtPHQ/fE8gCeAX4Be0uM/
         kJ1irPR+Qx7uvF4EoPYM7hVrkCMpfMFml7gdytP0tD5YkxevQighbWgSrq/qNGEMU9o0
         PTe7jmzhryBUBrEZW9lBgGfoK51YkxZ1gXpJva71xhOmlf6K4bPE19IyiVIg5rCku0d0
         f7mW9Tg5p+S4x3StY0o4Zl2KYER9BMS6LgxRMCtbkn7HdalXQhoIqS/HEmClcpdnnWr/
         PMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725155; x=1762329955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=;
        b=EzxGlksNDDB022Y9PL0fcYLTNYaWC/8Iy1CeK4LWDKQxr7x/kCz9Z2VbvYseNlMEqo
         Bab5Mmc+nNGW5uEL4sawDop3UTaGks6x5+LMRh/l3BugE7DVW5R8SPolAk62EcXEILWk
         /7ismNQI6rilrBnzAGPnrVkYDF3KRZ5SPKc71ZC0pNoh7zJhdl9jYgsC425C215UDrR2
         HReOlk7lETGR/A+BOvoAJwT0kR5qaQwPwMllnu4pwD+Muu2gLpLuIP3DNTnBTWXHBfWF
         i6OZxDOVkAmOxUSD8/s7VPjMlje73cBAtY3jGBFAHhT+oOSc1cNLQQGNwBzOB/pOy+TY
         7kZA==
X-Forwarded-Encrypted: i=1; AJvYcCWQeStelyo952XttVQKVRKu8EcOauPRCo9turgoKHZYOVPy2NgHpJmmC+vfiOCpQokt7IgmoSK5E1l9/FjR/trE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6U0EvIE4sPHSlMKL6/jge/Bnk5RWIqtBSat/1QnsVC7SXcjV
	tW3sfKhTlR05UZ3Lpe1UBrWOStpCAvLwwnMljEsY9DfiOAEvAaTkVssR2nRQXEZCroj6zGMkKJs
	LPhEgcmsjJK3qGXTTlsT7tjmtomxXq68JEitqkUZ/EmBdgm7Jyg8Jh8a4bZn5JZRhHHfWSp0e
X-Gm-Gg: ASbGncvvs847I9BL8tPv2D+KRKkmfR02jmVzge+uMCZq0VRWHDfjt+J/mkHtH1+PnxY
	StUp1ekAiWj1LO9UKGWmTzHeoKR5hsPKaqkz2zk4LrjQb5GF8EyiYPFJXVDDFlFAG3s0QIznGnI
	wn2ZF+w9TXUvyq7eokCB1E9ju9Epc7ftti2cYNe6Y56sv5Lr0rY05R5/vejLmpZxSYFe1wK/+AU
	edRPemrv/gX6Rv+VNeEkLZJcroiuArAKizdnQRjTVUBxRJLHQzZtr6/tCQoBuRZooKJi0/imLo/
	nb5k4GFYD6nuTETZ+W/+Xn6j4oo1wpVlavNBBZwMyDOGC27dnogWkgimfzZ220FLXyAG6X8uvRM
	p86n4ce7Q3oGvHoH86MxsFrftjcwzGVJ/mBvE3fdzfiUR8azxJA==
X-Received: by 2002:a17:903:f76:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-294def30ed5mr17205185ad.50.1761725154742;
        Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sQ6XdTFb2LBlKCQ/zHj45O0tHgxtuQUKM32YYiyj+0jGQytHyGDZXzy58NbJ4DNT3kWVWQ==
X-Received: by 2002:a17:903:f76:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-294def30ed5mr17204935ad.50.1761725154150;
        Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:45 -0700
Subject: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-7-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1548;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eYKPFpa37xMNWR6oEwup8N8ConVWUukUmzw5FoOa2kE=;
 b=AvoX10IlqCOMl7HP84G4AyH1pNYxj9zO1ddYq4rGSLndb0DlsH6L5kcMxVv8CeSO8/DprCGRy
 IZnVfnKBgdKAQ995OIdqn8MPVmj2ZBqsHEggTNOuDQ+NnZB2chDwwAD
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: dQuXybyHYmOSQM8wi6luI2YhmrEGR6nA
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901cae3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3YzqomBvCdNxOiMskVAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX1q1asjhjGQTP
 Liz3QUDI3w9spP5IIMWe1jJSwdCx0BFX9U8oZdXbGBbeFlZ/6ZbRJ+s633sxuxmfdt4nDSbWLtt
 XIynKAPDHKFrmnqoUKaIjaGkTGKNQkLc1gPGhClw+uvsSwWwagJrCy10cGLuvTXj7/BxxU5jbTk
 equVwkGjThYzOmu7c/2e+mFNHwn5dcsUcqVkPR3x3iPJZ5gsCbqHz00MkIT2ZsNM7I9Fux60SsU
 nsSyVs9dI+ZFkAeoLZEKDY4X2ACwfODBmcD/i96OkDB4wIxd+x3gIHxo7XpMfvNtHMFqdam5NR7
 6veK82fjopnMtuqWYj70xHq7EVuY04QxC7qTNa/7tDvW8iCSuQ134rV+jnrWOUPBEo2PfNzr4O4
 hoGrPibZK/NBaEaeam/fUmlbPRDwuQ==
X-Proofpoint-GUID: dQuXybyHYmOSQM8wi6luI2YhmrEGR6nA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Document compatible for Qualcomm Glymur SoC CDSP which is fully compatible
with Kaanapali CDSP. Also with the Linux Host running on EL2, the
remoteprocs need to be hypervisor independent, the iommu property is
mandatory to ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 8cb839ba1058..117150cebffa 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -38,6 +38,7 @@ properties:
           - const: qcom,sm8650-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
 
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
@@ -255,6 +257,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
     then:
       properties:
         iommus:

-- 
2.25.1

