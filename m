Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FCA43E9CB
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519692; cv=pass; b=KOO9UHzj74nOhgCNMh+E43WzNnuIeTzF85r72Nj1sADarFfYHm+M90QeGTeXK634N1Fie25g/fum18EEgj7P+XyLkTwiBj7h63g2yTbQHnLv2Uv8zp5Bi0rB//SaZSDj7coTPrhe40vzKalPG3MIwyXULtITEjNCMs7VDoIlR8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519692; c=relaxed/simple;
	bh=ovWlW5zNHXt02wg8/HCKteqFVEsWvyBEaO3nlhqvff0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NnQFLOY+JRv7qascwBmvY/jItbQEhgdz4URgJtQni0hx9Me5MVXaCh6EXovslMBK2amKBGgdieR8mwwUJ7KY2WqVa7Ad2AAPq1hGHhsRHN5boh1gFzvtPL/hfsr+Wuv04zGHZ9rrnWNtL4uiimiCKnnahRUcKeqRRFZhuxeBGAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1Bo+AmY; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1Bo+AmY"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c566cb519so8621189a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 10:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778519685; cv=none;
        d=google.com; s=arc-20240605;
        b=A/UXrIy47iGop+JUyoLlhZumPhWZu0VAjH1SxZ1x+sKvx/W7gmCq+hNBgaIkthAwoo
         yJxSwu3jf5hFntbGsWo7ojrVHKJJGZR4BPO/3OKE6K4qLiDljKfkerlNPfJCGMMz/g9A
         jbVoXTRJBJGal4sxk0sf0jnCxzFIrFaCPOpBwszJiCoSNvOi7Isw08SXlR/qo3FwFuMB
         4Glj1ofotAzIXMtEAZ05zyxtkMUpdtbIWiJ2kKvTH0DJTp8IWsJOrKheMtLyFPWmjGdo
         me5aKWQ+ywqQTAXuNBlFJMCoTDVbZwWIe/wqbSX7eGG7kSVDj2pJjVB2TGk/+HmftU4y
         K+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KjJuvIOxNRqAoYDzFQhCMCPc/xwVg7FdKIPtDYr1918=;
        fh=80sWRRawuya2oC411Xq7Tfrzdye3l2mIgBrrtsFXle4=;
        b=I375stOUYdEm6lOXiOM0ra5ueA1ZuR129p7fa9ieGdYdVPXpy8xYRtErXQJ9OGjMkn
         pWWHBYFAWWH+MZgcBFt9PB7wrJN1Lc8d2e+WfhaLFD6FYuguPN8naMrvEfijfoRxfyZo
         J4lDzBY+ygyiedXsDtD9XbnUIGsWEHvBIGUx2+NgP88br6i/HXvWa/KROiuaDRQeno+m
         IT1HSpThrUbMugWlTROB6qxB7fzAnFGhypk3SbA0wVFV+i5mXG7ipCx9iDZ3CFpXAakx
         M00LH2Tr7t+/kdBrNhwHmvEbqhzkQEFtQRpEAQwbaKdVqgPPeqfLyzNlSWdAmoh7S9RN
         bh+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519685; x=1779124485; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KjJuvIOxNRqAoYDzFQhCMCPc/xwVg7FdKIPtDYr1918=;
        b=k1Bo+AmYbrHls2DuobmFxLCl1XweoU/ql+V50IcckorBnDdOJhUn8jpJbRKUaqnFE8
         8sNdeFnnW12hnFaKUW1/RKl0ltHQdSjUBRdDCMym8HqY4mo//Mp3q//ApAKyo8BIdOip
         Ym9xF3/nkVBNTZVDMk6GkeeJcadpCuZVzTumMLva59c6qsaDwTijCLUq0pDdJvi5EtoC
         Tc1RWjGf8tEF2qqOWTj4AWUr9C6Nxe5QrwzBKQDkhutvhvbsdvDST+B9QP1mqgJ/UU75
         Lm2bmvfToISrwxk23wx7yqQp3JAZfVX1rVcvU8JnwxI6HTVnrQU57OXwnJWXFUtqcPWP
         eSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519685; x=1779124485;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjJuvIOxNRqAoYDzFQhCMCPc/xwVg7FdKIPtDYr1918=;
        b=palG0HX87NSfR97PKspb97fux6oIYg3dU8q9iLG7WVxmWHfPS0ZHaZfGM17O6BZQLs
         RJm7LsVn/6RkrC9j1t+MDGJwBs2KImlYzsl1p4Z7w1m0CGV0lmtfSaT+8aRqkpIqYjxe
         F3d9NX0wdzQlM7IZrUyYQKiZiuQezBw0CXwtvJc/rwdegU+N2tID6bKWhY11443L5/TK
         YuAMAriRM7bNIPXZVTfF7ET2SvzTrbSgnOc+/qZx4rNW4x1q00kbNzmqlTW+6Rekpn3F
         dG52ufkHS73I6Cdz7v9UcnfKwjmMahJeCpHDAtXIKWkybL1a9sWpyQ66M9+g5tCyEsOv
         5CIg==
