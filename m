Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E71274FE8
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Jul 2026 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484424; cv=none; b=VGKnYDqUo0QhY4/8mwgdvGmqIgFYH8uzHsm151p1aKtFwvLCVd2JUxMDm/p20Zszhy/JTpHUS8QglcihcNz1GnsSmXxAeu8m5nB1r1ECIdr05jXqWX4eVrO/gTh3PfI/sI4TxhjGnjvyHl1RxDDGug0kuq9b+3Tn00Up2gtWAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484424; c=relaxed/simple;
	bh=nYPW8u6uyTHQUIxZwar3cGnwsnDzXk+4jRi9BdZG3ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nfFOL+52CI+LQeuyjKrwQ7fHzo7KiBn4cSx1rBYV57fyRLsdlvS10mcg4bTpSqrIcXPG1DW2T+rNzQBBWgmoCUbk2U6POr5J48UQCKM0AZbAfUAO+AK97U2sPbYeanYatJnx2F7dXlNVlgTgT2tlwdM83Pcxbe817X/cQjeE9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDY1bKg9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDY1bKg9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceeee8c46bso15780105ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Jul 2026 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484419; x=1785089219; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VXKjPNLcmAi6L9Skt9OWsTPDWKtQt0gc05f/bWe+W8E=;
        b=hDY1bKg9zanKV+wENfMwwjOOu77EUyNCzoMTyzilMPisMWzbRdMmxsL2XNyUvqeQn1
         UEOuQlIRFD95Fvu9rpkQcQWiPIgGk3BzUbIuVhE7vMFdlkVfJ6Rnw7Kb+pL8v1O/mGXR
         ykvkF3ufSLLexzPcXliw07S8WvEMPwmSVTn+J7kqC5D64We+ECOogFpr+iOqpdaruE6I
         xIh+KOgI4naDgdgMwHF+umEqrsiMEydrRPICA0UA+6p9ayK+vB0o2a5G0BK9nomu6Jmr
         eUe2BvBTQ/+hIUVyFcVhCPKSApjQYsqlVbN81dxQvA9T1FPJ03I1wAXbQ6Tahf7nVJRl
         Yd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484419; x=1785089219;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VXKjPNLcmAi6L9Skt9OWsTPDWKtQt0gc05f/bWe+W8E=;
        b=qY1J7tJnKEfH52eOa17ONwUkmtrFuij9j8i6OU9AANTp8pWakN64C8EXsJ3bL4rOmv
         D6f1qIW9l/0jsTpnMTLYncJRj45Jwo2gEru1/HwR1KP1gHVArm0aEdgFlIf9mcHONgtt
         sFLatA7qeNp0RkV1sDYDwLdGA3LZFs70aE8eIkXl2jSD8Gs5d2+K48Oe9eo3KSnsCjuV
         lhGH++ebpEKwZU1D/SPpEz3BJRdy5gHkBLsk5HKIaPfJPgFkYiWgXxrD2WO54xf4xo1i
         CX7qQvj3hVARMESev/45mM7inUuVNQvMRP0lRlJdVh/NHN+bXGUHQIUuk02OjRrSYHRx
         nINQ==
X-Gm-Message-State: AOJu0YyqHTTIDxxYNGaiIlcASARYi8YkS5ys8iMDirq2oRroGolK51ZL
	EqbOSCd+Py79QvaJNHcVZEOCJmst3mYgcJRtKg6TNd0Y2qnPi9wIckt5
X-Gm-Gg: AfdE7cl0Np9WFZcSAl4Q+HabGJwH4WuIiMK+utLsCbwRa305z/MKFI2X+pKf9Yuffl4
	KaTexMDoT1fQdmDJL8AT8SUGcpEHxhlND61/xEdQ8MyHTdqZIRrHInTiIEFZx94q2+uSIOLRVAG
	8vD4b//UuIMGzn0NLexcgVsJeRUyTQq1GZliHHhhIaGETFVbsVNc5sPXJRL7aJ1o+rTLi5sZ5QF
	GC3Ht3kETMk12i33o4inIHtqCDY3zJLUubylvw5ubsfJW9dHC5ZLS+GvL+2fNcE/X2Evtj28uPz
	vAEQrqTWE/UahTaAaOXLu+YL2eb/z+hXObvRn7IClxHIsNV8s73CKVmYByB7iXUt/eKJa/LS3h0
	MI8RtNC5cWqZKQnopNd4dOWsfpxgX+lvRRo3g8NOir0/s+Qk5URJpHOvGhLb6RVxx6jJyJsoRej
	NlmtLMvYxf3DyWD1Y=
X-Received: by 2002:a17:90b:5683:b0:381:fa5:5217 with SMTP id 98e67ed59e1d1-38e4b5d7cbemr8569087a91.7.1784484418607;
        Sun, 19 Jul 2026 11:06:58 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5429:66ef:148c:83c3:bdaf:6e79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm30175126eec.27.2026.07.19.11.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:06:57 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 19 Jul 2026 23:36:41 +0530
Subject: [PATCH] dt-bindings: remoteproc: ti,wkup-m3: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-ti-wkup_m3-v1-1-848a95b401a5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWw5AMBBA0a3IfGvSkii2IiLVDoZ4pPVKxN4Vn
 +fj3gscWkIHeXCBxZ0czZOHCAPQnZpaZGS8IeJRwqXI2ErsGLalGmOGRmkpUsON1OCDxWJD5zc
 ryt9uq3vU63uA+34AR2VqN24AAAA=
