Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016262;
	b=v5hSmeIe43q0trlv7zlAfxIoCCZct5vrmV1p5wOGz2URCkCBe64aPOkqf5/vV4AJO+0x
	 kGmnIbEiLOC9fMbzL+wcHGvUzJP0Fu0X1lVqK/REFXumjJs9qcPMT86eR1HSEO3C881AZ
	 k8DROCrCAuv2tLh9bBqzN5A5EBNK/Bydtdv0ju1snxgr2OE87l4ZumTOvE1/VSbRS+/yI
	 w7h41lEUaJAMK0JHfoglrs1G2jUcDq22l8AJhzSUeIElxGBQNHiYxjwt7TbXMfLBhUr1c
	 r3dkxGS2IPfFFu0FUmE0suJR1JHSbLVam5RQFOE0JEWwpb89DybCSxpg3wPCSyMdPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
	b=vjdPAe3GXBDR6LdkiVbXMgQpUBFBz2kSFSVT95ADW/KIRg0XMRN1P+ytlmEWvjwZoj9J
	 xOLEp5eJ6eb4GFY4Lf8e3auGjZBnXgcCG/MZlzHoKF5894uaqV91tWSoGsMzN8PXiKqEw
	 DP7KrNzrdf7WgdZegoIcQjZY0lhGGdsFaLOn3PobDG7z6BPa0461dbZ0cFvc/YqE41bOG
	 tQC21eBSsgDsLPI1CWK5k9+pKq0JiyvwHbzCD8CoLFcr3m8c+gkpPHf/5Fy3nD/D+i+8W
	 q/EOgn+B1d1DRbePMCw5ySoY3CtkBE4YkLmEMZu0xuHchPmdQ/usds5xFKxnA+lDHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6181B60A262C
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6181B60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIFb09E3186975
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=; b=KfRL8sS5IZ+OjOs4
	TZHe0MV8TxPr68/KxQ9Fx8zNCRxxKK8GKf2DgLnpNWOK52KAYJAU6acCkOzxtA9E
	BrsKDIECMvChbaV4hAc8QTeqwrtOKIJMqEqLYoLfCOOfOTqe6uBQgTIkO8FjjPTC
	+/aheGUe5sOwpkdpCb4fgjI6yDQyeTwHhKSW4Z2g3iLTg1jH9pGjEQZJDYtEhxvc
	Tl4kKusuMc5hFOfn4g4M9Vcr/nNYBmsrIB6RHqDRKwri9HEK40cL8Evz6ihDhmpQ
	niFGfVIQsckzEjpUpgfIJwY3aQ5Nl1bxvLS+JmRLjxWw+VNdtnAcxkBpRwGTmOOA
	SrQ1vQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnr048-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dcefso9189126d6.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016261; x=1795621061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=aZlTd3q4poE2nf8TykIMnneScvQI9RRgwB1UUbg0IfHSEkAYwkfJFUQ63M2hzyuivm
         YkGwrpcevRF2vwJOuss74OVjtdhIrficlFGuYJ0r6mP9DM3WQO8SpiLbZTFR3+vJUtQv
         JJX2quXQIc2eCZjyHA9lkkE+WrnN9OG1AR1k0/XhKZj++/Kn2kcj5yB4lyb5+pWDOPnx
         rlZXx+TXVuYD/c+fJ2neSOCWGGxEpNo/ugsQPWgi2JnNuUfmNCOx4KRD3wJQBjShMy84
         gXBKJ6ITMAw0ahb3mOZ8ynwJMR7B8EGXW9YMDnsoX45lOoepS7EZVewKFjcFNybLtIFp
         WUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016261; x=1795621061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=dSL0uZuZsQ0s/NIa/u/k9WoUDcAxfsIR/wS5/uk8G54uf0Ag/r+Dnn4DqgHPdUIc0F
         U2OmeJ5uHzNiTA3LV0Lyqw20bQd0wKuTZi8mwQYxwqVwTnOh6b00daK5Oo/Jv51c6gAJ
         TXrRUZRbnUs2H5D0tx10U0TZDYr888egTBLaEsrbtyWKZardoNkTgNDf0wr2E5Uhj3aL
         M1Yy4WoUS9aKcjP2l1i33t++Af6XBQirA7ifBIVRG806do/T11t3thGDQfxybamegout
         bic/0AKEzTY57mcfMDDtO8/y21A7xce4PTMGkGazTLovjm5FMiJ44QDSrQ7TF72u6oVx
         ZIeQ==
