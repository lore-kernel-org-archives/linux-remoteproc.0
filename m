Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A112C0296
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757055; cv=none; b=pNWp4+C6ziq2Ryg/EPMSplmgVaIyGHoMaUAEhGlL/YFqJO8fDfH/Je0Jqj8eMQNbFWgfiD9Z9Hr1zHo62HriaV8e5A2P32w1N6zKyyM2319KuQxTdwkp8qV0aPpfL3Wuam+ilVl6cLvf0Ua9KNFpUOAAqgZcwraimEkvYRQimnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757055; c=relaxed/simple;
	bh=MbxEjMIaUENf1P9WEPkEfk2L22A1VFwABKvQjLg/Xoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3FmjIy9IPOn+LfhNjs0v9xOoZP6Pb0I3el55bQF7XZtZUvjm2XD8lnt+ty0UzGZe27cGkcBTe78YDVseRe90TTdF3ZjwRRG4rxnSBXpCuyYqLxBD0rCO8gr5BrgRsTE6nyxa4LIzcFEupVIrCIDU9DZJXCPtPqZhOBUJiahyAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y85xpRhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y85xpRhX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCnlTH017424
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feXVGRefITNODxeUJQMMl0Hw7fIAFVpnWml1r8rDvSc=; b=Y85xpRhXsG36zo6E
	0DiELzQtJBPqZexV9b+Eh6lTPaEtwMVostvBM38kfU6jTjjT3AZHkaPgcR1nN3Ij
	+uk0hyR0RVJPRxMOR48Rl2iO1U75/nqRQk4WdE8gQaqV3jL/j9wUo11TQBBhgud0
	mEoY9fIqgJ7DBQsKqU8rDktanUB8wjgquC6smOV7NVnBZZ3QHq+Ri3HEdVK+Sw3J
	GkIuKneaDBBSamMZDBno6dVB6ar7kfWCYUh2Oy/ufvJbJl2fhiAud71On0LmypQ7
	gpEE9d8KWMhBOYLrOLCvJFqo8l1XgyHqj2+GnyQyUzNCT6dbNTDHa+YauhSQNbat
	/1Rmfg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjycsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b57c2371182so272967a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757051; x=1759361851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feXVGRefITNODxeUJQMMl0Hw7fIAFVpnWml1r8rDvSc=;
        b=Sw+L1F7bjAF+hXbofhHr1zoH/yWC7TuJcnMq7EZiaymEpylmeumj2TCKxx/Lp/gzBF
         UeUxaItooHm6wWB9bXOkb24dTTHNPwQsreKkxIpDHUvwTuUNtcFXMAjhTrN+ZUdxVlOV
         76hRLANjBi2l4Ty8P4hXhsm9Tr5ld+jhMVevCx/aD2Q742vd1WFpF2bCXd3U95yIpX1h
         +InFMEorrtQL30ADn1JTGOTVrQNB9pbDRn0FEQIJvDV05ecLz3l/4Vu1jnMIK7Vb9HjI
         Im9wLF3+w5a4d6kowOswY4nwZQO0+wagEfSVYUa2Y9Q+i4Ncx7yVMZ99ZT1R5KRFP59A
         seFw==
X-Forwarded-Encrypted: i=1; AJvYcCXISDM6ZX7j1PNwhRmv8Wd4OnbzLqDj7qd/EG4f+F6Gvc2mdCMNVNxwoTlnw1NAvE9WUMuDXsvDc6cTVhPSVhDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKVAIWq5AmWWE+TP+wEFURs9NHHcLI+Z5n79A16eVvC3lYefG
	oC2Iuq5uRelMOxI7NYax9L4O+4t6wp6vJ9VqYPudvSpaAv5ecqyTx/CUMYTN51lmlCkgrGzZSL5
	ij6kEjpVZguqWUFFRh4ePqpuh5TkCCoBDEUVi8w9PxBgfAc43FZwLwkyYcP6tDORsQdZv8jf1If
	ka+hJZmOg=
X-Gm-Gg: ASbGncubDjdpsQNteyA00e/8b4EIEKEcoVsHbIyMtqzcSQGrehMvQ7SvubYlN7TvdYB
	sgp3mg0BNM4RF0975yPQJQl+AsNKpZwJL05sh7XkvMsUhoPM/viz6KI4RQEIq5+xH+kOwnl7oGv
	sFX2pUQQfOQtIgty82ipAPc9UASlss/DWHgmdsEBLVP4YqAWurZwYOpMs+R3Qli+PHcG9AerUlO
	tFI3s0+ONHUoTVHB226W9412KIuCdWEgA6itDQtB3QbBEFDLpk4apaPv9txSII8z0zI5HrOMsm9
	bDwW/ki/NQOO9Ye68mrh+mqWfb8RiodtwB0DMaQDZAmG4hnom99jZt0jJZer1zhu7MyuTXux8aV
	snu7EpuVL2ria38Y=
X-Received: by 2002:a17:90b:1b4d:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-3342a2cb650mr1454582a91.29.1758757051230;
        Wed, 24 Sep 2025 16:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb0KpgTvAPWQG9YQkzgc8DpK2qH8dPaSgf4xK0XteXzopA5zzTkpzU7C5BCgrqm001OepIAQ==
X-Received: by 2002:a17:90b:1b4d:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-3342a2cb650mr1454556a91.29.1758757050772;
        Wed, 24 Sep 2025 16:37:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:23 -0700
Subject: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1455;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MbxEjMIaUENf1P9WEPkEfk2L22A1VFwABKvQjLg/Xoo=;
 b=42zVztKkOXeN1S7cXzjNRiEnLF4tGM0ToLX1k5yT5lVTdwOtBlNJ6D7wBlNwRkLIlOLGE6QLE
 d2VDs9mZdZnDEaV0TGMefSB5I/ua/j6CUQLjo0QfiLdd65ktRjM+9xH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: g_fH83WbxGrvME1he2Xwre1cNt5N5_qP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX/uWEU6pu6Dwk
 A351rC/PpIGjBPlbg+xN6Rdq0OaA3io9v8J7H9RZ1WbdSUm6fOloicMOm/jaDzXCAlzMlbBlHhm
 9hhbuEhdM0r7doz6PqsmyJ27qZs4NRMI2ZKxxiIaCMryfnRhUaRxSRepwFkvfRGuu8/DJ+xR2Sx
 8wFSBtURNqS0Ra9w6pKcGVOYT6yrtpIu6a4l7sd2/hiypm7AwDiauc0vu83MHGjMokV60z7FgGV
 n6nER/7ieO7py7qtVerncnVs6myBLsD4EY5HwnyQboV49n2MQJwgrwsnQi/HJE5s6Tm5zmcnA3e
 bcw2xuiHm921YJp/dnmSoosKPY/KAmvjJvFAahCw+6N5FsflPgMJj2SUfFdca9p4pk596daAki3
 rqnDYWJX
X-Proofpoint-GUID: g_fH83WbxGrvME1he2Xwre1cNt5N5_qP
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d480bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fQzFCQHg6D5FrR4bPmwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index be9e2a0bc060..031fdf36a66c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - const: qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -107,6 +110,22 @@ allOf:
           maxItems: 6
         memory-region:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:

-- 
2.25.1

