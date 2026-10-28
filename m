Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793229459;
	b=05KxyvhteSYVUFKfxgSmnLlzSvB8J69T+5VYewcOJfhVinVkV+Uam3+vL2ls7NfHdcJB
	 Pqsy+v9zE/qCDNcM+6Bn4od3ybJJwpoCdo9g/qB6K1fRrTG9de4CE5QYZW5rwrMObKsNv
	 TBI5iQ7G/FcZX3aFsJSpkdNFEyjs89h6NEdm/AbDYcdjGdF4WE2I5uAhyU9SSwtxmPLpZ
	 VMFeF6OPHhHGUrDOdqs5R53X7mdscrUjDr9NYl5XWFL1IeMshVihKsh1/2ibbs6QqO/VV
	 VaJYL2n7373WCowBiwLlLtlRcZ3kjLkabbr4R/50WWGcZUrRw3HV0NsggVOV/gY/YyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793229459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VXy5sj4f8vnPOjseVBPgB1Ic7+Cmn98gAyTuIxfxXXw=;
	b=HaXaYAguRQY0+HshtaE642SMxk2VZe2nSKu3kyngYAjFOdUGfIo3OnhXMtOy37QvLLHP
	 La9mTQkSw5ND/GUS23P51sl0Y0qwUdwYFcO7nhtYvavRxzQCVSm4fWvLD2vmAiieUbz1j
	 RtDsAxIHk9KHiXMiVbaVsnEYBbiEa2ITBe1NLgXHc9v71R697pz91ym8xpajfRqrSVqbT
	 +0O7w4bkcj+Bwj8tl/mefyWdYoRi714jjemorx45yksgBJwpD8cyELvxWdwy0ILoPST6V
	 fTGfotUL8jitxHScjWTEBiBJrAPw0Hvz4+2OG/CqPLvvFh1KbtEaeAQWpM59DELkQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Er1rSmb9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB95F606A31C
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 23:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB95F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Er1rSmb9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a1467ca93so190071eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793229458; x=1793834258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VXy5sj4f8vnPOjseVBPgB1Ic7+Cmn98gAyTuIxfxXXw=;
        b=Er1rSmb9hV5RHzMk6uqsX56Ecqt80LT/shM01RfTJ4SunBHAQEeqwhupK8StYUr2yO
         LQ3Of4b+utOkkZoVdHDOu3oF3GOqkFPSlJ8S7ieZZnHSDcqGFU1AwIfPa1KM2xWoQG0o
         ZH2ekBkXOY7KQu6YOrV+kjLw0LsA0TnnoMmTcEujRRzgpmvJEkjc7eKbwxRLIS0izYqD
         jK7sQCh8ZxMcKjndvDrlnRudL0Nu2p4q/hW8+tQmYV+FsfktvKRWZlAyxP4aEhtSaNm1
         FIKJE2afAkeXe2cmpAHZGv1XYSpuuo8nAyezomDuTk4N8KpRk5/a7juGzeLTzR/+7Ydb
         NYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793229458; x=1793834258;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VXy5sj4f8vnPOjseVBPgB1Ic7+Cmn98gAyTuIxfxXXw=;
        b=mWQYBSvb8BA8DN6nk3jlCcuULfYkOx/B9t9HUx7V5UkpvM4nb+YOruLwtW/tBU673Z
         /j/pLUzmOyVZUeH7O5sMzRC/js87bD7p7HuFk5qi/mm5jUlyPxYlPgh0eDbg1oQj3KWH
         ZaO824xH8K7b1iugW6j6Ar8TX/ZFwyRW7FcaV0995Y9OO3g7+jipT9NG11ItEjWJUQ/4
         0FpX99bIFxo/uV993h+9YgJi7+TwtRn6klfBMolGBzO/09taih9kZ1nTSCD3jKBhPvcZ
         zk1Fhz4YAon4ZSICEXJCJNVfOJ1GSTHVOLHpAPK2l07/lU6ldregzKKopYD9kC4akIjV
         lstA==
X-Gm-Message-State: AFq9FYI0+Sytp5VbtTdKM792HN6T+1EyQHM4FuVJTlbd8gGBqVrODBU7
	5NomvBwR8Em6tDtEBSlW0txVhol9+lz5NCxJV//hC/ZA0vqlg9jACsVQWKZVLA==
