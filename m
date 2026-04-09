Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E911A285
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724759; cv=none; b=doCo8GoIjVvNgCbqywCPxMOFe632luyZ378n3wTOr8gLHNfTdu+7ff7VHqpxAcPeG8xJwYkVaap+B1fXXiBg+2K+5WEfdGcfrfeY5ik4PjmoZURtw8mhVXP/acAJbmGbXYbuzIbZWBbMQGVxdCCxx1IjAybydlHaNZj798BidWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724759; c=relaxed/simple;
	bh=3Ji3C8JJe4/d8U4AgLvbrOfT8BUcflDhcma8crXqLPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Un1xoh9iMyvntEpLfUAkSi3WIS5XVEHatnMke6MNVa2Mk0XpDL0UoS8FVp42cjn3KYQdcVvchAOP4SyYMGgZWGHH4tfcAtRSYtOWrIV1zau+qpnUqcE4+wqWR5FW0XggNl5S3xBzmU2oinRPWY6fYzpLULSoJ0ENup8cFrBBM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vkd1iQyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrcdBRSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkd1iQyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrcdBRSN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397GAcU2844945
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=; b=Vkd1iQySoJUnbtow
	ltSfwWWASw0jq/Q5u+VowS/52hwV5hWC+U1ceG8dZQdbLIwRGBDK2ICy8w5JI7iV
	0B42syVO0UxjLJA2kX0z0pCU8jR4vFywDgitAvCp875WbIYvdfqO5w4FFcoz1fXG
	HirhRXXSp81Y+cBQdOOezA4ERgM9KrqLkEdpYx/J8cbn3KmkI0dy8BxvykS3HWRn
	sEds82vMrdAG/nvGEv6EQ8OAjCbQdhzBpqxmrMEJqdUL3aTnqbFIKhcatEvCHNlT
	VsHlVNYYP6KCymNZWoqkzmJrqpiifFX284nfwZWeQ5ND77y518brMKyI1NsIZ8Cv
	niQT5Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hk8ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:52:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c20d5d7f4so7111976c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724756; x=1776329556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=;
        b=YrcdBRSNMZ/MmkzEqO6F3oGrFALheVJLhM4ap0i6Bt2WCXqZV1nK0OOOMekUwisWMb
         dC/g3zMIUNUwCF3NA4R8nB0YzI6CHJYnAUqkrUa8arnisb4ONrt/XNR9pNDSZU/yne5S
         jd5uC9h6gLlO3o0rdtMuZh83R9aUr5Dism+lPBA38G8xvYdD80T6KbBUfvi83V+vlLrL
         BUtaqKjZmATGbomZ84ptt167QYC1oN6qXOz+UM9psRLst8nbOwSzL0C5Vr1+rQtGd0Y9
         hvvUEBRm2q0i2sjBdiqF65pAQ1bSrBuW10AxjEU8IJNrcJsRLWDwvJC72rb0yA/2ox81
         nTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724756; x=1776329556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=;
        b=PabRS90aNF0JWj30hzR8Zhir8NDv5mW1LGtasomemne3/oYzy26NHeX3Xu1tZ51vEw
         Xmc7RnYOdEsgYzGdJ6bnts1CqZQUGwz7w3bG99i/TIsZhdeErF6yEFFsULT/NudrSIJ1
         lAWDV5t430f2dlTVc1P0lp3qj4Zq/MPNlcJm4Te1cDZi8f5nIvO7A5MvHFKfc2YppQQk
         Ly8vb3bmWN4s5479/+jSX5WGfEdUHw9aMYA8UXtMU8MzP6KJuhdfXw6aNkxTdN+5FjWX
         CkPodQcXZCmJFGtGQHKHRe7XKUZLt4yj/GiBmYwgTCv+vp+vFlfNKDqchd+BOT1qZRFy
         jqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL58OEQ7CCNYwQAKp5YwiHEe8q0txsaQn9rDRixwjGNHkwEPVWRdN/joUxW/TFVffZIHb7LbaJ7GZ1Gc7ky+8l@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXms5w/A2yAf44wPlppysQzhXyBAi/x6bQElRgwLjMhi9BrBl
	jMj0cmZaE5BVcKycTXKVKCqv/sDHN4+06Wt9t1UdwrI1h1Vs9pRFsEeBiuBAmw6VDIxu/DIhAG8
	6WYuwDmc+1Y+4Smn4Nr+Ji6vn2GyGTpYWzUX5VLU7ZVOKEYhLrRfdYEUGZHzKpbRLYUgzi+3O
