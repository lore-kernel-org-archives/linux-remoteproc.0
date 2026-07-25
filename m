Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F34353A61
	for <linux-remoteproc@vger.kernel.org>; Sat, 25 Jul 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785009906; cv=none; b=TmpMI54S+NRmwq9udtVflww6plGAFlTM8FZWRmRhMPletNsowgp2g+4hSWldk7EKlmnM6HTbRfzsNwE/ItzOBl3RE6MLhc5I8g6v0AQ2FAkb3ida5OdF3Q91Qn/LsqC2X5HUdVKSUA9AU3XE83kmH6+vAsDPmy1cxbctqkh1ls8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785009906; c=relaxed/simple;
	bh=nIlnJRPNwvzsEQ9oqxaZZWX8opcLYnBostsYhgueMJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RsQlZ5+BrgfLzZ17iBsGwM12Nl+NkBH8lPPMYYBxA5I6wA3KvuKQFoUfgwWQJQ9UgMQW/iCCkTxFJOHifRREHYBAJON2z5mkeclvPeNpa6DJ6Xn2dk4v0PbYkY5eoHMEh3C9PyjVnsW19wJh253UsncuMDAF0YHD0WCHabf1tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEoKA0T2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEoKA0T2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso194768a12.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 25 Jul 2026 13:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785009904; x=1785614704; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I7YnUNHQ+9mCV7Z3kMgXnU2VDcDD/IXSwFksJNwhhcY=;
        b=KEoKA0T2mEkyJvTNPM5Vm/Xvyp9hwRzZlnqM16eRfXhdZf9OzsMXH4xKHwsYMihsgl
         +CEkEZrkc7BWEl0rFWev1ZHfXhTadwHc8TDPcPOXfOulOtkK8lftpWZgPp3bBL2wxyaM
         EV8YsQ+RnT7g3beOC+Ip5S4ouExrx0EH0XrZwTRMKlydNm8OdQyv7o/52ib17sXK4875
         iRHrRi+ZIAzzZhGVhPsgmR16r66pqpRQvlzzeOug/VTSXjnvNVWptfVtm2QOQqtHvhMm
         iHql2kwTLRPwibP38CgFUQtYF4rNR9j9QzolLsjDqYcs5LrvmGJpR6FNen4TF1bis1kH
         fFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785009904; x=1785614704;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I7YnUNHQ+9mCV7Z3kMgXnU2VDcDD/IXSwFksJNwhhcY=;
        b=mYpkZIqvircWV0cGly5jwu5m+tBEvYJ1QkMSVZU99nslVv6DR5SM6e8IQcXBHNwuN7
         zlUa6r2GrPn/WrCiWYOOvisa/mM0e7eZytNz22xYX0sY2Sw0sv8gtkwbXuU03uCd8wi5
         TPIee0+jrrB4F5nbhFlFyC+EkUvSz8oTPT4lh8/qAJxq2n0gH2lE3yMCKh7yCBLr/jex
         g5AtCMRB3yMdyIgxP82x0KpPJIENbvfbZAdskqmCFJr+YqNzudsRxGjT7GrHHGe0e0/W
         G/8N8vMHe7iD0CkUaiFqgOI3vpQ00g5H/GNlSKKgNM5QYwJ6SzFuuyy8TI+mG+PWYSP1
         UoCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3j3xhNayUIgVS+8N9ItViRwJHOg5vA5jG6aUWnuK/6IhVSWTR8yWjdolxN72BrEKmu9VWFA0fL2y+dYoRBdBF@vger.kernel.org
X-Gm-Message-State: AOJu0YzgpOPhVRhu0wDR0NYlvNo81ijZTxLVrBtO4lHcxzoeEwr+YFPp
	ATnDxiy19adAJdNG54UzR3N2zNpLUIQ9cspIG1NGsSLdUpchFdaqDJwF
X-Gm-Gg: AR+sD12F3Z2PtbhveH3dYINzTxYdyMj7Rn/ue53VAEUqzaHhR4vAurgOoOAs67f8M6c
	pNiA2zklw0wHor0a4Ijbkbhqa+sxmjp6SapyrOSY/3Z+S32XXwS0aSSjTr5JmDqMCSfmXev6hya
	xDb2VBE1VLBxoIyb4MUBtXpD7wkI2pTSxuNTOaFZBMQYDCU9bGUaMpvxvr7RrehyLkcIXnSJfDc
	e1vOZQa3hyA/LRLA9SHOQ+FHRKTefpAIPq9L4nZB+cxKjTPRo9ao5Htf8rw1CYfqM0KZEp4LWpq
	fyo2yjFaRhrUCYTtwP/w7iHbrxEaXPPS8n21U7Fs0uN/pYeWnt+Ti6XQ030Ovu0FTEHN/AxwHI4
	U/gESohsqhHHCqi5NauBSXaU9dJxRoKmG+sUiPfgg4zC3uPbK0hf0M7ja3E7NTZhh/Grsc4KEdo
	g/ZW59ddq0z2MznTc=
