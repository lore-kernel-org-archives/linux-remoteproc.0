Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v2 1/6] dt-bindings: hwlock: add support of shared locks
Date: Thu, 25 Apr 2019 11:17:18 +0200
Message-ID: <1556183843-28033-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
References: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Use #hwlock-cells value to define whether the locks can be shared
by several users.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/hwlock/hwlock.txt          | 27 ++++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/hwlock.txt b/Documentation/devicetree/bindings/hwlock/hwlock.txt
index 085d1f5..e98088a 100644
--- a/Documentation/devicetree/bindings/hwlock/hwlock.txt
+++ b/Documentation/devicetree/bindings/hwlock/hwlock.txt
@@ -13,7 +13,7 @@ hwlock providers:
 
 Required properties:
 - #hwlock-cells:        Specifies the number of cells needed to represent a
-                        specific lock.
+                        specific lock. Shall be 1 or 2 (see hwlocks below).
 
 hwlock users:
 =============
@@ -27,6 +27,11 @@ Required properties:
                         #hwlock-cells. The list can have just a single hwlock
                         or multiple hwlocks, with each hwlock represented by
                         a phandle and a corresponding args specifier.
+                        If #hwlock-cells is 1, all of the locks are exclusive
+                        (cannot be used by several users).
+                        If #hwlock-cells is 2, the value of the second cell
+                        defines whether the lock is for exclusive usage (0) or
+                        shared (1) i.e. can be used by several users.
 
 Optional properties:
 - hwlock-names:         List of hwlock name strings defined in the same order
@@ -46,14 +51,22 @@ of length 1.
 		...
 	};
 
-2. Example of a node using multiple specific hwlocks:
+2. Example of nodes using multiple and shared specific hwlocks:
 
-The following example has a node requesting two hwlocks, a hwlock within
-the hwlock device node 'hwlock1' with #hwlock-cells value of 1, and another
-hwlock within the hwlock device node 'hwlock2' with #hwlock-cells value of 2.
+The following example has a nodeA requesting two hwlocks:
+- an exclusive one (#hwlock-cells = 1) within the hwlock device node 'hwlock1'
+- a shared one (#hwlock-cells = 2, second cell = 1) within the hwlock device
+  node 'hwlock2'.
+The shared lock is also be used by nodeB.
 
-	node {
+	nodeA {
 		...
-		hwlocks = <&hwlock1 2>, <&hwlock2 0 3>;
+		hwlocks = <&hwlock1 2>, <&hwlock2 0 1>;
 		...
 	};
+
+	nodeB {
+		...
+		hwlocks = <&hwlock2 0 1>;
+		...
+	};
\ No newline at end of file
-- 
2.7.4
