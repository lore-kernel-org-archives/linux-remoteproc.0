Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D218B47B
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Nov 2024 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732265792; cv=none; b=KUnoOBYVNYeFxipbA25W7TW1gonwUHaPsWCstnGqx/h9PrMjY7J6CkmY3ywAGszsxcS7NUnuaxwEpF6XDl96a67kH3XnhQ1kPVlR4O9zJPQvoLU6G9JlZGJUwIxVn67drMTpsO55Nnsu8CDAO/0wI5lG84naoNVzs5AHVOjd+Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732265792; c=relaxed/simple;
	bh=F2koBmdyZubej7GEO1XyX3Sem/GjeTvvmVNiCWXNQWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3L2ZZqOxqTTwYAbAkNFbwEpk9/NWeUSET81zbspkkx2fMq0xXbgPSOaYG5IYuEoR8mybZ6H1eF30S9nHvy74EHYmEGHzY2MpNHnP9n+TOLheuCDJ0zmR8wxxPqBe22LiXn/oZLw6IshjKbjGLDV9vOSWuu3LHx5VuRluVU763g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3cWRFAX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3cWRFAX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so2796105e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Nov 2024 00:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732265788; x=1732870588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0q24aZj5UoB/3iOB1xFJKIgPYCub+iJrpgUz3sRy/lk=;
        b=X3cWRFAX4s2kf17Eb+7UlG9hryuG1h92NW9AOlFhHMdXc19Hrc4iJCxF5AOvgbfDh2
         qo8fzR1pm/4YVgEkKCyjwzev9x5iEL0H1cSrFihtKfaBDMo2S9vq96ussZhwp9Qsq1i6
         oxovcppug+BS0zt0M1Qg01X1qhMHRUqwSYWG89zeAwpntisdFG184ukV71Am6ZkWY4bR
         LT5MxHZQptv3br9y5INXYfFW2WI8RaHPtApU5IrEYKLVqHatCVLcuKAXa3MIUMD5D85j
         lRz7uGK7bIa8yWTHL4tdkgoA1Z9Urezkj8l13jzdkK7oqSUZ3tGKDwgsO2qsAJlUHa/a
         z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732265788; x=1732870588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0q24aZj5UoB/3iOB1xFJKIgPYCub+iJrpgUz3sRy/lk=;
        b=BXtvVhNM1gj8+wSTa+LkxpUKTwgUqEN4vGA2AA/PlN4TH715w9MCm2vSwOrP4ZEfcH
         6mvgM59dyE6UiihTeHPgEfU231vjDmRI45vNJRyslUDk0Ub6U7WqlfkYGhOMeo2DvY8f
         slk0GQQjUB3BrK97DWQuWkPu7Q3AkI1aVfB5NjOiIdwcq5WF1MIZVfpszhQXThrCyel+
         qGd083j1RNXyl+HorjSfci9/wHn+q/m9Aex6n8BhLhcj2LJDfpXJiM2hGkgCkhedWZvW
         HxLDPXBo1xj/I3WJ4Bj01weq5cGcfZXq5asSZW6QHbORa7aH2osZjM0B+SfVZzgam/JN
         SrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcnQMkIP1HRSIpxZCftwq1y56sdFngT+gUPaUSd8M5qHDuvsLOcSmXvEImhazOOIA8kc9NfmoQznmXd6g4li8x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42g0adJmef4hpQIIQpP2Fxxar76GbD+wmOUf5fSVv73kRSsnd
	KwSqDia3mL2sdLhY0OzWT9p6ucwFYHf23LY6O4VJfb6HeEYgxPBA1z2kR2vqeeU=
X-Gm-Gg: ASbGnctyemutrCU8qbmQkwDg1gHLzv8IlIpTfuSJXX/uwB3TXWrQp7noLdEz/X0XqaO
	Y5kuyiBI7iiSUmaFPlZR0JcQ7sYcyQFm0Kp3c23LEHk2pDwz20PpOKjEW7amuHwPG7scqZURPTR
	BkehgbnY90LEkOfTYdGrZRbd14jFHLKErev63mSQ3RQyN1Ec10Ul2/bBfEUQJaUkpz6ZomQJrCV
	mOOzInS+Fn8cenzaT7nRYpeniU9hHELh2/+oQKpMUV+kZGZ16i/bKfNQ6gcy9rF
X-Google-Smtp-Source: AGHT+IHm+ygSxetYz9qzxk45T5z++2uQxDgWuaTPnpb+Sqx9dh7f/s+TWZ+u8q1SsFdpQxAP7j9xVA==
X-Received: by 2002:a05:600c:4f84:b0:431:5632:4480 with SMTP id 5b1f17b1804b1-433ce4e76dfmr6350545e9.6.1732265788560;
        Fri, 22 Nov 2024 00:56:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97c68sm20320695e9.36.2024.11.22.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:56:27 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: Add SM8750 MPSS and CDSP
Date: Fri, 22 Nov 2024 09:56:22 +0100
Message-ID: <20241122085623.19988-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

DTS for both of these will follow up after merge window. Work in
progress is available at:
https://github.com/krzk/linux/tree/b4/sm8750-audio-part-2
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

