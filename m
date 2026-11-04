Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801030;
	b=AXCRZ9Ik7UzAe56y/aFwqu2YaFGZMpBt0YTlffUfCbLBytJuhxMnk16mivgBBYyLfEYD
	 fcOHC312iCMQg9IE1DkawAlHPpTHsiTn+feEXkJkQRzJlW31sZqoAKtbWUSkWdHrmZyO/
	 p43OpTi768TqsR6ulrX8rfrxPcBg7BvKVtC9rVun5b7h7P7Z49rTcO0qw+89uc0EghKsC
	 B1DhxIap0pkMeI7uya7as0BHaYT1iBC4jm8vtNvrJM3tJ98uvmprcPUvJ031KOe1+98Nh
	 aBvS+1wXUb17WFFHiqSuXgayM64WRKBjrSPm8iofiIcer+cgCmeySkJ/WMi66Y0eDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
	b=N82S0gF9/jA30e1SJQOUp22a2TL8H+lgZYg6T9dIBYgVMNThUpf5OkD1Ofm7ByT7/SU6
	 jV4B4hZ2BiRHnU/TiAnXgGxci+Wl3PKE7uQHGqJbWYF8I+7LnDUq0EfNaxL88I3ZoI4FD
	 SROK2//eF0RqLjobkx5ty5C0Hk17vN1OXWnPBHPlXE3JLrjTDLj50Rh5aJKlRMpGlTG6V
	 mlM7B2LkhaHwcPbHjKE0aSA35JeUP6WbMEYjWQibjzG6MS2ZxaZdHNrZd6LjNPBa5CNlT
	 0E+MZLzD2IMaSOUk109kNQn09jKQgANsIXP3ZtUrruiYhB5kexzxOrsyHXwyGQK7nzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNINtf+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk7jzkrT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB6606A32D
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 14:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54AB6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNINtf+A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk7jzkrT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZwrl2667797
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 14:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=; b=oNINtf+A+usx6+bN
	JotwXt0lFfw2lXT9PK7AoaqTgXexbUk9AqIcMSIMvbf0PzHbhdxyIBIpMQJFjMv6
	+V0dbn+COKQZG01jfYb5grh4mrdXTATeixj+TO5oSsf7zKDyGWs3VvWSD1Sp80KU
	6jtOKa8SkipHtbv/yKDyfQZOvg9jG8Og+NPBCd3FfzyCAi7Qph4g0Hruif+vmjJl
	DEQ5SE9kIHvFUB46QY0r3l5HAK+lIQEC+c1SfRXs/mu7Xy0XvIt/8GsU2cCUeln0
	xnPV4KCO9+/UIZ7JSnUpxp9aUqZFtl0oVP2ZVTLXNDmkO5jDyEE3RLLaDTDRcaKt
	HG5MIQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmebw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 14:03:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1663741eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801029; x=1794405829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
        b=kk7jzkrTd++x+fLkULDXLNommMNG1KC41lWH+JJwsrgxP5AygywGU0hAS9K/nWlu9S
         dCnbXWsoLZJlsMsXik5jq9uG6OV2D9yIzPltwOZJ23D2+H0sLXTimwtGVCvQwlS0UTYn
         Lg3ECEb4cnpZfcevYyY4pD+0haBjOhuWMSp2kquEYEKFyVBq640thNOr4Adcpb3aKaMN
         WfgvQQkDd0HPtIMQYggs5IBsUf8uHmxIIbVyiLZ+nv649tBkMqG+LrSsQpiiNse3bO57
         HuK6xYUWET9/U2v43IppWUeuftjFvfdNkoSIs9sQwOyZpDlFy1zeUfl9QJE3dooI24Z3
         FKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801029; x=1794405829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
        b=gqTbMsNXvj+qnVFx3X+QQZiKW7daE5GJKSi5zX1Ny0DCjbsWpo96jvBUazFZQqaOq4
         DpWWB6lz0FvQ+5FrZ1mJMSEJb4o73yaE+jItJDDzbi5Bh3DJk36KriiizaB3wpGtGl//
         xVo/OWXFH38mz9Kig+wuCbK35/t6uap7ecfHnu9vn2IWeU6jXQ7FtKl5ePTm/AGu2aen
         MLGV398FrSGy3Jq9YKNcbNmdDrDjZ6IdfNQUNiAATUM68R6f1fDndKp/AR9sHtD5qrRs
         cl+tRGzi3k1LHEKbmgfkoTyMLjgr6y6f4mD+VBQPnLU2LqEU4NKC1YC9bp1cG4HreGp0
         Fjuw==
X-Forwarded-Encrypted: i=1; AKwUvBxiYIZiM1vxgdW6hCOgLOHu9nwOyD+nt2utI0xJvjYOM8sUStXEKA6/OhFMzmiID4rFZbdbQalE9fEEKadi98GY@vger.kernel.org
X-Gm-Message-State: APuU4Z/qnhqEb8Jj81b/QTcw6DXxgI6GGNcNY0FPu7Cn7kSAVWRWheyt
	wn2xTwWnZ/xMCbx7p7uCuAmPnxgJzXy7yhwBBq+t8ggoIHpqB4HmtjVK/W6WKmr9Bx2fManRWhK
	co4UhtRl9m3LeKkTHl5qUISDIx/jVEH7ddSlHqHvKJh66sN5xJsmSBUmoxHg8GYrzVzq0DQz5
