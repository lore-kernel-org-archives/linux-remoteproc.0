Return-Path: <pihsun@chromium.org>
Return-Path: <pihsun@chromium.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [RFC,1/5] dt-bindings: Add a binding for Mediatek SCP
Date: Wed, 26 Dec 2018 15:53:09 +0800
Message-Id: <20181226075330.82462-2-pihsun@chromium.org>
In-Reply-To: <20181226075330.82462-1-pihsun@chromium.org>
References: <20181226075330.82462-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, Erin Lo <erin.lo@mediatek.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Erin Lo <erin.lo@mediatek.com>

Add a DT binding documentation of SCP for the
MT8183 SoC from Mediatek.

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 .../devicetree/bindings/remoteproc/mtk,scp.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
new file mode 100644
index 0000000000000..b07e5c4ca9af1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -0,0 +1,9 @@
+Mediatek SCP Bindings
+----------------------------------------
+
+This binding provides support for ARM Cortex M4 Co-processor found on some
+Mediatek SoCs.
+
+Required properties:
+- compatible		Should be "mediatek,mt8183-scp"
+- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- 
2.20.1.415.g653613c723-goog
