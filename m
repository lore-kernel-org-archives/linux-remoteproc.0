Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937B1F1518
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153644; cv=none; b=tFpKBinos2SLpTAyMOHk12kQ1Za/B+W4EGH+vFRLjSFBQvqdLBA89rTTI3E2y/PdlEsDcrTuMqdNZf9w6gOXIKMx9JBEXZ6K+Bva060XcgUzHJwuytQmlcbOCX3fdV+HhAGjvbGuJDbfCYzDZZHCU94Y04c1Ecyrfi4jvPNtl7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153644; c=relaxed/simple;
	bh=Q9/weWMqsRUAJgN7rFGcM/rDMNKtQZwTpoVO7ftqEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKvCOmGprw1S4VyniY0JkXxMqnV6Ye4O/XZc7s28mflS6pbqpC1MFa1rWt2mtdVkMcIkus/sYp3VJgBD2ajb/iqBcdw/Fi1bSx50DOgpj0x3W3Zj8rzd28lOBTEla++azaDxk67zgCtk6s7RcxpFQCuHDUY9mPpufJqUoj1mUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOiSueHh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOiSueHh"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so40597066b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153640; x=1740758440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97064Lo4S+yLBMHfAaUS5/jSMM3joMD+alo0JyNN3fU=;
        b=xOiSueHhy8QF7hfHeYYoZQdtdv3OW1EfLtPRwYADfKK9JsViiO55gdIFwrbE87H61l
         Ly4vNSNKrvmzgubU7rU0DYhc/jqKWu56GHAjpd258AMDuFVU6Jd14lJvGQ9JlbbbK0sf
         kp6f/IV+oMCBVGvL9ywKRh5ZV5MLbf7qWgyIpEPb0ZGlbtpieuXgeLZb8RBoN8zz7bL+
         kCFAZ5lawUoy81GNK1+7VtAR6rdXmYYQkgiFvEjhKaEHrJHsj07/jW+/h+PjiVDRlQgb
         eCcE0Mo5Qoh7XxGnJGmMsj82n7sfnOpAUoGnUyG3si4HdcF1pR3c9OyaZwg9JP3nFGn8
         2k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153640; x=1740758440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97064Lo4S+yLBMHfAaUS5/jSMM3joMD+alo0JyNN3fU=;
        b=GirBLDqsVtQW7FbMRwXvQpGpbotzPyjhQ047aBLrlLyrs1O5KQ6yav0V38wBw8GRxa
         xXiHhtw6qGNrsc1pSHDVk0fofsdlwgsqxr9ziCimowx4K0cDUvAFgzyVGLenVP7S+Lty
         2JP57TisjbQJX5MoucycfGc9w5w4Ip61iWeT7AmuRz3XIY6rlVIa87rWXLl//RMrZzoj
         8sx23kQtFj5naA9jPOlW7q3DXpMfsnLmrc7vKoeVDsQLMSxThYEBM6k7W55o4gERoW7C
         p2qBQ/G37781eoMFeObgKgeKFR6+w02h30AMQI7gLEBl3RTUI16Z6LBMo+JM8sH7UP8W
         qhxA==
X-Forwarded-Encrypted: i=1; AJvYcCXDg3fTnCcpeljU3s+qlY1hyWoxQvSiaTL66jOWqIo6roxUOSO1jFS0lKJCbwR2cm9EXM5W1hKIuIHe4Wz7wQLe@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+Jh0gx+XtQiUDiMcbQWTnb+XQ2Fn5sjObuX5B7dtSqWEa4Ep
	TPUp1k55WeOnIvSdnxQMTYX0WJkOta2/daWj0y2oxbaLzNMpybI0bCgDZhrpVeU=
X-Gm-Gg: ASbGncsmdApuJS11LRFQp/CUnR0Hx/Vbojpg5Xw+5rwfh95CwzoDINULm2CnYxMwNYG
	E7Exjyvh4ZAVf+V/evcTZfdfIe0n9Xg1zUAhCVrmggio3Y1VpvTji3sOr2lnKCSG1lqYSoTGAxx
	lvbEnMXya5QuI4qBBBjblZzj2SNm6lcPZXe/LOaSrjj2cRnnOodLsmKyIstTqSLXNWS7wXVJR4n
	4uJd+XyHyj02v8r+zPPt6FCzYNLDe+r/aUrYhrX24oiYwi39oO4mzdmJWMpdkjkOZx6gz2FpmPC
	BHZmpsTN5whLkV+L2C0jeUIpWAH3pdbLt9WOecnJUM8Oer9ZTI1dRNyc+mOy7s1ylsZKp89SwUI
	=
X-Google-Smtp-Source: AGHT+IHhkj9hOW37OUEtDt15pY4+O+vqnXmLkqZtiWM6bCvEaBTH0PBg3GND1eglU1hwgUThMgFgSA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abc09a3c1c5mr146987666b.5.1740153640111;
        Fri, 21 Feb 2025 08:00:40 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9da9f0desm983616166b.105.2025.02.21.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:00:39 -0800 (PST)
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
Subject: [PATCH v3] dt-bindings: remoteproc: Add SM8750 CDSP
Date: Fri, 21 Feb 2025 17:00:36 +0100
Message-ID: <20250221160036.159557-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loader for SM8750 CDSP processor, compatible
with earlier SM8650 with minor difference: one more sixth shutdown
interrupt.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changesin v3:
1. Split MPSS into separate patch, keep the ack.

v2: https://lore.kernel.org/all/20250220154132.199358-1-krzysztof.kozlowski@linaro.org/
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a24cbb61bda7..8bfded3c66ef 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,9 @@ properties:
       - items:
           - const: qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
+      - items:
+          - const: qcom,sm8750-cdsp-pas
+          - const: qcom,sm8650-cdsp-pas
 
   reg:
     maxItems: 1
@@ -114,6 +117,23 @@ allOf:
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
@@ -184,10 +204,11 @@ allOf:
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

