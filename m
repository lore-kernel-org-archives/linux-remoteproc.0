Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBCA14B962
	for <linux-remoteproc@vger.kernel.org>; Sat, 30 Nov 2024 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960086; cv=none; b=MJgf7aU5atgcWuGZ9wHKYFNTqvglkjQgFeULXbakS3/l9GvhwdcvQlhl9Q4n+Ad9iz5rFP/zgvxMr/F8RX1pbwS2oET/pRtQZ6RKxm6d2ZcT7Hf06S/xeykvO/Xa9LM3f0ueYUgETSJfW0dJjzpKBs7kry6wDnluUapnXdORIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960086; c=relaxed/simple;
	bh=GlCVO+kLbVQTddt0lqq8TR/JxbNulJ9bzIayK53xUc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZxq9q2ggbpCoRSAYiM6Lw3ZCrvRuvDGjkQ8tVZ2+fDbIhHgJF+ySzIbyCatZLihygjeJXmQupLxjNq9ecV25Xk1JYe4HoI0klt0kHfxPYcfMcxkIee/qCU2iCcCrywsoTiu7iW+O14Kaoxoa0FfzwrBl1OF0QAWAWT7uGR/NA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqEg5BQq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqEg5BQq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434975a1fb1so2239695e9.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 30 Nov 2024 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960082; x=1733564882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QMZ3vQAZGlKurLBaRPYkpSZkQS2FApMbIvFv0fZWybg=;
        b=bqEg5BQqu4Y4o0fmHWj921p/yBrisgpZrduOIG6fKdjpVdu9MCEi4d1ElcEbizf8yc
         XyeOG557hW6TnLjgmppPS0sIHF3fBq2GSvjR/DAXyqeo8DCcljOBBhxM0k8sMAFDxY0g
         2n5um9Jk4E89OLyVTha0FhkuU6RDPgNOQnysnrst+2UUqg4lNrEqejyvDauvZryr2pk2
         z75N4+U25MUbjgkuPsCgjWKISV5myC4t5LqNV73MFBaBjvUOreV4hVCKhOtVI76kwr8Z
         WrODD6XTVIucsPV9CHVnJTUMLLUNvs7yx6nDMujQWPYd/fVXU3Vwzz4/9J7A+Im/dxBC
         Xx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960082; x=1733564882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMZ3vQAZGlKurLBaRPYkpSZkQS2FApMbIvFv0fZWybg=;
        b=HeKpJqe+M17B0hnyktaTMFIeZWPkot09FHXnmdbyjX9uZVbJI63IPT+x8SH0oFViae
         ekxar/4jxdJk0dSk1KVlx3OqBczHyqWOzL4rd4oVTSP6pMoyU1fwxJ7SJnqI8tlhXaTz
         DYSU1pP+i3mshpqLXzChed7nP0QjmFeA+N0XHc/WwoPDJdLIbaJdt3zOWoxP/AjfYV6K
         s6ZR9uz8qvo2UdYBTgRe6hAv3VedwfAh6DaVIV9czJJpiT1LaC/r1WX0VgKtjKx0VQxI
         smW2fcp4vfQT91z5VWtCEyRf7nOJ/PJo35q1Guj1MfZD2EUSJiLh8G7muOq5g5B6/1dW
         YNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKcFhbEPbDSwI/Si8jYR+/7eHQhksVjva/5mfICC5+9h4yEREJol+0XAh6EIWbE0twZ3gev4659AZdAIOW3qcS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/PDPMHUacPLiV6XiZE8EBiIjjtAHPohLD6SOc2TsepsNYGN5
	K70WOWtmQ9vLnoLzjMmKwll753QOLx5HYMRaoYkNCcLS0Gt92ry3lT9tAgihQjgzqJFXtLzE2lj
	8Eu8=
X-Gm-Gg: ASbGncvYzYJ+B9mhu4d0Uuoi3WyvMIIWtvYXsqJzCTNSR8QvT4Zh5jCpDVK74xDffq9
	8DOObOSusZv9pWC5Dc4yBpiKala9wNRvhLR5Gk2MR80qNH2A86oIFt67wnwnQVTQ7iHfKgP8rJG
	0lhkD0VAy9ApcBskm4LkuypgeEBj58a7FCrhUnOV+ExDPUhnd6tVaOY6KHYx4VoPJx8LMpSu6hJ
	uCCK/MVpzMyCtok7WHmBqw0GO1CFMPZgYQcvdgNq7CK4NoGiBEP3KgpmAHFi04=
X-Google-Smtp-Source: AGHT+IGAD//hnR/MMYCCnkHt3edWtS0NmQaVqN57BZvJFzV3wr/U7GG9jNuDIxTQAxhDIXQ/JnVhbA==
X-Received: by 2002:a05:600c:198d:b0:434:a1e4:d32d with SMTP id 5b1f17b1804b1-434a9d4f18cmr53980355e9.0.1732960082560;
        Sat, 30 Nov 2024 01:48:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74fec9sm110637725e9.6.2024.11.30.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:48:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bhupesh Sharma <bhupesh.linux@gmail.com>
Subject: [PATCH] dt-bindings: Drop Bhupesh Sharma from maintainers
Date: Sat, 30 Nov 2024 10:47:58 +0100
Message-ID: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For more than a year all emails to Bhupesh Sharma's Linaro emails bounce
and there were no updates to mailmap.  No reviews from Bhupesh, either,
so change the maintainer to Bjorn and Konrad (Qualcomm SoC maintainers).

Cc: Bhupesh Sharma <bhupesh.linux@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml         | 3 ++-
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml           | 3 ++-
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml         | 3 ++-
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index c09be97434ac..62310add2e44 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm crypto engine driver
 
 maintainers:
-  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
   This document defines the binding for the QCE crypto
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 8b393e26e025..eed9063e9bb3 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm SDHCI controller (sdhci-msm)
 
 maintainers:
-  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
   Secure Digital Host Controller Interface (SDHCI) present on
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 0bcd593a7bd0..f117471fb06f 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Ethernet ETHQOS device
 
 maintainers:
-  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 758adb06c8dd..059cb87b4d6c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm SM6115 Peripheral Authentication Service
 
 maintainers:
-  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
   Qualcomm SM6115 SoC Peripheral Authentication Service loads and boots
-- 
2.43.0

