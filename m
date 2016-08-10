Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] dt-binding: remoteproc: Document generic properties
Date: Wed, 10 Aug 2016 10:37:02 -0700
Message-Id: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This documents the generic properties "rprocs" and "rproc-names", used
for consumer drivers to reference a remoteproc node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/remoteproc.txt   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/remoteproc.txt
new file mode 100644
index 000000000000..0b1d8183be87
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc.txt
@@ -0,0 +1,21 @@
+Common remoteproc properties
+
+A remoteproc node represents the mechanism and resources needed for controlling
+a co-processor's life cycle; including loading firmware, booting, shutting down
+and handling exceptions.
+
+
+= Consumer properties
+A consumer node referencing a remoteproc node, so that it can requests life
+cycle transitions can use the following properties:
+
+- rprocs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a list of phandle references to remoteproc nodes
+
+- rproc-names:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: a list of strings naming each entry in "rprocs", allowing
+		    consumer drivers to look up remoteprocs by name
-- 
2.5.0