X-Gm-Gg: AYBFou16zKZShBmlQaR1ovO/SHVC9bqOCM3RyXTqJsx5FtRRiqYXBAIuInEe04YlS/B
	tMtwULFt5uHzApF+6mOV/mDgcMj58Gjo+ukh4E0gri/uQXSMoDFlRAGZ6SoKarg7JotiOVZm6uH
	T92cDd8mVuuvfIc00oRC1ch6mC96H9iuHzgspjNZSyH+YIwmYxlgXjL6maDi0S2Bl15xtBQO0br
	DGClkJHcKjwk9/8xz8lvrK2Li7prY7saLSeRSAxDPay1ftPnfVtPozGwcJnKo50a+TGfD03MSfz
	JTI5EvhcHzhBFzkybkat9ytBrD3F2hLxANyQebGqT75gxfSEoo9/gm8OXSbo5wWq54W+Z5jCZfl
	jaQBLpGcSfzeN8Awzu7KPdK+dgyduLJ8LKuIXpYZdtxHC6YFnA2YK5te6fE5s5I7gZMX/FGqX4w
	R1OdGWzfBvl7+SmqtbobW9vwbjjvP30SWec/n8wGbRA5nUVnJUlByq9slHqUO8ZgDnOzUlUsfHR
	Msc9aTMqPfTCcKwtiGCrWMU+66du+OcGTNuMMsm9mYLlHkQHZe0yexGJmRJppmc4NVoG3ns9DDb
	pGJEneWO/z+tsFetzUhWbDWiy/L7hlAJWBNXL/8VDxQ2KkZX3fVjdpQya6G0
X-Received: by 2002:a05:7301:1a8c:b0:369:ffc5:6767 with SMTP id 5a478bee46e88-36a1ffc100fmr7353441eec.2.1793229457569;
        Wed, 28 Oct 2026 16:17:37 -0700 (PDT)
Received: from [10.196.187.252] ([2409:40c2:501b:81ef:82e:fd67:dd84:8730])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm13623767eec.20.2026.10.28.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:17:36 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 29 Oct 2026 04:47:18 +0530
Subject: [PATCH v2] dt-bindings: remoteproc: ti,keystone-rproc: Convert to
 DT schema
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ti-keystone-rproc-v2-1-7fac1d72f4b3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6DIBBFr2Jm3WkACZKueo/GhdpBJ61gwJAa4
 91LPUCX7+f/93dIFJkS3KodImVOHHwBdalgmDo/EvKzMCihjBTC4Mr4oi2twRPGJYYBNdW9dbW
 yxigouyWS48/pfLSFJy7tuJ0XWf7Sf7YsUaKWrnGisb3WdB/njt/XIczQHsfxBZTLaJCyAAAA
X-Change-ID: 20261006-ti-keystone-rproc-4e3b8f328662
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793229448; l=11085;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=4k0RN6uzshq3dQzD1QtJrPYRGg2BlNEM35wW/D2mc1k=;
 b=xXzjssFEYAt6XP9Umd77HsXpLlCNVVJ3q0tl2xQj9wSY/ybtJj6Av8opdS9IhHEQ3TSlhPvpG
 3d3tVUJm0RDB2yG9ytmEmmui0i3ZjyZ7GAQCbSCNz5uU/ot2DDK6TBe
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI Keystone DSP remoteproc binding from legacy text format to DT
schema. No functional changes are introduced during conversion.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Removed unnecessary refferences.
- Rebased to latest mainline.
- Link to v1: https://lore.kernel.org/r/20261006-ti-keystone-rproc-v1-1-41f7f078b44e@gmail.com
---
 .../bindings/remoteproc/ti,keystone-rproc.txt      | 182 ---------------------
 .../bindings/remoteproc/ti,keystone-rproc.yaml     | 126 ++++++++++++++
 2 files changed, 126 insertions(+), 182 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
