Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAD85298;
	Wed,  3 Jul 2024 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009598; cv=none; b=YDsLg8N/8dffCOeErj6i8bCEm69OZSgNvDNJcQgX4dxb6Z7xV4vhLfy4ePyBJ2wY/vM13R2yZpdum4vQLH6loKIQT4zxBjmwJRHqDXelOC4yvVY+vCDkQGqUzsMmybRVabF7Q0Rtk47mvn3bpuvl4KVRsoz0UbqK0m/QxWMc4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009598; c=relaxed/simple;
	bh=h2LjxXC0OzDiJd2LZJkR6AgXeDFIt2ME+WnIdf3EMAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWByK92Wr0PTl9gDWJK6mbTO95yQ3gsrJUdt5IKwPRDTF6MfEmeI8wA2wodQYdUZ3tX+MoroPxp/jE0iPl7rjFMAflHpJLqPxX9CdQs6PHZC7Zcx95stcNijVNtv3M5ydMs/ED4NMU5LDLIeMHKnQl0tq86rPWAPuSxGV1vh+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKhx1sjR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKhx1sjR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4256f102e89so36167535e9.0;
        Wed, 03 Jul 2024 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720009595; x=1720614395; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7FAFQKiJKwdtByQPY9Z255c9YVtWF2910FResQyaq4=;
        b=iKhx1sjR9CXgGTeerYy4JmNE/rD3ZgW+EN4OkEDuVf1r32WWaJtHEFpSbSeWrq2TcF
         J0H2uQQDgYPOrV58G7XGXj1DQnvQyIFzrpKf/w2QN/5swnZabL5ovcWFpZihOAzvXldW
         guRSi3fRoxYFzfH4teaDbBCh9OJvcoYFjb88tv+Wb/BbFQ8dqO1uJdCRhB1t3XA+BAn3
         kdSTdMRsY3LIUU++58YcIl9lPX2F7KqU2oR/lFZ6EEEhY3aJGEoDHYUWaZszCArhuRv1
         NPF6UEYsjQhGWyAXY4lx3IWFZFCUfFBq1cIjkGvJoNt4cWne0AteOYcMTrmqWsD1udZ6
         a2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009595; x=1720614395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7FAFQKiJKwdtByQPY9Z255c9YVtWF2910FResQyaq4=;
        b=xDOUj3kmYZGVrQwurJ3s6J/8U0lbnXqHx1AMWSFbz6d8rv1Ooq/YRQpMZJVPVY30DG
         6neSS1D5plVB5bbeBS0yBlsUv0x+ZiJlXqjiJu2uNcjXT8IiU4hg0ujeLVLovHaiNth1
         VDBOqInRIRBFNFBii3uNBYDX5dxc8NcoQLdW6Hj9j3XerEKGZgDBhEkMN6qFDOv2tXeF
         VxSvqOUv0ZpVRR6KfFWNo+ZCA+qFTrTtqlGZ5mWsUJ9/+jtTYy+gUlvMP/Wffo6KVbGK
         XHztK8bAezh3sJnKyg5jL78WlHUbKQiDJpqY+8bKS+nQiVlFePLNxo908rINULMRs096
         9zMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoiTsMC/YfCQNoYZCtfQt1/G4aOGeaFiVlxRD7IklgUCiIij+aCj6WQt83SNTXpU5gQzjvBL7CG91LU3HQzumqO4ebyg+mAzMso1BkZBYySvpdUeWnKVPOPmMoopuIMfavCEx37F+pcA==
X-Gm-Message-State: AOJu0YwWWqRhnBYrsE16VR68IKQjGUC1F05mHrzb8N8z6fSp45BN3hAM
	7rwBUZFsbida6Jj+piW8/WXGXlAxJH8V+KpiHWCr8nd9r0nG53Z6z/bKxg==
X-Google-Smtp-Source: AGHT+IEbC62WyVRYSYk89Jxzx2m+kO+O2DjKrDtUHxJi5KUMHCWNCu5CY/nLJuBq8xo7BP1Ckx/HeQ==
X-Received: by 2002:a5d:64c5:0:b0:360:89a3:5293 with SMTP id ffacd0b85a97d-3677561fce9mr8359135f8f.0.1720009594435;
        Wed, 03 Jul 2024 05:26:34 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e143csm15727240f8f.59.2024.07.03.05.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:26:33 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:26:32 +0200
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
Subject: [PATCH] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
Message-ID: <ZoVDeHCUCTZu7AT/@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the Spreadtrum hardware spinlock bindings to DT schema.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../bindings/hwlock/sprd,hwspinlock-r3p0.yaml | 55 +++++++++++++++++++
 .../bindings/hwlock/sprd-hwspinlock.txt       | 23 --------
 2 files changed, 55 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
new file mode 100644
index 000000000000..b146b1c20edb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sprd,hwspinlock-r3p0.yaml
@@ -0,0 +1,55 @@
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
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      hwlock@40500000 {
+        compatible  = "sprd,hwspinlock-r3p0";
+        reg = <0 0x40500000 0 0x1000>;
+        clocks = <&aon_gate CLK_SPLK_EB>;
+        clock-names = "enable";
+        #hwlock-cells = <1>;
+      };
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

