Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354F3D75C5
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448836; cv=none; b=LQ16nCKyiBudSx2a0uYPc738Uwgfnjt5FKUSZRzQz1+AATHm/hMbRsHDBK+ibBZ8Qiec5vjQMmp7x753E54IIuUasCcOSqKTtLBBrp5mqsGM9wed+hksbC3SmX9uDJ47SL1zAjh/Yr+80Y/i08TGyfPDrZE/Eq2MVZL01KIJNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448836; c=relaxed/simple;
	bh=B23ResA4FCbRNDuiKc1eQnBqPU2ccGIETUQQXvU6O3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSL2We4C5rRP7y8nQjyhuBcOFGGJMfAns3SEDhb3nC75G3BjKo5hbUI5f3MzVMW/cIbz2ZGsOdLyGpZAIkY88o31pgww643FQP9xxpLspkkVeDKZJGiltgy+qVMbu5KbUPbHzwqgA9oTtnxeKfH2i15yJEUe/ecj8OsSg+iBqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpvylxgk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpvylxgk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so99300305e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448833; x=1780053633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=Tpvylxgk+lnULe55I5JCzKaYZiydpi1+xmnK2sywLTUOpb9v3E5FT9gXRrvpcrFHzu
         uUQGZHickQR6e+UYd3JSENkA7NCHQXbWFzzGgBetbPPE2lA44B7syWU4JIVu+ysjc7gP
         7ahxF4VxRLVsyANvlEKcCjqfCHk1jWAjTvedYeCCRLy5EcsHjhznJ/O/w+IDOoie5ufs
         DlQM1hGfGxn5xvtCMghOQpPOtOdPwiw++tu2PuIbx2pTpdKm7VogMfb/gqUFKo8qfzZi
         QCwUgcE4qCcu1b7nKQmdQkNeGHpQMg2JNY4Jwj+Q0bvSOpn5UnE01Ak8ioaTYutnnpsn
         QlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448833; x=1780053633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=eNGJ4OLgMnnYM4aNVyydjV+XF1S8UBbG1t8QUOugn+6DeoOKTvEKFDXDLYwo8MIVMV
         J2FUnucVAaYt08iP0gvmkydTO2vs+NCRImjakWMpo0uZHjnPME6zXG1kjFDGb57yQnZb
         RsZUVukgFWVjXvgXG/6WiJZjqw3rgen7kjY2brSjuPrWCfhbxkfvqaXm4xXb1ZrnJ533
         cVIBt7ibToV5dh8LMStq7suW4aohzIcISz4nkkxbsVrbj8hU51AQyI9svGPxJ2CvmoYQ
         0qxMnmJfWyoMJE0M7hLS3GzuRVbSrdm6aHZM/XtEdIQ+aRZy1uybcVEXpVAb4kyILJXE
         chYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oKu9OmD1ihJ550pHkHT8X4u2QBave/PEGih+/dNmtvMJGlmHbkxGQ7p1pWqPNDp2+Ujy4pi2ongU0Qvi8jPVx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0VHtSWKAzi5MEFLDDcRrUj7eb5YtNCVRbNXtUs74wLQ67txK
	tNJ/7LHotXfRuv4McmukHX3SgZgTK7KXdddEEmAXdbEFqoUgc14H94Fl
X-Gm-Gg: Acq92OFHETQJg7gf598VUf+QpnNfAMKlb4t27rrEjOs4SHYv1THDUnHVOVUs0XYQmhU
	E6IpfjFKfJgvpAP6VrjPHslOkJ8/NqAN/KEXTfls68kdnyt/FINPfBuxE5AHDgo0wPbpghMqffH
	4hVn7YURuP1qmuQq6iQJOsCQkzQd3tXZx+wGu4Cc7P0z7cn4zhk1d+VWkuIZHw9VMzFQVq1NGGz
	lKtbHNL8Zjs9lFVdx/guMPQvfDG0WYcerMSBaoYnWJfyUo24yxdEgjUs+ss1HX+tsnIVyO2Cfg0
	DVStZ7+wzxIkna/NmxkStyfEGR1JyUjMdoRL0k/7ppN8aEekM/gEbSWlm0bz65FgnGMyBMG2BCp
	1ptkmYoVzo4AGWaz54gGZwp7Agj3sb2Nga8dB38dCDI77D9t1zIc4R3y/fQr3tTPPFvHAMgPLNp
	VgSoB/T9wgD7/PaDxo3RB/MbTVpr6VDmqhgSJgshjcdiWc294zcg==
X-Received: by 2002:a05:600c:a106:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-490426dcb09mr29669825e9.24.1779448832493;
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri, 22 May 2026 04:18:45 -0700
Message-ID: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional "memory-region-names" property.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..6679b10f9da5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      oneOf:
+        - const: rsc-table
+        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0