X-Forwarded-Encrypted: i=1; AFNElJ+P2DST0J0Sjlzx60rrWPHpjrHVfd7KSExPuD4kqGnJofN2Hd7DZ4H3zFJksVbOI/LG80pMiGrGApv5r2Kpoq88@vger.kernel.org
X-Gm-Message-State: AOJu0YwTD8N45wq497lbgIyFZGAZg6zzLxhX6yY+caOHh23BNmYaHNpz
	hHLacvRLKcmh2BXsEktek0Nvp3/zQs+7SHwwHmCTXlfjNbim3oS0TK8b+RbRA+7MUgWmYbxn4Qt
	Y5WFklXNVp7ltwshpCdHXiUsch5E/rrZzg4KUu5Xubjlc9AtYXYFk
X-Gm-Gg: Acq92OECRPbxmkwIYLiHYHJjMBtHSd96V0lJQycMS1tbBobugB/tK90G2UK4YoQkQja
	0pPmhHHuR7tjGA4Ii90+4hPt2zCIvJrLOIl2U7S0QiLFXaGVrrb8LfUwQIMZP5pgfCEOxFycxyb
	FRfHtFoyCA+PitOub2IDf7KTMof5cckwB9Jsi8WJ0TlKr24vx4xltjMYU0XLdly7x+aG4pbTDU4
	H4enTUC81Gom05jjx1mSR16MVYIMY4OewM82vFTKNOIoCxqBoMvJXv7nTg1icJj+e4BRfhLoQWd
	YTn47fvBqCjLCDTV2Zr8B72F4bjFqTHCvIiDIkeNdA==
X-Received: by 2002:a05:6402:3511:b0:678:a507:e81b with SMTP id
 4fb4d7f45d1cf-67d6489fad4mr13064016a12.21.1778519685055; Mon, 11 May 2026
 10:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511165942.2774868-1-robh@kernel.org>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2026 11:14:33 -0600
X-Gm-Features: AVHnY4Jf0CJE1hDSgg12DVeCV98dmImUPAtD_0hAQLFCE4wcBW8rBlS3kBvE434
Message-ID: <CANLsYkxNTPg9hHRF6hcVUSUPvxg_gAvcyD8FJ81pOfXQ2W+KnA@mail.gmail.com>
Subject: Fwd: [PATCH] dt-bindings: Consolidate "sram" property definition
To: Beleswar Padhi <b-padhi@ti.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	linux-remoteproc <linux-remoteproc@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Shah, Tanmay" <tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"

Gentlemen, please test this patch on your respective platforms and
provide "Tested-by:" tags publicly.

