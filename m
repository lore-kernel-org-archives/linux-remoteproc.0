Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2E166F23;
	Fri,  2 Aug 2024 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612094; cv=none; b=eJzOlboG34x1g+jz0PkgBAjaF5l4GkDM10pjozg0bplWsO1snWuzAQvL6bl4fieOv0I/IbrhAX0jx6bGlvLE6C6T+mdKe0IvF8XMQq6C5WC8iEQc0K8rOp/HrGW5JtWkQFqFC524E6K04kmcedwjoprQFM0uLLvgnoKN6VSP0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612094; c=relaxed/simple;
	bh=3VR/R2116zaREyBlD64NI/J94ovgkrU1ryX4hLWn+kA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6qAu+9Hv0GDxla9mLk+ZeAO5phaDB+BgPJDU38mOolBKH/meViVlRuqAmAF0T2Z+VEBBT7t6RFQwV9JbbkTOgk79jPHbEq2+goXZvhYIsw7tZW9lRt2+Fr66MP8oKFzY+/iVMr4i3bo0e24ONVU1vbYXd0jdYt6LKRyBGrW0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c7fmmCrD; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c7fmmCrD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLFGm036926;
	Fri, 2 Aug 2024 10:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612075;
	bh=HctMTcxZA/BbEJn4hU8CmAXcAh3IvrmTEYaXphiIaB0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c7fmmCrDhgJ6ysBM2yI3LMx3Zr5dWfUVt+S0lYPN/Zf5b0N7+EjRMgb54n0kWwIg8
	 1rK398K8zoadUbusFjnhZPSsXxpC58Dzq50ts54Skb4abkc1iPuaDIvnYkSTmsRVSz
	 PEffID7211ZiBmfkNleeLVR4FNVSiJn4dnE4i1b4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLFOJ108215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:15 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAew007504;
	Fri, 2 Aug 2024 10:21:15 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v11 8/9] arm64: dts: ti: k3-am642-evm: Add M4F remoteproc node
Date: Fri, 2 Aug 2024 10:21:08 -0500
Message-ID: <20240802152109.137243-9-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802152109.137243-1-afd@ti.com>
References: <20240802152109.137243-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Hari Nagalla <hnagalla@ti.com>

The AM64x SoCs of the TI K3 family have a Cortex M4F core in the MCU
domain. This core can be used by non safety applications as a remote
processor. When used as a remote processor with virtio/rpmessage IPC,
two carveout reserved memory nodes are needed. The first region is used
as a DMA pool for the rproc device, and the second region will furnish
the static carveout regions for the firmware memory.

The current carveout addresses and sizes are defined statically for
each rproc device. The M4F processor does not have an MMU, and as such
requires the exact memory used by the firmware to be set-aside.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index 6bb1ad2e56ec2..23915641115b1 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -101,6 +101,18 @@ main_r5fss1_core1_memory_region: r5f-memory@a3100000 {
 			no-map;
 		};
 
+		mcu_m4fss_dma_memory_region: m4f-dma-memory@a4000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4000000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: m4f-memory@a4100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa4100000 0x00 0xf00000>;
+			no-map;
+		};
+
 		rtos_ipc_memory_region: ipc-memories@a5000000 {
 			reg = <0x00 0xa5000000 0x00 0x00800000>;
 			alignment = <0x1000>;
@@ -769,6 +781,13 @@ &main_r5fss1_core1 {
 			<&main_r5fss1_core1_memory_region>;
 };
 
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
 };
-- 
2.39.2

