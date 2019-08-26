Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: stm32: add wakeup-source
Date: Mon, 26 Aug 2019 17:38:42 +0200
Message-ID: <1566833923-16718-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
References: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add the "wakeup-source" property: if the optional wdg interrupt is
defined, then this property may be defined too.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
index 5fa915a..ac54b5b 100644
--- a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
@@ -21,6 +21,9 @@ Required properties:
 
 Optional properties:
 - interrupts:	Should contain the watchdog interrupt
+- wakeup-source: Flag indicating whether remoteproc can wake up the system by
+		the watchdog interrupt. Only meaningful if the "interrupts"
+		property is defined.
 - mboxes:	This property is required only if the rpmsg/virtio functionality
 		is used. List of phandle and mailbox channel specifiers:
 		- a channel (a) used to communicate through virtqueues with the
-- 
2.7.4
