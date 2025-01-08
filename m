Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4391A23A7
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jan 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337749; cv=none; b=frjNoFZ+95kP2gPSfGpuMZCeMya4u076HiUPiXjPtxT3Xt1TRp7j5i2Tm3+R55lkbdZjr9Ba8GierA7ktwZVBn1bCOS0XVrd1PhNCALQ90SOPy+0KXPp0nUA1H8uCq+tkWznH00lUXxuRk5M//I6VzVD81ovyzgJMi6PobezVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337749; c=relaxed/simple;
	bh=piZ8Qx7Zly2LRu7vla4X/tFQmM9QLWzUUZoYM5vZihY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8wqBNRH5Gy9KjvvrtJweCFgNoKM6CpZvyiJlkRP/ewSki9puPI1BySPu2L+7n7QyX13plHH9wlIlAJpFhxI6wYS9+Nm55a4Xx7v1UW3AXub5k92HJrR0EUeFh9UBJZPacnul+01schh1MNDu/otj5zKsCM5lbBln12wC/mmCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrED4+/S; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrED4+/S"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6647a7556so305969366b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jan 2025 04:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736337745; x=1736942545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=xrED4+/SZ1gSIU20P+rL3SIfg5TBM9Xb1B8dE1HPEZDia+Bgw86PJAIh99RN8CsPiT
         hFDEXCEPBkXFurZeyx55BfXvQpBwHTOh+TXSAKMFNPNCTRGHHovUjcgFRql7DsOO5sd6
         9w/d+u6ypDsG2CawUScmt+EWdaM8+5aYO47taPvPphBthO+tPxljI0wnQ8k4j6oNgvuH
         46GjhnWnRB3lf+3ub37KoD7YIywhe8+Hl2ATs5DYUHjTQK8JveF36bIgvMBZEc9D3shd
         7rOBK2a6zCP8hRHCTCzHXX3JumuRHpB3kSGBPJiSHS1NnWnzQSLU2pdfmWbtZ4RcUh+1
         S/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337745; x=1736942545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=XGDWcN6ds2nYqOb4jz9O8umxHkr0fe5bG2l9dQwudmWu/++dVOFftyhdr4I7CNS+UP
         pYxB084evS6NXHE+XCkcNmoP+S+Y0J92hqU2qlD1SEEaiineQClTdVH6XuhKqD2VtVG6
         hs4btXPIN3kZhiG3iW4W7UHB+blvS5TEyFoeZcQfBbu/xfaNxEjeTfYEuK7sjX+WImVS
         LM+cqncCh4sbw0bShjWpglRu/ZtaANP5UpZMWO8VnczidA4uWPLDNtpjuqyC5o5P4D7F
         60Peg49IQiRhFJnIsCjAQV8L42eJMQQGb0WjUqdm7EbhOycmGzov1ukZyM+eenod0qhi
         1k8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPYfUd7EYtgU3l0NgbJGnVPvYGlzYjMLfKtWB++THnhbvbMc0fZp7QFF7bqhJjHWjmaRTHVb90wr/0++uad7iS@vger.kernel.org
X-Gm-Message-State: AOJu0YySfueZ5Hq8HIbnIAKz+8jyTywExHb9sayy+CxeNnGeVCKFg2Ds
	lazQLmaxVCoxAhqirXyBei6a0IsI/qlkEMvlQGn0BMTGSzjXRNO+DMgTJ8ZeXqA=
X-Gm-Gg: ASbGnctUbbwnQOwRiiyPvA82au3OXo0mdbmUN0gKSEus1OLZARyhB6NKNA5jeqXpU3K
	fK6F/pMURur6D99F3qYOei8ujfqYyyjWhhbkTyckZfLLW9iuh84mC/0bSkNOqbwJqDa7+W6WLiS
	vKhAcPjPFSYPkdxbTzECI1UaXXMkcA7pY4MvKuXR8Y1m0YZVvVmCN2+FqAzyddUg1TMgqwdeKRD
	aWujNrySH5nZtwu5/+izn4D4QBEQv8UjmVWXs9oLHn7bu3k0GUcgv+96otWfuKPJr5wegE=
X-Google-Smtp-Source: AGHT+IG14SO4FyYH5nxT6SXtwZsRRGbviya4C+apjniEiW8sCLRoGXllxv2memRQQkt69l6yOVo/tA==
X-Received: by 2002:a17:907:2ce5:b0:aa6:6e2e:b7f with SMTP id a640c23a62f3a-ab2aaaa1b60mr80725166b.0.1736337744865;
        Wed, 08 Jan 2025 04:02:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f828sm2482031666b.19.2025.01.08.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:02:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm6115-pas: Use recommended MBN firmware format in DTS example
Date: Wed,  8 Jan 2025 13:02:21 +0100
Message-ID: <20250108120221.156131-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  No functional changes, just correct the DTS
example so people will not rely on unaccepted files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 059cb87b4d6c..eeb6a8aafeb9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -127,7 +127,7 @@ examples:
         clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
         clock-names = "xo";
 
-        firmware-name = "qcom/sm6115/adsp.mdt";
+        firmware-name = "qcom/sm6115/adsp.mbn";
 
         interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
                               <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-- 
2.43.0

