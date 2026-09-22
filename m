Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F4388E69
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 03:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048861; cv=none; b=InbEJns4+9/rjSXou0iscGiD9Z5y8VmYrYT3l4YZ5PCp8W0EEZGEFb5fg/DZz0K106KROAgfNHc1uv3tjdAPtLPHKtehtSjAcK8jOQyUqixB7BiPrF0ilQH4CqvABdS1JIbeqggRQZgpgXFRGVh2WfBvPb3j8L6ayHNQ7L2PyAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048861; c=relaxed/simple;
	bh=bgbOau0A/tgP+tSmz6HeSpp4+sp/5nJ+lGbAkKaC0PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VR8FEUijiiuPUkZOmu8BGeku4tnVYGHaa2ji5HpGtIJyghkNsc0cLrki3WrMA8jjQxaCfkQ1Pm9tknVW7RRXUiUFwRKbuvmC/H34hijvIRPsKGzBNe2SE7BMSleSv+OfuEh4jCyLYG2iIuubgJwyW8bGt4+y8KcWzpKcezItU1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkXscl5k; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkXscl5k"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so26222837b3.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048858; x=1790653658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=kkXscl5kOHfWXHJ3rXOw1HnHpVzHuHpG3q6Tswm7RTgTjW7EoN+ttsUiF76RDKlI2T
         f6weoi8PNrLGXPFFGOVvphq7nWyvc0p/nbyOGoDJeFFAvJU7H0OwrljmPXRnKljaDS4g
         Vs/78/mGMm5i4nsgQr++/npmOv6DCm7HS44ITeedkg6EsGVyZuNqpNvJCtOQjGKnA/mK
         9xG9kvz1SaYE/SK6ZK1SbEeb3qVChaMuhfXWiYxyoY6hjv9JFT4o41D2gC86kiowO12Q
         pyS0xfuYJZ8CZyY2WYnA0dz6aj1bQQichBz+lMd78/Jk2ziN9PcRHJTzp1FzYfU5dGIC
         i6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048858; x=1790653658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2lTEyh9T+AWwJXsBgXvEk8Ip07SEOMmNsBvj/vfkI=;
        b=mRMdfBP9lo1dazRjTzlbQc+ZzBjMIZqLlJr52JegqfE+f5L/ZcQrwkhBF0aKmmZYyZ
         to63XuZ37Mw/gikSn34Ux+1iASYBOZfCWpYd6UnBzvLJryI1bvjVjnaWEjX36ZRIYnz1
         Meu6eK8tHaXq6c+TzIwtnHhaFJBzHfObswhfwAthgg2VR32G1Bc/Pc/bzAf3lmRPZfvl
         LL3ObSEclpGp2jwyGVPCJJPGzcuiGXMt3vosarxybtDFXLgd+R2ZKsg5chPz6l6HnEhY
         ToqJlBYNAfve1OtSqOtMXsVnHekQtE1ziQwDQGMS+YdTIufc3jMdPenJCXp6oShxieeg
         /EZA==
X-Forwarded-Encrypted: i=1; AKwUvBxVmcAkSXX48LqHd72xDx4yHQGJyE54DOkVd4SQRJjg05HEzWDZcfdpSJdyrxGC8TN8+VQTvZ4rY1IcvRZuI+IW@vger.kernel.org
X-Gm-Message-State: AFuF++ncQZdSfNaQdM5i3lBeL2bhSNffOXk7GhcyRFopOrOKcHq07nk5
	Co4OmTm2P6SywyMYfaC2SaxqEQ1qXeXmMDwIXY6ZBfh5qPkEtx+6dO+R
X-Gm-Gg: AYBFou3LShNdQZYTrEJLRsHZecO/AKHxB/+ML5CKIEK/d6WSoFPO1onZV8R0jm0JI1v
	/fTA4rHBUo79BwRNhpj7tCLize9yeNHV4tIJH+sqzmFp8AOz5QKA7MCSQXNwh6TNqGXpmVift51
	LI9deX9qBfYM7t8xe2OzBjhSlJaebhPFxxfEtDn1pHKdgH/9mnsL1P5MNQv+6h8zyiM+CFIFpGL
	+/CgvK/G+hGY7oukOB057Up6GXfBhazD9Y4yvUqIBhuQ+YdiOobcdoxDlD+1kaWCw6Ciqk9CQ0F
	4XKrhY2C8A6Jmtivjp0c6UzErJDiGOo8fU3n075udceDZc4lN/O12vvMcRTb/v5nnEiP4lC1FfF
	uZadwjYmf2MNeghX1nealLecKYqSQISJhk0SPHv+IaAY2Hn3zzCieRTUa9Dw+g1Xu+3c12XWkfh
	F080AJyJaH/Xqfl+rFZi41yJe+g6HL5u2QSpbmNZyCbec4CjY+beEHaXRbKfTggkDXJA==