X-Change-ID: 20260719-ti-wkup_m3-edac718d0d7c
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484407; l=5646;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nYPW8u6uyTHQUIxZwar3cGnwsnDzXk+4jRi9BdZG3ss=;
 b=QuOz4RhOhj777+xMDHSHDwYenPrrK9x2l/wVHW95ATDA2YgHvue3+fbTIXMEpO2DYGSW8LnvL
 lnFN60DauCZCq7yePcbfZUIzdemWm2rfEPQtwrMnYqptcRRwx7/t2TK
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments Wakeup M3 Remote Processor from text to Dt
schema. Add optional resets and reset-names property which was missing
from legacy binding. make ti,hwmods deprecated as it no longer needed,
it is kept to support older board files without ti,sysc.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/remoteproc/ti,am3352-wkup-m3.yaml     | 89 ++++++++++++++++++++++
 .../bindings/remoteproc/wkup_m3_rproc.txt          | 52 -------------
 2 files changed, 89 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
new file mode 100644
index 000000000000..9e8a03acdec4
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,am3352-wkup-m3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx/AM43xx Wakeup M3 Remote Processor
+
+maintainers:
+  - Suman Anna <s-anna@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  The TI AM33xx and AM43xx family of devices use a small Cortex M3 co-processor
+  (commonly referred to as Wakeup M3 or CM3) to help with various low power
+  tasks that cannot be controlled from the MPU. This CM3 processor requires a
+  firmware binary to accomplish this. A wkup_m3 device node is used to
+  represent the Wakeup M3 processor instance within the SoC. It is added as a
+  child node of the parent interconnect bus (l4_wkup) through which it is
+  accessible to the MPU.
+
+properties:
+  compatible:
+    enum:
+      - ti,am3352-wkup-m3
+      - ti,am4372-wkup-m3
+
+  reg:
+    items:
+      - description: Address range for UMEM
+      - description: Address range for DMEM
+
+  reg-names:
+    items:
+      - const: umem
+      - const: dmem
+
+  ti,pm-firmware:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of firmware file to be used for loading and booting the wkup_m3
+      remote processor.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: rstctrl
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+    description:
+      Name of the hwmod associated with the wkupm3 device.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,pm-firmware
+
+dependencies:
+  resets: [reset-names]
+  reset-names: [resets]
+
+additionalProperties: false
+
+examples:
+  - |
+    target-module@0 {
+        compatible = "ti,sysc-omap4", "ti,sysc";
+        reg = <0x0 0x4>;
+        reg-names = "rev";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x00000000 0x00000000 0x4000>,
+                 <0x00080000 0x00080000 0x2000>;
+
+        cpu@0 {
+            compatible = "ti,am3352-wkup-m3";
+            reg = <0x00000000 0x4000>,
+                  <0x00080000 0x2000>;
+            reg-names = "umem", "dmem";
+            resets = <&prm_wkup 3>;
+            reset-names = "rstctrl";
+            ti,pm-firmware = "am335x-pm-firmware.elf";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt b/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
deleted file mode 100644
index 3a70073797eb..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-TI Wakeup M3 Remoteproc Driver
-==============================
-
-The TI AM33xx and AM43xx family of devices use a small Cortex M3 co-processor
-(commonly referred to as Wakeup M3 or CM3) to help with various low power tasks
-that cannot be controlled from the MPU. This CM3 processor requires a firmware
-binary to accomplish this. The wkup_m3 remoteproc driver handles the loading of
-the firmware and booting of the CM3.
-
-Wkup M3 Device Node:
-====================
-A wkup_m3 device node is used to represent the Wakeup M3 processor instance
-within the SoC. It is added as a child node of the parent interconnect bus
-(l4_wkup) through which it is accessible to the MPU.
-
-Required properties:
---------------------
-- compatible:		Should be one of,
-				"ti,am3352-wkup-m3" for AM33xx SoCs
-				"ti,am4372-wkup-m3" for AM43xx SoCs
-- reg:			Should contain the address ranges for the two internal
-			memory regions, UMEM and DMEM. The parent node should
-			provide an appropriate ranges property for properly
-			translating these into bus addresses.
-- reg-names:		Contains the corresponding names for the two memory
-			regions. These should be named "umem" & "dmem".
-- ti,hwmods:		Name of the hwmod associated with the wkupm3 device.
-- ti,pm-firmware:	Name of firmware file to be used for loading and
-			booting the wkup_m3 remote processor.
-
-Example:
---------
-/* AM33xx */
-ocp {
-	 l4_wkup: l4_wkup@44c00000 {
-		compatible = "am335-l4-wkup", "simple-bus";
-		ranges = <0 0x44c00000 0x400000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		wkup_m3: wkup_m3@100000 {
-			compatible = "ti,am3352-wkup-m3";
-			reg = <0x100000 0x4000>,
-			      <0x180000 0x2000>;
-			reg-names = "umem", "dmem";
-			ti,hwmods = "wkup_m3";
-			ti,pm-firmware = "am335x-pm-firmware.elf";
-		};
-	};
-
-	...
-};

---
base-commit: c6859eed755df351a3978b33cb92365f9b3e8f06
change-id: 20260719-ti-wkup_m3-edac718d0d7c

Best regards,
-- 
Bhargav

