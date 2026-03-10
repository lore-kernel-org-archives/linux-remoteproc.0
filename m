Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80C44CF40
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137043; cv=none; b=QdoYwlWOzUJWexiMV0CZS52w2Q4w1i5ox3azEq60i8xTYmlT9RJtF/AoXoqNxpKS7h0MFf1W06a1obNxnKZSOmeq/GvZe0bqp/4cXxeENcnYdFwPKkPEbuwWoia1fqpFK8un5dAC0IcQ/ZGlUy5K6nmt48Uh45eX59TbgYwIbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137043; c=relaxed/simple;
	bh=YCWKPXnQpiUnLfaOLbWnTkzB3ozdytjyIbPoKi2qgNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZdTWlz+eHEbts0VMnf6kmevtK39zEKI4ssfVGlsIAWJIUsPy6/pEsJKfdZ80B4pWxZJv+uMdxQsolO/0CnNKURyCM7/DC6cPgBmfIybGXcj1iRE/Gyn3VaSMy9BYlK3Ej3D9X93FzSxN1w2z4KSGBdldVNVuYtV3DlmZQ6dWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB/dmr4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro5679RN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB/dmr4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro5679RN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8tmft246492
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRkmw81EWDUFWR4PgZV4ft26rhGJ7QTVp+dQZURfbSw=; b=GB/dmr4PZZpstZE+
	LrieVvYKWArdikNKUmnK7wyAYKoIUmcoups2DLqfjTMz534fspMglIXVLsTEp/iD
	JHlDYLNoo4iSdmhCjSRTICx+BjiNuSJMIGXCWDsQgZhlxsNSPT7UawYw66iLlraO
	o/Kp7Gz4tU8PA3XFnksrSAL+EcMFRWuChuGxPIY+TFZ95OJlQS4VgSx4TW72mzMz
	bPO/a8o40ZLOVol3RCyXZ/GKMaMSuZf9TcIWcN+pROCKbhuP/Qdn1P9W6ukapR76
	y7lAw4i0K5p+tp7/oCBKRP9qdgwmkxj3wWY8ZVX5BsyjMwsfPWy1GXSfsdb7ttmq
	628VMQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801wpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:03:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d74dd618b4so17971410a34.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137036; x=1773741836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRkmw81EWDUFWR4PgZV4ft26rhGJ7QTVp+dQZURfbSw=;
        b=Ro5679RNBqR1f53scAJA2D52T25ZqCBT6DyOkD5LmKcfS1OKmhrxmaeQllStPxeobc
         DMRKd5pHCWw6IIh10liVd38lkfn1xDaQCi54BZRcpRPTZhgSaGEmh8i6UsQxWGjJnSmZ
         uA3kTOT7Sdyk3E50Vx583XSGNTgIR+7pH3PFxEHNEVDWu89ZMjIGPbbi6X8FJFED0cwP
         jyv0zm5b5DC1krIWy6U4Bj5JhfVe2zxIhaFXTAmQf/z4EY8aa826ydEQNSTPfbNTxaRO
         O5WB5ygdeOczslE/u9tTDQFzEpPAt2RFhEAyyHGyoM/FnEgUoTLqJmE7pJdllHIAqvqW
         jSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137036; x=1773741836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRkmw81EWDUFWR4PgZV4ft26rhGJ7QTVp+dQZURfbSw=;
        b=qN9iLQgxSSKUvHalGJabnezccwEcIMf4kFnRjZg4fvbxmDx6HboZhQs9PW3FnanNar
         S1CiCezU+Bgqhict2QEXeGwgbz3ibRqhKb9KdkXr3l4mgyg6LZtP6VjrfSOJzcBSwRHf
         SPC01e91Ot1evaapPxqHZoHgPC6XWuObsb2TTY6mS2lel3zes11RfZMvGO7htHcy7sSt
         pyWg91SmILsKR2tJIkA7H1o5YyfL+BCuE/DsDNaXWYodP5Jy0jFA0UNItWH7j6vXCM3C
         bVNQeTYusxB0jIqqOND9F05jSnmP24Un/nE5s7hIqyjyvoUq0Frf70ZVPC5R9ow6Z/C8
         +n/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoqEkdGy5C3+VBMcmEiWxhrBlYV0sM64Jp8NVvXnK1klhZEmZM9Z/egXUtNhRwVEs3d8T0lPutohQFdr51R7Ar@vger.kernel.org
X-Gm-Message-State: AOJu0Yym1rzksIvVJKYQ+6BIJgT+O/aCOIiEyz0M2fLU1gEj+/8FLme0
	AxFwbVkny3QKYGXMbwg1VleqVqRWHe8hHoyon9MfA3O9XEhJf7JbxwuPb1/R7XttQCGLDxUzskw
	GIWs7vlB7Xuj9UMElATR/JefdTV5jzf+PWdt6zPol7qGgwlfoLr2ylWx5PXM5JKz9MNM9wRpMO1
	rtSpNnS4s=
