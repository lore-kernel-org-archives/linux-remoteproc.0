Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55421B9E2
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007359; cv=none; b=sfvmznNYY0P5c14BRXDy5/C1sEI1ncbYEIaeGeezcS8cxF+VDvQ6Esg81oAGE9DH2ecCzOWwlJM60/CqnqaM2ylX22kKm0AiwRcTyhrEn1+0R2iPxOs3Eknj8txmkyMSB/JJaEMKQb3R2vaiCVy6K4UX7c84W/gvUPDWwDyQ1qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007359; c=relaxed/simple;
	bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0jcF8CyKYpIBxL5tHABYBK4v8Sj57p41cTgIBjBufXIPOT61z7aSJ4acXBSzfFkofJw61gax4xK3ULcj5axfjn3KynoTjdmeboAhUrgKG+KOZLM/p75rrL2/CqTH1BXsiWjwHrNOzjGe2cQTVCv4ePq5Isj2B2ZbxolBJ31nNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YhCm067e; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YhCm067e"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so2836873a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007354; x=1751612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=YhCm067eU/raIk9FCTXkBe80jv60EoqO2R7/Bh1awKzhDZeMEvST8FwyHi3kJ1Jc+h
         87WbbKiT06isBplt6J43Iuh7IUZ7n3W09RQJ/Olhbkfw8c8SuFaV5DJGsnwMDPnTThj3
         C5nFiqC6oVS8MxY2n/3eAEUmViA5Pwf8aIhyO6P60Jnx75hX7iv+BoT9Cj+WcVr95DjK
         PRodeoOgBHWhTnB8CNcUXiopJA/mzXMwv3xSCF3IH8tiooVV0nDgjPxaoWERCWKvEA8K
         WA3yG03gsBhmbMyO8ZWVKam9IbOz30t+hZHrpyBAtFIQyg/2dLBmV6KysRp0F/CEQkgy
         gTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007354; x=1751612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=CB+Y/KxOkTo50RwrrnNszMHpCA3DDQK8BEE9XlzO7xw3tnFR1dftmmT04lrBPbVR3e
         2oWwrsOZTtkxKrlIxS2nvTAZgOCshSjyzMc/1/vaVYLU2cO9y3QEUPf4WN/N3jElMUEE
         jgxjfxh/neSGaDT7gcN6T3bvJcfcO1Kp0149EBIk+0h0GomEeQ9zyx9c7AzNulLV4yee
         CptHWyhnp5knAMQngfQ3ZN9DxUZ8IQIBiSJm/zu7vdce+vstC6oEb7kIZYPnAiB4gUAn
         W/mal88j6cI0U2aCIfJ5tWsw0/elB24l/6rd8EyP0v8DHUjMGPGGggaX+lE01C5cBbsw
         Wk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjcakDfDpxwk+8QTd3rPMXpo4sLzIVE7iDvoOWmP9uy/INnustbW3Y3uG7YBm/RBnO5Y8mxpKDVp6KDlXQotp7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mT0db8zv5/q2EvsV3Lpiq7lfTPANgSbTd1Xvq4cXLAKPzmbI
	LifLkKJgf5OPfhjFgV8UfmNBqE4rEzAApbgPcRr0BMW1AFfs4N6lmsIZ9JzyDmuJlac=
X-Gm-Gg: ASbGncsvP3HLD0b0nszbw9hhItPBho5IyEFyX5HzLUd0mwplsEhOO/tdVOO3nym3bu8
	SXDp+9F1uEp7ctBcYZ4k0E8JEzXmT6VT/rNDX4u0pJuv7KZYSrlLcijV5/ePA64TLDCNBSGR+GC
	cetbEgdLSCdBKZwhkPIMYI1b9UwdN3KTydCA8g9UqoCFoNl/OBT2VvSjBW09SyrcY7Uh+rrA9Qb
	Qjn0qVYupWNpjF2jMnbrcl+gGdl2cuRmQ1rhfNMzwUslAIOE27yB10NKCYLcQtAq6JeW9xEYb33
	x2goJxQB7+RklMR6j2FzdxoOxK/+GljFSGQ9sNtiLhNPKVWY/b5vTrY+nHg1JZ/We5znvYQfSZf
	Qeq3OFCkS8jEE1+Q4zLmIMK2eIRIZ3Ukj
X-Google-Smtp-Source: AGHT+IEPOegvS5x8uAfxLou6BqkH4jPPap2DV8GxhIYNv+0+kp7YUsrnViWajQTwwmSuckNTkr/hcA==
X-Received: by 2002:a17:906:478f:b0:ade:c643:62ce with SMTP id a640c23a62f3a-ae35016e6d6mr183382166b.56.1751007354155;
        Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:43 +0200
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 SM7635 ADSP & CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=2202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
 b=rEYZ0sl+6FbVHfD363nhKpPvyLoXc0/GrxUiNcWrTXEXL1tlkyPbvtPFub8YAxVWHHcqZLevW
 927VTS6GeQaCNRCaSA4ODimaVc+E6Wr2QnkQZm30Y84tyDwRgj0VKGy
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

