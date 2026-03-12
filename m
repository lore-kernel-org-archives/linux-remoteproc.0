Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4783D7D9D
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330615; cv=none; b=GQZ8HpCaMlH67dLGiGGq+w5ju55IfnG5FDf74FFZ7jhqGUiMp+QZsosZPhW0XFgU4tq3lWMJrAX/5ViioEFNxcyScrJM1OnjN7DoL1COfcMKT6BeFcMasvwiJHR6+AqgR7OuMBr1GCI7ZR2Gm8O8/81jf1EL9CWuMaTY/SusXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330615; c=relaxed/simple;
	bh=lmYPucQZDJWxhd4ULKfj2Y/9tl9apl6fEaECLmkHdew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbEHOFHi5zNl5xDaECsK6o3Euy/23xNoWrZwDy/TVQUfPT5Zd8+IQwkppndyjLLfbM9to/hZQt5oXvvmfnxpbnG1LCMSQbwbU4bJMftPsYm/qAgIhwa6n2qpQjcVq6gGeCjB8TT74x6RWu8yWwDX5cqc9swJd8f5H1MzDtbAAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k746mMO0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k746mMO0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so1448170f8f.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330608; x=1773935408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=k746mMO0mYH9ViU4VMprdOcDvJ/EOTYD9cHyf3YRRdJbiowBNW5MRK8CJzdO2Dke5/
         PtJkeODPG86E1Iec9R4LL0jpX14QCT84AGI+tc83jfo5SiPMqt4MUeG3OGaKkq9cXUYp
         tPzrGvNxzA17koAOtsM9ZGQONk05ctI+x7GNB4uXFiNCtmY7m/3FeVANIVxUFAo54ZKz
         P347qsJIgOZbGsMWLbkvCnubehT9PuMLnqmGJn6PeZoeko8qDMF8yAqs5Jzvv4U/OHwC
         UrD5SHJ8KXw3NZAv4WmJSVv0mjIMO/6CbtDSfX9ibrO8vyCqmJPpNAwYfxrJvQYFMajU
         9f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330608; x=1773935408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=Yl/gkatkpKwOLWiY5vT5aIeIeCX1tYwLFXwZTqD5PhiDSo86lDon/k7tJaMM4PTgGq
         iBUCUM9+FxYUXGTSKZ3vr4KBEmlDbJJi3YAuFyWzYbVlOnKb8GlG3QaIRExp10s88eXR
         x25mUc3fhZDTqckaAgEapOHxNBsUJIrl6BG/49gEPb/yJC9PKDlWshVs+qo2l5GMFMKW
         9ogUT2l1NJwcnFVykESqkaE5+7sBCvwhXYk1EpEl/s2WtbiMoKtG2gI2RzeDKgxDFZuC
         xG+3p7j6Q4fDtEuJY2FuCpnd+c+qIIIsypDysSajfSA8/7GpkNwRJGlNdHj8RXEk8PfJ
         Ik0g==
X-Forwarded-Encrypted: i=1; AJvYcCWe84iiA1gae17Aou8tOHa0WkDvM7A8GNOd3CO00uL5pZKmPUOmNt0m0ss8dWSkHcDj8CYNZ28Bn6MFRcrvPC5g@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNyIEweXO2spzE9JHz0G7CinuF08siOLIPJ+bl515p94FxqJt
	fIfOjq8FgtsTO9aqOHcPpDU5C3ns6+lTNSu7ul/H4IsUV6BYbnowxRPKPxXpq6178i8=
X-Gm-Gg: ATEYQzyNyDLcAFWTUUVRJ2iwXygXTbMF0uFYUVdEksYaHpMrZ58ufLSc20YeFrtZCeA
	AK705cqcAbD0QNx668iQBnRgvgpT3Xatg6oHLmgUpTenOJiTFbPolYyKYRknpQGNlSpELUB701N
	RAcLi5XLE0R1GF/By45S7nzkVFf+TotN5DQ9U5UvqGc7zUH7kpbsawiSwgjo/kfrteB67zo4PdA
	LBXmPJTDC3kxXTLjofXCqHMaEEQCqhX8FE4ERsc8M5NgRS5Wr1n4xLMbsGqdDexaineaK+Rj/v9
	dmdwBSqLDj3l9r41gQE90pJK+RJ5NyMfzAiBOO5Rm9pCKSQVeSyxYuiVkFx07S9dK6V9Y5VN6au
	YCt54cm7Gd26TM5jbnL5wOgXgMe7h9ncFlJlso5eibuwDjPYZimB7StIv0jZ5dQkEvzWlqZ+g80
	vePXZqWfcDHI6hJ+mixDkl+WUZlKXQiAs=
X-Received: by 2002:a5d:5a02:0:b0:439:c4f9:31f5 with SMTP id ffacd0b85a97d-43a04dbbd96mr248779f8f.28.1773330608031;
        Thu, 12 Mar 2026 08:50:08 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm8306626f8f.10.2026.03.12.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:07 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:55 +0100
Subject: [PATCH v2 1/8] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-1-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lmYPucQZDJWxhd4ULKfj2Y/9tl9apl6fEaECLmkHdew=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxNDwoj4g7LHZth9f3NhJNH/E6+qJgpq/HppcgM4Qud8
 5RqwiqSO0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiGRMY/op23Prz2qslMKom
 uemGOl+N8vZbk5h+C/ZNdP5u/I6hII+R4Xk7p9cuN2Orn3mHsiZYVvBVfWycP7lc/tc0E19PjvW
 tXAA=
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

