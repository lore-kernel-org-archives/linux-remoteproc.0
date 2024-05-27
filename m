Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9566E613
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799457; cv=none; b=PzTj2/d+igE7Zuq6YbUCqpAdyRlmkCcH2PGYANiSGIPTq1L1WgNwpGN8/q63HSX+ZFhS1j6vi5909NDMW0lMpeCjp4ii31x1SPT4kJ9XdzpvYJ3j7NTmgcimF0B6G1sn8IKIGcvzPCEd3hCTtsZePxRt8b+Dom7kSVfNkkffbyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799457; c=relaxed/simple;
	bh=MS2pg1hkUFBkA3HoD5bx+WBJu4p2mdrw8oSNHZTARog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3FQQKvdIUAvGYpJV8URAdThSPhArWnJtZheB/QQP7nPyOcT5/MRwz5hEXAa1e34ZbY1hemqIcrmwvR38vkC5RL49NvD0zWQxxPG7AYYlWmUoBM3dos/ZZbefILaWgsuMX013GWVRhQkgQnRpv/4rgPDtuLzysz3+7mDlR1gFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DOCPk8KK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DOCPk8KK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42011507a54so29666425e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716799454; x=1717404254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
        b=DOCPk8KKGRdzcu5PXWIBC1UxLAcjgktRZibbV20GX9g3z/tAi+EXRe8HJjH5Mzb6Dd
         v5VR6a5kweZDxog3PHQjayWrkjAhKu85PzSwRaf9Qduz6cIhtK2y1PAtAvP8VYZScISj
         qApODnz6reOlaTQX90ug7DEexue3TTVsja5hE9B6ckIYNUmj6cde2ypKBPGePkYxMnYC
         BTYLsesLHfimrTOwt1l9vvViIMjTFbaZ50aWmFUzSiSyTy5kdJy/3x9Hp5mQYWCQScrk
         JkvH4kg5F1gTio7MSqqDQuYg/Ll/kGddOImCETahc29GzPw7L3jJqcMIlDUZKuQfH72b
         oE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799454; x=1717404254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
        b=IGfynsW8VK6LDDEBNHHHP0YXbfENWeqLH/K6GI97ejBENFfpRIGmU48za8IGFNMNFr
         NxJddK0bB5s96DBsHdDAREtMtPmTqTxS1G8y26o5LiGXttM2iA8lf168qeUoR4LIN0L5
         Wqeg3wFK2JMnonlmXtkvcVUEMr6IU2ZKskv9/sHuYlE0SdEyD5J0Mj7pzlx7oANh7J4q
         aZq7qQJg5+Ta4ySAsoLSkeJQwFHPxrfkPKOOcWK9+/Kcbs5r8TEENq3DKw/y6TSTz2hA
         jPCRweJdkWTNvZmAz9qZHj2gAiuT/fqAVODKIL9j5xsMXFJVkMjAl/urwZcEDQYw03PQ
         RMfg==
X-Forwarded-Encrypted: i=1; AJvYcCUXW1TPbv+QmWhOKykfDIdtmXJL/qq4WMRb/dXoRbhwdATn06sfvy2GL8FCTaJLadyNm7KBlPTAhe/8Z05TPO5nDI1bPwsl7PfMO3+EmTgSzA==
X-Gm-Message-State: AOJu0YxhD/IFmFyBZgNA7rKltxg2ZeYY/ir27PuZ0fM+XOOq9nnfOkKq
	ApOy65INbDen7ySd2xHyDvWpLTfCzt6H+UWj3TAaw1fd0vydRfbu268tEfivdIk=
X-Google-Smtp-Source: AGHT+IFZbUCxgzdKKwQVSWk5wekRyjXVA5zvRVo7OafcLr9xZ3nWjdyqriWlYKLJ/xR+uMqtxCFEjQ==
X-Received: by 2002:a05:600c:1386:b0:41c:66:18c2 with SMTP id 5b1f17b1804b1-421015a6086mr95868115e9.4.1716799453427;
        Mon, 27 May 2024 01:44:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108966682sm101365575e9.2.2024.05.27.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:44:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 10:43:49 +0200
Subject: [PATCH v2 2/5] dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and
 GPDSP1 clients
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-lemans-iot-remoteproc-v2-2-8d24e3409daf@linaro.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3xzA+6EtS2RZb51APTtA6l7MBhz4r0SiIFow/JPj6bg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVEfZVWdHKE8LAAuhVycehiqUMm2AtN/j4ejQC
 H10hcR0MyKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlRH2QAKCRARpy6gFHHX
 crggD/4t0vasOls5wYfJyJIJc7AXI1QqOIkYyonvN8z3NXrsIrjvCLCawsD5Ejkdw10P6FHptjc
 vfFNGcq9QOXPV/6IK0GIh61qL8YH1Ip9fT2BhGOxotW8r/mRpJjwQkWjC5QddQ2upecFpTnmZ+M
 BhwjrvJNPwV8C8CX1qM1BeDhlEbLbL1sFYGSM01ECOmfMeqSC8rfuWKG8H2/juFPMALnwvsv9lp
 E7XBNRhiFWKn1rW9PGSgw0JGnMKZOQBloK1ZCIAyd4xaE+jNhwZByFKBvBH+CD5M1vrril0Hs87
 CLvoPbkdQhmSy40GCDvd1DpOH0oeP5yfi/PrhA/g2qQZmhyVq4maRGvucvbZS+irijastsy3TgW
 /vfcffXFWEZ0+LIJcIkK+XZIWMpEkPwa5O4+g35XI1D0OUhcYPw/GvAZO5wckBnVKqbavOc52fZ
 lb+DhSHyob/L21e5jOSCSSESvrilsqr4MNQdSpcbfx/YxXT1EINrWeT3a9R5y7K68mhHIAOE0Uu
 wVb2ZtzziZzL22VBypLkpH5DTyY3W3pHO4Mdl+9fSZ2bSgcgwgXkfza/DDQlc3+a3HswSzANi1V
 LeZET17J2/ynR909N8AUlEmmQU91LS1oWCEaF57PJHp3gKfGpHgweF7vWnvEPMjzMs9BjOjW1ze
 2nDjHif1Zk/XLfw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add GPDSP0 and GPDSP1 clients for SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fbfa3febc66d..fd85a79381b3 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -33,5 +33,7 @@
 #define IPCC_CLIENT_NSP1		18
 #define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
+#define IPCC_CLIENT_GPDSP0		31
+#define IPCC_CLIENT_GPDSP1		32
 
 #endif

-- 
2.43.0

