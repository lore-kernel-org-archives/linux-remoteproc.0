Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D818DC433E9
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF773207A4
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbhABVAj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 2 Jan 2021 16:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbhABVAi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jan 2021 16:00:38 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382BCC061794;
        Sat,  2 Jan 2021 12:59:21 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ce23so31437062ejb.8;
        Sat, 02 Jan 2021 12:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
        b=LX0x+d/wlnC1sZkRyYDjLBXqvw+HuipbZaDas+tMA4keheA+uAaQE+3Kl/waQBgQ/N
         NqmZd+VRa4fSSQeigZ4/xaqBdNLfxiCOvqLbHtkOleBVsvfmO3Ef1bDnt2fzVP3vGzqc
         DJ5KrVZKX64j7gFgKarV0K2+m2F+P0wAQzJbvRVkFVOb8YJKxEpop59hBP6s+D6HcaVb
         hJMHSEb9wTAxjT99DwV+9HVQ9ZaxxqPqfryPdsqL94c7x1apQFpg+kq6E1t9v0jZ2p3E
         BxyS1HxwblLEu4oGe6+/lNGLJZxIQZBLwTumuhTpyeyI6omjo+Zx6XNR+Mg/yYKaQZlV
         cUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
        b=NVT23UqT/tDoIK7X786Vm1f1ONYulj7/btkvXasZZwKYeXWG5QIpW0AQF1ulS/+sH2
         zM5iUEWPX9yNoP0xpVdsZP50y04wRdkYmuRvN+tK/QKiaY7w4HLxKucogYX5HfmtZCU7
         XsC4g7yffCuD5LHl1A7xzVxSKvI7iKEGrFBBmuwV3SQ3v4PG4GpguUBnNGVat7DdAbJC
         k7vNimPR/E03jzFmxcG9pbKb2hgecrVmLFziOFJCSdzwj1NTbfYAYW5J655d0Z7g3PcT
         S0hONuhPsarHvii2a9fYITxX/m/LG9sK44DzobQnhm08EJjVsg0Z2kPQLJPbOuOzc5+p
         /XHQ==
X-Gm-Message-State: AOAM530xdEulIdkTzE+IwmXUY5VqlZAEMWUktrIU7W0Yc8h/2Oe/XV+d
        uslMfaqnpHzbrzZft0PR6vBj+cWwhJc=
X-Google-Smtp-Source: ABdhPJx7xaUlcxjSoqcvq9+XCcHQA5d78D+yTzqO/Pl9D22nN2gd8ZHAQ3He1/KK3+GczWCzZh8VbQ==
X-Received: by 2002:a17:906:d87:: with SMTP id m7mr60523857eji.108.1609621159822;
        Sat, 02 Jan 2021 12:59:19 -0800 (PST)
Received: from localhost.localdomain (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:59:19 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 5/5] ARM: dts: meson: add the AO ARC remote processor
Date:   Sat,  2 Jan 2021 21:59:04 +0100
Message-Id: <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The 32-bit Amlogic Meson SoCs embed an ARC processor in the Always-On
power domain which is typically used for managing system suspend. The
memory for this ARC core is taken from the AHB SRAM area. Depending on
the actual SoC a different ARC core is used:
- Meson6 and earlier: some ARCv1 ISA based core (probably an ARC625)
- Meson8 and later: an ARC EM4 (ARCv2 ISA) based core

Add the device-tree node for this remote-processor along with the
required SRAM sections, clocks and reset-lines. Also use the
SoC-specific compatible string to manage any differences (should
they exist).

On Meson8, Meson8b and Meson8m2 the "secbus2" IO region is needed as
some bits need to be programmed there. Add this IO region for those
SoCs as well.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   |  7 +++++++
 arch/arm/boot/dts/meson8.dtsi  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index e0ca5f08d07d..8bae6ed0abb2 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -200,6 +200,13 @@ aobus: aobus@c8100000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xc8100000 0x100000>;
 
+			ao_arc_rproc: remoteproc@1c {
+				compatible= "amlogic,meson-mx-ao-arc";
+				reg = <0x1c 0x8>, <0x38 0x8>;
+				reg-names = "remap", "cpu";
+				status = "disabled";
+			};
+
 			ir_receiver: ir-receiver@480 {
 				compatible= "amlogic,meson6-ir";
 				reg = <0x480 0x20>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 420324ea2ad7..157a950a55d3 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -369,6 +369,14 @@ mux {
 	};
 };
 
+&ao_arc_rproc {
+	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+	amlogic,secbus2 = <&secbus2>;
+	sram = <&ao_arc_sram>;
+	resets = <&reset RESET_MEDIA_CPU>;
+	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
+};
+
 &cbus {
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
@@ -496,6 +504,12 @@ mux {
 };
 
 &ahb_sram {
+	ao_arc_sram: ao-arc-sram@0 {
+		compatible = "amlogic,meson8-ao-arc-sram";
+		reg = <0x0 0x8000>;
+		pool;
+	};
+
 	smp-sram@1ff80 {
 		compatible = "amlogic,meson8-smp-sram";
 		reg = <0x1ff80 0x8>;
@@ -631,6 +645,13 @@ &sdhc {
 	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
 };
 
+&secbus {
+	secbus2: system-controller@4000 {
+		compatible = "amlogic,meson8-secbus2", "syscon";
+		reg = <0x4000 0x2000>;
+	};
+};
+
 &sdio {
 	compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
 	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index dbf7963b6c87..c02b03cbcdf4 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -320,6 +320,14 @@ mux {
 	};
 };
 
+&ao_arc_rproc {
+	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
+	amlogic,secbus2 = <&secbus2>;
+	sram = <&ao_arc_sram>;
+	resets = <&reset RESET_MEDIA_CPU>;
+	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
+};
+
 &cbus {
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
@@ -464,6 +472,12 @@ mux {
 };
 
 &ahb_sram {
+	ao_arc_sram: ao-arc-sram@0 {
+		compatible = "amlogic,meson8b-ao-arc-sram";
+		reg = <0x0 0x8000>;
+		pool;
+	};
+
 	smp-sram@1ff80 {
 		compatible = "amlogic,meson8b-smp-sram";
 		reg = <0x1ff80 0x8>;
@@ -628,6 +642,13 @@ &sdhc {
 	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
 };
 
+&secbus {
+	secbus2: system-controller@4000 {
+		compatible = "amlogic,meson8b-secbus2", "syscon";
+		reg = <0x4000 0x2000>;
+	};
+};
+
 &sdio {
 	compatible = "amlogic,meson8b-sdio", "amlogic,meson-mx-sdio";
 	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
-- 
2.30.0

