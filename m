Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8361F2C52;
	Mon, 21 Apr 2025 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268584; cv=none; b=rUlIiOEY2MNfudVxCNL2LU+OC+cMZhpEQFMXCaeY25fhYwHbNmCpZKjXK2Q+f2gTGvBz/9JmC1WsPZimyduzjFoKWNV5M1UcmRLL9n1yuniRfXpcOByNdO6FNPP1y576T4bD6u9PLJZEbeRucHcO7RMoZm8f6IOCQSlaXSTF8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268584; c=relaxed/simple;
	bh=XoQUQxGE6uHWaZmNzk5WR9FZhr6qAFxBSajgJSMZoE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pdhqros5ZsekOvyQOsiPhLEHwZ7GsWKhAUZMr9CgkxFyy1iw1xuEOxFURPbjy+qiO66d7yLg6vzYZpegKg0tmER2dnDPByfHvxQQQmlxjhTI/LuV/p/1oOdNHLLlPqbJHVThSYC74Z4aTrKCR8H+wVY3j/cQEqqe/g9DT09O8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HxWjf78P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HxWjf78P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268580;
	bh=XoQUQxGE6uHWaZmNzk5WR9FZhr6qAFxBSajgJSMZoE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HxWjf78PjjiVmEOvm13fUyTVtPKTsZaNqnrMCSp9S1hYSnxoaN4qq5+7xjT5JDC/V
	 agMMvkJDhM6BpphxK8pLX2VpuPPfM9SkEPuSGHxloYWdaQnIZk4HIdQcpZ5hNU/1wF
	 +xERTtxcIMJ2aQod06Iqpb49xIoSXjvZaeZYlLzzUxK3P94fwgAUz6vezfya/yFzuS
	 cBp+LnUBFamDla6DYjdUxaak/xJ1VKbWXmQVqQh1qagDdbDi1NlxZ2xHJS+NUbvovC
	 NWbuzRM35Q5/e/2WQPSslw0b7JEy47BG+1n9X03/mjR7pski3OgfYfOo0tUvFbfdPn
	 oQN41H8glZc0w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F9B817E00FC;
	Mon, 21 Apr 2025 22:49:37 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:07 -0400
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8188: Describe SCP as a
 cluster with two cores
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-4-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: b4 0.14.2

The SCP is currently described in the Devicetree as a single-core
processor, but really it is a cluster with two cores. Describe the full
cluster but enable only core0 on the current mt8188 platforms since
that's the only one usable with the upstream firmware.

Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Co-developed-by: Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
Signed-off-by: Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 36 ++++++++++++++++------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  6 +++-
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
index f89835ac36f36f86e2054ae0c332172be97b049a..f4c207d65b877e1eefaa26540446c3c06369ca21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
@@ -331,7 +331,11 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 0cfedb837b005d06b31008c687590e4c47727fc7..296090fbaf4953db8075f72073509b731dc41e51 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1382,12 +1382,30 @@ gce1: mailbox@10330000 {
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
 		};
 
-		scp: scp@10500000 {
-			compatible = "mediatek,mt8188-scp";
-			reg = <0 0x10500000 0 0x100000>,
-			      <0 0x10720000 0 0xe0000>;
-			reg-names = "sram", "cfg";
-			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+		scp_cluster: scp@10720000 {
+			compatible = "mediatek,mt8188-scp-dual";
+			reg = <0 0x10720000 0 0xe0000>;
+			reg-names = "cfg";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10500000 0x100000>;
+			status = "disabled";
+
+			scp_c0: scp@0 {
+				compatible = "mediatek,scp-core";
+				reg = <0x0 0xd0000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			scp_c1: scp@d0000 {
+				compatible = "mediatek,scp-core";
+				reg = <0xd0000 0x2f000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
 		};
 
 		afe: audio-controller@10b10000 {
@@ -2249,7 +2267,7 @@ dma-controller@14001000 {
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
 					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 		};
 
 		display@14002000 {
@@ -2704,7 +2722,7 @@ video_decoder: video-decoder@18000000 {
 			iommus = <&vpp_iommu M4U_PORT_L23_HW_VDEC_UFO_ENC_EXT>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 
 			video-codec@10000 {
 				compatible = "mediatek,mtk-vcodec-lat";
@@ -2828,7 +2846,7 @@ video_encoder: video-encoder@1a020000 {
 				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_W_LUMA>,
 				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_R_LUMA>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 		};
 
 		jpeg_encoder: jpeg-encoder@1a030000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index e9d57f44475b00f19983a968ae113deb4d86bf12..805a4bccff33e3ac1a16c5fb2cf13914c8e97746 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1055,7 +1055,11 @@ power-key {
 	};
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	memory-region = <&scp_mem>;
 	status = "okay";
 };

-- 
2.49.0

