Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8128136E
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842939; cv=none; b=L6zHliODschadrR4WRzirSH3SJZ/J9fSM702YzYdb69X8uGUEwf9VBLvIJdpBvtUzOHwJez18o+eRUXB3R4YTm/y7ky6L1BBVFpljc6iVHfcYamIYJEFx4jP2ueOHiDpn1+rXa4ETomZjxlqslEjOtAC7baviN/FeK9rpuIuUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842939; c=relaxed/simple;
	bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=asDQ4XRmI0KSso1MXM16qw5rSZaD9cdrDOM2iGeL/YI3e7c2pkx0eYwsg8UjhvUtuDMiT4hW4tDslMXjptUXB8gE3/4RcDiKHBn9vPxElpQCa2AUrOSzqZj6kYMFeUSmn2P0pojmrR/K/QlGyuapo/OHgczEpUMUUY5jLsWJpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PCzeICXX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PCzeICXX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade58ef47c0so145199266b.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842936; x=1751447736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=PCzeICXX4Gs/5BHvtz853AISO9hYli06DkGKHq2QqKOv61QpTVnwShME/2lGgyvh8k
         8DBl7nJKzSY+DiwZbtfpnqCuF8+vmJUYoc+Tk68UKFoZXBIDJD0TA7jQCP3j+cTJ0iIX
         0PnI1NDo/C+Lzmnm6IpHOZk/pusqYOZ8PJs400CZuTRjHgT337BHlETLINv7AY803XuV
         lG5PYfILPGVcgwZv8rScdT86MR3+ah8YDbiKr+Szz8u9Urx9891Q1HJ0Jwye35rXZkuU
         m21AuF16AnIsCLeVF4X0lbsCr2dA4wraca0hemwkUPzETyRqY0oQNHtWt0dVTXzQufhu
         7s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842936; x=1751447736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=w7ONCeqfQpkfsi29ox9DyOO6O0y2JgaQoVe4Mgf2I72e8Tp45SKi82+ICm39PQYB3R
         3a22+7e/rfjrwMMGN58jZVQ08lInJlEZE1ItVeA9+Sm+lv0tIBbzFGC+ckV1eizKkv+G
         J00WoCg5MsDvkKVaIiHItNW5dgdaxWiiF5XF1GKHCW+SuTF5mxWQgkpk+DJJxGJyZXWG
         YEkcV4xrbbvc+Gk1+RJh9FTr5v3DfbfEY6VIvq4gHz9ZYgwOrD0R1xFCPcwDJutPHEAd
         wpZk/7YxdiQWh9Ukn0GiZTOeJmqDltccdE4i7VSu5xn8k5cjwvp4BkTbbu1UjLZKlKxH
         SHOw==
X-Forwarded-Encrypted: i=1; AJvYcCV6r7qjaek8E6sx9lpoJ2U5IOf6rsFAT5i5BXjxtaiTeAkmQV8hoexjyVJ691XOHpW6jj/us5zIWgpybl3iNtEl@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZb+DlcsFcTB1JHkKYSqPr3VuMODUv5VcStqmaJcTSHfqs5F+
	2tfQPJW3uKRqyedoV+2R2JUar/J+tmjinzFZSiy/0SEXVWJNtmke9EDpc1+p7fYozxI=
X-Gm-Gg: ASbGncsnLh2L42nJf4pT5m2qh9xMbB2vYK/8gMmBE/LUTg+FFzWtGbaNsJ2CiYdNFLj
	NhLby4AqAKir2kxtMlnLEmacc2ur8kcZ8B0l5J0/OV4d8jjiUbbCiMvLL6U8mGFOpLY+zAxY9xz
	fP4Okm9IxWhWnbGa05QvmQXoJyXTXTgnFdT3Q6fbcObjMTD7x66P/4X/qTmtBB5V/121dKWFxbz
	qi9NQ3s5H3rBGn174f14l3eeEmawL5KOA/BsCl70QAP4T8OS7AbBwj3KzThv7hkpDBq/d+o5agf
	nyadh4Da4tBwhQMltIb6uHkUlSCbux6IbG4IPWJLHDFs7mBq+zhcxoRgmXXId/SyF6DcXT2ripu
	A/1aDya2UuahtWCOL/zD5dZjYD8zJnS1qhEJzEN12CxM=
X-Google-Smtp-Source: AGHT+IF9u++G4l0yqsJLtsvs+w8gPMs4RjEP+Iv/tXabdEWFnaRqckW+YPQ4QXJZhjqWJkxHUjBkjg==
X-Received: by 2002:a17:907:6d1f:b0:ae0:7dbf:6e19 with SMTP id a640c23a62f3a-ae0c0622b58mr174950066b.1.1750842935810;
        Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:25 +0200
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 SM7635 ADSP & CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-2-730d6b5171ee@fairphone.com>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=2202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
 b=xibYVZUWgwzKFSJe7A8AxltVP+8sJT1sYP1WmkuirM6sT1wSbkM5vTqbfSkopSM2X0o/hXZ6h
 SqItXDUK2LqCH2r60UbaTUmdvE74DOCCLEBSTypGeO3h+Yffy2uVxNY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ADSP & CDSP remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf48217a0799ab4e4318026d8b93c3c995..44cc329be5067ab6cbaa0a467669cb3f55c7e714 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sdx75-mpss-pas
+          - qcom,sm7635-adsp-pas
+          - qcom,sm7635-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -165,6 +167,24 @@ allOf:
           minItems: 5
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-adsp-pas
+            - qcom,sm7635-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          minItems: 6
+          maxItems: 6
+        memory-region:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -185,6 +205,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7635-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas
@@ -239,6 +260,22 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.50.0

