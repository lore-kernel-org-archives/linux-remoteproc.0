Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6E33ADA9
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 17:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584569; cv=none; b=QocJWKO+pYgFgy/pozI6WXKCZLGhjJvEHKTVtZ6TDQqnDVL8h6LSvcCl1FabBzTFxFEaUW5s4Mm4wRBkVBIdejW0i1zyad6vs7GmoO6NsHJ8k/bD4UIaqss8WvN9C+g8PIqHVIHemApQmzFfVB+YTHNV4QomfBY1ItTK3nXZqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584569; c=relaxed/simple;
	bh=w5wYmYJ0Q4EcWsM7qxhCEMwCYB+GI1JfCsWL2CMYrtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueox+HfImZPirCStX6PM9MpegZkCpfLCMeaoiqqQzT0yAJt/BY+f7NpLcv0fI1cayW6yD2uF5TdlXERVxWtTMi71l8/0hPjmVrklBlFhUWw64GyxPHmRrP0uf1zMv4l0kBoufHi2Cr203vZHIei/mCI76bb+ZFYrkzDJ92mIpP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cilUP49i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhYW2a5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cilUP49i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhYW2a5A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDWYO31300907
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 17:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5Z
	iocRuErw=; b=cilUP49ixDv+tPMVcQ1cL2pJqlIuiPMvJl1GmcSUZ89HzuIBjm9
	Won7lB+tupT57JUEFkrqi+33q6tY9IxvaI7exFtJz1+62T/s1O3aQ2Zcedmy6cUx
	pri4ryWJtEJSNzdufu/ll9BGQf+61+geviftn7InS6L1URSvoRsVLlGGVHTug3O5
	w1AbXTh1Ud+NpHhHgFo4CGHTRG6wQyu+5m3siOyNgCrWLgc6aw7dGhER6hXQl8Yw
	Lmfwh+xEHOVWxXe7TfIo0U7TLapOxS4S/FGAW4X9oKUUhoY1PO+S2JTI3LSkUIZu
	tPjWurf2+R8/2IzDK8ik/J1gr9gWi5LKchQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqp9x8qwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 17:29:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so593084085a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768584566; x=1769189366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5ZiocRuErw=;
        b=KhYW2a5AVXoRnHyahapPgOFnAZqYv9dSx7NaFJy9SqRY1GjkoZ/dG6mEA0cXSCT73L
         baPn58yx2s43JOAIrdz4BnhKqARe8202m2GKer15VLoI9sOqtx9Dsl/rjr1JrNhEZlbt
         gCTGH3m8UFirxF5gGUyQJtqtIYo5bz5DXnZKUQNNtB0ldKZt/Xt77qSr7Mw0iFjDJUif
         Nj5Zuji3YfS2uTAUj5bX11qkkuQgQqyQMUiYuY3eEyiPPeCmMAPyaZSanK92GQH+heKP
         kYesJYXjp5pB0ktAvEs7WkePY8BamE7E8XE7muBEaCKeB5aJFu84WQy/EU2HdXDXgT19
         e8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584566; x=1769189366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RienFMECRu2vQ3cFASNeEvCpTFY7hGKAL5ZiocRuErw=;
        b=BCCsnMyXSqncFXiheHM0tkvz+Gmgyrn0zW7DTcVcv24fIhun5B86ZC7J3qyYiQFo/V
         pBfGdxGHfFkEefU7tVXDbCopVCvU7QZ+cMvKW0OfFMld0plS1+bzogC388jBFOb+GbCm
         LJ4yl8roxpsBBg9Xw3KBTqTWLwoLwiyGHRnTdtQb5C6XF28HfR/DWX48Q81zeeqd2b8B
         MGLU1WUm2Guw7kaGghoyU662w9AWgwo+h4aFMppJLxWNtp7XcB235hfOLa1YzpcbCtn+
         idz7sJ76QwZaEeDp34dOO/oCEYUtBWZ/mMxGmsoOMCFjxTw1oJka3hSj9ZecsloNGyAw
         EdMw==
X-Forwarded-Encrypted: i=1; AJvYcCV+C1lJOlwCMpns1h0HeLpQ086vNtblQZ7Z1jAyICBswqO/z2v6BRpyuXhkVRsIaU5KFL4l7tJzLR559xCiqbAE@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWMDJRFehaKHYT3gh+1xZX2seHyfpXqubsWv8IQCSNaCworaZ
	EWI19e0YB9sQ2sO/Hb+o97lF4aIe11m5bLjwsRhR519d7z53Mu5JCb2reBG/VdNLYHovmVl4TLs
	XNc/k13MujTpru9dwdOD7rov6+Xe1mwRaFXQ4cjgmrjFVPkI6tINuC5uJGnH6f7fWEZtw8mZf
