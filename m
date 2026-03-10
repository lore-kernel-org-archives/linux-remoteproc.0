Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C824449EBB
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137038; cv=none; b=M687Mp6ZMbRVnNqZsinTlp+afjBGHk+gz6SeFsBp2x/4szAOEKUPX50pPi5I+GbIvOHbGQr+7NnXKIntD5MEZiQY1t6+ZhUe0TeAWYnN016YFk/9W9u+BKxdTp5lvsexRPGecpkgY0bgQ0wBNcG69sEsiMRWxC2ufc1xXay7loU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137038; c=relaxed/simple;
	bh=gZbvYWxtnltp+9V8OICF8P4ygq3AOAwfyaCIqwTHoxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tD+5dDS6gsJcleGhHz3Xhrmw6KdoI7Fj7GX3bLbKpoDNHmc/JwfqkoO7RupEvKOD52tEynt5E6Qp1/Jn2qo3Ew38GmA2HnESH84LNVx6+IAUpDTA/ccf8buDNjttg0gnPbdqSvfVDi69CHSRjOH/NQgtvXkwFStjpst82ujmmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUrmS35C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFRvFCC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUrmS35C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFRvFCC5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8vGLp2020757
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=; b=EUrmS35CpQatMFFJ
	Fa3xclvIkrBLk7+8cvVhVbfp8Hot/oobQLBLQqGfS+6wAI5tfSRmbYlWy692REmX
	CxjJkEiKTNlVpKbJ53HaWgFuW/rfcBnSYU8wLNuQBgkqS9MDUu/DVke4FVbH7vRK
	lqnsKZGtOLDXoJUlQnGUdMjtZz3OfgmI19PdCRDybv0OwzYsZHAzDmOs7g8E41WE
	Zlcwlji+xi8OoudNWE9Vr91+WpcQbIVg9I9MHRbQ0jDwy/SOXd7CNuUq90BExW9N
	g5Xb4Fj7zsfWHPiohWFVt3ekjs8yojUwuZXjfIIinZOy5se+BrBpq9TiYyaf5OeC
	1j2pdw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbupj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d7536294fcso11474520a34.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137032; x=1773741832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=;
        b=fFRvFCC5a60w5r6ycNnVjDNMLVQoEiHaEf5isCMkwspQeMbTD4CyoO9dBmXrsc6W6g
         uvdHaw1Ox7h7saDrrI8FGRxyLClPs6bLD9ntu+85Hm3zrfv0964qGt/3Iy0hvKAB1u63
         8BUTgZUCU6dfBTcHlodQPI4tcNw5zBxZ+HdKmck5S4TjmKBzJKSUo2UeQjrbc2AA3gY2
         gF5brEu7UKRVQs3FHCjgdKW9nfjvzIYDTCfJAxWWcXInrYLOul+hq7D/lRFTB9HQ97Ry
         ypIdhvfcfCzpmzwZ72mgEcYp+SqoIiMXl0GgdrKZz3S9/yCTiF9qEWS2WU7nQAoP1KB7
         WDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137032; x=1773741832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=;
        b=rlUh01FJhhKfedVauAd//OpdJGRvsdGNpgeXsQhzC84dyz2r++qv42PmBOtLAWMux1
         nqDdmpJ/ZqYYkd/wKk37WaXOqlUG/4ufr0g/JUvNUnI8AyCWY6zgaFobBR6kB2vLXvTC
         sqvW6RBpT6Zs85tatjxwrq6nymjpVyQhUOE0jPfe6qrH4A2nSaAOmTCjdEKYjW7sQ6p4
         OxVi0P0cTj26BFQ1uZnFKHAy0rCS3/WkEXZc6Q3mrk9/lY0ceRqEE66hGVjWPKUxclVr
         F2xtSRddh8UMCFAoCGngU2Cdgps24MmzGePmSH2k1MfTrT5Bh01LWeazNBT2kEpJGaGZ
         AvPg==
