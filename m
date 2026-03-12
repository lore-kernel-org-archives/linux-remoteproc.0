Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD138D012
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330615; cv=none; b=tI1y/iXp9AgYsTmUUB5Nn+oFxn67l7YEvZa6Fi8BtOTWdqOVE9c9MuruiVi8xAuBb94VPSZiockUeQDFDQ4dIY0JNX9Oj7hfwaPGHv71WOyRtfmwsHrgCgHhrUuWpVlXjTJSM6aWXAmTpcd6lzqMciKKw4JSSzPqkl4jt+OKNGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330615; c=relaxed/simple;
	bh=QkpJrK0sLsXaJAz/NDwURnTrDOk9cIBtUwllgV38WoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbjaRJ5IfW4dt5c3kDnH94FRpEv0MoLU8PS7aBXdNbEpEZBgP/glfQx7vjh6BeVasV8c7zBGf5lKxwwEpwJYGNL1G//ARkfNqph1gS6PtWn0N+n+xkdqwe2ZF9I+mccG5IYOw4j5uXkIBKNqG15e7Ebn51WbckUIpBYrGfm7axk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NsAvk5iW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NsAvk5iW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso10138575e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330609; x=1773935409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Der2AmEZNJ0NJcW9rSc7hfAjH+ZP+A00AJ4yvvTSgOc=;
        b=NsAvk5iWt42andF0Kb5OHlOY2cADzb45T/7cmAyEgZ4JOCazcshFZjHOg9+lnVSRfD
         M4CDM/rzmlYJlB+BhZpw/w7SSIsfHziH3mdH6zrzJdoHbKdtBt2WjPZGqyZFUop5jvyT
         P/QGgixeOzVaxSvuTN5RYTgeiND4Y/ODhWm5vsvvMkFP5Es2zdnhEu5WmoAnX+XrqV+X
         wFojNnNnciqr+F0ycBZ3FlCmn4pNKH97AM+RVf41WvXOaSQvOOrrNERGW3kH+ZGDoqRq
         VDZpUIbB3+XD4a+NakSyVidpQC3hbaEFEGlOyDTCsVq9opN/eLppo9uNAyzz22joeuUd
         hjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330609; x=1773935409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Der2AmEZNJ0NJcW9rSc7hfAjH+ZP+A00AJ4yvvTSgOc=;
        b=WJFOmm8Vh/2txo8qVB4NU2hKSNUJPNx7pRpFKEglGJS5kKbQfMcG8Cz7yLSFzOamrT
         Aa9Z7vEU2b0Nx9WGQvsP4wLMkC/PVUz6qHOZRqNQPh1hCgDlBNpym3TFb2AY6fnQEC4R
         hImPSliqZxs198VX2BLZzSYihVrahK8XHWHO5WncGZv9l4Rojuv52MuV0+aXYrZPpAlj
         T/7kzLKyS/fglPik2tUOhyYxnlBTLj7Wc1z+jBaewTAePJUyrAilX+x2rzsbv7o3UNl7
         Ou5l4R8JzzMAsvFOEQhRWVuUzNo/yMBLU5R9nP3kHNKHw1QVdOGZ77RFIYclB7d5aBzH
         FCbg==
X-Forwarded-Encrypted: i=1; AJvYcCV+pBFc7VXqVES0IiJ5aBqNWM+aRADsZ4f6YlM60EwWoNHMBEpGsTN18Vdzq2zwK/ELHeTN8mcujdlIXR726qAa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3koggTlnxVStrhTWyVipRV6sfD6kAR0/6uLgHTCrh/Mc1p9Oz
	ByYhNetQXFrSfmC3CzO272ogjvNJUU1CVfYwH3AdgDZPm5NQvrpo+V31dmeFDHGnlVE=
X-Gm-Gg: ATEYQzxb6noQgcYS6E08AiOEKqzg81sUOErhkBzS9HTw0lCiq3ABNNZWEGovUvJ4KqG
	9Cs2YHTIeu+hjDESGS8FNjo3RPPBAWqsU/4foNPybTR+SkxFb9qpHi/Y2gEksuDEwl8mFpuwyvv
	KIrFAOx39OdaQ/PWYGW66t7A7lGGmJuidMQuykicJHjwtL6jzC/zhOodIO0l+mO4vyartQxStAg
	xZcv9RfmdADIQiBPCwOpYBhU5ZLh4gLyCnLVh9u3rgCAK7nvfEHxf7oZmOyvRAhY+rZv3/BbXhy
	bh5wyIRQsP7eR7RqejRCaym96lR7ouhtZdRBemLDIV2UY4ru2OOZ/tcd9rteItDUAy9VnPC2ZYF
	MTh2rS0pBXHXPe7C6mA0p5YJiVHTUoLg+fe6Sv5QZB0l9zxZ0nDdunnK9thDarxZUrYLAwj6YK3
	C+pSaqH6G0upPW3UxxuWcy
X-Received: by 2002:a05:600c:1554:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-4854b12ce27mr109865955e9.30.1773330609205;
        Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acbbsm9721577f8f.2.2026.03.12.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:08 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:56 +0100
Subject: [PATCH v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-2-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QkpJrK0sLsXaJAz/NDwURnTrDOk9cIBtUwllgV38WoA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxNDyoyI9Mi9yr+MDBUsgl6cdb0Q63PjGuG4luMhJcdd
 TrZdf9mRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEyEOZuRoePCtxtuKdIVr+eI
 unJkSYloykzkkliZ89m0IVZLxO+HIsM/+3+l01ILbRfe9VkdsnK6Ux9/bfTKoqns4oIqy93K/9x
 lBgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add names to the memory-region-names for easier identification of memory
regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 15e0286e4926865d88b693998e5aa64543ae125d..3f2425e0880f9a516ac10700a218ed035ff07d5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -175,6 +175,24 @@ patternProperties:
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
 
+      memory-region-names:
+        description: |
+          Names for the memory regions specified in the memory-region property.
+          The names must correspond with the entries in memory-region.
+        oneOf:
+          - description: Basic layout
+            items:
+              - const: dma
+              - const: firmware
+          - description: Detailed layout
+            items:
+              - const: dma
+              - const: ipc
+              - const: lpm-stub
+              - const: lpm-metadata
+              - const: lpm-context
+              - const: dm-firmware
+
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:
@@ -330,6 +348,7 @@ examples:
                         mboxes = <&mailbox0 &mbox_mcu_r5fss0_core0>;
                         memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
                                         <&mcu_r5fss0_core0_memory_region>;
+                        memory-region-names = "dma", "firmware";
                         sram = <&mcu_r5fss0_core0_sram>;
                     };
 

-- 
2.53.0

