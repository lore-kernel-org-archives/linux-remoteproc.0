Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037F1FF7C9
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153791; cv=none; b=b6ZbpAPAag4zT4I1ZpDlR70VgKDR7KZE4IrvPQkCZYhVSHMev0o2qMbHuAGGtepfTRa/vtm5A6i9pPZcY8QgNIXFXBgc0wwvdfsJ1Efxa8FEy6Y6qGkMSLtX4R/6/TLAA+u/nRZcEpg60i8pyCBg1lkuQ23l01IrWu1Cb6E6mgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153791; c=relaxed/simple;
	bh=RYYrqjZBBPZWi7VA/WRn8140pmz5H68xLv5MzgliR78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eL7Vdwv6SNResNv84crWAb+8yoWZCsqsqiJxoTt0/72V7k8mCt1eyLZxBVCCvMrjEkhGCNajXISWyk7BSzpuQHUyozPWk+IhXnbs4+DpY8ciC4hTd9nH0B8YIBZEJc9vh/CZlzrL+tN1Ygm+X16jDz+JwZkVtxLoQHcWKFu2NBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLRJQsPv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLRJQsPv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso394454a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 08:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153787; x=1740758587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iecpj9KIMrY3zBOzgwFtaRTFMVnp7wDD9F9a7Nu1whg=;
        b=fLRJQsPvpsPxK9IVBT0WhA9wHoBXOW/bAFqOatLe49WYbn3T0q3mXQ1mbjBlzjLPB3
         1q7Ku3syMUVBONjEc9eMXf+jmv3CmZGIs/129+UcXjqmBksyno0kWJ8UhevZ+BpuqpcB
         rvGtwh6nRezkwFMoejBD4aT4iVkoGQUISQ+6eVavVS1EkpXLhSYq6UTb4M1hQc3N8W3I
         5U873zWJ20Fz6Y0ANLaj0XsPVr3q7m+A1wX84HEypPIOZd6o8XtbRmq6C4ll8GCoG7ZJ
         CIYtDzum4LJ2/9vt0Yf4qCqQSnKg9PO+e++YKWuGDuNFbFUoyPTM9jPw9b/Y/XJdimjZ
         f8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153787; x=1740758587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iecpj9KIMrY3zBOzgwFtaRTFMVnp7wDD9F9a7Nu1whg=;
        b=uE0CTJdD8ty1FiqvuzfYFxfoBBDomFSW+db39VCJfUi+e8ge9Tg1Wo8E/+bugI92FE
         pFciisK0pyaoqutYwsZQ3/ntybPlJHAIbdUbr5quaJYIi0DOocsRnxEYHN8t/O15ffB/
         YlnOu0bNvMZ6N/FTYeRUiByfM2ByTKLChMs5kiyqPtBg43w4wBYoQ72XGJGKXbQvhYm5
         A7bj42rOI1mFGCHwdPFhsxe+TzUt2Y5AON4emHaf7rtvV3rTlTFkKam1eO6PVuoUmOBT
         TPrt1NG0BzBW/Ud3R7E2dz5DskaFaW0zuR6r78JrLX1Qwhcb+yvFou+hHkRRDFqeXNej
         m6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3bXzeDH0WVoj+RX8feDWeOcStdndOtug9CScKbhRrSzKcnqU103QsV47k9mzjqCZdzXH/986AhqU+TmcZ7yx@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZkMrBpVBZ2Dm0C6j7Cf4VV/7lPoLFbG9weTY925dk2n0Ne0m
	lHLFqRpItidpffLJDUHuYb6HLAnLUZv7Ejsg7gPSvrdKGjKh3BKvbRUb3LOKS7M=
X-Gm-Gg: ASbGncui+KiTOkwiFLzWw2Bt5TT7uRzo2lxpWeG9DmWUMRtW24KYoKbbAQ5XRmF7jbI
	NW2Z0ekEeaD1P4eMD6BgvO1A6nzqvXT97hu0jr1lpm5zzuE5ls/Sq9ZP1wTxUz0vRx/+MgGM916
	oiIxrlHLwa5EHSrG7OHQnAikLmPhBzZIHwjz6kvJfVv+l1rpR1ZDkeg0iPPzjWWF2fHv39F3NtR
	oUtJ0u+uq6OIieMfu/vZAefFLZ/fG5hM3fcidlKaK+DiWsiNmRtRarIS9h2BBjD1xmh77/3HPyv
	DFpnmPCOsLM9W2WbXTW0DJyoD3+17guo2uTQ7HND9+YfC4Ap5wBs4h8krKDMxesdEgSX5IoO2ZI
	=
X-Google-Smtp-Source: AGHT+IFD94Z2C6E/AhuO+19C1vGdBFuuX7tNp0Xx3W8Vs2QPQWhGEEzUJ2reXTaWktyO+VoDRaxiJA==
X-Received: by 2002:a17:907:9722:b0:ab6:d3b6:d825 with SMTP id a640c23a62f3a-abc09a578efmr125277166b.6.1740153785316;
        Fri, 21 Feb 2025 08:03:05 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98640619sm1040782766b.54.2025.02.21.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:03:04 -0800 (PST)
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
Subject: [PATCH RFC v2 1/2] dt-bindings: remoteproc: Add SM8750 MPSS
Date: Fri, 21 Feb 2025 17:02:59 +0100
Message-ID: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loader for SM8750 MPSS (modem).  Device looks
fully compatible with SM8650, however it lacks fifth memory region for
Qlink Logging, according to downstream sources.  This is a bit tricky,
because updated downstream sources for newer downstream release dropped
that fifth memory region as well.

There might be other differences against SM8650, because the modem
currently crashes after starting.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
Split from previous MPSS+CDSP:
https://lore.kernel.org/all/20250220154132.199358-1-krzysztof.kozlowski@linaro.org/

Retain the Ack - no changes to the binding itself.
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 8bfded3c66ef..2dd479cf4821 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8650-adsp-pas
           - qcom,sm8650-cdsp-pas
           - qcom,sm8650-mpss-pas
+          - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
@@ -164,6 +165,21 @@ allOf:
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
@@ -191,6 +207,7 @@ allOf:
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
+            - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.43.0

