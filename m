Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559473;
	b=3rbyOwKTeF2BfNEu7tkjes3ZlqB1PdTTXPJVqnOclv84zNayR1ccEBqhXR7946dnq3az
	 1ZInkt1y81PKBwRz4pYQbC268WuiCQgky/q2Brcxis1/ApAC/0GKeqcB9/nkd4Fdx7WJz
	 oCGqR/H9/PGgCgwD4Up+oOOl3ANgDMOCU7xK+9LWQfd8VFnhraF0j4WItI60lIVgYAX27
	 BwoUVtQ3RldSKFSx669G0F741tASyATHXCq2CyhlZ1PKlE0m629u3Y0DMsfictw4kx9vy
	 KcOhBQHcgW8iQo6+usnN6jzUSNfq/XqcSUDfUbeCgBaveZut2zv7ZaZ1IthXAqCDisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
	b=skf3pvN1O30RfwvQJ8Ev6qwStFfJTMRqDQ5ZQ9wvFazsZ90yTSeYohXxmHxOM2WcVINZ
	 xKW6Eq3iiGtANcx861BogTI0r1XLikebjHFzcPNJ0ez3+ww/xXE7vLBvXky53XC0UOc+a
	 0+T8fiKTQrSxNge3F0JTPGwa9g7PC8osLV+P8QZiiqYNcY9BfSFIGCyyAWqsR6NEvLbaU
	 6dywzp4jdS/2sU0Yu9/BZpy7KFyJGx6/j6R+YGC0OBiQSgWaDhWcXN63cV62QAwX+bkqB
	 wPCLklCbekRt/bsA09mYMVFdaohLD8Tc5DJmyImMv2v7ei7wUF3eQnOZ0J8EFsWLymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212760A2601
	for <linux-remoteproc@vger.kernel.org>; Sun,  1 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6212760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0a921ee46so18804777b3.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 Nov 2026 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559471; x=1794164271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=zBBHWtrnLvN+KzhRTGzloQZBjdPjbJoacnzhb5LFieDQJiTervtn53JtQI8N2HM2c0
         bSsh0A3WMG3AGCQVa+/y+kvnXV3+eU7FwijPSoKqkxbzeWait4hunT9qokSXJuKLYbTe
         zrPivAEM6sNwnQbG80r0F+YN1fJBEDNbBRVxdOIHelXx5TkkdnP/NudLKy2YIpXnkBob
         AduZhRTZV89taoSgJxgYz8Z4IR0Xma3RtlbZcxaw370X/3VyoIG4o9sFlAHDVZcfyZvX
         RMQEBm9aWaLKx1bsPtSCPhKVEwS2jDBLDYBbILoEWWSys1V3YEM08qIxyYS4ILnTVtSv
         BDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559471; x=1794164271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=Y3ihvHhQmfOVMep6IFhIQhK9jqIM1ZvNzOcUuCsZoTHrEMcB86opgBWRlpbD0vgttd
         Blp0/7hM3I1959B68IIDszSy8a6fAAT3FvL6UnzHGnj9gopdmBeAiHV3OS9H9oj+wZ4F
         2uGdyUjmgq0Wlbnbd7COWOLoV3m0G3Zam/XQE1wMbpK2MTOWnLwlZq3zpnNYkzKvYn1W
         RrIKOIHnE+s+7MbgXgq+oLN2ONfpAHGjWcrFCYxQXeO8Jlwmy1T6IRURvJreFPJdSO45
         1xrFlhScCupFgX505/ssSFaUzw073n55qeFTERMLWcxyiUoWmSL/9gPUKsikHWErhsnw
         aEjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYxKJgH/x5R13lE40LIBs09m58Sdfaea9+bzaCROUWvIxir+bRDiv1KARbeHBRLdeL5ZQ6Q83eiv+eHktLjcqS@vger.kernel.org
X-Gm-Message-State: APuU4Z9wcg5rS5kxXrf4nhzkiqllnGEw6T7VvBwP4NciBIBdo1SedgW7
	2CcQIfl3e3tdof0Zvdf54B7ZfNEzx9Mmta5pF2MZfIFEOGD0EBNCSZiz
