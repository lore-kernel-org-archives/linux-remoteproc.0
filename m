Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BB1BE23B;
	Thu, 12 Sep 2024 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159710; cv=none; b=S8oaXf0m0ESTBhR0/ThWdypC/P7I6kK3vUaoEIZWCH1km25Hok7lod/YoxhzOycp2JsRgX+fesKkeZiHjcicpwXrHiJUDb53ae+d3oQjgblolJVpG710Xa76+MWqbvd0E9MktmKzQ/rXSqQm/2VjRxKaYbeZTQqOTiAuKtYg7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159710; c=relaxed/simple;
	bh=p6ecNLRCNl8ZScR0QmZtUArOMDDADkweuv7R/dv0qE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGs3xIP6ufT2DH2fWr1IH8q1sC/w3kPtJnU5ZmEt7C9PiJNiu44gOL/+BIQpuBXyKUUnrmJsv6toB4dUEzYicA5mLjhyZfSrHhUHSt4CYa84SvARU/Bmocv9EHHdh4+pZXUyClZqcGKkaGPuIbElP/VgqQChX5suNjamH8AsxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XCacdqqK; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XCacdqqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159708; x=1757695708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6ecNLRCNl8ZScR0QmZtUArOMDDADkweuv7R/dv0qE4=;
  b=XCacdqqKhM1aILsbi7Y9s9mW2G0i9l2jLD0UCab6uq9w9JQXYqR4wzyC
   hT6CN8w9wRStdTt3PIHGcItlmSqCjVtgyIkwPdMDzKrySz0CkpSQzNb17
   fIadmvqlAbmciX97yzMiHq7wqYp//yOUzRDE4QdcE+sgszotCXj1EDIq6
   gCOndITyJx7gxd2sGtaFrrol+//HqmGj18yXkClFsM0sJRZ3EB5lZJQy2
   wKlvHJfW2oorQHzuQYgujL1Kn/R5fq47jBKyVMYNL2h04ZNIck298yx0D
   oGJB0XRStsbLgJpVgB+Z7DUeyDEqqwjjyAxkNrHdXSGEQ2/pGSr+JGvxI
   Q==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: 0fRRQu/LQvGxmgv7mbYjtg==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:50 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:47 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
Date: Thu, 12 Sep 2024 18:00:22 +0100
Message-ID: <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
mailbox controller.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
new file mode 100644
index 000000000000..dc2cbd5eb28f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Inter-processor communication (IPC) mailbox controller
+
+maintainers:
+  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+
+description:
+  The Microchip Inter-processor Communication (IPC) facilitates
+  message passing between processors using an interrupt signaling
+  mechanism.
+  This SBI interface is compatible with the Mi-V Inter-hart
+  Communication (IHC) IP.
+  The microchip,sbi-ipc compatible string is inteded for use by software
+  running in supervisor privileged mode (s-mode). The SoC-specific
+  compatibles are inteded for use by the SBI implementation in machine
+  mode (m-mode).
+
+properties:
+  compatible:
+    enum:
+      - microchip,sbi-ipc
+      - microchip,miv-ihc-rtl-v2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 5
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 5
+
+  "#mbox-cells":
+    description:
+      For the SBI "device", the cell represents the global "logical" channel IDs.
+      The meaning of channel IDs are platform firmware dependent. The
+      SoC-specific compatibles are intended for use by the SBI implementation,
+      rather than s-mode software. There the cell would represent the physical
+      channel and do not vary depending on platform firmware.
+    const: 1
+
+  microchip,ihc-chan-disabled-mask:
+    description:
+      Represents the enable/disable state of the bi-directional IHC channels
+      within the MIV-IHC IP configuration. The mask is a 16-bit value, but only
+      the first 15 bits are utilized.Each of the bits corresponds to
+      one of the 15 IHC channels.
+      A bit set to '1' indicates that the corresponding channel is disabled,
+      and any read or write operations to that channel will return zero.
+      A bit set to '0' indicates that the corresponding channel is enabled
+      and will be accessible through its dedicated address range registers.
+      The remaining bit of the 16-bit mask is reserved and should be ignored.
+      The actual enable/disable state of each channel is determined by the
+      IP block’s configuration.
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - "#mbox-cells"
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sbi-ipc
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,miv-ihc-rtl-v2
+    then:
+      properties:
+        interrupt-names:
+          items:
+            pattern: "^hart-[0-5]+$"
+
+examples:
+  - |
+    mailbox {
+      compatible = "microchip,sbi-ipc";
+      interrupt-parent = <&plic>;
+      interrupts = <180>, <179>, <178>;
+      interrupt-names = "hart-1", "hart-2", "hart-3";
+      #mbox-cells = <1>;
+    };
+  - |
+    mailbox@50000000 {
+      compatible = "microchip,miv-ihc-rtl-v2";
+      microchip,ihc-chan-disabled-mask=  /bits/ 16 <0>;
+      reg = <0x50000000 0x1C000>;
+      interrupt-parent = <&plic>;
+      interrupts = <180>, <179>, <178>;
+      interrupt-names = "hart-1", "hart-2", "hart-3";
+      #mbox-cells = <1>;
+    };
-- 
2.34.1

