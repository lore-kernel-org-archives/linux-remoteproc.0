Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088648;
	b=23LO/XQcAxCk2zbsh1kT0IcxyA16XyR0WWmpPtRAyamzn/1jlLp9asj6CZqWLYpRRVkC
	 LXeaHrOBrBT2v5+sn+bDM6fegNzCgfTgpgMlGYMPCufwQyCh2pIf0KN44bHB4QHGLypg1
	 oP75ka33rD6VQzFPcw6l/KLwngcHeRcs9SZlrCJpJlQ8nAwZzAMvP+BxJ5FJzxpxYuUjP
	 RiAG3XUGwii6x9iqSqZ81CbuM0FMPrQHbPL0N+Hc02TLeUZc3CxR7EvnkGsNBUgYBVfZ6
	 sW28x0ZbQpAtfqCqzwOVWSkBJpVixezR9Jtufk6lV9Z0Sqwr4hzq27PgwQ9PxvDOGig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=IY+xX6qN7I/OKKu+LjKHj8vQ3E4oNNbIa90YQVAN4CvS2+A7KyXmPetGpfWmqL3jF7ix
	 LTP5XEpFalLh+++LrDGYjfVpKYwg9J7aQC5oa/3IQyZchIB/8GlZ2tmmUuH5jNWnyfkGw
	 3nhhSHFWSEkkyWFcLA2fmDopw05EFSSL3dPVRZD0x+xjydJi1TlcfWlVChdEKY1CMp06h
	 j98ET31fJyiMIt56Ypqko1t0QjxlhipHXGTdTXw1mlZDdQYweVEIImXHmOddUZj3ggKqx
	 qBZr1zQ+b5wPPz2gQfMQSmbw6eZC2wMW6nbLQ1fumQXcfwac1l/0pzmWXdwyCFuQkPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B25606A324
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B25606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5sCYYsQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TLL82cif
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBZp7I2197579
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=A5sCYYsQVb1DNqvV
	vFsx50HM1vd3ITwfbBxEsGwBAiOYFsCU2uvrEp+DdC6spOpMDidfYb86QtHKIHWZ
	r2LLl7ZDVocZA+C6rjeMge9YNRiBBeh+RroNOmURJKnU+8r5y/zC635pxImWYM+A
	4VOhM4lRol+B2efgLYj4aHnmS05lpRbjzQZH8AHHd1LkXFqzpO/OrJqv7xf8bJm9
	DkLXXwsDkVo9xlJTdunAlTCYuCt+kN5IgFo66fsH150Wk+xA20Qm50NvfiZLdIk9
	pkhv1U3f/iN+ZTnKtwWgOSbIbC2F63bLvgHpiFD7+lsfDLMrbpeNskow1yyuZv1n
	Wv+KKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9bpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so2036962b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 03:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088646; x=1795693446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=TLL82cif6SOGxaUyXGoZAifpZwsy4mG4vAoldoH5msOjQUSZuoKIhrhtEqwaHhi1gA
         mMDidnPxkbwyF1/TA/vDMCrFxuE0dclTBeZMikNRg9kLYCpPn7K5epOtoI5yo+7pnE0F
         PASIOLF+vcNo61aC8RkQvILyEybQsYwr1myQTukOBIdedKJoxNg0EydcZJyRq80EfI2Y
         YY64vBCLfoaWnHMcJzPbEBw19ZcQ0l036Xf6KcnTTeOssHi1k2NdZSQssGOdgOlVC47o
         lE2TAPjiT9w5msrK8DdvLb3xUA6vUWtC1SpMdUB7C9o3dibY69yT94FdzELw21wXHTdu
         NV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088646; x=1795693446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=NSbX4k7YasPUSyFJy9ynvsDtO7yG3CzAQCIcvVSiz9HEd13xZwagZbI8VrkGOYrJMg
         rEa+iyASEFxFoBNPO8VJZtNpv1EdAH/0xgeaaMasIBy2XdD9xatvy3DJ/i/1esCbNvoN
         VPyEGemXWc6+F5nxLHXWKcKlqIBk5w55xF3DQGMOzgEuyBXOnSDWYHDnniCgmrnALMvl
         A2YTNVwj3a3ABfhJohBkSBTc9LDLjEUA/Xiohiffsst6iFtVcyClPv80tWsD9mymd6fd
         s+xp09TQuT2Wtbz3EOZ40TvCKXs9p+/2+vGrWf/uJ4ZLsToNOQgdNs2dRilimjfHfUPd
         OKUA==
