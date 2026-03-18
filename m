Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D640D3E558D
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846863; cv=none; b=ttFRLwXkOe7wv/b2jio8rSwU4PbwwdKVnkKqpu8rxUXrPeo9ESQNc9WrDDX5Tw+uNb1aWB44WHsT83cjq1j2yQOuasd1alUNHfFi+Q5xfC7OlTLrGRsuZHjZ10To7wApgQkifr0qSyB6hIGTMF2NLQ28sSm7Wjya9UDYdAil5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846863; c=relaxed/simple;
	bh=YlLGNqmO0oy++jL1h69SEkdAlw0brbHAP6D6yct/xFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQptZTatp5MK5QLURXgDJzzsoNjAy7806XETVA7wJhcWmlfadI4mYbrLM4kiw0zMwjJlGY/GAEaiy9tIT84Xt66Mz0nzZgA45S5EoDwDi6jMyLEz+/mYY2aHvwr9FFbAaL/6JfOTT8zce1RaIxyK/p4u7/xbL9DkMK7LvmQ4HqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gQyBQvUF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gQyBQvUF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so28007675e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846856; x=1774451656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqLAHEEwXnFAkIE7EWJpBFXwpqyj0nN0CIFlRmE/xG4=;
        b=gQyBQvUFRCRS0L9gMQSGoNsY1jjSojvmXJNQASNhFS/Y4HyiPsDHNsMew5DGq2yLMW
         sJOK29Yba+Hwub0ze23+Tmy3VWsaNV2RSXsZf2BiiSCOJClEFXUHZmwCg1fdT8J8LQO+
         8yYu6O7OTqSF39wyE7KhA2HamISLq4atjFa6Rn2s5XtM8lTlxLjtEGdJD9MnY6cXFdR5
         a8UfuyaEy4rY6Fs+IvYp6OARipfdKOmbOXF1x5g5PW6DZpD/8wIbLcY/+9JbVnkpnyXR
         4ZnCaqQEXYp2wnd+kCqQ1hM4ooaTq2QX2FaNuqJZ9B/Y3P7Y6X6a9wKbJCLZv0CupyNn
         N0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846856; x=1774451656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HqLAHEEwXnFAkIE7EWJpBFXwpqyj0nN0CIFlRmE/xG4=;
        b=Ei4QgpXwRp3hdHq4pYx13b4lRxfNsdWAmnWZvfgO65uo+v3f5fuHhXj274TjdPDjnu
         md8KrZTMF4VN4tAva1Li8/GhgrrInWnv/TU2w6mUtglcBvnWpu2YG2HIlS9CZsieJEZ5
         OkzqmJ14xUX740Ib7wFwq8R4J0tMAAIQawv9XOxCiDBWiKMvrZKjzW9uDCClrnb/2dGb
         53WM+a6y2fFAdO2h9G4vqgajFt3tsty75Ea48A2L1AqP10McJkd6wgWEQ+fn6GcWsKUE
         QcudKtCq+Ukr3Mup0iZLd5Sus/Wf0M9J3vei4U8Rvjwn0YixPnbtt1bbj3NqBFZGMBMU
         +NPA==
X-Forwarded-Encrypted: i=1; AJvYcCVECZOYbXsh3ULsNq0TRemuN6+r1bEDyD7g5faA0ijHn7iJwEWJ8av4dORz3Sg0hl0cAi0z4doYNy02mGPgWG7x@vger.kernel.org
X-Gm-Message-State: AOJu0YyqERPPuFDl3NfnV38z80w3uOTfSfgLRH9s+teMGhJGYmLGixw3
	gZe09THXb0yqGVOmsw6Slz7VGMdRXPSWJkK5Gm/ljpplzlCaYumPX8Teb+ji+9DJyho=
X-Gm-Gg: ATEYQzwJeEqyeDeQkTw4R45BEZeHjCLsmXMLgMA2hbouD1CU6bGSqDxfPjYQi9a5QFz
	Br2ANihdt7g6LlH70R35LrMfOcMdbWbOKzQCYVX+LlfY0Bs6Ai+wD5Gmguh3iEsbwFLzecRg4b5
	PzstVGbph6yztXhAz+vv9HjIzT4J+3DyxBOuNrF8TUEdAFsa9WQRv3HupPWfWMZdZgId9kDWLfo
	FYGXPMlMM6RP/5hFEIgMrp5tjRJFxWyvEfRH6aR2LL1PHjUkOlsoVlxXhyu7SKcSYB1ViYBdG5B
	4GsNXtxHKklydKUMDFt6k+H2kMqzKxz80fh8IL115wdGT35zMLJlQiJmt3IClByUgnxUGKx/pOe
	7rAjh/LXgNeD6CvbsrVTMbW95VVBSxbZ5dFu0wun1Zx/L72uUiIzG62YazOb6KiiT5l5WkBBXJw
	rbnExmJ3qXjHDOZAdnqgza
X-Received: by 2002:a05:600c:3d97:b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-486f8900bddmr2822665e9.24.1773846855746;
        Wed, 18 Mar 2026 08:14:15 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9dc46sm165840765e9.8.2026.03.18.08.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:15 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:08 +0100
Subject: [PATCH v3 2/7] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YlLGNqmO0oy++jL1h69SEkdAlw0brbHAP6D6yct/xFM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdByXWWjuf+V8vf6tlTqZPprexjqxXeLtvy9JNrzPm+
 xQJTGPtKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInEWjIyvFfafo29p8d96Z8n
 wqeFS6W3cGfODNuW1mU+9UHlzOTpBgz/VB7vnefQpHLr3fG5eyyYThY2PXK/8b7vaKbt0suvlVa
 9ZgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add names to the memory-region-names for easier identification of memory
regions. As the meaning of the second memory region can be different
also require the use of memory-region-names if memory-region is in use.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 15e0286e4926865d88b693998e5aa64543ae125d..775e9b3a193878349590c5036aa884617ebbcc9f 100644
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
@@ -227,6 +245,13 @@ patternProperties:
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
@@ -330,6 +355,7 @@ examples:
                         mboxes = <&mailbox0 &mbox_mcu_r5fss0_core0>;
                         memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
                                         <&mcu_r5fss0_core0_memory_region>;
+                        memory-region-names = "dma", "firmware";
                         sram = <&mcu_r5fss0_core0_sram>;
                     };
 

-- 
2.53.0