X-Gm-Gg: AYBFou1As9X7j2k36FxW5uTx2ZPX7asVRT1AMhnY/aBjWy5WYHMIW2Sh0yChbWzK6p3
	skavvhDyAoDG6lH/TloQDTP8rOyfBy7iKzYtqHlZ6FBwMKshUAhLUylYVAkdJerKobU3Qv3ZEDk
	tdC/p4k3i+R/ysb0YGVqlD2j5ErB4adOuYlG/v5dVMxKH9lsToZwtJmohDm9Ajeo0WmALb5kQuJ
	qHlvYxlueBEJk3VZPAWQHQ+Ty1nwkQe8HlZv6d05fEIi/hzkW4q733Xwv0r8FF7IrN6V7Q4cgua
	AlD6E23NzFG1z1P3mQe5dx1yK8L/jLvlreGb5B+E4xJSZq9ABTd6APmCm6OQNhcRVd9NxYOYLmB
	kURTPqONExTvXtwaRpjsB/+uzuI49uFMYSlzSRsPfurpGXY/zlZn1u5y8H1Kp2N1/
X-Received: by 2002:a05:7022:158a:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1acd02973dcmr25494825c88.30.1793801028376;
        Wed, 04 Nov 2026 06:03:48 -0800 (PST)
X-Received: by 2002:a05:7022:158a:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1acd02973dcmr25494776c88.30.1793801027525;
        Wed, 04 Nov 2026 06:03:47 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:47 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:30 +0530
Subject: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=4025;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Mkvg2QZy1nYHDBab5egxAvVxkkQ0+7XNBqgQC5oUCvA=;
 b=lM2sld5KcyNQU574qia1sJkhnHXnY+gJ7wwH2m2geLN+Y9EQwC6NJI391Hq9wrjjxn4pgTmbG
 1r+h9l0XmQDC7WoJ/1J2PEmaOQYgDWdWVI7mrMzSg2DIDLDOW7ApfR0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+U8YlIUV/8cr
 MK9lgjNl/VqYXI2IdjeYDZvl+lRdnZf1yhU4G1f6hcqvJeQmUpXLikyVz6du4InxRQOUpt2kw8L
 1oyuIMb2KyaHX7ZBetO2qpno9paCIOJCyjVRl+kDdOKAhEF5ZxXCfFSVBMPviRYM/8ciy553lX3
 ATpsO3FoP9WrZ7Szk9pboWcAKBmYNZK6SJpQsiAceqF63OrfHu6clDsRApNQ1sUDicyV/ah9bXK
 iS59OpdMbDLDUiMyILbpeMbiBmuI06V/fvFbTjPFMx6tR8iifZ7/SW90Z5FFFGKuxY7wMJ7WzQx
 MS9AIaRc2/IZVJVwh0X1sF85UUPPkZCTn5HJMZSmd8tmo5oky4315L+fHvQSitGwFu0i8u0Ygna
 SJdSmNWhiJg0X/thhxc4hJOuMl5jEVJhNN19xiGN53p2i/E0r8PmwJJ2KuJPJ8qM8qqlSGNAWTg
 kEdKLhWGuvOGvS3Dw/w==
X-Proofpoint-GUID: ceNAeUNVkVjzLjiLweHjTV-hAZ8WMa8n
X-Proofpoint-ORIG-GUID: ceNAeUNVkVjzLjiLweHjTV-hAZ8WMa8n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyJ5+5jlHEIK+
 5er8b6r3uEWTUZXFKEe+boVehAbRmtZF3nRH29mb+WBfv3+lpZ4iorRO6jU+Rhty2ddVTw8KTjd
 LqughCnsYn5GHJaVKqUMjW/6dYPNHJY=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb3b45 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hA1A6weoOJfvvjuqJi0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

The `iommus` property constraint in qcom,pas-common.yaml is too
restrictive with `maxItems: 1`, preventing SoCs that require multiple
IOMMU entries from being properly described.

Remove `iommus` constraint from qcom,pas-common.yaml and add it to
SoC-specific binding files that have EL2 support and require IOMMU
configuration:

- qcom,sa8775p-pas.yaml: Add `iommus: maxItems: 1` for all sa8775p
  and qcs8300 remoteproc compatibles (lemans-el2, monaco-el2)

- qcom,sm8150-pas.yaml: Add `iommus: maxItems: 1` for qcs615
  remoteproc compatibles (talos-el2)

- qcom,sm8550-pas.yaml: Add `iommus: maxItems: 1` for x1e80100
  remoteproc compatibles (x1-el2)

This allows each SoC to define its own IOMMU requirements while
maintaining backward compatibility.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      |  3 ---
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml     |  6 ++++++
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 12 ++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 12 ++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..4662fe4cff62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -32,9 +32,6 @@ properties:
     minItems: 5
     maxItems: 6
 
-  iommus:
-    maxItems: 1
-
   power-domains:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..711c2f723b17 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -106,6 +106,8 @@ allOf:
           items:
             - const: lcx
             - const: lmx
+        iommus:
+          maxItems: 1
 
   - if:
       properties:
@@ -126,6 +128,8 @@ allOf:
             - const: cx
             - const: mxc
             - const: nsp
+        iommus:
+          maxItems: 1
 
   - if:
       properties:
@@ -144,6 +148,8 @@ allOf:
           items:
             - const: cx
             - const: mxc
+        iommus:
+          maxItems: 1
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..e643e44a4739 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -178,6 +178,18 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-adsp-pas
+              - qcom,qcs615-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..dd81ecdb8dc4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -317,6 +317,18 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-adsp-pas
+              - qcom,x1e80100-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