X-Forwarded-Encrypted: i=1; AL+hErHFUA0oB1eYRbhx8k0CUXY6OLGj3Yc+xFon1ZrZf6ubAHLFfRQoXmkyqrMXGNW0GW34jnCC4tr0FZd/AKR/F+JY@vger.kernel.org
X-Gm-Message-State: APuU4Z+uLVDzkayU09ScwQEBas6ZR4sCxSEY+I2oMolaUJx7HpbWf77N
	nzP2ZzA0lqGEVeuJKEpPVOVwezeyf0Kz/hU02THQbVSOaYzlyebBmZGstgiyrXo32MBLWP+m3vE
	T2yrTuBct8Fq4bzmmbdHe6T940RsJ1ZuwE75rNmS88XP51xnGNk3ZmeSKLb6TfHTH5Xjy74+g
X-Gm-Gg: AYBFou359MSYP7fO9rlCLMcwFstjPqeBHlB5grov0rQNAvcm1mbKBulXIssbVkEe81u
	XXpLC2rWeXnmOGFnyC/SEodhnLO0AkOuCcleBTDe3j9j1JgxIPmy4CZ2wjam2hkjlddu07FSLBY
	3VALvHpgj6uOtYV0MDZxVCX8B56e4qJQd1jvDml4ErY7PGBvalt/AqixL0/92nSLrOYILrGtxIh
	vaBCC1TRLA45mdSYMdR0idZrh8hKf9JWysesFrw6wQSCMEwAEp8VkFJCevhp37qLew28im/HZ9g
	mBWIdXawpwAGlQLZiPK0+7PVBX9JcEHBWsUbiHHlnh8gZnBgVn2y2m2i0MASSzYyZOyi2y8gQmt
	slCdEKz9LGbHjz7qXzRfssRQ0Qq4Kk+VAq0j+vQVYCKWj+kI5R2Nx5arhO/QpVtz9
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557839637.50.1795088646014;
        Thu, 19 Nov 2026 03:44:06 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3fe8acffe61mr6557815637.50.1795088645542;
        Thu, 19 Nov 2026 03:44:05 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:04 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:45 +0530
Subject: [PATCH v6 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261119-shikra-el2-v6-2-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=14GnXtGRy2K/813485mEdODWUgO6btuabwiyjWVGZg68p/AfpYrPmoHzijlBwUBrSg/0LYDRi
 7th0L9r9OEeCkxB2dZyIth8kKfd2HVMOCmNXcpJHGPCZmKVIyhTMmAc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: C3J8_ao72VldLQi9D2WvsqVkxO9n3N-p
X-Proofpoint-GUID: C3J8_ao72VldLQi9D2WvsqVkxO9n3N-p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX0TNhza6+ogJA
 mWzwlhMd63CgaYT+bw5UZNe+mqqSTKopEs9BsMu2fXVaVC0wkLQ+y/pFnYTolfl2oufaOhoao15
 dZIX1tAPMUN8PTB1Eomq7R3+c0v8g44=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afee106 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX0fNfRhVQ1wy1
 WqyTQVn41GweQR7oG9YkASENWeaLiiohGKzV1dYDhnFVr/tyo6Zmt6FXNxsHLvdLaIhxLmAVQrT
 Pf7Jy/WqwI0xsLRm0UhHUbhC2mw/Lcm5eTiFr6taJlQ9svpl27ZFpo+P57iwy0uJpBxT7v77Q4q
 QiA9VSXV7mc6Hi1ca8+hhJ8V3hPvyfJeLR1TqcDXhTLo3W93E41rTTji9awUDO+fInz+hG3+sfo
 54Uk25eP/37FGqkDDn4LI5yqzSm5L/TdaXlLSGESyaCzbn79TKpYOV7J/p5ePQyHDtYcv/DavQx
 E3ZY72eQwUL3jJ/+V+FixuJL4i+WSa4u9HopxD7AM1JER5cGEJP8rv3C/Ow3NwmV6US4xPCbsWq
 nyw+9B5S8fh28tXz7cCpCmn6SDsMYmZ2qceCFdynSNiypHH2/U2eDBXle3cq4DxTK30o9tRz1Gw
 NP68SbV3YNvd0M0YSUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