X-Gm-Gg: ATEYQzx2mG8H3zs8D2w6Lh+l41mVTbltLtEDJ44onxs+icN5qOacAEpRbSdOnv92Sto
	GH8NrKskMSiAJYSmX7pjViDqNj7droLvEY5i3kkaBAsrHZqg+p7Lgt/UPwQBUVANC/Is2jjn+3b
	M/mdRaMg9KMqyjrUEL8WL/+SQWWNHRUHC/BLRVr6bT2lY5EZwA2FbO+oK6xo58reRy+5ToVXzZZ
	albUDQuKGFQzksKe5yjGrgOXQTQLfOlIe3GZA0x26Kogeoptu6Tz0lL9H8zISVDzXMengD1IFYF
	A90uc3VNz0ddnOuNlJvbyMh+zUHsQsfKf1/Gt7/aJIQZwp077sknX5CITIJpw62RMm1tAcB+VfX
	lliq6f/S3jMPFCZ/NxXw+jPy0XAT2bzkX8xv5ZAJi63ou+mbiep7j4C1fEHkmc+cyaufEU6/4
X-Received: by 2002:a05:6830:67e7:b0:7d7:5d69:819f with SMTP id 46e09a7af769-7d75d698f7dmr932643a34.13.1773137035916;
        Tue, 10 Mar 2026 03:03:55 -0700 (PDT)
X-Received: by 2002:a05:6830:67e7:b0:7d7:5d69:819f with SMTP id 46e09a7af769-7d75d698f7dmr932625a34.13.1773137035504;
        Tue, 10 Mar 2026 03:03:55 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:55 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:19 -0700
Subject: [PATCH v4 3/7] dt-bindings: remoteproc: qcom: Add smem properties
 in documents that reference to pas-common
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=10488;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=YCWKPXnQpiUnLfaOLbWnTkzB3ozdytjyIbPoKi2qgNM=;
 b=7RIPGAugkbPTW5nhGJqwPdpLRzRqO4ft5cqFlgtBRwVQavLV7xDri43oBTeaEvhc3zWVVM1/8
 hKxI6TcFD19Am7MxDFRzdcCSsFVv+hMnCY7NA17wUvAt05W2WJvRY0E
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX5Eq5hPaEQdAQ
 MVK8IbE5m17NQCHLvVXNNf61+ZM8ugPlrZt1uDIBqzWowgLU91oWt5zaWUj6leuZbuC/UPdcBF+
 w0G4Zcgan+hxKJBSbfSEZbwm5nQH0cGai8IB2Xemlq7XZOyQGZZRMG3z9GAinYydZ1z/WewBaSI
 AeDEgWtUWO4zXhB1xqFvjV79dKRsKzmluiT5KP13wba3BRVL8OKzkqGd3YsdsdXFMGfdTEsJWqF
 fvyxEtGfKh7PRjtfeojHGIzgUhsenirFcO6lM29BfARVXB65L56Z+Y2bae2URZ4S3Insf6NlNX4
 U0df0+I/j4auwrb9wurQwmbmbFrnvopu54zl5gIAI/fNrWqiwCZB2Sv4WVJW1fM+JzvNtvA07sp
 I/1ETDnN4Ebg5Ih8YDhAWz2ueu+jIgmCl/LgAMbEtmcMfQFuxq5rPve0EdNcXrnivgTY53DGqVY
 ZrND/c2qzM57xPNIXyQ==
X-Proofpoint-GUID: QRqdd_c7v6_qL_kunF0CJDYxzDKjDiPg
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afec8f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4818-bhKfx29ZlxGCZ4A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: QRqdd_c7v6_qL_kunF0CJDYxzDKjDiPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086

Kaanapali SoCCP will extend the list for smem properties, add SMEM
properties "qcom,smem-states" and "qcom,smem-state-names" to documents
that reference to pas-common and add maxItems constraints.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml       | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml | 8 ++++++++
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml          | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml | 8 ++++++++
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml         | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml  | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 8 ++++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 8 ++++++++
 13 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16c35e15ee1b..7e8ecae8e6cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -73,6 +73,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - memory-region
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index f8e1b2b8e782..b24e6f6eaf37 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -68,6 +68,14 @@ properties:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index 5854b3d2041d..bf9bf1af9ff1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -59,6 +59,14 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 4c6d32b1031c..6cc2f4b700e0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -75,6 +75,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index cb0a61fc301d..b20780e5e26b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -68,6 +68,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index c51010493bca..86ae0ae4864b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 381ece510b0f..0b38194c0781 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -71,6 +71,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 987fac433fae..454ba82bd6f1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -71,6 +71,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 53ffb1ccd199..42e02c64347a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 6823a2a8d74e..274f87880e2e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -61,6 +61,14 @@ properties:
 
   smd-edge: false
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 8a1fae095a3b..5a7c5f8c92d1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -81,6 +81,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 4ea7518db537..72d0db5698c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -75,6 +75,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index d93e17fb5e89..f4832c2930ee 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -92,6 +92,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg

-- 
2.25.1

