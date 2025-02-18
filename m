Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E026E634;
	Tue, 18 Feb 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895247; cv=none; b=GRNHiO3EAmYvmwnqLq1qwba5X3ypPrQGmUfvkvPbpOv40m1bGvvX/8Aa+nan/HSUKMKPLDhfZpSsrNAA7n4IZgwCS3u6M5pMFmQltiIC1b2+4ErrSMGwdYI2CZD55SHuVORXEU06gXtb1O0WHsa8VtjhryxNxfnJ8fK3ycsuzIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895247; c=relaxed/simple;
	bh=QERHkl/V9lV5UIXOlipCfHSfkDdvOfyeCTe7/qY/tEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uF3kLBLzZgz6Ia8EJQmqB4QqLueKuEiFfwhdkgLmQHc6B6UgvAYL4NzD/VupauyG09LZ4xSOSJ0PebkEPzwbvrawMToVU673akPwXE/z3lkIPf5jfZ2KpaqQNlC+TUeanK0ACjKcQ1Y97Be1JzvoIbb7h2Ba8khr5W9E78bG4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUzDrhRe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUzDrhRe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2212a930001so60858475ad.0;
        Tue, 18 Feb 2025 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739895245; x=1740500045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVj+BEh1+9LUAzm0IUaqd3Q04b9Nlt+xlsc1OoHZ4LQ=;
        b=JUzDrhRe8pDy2ms9N/r+6Vu/OboR2VduV9rMN+ruwpX+GF2k4fbZCacEQpZ6SDPFYv
         tbXDKiAg0VgDOM58EPFMF5YW27Jp7FoQys7xENwirTisO4ilpet80w0uA+fPb3jXlCQc
         1sfjO3uGU97Xo3IzfJ4GBIuujbitQRZFCLo9mKM16ivqSeM8BqyuTaNj9S/FA15pxcla
         pNWw4XH6ut5r9kofvMnOGEzq2KlWz9qWcsZob1w9Rxo4rC6vjMPId7861HviEvW2Bpi2
         3rriF18mUhz+/p/erlOGXdDgGkAULQCTZItzXDsgLd7PvgCcT/7evt8qFnKb0T7ouUP+
         APug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895245; x=1740500045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVj+BEh1+9LUAzm0IUaqd3Q04b9Nlt+xlsc1OoHZ4LQ=;
        b=kwK9EI7Qqh37RtpYgiF3iLox4i5llC+Tcq6m9NQJrIJ+G4sbc80LE+dcuAmFeKcfUl
         GxMDDglMbq+z0ZAx0PJOy7HUSzxkEYy94CyTn/B+NasHB3BBIPIx149aeqUPdbm8OJU1
         kNZSBGmLCfV+QD8rn2yNzk5uWY19HhBN85aN7wjS/nBxp62TB4wxuOkH0xxHwqXjDwqj
         8DCTRvB/xGkvXGHco8aTMvLcp0qkaLTs3ttwYmdk1mlmD65O78e+eoIwpRsMReJYZB+n
         +v6ewcpCAmG0AdKb0vD9hLvu/udSflEpNPhCzXKLRTzV8ZGxkzlv0sJ6ZF85hXZIVT5M
         aX4A==
X-Forwarded-Encrypted: i=1; AJvYcCV7mpONfrwm1mJEKgH6X2HATgt4i2soUNOjIRQ885jl+BbECbzzB7s9BP638tau10PfZDH8OzgYWxVl3ug=@vger.kernel.org, AJvYcCXaQP+EKaZKmtUBFRonaD3DNhhVvbDZ2UJuUu3IfJ7Za6GcACK63b075C0XPMfrS/Z103szHHXopFU4skTgJyq4Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIuGgi/tgQn1O8ZCAIbxyz/Ypz6+djeiI5LnTtdqjQjfBb1mG
	lKvIx0AMwb/RFqUYD3MJMjWSOYORlWsTCH+B/ADsWg3UcLsyOKwZ1CJgccET69s=
X-Gm-Gg: ASbGncvrwmVPzfnjzOlCbW4v3quLii4dpgmJQrk9XxATc2Hj5RHsfFnhMsnsATN+ytx
	fDXnN7QyQWmn1Z5rp2Hm1sCVtPMXDkMRnG3MaU42JwsF2zaA3iWqXC7ZXtO0muME5lh3U0pRxfj
	QKWhB67onqg+cWMHvgqPVADW7ssZzn4UwB5aSl/yukxS8+VJpEvBVFVqv95QbUg4cFwLgSAsPTW
	wE3dTs17xINkOG6ee9JgiJva7/722XuV8dY+Aa+lzd6otIA7PLQbLBKzYUHEIK6zJCcTVXyxAVO
	dq/+l8+Vy9QmcSJX/4QgjeQ2H1Uot0gQszlIqw==
