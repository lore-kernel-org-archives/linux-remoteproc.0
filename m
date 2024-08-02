Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C594175D28;
	Fri,  2 Aug 2024 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612085; cv=none; b=cgUsQz7hzwb4K6CzIoLLoW4PaVAnwd69YE/1JbPAIC+UP3GXNThwmsHq7+9UkxK6K9VFHip/G5grmMhTYp1v5HgmbPHjO8bwafFYTYqEVikEFPOVMvUhqN00gD5Z3cuRwD+QwbF181kN97Tlf3IT4kf3/ihxndGsLRAs75rIZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612085; c=relaxed/simple;
	bh=wJsCI19agUS/+MDtWAcxAkIEF3QnROOx2B5PuQc8Zzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tGhYS4CeDPY3qGQFiH9EsESljGMorO4IbKGz9JhHvDdvPlfnnNjq1cjVwW2zSrByvHwannDIozZjlDcEB+x7tzsOcpp1ERv895FPjvyIlza/LDQ+ilTlmZ0c1lvNw+lvIjktrohXKWnBk9Y4gVnLXebIPu7EEyJCbMPyJBVObIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Yqtzj7jR; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Yqtzj7jR"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLEh2036920;
	Fri, 2 Aug 2024 10:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612074;
	bh=p1qJqUmMe3OjDBoC0B0IMbNgNhv2d238EMpmqMU4dbg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yqtzj7jRJGOj9DOwPILA/IABnCM2Bzd1TQxaKJ/Yiccoiey9jIrSAmV4EodR0OhQr
	 3mg2DAY3r7nyNL4FnPvP5LeWY/7IMuoDYB1F8POoJgYFJ6PEgUETxk9ivhqmJ2XSXR
	 7mdf+Bn+2lSOpEjZI3rKToPeF3+K2dLZm9PmahiA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLEB3099564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:13 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAes007504;
	Fri, 2 Aug 2024 10:21:12 -0500
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
Subject: [PATCH v11 4/9] arm64: dts: ti: k3-am62: Add M4F remoteproc node
Date: Fri, 2 Aug 2024 10:21:04 -0500
Message-ID: <20240802152109.137243-5-afd@ti.com>
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

The AM62x SoCs of the TI K3 family have a Cortex M4F core in the MCU
domain. This core can be used by non safety applications as a remote
processor. When used as a remote processor with virtio/rpmessage IPC,
two carveout reserved memory nodes are needed.

Disable by default as this node is not complete until mailbox data
is provided in the board level DT.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index e66d486ef1f21..7f6f0007e8e81 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -173,4 +173,17 @@ mcu_mcan1: can@4e18000 {
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
 		status = "disabled";
 	};
+
+	mcu_m4fss: m4fss@5000000 {
+		compatible = "ti,am64-m4fss";
+		reg = <0x00 0x5000000 0x00 0x30000>,
+		      <0x00 0x5040000 0x00 0x10000>;
+		reg-names = "iram", "dram";
+		resets = <&k3_reset 9 1>;
+		firmware-name = "am62-mcu-m4f0_0-fw";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <9>;
+		ti,sci-proc-ids = <0x18 0xff>;
+		status = "disabled";
+	};
 };
-- 
2.39.2

