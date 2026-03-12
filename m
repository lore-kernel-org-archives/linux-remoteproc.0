Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EB3F0AAD
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330621; cv=none; b=APHusl0JOfGcjkpcG/v8Xw1UkrqoICJ9sd/ahWpb+ccH5o0Xro2g0P5fnVBlMeMzwjnPKoXfOSJRBhJF5nkMRYj/TqYme9w6sLhTkvnNTLom21w7w+0uMSZCdDksA/CMDBHkqsNtVSNwADRvyeEU7u99NKKASwCYt5fL7Lp+lOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330621; c=relaxed/simple;
	bh=CbhB5KQ/eIbZFKfZzmUbhzpOi/+XnjgwaeHVx94tB9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5dRAhisrzuZhm5Vr9zpaHMk+MceiBy5BaosFdcdbHjQ1Wt5c9agSF2D4eVgi+np5yAmSjNu9EhAmXQM0xvSWXQ6O39DxirAGDu3S2sGZnPaAit0Vc4zXa4OupJJUtlO7xtqzS17MXiuaFELz/LVZw7bPCotCA6m2RfuSlITq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CfHo8+Xm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CfHo8+Xm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so9936625e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330616; x=1773935416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/f8358XeMqcTwt08gbPmPnqpZegBjCDtTpDZQVf+oU=;
        b=CfHo8+Xm6A35aB3VABh6RHePecCVpWT60eN7eNxHJ+2vqmgosHPdYw7hJDPbLbDWL2
         7m7penfHoyEo01ePB/8dvyDMOCjyRyFuvIh5EmAF4s8oJJK5RCs8PeIm9bRt1BwkhvsK
         edlr/5AMGGZPcYJwzH1vqlsEHz1HHq8VgrZ5QPLUxAGb8mlOBh3inb8boQSnHwA+2is1
         w0ixRKnb/+GnM+4Qz5zkl+mOUl0G2kXv6Hr0nT9UXBLz160uO8HgmdkCOgSWuzWNwIvB
         JuD+Y0asW7hon6Xf9/GQDVQaI2Be9tdEENbLN01JjUERRYwfe7lqMUeUAGaHBceh0loe
         M01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330616; x=1773935416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/f8358XeMqcTwt08gbPmPnqpZegBjCDtTpDZQVf+oU=;
        b=vjsX22lJISo9ufaeCphtAU5f5ZQef5yfX+zt+5m3uWMjKGKTe1T27K/lG7EWdlI2N7
         eVWTaQiuCgwhABY2pLq0CYwKGG0NYQ2d+J8fmGVyYuIlH+FV3y3eUwZwjF/+IoMDjTAU
         tSuKQiXlbDGqdrJP0vrcgBlem+JOO5o97mP2zVk3X+jMqflr+b4c+JzGhmobWsVDfvGH
         eu6JYANFCGDgPFwg7/dyjOgJaLiNs58JwBxArla9gFbsz3jg97Hxk9zaM8sS+1q+/aMY
         f/FWQB4KCHqV7nz11p4ajeIKOy3XopPglkBggVI40i/RwwLznngR1ft7mCKOeJ7lNQdb
         x+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4CPS4bxIbJ4yWDvKvgKyZDqkHzHh49WXu1HqVP1OH70NHc8UHhvzfG8dFBNXV/VwIM1s/u/5EDW6eBWYfSeTV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lBxmMvN/u2irJEobIAJE1TvxfbGLJxAeo8ikDmkGS4CEZeHK
	e1t70zep7k4v+3AXkoAZpAmvQliqWTNHVVXjsB63Ie4Gh/IUKk5Cxbdo3qGFdE6vx10=
X-Gm-Gg: ATEYQzwkIOvJJeS3Ojp82rAMt/jpGUm5MhFXYJlFSy/IzrU4I+IU0QcRWKYkTWBGXpu
	T65Q2r8xT2uzlHapy/9kyx7jgVHkCRSxf4ArOkJDoWlNjwzU/z2hpGZCEqdfy+tYfoE8S36WLf7
	dUZ1hEdZAXLRgx1jgKm8XQqnw3ViWA94ijLjsXgNQmYhDPOKDWQMsK9a7X4ZHVfkUl62mKyEPwX
	9bX7H2Ry/GBvblFRaaAnmJC4vUYwIGfY9bMbG/io2x8U7I+WH3fIe7wG7uTspQmx/MHYJv+si3d
	OE5qW6t2J+mBvsi3nQZJ1CDHVZkTuqbn3oZl8xRUGrwE0VkH+S5ChzxE4j0+xF5gpuVIPlf6Z6y
	3u13keVQ64rSeoFHF4vJCC7OU5ntEhBdkYDV44/x0dAL8BlX5G47xdjaNd2lBBbnqsOmSnCiHJd
	ioW7Y1kSj5lod5n06OIDw8
X-Received: by 2002:a05:600c:46d3:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4854b12ce6bmr113978785e9.18.1773330615796;
        Thu, 12 Mar 2026 08:50:15 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361187835e9.2.2026.03.12.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:15 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:02 +0100
Subject: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CbhB5KQ/eIbZFKfZzmUbhzpOi/+XnjgwaeHVx94tB9g=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND5bypN1LePRk39SmSqu+s51n9xh/ZjRVYYo01E1c8
 e3amm2NHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARHy9GhqVGib++dapanHe1
 3Vr165X+ZLVrP9JCrtoduf35wRLR+u8M//3OKt0I0EmLeeR6IL158/bzk7RiQ68Yd3xX2MRxu4b
 tPB8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

If memory-region is used, require memory-region-names.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 3f2425e0880f9a516ac10700a218ed035ff07d5a..775e9b3a193878349590c5036aa884617ebbcc9f 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -245,6 +245,13 @@ patternProperties:
       - resets
       - firmware-name
 
+    if:
+      required:
+        - memory-region
+    then:
+      required:
+        - memory-region-names
+
     unevaluatedProperties: false
 
 allOf:

-- 
2.53.0

