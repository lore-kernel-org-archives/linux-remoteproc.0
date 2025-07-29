Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2A201004;
	Tue, 29 Jul 2025 02:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753756309; cv=none; b=XCzi73qcpgLHHFSPYI6CzPy1xO43pxE7XqAdAgFZPWYKBP38Ywf1XkQkrF6JBO+d1rvu99Nwe4WMzSVp2Y1x9gM24ymq8nOcIt2tQ+b4pEcWHPHwXXYccL/lnOQTkelNQR2MA6HgPM78erKqANpjoObbRnp2HswNQhVeLXu9vdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753756309; c=relaxed/simple;
	bh=tCSF7lWfdbojV4jhsSF7FTuRiIw6T1A9derIUFGlZnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BDOxOcQtu+8HOvxS8T7gSvyAgK52NwHtG9vAgakCqbdqlsMiuGY/1xEvN8Gc4MqshENMW7xeQEz1G/7z8QgUrabkeSPp9EfwtVwffBDSA1+RkQ3I5X6ht5kC9VS969jIe4NzHSH1dsLrsmelNb0C3oBQDnvOEtkr9pyUDsSLxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=usPxFED4; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="usPxFED4"
X-UUID: 248c69b86c2411f0b33aeb1e7f16c2b6-20250729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/gWFTVUtfqcSTh6Oq1Z1VkUVT+x79QYdNgJkeqMe0Us=;
	b=usPxFED4ZUKek8uECAdEtcSe++F2yKbuduj192ZlMPtziu5QIAQwFqRfdhXYfWtF08Y69CKBPo6SqTAhzZK2Oov6wymNKO+08FcKIs/49Nn/SN2N3CJ/Waaj6TRFJQG3/Nyu3tpyVzw02lz8SbioE6rbNC4/wFhC5+cmTTLaGNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:455fc5c9-a8f9-481e-bce4-9084c7305479,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:958fe108-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 248c69b86c2411f0b33aeb1e7f16c2b6-20250729
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 482597564; Tue, 29 Jul 2025 10:31:33 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:31 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 2/3] arm64: dts: mt8189: Add scp node
Date: Tue, 29 Jul 2025 10:31:12 +0800
Message-ID: <20250729023125.9036-3-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250729023125.9036-1-huayu.zong@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add scp node for mt8189.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi    | 11 +++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189-evb.dts b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
index e5d9ce1b8e61..39cd56b31ca0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
@@ -13,8 +13,25 @@ / {
 	chosen: chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem_reserved: scp@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&scp {
+	status = "okay";
+	memory-region = <&scp_mem_reserved>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index 2444c3e553ec..b70397b9ef6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -371,5 +371,16 @@ uart0: serial@11001000 {
 			clock-names = "baud", "bus";
 			status = "disabled";
 		};
+
+		scp: scp@1c400000 {
+			compatible = "mediatek,mt8189-scp";
+			reg = <0 0x1c400000 0 0x60000>,
+			      <0 0x1cb20000 0 0xe0000>;
+			reg-names = "sram", "cfg";
+			interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+			clocks = <&vlp_cksys_clk CLK_VLP_CK_SCP_SEL>;
+			clock-names = "scp_sel";
+		};
 	};
 };
-- 
2.45.2

