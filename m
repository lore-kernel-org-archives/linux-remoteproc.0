Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D82757E3;
	Mon, 10 Jun 2024 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042793; cv=none; b=VIG7azse03DaGAEh/tiI+wgDn1PjNrDZR7QBeMdtD4aoZWvf5cjEP67u6KgG7jm3Qcl3LZhIFTyQfeXkAo8DeMu079cy3PSMfZhbdeIOpq2UmhA+tom7N5zjuGRnRwCwsFquL3VO68uh3t9kw5PTihOAd2/iIkBRuYOyZKyeNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042793; c=relaxed/simple;
	bh=nsZCppXmh8lxPmCUagHvnCSHS+UbJBgIFsgwfI9awYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUW1Uxwdy8oVwUsHdpJ2QvquWhv9Bo6ZTQ+noqKJr+I+9nNOFDnmoxvoo3j203U6/RhCjF2ONSCpGk1MY64djV1k3oG0GECcj9ufn2r6LUW88KRgcaa3YK3hV/3HFzZLN+9hEst6nhDP253Gdr2Gm7q4lwONyhUfqxEO0Z3GWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uv8hS2hm; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uv8hS2hm"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6JmY063944;
	Mon, 10 Jun 2024 13:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718042779;
	bh=IUAoumEhy+wq6Tu6vsgEuKclmExrdXZar+JrMRHsA5Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uv8hS2hm7MhPgqAHoR1aWKd2QA6lG9bzq4B+eqGjFUhkEgLI3F+ab/vcMzXSmpJgf
	 ZcGurYn9p8ULvtqqxw6/BQnc2bnC9opWFq7+bhd8XF2/SqYLrliGUiAxXIex3qJ1gs
	 cHFkrPsb1la0aNEQ4xWU4/EHEj8P48voohVDbbEQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AI6JII011796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 13:06:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:06:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:06:18 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6Gtj056905;
	Mon, 10 Jun 2024 13:06:18 -0500
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
Subject: [PATCH v10 4/8] arm64: dts: ti: k3-am625-sk: Add M4F remoteproc node
Date: Mon, 10 Jun 2024 13:06:11 -0500
Message-ID: <20240610180615.313622-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610180615.313622-1-afd@ti.com>
References: <20240610180615.313622-1-afd@ti.com>
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

The AM62x SoCs of the TI K3 family have a Cortex M4F core in the MCU
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
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 3c45782ab2b78..167bec5c80006 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -48,6 +48,18 @@ ramoops@9ca00000 {
 			pmsg-size = <0x8000>;
 		};
 
+		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cc00000 0x00 0xe00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -457,6 +469,13 @@ mbox_m4_0: mbox-m4-0 {
 	};
 };
 
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
 &usbss0 {
 	bootph-all;
 	status = "okay";
-- 
2.39.2

