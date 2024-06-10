Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4412F5B6;
	Mon, 10 Jun 2024 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042792; cv=none; b=AchoulY61nNql4/m7h3H+VZ54/dm9jd7ziSKh4/2ofCUw9t51YmZUTKIDq6eirP+wJtzC+Ut+It/KG/EJD+lF2udZAXbnlI2o/wvIIQKRO+KPGs6aJewFLXvq6ro3Vnts6CLiqCBU0t/nlWkUWE0FQlkV2fqBc3xETTr4bdDJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042792; c=relaxed/simple;
	bh=205vA25fJGdQp7gx2fSzwIASczYJ2XhK1BNSi8Cu6a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vsu5uUovr0KgwontyybOAg6EVZ+bXYQNLHCQv8mBh3gBWA4XvWoAA3xZkFOMCdEuDdcgBUr8RfsZF3QealMDG0eTIzH8IcIpkdaP/qKsXlKRra73LCit9BWT1aQR0RHgSEOsgerdzoBuZe77rm3KppyvZVaafXrZUPbVm9Lt0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SSfNPLY9; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SSfNPLY9"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6JXA024752;
	Mon, 10 Jun 2024 13:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718042779;
	bh=c++NXaRcOYOcHcUH4HHfdQIPtUkQdhjeGSyzyykhV4s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SSfNPLY9q1gSm/ldaF7CB+TV4+DEWbbhFkqBDx/atLbMcc9JLg/CVXiKpnMdvDrcA
	 y3tzCtcZ7ShWbBdCaC6PCcNaL/1TZM4Dopmu5a8nOKrWKSyj/ce0ytABqtMcyWnQRp
	 HhCrzhXbE33QI6Vfj4l+d0zIKCgQzu22Ir0kWitc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AI6JFp022917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 13:06:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:06:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:06:19 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6Gtk056905;
	Mon, 10 Jun 2024 13:06:19 -0500
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
Subject: [PATCH v10 5/8] arm64: dts: ti: k3-am64: Add M4F remoteproc node
Date: Mon, 10 Jun 2024 13:06:12 -0500
Message-ID: <20240610180615.313622-6-afd@ti.com>
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

The AM64x SoCs of the TI K3 family have a Cortex M4F core in the MCU
domain. This core can be used by non safety applications as a remote
processor. When used as a remote processor with virtio/rpmessage IPC,
two carveout reserved memory nodes are needed.

Disable by default as this node is not complete until mailbox data
is provided in the board level DT.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi
index ec17285869da6..b98e8ad453289 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi
@@ -160,4 +160,17 @@ mcu_esm: esm@4100000 {
 		reg = <0x00 0x4100000 0x00 0x1000>;
 		ti,esm-pins = <0>, <1>;
 	};
+
+	mcu_m4fss: m4fss@5000000 {
+		compatible = "ti,am64-m4fss";
+		reg = <0x00 0x5000000 0x00 0x30000>,
+		      <0x00 0x5040000 0x00 0x10000>;
+		reg-names = "iram", "dram";
+		resets = <&k3_reset 9 1>;
+		firmware-name = "am64-mcu-m4f0_0-fw";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <9>;
+		ti,sci-proc-ids = <0x18 0xff>;
+		status = "disabled";
+	};
 };
-- 
2.39.2