X-Gm-Gg: AeBDieuEUlnws8lXedPns7/Wp+P1xMaZ/XYm8cuCK6vB+08yemAWy0islM4avSjbAoO
	6W9btdTyuoIiyL4rMyoadBRZCqW8o2XD3gJqSSmQiTg85dC1mZFSWIwum5HduNSfrwKfp8DyWYw
	bB18Xg3ZrnjXuGTFvnggdgFuVGBIph8ZphHKMfJ/KVlIW77dYiUUlAsLICo/JM3XIDBsHYfB88k
	leoiZFXNOedh7xNwH1dPi+apWhdAi6le0PRotkkvEbnu9EGNkswV0DytGhBoxpU6pj/SvnbFvOP
	IwRwz/HeHuPndh09WdCln0sKv0iyrUgu24QiDrWQ/+2bOnZ387qz6+ncFQOmGyh9Etdw/n5mSO3
	ARkD2f5U2iklMll/bRYhcfhz6sCQgKJrIljoqP6CXnd0tKBbECEqggSJKVg8Xn8hgRjfWmej6
X-Received: by 2002:a05:7022:418f:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-12bfb745142mr12226172c88.19.1775724755447;
        Thu, 09 Apr 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a05:7022:418f:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-12bfb745142mr12226150c88.19.1775724754802;
        Thu, 09 Apr 2026 01:52:34 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:34 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:25 -0700
Subject: [PATCH v5 2/5] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-2-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=15056;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=3Ji3C8JJe4/d8U4AgLvbrOfT8BUcflDhcma8crXqLPc=;
 b=9IsmcGNgagRdUKndKzgxjEL9d2xcDMewyTZarTo3zcFN3u3Z0oVGsQlJcUlfEPleD+nSf1R7r
 cpCwIBQ7k5eCbzCsIA9dF9cE6f8V4BL+I6QNm6vRv1LHBSr0WUZAkUx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d768d4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4MiHK05HUdkkAtNoTgEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: kn06g5Kf9eJoztI4WAb3t1Y3OuplaFkY
X-Proofpoint-GUID: kn06g5Kf9eJoztI4WAb3t1Y3OuplaFkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX+7v2odysw4g0
 XDWQHIBnvA6/ExQH2jjEIYFA9cRX1rG1v47jr+AwLcSYq+mEJJSOCjXJ8a7tbqbt3b0xPR3fLcf
 OO0435xo2oWEezQcwxWfbO/F9ySZc45Qj0jQ+dJO+Hud9B3OwtBeOqHcLPlGTo0oztExZNcwNkH
 dz9YgfAnf6GbMxrV37U7cOpDeSuhCk1GowrEFbHDaGYTHgZxPfLHz0mhbbY53BRRxbHDqjncF1c
 8yExs+gBogtJdalPJumfziIGDKgLRTZRyrZWEUHWXGUzsXA4i5gK2Q1C4Dgy7rwxlFrZKM4mdRA
 n+B9CvhSkd4fTQCxBb+RLVNb8bwYALNmljQ27WWXVszIfpBXyPkvYo1d5sq9nK7Di+NA1tClsB4
 NSDp358csytAmFVk/OK4TXKbve2R3wnkOSaB4B+f0QNjXa/ghVAewc7G7/hp6jkBE5apFTbVCX5
 M8tUfVZjbjCfrWoj9Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090076

Move interrupts and interrupt-names list out of pas-common since they
will be redefined differently for Kaanapali SoCCP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
 .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
 14 files changed, 226 insertions(+), 26 deletions(-)

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
index 68c17bf18987..dc5a9981c12c 100644
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
index 1e4db0c9fcf9..74df49b5fbe9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -73,6 +73,26 @@ properties:
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