deleted file mode 100644
index 8475521336333..0000000000000
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ /dev/null
@@ -1,182 +0,0 @@
-TI Keystone DSP devices
-=======================
-
-The TI Keystone 2 family of SoCs usually have one or more (upto 8) TI DSP Core
-sub-systems that are used to offload some of the processor-intensive tasks or
-algorithms, for achieving various system level goals.
-
-These processor sub-systems usually contain additional sub-modules like L1
-and/or L2 caches/SRAMs, an Interrupt Controller, an external memory controller,
-a dedicated local power/sleep controller etc. The DSP processor core in
-Keystone 2 SoCs is usually a TMS320C66x CorePac processor.
-
-DSP Device Node:
-================
-Each DSP Core sub-system is represented as a single DT node, and should also
-have an alias with the stem 'rproc' defined. Each node has a number of required
-or optional properties that enable the OS running on the host processor (ARM
-CorePac) to perform the device management of the remote processor and to
-communicate with the remote processor.
-
-Required properties:
---------------------
-The following are the mandatory properties:
-
-- compatible:		Should be one of the following,
-			    "ti,k2hk-dsp" for DSPs on Keystone 2 66AK2H/K SoCs
-			    "ti,k2l-dsp" for DSPs on Keystone 2 66AK2L SoCs
-			    "ti,k2e-dsp" for DSPs on Keystone 2 66AK2E SoCs
-			    "ti,k2g-dsp" for DSPs on Keystone 2 66AK2G SoCs
-
-- reg:			Should contain an entry for each value in 'reg-names'.
-			Each entry should have the memory region's start address
-			and the size of the region, the representation matching
-			the parent node's '#address-cells' and '#size-cells' values.
-
-- reg-names:		Should contain strings with the following names, each
-			representing a specific internal memory region, and
-			should be defined in this order,
-			     "l2sram", "l1pram", "l1dram"
-
-- ti,syscon-dev:	Should be a pair of the phandle to the Keystone Device
-			State Control node, and the register offset of the DSP
-			boot address register within that node's address space.
-
-- resets:		Should contain the phandle to the reset controller node
-			managing the resets for this device, and a reset
-			specifier. Please refer to either of the following reset
-			bindings for the reset argument specifier as per SoC,
-			Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
-			    for 66AK2HK/66AK2L/66AK2E SoCs or,
-			Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
-			    for 66AK2G SoCs
-
-- interrupts: 		Should contain an entry for each value in 'interrupt-names'.
-			Each entry should have the interrupt source number used by
-			the remote processor to the host processor. The values should
-			follow the interrupt-specifier format as dictated by the
-			'interrupt-parent' node. The purpose of each is as per the
-			description in the 'interrupt-names' property.
-
-- interrupt-names:	Should contain strings with the following names, each
-			representing a specific interrupt,
-			    "vring" - interrupt for virtio based IPC
-			    "exception" - interrupt for exception notification
-
-- kick-gpios: 		Should specify the gpio device needed for the virtio IPC
-			stack. This will be used to interrupt the remote processor.
-			The gpio device to be used is as per the bindings in,
-			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
-
-SoC-specific Required properties:
----------------------------------
-The following are mandatory properties for Keystone 2 66AK2HK, 66AK2L and 66AK2E
-SoCs only:
-
-- clocks: 		Should contain the device's input clock, and should be
-			defined as per the bindings in,
-			Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the DSP device id
-			value. This property is as per the binding,
-			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
-
-Optional properties:
---------------------
-
-- memory-region:	phandle to the reserved memory node to be associated
-			with the remoteproc device. The reserved memory node
-			can be a CMA memory node, and should be defined as
-			per the bindings in
-			Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-
-Examples:
----------
-
-1.
-	/* 66AK2H/K DSP aliases */
-	aliases {
-		rproc0 = &dsp0;
-		rproc1 = &dsp1;
-		rproc2 = &dsp2;
-		rproc3 = &dsp3;
-		rproc4 = &dsp4;
-		rproc5 = &dsp5;
-		rproc6 = &dsp6;
-		rproc7 = &dsp7;
-	};
-
-	/* 66AK2H/K DSP memory node */
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		dsp_common_memory: dsp-common-memory@81f800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00000008 0x1f800000 0x00000000 0x800000>;
-			reusable;
-		};
-	};
-
-	/* 66AK2H/K DSP node */
-	soc {
-		dsp0: dsp@10800000 {
-			compatible = "ti,k2hk-dsp";
-			reg = <0x10800000 0x00100000>,
-			      <0x10e00000 0x00008000>,
-			      <0x10f00000 0x00008000>;
-			reg-names = "l2sram", "l1pram", "l1dram";
-			clocks = <&clkgem0>;
-			ti,syscon-dev = <&devctrl 0x40>;
-			resets = <&pscrst 0>;
-			interrupt-parent = <&kirq0>;
-			interrupts = <0 8>;
-			interrupt-names = "vring", "exception";
-			kick-gpios = <&dspgpio0 27 0>;
-			memory-region = <&dsp_common_memory>;
-		};
-
-	};
-
-2.
-	/* 66AK2G DSP alias */
-	aliases {
-		rproc0 = &dsp0;
-	};
-
-	/* 66AK2G DSP memory node */
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		dsp_common_memory: dsp-common-memory@81f800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00000008 0x1f800000 0x00000000 0x800000>;
-			reusable;
-		};
-	};
-
-	/* 66AK2G DSP node */
-	soc {
-		dsp0: dsp@10800000 {
-			compatible = "ti,k2g-dsp";
-			reg = <0x10800000 0x00100000>,
-			      <0x10e00000 0x00008000>,
-			      <0x10f00000 0x00008000>;
-			reg-names = "l2sram", "l1pram", "l1dram";
-			power-domains = <&k2g_pds 0x0046>;
-			ti,syscon-dev = <&devctrl 0x40>;
-			resets = <&k2g_reset 0x0046 0x1>;
-			interrupt-parent = <&kirq0>;
-			interrupts = <0 8>;
-			interrupt-names = "vring", "exception";
-			kick-gpios = <&dspgpio0 27 0>;
-			memory-region = <&dsp_common_memory>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml
new file mode 100644
index 0000000000000..79510abae8ea7
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,keystone-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Keystone DSP devices
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+
+description: >
+  The TI Keystone 2 family of SoCs usually have one or more (up to 8) TI DSP
+  Core sub-systems that are used to offload some of the processor-intensive
+  tasks or algorithms, for achieving various system level goals.
+
+  These processor sub-systems usually contain additional sub-modules like L1
+  and/or L2 caches/SRAMs, an Interrupt Controller, an external memory
+  controller, a dedicated local power/sleep controller etc. The DSP processor
+  core in Keystone 2 SoCs is usually a TMS320C66x CorePac processor.
+
+  Each DSP Core sub-system is represented as a single DT node, and should also
+  have an alias with the stem 'rproc' defined. Each node has a number of
+  required or optional properties that enable the OS running on the host
+  processor (ARM CorePac) to perform the device management of the remote
+  processor and to communicate with the remote processor.
+
+properties:
+  compatible:
+    enum:
+      - ti,k2hk-dsp
+      - ti,k2l-dsp
+      - ti,k2e-dsp
+      - ti,k2g-dsp
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: l2sram
+      - const: l1pram
+      - const: l1dram
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: vring
+      - const: exception
+
+  ti,syscon-dev:
+    description: Phandle and offset to syscon device
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to Keystone Device State Control node
+          - description: offset of the DSP boot address register
+
+  resets:
+    maxItems: 1
+
+  kick-gpios:
+    maxItems: 1
+    description:
+      GPIO used by the virtio IPC stack to interrupt the remote processor.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved memory node can be CMA memory node.
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ti,syscon-dev
+  - resets
+  - kick-gpios
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,k2g-dsp
+    then:
+      properties:
+        clocks: false
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+      required:
+        - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dsp@10800000 {
+      compatible = "ti,k2g-dsp";
+      reg = <0x10800000 0x00100000>,
+            <0x10e00000 0x00008000>,
+            <0x10f00000 0x00008000>;
+      reg-names = "l2sram", "l1pram", "l1dram";
+      power-domains = <&k2g_pds 0x0046>;
+      ti,syscon-dev = <&devctrl 0x844>;
+      resets = <&k2g_reset 0x0046 0x1>;
+      interrupts = <0>, <8>;
+      interrupt-names = "vring", "exception";
+      kick-gpios = <&dspgpio0 27 0>;
+      memory-region = <&dsp_common_memory>;
+    };

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261006-ti-keystone-rproc-4e3b8f328662

Best regards,
-- 
Bhargav