X-Received: by 2002:a17:902:d485:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2cfde882c08mr26162755ad.4.1785009904026;
        Sat, 25 Jul 2026 13:05:04 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5424:789e:7bf2:671d:d7ae:b910])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm13487817eec.15.2026.07.25.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 13:05:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 26 Jul 2026 01:34:08 +0530
Subject: [PATCH] dt-bindings: clock: ti,keystone-gate: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMBDFriKzdqBWqJ+riIuiTx2UKm0RRby7x
 WUgyUMBXhCozR7yOCXI7hIUeUbDYt0MljExaaWNqrThKLziDnF34NlG8LCtXE41StWYpFSU0sN
 jkuvfdv37filDG2BmAAAA
X-Change-ID: 20260726-ti-keystone-gate-clk-3f8e30966077
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Murali Karicheri <m-karicheri2@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785009889; l=4399;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nIlnJRPNwvzsEQ9oqxaZZWX8opcLYnBostsYhgueMJg=;
 b=tD0xE+8Vd2J6xBsPdrE5/hOSJEeWwG8G8stlnOTdRmfvqtVdO53Vho6dZ2rPDvV+knjEL6iUJ
 bPQ6WZZhneaADjLF+fTE1J4fS/IhkSeWm+0n6P1IYvLMad/RkBc+I3J
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments keystone PSC clock binding to DT schema.

The vendor-specific 'domain-id' property is intentionally kept without a
"ti," prefix to preserve existing ABI since driver and existing board
file use property without "ti," prefix.

Also update the reference to this binding in ti,keystone-rproc.txt to
point at the new filename.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/keystone-gate.txt    | 27 ----------
 .../bindings/clock/ti,keystone,psc-clock.yaml      | 60 ++++++++++++++++++++++
 .../bindings/remoteproc/ti,keystone-rproc.txt      |  2 +-
 3 files changed, 61 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/keystone-gate.txt b/Documentation/devicetree/bindings/clock/keystone-gate.txt
deleted file mode 100644
index 43f6fb6c9392..000000000000
--- a/Documentation/devicetree/bindings/clock/keystone-gate.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Binding for Keystone gate control driver which uses PSC controller IP.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,keystone,psc-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : parent clock phandle
-- reg :	psc control and domain address address space
-- reg-names : psc control and domain registers
-- domain-id : psc domain id needed to check the transition state register
-
-Optional properties:
-- clock-output-names : From common clock binding to override the
-			default output clock name
-Example:
-	clkusb: clkusb {
-		#clock-cells = <0>;
-		compatible = "ti,keystone,psc-clock";
-		clocks = <&chipclk16>;
-		clock-output-names = "usb";
-		reg = <0x02350008 0xb00>, <0x02350000 0x400>;
-		reg-names = "control", "domain";
-		domain-id = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml b/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
new file mode 100644
index 000000000000..ed42adb27832
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,keystone,psc-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Keystone PSC clock
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Murali Karicheri <m-karicheri2@ti.com>
+
+properties:
+  compatible:
+    const: ti,keystone,psc-clock
+
+  reg:
+    items:
+      - description: PSC control
+      - description: Domain
+
+  reg-names:
+    items:
+      - const: control
+      - const: domain
+
+  domain-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: PSC domain id needed to check the transition state register
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - domain-id
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clkusb@2350008 {
+        compatible = "ti,keystone,psc-clock";
+        reg = <0x02350008 0xb00>, <0x02350000 0x400>;
+        reg-names = "control", "domain";
+        domain-id = <0>;
+        clocks = <&chipclk16>;
+        clock-output-names = "usb";
+        #clock-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 91f0a3b0c0b2..847552133633 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -75,7 +75,7 @@ SoCs only:
 
 - clocks: 		Should contain the device's input clock, and should be
 			defined as per the bindings in,
-			Documentation/devicetree/bindings/clock/keystone-gate.txt
+			Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
 
 The following are mandatory properties for Keystone 2 66AK2G SoCs only:
 

---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260726-ti-keystone-gate-clk-3f8e30966077

Best regards,
-- 
Bhargav

