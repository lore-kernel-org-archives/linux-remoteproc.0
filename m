Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737624;
	b=kLNORbRrZc7/dME4TF9UuXITSigb7d/B3qClkp2i5J5cJsAzcdYeOWEB3JrObysOofQL
	 zUaikQBi+pMBhZLbuO+G4/f0eC/GOW38bLuR+PdHME6wY54TFbXltsRaFy4wB6g0utktx
	 eecFJwfbS3CKhuMJauZhZfvNmELJmPYlxBxGwfOWElY+sMoN6GDd/orh8r5MAfPVDcIcw
	 eH+0YfBnHtKmcXnsKMSou4lPb7JZYsuP6rAylEBqsVO7gcIGELax4I+An2s+TCyBMtmjL
	 kxJ8IVUmrvHHpe8f9cAxqrvMgRsuVmUVilG5C0xfBOhbkqd+7bRo3FDUG26x4ls3Jbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=;
	b=ftNczILqODAB6csuvKOzWpF+2YtSkiiuCLyyNojKHU1AZavNvI0auT0r7p+qVYSWzCTC
	 w34X3Y6dJPYPJY4RTokP/fwQrwGe/ntlvYlTTduy1YpeJFXH0tP1+nZnLjP2PBs5m0yHY
	 +jHWc/SNHGUc2s5V1FhlTnTwjkPLt0V8scjnSoV9QjuzalRq8bGiEQa3fJBpOC4ic9DWK
	 Zgq2r+oJETAYMax/uoc9ipEmrQiBh9HzLu3Mqi3tqKuCD7E9xxIdEDJsptS37YYYsNa7Y
	 do7B8GbV0TCPcdnQIOy7Wu1mnQQBtscA55bBZSYKZiF/D9bm/mJSdDZgj7akg1iC6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DN2UseK5;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690460A381F
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 06:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1690460A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DN2UseK5
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so39043f8f.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737621; x=1793342421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=;
        b=DN2UseK5Tk7tpK0k0ilAvJ5iPN1z1bIqKoeOYiSmWhwr8mI2ztOOKWIv6vg3YA5Kc/
         ZpD2z9k1omHwf27KRlVTolgVSfCJ3WIAYx3SmBWp66BvUXoog22YH6DsxvULX1+5mXzx
         TXbAO1qIW+DoMhi0O+rPs81IsXVgOMGTbDiulAY1hgmdH+NE9yCgqsex3kOgMJ43Ccds
         oNVnLwj91daLr4UcGCYKRI3esNiZDspUFFJgoGOibch4yQIevKCDAoygMs7xerCQiI4o
         zMsOf0vzZuINYvfijCfKlE4shlnhuQP3zJhJ5HAhIlR9i2sBJVXn72szUIQk/Vt9OO20
         +S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737621; x=1793342421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=;
        b=2wSlXdKMHVcRBLZTHVcIw0lP0F+qX7sWg3ChAy1+J9sOoLs//uu7Bve6erDVdPsTUw
         ndjkS4CxppGg0qEF9Echn+hbWK6ulOsCdxqqp9hvGbUPa0BsOd0SsymdmLVqrPYR4hSZ
         crhog5LrrHfDjfwFemNE38Hdus1DxP/y+d3lne5O45dyBZk/24ixC7YOExdpDnq1tQMm
         /o0oXgGoYel3fTzypbDphKc4QHAu7NepT5iczusPfIIuY5nRZCKM0NFkL9Tt/3+ltUTc
         geaXqjz0D4j3IuqwyKeNJH3gxElkAyrh6dMeoHowYwWFwRBg8b/rKoBMfPXkZcjunVwW
         Idqg==
X-Forwarded-Encrypted: i=1; AKwUvBywStg59KYxI+76xKzWe0dNB6ca5bExS5B9ltZtpPUqVz4x073kyzMxcTXOEXx9CUH8/pxoaaeaWF3NvWS/61a3@vger.kernel.org
X-Gm-Message-State: AFq9FYKUuDU/FAAEg03cRdNdIdtUfMx8GhsvJe2ASEhNKvxhZWgmZSTt
	wBbZ88jqPbpvmYTQ3P2Rrzcseq0iGNeTmRS1g+mYbUnRQrat5Vlvzcbq
