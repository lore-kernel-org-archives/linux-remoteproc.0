Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559476;
	b=mRNknUyW0nyIy+WNXpV6DZgWrgwxhFS0TMXy5tn4UYpafE+LJIZJp4cOcL1MBlu1iblK
	 fP/ce8Hwgc+wpIw8z4TH8isGyKiSwW64u/TWvjAjxHUoOEhTZp47m4dFkFStZtsiyj5Ns
	 wQ3XQCB5kAJ+E08a574iC2Lw7+c+l2KFJJGpCciFQR2QCjvf/U8w5MJQ5RItjjkckXN9x
	 3MyqECDt1vR29LFZ379O/T/FSO329n2xHvA6qH4UUaMl7htoONDR0dcMz25dgFXoRnU3F
	 kZsfqu4jaIcU9gFZvTun6kUCtTQs/VT17mB1nNeX4ucBS368bee+WLa0HCxiIc3+yOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
	b=kqyvgMIKhf+2P5W2C0IdIe7gW0ZYBDFx6vF6shYYPnOVi0krCsfyz3MGw9ZqGEwSmriZ
	 dPSzHDQdQFRJtEZLdkSflHeL0xc7MzikptgJKiCSTpGv2KUK9MOfrRDMsrLoZQJMhZ1og
	 JM1fH88jJkP0LT1cnmvbyoe3x+JKCMjPfiabtDV6TcD8NA3ZgtPc/yng0TEjCunOhu3QH
	 O0w+KqJ6PQB7Bkcnfpc+UIrX5BMnMvLq7Z4LC4jQW1bDRwAdlGHOWr14Kc0XZ8gvqes1E
	 YAj0/5newNsdrg/BTklghVh8FEb1sUSz4KVNNzc6BiD0JlvKsStAAABaTlUvjRz9hYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B760A260B
	for <linux-remoteproc@vger.kernel.org>; Sun,  1 Nov 2026 18:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0B760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNJjLIim
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b118bea471so10547717b3.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559475; x=1794164275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=tNJjLIimv8wm7BuHs9s98fHWfd1IWCG/jbL677FOjvS8ts+D+tHUYpli7nfChRtowP
         3s9jbQDyWZBOYMsGXU7Kx44dS2j9QS9xCx2lS/ietnJCv0AsuU6hsAx7uBRPLPwBki5p
         9pQ9oNvfj6mk373axzydN6pPZn7f6Hrrgx08ODC2GpRK0kpD274ICfBw8WvIfvc3sfIu
         dZWdwITRSNZWceEzlehtVPs4tnLb/7NaM8lgxuBFXxwEtjUYrgscOycL6nPsZumuUWXY
         zhDqGyVncstuxq8HUJpFK/qJJNOCjzQXtun6C5DVhE01V+x5zjwIkItm/SsfApOgis0F
         osPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559475; x=1794164275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=gpe8W3qhacqIIfjzA9l2NWPIFw+hWI4P6DxMTG5/Taa2RJd+VhDF2YBl8S8NZ6lhcY
         JVtIv1AYyHY8IHLEPf9k4krNg3rW58zJ4K6GtkU4s9bNNyMr5thsx/iKNq++Geas5UHy
         iQqvL+noLyHVsloWgiMab3HNLMiE6QBoS0zavkhtEAIzCJs9OeJM3MMVJ0bv089PSS3U
         YRn2TdgFNgO3lv42IhaMhzEQSrA/xNLYNuYXUjsGZGkqMz65oHAoHKhDvWAtzvlT+VWc
         GyuNgfpMIjCtnFgoVzHhvpdCjdfLeeJ2Admn+0kSxMpXYAnhQ7zEIk+XQkkonTKfeuRb
         pqQg==
X-Forwarded-Encrypted: i=1; AKwUvBxHJZgx5rVA6KsavXejGYrMCmZ55uE72p2EdE+HCXvtSILl5NX5hgUBaZ7OZTpdhppzAsdXT05s+z7B0SS0POwR@vger.kernel.org
X-Gm-Message-State: APuU4Z8lPVY4FNyQh5s3Ir7TCnmsRhRrR96hLgSk29cOwzziFkiQCFkS
	m3wxR49lXETqMw6pFw4ii4Ca+MBOx5jRRmRh7O0Qi+KvHQYGNJ+skw+x
X-Gm-Gg: AYBFou3Om7xP5ddDiLRBkrIfoj0o/7Ex0pqAJud5byeFWEgtWniLv9fiOEuq4khUt8W
	Iv+aPapRFDcP5KdMa0PyLXh4Kkn4SIDreWuQZ5xDO5ZIU3JUmKiCV+JfMWd4Aluu3lu25jjJ9zK
	IPl6AeX7ANYBx3Lle/TvRXmMh72YLVAG3527VAOKxRBSwT9Xd/Kv2St3/wotOa3Q587EY1e4nrz
	5x3wmYBkawG+xqvxFqAQKsDNrTyPX+Q7qCe6jiSvH1r1vgV94B0GKzBfszLTV7vzAbOh+Sl2H+P
	5vQig0emxpyQ9lxhW4cM5oWhqchQYf52DAE9443RrNnyYtdN5wrMkkMMNM2uqlPGC0n0yw921Cf
	6yLf2dIX2PzphsnDhRIpLEme/JJ4IQCspVVdIdPlt18gUSmrF+bvI4VYba8y+XHZir5XcaESPeF
	65Jg5BjEyxdmkyweQ1GIZ5aWnJVXtez0GN10EHUIkW8/k6jhwMH5soX/IrSd1OyUUgugDjudlOd
	EzxMCPCW1HEIbRk3CjV/aAfaus7cXGikRMPukx3c3Cvdnx7hO7uZ2cdkflQIvRf6ZJQYg4oINr/
	6qTCRj5lPe99hAEA48yamfpFenZJlylR6EBrYP/dK771MYr2AsLrusvya8XbgEghPJM=
X-Received: by 2002:a05:690c:1b:b0:8b0:dc77:6b29 with SMTP id 00721157ae682-8b2b6790179mr69509227b3.55.1793559475269;
        Sun, 01 Nov 2026 10:57:55 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:54 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a523: Add message box and remoteproc nodes
Date: Sun,  1 Nov 2026 12:57:33 -0600
Message-ID: <20261101185735.762559-6-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the message box node, with its four register banks, bank clocks
and resets, bank interrupts, and the XuanTie E906 remoteproc node,
with the MCU CCU clocks and resets, the RISC-V and SRAM power domains
and message box channel 9.

The remoteproc node is disabled; a board enables it together with its
firmware name and reserved memory regions.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- Message box: all four banks with their clocks and resets; the DSP and
  CPUS bank addresses were swapped in v2; remote bank interrupts
  corrected to SPI 181/174/205
- Message box: interrupt-names
- Remoteproc: debug reset, RISC-V and SRAM power domains, one message
  box channel; the message box clock and reset moved to the message box
  node; reg-names sram-a3-0 and sram-a3-1
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..316698b999c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,31 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu CLK_BUS_R_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "arm", "dsp", "cpus", "rv";
+			resets = <&ccu RST_BUS_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu RST_BUS_R_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "arm", "dsp", "cpus", "rv";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1169,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+			clock-names = "bus", "core", "sram";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+			reset-names = "cfg", "core", "sram", "debug";
+			power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+			power-domain-names = "riscv", "sram";
+			mboxes = <&msgbox 9>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

