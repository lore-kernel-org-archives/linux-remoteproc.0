Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC9E3C9898
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048863; cv=none; b=BUbm2NAZessHqxIA0PfFqqOtxn8yEyvX39VTSdOrpBRO1CYKATD6EZ1sDd4dz/8S1guuCfbOk57IUJK40YgFKg/wYukaxPHtVMYNhr0U7+cP70ARKD2xlb6jrcNPvhQu6Q+jl80AYT0IXEfLcQuo+ibyCy/7y0Vx//ckagzfyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048863; c=relaxed/simple;
	bh=vs0p7aKfRjm32/JARKxXOJKs9GaInGuJp6lBcXmuJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+7ov2MbmYmV4ZfHxxw9S50N953SfTIEOp2MtsVdY9eNcV/4oQuYL76o1TJ4NWKP9vpL3mrr0GXCU5SyHeLbiHogSF49GN2Qm7iPcQY2+Gs2CKzV5o+e811NM+/9g6PJOZ3jtwIMfVdFNVhjVsEvWtKmWGUkTkCATZvPWR8hoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVUVX5ft; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVUVX5ft"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so27761597b3.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048861; x=1790653661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=qVUVX5ftJF5fLwjFoK8H2BnPZh1XrTMfdJbkP7eptBkB6j0sjxxVjtZqAI3VG3nJxe
         Cnv2UvCVqaUC3NFw+aLiYrQciOLwrcYCR+MX/DKAZcF5SelXUeVzEes77wbbaIROLqje
         /YKb8leEVc96mruQmgKrfZeipo0sx/lO1FYoRiWJEqPJWzzfHD6WkZafRdjLQgCbsKDS
         5z/wyQOIn8F1GedCzQTvkLgKGpksXR5nORvgwWYX/nQEOL/PokZ+EHB/sAorALEFEL7+
         DBPbnqbLq5V6Jma0iVtux+NTrZim5QLMruXPp1sGxjuME4TMu7GUhx9h4cPbRCejo7ED
         vzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048861; x=1790653661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zsDmJePgaslWzMD95723Em6EJMVLj62D0M57SSna4=;
        b=mimqGQNtuUHhzoYnVX63sL8lQVPSabe9pillz7VuTWBey9Fy5WOqWpxzI9GfTSnB9/
         +aiIGnPDb7Cgx2cAx2ZCRYQ6SlXtlWpyEbGFxrU7gstwSb/guYVJnJtQS5EchicBQwuL
         zyWrFomXea4WwsG0I4wKsyPyN4eCEh/4GBt8zJb0J/sCsX8CYzVvEIHv+DQG8t1szy05
         znB9qszq7yLniMbQc5qsE4hBmPjX43HjmFm8g43BZw3if3iEn3vgv0yAWP+4hAotyfkN
         oTAMZkew1NKeM7p1WuVzjQSb+Dykj4QA0PPPBkZRRn7cJTXtxHlw6KpNztrgdXBZbDo8
         K+0A==
X-Forwarded-Encrypted: i=1; AKwUvBwqUIe+0hlMO5P3LZv33/TwbH7+ebXs6iMJ+Nx+GxP6InnTCgvQsRUjSM8QKfGXC2fhIqyhd70j7XiQatit8bF+@vger.kernel.org
X-Gm-Message-State: AFuF++k1/HDlW6IGQpm6epaPdDgtlTB+ItxzRzJkIL3n8KYj/BmH/Yms
	SfsO461YapRVckpndfolAFpuVUMTmEzxxOT3yklertfBzfKXpci3+wUO
X-Gm-Gg: AYBFou3eumiYBkxnn/HoWd/fVg+dyHsNMhxLyjEDRX3PZpoa6Vp6qcOt4PYV61KbOiw
	ukeIK/e3SrQvtYdlwGpqQefB3TAm6SrLcsTHtZBMlveO0JHQTovIUKg+WqXs0Mo+AhJg/s05phH
	rabsI7J2XOb+RKJ3pNXtXURO4xfW9fGd/9P3HZOXQS7DE52fWDQkuEXN7jUm+93oEpKpTj0vCNL
	18tj+Ans53LjfgKLMUGiP5mm/vDJkTdXNP0/2jPkAb6kz6NQRdaQMTG2tyvawlVZ041p9rhco/s
	oWYXmjZtcq3cWjpWJW7ENWV8MsBFyTiZ5edsKJ+25WdEhAh4bfAtEom1ZMoV6CQpEzLS4CMvaOL
	cqDRy2DyBMnVUlnXdFRdJWcNBLYJqUJZk/VVdjx8+x8kY8buT1FTC3CbLx0+PjcW6I7NNX10Gb8
	QhyuJhjnk99Y5gDd5CmJnM9WgCIQeEREzM4qEWI9sCzFDoW5Mhs0XAZJ3SB4VEXPU9jQ==
X-Received: by 2002:a05:690c:e3cf:b0:88a:4770:c2e9 with SMTP id 00721157ae682-897308f88c2mr50874537b3.14.1790048861342;
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:41 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Mon, 21 Sep 2026 22:47:11 -0500
Message-ID: <20260922034711.190253-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie RISC-V
remoteproc node for Allwinner A523/A527 SoCs. Connect the remoteproc
node to the MCU CCU clocks (bus, core) and resets (cfg, core) to
support remote processor lifecycle management and RPMsg IPC.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..7c5c39c56858 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -1144,5 +1144,44 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc",
+				     "allwinner,sun55i-a527-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "r_sram", "r_sram1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "bus", "core", "sram", "msgbox";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "cfg", "core", "sram", "msgbox";
+			mboxes = <&msgbox 8>, <&msgbox 9>;
+			mbox-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

