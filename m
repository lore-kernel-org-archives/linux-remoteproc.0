Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C178AC77B73
	for <linux-remoteproc@archiver.kernel.org>; Sun,  4 Jun 2023 06:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjFDG0j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 4 Jun 2023 02:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjFDG0f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 4 Jun 2023 02:26:35 -0400
X-Greylist: delayed 601 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 23:26:33 PDT
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E20029F
        for <linux-remoteproc@vger.kernel.org>; Sat,  3 Jun 2023 23:26:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [77.239.252.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 0A57C1407E0;
        Sun,  4 Jun 2023 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
        s=donut; t=1685859417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3HSupLYAa9gVgOh1YuT4Y/uEh4nL+buaplsKnZQtZQE=;
        b=p1a7OZ3xcF4HcWso6WiAhnNTE7ryqEDBIW3o7abpfvFJVB7egGuro6/wFkdN2npD5urn9r
        f+nV1WpbR1Z1rfkO97nZpBFnHlxz7IOJwH+6MIS341C3VNmVQgImCDvzL2XEWm32h5mLwe
        ZbRlwUg0GDq2vRWIxswOQiGjY9anDTk=
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm630: Add support for modem remoteproc
Date:   Sun,  4 Jun 2023 09:14:21 +0300
Message-Id: <20230604061421.3787649-3-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230604061421.3787649-1-alexeymin@postmarketos.org>
References: <20230604061421.3787649-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Modem subsystem in SDM630/660 is similar to MSM8998 and
device tree node for it is based on the one from msm8998.dtsi.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 57 ++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5c4086d2fa99c..5e68972d48fb4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1026,6 +1026,63 @@ data-pins {
 			};
 		};
 
+		remoteproc_mss: remoteproc@4080000 {
+			compatible = "qcom,sdm660-mss-pil";
+			reg = <0x04080000 0x100>, <0x04180000 0x40>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended =
+				<&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					"handover", "stop-ack",
+					"shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				<&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
+				<&gcc GCC_BOOT_ROM_AHB_CLK>,
+				<&gcc GPLL0_OUT_MSSCC>,
+				<&gcc GCC_MSS_SNOC_AXI_CLK>,
+				<&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+				<&rpmcc RPM_SMD_QDSS_CLK>,
+				<&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "bus", "mem", "gpll0_mss",
+				"snoc_axi", "mnoc_axi", "qdss", "xo";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
+
+			power-domains = <&rpmpd SDM660_VDDCX>,
+					<&rpmpd SDM660_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			status = "disabled";
+
+			mba {
+				memory-region = <&mba_region>;
+			};
+
+			mpss {
+				memory-region = <&mpss_region>;
+			};
+
+			glink-edge {
+				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 15>;
+			};
+		};
+
 		adreno_gpu: gpu@5000000 {
 			compatible = "qcom,adreno-508.0", "qcom,adreno";
 
-- 
2.39.3

