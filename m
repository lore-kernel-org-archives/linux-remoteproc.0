Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51836E488
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209157; cv=none; b=XGl/TrZlaCi1PTKlH+NWCpWLEjkgIl3SSDVYQ65eQ4B/7BAsnPqzdyrXyvYMb7DNrmwTHugDsqfBEl4d5uCqxvBNI9x073OAD4MW8ik57jMJiblcljbj9pWydULqlDJt+5XoWSTb7Qzgt1NBFczW/iUUp2Mm5zYRD7v59k9duII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209157; c=relaxed/simple;
	bh=VAQAb4bSOBDcsfXJ1hNf63PoRgGAYkpk0B2R6P1Kp2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwXefqrleKu0aIE4H1YE+yI9CQwFpHrYR34xZbWQygAzARDS/queF23geEhC0LGCJZbN0oRetG7OtPmAOLG85KYPAg5tdfSB0GZcoPghqyQ2iNye3W46WZQMS61bdrnoNZmSsk3a/3XO8kCwLW8LDsQvt8mZxvUyMZKOOZXbow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZt0Nb9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJhA1bpx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZt0Nb9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJhA1bpx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA4wJ64126354
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ItuDPn030Sz/KpTaWrZ7IH0MWV+V2TQ2rKGI2XzsR7c=; b=HZt0Nb9VoTQhK6NM
	X3fZk6FgEynpW5mYkivGYwSJJn9ZaKGc/XQVhnE57A6aAzZtXk0ok2obf0nPUi18
	5r5JUVCPH6AsAz2xmk45GhF+ZvvuNhCLHykgzfEpbgIE9A5oup4zh2VJyn5XCTuQ
	FIh6mV6Rs0FzK/tkbGlJDW5wkxOIdmsT+X6XmyKwJGlpMNrogGfg6E2b1OOXvivG
	tDmfOrWNu4CFTyGEPk+JTeSu/4AG1Hqbtz4uc7u2JL9h4QJmwE8M6jKQzMtALTAG
	vesk3jVWzCFBaqOLjW8uHs6xmV6CzTUrvfEak+zITneFrLjN4CbiSS/F2hWeVCbN
	wF3fOQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32006e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-138156c0492so5124461c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209139; x=1782813939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItuDPn030Sz/KpTaWrZ7IH0MWV+V2TQ2rKGI2XzsR7c=;
        b=SJhA1bpx0e8+x4oBlM3VK6ZhPuv73IWHsIyauJyCdncZWA36j73uSbzWw57k0Wu/1R
         CDiKNjIccvTepjAoqmX3glzN0y/rcR5e1k1zOvH4Wf8SH49SsGhlRxIKZloYfjvoweRF
         TCmivdV0YSpV/XZ+Fxf/zSltGa8wDQn9ucSwISQabEvhn/gagYW2nU2Udjx5N9bWwz1Y
         /MD0xE8cNzTeuQak5uAIhAS6/YB/qHa3powzr6yTybVXi/tAWUHMxKSXRn1YutDQyXoJ
         +d4vBQT454wTRzNP8Y4fWDtkBLc2M87ShIZy3VkGc5/iXAnZ7k1G8CjJN//JUHsx7Ur8
         +5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209139; x=1782813939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ItuDPn030Sz/KpTaWrZ7IH0MWV+V2TQ2rKGI2XzsR7c=;
        b=no9FlcNAdXoAkw9OUXV2V/uTGMFf4Sd17Tsyhhe0zgOLTXVyfhECbs2kl9Axxr1kBn
         rfvHQ3n/8/kzavpbzkLe2MWO+yX2SiHz6eLzKtduYWRXiv+bvKMWnNijRzYHGnpRs5al
         tDbPKgNYrf5S9EqzkkNYjBO6peFBCpLvmWVC+b5Zx9FQRVdSbOOJHzDz8zux53K3+H7f
         cjpmCRXmDalDMtohG9Kg2VKpe/1jQZOJT/lXQNEHmgQn7BImc8oCUI3la5cNcZKIIF09
         LkUuDKYKzORbtRvYUOVQEG/YdfuN8uCDfrSeNZ2p6qj9DaV1NcI9ENZ6hX5PVWmRmMVx
         sPkg==
X-Forwarded-Encrypted: i=1; AFNElJ9N9dL8v3EIC2cjhmR9wbjBh0DL5fRYMCNyAcUGbbtf9ke1em874q5pQ85R06qcF4Nst37XrFWRbb3/xwgcYEOD@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3Dat+kThTp1FD3VsBcQIo8MaWLC3EbU3SAeRVtqwCqnCx3oa
	yOFrjg2cI90qJTZAOi4gyT7Q+E95k5idtVBzc2nAF27q0OdEyig7pGBiA/qmOL4sZR3EeUz0zaQ
	Ve9L8i1PYnoU3yZZcSrR+sUnO/e7iyhe5gJyAIofdQV8/9Y0DY2dMkm42X0DD/Uch37NeWIRa
