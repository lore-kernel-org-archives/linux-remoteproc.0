Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19FA2459C5
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468459; cv=none; b=qwMSBn7FcxW+5VRv8goLAQ93qN8xrifN+1vphrXOXQfgmE6lprA5hydhlnY/4BQRz9RRCvO6Anl4DE1Mgxqc/dO6jLhIqH58QXNbkp3FVNzfBAZ8a4txHchTrau0RP79x+/injv7I+Uuc0jhfc7Yma4uMcqWhLXYkCG4AjvRlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468459; c=relaxed/simple;
	bh=KWgjeJ/vpWyN9YwcSPtBL1y6nnXc/yhU4T0OpEjImlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1tjAaYXKlhT9Y1Yi0MEw4e69Gs+tgwd2TBxarKwLjh4ykBTwTd7gCflb2O+en5kzsp1H963SK9FDkVfBnEIA+89sD90Q+RNDUGqo6hQ53LvDhWjhVWDDR2lgBSii524kG2FhXTO7+d1pDtvTIvQaA/5J18aDtrFP6NH+V31/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqCmAoAd; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqCmAoAd"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81be5042c56so50814a34.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468457; x=1791073257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7YAaa+JluQRvW+ay+L84vEKLXHaoKpKPtPkeIjCvyE=;
        b=aqCmAoAdZS8dTheg5bpE6Fl9NaWftPYAeSWfj60xQBdyMF84p+qxhjhl8UpItIWhtA
         nyFCC+1NOTByMg4OvazaFrlCWWVB2uDHLqnkwdaYSff/XnxOC05BTNGhkOl9Jbn9R8Aw
         hQQ2bSC+RQTnsUp2/Dqcq1LAo0C6EBqIYploMHePcrGfx0MrCgm1pEIAjSohUWBCT2mc
         CDZfvasKU6vsrjuoIp1iA3DhWpZTtxEpHfgNHjc0Km39q4dBo5hxU7JDTLSW49VgchwB
         Fa39JpxVV8fn4OKmQz3eojvilWBKRAA9AHDpIv3NlnrYg/KTafCbKwZ/Zqyqk187EluC
         xudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468457; x=1791073257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7YAaa+JluQRvW+ay+L84vEKLXHaoKpKPtPkeIjCvyE=;
        b=swcO307WnAsXeB3w7D3dOPEiyq6fhPNgmn/OcMHw3pSWP1ySlUp0GWVCuGObKJynZ0
         zrnbJ8D6EErCImgjFDRYeW6bJlbleHiO93hwShB2Pa3zN2QXCFLWFAjXrPuP4kQMpN+N
         CouLv6yX0zfEaqz8slV9OBfhooKvx4r0BG99k3qC0ZV4EvrY3AiKnSnx6KmP455PfcyF
         MLtzr9oUujj68fTMuA497jmnXvktLTU8RIf49xVnERaIQAL0XUsphunDmHwk/JACqSxP
         9eYdcwf0mJeAuaS/yGHdxfN4W1n9pkApjJeyAoPQlIYnYPS4vxZm9ZG1Vpj8/BLe/fUF
         oIgw==
X-Forwarded-Encrypted: i=1; AKwUvBzpjsYShC4MBewRFYugQYcJX54CwVFj/fIEY8L2dPKXkUgnFr2HAQtEBPa05CuzNYTEghkNf2g4BBoewDm3jTRs@vger.kernel.org
X-Gm-Message-State: AFuF++kJMG5ku5vX8GrPITJNeEJbEgcUakKOF3PigQBY0Ft/rg6ZaAxn
	p3WrEpn9gprLLd7Xqta0NrpijkIOgj35i53Ml3Gn8F0FIvi1yczKyiXT
