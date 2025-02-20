Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074451D6DC8
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Feb 2025 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066099; cv=none; b=jCZ/xxDIsDnAjx47ArW+XWUQmtLUutgd1fQYpJDiW/0dULEsCWUN6g0TxsL1CvGn7WYHmk5bvSzYk+0MV8poqE65u3S/UDIEh1vXWyGicgJp0t35pwetCHJ2wNVGTZkdBs2Osodv+IsskyLw/M3bPmnD039bnoj2Uj0XDdzPSDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066099; c=relaxed/simple;
	bh=g7tyuwR9gUJihZXDPyoe71VF4DyU1ICECDXXEFnbpOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CW6Oifja87t/37TWETZrjKoCsVsjFDJo/ZoeTXZEr4dB05LL2tRzak7DGlN2mc5pyko3lHQTHaCDZFKX2UyYqWazop0jyS7Bmc9h81MBzD/NSps/xfisSbZIFWSrtHG0LhdjNrgQgMcoRjZXu09W9p9vx8a5PIeOWRY75CiOnPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2cUMLWd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2cUMLWd"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dfb26020dbso161596a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Feb 2025 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066096; x=1740670896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEYeQ6GtRcKGrYsaEJZjfB2MCXvU3nNrB1n4nbL63sM=;
        b=g2cUMLWd4Y3PGRoCatNDfFZ4c0o9WNW5466k1P5MSqA5mvgrRPktrGEwAWc8lVQRrp
         Szk2TI2hRwPp5xGs4c6U3DXJU7Goh7SVUUz+PoxKa3eMbc1KB9H4vKXj94aVHBIXMAP/
         GftQ4Let+em4FB/C70VTNrGwfj3Yv8intocmthWrPhvtO6IwOpSWAqk06UdzOc2r3nqJ
         xUuaRZNjJDwi1+cevDubw0tSTC+6pOI8IyHMfxVWtlR8NRgjVTfjRigGMcd4i6WxVCzE
         7SexP5aFcPqZspPfhAwv4i3QPp4fxK6JhE2ap5F3ZSApP6IlvPXHeOrN5PGxGoKPejov
         +8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066096; x=1740670896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEYeQ6GtRcKGrYsaEJZjfB2MCXvU3nNrB1n4nbL63sM=;
        b=CiBDgQYGKyDEngP5Jr5XDs78t1jC1z53Q3e4zHKzzf0FKjLC8q5doXGzms65kgogOn
         M91WvUK+FOTm9Gm56jiRYZgY1gjC/7kWz7Qeu7uYmAB5XpW3y0dFr5x2Dl+SIedi2MQm
         oFdxCT7miPH/fItg3DBXFLvHa8eicLEwUpjRUe6prI5kF1JJhvGFcaIbVQaSBUqKUarf
         fSz2RtBrUMbCEFiG+TLvzCSPyCqNV0X9yatUgtC0qyYQ7/Qf1EF86ERMs78AAciW0X+V
         Rle8LAxT+G0zmI3PYmgqQ/HYeZOmCw6JmUf6EcN+N0qlIEa9OVq+k3BXkpAE05LpT9dp
         Raqw==
X-Forwarded-Encrypted: i=1; AJvYcCWa6EPSb4Ip+q73ufBLuTh2CKlnDG95+VPxx1240eCd93+j9yajS6CeaQaCg4R0i3Xpg5jBk0t8yRSIqRrfXWAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2S1Z1VYIJl0s7IGvWyMAiRq9+bzNddKGb8vFzYgNMp3lngnsN
	3wGqpuE/FzFhV5lbxnZnojH50DNAth6h2jn2xLdS2ij+Az9Yd0ACZ9GsFfRUnhc=
X-Gm-Gg: ASbGncvo+g/Ak45dA2FMaVx4liv2ROV7j+eFLu278H0CJ3BhagDHhX98vzSZnlRIpnA
	aUlBuPimyCL03mkIC/aXjkNJIncNAYc3ubh7kQKCmaphIsm9iFQRBGPZIGJeBvDa+q51J8SkPxJ
	wD6CV4r5e/2epKilme87O+Z3/P2LJ8r4jPeIgDX/nQZQ/OyLys6hxm2pYFcULyfsVMgn3jVdk46
	QwbtSJ4T3MrX7Hx+z771DkaF4o+xixgu6l6odKcCJRzZe40AcgVtKPUAI2VNZ6FXV8S1HxRqJGl
	8+mWX8awQ7y1YzUrTmjD1btPuMuzikEIyVtBlb8UWoz+d9Mq7EZ94bbnDtB1zBV5
X-Google-Smtp-Source: AGHT+IExwKWWZGa3QQuOIsvL9AuraePZZp67jekYfmLrqefoxYMI+vPNlwgRQmppVbQJY0ggaquYhQ==
X-Received: by 2002:a05:6402:5246:b0:5d0:d183:cc11 with SMTP id 4fb4d7f45d1cf-5e035ff8110mr7633794a12.2.1740066096180;
        Thu, 20 Feb 2025 07:41:36 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287c7fsm12097608a12.70.2025.02.20.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:41:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND PATCH 1/2] dt-bindings: remoteproc: Add SM8750 MPSS and CDSP
Date: Thu, 20 Feb 2025 16:41:31 +0100
Message-ID: <20250220154132.199358-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loaders for SM8750 MPSS (modem) and CDSP
processors.  Both are compatible with earlier SM8650 with minor
differences:
1. SM8750 CDSP has one more sixth shutdown interrupt.
2. SM8750 MPSS lacks fifth memory region for Qlink Logging, according to
   downstream sources.  There might be other differences, because the
   modem currently crashes after starting.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resend after some time.
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 46 +++++++++++++++++--
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a24cbb61bda7..2dd479cf4821 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -24,11 +24,15 @@ properties:
           - qcom,sm8650-adsp-pas
           - qcom,sm8650-cdsp-pas
           - qcom,sm8650-mpss-pas
+          - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
           - const: qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
+      - items:
+          - const: qcom,sm8750-cdsp-pas
+          - const: qcom,sm8650-cdsp-pas
 
   reg:
     maxItems: 1
@@ -114,6 +118,23 @@ allOf:
         memory-region:
           minItems: 3
           maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          minItems: 3
+          maxItems: 3
+
   - if:
       properties:
         compatible:
@@ -144,6 +165,21 @@ allOf:
           minItems: 5
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8750-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          minItems: 4
+          maxItems: 4
+
   - if:
       properties:
         compatible:
@@ -171,6 +207,7 @@ allOf:
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
+            - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
@@ -184,10 +221,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-cdsp-pas
-            - qcom,sm8650-cdsp-pas
-            - qcom,x1e80100-cdsp-pas
+          contains:
+            enum:
+              - qcom,sm8550-cdsp-pas
+              - qcom,sm8650-cdsp-pas
+              - qcom,x1e80100-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.43.0

