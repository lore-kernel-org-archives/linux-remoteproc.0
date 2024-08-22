Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C7A1CE70F;
	Thu, 22 Aug 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346619; cv=none; b=hFc2JWkw6p9nevXt+arDTGaAYWQsXhHdJxihRdFzG8fu0bknyMuXmINw4ayXX4BJhbHst0wbAJswjiLl0BxWBR7bIxs48maZBG6gRweP4TqpqYnKiu5hlBoJqMcg0s1Tluo8D5c2o3V7Es6J8sIIeA4x0LKnBJuP2HZi653eBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346619; c=relaxed/simple;
	bh=SVVDOlU0lPxfHsJW/1DZF2dUeryvrT3UoJyn2d4MUWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KqGwtzECcR3pDeQzlksBadlZ6TmrgELQNOL3oqQrgrdsXLllgamgko4mBpPzmJlkC/IWgGVKFgn0hzxbIdKBhaIj109P2f7MvvO9qjfDOObxPL0XG4FWBhXbJsVeouPHeySP2H8wyNHK5j9t4MjqsSvxQiPRP+usLTtd9u3Dn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CC76DA7;
	Thu, 22 Aug 2024 10:10:43 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.37.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ECA13F58B;
	Thu, 22 Aug 2024 10:10:13 -0700 (PDT)
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: mathieu.poirier@linaro.org
Cc: Adam.Johnston@arm.com,
	Hugues.KambaMpiana@arm.com,
	Drew.Reed@arm.com,
	abdellatif.elkhlifi@arm.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	sudeep.holla@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v2 3/5] arm64: dts: corstone1000: Add MHU nodes used by the External System
Date: Thu, 22 Aug 2024 18:09:49 +0100
Message-Id: <20240822170951.339492-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add normal world mhu0_hes0 and mhu0_es0h nodes

In Corstone-1000 IoT Reference Design Platform, communication between the
host (Cortex-A35) running in normal world (EL0 and EL1) and the external
system (Cortex-M3) is done with MHU0.

MHU0 is a bidirectional communication channel described in the device tree
through mhu0_hes0 and mhu0_es0h.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 arch/arm64/boot/dts/arm/corstone1000.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
index bb9b96fb5314..01c65195ca53 100644
--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
- * Copyright (c) 2022, Arm Limited. All rights reserved.
+ * Copyright (c) 2022, 2024 Arm Limited. All rights reserved.
  * Copyright (c) 2022, Linaro Limited. All rights reserved.
  *
  */
@@ -134,6 +134,26 @@ uart1: serial@1a520000 {
 			clock-names = "uartclk", "apb_pclk";
 		};
 
+		mhu0_hes0: mhu@1b000000 {
+			compatible = "arm,mhuv2-tx","arm,primecell";
+			reg = <0x1b000000 0x1000>;
+			clocks = <&refclk100mhz>;
+			clock-names = "apb_pclk";
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			arm,mhuv2-protocols = <0 1>;
+		};
+
+		mhu0_es0h: mhu@1b010000 {
+			compatible = "arm,mhuv2-rx","arm,primecell";
+			reg = <0x1b010000 0x1000>;
+			clocks = <&refclk100mhz>;
+			clock-names = "apb_pclk";
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			arm,mhuv2-protocols = <0 1>;
+		};
+
 		mhu_hse1: mailbox@1b820000 {
 			compatible = "arm,mhuv2-tx", "arm,primecell";
 			reg = <0x1b820000 0x1000>;
-- 
2.25.1

