Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH v5 3/3] dt-bindings: remoteproc: stm32: add syscon bindings preloaded fw support
Date: Tue, 11 Feb 2020 18:42:05 +0100
Message-ID: <20200211174205.22247-4-arnaud.pouliquen@st.com>
In-Reply-To: <20200211174205.22247-1-arnaud.pouliquen@st.com>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, arnaud.pouliquen@st.com, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add the optional syscon property that points to the resource table
address and the state of the Cortex-M4 firmware loaded by the bootloader.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index c0d83865e933..3947ddaca891 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -46,6 +46,27 @@ properties:
       - The field mask of the RCC trust zone mode.
     maxItems: 1
 
+  st,syscfg-copro-state:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Reference to the system configuration which returns the coprocessor state.
+      - Phandle of syscon block.
+      - The offset containing the coprocessor state.
+      - The field mask of bitmask for the coprocessor state.
+    maxItems: 1
+
+  st,syscfg-rsc-tbl:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Reference to the system configuration controlling the
+      resource table address loaded by the bootloader
+      - Phandle to syscon block.
+      - The offset of the register containing the resource table address.
+      - The field mask for the resource table address.
+    maxItems: 1
+
   interrupts:
     description: Should contain the WWDG1 watchdog reset interrupt
     maxItems: 1
-- 
2.17.1