X-Forwarded-Encrypted: i=1; AJvYcCW41r0v48zNkGpCSucFbQMmRoRnocMRi0JfJgkW7+2AuMm03HSoXr0fR8mO4vanUreZaw6KuIZRcxcnB52FBAPa@vger.kernel.org
X-Gm-Message-State: AOJu0YxbydMQSqVdnHnaIu9OzyYKUuCDRB3o2pGTnEkUDxUZ0swA04G+
	BcGj9AvwtWrZeDZAPnJg0pBWP+vc3/eCzreWsbg/tAFIGHvcAZnhSzVfATgA6qxV3it6Y7HwFn8
	Rbq3Tx9rZuA8ECULHkGAYEfsoWgqG/hOWOrjoA9ez52iVrp0PXvej1aQY/bo4cEuJN9yazm0h
X-Gm-Gg: ATEYQzxkAjqWMOTcNaOBofCeH/Uzr7EkXKJkWSq96QICpgIDU8PF5bvNPyqXiMaFyLg
	3pFhupsS0N8wW7kS/gTlVG9MfUXuNO0P5t+HXBDgob2fNvgwt00vpvUcPgV2pnsmUKaQHH0SsJj
	3BmVMfr+x31NKc9z1h8GthtWVPu1+P4IwmAWXWvgK8lEoTb7js6sNk44DMzBOEfG6TlgGHR+153
	6KqLxNjFZ38F96QpTXsttmiL2a3M6dQVxQEnXkSeO3w+uJr7wlQUH7HTD9AtUUKGdiaNqVVq8Vz
	3HcMUVaZ/JljfRau2Eek/dIthhAse1MtX/gp+mJEbBzry7az5pzhCkukmnoLoEwFcguqbshBzbh
	jTObNaVgMvT0vfCCunnceKdZOhimerWKtmaFNutMCTDYvzkpVo99YWt0/nuc80TtVNUPRAR5h
X-Received: by 2002:a05:6830:8289:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d759b01ca0mr1760795a34.12.1773137032448;
        Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
X-Received: by 2002:a05:6830:8289:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d759b01ca0mr1760775a34.12.1773137032126;
        Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:17 -0700
Subject: [PATCH v4 1/7] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-1-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=2735;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gZbvYWxtnltp+9V8OICF8P4ygq3AOAwfyaCIqwTHoxU=;
 b=nnlIQkEY1s8hcXkzRR+Eh6R7DeJfAHlqsWXsssc7kSeNnxeTIoagGOKUomve+vyqkq61estpT
 bGh9e5qZyEfCbwrpRBt43TAqJlMlOKL8JdqKme9tD3/sej7BXizSwYo
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69afec89 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX9pFEXGeyS+Tz
 oxk9j4zbQaUhPI3fSsuCKANRb6XYyuZ6tlyI4Lng6rsXuYCdI2w25Yjvwt3iJ+SHgx7u7EISOPm
 jY9ZMuoGnnZCBUftcnlX7irkgvQJdpcMEbZK7R4n5PisxOg1cIfkUDhg82jNKM5Stji8SNrw2e2
 w6eW661TM03rW83W6blhnNPYWk9h2Cija53q6IaLe8K2StfitaY8kTNMwexbxhPf+MTxB6U4N0w
 VzIECqXgrniXaYad1J+LV1AfdHz0CDE7FjL/aqSlqeiEicn8z1ASdJubfP7ib+irariOwTv0zYT
 SczHlvU75uoReQfDpDbJIzU6rgVxzESye5QZ0hQqEllbOcsKEZ2xex6lcUbnJEmwmNPjJbyGNkF
 vWte2a9fwe3OsjXlcZjsqH8sj9vbqqonSLifMCN2qCBQpO1MdMxqybqiKet1+zaUv2ewuCtP2dT
 WeYEGcAAHoxZ3Go8iDA==
X-Proofpoint-GUID: 6JPzoJZIO25gr0nxG9QWwgBbDL_DqG4g
X-Proofpoint-ORIG-GUID: 6JPzoJZIO25gr0nxG9QWwgBbDL_DqG4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086

Items in qcom,adsp.yaml have common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

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
2.25.1

