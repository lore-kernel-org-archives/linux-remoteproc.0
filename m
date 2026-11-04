Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779336;
	b=sKrRy69IB+sB2l/Ozdh+R7SB7mpvEVaLyqBcyW5DFsfMqkdJWiRXrPhfc2qYh/6fnGoL
	 pPl1W7YtLtOCw1K4HZ8pfotbYHAEolvimlgaEpMG8fCg+Y0LXrZsC0rkTqJx9LFc0dh82
	 s4bJadVKdiNoPTjDanV7BHsERXADaQNnA1ka/aQYf5WWXAndrDo6+TUdEDgspz/KVAdCn
	 UtPOpOXQLZ/QO3wZ2P7yTXHE8+YcZwSYMgK1LDUdCm7Byw7UHyree/DUfjYy/06O84VOZ
	 PdrlQI5ULAX+/UJTY6qrhSqvnUd45WZ2hhNLm9dMUDI1vfmEj+lpNxLVhvsgY9HpLIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779336;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lLRxe+WRL5Tt1qmEfe063UHbl97ZvSjHDmgU7Zlb114=;
	b=1Jr71de3y/S/J1Pl1yFeOspdXjOLC4ZKMWD0Tj8r05wEqgmBjOcqdx0z6HdO8zElWXkx
	 31qG7kjs+R4u7wg+Q+i6ry4WcfcYQGaMm4Ht6tTZ92iXMMlZ0LgEACnOv+N0ZarJV1/bw
	 IxXV5oFU9mYV/9dz/oqDmAzkJTThLUyexeGATFkB8QQDvi35rtcOybdzvvr4lKBewcDhA
	 rrY0RSDZrBks03vPE7nyNSVEl4DmQ4k3ynVvNQ+LDw/Xq1w3OgQKQ49yIQin2oJqi7o9t
	 S8cAroMbF/7rOM0ngfsRhm+9VhlLhHlfbGFnjDG038BJcCO6XU3avdj2SwhovEeJt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=q4tf6nTD;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398B606A32C
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 08:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0398B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=q4tf6nTD
X-Envelope-To: linux-remoteproc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yrO/dcuuSf7cIbw7Ajuoa3PoxR9KFe3FZf8RGEdAbUk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779333; v=1; x=1794384133;
 b=q4tf6nTDwvOMi1q8W5irOS7aG7pQt+D3kqMFhHq++M/a6PbT3SIPIFvjZ8G7XVzO8LbJ8vZI
 E+BtEhFcHoWYgQW62cC9jyQk6GdS0+jpp3OCEhAQFV8SldxSixueETdOch1P5oH1ODxKvH5Shn2
 yllLRFo9NdBks7MLEt1M283uAS+Fuvzhz7oSMZYCNJULn8dybnPwatbC/Qmyhi7g6XJBBftkTt6
 4CTMH2Okt+ejsvdWphRO0vHp1oLKb9qdUBbuIp/RDDJ2swcHzIlH8mfnbz5baB49Stcn5X4gIac
 IRZpTbz2Jr4D893RKbsrrO+720PmZAE0mnl8VZjC6/lnA==
X-Envelope-To: linux-remoteproc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9f16b7435e8cfdb5;
	Wed, 04 Nov 2026 08:02:12 +0000
X-Mizu-Trace-ID: 9f16b7435e8cfdb5
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc8180x: Add SLPI remoteproc node
Date: Wed,  4 Nov 2026 05:01:40 -0300
Message-ID: <20261104080200.135431-1-val@packett.cool>
X-Mailer: git-send-email 2.56.0
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

The Sensors Low-Power Island remoteproc hosts the Sensor Hub firmware
that Linux userspace (hexagonrpcd) can talk to.

Describe the SLPI node for the SC8180X SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
v2: use single compatible and add it to the driver to match bindings
v1: https://lore.kernel.org/all/20261104074200.123842-1-val@packett.cool/

Forgor about committing and sending this while submitting the Surface
Pro X series v1..

Since this is independent and simple while that series is waiting for
comments about the multi-PCIe situation, let's get this in first?

Thanks,
~val
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e3211958d..ee1a83a58997 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2259,6 +2259,67 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		remoteproc_slpi: remoteproc@2400000 {
+			compatible = "qcom,sc8180x-slpi-pas";
+			reg = <0x0 0x02400000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 494 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC8180X_LCX>,
+					<&rpmhpd SC8180X_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&slpi_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "dsps";
+				qcom,remote-pid = <3>;
+				mboxes = <&apss_shared 24>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x05a1 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x05a2 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x05a3 0x0>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
 
-- 
2.56.0