X-Received: by 2002:a05:690c:ec7:b0:89c:41f9:b8a5 with SMTP id 00721157ae682-89c41f9beabmr22270597b3.3.1790048857960;
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: remoteproc: add allwinner sun55i rproc binding
Date: Mon, 21 Sep 2026 22:47:08 -0500
Message-ID: <20260922034711.190253-5-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner XuanTie E906/E907
RISC-V remote processor found on A523, A527, and T527 SoCs.

The remoteproc node manages the co-processor lifecycle (clocks, resets,
boot vector) and IPC (hardware mailbox). Memory regions are expressed
via reg entries named "cfg", "r_sram", "r_sram1", and "remap".

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
new file mode 100644
index 000000000000..5d8b929f60b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner XuanTie E906/E907 RISC-V Remoteproc
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+  - Tim Michals <tcmichals@gmail.com>
+
+description: |
+  The Allwinner T527, A527, and A523 (sun55i) SoCs integrate a T-Head
+  (XuanTie) E906 or E907 RISC-V co-processor alongside the ARM Cortex-A55
+  cluster. The co-processor runs bare-metal firmware loaded and lifecycle-
+  managed by the Linux remoteproc framework.
+
+  The driver controls CCU-integrated clocks (bus, core) and resets
+  (cfg, core), programs the hardware boot-vector register, maps
+  internal SRAM (SRAM_A3) windows, and connects to the Allwinner
+  hardware mailbox (CPUX_MSGBOX) for VirtIO RPMsg IPC.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-rproc
+      - allwinner,sun55i-a527-rproc
+      - allwinner,sun55i-t527-rproc
+
+  reg:
+    minItems: 1
+    maxItems: 4
+    description: |
+      Memory-mapped register regions. The following named regions are
+      supported (all optional except at least one of r_sram or r_sram1):
+        "cfg"    - RISC-V core control and boot-vector registers (0x07130000)
+        "r_sram" - Dedicated MCU SRAM Space 0 (0x07280000 / 0x07200000; 256-512 KB)
+        "r_sram1"- Switchable MCU SRAM Space 1 / SRAMA3_2 (0x072c0000 / 0x07280000; 256-512 KB)
+        "remap"  - Hardware Remap Control Register (offset 0x364)
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, r_sram, r_sram1, remap]
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+    description: |
+      CCU clocks required for co-processor operation. Typical clocks are
+      "parent" (PLL source), "bus" (interconnect gate), "core" (CPU gate),
+      "sram" (SRAM interconnect gate), and "msgbox" (mailbox interconnect gate).
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      enum: [parent, bus, core, sram, msgbox]
+
+  resets:
+    minItems: 1
+    maxItems: 4
+    description: |
+      CCU reset lines. Typical resets are "cfg" (configuration block),
+      "core" (CPU core), "sram" (SRAM interconnect), and "msgbox" (mailbox interconnect).
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [cfg, core, sram, msgbox]
+
+  mboxes:
+    minItems: 2
+    maxItems: 2
+    description:
+      Exactly two mailbox channels from the Allwinner CPUX_MSGBOX controller —
+      one receive channel (RISC-V-to-ARM) and one transmit channel
+      (ARM-to-RISC-V) — used for VirtIO RPMsg kick notifications.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the ELF firmware image to load from /lib/firmware/.
+      Defaults to "riscv-firmware.elf" if not specified.
+
+  memory-region:
+    description:
+      Optional phandle list of reserved memory regions for VirtIO vring
+      buffers or DDR carveouts. Region names "vram" and "dram" are
+      recognized; "trace" selects the RemoteProc trace buffer carveout.
+
+  memory-region-names:
+    description:
+      Names corresponding to the memory-region phandle list entries.
+      Recognized values are "vram", "dram", and "trace".
+
+  interrupts:
+    maxItems: 1
+    description:
+      Optional hardware crash-notification interrupt. When present the
+      driver calls rproc_report_crash() on assertion.
+
+  interrupt-names:
+    items:
+      - const: crash
+
+  status: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "r_sram", "r_sram1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>;
+        clock-names = "bus", "core";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>;
+        reset-names = "cfg", "core";
+        mboxes = <&msgbox 0>, <&msgbox 1>;
+        mbox-names = "rx", "tx";
+        firmware-name = "testBasic.elf";
-- 
2.53.0

