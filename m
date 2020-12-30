Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D8DC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEC1F22242
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgL3B3E (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Dec 2020 20:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgL3B3D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:29:03 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AE6C0617A0;
        Tue, 29 Dec 2020 17:27:47 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id cw27so14155643edb.5;
        Tue, 29 Dec 2020 17:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
        b=n0kvizMriTgtIILh4cyu+wwdt92uYsszzldRC1jelreD/qg8FeL/+cMfNI+88hVGzR
         ClBoIUg/wW6O6nioqnOBzo8VnAzEk4FBokBcsYFSqzP2B02F6bqFQ63eIiGbfCnNGRP+
         jK3RRB593s1L5IDj327hHuu2d+ixr7ySi8DNBialKJlp9jHXhYwggm+BfKAgH8L4Lvpz
         tFTRZ86qd4D36KW+TKuiveduvajvo2lvaODBP87tlJDJLWKfRWKQvRB511eD3+RIjsYn
         tY6OssyjM8aOoCGWHjlrVKrlvyOBBq+L31K2WQ3AiPHBsad9ELjYw2ope/xfihBJUsh0
         POyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
        b=EViaYwrZUypiZ5VJGYxBtIRoA36tPIZSj20TJRLvFeXCIWm9tx74xhIzl7ehjsvE6N
         X/Etvf4PsMq5AL1OiOXL4MFzctUKwHtpb0bI+d9GymXBH+ljEpoAR7aGEOAJclA2tAvV
         dRQdigLUmPrPMjDBDvJbU49Nw37F0CvY5h/OS2VLF1KTKGc9aSNl8sWF4yR+gjGBFyxh
         i19uQdxi749v9iPF75LayWI/o/A5HtB0sG3Mm8c211aO7czSt/y/osLute0MESK6auYz
         LdA32UUDVLEZpOwzrNGWq98Hq7lcwyL4qDR1MKVTVMPiJIn5A5rWCROsOu+p98I+NY9s
         M8BA==
X-Gm-Message-State: AOAM530UwW+849Ttc4IyHJBAtB/ITqhJtg6yE5KAS3ulgGnNy300za11
        wHObFa4N9MVuGX2zXXzMobEynzpoD4U=
X-Google-Smtp-Source: ABdhPJwWmtTfa86OuhG4O+6Vs7xSFg9ystKi1GbW6SiYF8s1I09d4I8ab+S4iAALsQQHQRyJmdms3w==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr47713067edk.201.1609291665779;
        Tue, 29 Dec 2020 17:27:45 -0800 (PST)
Received: from localhost.localdomain (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:372a:4000:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 17:27:45 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, robh+dt@kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/5] ARM: dts: meson: add the AO ARC remote processor
Date:   Wed, 30 Dec 2020 02:27:24 +0100
Message-Id: <20201230012724.1326156-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
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

