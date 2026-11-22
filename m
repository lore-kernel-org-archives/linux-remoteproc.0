Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354595;
	b=QlNuwiba0E72bcL0tPsH8yIgvdOM2yzulIVMwOtuGLz6Vm+4zlH2HgAVk7YY2exW/Avu
	 ZBiYfZzkXJ0g6hyo5MmVxok9XU6UBpZGyYFxtGyiEhpEWzp0WnMmfoT9Nwbqo3D2RjnQI
	 LXKeIHRoS9MK4mJYFE+uRuL7VUJ+J7neMjCnu5bbww8wLcllnLexF163xmH2x+Cj5bA9+
	 yfMfAcw7bLv7vUqnZ0I/zlkQEeBv0VajPKr8gUJXrTZyAqzyVDIUOMJs+LqCNFIuQu/cQ
	 ib6M51SbsYiKK/VFKTcnWujPyHftm31hKI94njOu6VhPO8HzNUKu5rG7fiKCji7Q3fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354595;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uw2pJFn22ilr7DOpqaXGDTxehtM73Kc4/1QC1DjlTDA=;
	b=uZgDuy7YOPaixfP8/8LOEnJko0eNvIz6VOd2Qu5f9uq0x3clpfEM1RGKS449sYf5jtgp
	 lY8EVhBO6shd37RzABqzMufTJHfyNeF3Gvo3E7V6SR0xpmHk8LhwAFfF3xzMgAuT2DrxZ
	 CdgXwjiF16cZEQX/0o3BQRDygeyThmonMf2l16lPh1KSGWZc15GjNffIrA/XsYXKYkTyB
	 WoAhWQX6k37i/Ji2SUSKCMufdmJXrwFZvdyfbIns/XQcFvnfq+bHMTocaDrA0MTeHGLhZ
	 R19wpPUHHFrv9msqmqX0IZpFa3pkCCrIb68iDMmyjtGF/r3yyPuW12xTn5uxLKT9+Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpX+dWhM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1E8606A332;
	Sun, 22 Nov 2026 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpX+dWhM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354594;
	b=MTFuSKfp7gehwOloBRyRPYUhWqO/ddJ1iQSoYt0NuWUGznCauaPvfswCf7B/8kYDCUxf
	 AlMYZKgVl3OtyadAKxBcaxNVAoUkzRvTUV7QZijBLZYS/SD2itPO6k7jXbXrH2u6KeGzK
	 ZPeX6mpr+sLoS+SutSBb9B4qFo9EOcsOvR5qJJPmtXDGKbwo1xSqj+d95e/05mSHLukNm
	 J0TrksAAYEw5BtDfivyb+JB0VOI1Th0JYEZVIaPbzj1uRX2y05Bzf6s09Uw8NCh6dX9A0
	 9cLrKLqpct9xfh+UPwa+s9gEFyQCf0r4Rd0DOQBdEtzdJeRu3vYYhx2jIE0Mq6A8Esw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354594;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uw2pJFn22ilr7DOpqaXGDTxehtM73Kc4/1QC1DjlTDA=;
	b=z4skemVXZs0/8qKv6DwA0WMtLjp8fiSGH6VGCsIBCIBq6/zbns6CSgx4NhZ2T7alha7L
	 c8IRIKiN/zcZRkNIOI7kCZgHryoymPDaYN7w/nNDXdHAKQOIwZhT5jlx0L04XNZ6XCNSb
	 fhBOAvUV9/DZShiFA9eOus8vn+71A03Af0axLvYnUmxcrMX32ZlB94W5GGaFkoq46FWl9
	 XnqqNGrKWlHFaZdPZweH/N7wOVAsid8L5WaHixtE4IrnVP8t9hHNuX4TnThhZwfWJjrEr
	 wk/zKOk5nuShpHZ79aWneEdpwFZoxADmXx9XDqiE5POF7IsC8F8A2y1L+37xzzLQwNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FECA1F000C4;
	Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354594;
	bh=uw2pJFn22ilr7DOpqaXGDTxehtM73Kc4/1QC1DjlTDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OpX+dWhMtaUNpuXE9ryjLnEY+cwlzQ2urIS2eMDHKX/fgiHWS1Q+0qcLq8Sb5ASC1
	 VVmugJdsrjYZrnpDw0UH+XzbJokXRgOGxI5aB2MACMz8nCYLYWlX1kgZPov2KSCVBo
	 04K77WDmGl0PA/aDpRUvbTbEk7TIJlW6yXZHUPvHq6Xub9Dwceh/q/ExqbLJnALkXR
	 TftW94yIZ1QALwtbY79EBMe1nwtUwkbPYNuX+gxqQpZVdaN4o6MhMCjX8SMr4LzpvN
	 NZaLsd0ytggi1KF4wyQ8YNOhwy3cRkysMZ2q/saCMM8AwBD4emvrBAivrbqMvP+0xL
	 jT+28GcF05bkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F2684C0AD;
	Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:36:22 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sc8180x: add SLPI remoteproc and
 FastRPC SDSP node
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-sc8180x-slpi-v1-2-345903fafc96@gmail.com>
References: <20261122-sc8180x-slpi-v1-0-345903fafc96@gmail.com>
In-Reply-To: <20261122-sc8180x-slpi-v1-0-345903fafc96@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354582; l=2608;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=yGUHcnX9Uv3hxuQWDVbWZHXscLvJSjDoTVLl8oDv5rQ=;
 b=hi2hKlJqNVaqU5rmtYtziyt9DuDiRlztwT5VP3X106C26MbZWZKMqa3552oXie0W9CG6AKQRB
 aBLFKRmf5FrCe+18SWZyRD4U3UDEstQhyDcS+kPDblClz42LZlcoWGa
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Add the disabled SLPI (Sensors Low-Power Island) remoteproc node at
0x2400000 to sc8180x.dtsi along with its GLINK edge (dsps) and FastRPC
SDSP compute context banks (SMMU SIDs 0x05a1..0x05a3), matching SM8150.

Boards that reserve an SLPI memory region and ship SLPI firmware can
enable remoteproc_slpi to expose SLPI-attached sensors over FastRPC and
QMI SSC.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 61 +++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e321..ee1a83a 100644
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