---------- Forwarded message ---------
From: Rob Herring (Arm) <robh@kernel.org>
Date: Mon, 11 May 2026 at 10:59
Subject: [PATCH] dt-bindings: Consolidate "sram" property definition
To: Liu Ying <victor.liu@nxp.com>, Philipp Zabel
<p.zabel@pengutronix.de>, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com>, Maxime Ripard
<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof
Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
<festevam@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil
P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov
<lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica
Zhang <jesszhan0024@gmail.com>, Marijn Suijten
<marijn.suijten@somainline.org>, Vinod Koul <vkoul@kernel.org>, Nas
Chung <nas.chung@chipsnmedia.com>, Jackson Lee
<jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab
<mchehab@kernel.org>, Mirela Rabulea <mirela.rabulea@nxp.com>, Detlev
Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>,
Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
<alain.volmat@foss.st.com>, Maxime Coquelin
<mcoquelin.stm32@gmail.com>, Alexandre Torgue
<alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
David S. Miller <davem@davemloft.net>, Eric Dumazet
<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
<pabeni@redhat.com>, MD Danish Anwar <danishanwar@ti.com>, Roger
Quadros <rogerq@kernel.org>, Parvathi Pudi <parvathi@couthit.com>,
Mohan Reddy Putluru <pmohan@couthit.com>, Bjorn Andersson
<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
Blumenstingl <martin.blumenstingl@googlemail.com>, Michal Simek
<michal.simek@amd.com>, Mark Brown <broonie@kernel.org>, Matthias
Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>, Linus Walleij
<linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix
Fietkau <nbd@nbd.name>, Andrew F. Davis <afd@ti.com>, Hussain Khaja
<basharath@couthit.com>, Suman Anna <s-anna@ti.com>, Ben Levinsky
<ben.levinsky@amd.com>, Tanmay Shah <tanmay.shah@amd.com>, Erwan Leray
<erwan.leray@foss.st.com>, Fabrice Gasnier
<fabrice.gasnier@foss.st.com>
Cc: Roger Quadros <rogerq@ti.com>, <dri-devel@lists.freedesktop.org>,
<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
<linux-arm-kernel@lists.infradead.org>,
<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
<freedreno@lists.freedesktop.org>, <dmaengine@vger.kernel.org>,
<linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
<linux-stm32@st-md-mailman.stormreply.com>, <netdev@vger.kernel.org>,
<linux-remoteproc@vger.kernel.org>,
<linux-amlogic@lists.infradead.org>, <linux-spi@vger.kernel.org>,
<linux-mediatek@lists.infradead.org>


The "sram" property has become a de facto standard property, so create a
common schema for it and drop all the duplicated definitions.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
 .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----
 .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
 .../bindings/media/cnm,wave521c.yaml          |  2 +-
 .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
 .../bindings/media/rockchip,vdec.yaml         |  5 ++--
 .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
 .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
 .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
 .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
 .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
 .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
 .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
 16 files changed, 48 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
index 27118f4c0d28..fd095e5742c5 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -41,7 +41,7 @@ properties:
       - const: sw3

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description: phandle pointing to the mmio-sram device node

 required:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml
b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..358759fad8dc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -84,13 +84,9 @@ properties:
     maxItems: 64

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
     maxItems: 4
-    items:
-      maxItems: 1
-    description: |
-      phandles to one or more reserved on-chip SRAM regions.
+    description:
       phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
       a4xx Snapdragon SoCs. See
       Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 607da11e7baa..d8f92838f4c9 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -136,13 +136,9 @@ properties:
     maxItems: 1

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: A phandle array with inner size 1 (no arg cells).
-      First phandle is the LCPA (Logical Channel Parameter Address) memory.
-      Second phandle is the  LCLA (Logical Channel Link base Address) memory.
-    maxItems: 2
     items:
-      maxItems: 1
+      - description: LCPA (Logical Channel Parameter Address) memory.
+      - description: LCLA (Logical Channel Link base Address) memory.

   memcpy-channels:
     $ref: /schemas/types.yaml#/definitions/uint32-array
diff --git a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
index 6a11c1d11fb5..6cd33dfd095d 100644
--- a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
+++ b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
@@ -37,7 +37,7 @@ properties:
     maxItems: 1

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
       The VPU uses the SRAM to store some of the reference data instead of
       storing it on DMA memory. It is mainly used for the purpose of reducing
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 18cc6315a821..6ba668aa633d 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -56,10 +56,10 @@ properties:
     maxItems: 5               # Wrapper and 4 slots

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
-      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
-      be used for descriptor storage, which may improve bus utilization.
+      The SRAM can be used for descriptor storage, which may improve bus
+      utilization.

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 42022401d0ff..4f38a0ef29d8 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -91,9 +91,8 @@ properties:
     maxItems: 1

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      phandle to a reserved on-chip SRAM regions.
+    maxItems: 1
+    description:
       Some SoCs, like rk3588 provide on-chip SRAM to store temporary
       buffers during decoding.

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index d9fbb90b0977..7c2ddd27780f 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -47,10 +47,10 @@ properties:
     maxItems: 1

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
-      phandle to a reserved SRAM region which is used as temporary
-      storage memory between DMA and MDMA engines.
+      SRAM region which is used as temporary storage memory between DMA and
+      MDMA engines.

   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml
