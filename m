Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485B1CC166
	for <linux-remoteproc@vger.kernel.org>; Fri,  1 Nov 2024 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480599; cv=none; b=Phw/+iRm2dagj8WoganXB6FyDryncbmGUlp31ySxsyMbJCCBumSW31E6HhyECArBVS2VYMiXcMuG5YkcFW2DkCs5Y7SKPHRHMDPPnhaAuCN4SNDHEyCLt3smUI2IVm7Kkhvevug2agRPrhBgBjZ/vR6d9qSkYtqOHxfPXVEIPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480599; c=relaxed/simple;
	bh=hMCCbLDioYy+Gyryrg/qDlm9Q8ImU8TUBBfa89jXyLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbFO6o2u5LaUFX9WitjlSXzjZKASUB2YRXX8mNGw20rUAps1IWnA0a6Wq5smu2fR/rQb7bFiY2uT2zZ0GB/KhjrPun0vb3nsfnTQAR0XcpenE2zzPaV0JgNrTsHVbcvSKte9y2YJ0TRv1P+x/AInePqJ5+PJAB2Ux4XHtc21hMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hS5vwtwe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS5vwtwe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4ee8d15aso188364f8f.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Nov 2024 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730480592; x=1731085392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3NYpsGTgrceer71ppOAoBgRk89YYUeZ50Pg0gfV+Bk=;
        b=hS5vwtwemZXn2RA1q8n+A5yKbG/9BhXrrWJEZEY7lizErSQ1SQTyMWi4mK86yF3Vhw
         6um7XUf/CPCMX6LEOwSp6UKSNMETv2BtkUbJSmFipA5dLW7MNrsrltsPuEko+thPzTAD
         g7kwrE3CuFrz/uEVHcoHvGJlmksXMUfxex47G9OGFPTVWPHjSC60qKx0h4KjO7YfQ9U9
         M+X4sfedy9Vd3+hklxLII6mcRUQKdcZBy2zTZgSTm1ZwOSoC1QphMpIxclFmm0dghh0b
         Gfi4igFFRE46twprPHiXRH0TySIyQY0RjAiNVUT7YbRuU62q6IO9F8QHgFgvzlXQpt5h
         bKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480592; x=1731085392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3NYpsGTgrceer71ppOAoBgRk89YYUeZ50Pg0gfV+Bk=;
        b=X7oOfkokkRUymDT/NnAjZdr+LquyfVQoxXPlbckW7LSB/lXng9F0hcayfuffyte8uV
         ACQ9sB5h2E3NnILlQ58COsIwBWdORVfEGK4fAt5u5ySvlEKSQ6KiJQHne/KNJ/gxPbaC
         ryOMON4ijNOCJiHVaQrdOmNl+2cxTwgKl6FMYe4IGzoeW+7QwORdlijIRD1mIayKoCS+
         VzR6+bgDGO6ewdCIxg1IcQI6QKcG0Y1BQBFIXaCPGivZiBzwV8OcgY7q/gA9U9pcUjPH
         3azhQskGWpYykd7I4Ek4ytYNcz9Xc8UM5Ckp8RPozR22V1sz5iptQVMEfjGGeUaZPW8j
         PYmg==
X-Forwarded-Encrypted: i=1; AJvYcCWR9gFKWzJluoIgn1QdmFVisaAmmIPokiS+ntvz5xl6M69dtGqft44whV2Rk4Mn6DbknGWRgySL2F+VHBVC3DeE@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9eJt7adKF+ZxtQ+gMQYIpv2Ws1xrKedkC1tpCrGFFHCrk9SL
	hOuv+/FkaI5FSrBlvty65HCnF6wISK8Q9u0LcJOTvYeFha/XkOcYeF1kwwWUfD8=
X-Google-Smtp-Source: AGHT+IFCZ23WEBwwcLfQP4WYBJ1WQPAvLjnNpkz+Y58FV/YsX35Y9/WCJ4gXDC+pJP7nEDi262mLrg==
X-Received: by 2002:a5d:5f46:0:b0:37d:4aa2:5cfe with SMTP id ffacd0b85a97d-38061173287mr8248808f8f.6.1730480592542;
        Fri, 01 Nov 2024 10:03:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ae82sm5687923f8f.93.2024.11.01.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:03:11 -0700 (PDT)
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
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add SM8750 ADSP
Date: Fri,  1 Nov 2024 18:03:09 +0100
Message-ID: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document compatible for Qualcomm SM8750 SoC ADSP PAS which looks fully
compatible with SM8550 variant.  The only difference from bindings point
of view is one more interrupt ("shutdown-ack").  Marking devices as
compatible, using SM8550 ADSP PAS fallback, requires changing some of
the conditionals in "if:then:" to "contains".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 48 +++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index d7fad7b3c2c6..a24cbb61bda7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -15,16 +15,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sdx75-mpss-pas
-      - qcom,sm8550-adsp-pas
-      - qcom,sm8550-cdsp-pas
-      - qcom,sm8550-mpss-pas
-      - qcom,sm8650-adsp-pas
-      - qcom,sm8650-cdsp-pas
-      - qcom,sm8650-mpss-pas
-      - qcom,x1e80100-adsp-pas
-      - qcom,x1e80100-cdsp-pas
+    oneOf:
+      - enum:
+          - qcom,sdx75-mpss-pas
+          - qcom,sm8550-adsp-pas
+          - qcom,sm8550-cdsp-pas
+          - qcom,sm8550-mpss-pas
+          - qcom,sm8650-adsp-pas
+          - qcom,sm8650-cdsp-pas
+          - qcom,sm8650-mpss-pas
+          - qcom,x1e80100-adsp-pas
+          - qcom,x1e80100-cdsp-pas
+      - items:
+          - const: qcom,sm8750-adsp-pas
+          - const: qcom,sm8550-adsp-pas
 
   reg:
     maxItems: 1
@@ -82,6 +86,20 @@ allOf:
           maxItems: 5
         memory-region:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-adsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          maxItems: 2
   - if:
       properties:
         compatible:
@@ -129,10 +147,12 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-adsp-pas
-            - qcom,sm8650-adsp-pas
-            - qcom,x1e80100-adsp-pas
+          contains:
+            enum:
+              - qcom,sm8550-adsp-pas
+              - qcom,sm8650-adsp-pas
+              - qcom,sm8750-adsp-pas
+              - qcom,x1e80100-adsp-pas
     then:
       properties:
         power-domains:
-- 
2.43.0

