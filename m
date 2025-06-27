Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5E21ADCC
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007357; cv=none; b=SnmUHIG1GatLKwJMW5vxEZELACNjkStkH7yJLlVm3PqT3QGMDt/EU1yaT23X8yM6u/ckabublSXJcgqoArsPWZcvvTftESxxyYslfuzQmBIntbGPgD/KYt3B6R1OM/6//mKqMmTcue7nk9uVI6BPGelN88CwxzHhFuonqEWOIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007357; c=relaxed/simple;
	bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzwIYTfA1rNfbHpgPW0pZxff+ZijiGYEfcV3iyx+LFepvxoyefSJ/oRPOHZrqy/8PubjiBa3+UCJ2oglxcem3hO5GBnja5siDkmx4TcRwHk8pDMS+bWqmteCgmQ2ra556ReLe5LKx82imThJhJj9RECD3m36VU7H5cOhGiiZoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GLZfuK6V; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GLZfuK6V"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so3744626a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007354; x=1751612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=GLZfuK6V3V5tz6CVFInk0eOZloK9XZQSBnb0/SH5mbkzFmkdZf9pynWH1F3PALUyoZ
         FyWOeDp7eNhlZa62R4b+OsPIHFHaqFJAtpd7URptt/9SqRcODfiZN/QEkAtO2GCRJcpV
         tolAA7WenIS9+d/KORxpyix1qbRT+ma1vJzUey9dKf1eILxI/CtqFVhN6AiWGhFJx/CH
         O9ZxPFvDY9+CPPZBGC2Yt1D2HnGEkgF9m5xgRkhr23qxeUrE/YSy/IIuDEIIMKcaRUuO
         xaooTtjBmEXaqiuSMNFa8Qm3R7J4OQ2jw4NGpfxU06iX07IXPIXNAT4cV4LKZDNMJI/s
         0VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007354; x=1751612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=Y7gDqLXYnxXtNUVwKYhICmAMTiCTOO0s9vF9zx1xYYZ6rgeR4nBVXaWstlE9Ld2mxd
         lBGBEwHI+K7nA/c+N5Gr9tcA35/frhceh3SfX/npTFdsu+b42oguHvu+fvM+3zZ4F/Te
         N49z4wHtWnIEfkiwPHLeQlhel/gr+6j+Hba2Tt5kYJG1dXGwxyFOQpXg35zt3g24oiwH
         PWP+2xcc4yI6KbIBkj+WxbJuS8Ld1WGc36XH4CVgiCqVhZ/apfnD7XXQKMEWW9LBK/AT
         d5l/ffBbjgN27QNY7nTsMK+3pCE1Ye84XGxvyfWkTvKEQ4OBwdo+9JXyek5qmsNp8Bnl
         tEyw==
X-Forwarded-Encrypted: i=1; AJvYcCXAwVLtzjqXYpPy0KVMUD9BRBTGGlZ7BzCnBaIVoMUVBcomWbCa3fFQM3PEUoHVb7JSfpYXSjK8MRGiEbXa1VXT@vger.kernel.org
X-Gm-Message-State: AOJu0YyBVF/HVUrNzO3I27sd8VF6TqMEk6XqYatnikNP5H43KuDCYAR4
	QCYTfhqPaR6mIYrs7UtJxwEZqWSaKW69lhdI7zRd0zhxcmBrif2q7cYHOmhTCKOpIFQpPGK7Du+
	Zikrs
X-Gm-Gg: ASbGncvrzW8g8DkYmgPKwQt6SpXDgqzSnFh+QsM0LhcGV7HlFUX38cUrSgEzBj2vTqS
	NMfUtm8mkPTlrwrek0nLZ2UBT48tC9Rttuv7Sa+b9L6vj+2XgD7RsxCIwOU2sRdnJd7R4sXSDyl
	KWGxWSQH2HI4J3jG5ot5/e7wOOJzPyEi7z74sqAQV1HS4B2CY5CZGoHX2cf21z0/X01e1KuveMf
	EmdnPCSmL6J0/vEbWxvMKxWB2/JunPb+ytSl8OQ3bs+3l7Jv4hmiN3jjDT5tEb5tohvAVFia8i+
	nsK5rA+OW8Sjsda+oGBgPIlVjrohqPnv0vdn/9yGts2coRgP8RbSMto3K9s/JbWW3XTNI2tM7JC
	z2ekFtymMhWR0YB8g9kNM57Ag6tJgsO9s
X-Google-Smtp-Source: AGHT+IHKtWGMNxOrAU21NmeiXRPZB0y6yrZYF854D8KsmMxJtVjeumi6eM7NgTAZzCVzhns3sClWlQ==
X-Received: by 2002:a05:6402:2553:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-60c88f6aab0mr1436749a12.15.1751007353652;
        Thu, 26 Jun 2025 23:55:53 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:42 +0200
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: document
 SM7635 MPSS & WPSS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
 b=+rgwx4+CVNDxQfWKsxQ/6EJvYCG7U+5yECkT1jRsSqNcL+okjTgoYfxH+RJM0aKR2ixLnV+ik
 rx2coSiKB5RAtJbtD4m/x8fwfN334DGfnb7FVqbcQBuUVrx/JW1t81B
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the MPSS & WPSS remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8350-pas.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc8331f04d4657d9acba718533cce6..9ffddafea33739d325fd4c469642bff461a933b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sar2130p-adsp-pas
+          - qcom,sm7635-mpss-pas
+          - qcom,sm7635-wpss-pas
           - qcom,sm8350-adsp-pas
           - qcom,sm8350-cdsp-pas
           - qcom,sm8350-slpi-pas
@@ -91,6 +93,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sm7635-mpss-pas
             - qcom,sm8350-mpss-pas
             - qcom,sm8450-mpss-pas
     then:
@@ -142,6 +145,22 @@ allOf:
             - const: cx
             - const: mxc
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-wpss-pas
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

