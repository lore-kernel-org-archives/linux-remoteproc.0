Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC513F43B;
	Mon,  5 Aug 2024 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840658; cv=none; b=rD1vBXmBZIQWZdSepdZWhbuWvArWyfRPWU99oAYu3JYPiSImB/vcxdVH8hPbDOVkD812GjU9nZe75Z+CiWWXAQsxUeCx7xhiN/HwYU17AA6X7TqIk9m79Itkv5lInXlla8MS/aKLD5seCEbBDihZXlDREaXQZNnwqpRYiqHzIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840658; c=relaxed/simple;
	bh=F8k9r8BUGbr6g+ByknBVyvDtyej0rl20Df736rYIP6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBa9GOhSVHYxZj4PNl32wMVWgPFZLrKSpDCtX3uuaZCh94rv8GRjn7df1TA+1YbCxEDj2ek2exKZ7kYuQDKmCYorf1uCMknfjE9OUHGqsXRtHAwlqkWZRHptkhv+p8FQaxmFduslnW4xe0YTiYSjLNYZuOY2AJD+o4ddDYDAbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgIjjaxk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgIjjaxk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f040733086so113918061fa.1;
        Sun, 04 Aug 2024 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722840654; x=1723445454; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lo0EVSY+TfT8L8/sSMyECnUc5O+qTq+MsAT9bard+EQ=;
        b=CgIjjaxkomrCvjJX+pGEw9R77qO0UfZQsVX8FjOARveKVjBnYkqgRCwH5LrC1Jh827
         9pg+bJd5FL6zVHkxDcLB7FOcjkUFWZ5EB3GjjmgQQdzSa8yDbhXTYh0X4HJjswKydIIX
         N4WU84uR3znsDUdA1tFR/9YSRsZoOu3q47LqfSUvAnhYZ3kdZtnGmk28OgY5E3SzVywe
         n1C/Bc/VOniHag6JJpw/SAnQzPSX7cFp0oPOuRZYvm6MpAN+aRli2UWAwQgyG7oL8sJn
         C6zkoe2dsea2DYo/3xrj7hP2K3BCudhEnHHvO44g7z3rSHu90WxAixNbdFbosZk4KLEP
         pOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722840654; x=1723445454;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lo0EVSY+TfT8L8/sSMyECnUc5O+qTq+MsAT9bard+EQ=;
        b=tVVy1ebZcCjKTXKxy6Jg6zz3acy9GSjB2QHfV8j/rbT3p6SxuXB4UhGDFnxHJ7dZrT
         RCHxyPnctZkEc6NQA2togga9UcVeK8EkNHvq3UU8nL3LPjkcwJbazb6Jy/enQaYBTM0C
         XWQUpV/XDMiNCio1IYBscMRl593RHKvrL6uT784/flmLHg/et6Ve1v27muULq6RX5atH
         ThwV7IrmPK/KfX38APJVe/B8aZzUm2ll4xA78lsCT3euMPtKNSVFnJCR9+D2lpA3CLpf
         7CzQ33fPZWYQ27dEnxsLQY/3Ie0XIU10x+4qNN+BQuhaWmLiRnPcqyEnEPYTycFqRmK5
         oVcg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGr3gievPwfhodBaENVhguAfuPIIRNKdN6ytfKNjyXe/IoK7r4m4S8XlobS1ojesu567lNF0LJMyalsD46sGJWaGXJKAqomJGUH6MMMTAf9lTY+QjA082DMYPScF2li/w1BJxydPSHw==
X-Gm-Message-State: AOJu0YxM1WJsyIxBW3Vung5vI5oFMzjrgnBgCdeQUTVD7EgEDO7bSxs8
	6MCozvJmTRSJuTpbxphNQr6H/TD+241euPKmQX4tXIIqYhc7bAgG
X-Google-Smtp-Source: AGHT+IEvKhEeYUv4IJVDZ9KODEkzGCuN503wdwOpgmS6fqT8bXG6WYYyOpU21syJ7Ip1EqjgM10VjA==
X-Received: by 2002:a2e:96d7:0:b0:2ec:5b17:29a2 with SMTP id 38308e7fff4ca-2f15ab237efmr76155341fa.32.1722840653988;
        Sun, 04 Aug 2024 23:50:53 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e11c8eb9sm152253755e9.16.2024.08.04.23.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 23:50:53 -0700 (PDT)
Date: Mon, 5 Aug 2024 08:50:51 +0200
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
Subject: [PATCH v3] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
Message-ID: <ZrB2S71BsxGAVXfQ@standask-GA-A55M-S2HP>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V3:
  - add Baolin's R-b
  - rebase on next-20240805
  - add lore links to V1 and V2 to the changelog

Changes in V2:
  - fix double space in example
  - switch to #address-cells = <1> and #size-cells = <1> in example
  - add Conor's R-b

Link to V2: https://lore.kernel.org/lkml/ZoaJ04kASEs9M4f6@standask-GA-A55M-S2HP/
Link to V1: https://lore.kernel.org/lkml/ZoVDeHCUCTZu7AT%2F@standask-GA-A55M-S2HP/

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

