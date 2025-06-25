Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD129ACF9
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842940; cv=none; b=JaOY7KpJu9G2MizF/zNwY5yI8TVOFtIG2ZnvTDTDzzzIdGC3OoEuXUBs7uzKdLwpdFe6YkiGJUBUuMzDPoOdAFxJTARQyAtlLorttGEf52WLPZvplwG+fSTCFYW30XMNwPUP5Xu8q6/uGrP/crPREjMhcDAu96gAm2T11z0jiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842940; c=relaxed/simple;
	bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkRg4tJ7ikJCJF6Trave2e/BNL9EbXtlSRq+i79Vi/qNcSTbArqWHFzHupcQKZSTxbG9aYyyv4nJdDYsUP8yMixhUKDMcmhWAle8s921wnqOro5tHP6fdxlscaw0r6kJe+oIabv7m/YdmOXSQAgZl+AJRFM53a8328kNFoF1u4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5ZsAuNk5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5ZsAuNk5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso9735607a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842935; x=1751447735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=5ZsAuNk5flxRjdA5DeVAMW2lh6xoxyR4ixDJYAEy8F/NT5a8ALKjRLOo9NDnhNYsFu
         WQ+tvUOHTBAXPO9bZAkzITnHnlSYaX2SEeDqHixbWs8xR1tZuUDtucmdQ2bcrF58ct+7
         d9tLQrC5xGdG2kJzAF6C4diHWbV4lAdpbk1DdGLmoyuUaNX/lONPPzalZFMYLDWoOXtg
         9HfeE3tr4jH+eufqg0QhSAuQQrMMiZJyRJ3uz3e86hZbeb+oQouZ3F0V1Pid0KQrxF1S
         l3j9tqfLEdKQ7QFspmPyuqrhVvroIB9+zTeSqL3gbHPaKJmVJxQ6VJPWORvzMSgytHCD
         6R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842935; x=1751447735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=goiQ7tJNj7UcNbWl4bxmiFlbl/iBGIbu4BvkpyNMTC+9ye0QgNytxPmjPaPQHuh/7H
         g1HuYcpE/rQyI/Sbl1usnFHo8rxkjGOJYJNjFkHlOrZ3/BK+hEIW2Wj/yCnrbRQgfc59
         DWYf4OZiq3CmBcNx/kxBIR98Cj7fORduVpvsXXoq6qDUIu5Lcu6CaI7aX0EamYf21Z2+
         FEIiUEIC3m0PK/Nx/KPvOee5hx+dLSQoE3wHOPaOyfSz0lFBEte+Fm4giXm0MU7AIaYh
         jE8kvEnY0S8Df52hWZQ73K2kCy68uRVFPuu3Yt5ykdH5nLyENkxxXkjPBd6YvKT28ROD
         rRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3k2gTpNebYDzQas/kJKvN4aFfwXdMf80vcKkpy/MNwhXATv7CxGfdu/wU/VFrXJzyLe8Xi2eDsdcItkdQnXOY@vger.kernel.org
X-Gm-Message-State: AOJu0YxvKNk/rkWZUWOG8AjKqfaOE4EMBwT7nLm4y2KmVqUfqT/oAyc/
	sqbuCGY6z5YlaXtUkPAQ+ejRMKCiIU53SAjhvUKlbpv6Ffddch+quEzNyZ5h0YO2Bno=
X-Gm-Gg: ASbGncvzvIyoL3KOrLBt/kJuulQ7lZpfDpCbFqXKGq6vSZ1z9hTkLfqjamVMOoKsC1S
	f00sA1C1WlMJ+qlvP1qiPRyrikQbVfDsmTYc7wEMYUo7KJeYVfMJRaTVvMh/mpzleIym9aE3r8P
	LrRNKhsmcjXp/94HPAmPLciQZgQN3j/uu6yEqpHD7HL3+NA7Ga+CuBsLaX1vbC10NCaRzijV021
	bj9TBTd35xejejcCCuvl9sTLhQN/ODMaRXS7J7BNtNtVY5ZS7V9GLYJppyCSD65QK6TTT+vljY7
	tGV14qVKGyuoEuSGi89IkI1ZMcsP7xeNFQSkoVgzf54P/aBlreinu9eK4v1BWpBYoH1iWGKV7Xk
	G+bpa22Ehi3QIHqkPLXfeUdlH5XH0LvQl
X-Google-Smtp-Source: AGHT+IEdvnMggPRjXeNXk9UrWAy82iX/E3YmgkRFIIX7Dwn9s76Z1yNwQakPIdmgVTzFWVP0kMULvQ==
X-Received: by 2002:a17:907:3990:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ae0be9c0a0cmr234927566b.37.1750842934951;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:24 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: document
 SM7635 MPSS & WPSS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-1-730d6b5171ee@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
 b=lwVYnYjT3ta7F4XNDWGffuCCAndUwPpyI3CUun3yyQm2dg0KAa/k0Y0gEn/TWAaSv+QSMoFWB
 eFt1xh6vBvcBISUroSF2a6djQuaV3ag4qJEUIuIVNlkRGdIIsoyqUC5
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