b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index cc346946291a..6bbd83c6aaf7 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -67,8 +67,7 @@ properties:
       - const: ppe

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: phandle to mmio SRAM
+    maxItems: 1

   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
index c296e5711848..883033b19b8f 100644
--- a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
@@ -21,7 +21,7 @@ properties:
       - ti,am654-sr1-icssg-prueth  # for AM65x SoC family, SR1.0

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
       phandle to MSMC SRAM node

diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
index a98ad45ca66f..9370c43bc66a 100644
--- a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
@@ -24,7 +24,7 @@ properties:
       - ti,am3359-prueth   # for AM33x SoC family

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
       phandle to OCMC SRAM node

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 76e8ca44906a..3f710433e937 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -48,12 +48,7 @@ properties:
     minItems: 1

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandles to a reserved SRAM region which is used as the memory of
-      the ARC core. The region should be defined as child nodes of the
-      AHB SRAM node as per the generic bindings in
-      Documentation/devicetree/bindings/sram/sram.yaml
+    maxItems: 1

   amlogic,secbus2:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index b51bb863d759..8b1ed384ef22 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -75,16 +75,8 @@ properties:
 # --------------------

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
     maxItems: 4
-    items:
-      maxItems: 1
-    description: |
-      phandles to one or more reserved on-chip SRAM regions. The regions
-      should be defined as child nodes of the respective SRAM node, and
-      should be defined as per the generic bindings in,
-      Documentation/devicetree/bindings/sram/sram.yaml

 allOf:
   - if:
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 775e9b3a1938..14e6b2f817b3 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -224,16 +224,8 @@ patternProperties:
           at 0x0) or 0 (BTCM at 0x0), default value is 1 if omitted.

       sram:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         minItems: 1
         maxItems: 4
-        items:
-          maxItems: 1
-        description: |
-          phandles to one or more reserved on-chip SRAM regions. The regions
-          should be defined as child nodes of the respective SRAM node, and
-          should be defined as per the generic bindings in,
-          Documentation/devicetree/bindings/sram/sram.yaml

     required:
       - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index ee63c03949c9..c7d5e58330d6 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -106,20 +106,13 @@ patternProperties:
           - const: rx

       sram:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
         minItems: 1
         maxItems: 8
-        items:
-          maxItems: 1
-        description: |
+        description:
           phandles to one or more reserved on-chip SRAM regions.
Other than TCM,
           the RPU can execute instructions and access data from the OCM memory,
           the main DDR memory, and other system memories.

-          The regions should be defined as child nodes of the respective SRAM
-          node, and should be defined as per the generic bindings in
-          Documentation/devicetree/bindings/sram/sram.yaml
-
       memory-region:
         description: |
           List of phandles to the reserved memory regions associated with the
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 472e92974714..6d7d595e4ab3 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -89,12 +89,10 @@ properties:
       - const: rxm2m

   sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      Phandles to a reserved SRAM region which is used as temporary
-      storage memory between DMA and MDMA engines.
-      The region should be defined as child node of the AHB SRAM node
-      as per the generic bindings in
Documentation/devicetree/bindings/sram/sram.yaml
+    maxItems: 1
+    description:
+      SRAM region which is used as temporary storage memory between DMA and
+      MDMA engines.

   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sram/sram-consumer.yaml
b/Documentation/devicetree/bindings/sram/sram-consumer.yaml
new file mode 100644
index 000000000000..f00087bd2879
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/sram-consumer.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/sram-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SRAM Consumers
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+select: true
+
+properties:
+  sram:
+    description:
+      Phandles to one or more reserved on-chip SRAM regions. The regions
+      should be defined as child nodes of the respective SRAM node, and
+      should be defined as per the generic bindings in,
+      Documentation/devicetree/bindings/sram/sram.yaml
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+
+additionalProperties: true
+...
--
2.53.0
