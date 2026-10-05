Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13A4AF9D4
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227447; cv=none; b=kgAaNqnqZBv14kBLbnaEozY1U7Mbtv5YYc+gfePH5JJMJe+Nal9guJ//J2M2Z+OMM+7asZQ9MqKtfvBwF4hXICNt26f1eeMMF6DF9ArcXiEHqxEto+OkVM84eebq0EauSUSUB8AeiSm+s+RaPXUfUwdGq0I4KpZVqdm9frT9RVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227447; c=relaxed/simple;
	bh=TN5pLnk4ylfuQCDcPJKk8WYph9lKab8Uf7A34Sv6vbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KKXTR/ngY0b8AkZvqcXdrBv1uTUUrdUMoU3RDl5N9bQikAL2b86rFCRELF7hwuy4CYsBgm5w3dQk0YrQGbbUMWDUPdpB3D7mwREaRW/T54S8QTGLKUbYLGSNqIkvEvp0Ptm/MGrghKi22UJFZgheIQm21AHKY0r+RwSeFW0DEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8BNIdom; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8BNIdom"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso175577eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791227445; x=1791832245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSbhrt/lgKepV2a1GBS3lg8xwzm8vGysOirgZ5JBTUA=;
        b=A8BNIdomSof02GpFF0Y9+EJi6154tf8KxvORbVzA7OBDbTqjGzS/BrK4nfCOnLDHhk
         E1OSIUtStRIrJJZ1byo8R31j52xsJkPklYYFK1QXmlTl/xSla2QR//tg3EUcJR+xFac3
         lE2iIkcvCAlG8X4yBNX5ifw0TNamTUtxhePEpi30Y/GRRZ4VsNBAUs2UeLamJlv+go9y
         W+YtKh3n8trwbNvV/K9oxiYzBN+xsJ7/pCgNdmi5YBa1wcESYF26W0W2fD0w+iHR0/Bg
         F0JIhzryf2+x3intj89dgcvlxinmRoKExpOvzP1KiHlkaNgt8T2KN922M9HO3q6hBq8g
         MGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791227445; x=1791832245;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSbhrt/lgKepV2a1GBS3lg8xwzm8vGysOirgZ5JBTUA=;
        b=JCHE4zrTltTzXJwW4xLV1dPx2N/q8fZtlPRu/7usmPSxr9FE/HZMSbRPJJVJPNZM5i
         6unsN6UY2qdfJi1WBGmpsCH90IU4ui0NjQdrcOPi9+/q5dv2qTb1L/Z7wK5Eud/ePSzk
         CyCf3EtIODxPqSg3qQHD1lX8r3mXKXX+tYlH+1aR86mWryJvtuYLBpPGdYSY2H7QIcpI
         ANrlHv9mAtub11eWaFzSXLYKsjHMBvXa0PJoAfMLOOBsZB2eTJKktqhQIJ4hwbyKhC+y
         XRoHhw7iTcFnuK4NPmF/aSXTqhBvZIe4rVXWlbab7EldklJ5iuMfjVgaEjf7973pjZ1I
         hhGg==
X-Gm-Message-State: AFuF++k/1u9cYlbon1RUsJH1AVUJ8/J7A0lf6y6XcZF87bqDzZhYFNWw
	w5CzqMl82fxPF4MM1Q4r9PEmNS2gmVnUn5K9RTkoENF3reRMq/QwgpVQ
X-Gm-Gg: AYBFou03cRSjuXjRnVLdD4A0uuaG6oVRXwB/q0gSZjd6AnFO+G1x3OIDb9BIeaZbpRU
	R43UMLGJrAMzzcyrLl72RjNcjRcr9eQAtB1JvxVbBIoUHWNk/0mF21foPcqVlyW7/EAZeK5GJAu
	iZvbRk6pIYtGInoprkASrt7xki7LSZcmiNS3DKy/venuLIImCnVvvKzwRt7/HhJcbqc6y8L01EL
	GSKCgXOeFIaG0FpYcMIGtGOqE6zZv50kIggGmS9v5fsHhWB3SIhGWDPU2Cau+mPdGjtL6QJLe+6
	Hnf/UX4hYUwCYSqVpbbT+DDAKSoRaZxHyEr4ua8vVJ+lYZF40ScdYZT7xExjcwQHWHn3WO5NWel
	Nmvp9DiP3RZgEojmkM/55wgVEUDOndTPS0xnRY+b+zgsQujiMbzE5HjARDvtH78q4mJw6QF1LoE
	uBG9tUC2mad5sdhOiZizxyr8ParvGJHN5HK/W99aIIhzgwMlo64627aVpSxBlRw1ue4ujWAigkX
	1XbLKGs2Tk=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id 5a478bee46e88-34f14ffa69cmr21314485eec.1.1791227444450;
        Mon, 05 Oct 2026 12:10:44 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5007:c960:23fb:5e63:6976:fa4f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b5ee6bsm475408eec.30.2026.10.05.12.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:10:43 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 06 Oct 2026 00:40:26 +0530
Subject: [PATCH] dt-bindings: remoteproc: ti,keystone-rproc: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-ti-keystone-rproc-v1-1-41f7f078b44e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswDYmuEi3KxhoCjTGikO6et
 HyL/zMkEqYEfZVB6OLEMRQ0dQVum8JKyEsxaKVto5TFk3GnJ50xEMoh0WFLZu680Z21Gkp3CHm
 +/+cwvu8HaiMGh2MAAAA=
X-Change-ID: 20261006-ti-keystone-rproc-4e3b8f328662
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791227434; l=11715;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TN5pLnk4ylfuQCDcPJKk8WYph9lKab8Uf7A34Sv6vbU=;
 b=fJmAv24dBO753NanC9n00n0anTt7+DDNR1XmL4EKn4AQav3pxnvQUYccAfycHtmfOb4U/r6d5
 ps+C1DnoznIBnfmgUndWYceI6jijGoUCB5sVn1MuLwJIphn2qQk81xn
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI Keystone DSP remoteproc binding from legacy text format to DT
schema. No functional changes are introduced during conversion.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/remoteproc/ti,keystone-rproc.txt      | 182 ---------------------
 .../bindings/remoteproc/ti,keystone-rproc.yaml     | 140 ++++++++++++++++
 2 files changed, 140 insertions(+), 182 deletions(-)

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
index 0000000000000..3117cfb2b3e07
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml
@@ -0,0 +1,140 @@
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
+    description:
+      refer to either of the following reset bindings for the reset argument
+      specifier as per SoC,
+      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt for
+      66AK2HK/66AK2L/66AK2E SoCs or,
+      Documentation/devicetree/bindings/reset/ti,sci-reset.yaml for 66AK2G SoCs
+
+  kick-gpios:
+    maxItems: 1
+    description:
+      GPIO used by the virtio IPC stack to interrupt the remote processor. See
+      Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved memory node can be CMA memory node, and should be defined as per
+      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+  clocks:
+    maxItems: 1
+    description:
+      Input clock (66AK2HK/66AK2L/66AK2E only), see
+      Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
+
+  power-domains:
+    maxItems: 1
+    description:
+      PM domain provider phandle and DSP device id (66AK2G only), see
+      Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
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
base-commit: 67f0943b394d920b6c142aad8c6af94340342ae7
change-id: 20261006-ti-keystone-rproc-4e3b8f328662

Best regards,
-- 
Bhargav