X-Gm-Gg: AYBFou0gP9WN42Hq1tuPoKTlgx05hDwBDQd+b4vUL2RRGzIkXmH35jtetlfxpVuC2J+
	7gGBIJ6seAVPzbRMoWiPARVOkOXw+3CV5Q2FjlCHocMlSH8M4Rjg4ZPR18oSsGtCtuFi8eFSTPo
	d1l4BgR/i+F6tgJfh9mhL1k8mahIKc0Yf8npc/rnsyFA8Se4OrtbMAtR5FzWTKblyAS5o4pKNVP
	pSV2uOXjnKbpQy3jzIK/zr4YyNKuv2bSJmuKReJnYsEeyYI/wYfnbfJpXm+pdsPBfHyI8G7lYKv
	u1rwpDeAuHLuuwoKRBovZKMkT1epL3ivkC00TP0Zw/ElzUoa2QsLr3dI12jPJzH+ryCLbvLISI/
	A4/wO7foy/64psz1gLzDoiwX0IBpS9yLUENkjJzTRkZLrghjl+FJPhhz6LnzQNwAOh5ZEPLmZfb
	3FVZaPn/K0NlrUD6YaFi/1ANpE3If/JcZn70Zy1NcK+Wl2ABrP6T5Pdh2pnvW/XtxWSJGHAVE9w
	tx0bw18N9DC8lEUiI1ed5hYDLCJXWmzRulregXDAIZfCZZa06WZpnrQXTsL+fDeYAofN0AL4xxU
	voAlxFp+09INTzAKITsuOln7ONgAUZ+jYq1Du7J0k80SIFE9t40Mfd+NNMPW4Tl3jzKC85biSml
	X5S0=
X-Received: by 2002:a05:6000:310e:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e38588967mr1965340f8f.14.1792737621324;
        Thu, 22 Oct 2026 23:40:21 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:20 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:39 +0200
Subject: [PATCH v3 14/16] arm64: dts: ti: k3-j722s: Add the AUX L2 SRAM and
 DRU regions
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-14-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

The DRM accel Thames driver maps each core's auxiliary L2 SRAM and the
DRU's channel registers into the Contexts it creates, so the DSP nodes
carry these two regions besides the L2 SRAM, and the bus gains ranges
for them. The auxiliary L2 is 256 KiB of SRAM in a 512 KiB aperture; a
read past it faults, so the reg entry covers the SRAM only.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 16 ++++++++++++----
 arch/arm64/boot/dts/ti/k3-j722s.dtsi      |  4 ++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5a5b9a1bfd9e..b6c951a1dd74 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -385,10 +385,16 @@ main_r5fss0_core0: r5f@78400000 {
 		};
 	};
 
+	/*
+	 * The auxiliary L2 is 256 KiB of SRAM in a 512 KiB aperture; a read
+	 * past it faults.
+	 */
 	c7x_0: dsp@7e000000 {
 		compatible = "ti,am62a-c7xv-dsp";
-		reg = <0x00 0x7e000000 0x00 0x00200000>;
-		reg-names = "l2sram";
+		reg = <0x00 0x7e000000 0x00 0x00200000>,
+		      <0x00 0x7f000000 0x00 0x00040000>,
+		      <0x00 0x7c460000 0x00 0x00020000>;
+		reg-names = "l2sram", "l2aux", "dru";
 		resets = <&k3_reset 208 1>;
 		firmware-name = "j722s-c71_0-fw";
 		ti,sci = <&dmsc>;
@@ -399,8 +405,10 @@ c7x_0: dsp@7e000000 {
 
 	c7x_1: dsp@7e200000 {
 		compatible = "ti,am62a-c7xv-dsp";
-		reg = <0x00 0x7e200000 0x00 0x00200000>;
-		reg-names = "l2sram";
+		reg = <0x00 0x7e200000 0x00 0x00200000>,
+		      <0x00 0x7f800000 0x00 0x00040000>,
+		      <0x00 0x7d460000 0x00 0x00020000>;
+		reg-names = "l2sram", "l2aux", "dru";
 		resets = <&k3_reset 268 1>;
 		firmware-name = "j722s-c71_1-fw";
 		ti,sci = <&dmsc>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index ca10c6904b69..6c0d2ee94290 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -185,6 +185,10 @@ cbass_main: bus@f0000 {
 			 <0x00 0x78500000 0x00 0x78500000 0x00 0x00008000>, /* MAIN R5FSS0 BTCM */
 			 <0x00 0x7e000000 0x00 0x7e000000 0x00 0x00200000>, /* C7X_0 L2SRAM */
 			 <0x00 0x7e200000 0x00 0x7e200000 0x00 0x00200000>, /* C7X_1 L2SRAM */
+			 <0x00 0x7f000000 0x00 0x7f000000 0x00 0x00080000>, /* C7X_0 L2 aux */
+			 <0x00 0x7f800000 0x00 0x7f800000 0x00 0x00080000>, /* C7X_1 L2 aux */
+			 <0x00 0x7c460000 0x00 0x7c460000 0x00 0x00020000>, /* C7X_0 DRU */
+			 <0x00 0x7d460000 0x00 0x7d460000 0x00 0x00020000>, /* C7X_1 DRU */
 			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
 			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS0 DAT3 */
 			 <0x06 0x00000000 0x06 0x00000000 0x01 0x00000000>, /* PCIe0 DAT1 */

-- 
2.54.0