X-Google-Smtp-Source: AGHT+IFL56XC6i8cvX7WNC3OfD2xcmGHIV7BQiHSo46T2lN7bkJSuuHQzbhNoorPwTW+txhSxOIvig==
X-Received: by 2002:a17:903:2f8c:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22104038460mr211908965ad.20.1739895244758;
        Tue, 18 Feb 2025 08:14:04 -0800 (PST)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53490b6sm90934545ad.16.2025.02.18.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:14:04 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: devicetree@vger.kernel.org,
	andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BiscuitBobby <simeddon@gmail.com>
Subject: [PATCH] dt-bindings: hwlock: Convert to dtschema
Date: Tue, 18 Feb 2025 21:39:35 +0530
Message-ID: <20250218161352.269237-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: BiscuitBobby <simeddon@gmail.com>

Convert the generic hwspinlock bindings to DT schema.
---
 This is my first time converting bindings to dt schema, please let me
 know if I have overlooked anything.
 .../devicetree/bindings/hwlock/hwlock.txt     | 59 -----------------
 .../devicetree/bindings/hwlock/hwlock.yaml    | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/hwlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/hwlock.txt b/Documentation/devicetree/bindings/hwlock/hwlock.txt
deleted file mode 100644
index 085d1f5c916a..000000000000
--- a/Documentation/devicetree/bindings/hwlock/hwlock.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Generic hwlock bindings
-=======================
-
-Generic bindings that are common to all the hwlock platform specific driver
-implementations.
-
-Please also look through the individual platform specific hwlock binding
-documentations for identifying any additional properties specific to that
-platform.
-
-hwlock providers:
-=================
-
-Required properties:
-- #hwlock-cells:        Specifies the number of cells needed to represent a
-                        specific lock.
-
-hwlock users:
-=============
-
-Consumers that require specific hwlock(s) should specify them using the
-property "hwlocks", and an optional "hwlock-names" property.
-
-Required properties:
-- hwlocks:              List of phandle to a hwlock provider node and an
-                        associated hwlock args specifier as indicated by
-                        #hwlock-cells. The list can have just a single hwlock
-                        or multiple hwlocks, with each hwlock represented by
-                        a phandle and a corresponding args specifier.
-
-Optional properties:
-- hwlock-names:         List of hwlock name strings defined in the same order
-                        as the hwlocks, with one name per hwlock. Consumers can
-                        use the hwlock-names to match and get a specific hwlock.
-
-
-1. Example of a node using a single specific hwlock:
-
-The following example has a node requesting a hwlock in the bank defined by
-the node hwlock1. hwlock1 is a hwlock provider with an argument specifier
-of length 1.
-
-	node {
-		...
-		hwlocks = <&hwlock1 2>;
-		...
-	};
-
-2. Example of a node using multiple specific hwlocks:
-
-The following example has a node requesting two hwlocks, a hwlock within
-the hwlock device node 'hwlock1' with #hwlock-cells value of 1, and another
-hwlock within the hwlock device node 'hwlock2' with #hwlock-cells value of 2.
-
-	node {
-		...
-		hwlocks = <&hwlock1 2>, <&hwlock2 0 3>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/hwlock/hwlock.yaml b/Documentation/devicetree/bindings/hwlock/hwlock.yaml
new file mode 100644
index 000000000000..2492fdad3c6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/hwlock.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/hwlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Hardware Lock (hwlock)
+
+description: |
+  Generic bindings that are common to all the hwlock platform specific driver
+  implementations.
+  Please also look through the individual platform specific hwlock binding
+  documentations for identifying any additional properties specific to that
+  platform.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Rob Herring <robh@kernel.org>
+  - Krzysztof Kozlowski <krzk+dt@kernel.org>
+  - Conor Dooley <conor+dt@kernel.org>
+
+properties:
+  $nodename:
+    pattern: "^hwlock(@.*)?"
+
+  "#hwlock-cells":
+    description: |
+      Specifies the number of cells needed to represent a specific lock.
+    minimum: 1
+
+  hwlocks:
+    description: |
+      List of phandle to a hwlock provider node and an associated hwlock args
+      specifier as indicated by #hwlock-cells. The list can have just a single
+      hwlock or multiple hwlocks, with each hwlock represented by a phandle and
+      a corresponding args specifier.
+
+  hwlock-names:
+    description: |
+      List of hwlock name strings defined in the same order as the hwlocks,
+      with one name per hwlock. Consumers can use the hwlock-names to match
+      and get a specific hwlock.
+
+patternProperties:
+  "^hwlock@[0-9a-f]+$":
+    type: object
+    description: Hardware lock provider node
+
+required:
+  - "#hwlock-cells"
+
+additionalProperties: true
+
+examples:
+  # Example 1: A node using a single specific hwlock
+  - |
+    node {
+      hwlocks = <&hwlock1 2>;
+    };
+
+  # Example 2: A node using multiple specific hwlocks
+  - |
+    node {
+      hwlocks = <&hwlock1 2>, <&hwlock2 0 3>;
+    };
-- 
2.48.1

