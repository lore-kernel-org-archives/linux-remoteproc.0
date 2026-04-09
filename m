Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3BA377EB2
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724757; cv=none; b=LBs0vWiSclDNio8JfdlEsKSp807OSKSr6DbJq8d2KsP5MKDK2n9ssbJlCSQER+pJEKqsJHLiuh93BI9eUZ3HbkF1vTwWFs+BS5StF8Ox74hOEig6VVjq1mLezifL9g++Cypamv5kH2GMdAYi1cQK0tKB6wLi2XXKCQTP2PuwF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724757; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9xdl5l7r7OA4gfpOkxwkDjaQmEAP5fG/Cjyap85MmIkkM26NI4MdHptZCoLPjgfCFr1RH6Mz9jq4JI8dBW/Ckw/AWRuFvcI96jOF/8cepyXD41wUx+zXIUUJJl3z0eZZwzAdxwxjVoz2TC6/BM08YoaYDh9GeKebEN7C+Oc01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4B5RlPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvcGtD8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4B5RlPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvcGtD8I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63973rNf4049335
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=B4B5RlPKTTgJriLq
	l1ChMPjnmx536My1oGDjauUCeHUHDiLpMZcHS4dSDxW5g96j/ScFsqvtkefCG4Kg
	Etvy3P4cO3/qRH7NETllHgnSEDk2oNt/KJj6N9byzHOkKx3R/+JsU7bayroPCtQu
	OTf8y2cIivHphYWuchNtYceFd/M/nSpYc+E0OKJciYcgOGUPkxPFr6D0BDLm09SD
	nMKyFkHpqIPH8miHChrwTYXv7tRrDYbvt0MBD+16w4VyCk40bDXDQgr8ssz/DdoQ
	U54mUqdi0w3gGI9wFhT/ypYBmWTTBS6Ez10ikgaq/D16+HcKuTuSHjSU+lNRjnmS
	H9xbMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtd737p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc9118dc2eso1433326eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724754; x=1776329554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=KvcGtD8IhbjbmxaAJ/L4XVtTGtrerQb7BCIUHDf9+slUGrWUlAB9oe+iWFW7A1UtVN
         CuTMTSorqlYIDTEJ9277Y1wboLpcWcfqdMgcHtOYn16JGH2zdeyICqOeYmAmkqPwuHoh
         JvhtR9gIUvncwFwUFwez67RDYOOzY3pXoAETNPd+BusKh+QdF8tjBNgzqQytWLhZQAgw
         B9CI1hA+Ov6KTKRKHkXiZP30fNE/ELsmtwUbglJX9veMrsd0S6/SjMUraKsu/DlgYc/8
         YAXHq7y2YH5IGbzbVPzg+S3CGdQqW7qGWapBBoo6+5l8YatigXdGwOJ/m/2Xnwg7tR6I
         sJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724754; x=1776329554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=m2t4zMwLqF04aH6212hhjvEgcT87Fi6o0WIVKSb3AQudhmRf7OQHZRHfufSpSNvZxP
         0s8UYKl9x7vzJmDiZd7QQFqQcCpls0NZlNTK+2wvAU7+IBTKI4NU/9MIRDgeWAxJ+ONn
         7/SMudHX3250vnotHSWR9UEHJZUG2McSB3iZUFi43I282Ac9V1Z7LvJhgYzHxf9L4F9h
         Ty7FS65qxKuM9DHimU1QsXI56GG3FZRGqZR4ZhJIV2Ubv/ndzrLPRXJYCp/2TGUpv8NA
         4ILp8bbaQY1zIC+cGSlTur0kzYBjIVoljktwSgcrsHTN6KwC/SvupIWJ5/qsJ8OcF+V5
         BTQA==
X-Forwarded-Encrypted: i=1; AJvYcCUKR4BXlYHDVpfJA9f6vx6qbDy+vE/3zhPE6xmyv+nh/CLeVXiN/xbMeJBm/DyHYKlm48RL/pgS4iBozad44jMy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tRgzuiT2fb0y4PsC9UtV5k9dZiAoSGExo7M0P+RYQA3xJ5KU
	c36SDjnC5REDNyhVVJ2HcAgODi1nlqSYD5y4H6rRuf4Mv7gDUod3cW2biDA7JC3+2uBsdnjVfNb
	pgXa9vYJwRQ/RTllRJBkvC73v0wojBkEsvWTW3OqdEmVWrqlZbJv/w/sILYM6LnlKW6gyL+Jo
X-Gm-Gg: AeBDiess5rwZ0QNE1Fb6z7+IzXMeQl2MHsrMR8YKpi0iGCIy3uPTruGc/3XbP+9PRDM
	D4fpsijKy9i3+DzUWK08lAGueok46pAqoQwpPZKlDLLat24/NfJAz1x4NBbc8RvUc/UFsfciiFt
	WvStb2IXOT7KYJN/8v+5Eql4z03OlFS1o0dv4wwcBkfYFGP3EkgZ840rV8wW8QnF9gcFgmig4Ik
	aOeyFO6M+Hmhm9lp8kJSG6NfWE8XIHQrEp0c1y9YPTWfzdogeYSCwoLFV0j1ofx+gfJqhyy1qrd
	432afBhIg3fzmD7SSLPY8EaXz1LUX7dqG52uKaPhHy6MiszZyE29wobrR8vnlWN1udbnbrNdDsN
	6VRb9QymQ+FW/DhuOWmdAYXjoRQVizg6FDTaBVxRDWUJ+cUUyqrAD/hCRPlazVYbfUlaKjxI5
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169769eec.13.1775724753669;
        Thu, 09 Apr 2026 01:52:33 -0700 (PDT)
X-Received: by 2002:a05:7300:fd16:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2cbfa4c41f2mr14169732eec.13.1775724752976;
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:24 -0700
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-1-805a492124da@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=Pb+jPWKDcC45WGJHg9WVboFQh65d7ITa284WAAQJcSvKRDijifM+KPUsCIaFSCxdiZlFTAH6p
 GxqElbILrjPCrYtiVfKgxpJwbIwFOXvyqgr+u07O8ip9UG7nn2N43P3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=QoRuG1yd c=1 sm=1 tr=0 ts=69d768d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: TdbdejwRYuXetLfJVyWXfU1VcniGAsLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfX1GVFsSPwG58D
 DOyqI12QmfaAvzq2V3dgsjBWwmBlTGF9Q6C/Isj4lNFsAO4zw55V3zAJP2Q3R7u/kc21XLoxfYU
 qmZp8kfn6A66yOHjDHbcpUsv3YnwaoCDAXy6rAMY4Y8ob6No0J9RXO2tqXBQru6ZGd6nyZ1M2Vq
 fYwu4OTQtNZH6UTeNXioDdQEuDGUXjUnqaBhvJRY7RHCKXjo39tD/g8O172xxvCsK5yZuSazn3Q
 7fHuP2tP8mkSZZJnIMmqxy0UTUOZaWw0nVLknvbFw/tFQkpF5cCFSj5cyE7zwSHkxmBrgOP9XzP
 SIXSyChntjmxWh7Ap47uK6D6zx7H2feoIQPvnl/TGr2/M1b+ft5Mv/Eburq/140sY6pv2D0jeBM
 dtC98Q4lEmuZlsLOM7nEbl6sKdaxzJttOWi02yt8W92NpmEcrUWKFUSdgJ7ffubq5lHgvUg6qZx
 tQSg3c6+Bagn3UAytzg==
X-Proofpoint-GUID: TdbdejwRYuXetLfJVyWXfU1VcniGAsLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090076

Items in qcom,adsp.yaml has common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.34.1

