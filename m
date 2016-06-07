Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 10/18] ASoC: sti: Update DT example to match the driver code
Date: Tue,  7 Jun 2016 17:19:04 +0100
Message-Id: <1465316352-20691-11-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, vinod.koul@intel.com, bjorn.andersson@linaro.org, arnaud.pouliquen@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, broonie@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

uniperiph-id, version and mode are ST specific bindings and
need the 'st,' prefix. Update the examples, as otherwise copying
them yields a runtime error parsing the DT node.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Cc: arnaud.pouliquen@st.com
Cc: broonie@kernel.org
---
 .../devicetree/bindings/sound/st,sti-asoc-card.txt   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
index 4d9a83d..16bcdfb 100644
--- a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -33,11 +33,11 @@ Required properties:
 	"tx" for "st,sti-uni-player" compatibility
 	"rx" for "st,sti-uni-reader" compatibility
 
-  - version: IP version integrated in SOC.
+  - st,version: IP version integrated in SOC.
 
   - dai-name: DAI name that describes the IP.
 
-  - IP mode: IP working mode depending on associated codec.
+  - st,mode: IP working mode depending on associated codec.
 	"HDMI" connected to HDMI codec and support IEC HDMI formats (player only).
 	"SPDIF" connected to SPDIF codec and support SPDIF formats (player only).
 	"PCM" PCM standard mode for I2S or TDM bus.
@@ -47,7 +47,7 @@ Required properties ("st,sti-uni-player" compatibility only):
   - clocks: CPU_DAI IP clock source, listed in the same order than the
 	    CPU_DAI properties.
 
-  - uniperiph-id: internal SOC IP instance ID.
+  - st,uniperiph-id: internal SOC IP instance ID.
 
 Optional properties:
   - pinctrl-0: defined for CPU_DAI@1 and CPU_DAI@4 to describe I2S PIOs for
@@ -84,9 +84,9 @@ Example:
 		dmas = <&fdma0 4 0 1>;
 		dai-name = "Uni Player #2 (DAC)";
 		dma-names = "tx";
-		uniperiph-id = <2>;
-		version = <5>;
-		mode = "PCM";
+		st,uniperiph-id = <2>;
+		st,version = <5>;
+		st,mode = "PCM";
 	};
 
 	sti_uni_player3: sti-uni-player@3 {
@@ -100,9 +100,9 @@ Example:
 		dmas = <&fdma0 7 0 1>;
 		dma-names = "tx";
 		dai-name = "Uni Player #3 (SPDIF)";
-		uniperiph-id = <3>;
-		version = <5>;
-		mode = "SPDIF";
+		st,uniperiph-id = <3>;
+		st,version = <5>;
+		st,mode = "SPDIF";
 	};
 
 	sti_uni_reader1: sti-uni-reader@1 {
@@ -115,7 +115,7 @@ Example:
 		dmas = <&fdma0 6 0 1>;
 		dma-names = "rx";
 		dai-name = "Uni Reader #1 (HDMI RX)";
-		version = <3>;
+		st,version = <3>;
 		st,mode = "PCM";
 	};
 
-- 
1.9.1