X-Gm-Gg: AY/fxX7kGcFeS7k6spC7z0O7q0f+RtV7wzmlK3CgVx3JMgowdwmHrQldelgZbjWBQR2
	rPB/U6oLEWUkAjGH5QhZyOAQcSWjEoOfKCB0rPk+y5gfpjY7vPTln1h/6kJOjPeNlliQmXFip13
	Kh6LJRyP9/GaNNXyqIv8pZYTLNrKooPxUiodtu6zelAUpAjke7T2Y0tGIwGIekDSDMSoFDDQEVp
	AgjC7j//v0q48dxh2hY+77732SjmZLp/7ufjhwjFJWfZWNamBMBcYizI4ueODXxc58nEZm8wNZw
	e2IxVsH5QBsaqRKbx6KhUu6fAaiGJn25/U9AnBT1R3lkOCNp9hD80N7Pli+ttiIAZ+laTkK2G8P
	wDmQnncY3k1vChcG9iYLx9BWR2A==
X-Received: by 2002:a05:620a:461f:b0:8bb:78dd:1df with SMTP id af79cd13be357-8c6a67c30d7mr517344685a.76.1768584566228;
        Fri, 16 Jan 2026 09:29:26 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:8bb:78dd:1df with SMTP id af79cd13be357-8c6a67c30d7mr517341685a.76.1768584565814;
        Fri, 16 Jan 2026 09:29:25 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm52916095e9.6.2026.01.16.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:29:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in maintainers
Date: Fri, 16 Jan 2026 18:29:16 +0100
Message-ID: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w5wYmYJ0Q4EcWsM7qxhCEMwCYB+GI1JfCsWL2CMYrtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpanVr7vSCa78OJVltP3F1F8lnT/0QOtvNVJH6A
 WdgmAkrbZuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWp1awAKCRDBN2bmhouD
 16EED/9Bt3RCNfZFEV/xizSMt9bKxX+UDTt78BnE/An3TSm7nTS7v35PifUWDhS/k2HgrHRGumo
 u8ECFg1GN8Z9hKsm+3v3MN4IH3jQQL9Bahtj1tOOXN4qnRVE9rGXnBCX8/HRJUxeYsLu9NmkuzX
 PjVPED2R/ZTs2CsPEiLYXGdyMneDZH5tu8KMysCxLPaSLcNFuzzbm0rpEZu5J0X6aWfpebuBhWa
 rF0CA1SbDW/jLt6X4kVfhzSdbsWKAefcrjroQ95gqYGuO/8eZNhFhSr8Xmk1OG7tQlnp/12VLdF
 PNXXbtrvlnKMdH+zAQGeatY9r4qwiMY5TpsKlvLt0XF4wue4ImVqMNFhVr0rVrBMtfiy2EKWYne
 6bd0ekQ2uIVrqKaU9VtdpSogakNxpoFgLog886FAOuUCTuw4NXtT3nkqdv3YQPhsrUckMksJtz7
 jcPvxzie+JPuOIQWKTcZZblw9ia7frXnOQ/QEHhhtGkfQCt4jRkp+QoQQIWjB9hznN5gpWEDWDO
 rJYYsObfoLOkxHEDvuZJo7krFzXSpGishb6HxU+5o1PXq604+qUTAYQcDlNKgC0707KkTUq69Mw
 pLJTLhyPFBVO1SO1WxYSDDuJ6j0P4i/5TSwiDlGBUNTCOarF9y5FiTOeWiywHFHzzgmhI/dqTtm asdA2zlU1VrINYA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TLHOeesoUBhAtQjfwZKjVqsYzUbv4cmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyNyBTYWx0ZWRfX2qPc2IAAN88W
 SeOXDYHK9M2RCwrcLx/xHW6R1hhxvyOgPAfWc2uiu3iccR0sEp26/QDD1PBYGE9p4SO0NZNwl33
 bVhFI4lOCVvhd7sLXiQcuFtl33XZR3tIC+IHv9+cBmoeaXzjnWFPb7FYXNIXcnL3Ue1EWg+ESuk
 FQk5G4WSREPOaNHHegwSXPPc9Ra6RxB6k3eGc4XG0Ish9Xbgd4cU+ipkXUuJIoyG7UH+8gIeQTv
 wWlMlqBMkDtxHQbcmURAVUNrpmRzHt6AZWq6rHrdlnRhSNzPW0QZqOa4/snnKzJWh/dsA3m1q95
 X5jh7VgilPfVMqFlz+MVhV1wYvRKv4Er2LNAHA2svpZO2TGiDRNCMjIUeajUR8bMQyV7ZaUj73c
 8y3FgwTweGSl3Lnk4mcWdkNW54ii8WjuILm+5z+6pL4DCykX6i6hvgDjxtsTM5KQIF2ThDRh5t9
 TqauClHEiKcoys0THJA==
X-Proofpoint-ORIG-GUID: TLHOeesoUBhAtQjfwZKjVqsYzUbv4cmX
X-Authority-Analysis: v=2.4 cv=bYpmkePB c=1 sm=1 tr=0 ts=696a7577 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=lNgBRxWjdUaVFYStBmQA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160127

Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
maintainer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
index 88575da1e6d5..508b8c2f13a2 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek mt8186 DSP core
 
 maintainers:
-  - Tinghan Shen <tinghan.shen@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 description: |
   MediaTek mt8186 SoC contains a DSP core used for
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..bdbb12118da4 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek SCP
 
 maintainers:
-  - Tinghan Shen <tinghan.shen@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 description:
   This binding provides support for ARM Cortex M4 Co-processor found on some
-- 
2.51.0