X-Forwarded-Encrypted: i=1; AL+hErF+VZIpVxn/ulorw+9iOrAN6wkMhtp421KWYM5Spvu+7DI21E8rEI+02jCpBO8YuQme9XAOx4+loJnJ5cjaVGHr@vger.kernel.org
X-Gm-Message-State: APuU4Z/CO86mRUUDjsJrBrtDZOUKrO6dg87jP0tWk2RW+SuKA0hsZ8ve
	Om5GsgLp34/6A5hQ9k+q2jO1YyHX/Im0v/UeqiAnGO9ilIYyogeWI8ZD/eZxTaXFWvdZ2hatZIy
	2Hb4F0KAS8g1ab5ALyzlm9CumfZo1PvBitxoA4hoaJX6rY1fl3KQNwBQS3c/CST3Fme/JHHsq
X-Gm-Gg: AZFdTZd4DV7Rpe1DqP10kD+rFH9tXb+LSoVoBtnmW4fzuFOqSsCvTwwbr0O0sojjxWr
	ctgAESUMGtqE5fh/yA6zY3NrLApw30KYe23r+Tx43mu89j+k+RdSzI+LlUzgVK/IScdNllGjFrC
	2HPcHQtmWyiDrkJvY++mqRBW5mo+TcY+KCO3mFVAl8k6ZYnGCyFB6UxcMLBAjxSmRXZhLsKngWI
	68pgZg1e9IMf68dxQm28w/A6qV4bcZxhQBAbu6jkV6vN4RKVQX0RHa37+4VV37TPKo9TPvfVFfI
	wHJ3I8sFQmTaonGOlMw7jQWK8g/oPax35lWfoo0U9aD/rxr6t7t/JI7qjw1idWy1dJVFb9pwfQC
	tW4PpswsA1+4ZncnCwWrxpx6OeaI2f7zO/elx4EuauBNz9Drws7Mr34gVVKuPh9rLkgiXw7dqSZ
	43rh+yUdsPzXl995DJc8wlPpb1+VXJiYb0IEy6c2izySZ/rQHqETwLqAOGpUdA
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46836076d6.33.1795016260354;
        Wed, 18 Nov 2026 07:37:40 -0800 (PST)
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46835356d6.33.1795016259652;
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:42 +0530
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
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
Message-Id: <20261118-oob-support-glymur-v3-1-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=5948;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=cZMcIPHFZ84uL85xAk/uCt5uCJGvCEH/OmSxr9GzoNU=;
 b=rpUnAsQDGdDWgUfoQhaEw7chvjRaMPTlVNVQZe/K3/j1O7XhBeN3ijwnKIwc34Vkq76uoL9uc
 ru7JEgomn4qCTX/OT8Rb8eauV4/HF/Sb2cD7KTH2P03viI1STVApc9Z
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afdc645 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: YiaZIHzr0IzQAii32LK78L-apSHZRIZ7
X-Proofpoint-ORIG-GUID: YiaZIHzr0IzQAii32LK78L-apSHZRIZ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXwG4chBc1IoeE
 +o+Ex12yco90ByG4pBH3zFlN5FpxX4VdCnKcegz/CMcRuiKt9fSpg7sqZPLALLIuxZZPfF74YP+
 YJ7Xzdo7r8q2Arf1cI7a0VkLwwtx/gM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXzfRjpXSA3Rh+
 jSaP9uUBKUuPNBOQPKgvoHoW1k2UC62DZM1MHhW78xYEhLjP/Jw2ZTaFuFDiY2UVOFgKi7w8l/1
 R0Is/ijgP4Eo5QO0Gu9wGJ6yZ4dYLKq0rOfAEI9LhImykPaxXL32urkMec+UsIxiVpWpSG9GoNr
 V4I7/2h7k6AuSr/WfXCd7CClRLmdTpUxy/l2g1TTaNz+S24Cj635eEFd3bzrOoKJwAWK2Zfz5QU
 EASvmyqqHVP37rzfJOW2taB3RiFbk7jFHTKhFst35PkpRMNyGkhumJwvxuUujszUimsjXZYCnq/
 X+1l+1zcZ7q5cEbzJOjfhetBuRqyNkgaPMz8X0fznfHMV/juebMtjk2BXpSrvnKpe/hKgWJVu0+
 HBDUSqOqJ5rMymgWWLTyaqwzul12QfZzJ5bsttx7B1EWDVUHSHgCboArZxlcI06YucdnlRUKynd
 Me1gxVVqyTX1UzppdmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

