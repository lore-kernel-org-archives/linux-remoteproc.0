Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018345;
	b=yrh4gJjXe65y4M/cIVvWuqrjayVUfLBXkjBK/5n1tQ8h1R3HfeG/Y9G35NPb+RXXBIyr
	 bovaVJ1FOii54SWMVSrfZhja/iXAFnOPV2br3q6HRBqkKn4Udo/Sbbe4CLkTCJlXLF2Cg
	 h3h9o7D90T4kIBGYfPSUSwmfG/Yi61ZVsNytkP/xpfar74Kz7jnpDrkSTX/jY6Wo7jNW3
	 h1LUgCO9zMDkq4dOg71LykkZoSz2bEO+b0fLlzaxr4mHsSa7+RHLndivly0PlOi9O2UyO
	 lxuLRFBHX/4dabZwfjyxqGCcecHZeAO6M+aum/gkcxaB4VSYbRFy6IRrCrITD3SrexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
	b=4C2oqs1OvmXD4KaylliiFjAwjcElXSkJC6WrqX6tIu9TrimeYERNtscthpJlNb4z1kZM
	 BKwRkut9TTsGaSfHfI+VGwcDinfmA3/uApZ9EQdmG33+mxMzb4hbkXaG0xDYPkP2VHyZ4
	 iSbPsvJEHwiGZ15lfIB146S/oX+HBaJMHGiWAlJu3CbfyKjr1lW00+UbG/jr70g1UVNNF
	 xKQtRNVNnZrUkmmW1+XSgLPG8/xY8cNf7g2ctf3qRxtAmLGGr2dQpwvvqlK72iajt2TIE
	 p3mRsP9ug3myXN0g/uMTbaGhNSfA99QyGHg5KC5CL+hYp5kN8y3q7aQxhOsWCfgsSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68B606A333
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A68B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9851592ada1so350616241.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018343; x=1794623143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=RS1WIsuFV3Zo+JJfQ0Nq1LTxl8pMNv56SomsNARfTMz4rFTCcWpWobBqR7e2nJgfz+
         1WiBN8YHGaI+QlQ2RJtYTxsrZHFqXl7OTDCzOB4To789OgmGhznV64Kw5V6IsoYKfpix
         yu+ja344GTQaER/9Iuc2cfGGyO6XJ3c0PzznQAj97VqoNhCC2rD83yXDvgMLAH5FGz+R
         syInVSEcd0arJNNUXM9/gENtx9JvFBMIgrBYJVoq7R4LtyeGa/pBL/6DVOdDWsqjWraS
         k+IDxbuflUSRrM2GZB211GqttPaz018AtkdU6cy8kZqchGA8cuoDGhDfxv5iUQQGrLr+
         eUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018343; x=1794623143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=HqRB32pbTjqVK0dozcM1oTDwiWOaojXNcdRh4U6jhYpwnUFRd+D/zCLQ03W7w2ic6K
         XTq24ohkDWRmDxnMhbK2nMqtj3eF0KOyuI4Qn0xbvXeEkvrkE0g/azrU+nvo23fJU8lc
         +arlBpDVqCvrmObn9yeQt+uj6Qx94RFhcYrI0R0HZUFnBCk3ldfwKJcBlG4to5mv2CCb
         eAEc0m+Mb/vD9r57TFzqnDAvNeoOZBaUomtZvfnhwmOkParCTZZDw3ATJDfsKnrDGYu4
         eqQ4AJiNb8iKYFNDVv/Hgs0/zBqJ8Y2MUbX9OcXWftrRzdb8cPaO4I3onwVNgjE8eKl4
         dONA==
X-Forwarded-Encrypted: i=1; AL+hErG7FN6AO0sH13QWj8nLW3N5dh4vZ3q8nvMMdBnby18AmmlR6/anML6FDBgjFy06H+ziTFlA2lCS3aL+ZaqJkrO1@vger.kernel.org
X-Gm-Message-State: APuU4Z/5okDhlwlxqz3GmyJKkX8va0ocbeGa4ovfyV6wurqG+icG2ErM
	FWy9mS2UAudJDOA1QaiCGCUaO1jQR/i9b4gi+zR8pB0llBABsZf3nHMu
X-Gm-Gg: AYBFou07UWKo60jVzEZoRh5VK9U9VoucmUpm2tkZkS7a7wEHm+g5eoJbW5WtmZxWpON
	IqwRgVbw8sUc0gZ8yObPc2PEbtr2f7wgaBk/GJqFIgEgaX+fexI1WDYJ6m266DKAFI7kDcU6/Ja
	o0CPWHuZwYnrJeG+3OJdpKAvJCIS0D+jKrIswFKijaJA2QeBcTsmRoNTJQz/4PD5YIAkXKOLlcH
	CmBqcfQXeiC+MbMu9dvebVU0tRHVxhRNmMr0E0YLfa9TXko6Joom0KEJaURGBTmy95EyhIC5taB
	HSu6EnDoAdtoRu/z95niyyRds4IAYq+y/bMneluNIY37rizBCXOebQYEUygb1cy6nv0d+vbM1BX
	dtMBaPWMMHh8qN/LzN6YipBaS2+iHtcGXWBdiwfYQAhIypUDOwuhuHMnvBENkKGaDIrP1sq48sI
	T69+eMccCwy0oP8de0A7/9dlvMn+i6lb3iHVA/sWdHUqWn8AD3NDr8cUHyV7yScOwWqzmgBZdfZ
	sNZWuyniKd80NwTHBtMVBU2q3gmxf00yuj5SVtFHZ/4Dpq2CrBL1kWA5iSL7KbKYDOcfJsWUXAi
	RSPewlSiltUl9Ex1NJcDbjeKqHw3
X-Received: by 2002:a05:6102:61d6:10b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d2a526b9c0mr1163316137.31.1794018343229;
        Fri, 06 Nov 2026 18:25:43 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bae2a7ea9sm3221365241.7.2026.11.06.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:41 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 3/9] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Fri,  6 Nov 2026 21:24:47 -0500
Message-ID: <20261107022453.159341-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..6cac1f77993b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -128,6 +129,20 @@ allOf:
       required:
         - px-supply
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdm670-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+
   - if:
       properties:
         compatible:
-- 
2.56.0

