Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4E3D7D81
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846863; cv=none; b=cqmTJp/yInwps9H8UejBfwwgEMQ1zy3GHNrlTdw47O/+jZUjddm2TnaeI+OFYBRjfCmTdk2niWU3nkNJZryAvdIwb472MqkD1aBzC9H5vkdKJP4QDvWivF/xvTeGpif4aePtSKtMcPzyG3iprGx6eswyvkh+S2oefI8gMRwhbI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846863; c=relaxed/simple;
	bh=lmYPucQZDJWxhd4ULKfj2Y/9tl9apl6fEaECLmkHdew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCWzzq2kWSV1T4rmhBIVMgHVg6RNk8gT8o1tsq2XVTmD3JF5EGEhhvjWk4N655zfcqCL0lyZ7gvWIycgEXb78Q/umaFYUGwqYBDumJ1ACjJN0pO/ZYmjaSpr7V7DVRG/Pc4IgdByK5sD0enidCwJRi0UFZzMWnzNFa/haCrOdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RCyXfKdz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RCyXfKdz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so23791805e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846855; x=1774451655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=RCyXfKdzlUpOzi8YPODlDrQqaKwKiAeYKjR3bWm6pxzKf25Mx0Cm4Qjfb7pGmvCBcl
         xp+XL90CwQeX+YTjOgUVeBYTnhZnkXhkM6b1LfhFbeB9N6LwT8HTiFwjQixwCFkKVWAL
         2vyE39reVkl6qNUychxOK+Pki3vIeK+tsJEHJTkWQTANiaUTdROXhRylXCcZnTMzuLcJ
         ZUPB8EBqyT4u+bvHmNoguNR3Jai/2XbgG2UjQZg5t8wWpKfNG37VHt4jCb0fEKD8Hh74
         RhaurwP2AGMjr/lOjAmKtvP3hAR+0u69MOLWfvdRxgWNLg4F9Cpes5sG7XCczE/VGVic
         rVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846855; x=1774451655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=DAQyJvCrfWkOxct5TtUAdYu9DAoCJygP+Td8sDIlPwBJA7O3Db5Gwx9AlwDeUGeHa9
         B2J5QXwFYKtAVwI49+kRDTxmbygQjk8rs5OxjQYYaehNw4IxjM5ut5hL4cy5BvfgyIPH
         2ip/AfYGFWCyJKKTB+y0FLXYEnRMbRwQCZ9xPEBPe3jCN3WczqDgli9TEJdiUdgJIrU5
         kQXN8jRvQzfaZtK62WnWiul5KPqVSd/Cr17ILlI8lbIiP6p1mLjTrpTRkh90P10k55BC
         wBlzr5i3hotG3xsXtev8KNHjJ9g80BTy3v7d3wl1iYrij16FwkI+xaKsJaGTgcgpy6Hp
         yb1g==
X-Forwarded-Encrypted: i=1; AJvYcCWJFpKef+KPWk19vqN2MlJz/yxG3gC0/Zbg9R/hpd2chuPgx3Jwg3CXxjQwmN3Xcrc1jdUoWV5lCg56MCueaDdF@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsowGVEmmYVSINSYSG9MdwBp7PR2ancyvCF5Z6equPKkEP0iG
	UTBFFb2cW/mbfu0COlyy4P5LsWdWP08bPM2k/Ftdsvf/0o7B7wEmUbeoYn9hoxNniiQ=
X-Gm-Gg: ATEYQzxMABgcX0PMmjqY1Ox6WtF7M7y++++t5fELrBkY1LAa5vixz1kM/Nis6g6zS0w
	hTqe3FupfE2HMqkN4NKDcoUCz5zW0HUSPDQ9VNv60SCFV5JO8LYaDyGIQKhDqiduCjt6z+N4lEP
	NFTijyCfibj1BCOVUIy9JkkvICzGZ/bk0ismvBouWCUdfJWXb8lAPvQaf/Cc5NEbFzOJ6MyCIvA
	J0kU2LasncPDjmmB3rszhlPBt2yx6oH/Qq03VjPSQjX51O9BmeyXumyHaavkfbXwcZ9QVXf4IJG
	JwKxcaWuETQLYjTcT/uNhJapVoU1JMeosHmcf1+dngJ/SOhMCd9kCEBWUihTRXk8dmcRCFsz4MK
	gAmYlnRQYi4OgpOIMLyn7ynVW9XKO4zYZOHmdg/IFJJDX756JweNQpQZcKIlGcBOWS/OlwEcJPM
	N7uFgHSZrZydOfc3oGu1uk
X-Received: by 2002:a05:600c:4ed4:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-486f4444050mr65455555e9.22.1773846854673;
        Wed, 18 Mar 2026 08:14:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm20352005e9.24.2026.03.18.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:14 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:07 +0100
Subject: [PATCH v3 1/7] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lmYPucQZDJWxhd4ULKfj2Y/9tl9apl6fEaECLmkHdew=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdBwUNnHfFW5ryz8nee5vlorcu+/MYWZ3wJTs+bb4ge
 vCW2wH/jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiISQ3DP70akWNfjFSfG503
 qEt9X9gpYfWIwyFUTa6hlj1PY9c3aYa/AhNO8xVK5F6q4FlmtNds3YL0olg/ubsb5zksyC5QMfF
 jBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split up the region reserved for the firmware image in more specific
sections to expose the full fixed layout. Especially the LPM metadata
section is important for bootloaders as it contains information about
how to exit IO+DDR. This is read by the bootloader but is written by the
firmware.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a927551356e69d3961b3c5c6b72d027fabe83d3c..15e0286e4926865d88b693998e5aa64543ae125d 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -154,17 +154,26 @@ patternProperties:
       memory-region:
         description: |
           phandle to the reserved memory nodes to be associated with the
-          remoteproc device. There should be at least two reserved memory nodes
-          defined. The reserved memory nodes should be carveout nodes, and
-          should be defined with a "no-map" property as per the bindings in
+          remoteproc device. There should be two reserved memory nodes defined
+          for the basic layout or 6 partitions for a detailed layout. The
+          reserved memory nodes should be carveout nodes, and should be defined
+          with a "no-map" property as per the bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-        minItems: 2
-        maxItems: 8
-        items:
-          - description: region used for dynamic DMA allocations like vrings and
-                         vring buffers
-          - description: region reserved for firmware image sections
-        additionalItems: true
+        oneOf:
+          - description: Basic layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for firmware image sections
+          - description: Detailed layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for IPC resources
+              - description: LPM FS stub binary
+              - description: LPM metadata
+              - description: LPM FS context data and reserved sections
+              - description: DM RM/PM trace and firmware code/data
 
 # Optional properties:
 # --------------------

-- 
2.53.0

