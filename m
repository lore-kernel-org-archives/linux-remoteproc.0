Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D3604CC
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Feb 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950541; cv=none; b=FtOXMxqH0ikhIS6dqzZR0hbf5/3cRHN71Rjh3RFjWrraf+cwEZ+1f2IJLZw1wIUZZF+2Zydq9sVbPszZcJQ/aNqDNXL99l1WaNF09TeIC2ahM37NbeQA2d5+aQ5Ey4tJoVVuGvAEAtm8uCUIg4hXKJ/GeUxYI8I6Rwnz2DtYLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950541; c=relaxed/simple;
	bh=60//XUMfZ76Nh6bqEO3zLMyyLkjiyM71acrIwzF5ypI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HKymtIccDDxOT26tX859499EKpHtUWb+OOHgb471CKPZuN3RqSycOf7wGhcLd4DG1BblPMdXdAfFi/5FYkZoZP/pwl2ooLKW41TPby8blwn1fkfUk2HMAWCyi+7sKn93l+tmGDSojyplkzwpi0jxZNf/13++VnUqWhfqaslIA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXT/K73t; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXT/K73t"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a43488745bcso134299666b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Feb 2024 04:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950538; x=1709555338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zh+/RCKjqlmGphkaMQmnBQf7xeNe6+FLKo+we5BQZGw=;
        b=jXT/K73t+U6tStth3htUwg43/+e9AErItutRcMPzaHXFUblmPnfhwTDUEPUqzilkKq
         G1pAHZDGURAeIF3ggMERJ8meE6PCd9Fpq2DYmOdr+yRYCee3+DyZH/DGpjGRcC8ILOO9
         YgjdUNzJvNWN/mc7GPM4+if/OsIZjDehkwzQaIe0LLSCAB+CUHo0hwqi0NxsT1cOExF1
         +Vy0CApXL7MZUWRwtMLL6drk5isuPgM2a72yuc7zvN2lQlDiMEGrunceima5Ri3X7JIf
         LVCgZenY39x6RQlcT/rNIcsWI8eGHvYdMbqRET+i4DMXF5P9fIS+rDJuS5cJZSsJPJ5E
         KNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950538; x=1709555338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh+/RCKjqlmGphkaMQmnBQf7xeNe6+FLKo+we5BQZGw=;
        b=CtvZPmK3/uNqyv/4TYhJBILP+ZjSaV0sXk/iIPAdnacJAjJWyhstiYem0KYxabCnXm
         zCWxvYnR4gX39g8jljoVDfNcmBhxCo1z6BjrbWp1yKYqMa0yC2d5M4NVQtypwYzqhxoS
         0k2gvCN0wVlazowDMpHCRFORnE8UM9vUKwsE24y8wZzppWx8Jk+I724f6YZ9seG/UBsx
         BkXIrYeOEgWGqkuIR9domMkISNLh0qEuoN18/5VgFsinuDy1TdteK6SSYycHYfIHVjON
         Wa9w9Z/1XhIxWtCsZ7v3ZW+IlVedjVlNpF449LLHGr8FI36OkJrtb9uYkJYh7kTE/ieP
         TGaA==
X-Forwarded-Encrypted: i=1; AJvYcCUj/0MIRlGcr2y2AKMWPRVJx7uRt8PucK3Hj5oXw+fQjVDvVHHP+vThHsUCjxu9NTUImHyx5c0785LWjUeGYPwq4wzjbOIqi4MJYsS9zSdmvA==
X-Gm-Message-State: AOJu0YyCh9zRn/cKfSUbNAu2/6orpyUvA1rCFQ4MpRAgrWH3PzKGTESs
	Y6fW4dv+M6DOjV7b4luSJcj2JYOuOyK4noACRj5XGRGWe77PjSBefcve7xF/HSM=
X-Google-Smtp-Source: AGHT+IGJflBwnkc8vd71Co6kRAm4WJGoXl/qpscO8NUz7R0TYuOlHyOJufveR7aHg5Jcx6N5/IA9IQ==
X-Received: by 2002:a17:906:46d3:b0:a43:8916:15f0 with SMTP id k19-20020a17090646d300b00a43891615f0mr275324ejs.64.1708950538058;
        Mon, 26 Feb 2024 04:28:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090699d000b00a4330ad159dsm1340882ejn.179.2024.02.26.04.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:28:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,glink-rpm-edge: drop redundant type from label
Date: Mon, 26 Feb 2024 13:28:54 +0100
Message-Id: <20240226122854.86197-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema defines label as string, so $ref in other bindings is
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
index 884158bccd50..3766d4513b37 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
@@ -18,7 +18,6 @@ properties:
     const: qcom,glink-rpm
 
   label:
-    $ref: /schemas/types.yaml#/definitions/string
     description:
       Name of the edge, used for debugging and identification purposes. The
       node name will be used if this is not present.
-- 
2.34.1