X-Gm-Gg: AYBFou2pIE/9AJxCiVcIXXJ9Bs7KBtrJzLvyxwSIWgPNKMW6xLz9u+o3DNLjtbrsQkg
	GUFrtABXpSi0qbbBlv0duQG/w/OKS8B69b3Gl9HF6h8tKBroFwy7camC+SlXvxXCUp0IJI7kPEB
	bSTXhoelq2jWFvUJh+bJXpa7tkmn+GUkPP1qXi0QRXQpRJneBO5/qMZlLeK7R/Lp1TZ3JR3PhhA
	beHvOZu+vFRuHU7u0aTIYO8nNut2Det7L9dI9oEUMzE3QKZTRDdTfL1NNFHzZyqYx8FGEFabuXk
	YRyQ8dw81hCq3ceRZ/8LPe6GHh0YtMF+PcUKvVwlOFsHhTRMGRlgnVfO6XgJk5cW2la6sNp70CH
	I/03GAxn+YdTK48RWhCgMu4Vq3hA3oEuO3jhPRtxPPFIPOXazEBB9JLjZ3xvyd5fI2ytEfhFpVB
	+trPZfvHrYmegMET4o6ABQIhPgtq6Eg2Vv16biDj64E+p4H6TXzOTh7gy7+zi5HIZkPxeXgUWJw
	pUYDDe10RAL3SeAKlMFcg==
X-Received: by 2002:a05:6820:1c8e:b0:6cd:3ffc:64cb with SMTP id 006d021491bc7-6d5baa47035mr5699972eaf.70.1790468456774;
        Sat, 26 Sep 2026 17:20:56 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:56 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 4/7] dt-bindings: remoteproc: add Allwinner sun55i-rproc schema
Date: Sat, 26 Sep 2026 19:20:13 -0500
Message-ID: <20260927002021.797069-5-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Allwinner XuanTie E907 RISC-V
remote processor subsystem integrated into Allwinner A523, A527, and
T527 (sun55i) SoCs.

The binding defines the memory resources (configuration registers,
SRAM Space 0, SRAM Space 1, and optional remap controller), clocks,
resets, reserved memory regions, and hardware mailbox channels.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
new file mode 100644
index 000000000000..53e3f4faaa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
@@ -0,0 +1,146 @@
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
+description:
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
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    minItems: 1
+    maxItems: 4
+    description:
+      Memory-mapped register regions. The following named regions are
+      supported (all optional except at least one of r_sram or r_sram1) -
+      "cfg" for RISC-V core control and boot-vector registers,
+      "r_sram" for dedicated MCU SRAM Space 0,
+      "r_sram1" for switchable MCU SRAM Space 1,
+      "remap" for the hardware remap control register.
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - cfg
+        - r_sram
+        - r_sram1
+        - remap
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+      - const: msgbox
+      - const: parent
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: msgbox
+
+  mboxes:
+    maxItems: 2
+    description:
+      Exactly two mailbox channels from the Allwinner CPUX_MSGBOX controller,
+      one receive channel (RISC-V-to-ARM) and one transmit channel
+      (ARM-to-RISC-V), used for VirtIO RPMsg kick notifications.
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    maxItems: 1
+    description:
+      Name of the ELF firmware image to load from /lib/firmware/.
+      Defaults to "riscv-firmware.elf" if not specified.
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: VirtIO vring buffer region (DDR carveout)
+      - description: DRAM firmware execution carveout
+      - description: RemoteProc trace buffer carveout
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
+      Optional hardware crash-notification interrupt. When present the
+      driver calls rproc_report_crash() on assertion.
+
+  interrupt-names:
+    items:
+      - const: crash
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
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "r_sram", "r_sram1", "remap";
+        clocks = <&mcu_ccu 3>, <&mcu_ccu 4>;
+        clock-names = "bus", "core";
+        resets = <&mcu_ccu 0>, <&mcu_ccu 1>;
+        reset-names = "cfg", "core";
+        mboxes = <&msgbox 8>, <&msgbox 9>;
+        mbox-names = "rx", "tx";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.43.0

