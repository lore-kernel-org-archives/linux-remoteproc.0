Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C51A4F39;
	Thu,  4 Jul 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093145; cv=none; b=MYntWJB80ilrm+b/iPApJ41r3r+5OFCP4aGanh5DhGlBYowKzwt71E0YEz7KdY9iZ2KXZRtVlDWC4Yl1xuLikg3fmUtfuWxrM7oKijv6DTwm7eDxnleRCOHmM2/3A3Jl6BDeBElAHqKBXey05wg6yy2t0RHyXa9H82uSOOQX++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093145; c=relaxed/simple;
	bh=zb2UtwgR4nZobCStOCzyvKYLA4QVMrx25u7MFUVL+1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gq4Pf95EiHfDJIYI6Zkebw7CateZALO+n5lE6ibClm8I4ZLyuKxWCO/3EfQn6ajOtC8Cs4kvc1gHrwG55GVlGE2b9L7qvqtNMVrnsBjdlU39rZeg2MbG93MyOXB8IQinJU/8EUkzmrHA/8yp9OU8JvMPNjVV1TGyb1AwyVNweVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEJ9T4Rz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEJ9T4Rz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36740e64749so319356f8f.0;
        Thu, 04 Jul 2024 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720093142; x=1720697942; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fYLZa4HHF1b9p/c/tnP9OoRCPiUlr8s0XzaHZbBLZA=;
        b=TEJ9T4Rz84XzuhCdljrwawGtWPs99qxE937GEYw5w9kn5J+qO+zmRVLOqC3kQwCUZs
         Tq2DDISTuMe/lwKxPPknH5yoMiUBFomtx8poH4H2RCL+iyRPw0oj5A4dtJphzxNr9QBK
         KTqhHiMH/ca7wr5Md04tyHRYRzgujMTn8imvpguaoHXc8UYvUJKZcroWMklOZQ+u8wvs
         3tJbn7S29Pj9oQ4d4N3mRSvzUr/Tt5iFb9ph0mIFeRDVrPajskSJW3zuf+7/VO1TWvex
         sG+XHeqFtxtvztgaOY4EDhAU6yG5G2kZAg9M71NcyBZFA4G7Nr1ZPVDHrRa4z7xSt9gs
         F7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093142; x=1720697942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fYLZa4HHF1b9p/c/tnP9OoRCPiUlr8s0XzaHZbBLZA=;
        b=I6rNYUVs4M2h5J9Rp/CDp0XSytu3xesZ4gukpZbH9Tuxi87KbvtJVx3CcDEu01MIcF
         4AVciIGupuJUisfFuqdI/CPimTHPgs7HpbGI/Gh7WrxKUnctP2crJM6JRxyqBlPm0yJI
         56tzN7h/C+1E+iSAIfG5AKkkx12EM+ejMImOscnxR14QiRW83fw6C9jPlp1hX1y9kJ+c
         QQVxHyNxinZV8BdhIjhZbgADrBI4biaw0yl7psEt0UmZkSJVCMN8SF+yIPr8FsO5zmsc
         6Q3gMXTfoX0q7bF9QPDLogmhfd1J8HjrfSrElv0zSW+PniCoju4+QyN/0fmcRRDf0C8i
         x3tA==
X-Forwarded-Encrypted: i=1; AJvYcCXZQkQlD4ejw3nOmPhjmjvwGrbPcY2E7qaazx2iqkR3sFT1ZeQLa8gppY1Wz12FwDnmAIjIXDcqOQqdDUa9RSBuC6g4aZD/retVygdysTUPN3ooT39biVhJM2dJFaa66wdur5EwEpwJwg==
X-Gm-Message-State: AOJu0YyjsWXeEnxLW2WIsizCYrGAkULEtQtjqOhd9vWmN3n0JjdexjME
	UtY3eKJMns7hE8lIRkUpVAxiuvWIOTjXCcjJ7uf8YHCWUE4zMSNa
X-Google-Smtp-Source: AGHT+IGiAuo18UNK1htUlJ8y7qww4/M1cpsp0NG4pEBPoLNYgn01/ktpjlibsxE8k0XCW4HG3z//aA==
X-Received: by 2002:a5d:5489:0:b0:367:911b:ff6f with SMTP id ffacd0b85a97d-3679dd29485mr965923f8f.18.1720093142121;
        Thu, 04 Jul 2024 04:39:02 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb92fsm18382943f8f.88.2024.07.04.04.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:39:01 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:38:59 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, baolin.wang7@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
Message-ID: <ZoaJ04kASEs9M4f6@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the Spreadtrum hardware spinlock bindings to DT schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
  - fix double space in example
  - switch to #address-cells = <1> and #size-cells = <1> in example
  - add Conor's R-b

 .../bindings/hwlock/sprd,hwspinlock-r3p0.yaml | 50 +++++++++++++++++++
 .../bindings/hwlock/sprd-hwspinlock.txt       | 23 ---------
 2 files changed, 50 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
new file mode 100644
index 000000000000..abe11df25761
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/sprd,hwspinlock-r3p0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum hardware spinlock
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    const: sprd,hwspinlock-r3p0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: enable
+
+  '#hwlock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#hwlock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+
+    hwlock@40500000 {
+      compatible = "sprd,hwspinlock-r3p0";
+      reg = <0x40500000 0x1000>;
+      clocks = <&aon_gate CLK_SPLK_EB>;
+      clock-names = "enable";
+      #hwlock-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
deleted file mode 100644
index 581db9d941ba..000000000000
--- a/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-SPRD Hardware Spinlock Device Binding
--------------------------------------
-
-Required properties :
-- compatible : should be "sprd,hwspinlock-r3p0".
-- reg : the register address of hwspinlock.
-- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
-	hwlock, so the number of cells should be <1> here.
-- clock-names : Must contain "enable".
-- clocks : Must contain a phandle entry for the clock in clock-names, see the
-	common clock bindings.
-
-Please look at the generic hwlock binding for usage information for consumers,
-"Documentation/devicetree/bindings/hwlock/hwlock.txt"
-
-Example of hwlock provider:
-	hwspinlock@40500000 {
-		compatible  = "sprd,hwspinlock-r3p0";
-		reg = <0 0x40500000 0 0x1000>;
-		#hwlock-cells = <1>;
-		clock-names = "enable";
-		clocks = <&clk_aon_apb_gates0 22>;
-	};
-- 
2.34.1

