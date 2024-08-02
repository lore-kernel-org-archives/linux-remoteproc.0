Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5691537C2;
	Fri,  2 Aug 2024 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612090; cv=none; b=Xi0K81HMWJjhRrWqW5wkBSdE4XzGuFencBiMH0sqcJB0Pf6eO0ZOY3MfHyeDY8M070rPaa3Udeyk6ZT/IS90m489T7+jIoZgz9iB3tpSi8O4cRfuVhepelUcX+Srvexc+Ko/NLkES/HmoVpHEZ4KOooyyjrsGLIP+HoPv++re04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612090; c=relaxed/simple;
	bh=205vA25fJGdQp7gx2fSzwIASczYJ2XhK1BNSi8Cu6a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyTrkFR4xeP1mPs4M1J/t7zr+N37RhH+PGm+gPk7ZxAu8KjUqQKcLP7JPRkb7HfCE/ku5p6795oTzjAeXRBd79cEDY/teUdudROKwy9QhRemZRjsxushJhNPesQ+KadjN3Nvxfn4EOKSdtwjjDh97GXv3zJkwlYaP4rE2GEs4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m/uX+Hhp; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m/uX+Hhp"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLEUu022617;
	Fri, 2 Aug 2024 10:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612074;
	bh=c++NXaRcOYOcHcUH4HHfdQIPtUkQdhjeGSyzyykhV4s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m/uX+Hhp+iUuAZmKkcbpdSjpSU/h/PCikhqJEXfyrLZqajv5/y7B2DfWnL1mcmow7
	 WL4L3wfNYswiJNMGGhQbqr6GS8o80JPJlQkiiWIJaDh44FOSYYQmdenQP+1ERyhkCZ
	 1OHKFUeGC4Gy/LayMV9AfOwZJtNllWKhi/yipXE8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLEIu023335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:14 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAeu007504;
	Fri, 2 Aug 2024 10:21:14 -0500
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
Subject: [PATCH v11 6/9] arm64: dts: ti: k3-am64: Add M4F remoteproc node
Date: Fri, 2 Aug 2024 10:21:06 -0500
Message-ID: <20240802152109.137243-7-afd@ti.com>
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