X-Gm-Gg: AYBFou1zIPoDzMuHiDWDjFLNhds6exZtNtP1tvhWLSid0cDwRge6DB+4Z0LgKdzqPBr
	2qNxz285RO1DZpMd2+0URNMbwQ/x17P4nmv/LrhCiHbfur0/DnecFAVOTK/0LiyfTr7Jj0BYA1+
	DTDa86Yeng+cVBKLN6Ww6WctsT0szH2iXbSUtYyCucycoJJSGq/0CNa1ol8knVqkrjdMTHNIa3K
	lv7vGgQ7qs5c7bwv6Kee1tff0vtj+hl1KFsmE0lzcwkSzl2p8iW0LBwMRnbOJRIknaFzIkUSJYq
	5sqmm4SP8i29E8MGKykRvycbiMxcl4BGBNyn48cKniq06SBlLvUSD8zabZhoquXjFfrT5FuMW9q
	+a3RRBXpeCiEuRUBQMfpj0q/OErK3+mHY4kT0iFnbsMXcZkPwgZD2sy3Twv6ekEnSeU7jWSVr8J
	LaMvnV/yK5SWKlvDUEZ1ZglvwxGXUQBkNIWybC1+KxC7fCpNFzIoBHq/f9YsvKl81Zr3gY6Jrbe
	3gsG60q4AHI+FG45QZsyht8ghAfE3DNIF9PPsIOq41CHQC384+0MGJhHj+hDW1CGq4dB3X9h9/V
	LAA/UY/di3nZA6Og8x2JsEq76fWckfdCoHPRSTIsgH80ZBEQynvhDkvpCGx5iSdErj0=
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr43226817b3.30.1793559471312;
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
Date: Sun,  1 Nov 2026 12:57:31 -0600
Message-ID: <20261101185735.762559-4-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523, A527 and T527 (sun55i) contain a T-Head XuanTie E906
RISC-V core. It runs from a dedicated 256 KiB SRAM and can use a second
256 KiB SRAM and DRAM; a bit in a PRCM remap register shares a further
512 KiB SRAM (SRAM A3_2) with its subsystem. Its reset vector is set in
its configuration block.

Describe the configuration block, both SRAMs and the remap register,
the bus, core and SRAM clocks, the configuration, core, SRAM and debug
resets, the RISC-V and SRAM power domains, one message box channel, the
reserved memory regions (a pool for virtio, DRAM for firmware, a trace
buffer) and an optional crash interrupt.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- File renamed to allwinner,sun55i-a523-rproc.yaml to match the
  compatible
- reg and reg-names are a fixed list of four (cfg, sram-a3-0,
  sram-a3-1, remap), all required (Krzysztof); the SRAMs are named as
  in the T527 manual (SRAMA3_0, SRAMA3_1); the description says the
  remap bit shares SRAM A3_2, not SRAM space 1
- clocks and resets are fixed lists, no minItems (Krzysztof); add the
  debug reset. The msgbox and parent clocks and the msgbox reset are
  dropped: they belong to the message box node
- Add the RISC-V and SRAM power domains
- One message box channel; mbox-names dropped. mboxes is optional: a
  user can drive the message box from userspace (UIO) instead
- The crash interrupt description says the A523 has no dedicated line
  for it; it is the only interrupt, so no interrupt-names
- memory-region[0] is a shared-dma-pool; the example has the memory
  regions
- "schema" dropped from the subject (Krzysztof)
- Jernej Skrabec and Samuel Holland dropped from the maintainers; the
  MAINTAINERS entry moves to the driver patch
---
 .../allwinner,sun55i-a523-rproc.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
new file mode 100644
index 000000000000..b119acaa2df6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-a523-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 XuanTie E906 RISC-V Remote Processor
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The Allwinner A523, A527 and T527 (sun55i) SoCs contain a T-Head XuanTie
+  E906 RISC-V core next to the Cortex-A55 cluster. The core runs from a
+  dedicated 256 KiB SRAM, can also use a second 256 KiB SRAM and DRAM,
+  and a remap register shared with the HiFi4 DSP shares a further 512 KiB
+  SRAM (SRAM A3_2) with the core's subsystem. Its reset vector is set in a
+  register of its configuration block, and it exchanges notifications with
+  the Cortex-A55 host through the message box.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    items:
+      - description: Configuration block, including the boot address register
+      - description: SRAM A3_0, the core's dedicated SRAM space 0
+      - description: SRAM A3_1, the core's SRAM space 1
+      - description: SRAM remap control register
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram-a3-0
+      - const: sram-a3-1
+      - const: remap
+
+  clocks:
+    items:
+      - description: Configuration block bus clock
+      - description: RISC-V core clock
+      - description: MCU public SRAM bus clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+
+  resets:
+    items:
+      - description: Configuration block reset
+      - description: RISC-V core reset
+      - description: MCU public SRAM reset
+      - description: RISC-V debug module reset
+
+  reset-names:
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: debug
+
+  mboxes:
+    description:
+      Message box channel to the RISC-V core. Each channel has a FIFO in
+      each direction, so it carries notifications both ways.
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Virtio vring and buffer pool, a shared-dma-pool
+      - description: Firmware code and data in DRAM
+      - description: Trace buffer
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt the RISC-V core raises on a fatal error. The A523 has no
+      dedicated line for this, so it is present only where the system
+      integration provides one.
+
+  power-domains:
+    items:
+      - description: RISC-V core power domain
+      - description: SRAM power domain
+
+  power-domain-names:
+    items:
+      - const: riscv
+      - const: sram
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>,
+                 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+        clock-names = "bus", "core", "sram";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+                 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+        reset-names = "cfg", "core", "sram", "debug";
+        power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+        power-domain-names = "riscv", "sram";
+        mboxes = <&msgbox 9>;
+        memory-region = <&riscv_vram>, <&riscv_dram>;
+        memory-region-names = "vram", "dram";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.53.0