X-Gm-Gg: AfdE7ckSGwkvd4VwyQ6k5EDaakza1Vn7bnm5nwmBWKRDYAWnmQUxTcdJJ3aOaeXnkfh
	1Rxjex28YPQloHzaR0JnmlTG7VRZ45Zw1HVgGS7SDVTbNyuRqbLeQbIeZT2jLvgiAXYEhnHxEaE
	1ASI5L6RhFaYc4acI8gDH9CrMCcQ65PKfweTojHGnED0X5RIW+kvTOIhf3Rsyt+WbDXjpwQkO8x
	/sgnnzyURtBxOCgwHIcI7stIUzQPPEjlaDkueWa0PvcT138E5l05o2Ry5anoj96fIcGbX0ctoY/
	JOGq1jOImworKwhoUSeaZM4qQms6Ua/HIcnscPB2bGvsc+Qz0LCihTX0ntG1fXyD5CvHAgUJ2aJ
	W44TZTTucrBllobMgBqEHuGGt5S0Z1Jxe+112FPCRkvftblQ88e/sGCMkAZ4JSA==
X-Received: by 2002:a05:7022:6614:b0:138:2f96:dc0d with SMTP id a92af1059eb24-139c5d059dcmr1387887c88.9.1782209138832;
        Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
X-Received: by 2002:a05:7022:6614:b0:138:2f96:dc0d with SMTP id a92af1059eb24-139c5d059dcmr1387855c88.9.1782209138088;
        Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:18 -0700
Subject: [PATCH v7 2/6] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-2-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=16191;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VAQAb4bSOBDcsfXJ1hNf63PoRgGAYkpk0B2R6P1Kp2Q=;
 b=hFiDVpfUS6wvqGHuAZbCab6dBwAIjx79NUtyKc+/iBAfI7V47UqBR93/jb8+5Siw7+BU4pTRl
 8xyBmSB3Fy6B1TN6k89y59XEIXq7yIHMY7bDnp0NADFXvLsrdQBDwX9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a5a74 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7WW1IXKuA6bLCH2mmpYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX3NSLpg5jRH8y
 CdulYWJbE6nff/secslICWn516Lx34JWLHwoq3W0UDE8K5RkRtmwngvb2y29L7eDgvvIVQ1QhW/
 usXtftVvIWonRbbrzsMQnnQ1pNyOEFrxl4qfbFXQe6zVM80Du6Ig1dCcMaN2Tr/5Up85a25RLtL
 MFfU6DGWonNeR1rU9THCB67MKLi9HVHkRNYp9/wiz73bJ2Jp+8WM37dwbSJDfUGf5wJSyWDHbpZ
 ZvosPWK9+Zif9VsjVWgyX0xeawmcDt6UpNuxNhuXaA760YAH7nLNS5Cm2MFlMYdKx1Xn6ysyXmI
 82rSI2gkyG9k2BhyX5JyUjNiH9DexQKlpqduh9+FbWFzNonSVFbb9c2wDE5JA9I/Y2VpwjmWfIt
 1ONEu4rT7L8qO2ZbFYY7HoWO4TOO+g==
X-Proofpoint-GUID: ftDYoQIURs89NnY4Ot9KKW1rYhOxJ1jy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX5tjzibBNDjLU
 b0XHY3i6GIkB7tLbDxkUIvr1e2W98lxJr4vN3C/h3Qza2pJyPU7jyDOgkdkO+bIgUkPA606irUg
 UB9sQyo58oAZn4BVf/0+T/2VyDwY2qQ=
X-Proofpoint-ORIG-GUID: ftDYoQIURs89NnY4Ot9KKW1rYhOxJ1jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230081

Move interrupts and interrupt-names list out of pas-common since they
will be redefined differently for Kaanapali SoCCP.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
 .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
 .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
 .../bindings/remoteproc/qcom,shikra-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
 15 files changed, 246 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a270834605da..16c35e15ee1b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -58,10 +58,20 @@ properties:
     description: Firmware name for the Hexagon core
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index e5cce0d05fc6..d22d50c1e1ea 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -34,12 +34,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
-    maxItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
-    maxItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 4607b459131b..3847aadfa980 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -26,23 +26,11 @@ properties:
 
   interrupts:
     minItems: 5
-    items:
-      - description: Watchdog interrupt
-      - description: Fatal interrupt
-      - description: Ready interrupt
-      - description: Handover interrupt
-      - description: Stop acknowledge interrupt
-      - description: Shutdown acknowledge interrupt
+    maxItems: 6
 
   interrupt-names:
     minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
+    maxItems: 6
 
   iommus:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index ad45fd00ae34..5854b3d2041d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -32,10 +32,20 @@ properties:
       - const: xo
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
   power-domains: false
   power-domain-names: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index bcd2bcf96e24..7f287e55896e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -59,10 +59,20 @@ properties:
       - description: Memory region for main Firmware authentication
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 66b455d0a8e3..cb0a61fc301d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -48,6 +48,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 8227527c1d77..fef9d7c39f3c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -45,6 +45,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 8c4abde74915..2bbd427c6ea4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -30,10 +30,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   power-domains:
     items:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b59..34a2f15e9361 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -51,6 +51,26 @@ properties:
       and devices related to the remoteproc core.
     unevaluatedProperties: false
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index eeb6a8aafeb9..987fac433fae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -51,6 +51,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index c1a3cc308bdb..53ffb1ccd199 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -45,6 +45,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 7286b2baa19f..6823a2a8d74e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -39,6 +39,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
   smd-edge: false
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index a8cddf7e2fe1..8a1fae095a3b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -61,6 +61,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc..4ea7518db537 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -55,6 +55,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 9f30a38152a3..4721c04ce09b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -75,6 +75,26 @@ properties:
       - description: DSM Memory region 2
       - description: Memory region for Qlink Logging
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg

-- 
2.34.1

