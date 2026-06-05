Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AAF4D90A1
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659487; cv=none; b=QnveOeLkqGaOkWnwyGbU19gSOBu7bTNqmR6KWauM9Nx7o+N6ZNmXEpMnl9/BCu3ogAkgKz5dkgGT4jEqgQKOv6nm2URK/6er+M4cDWrn7ogO7jM84t5cqpCSgaKufgVm/pwhg5p7Oi1WjrvZjwU5QptH1zSzXxMNynQ9iqyN1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659487; c=relaxed/simple;
	bh=7+PuTcFr4lv1Emq9smWBnZ+5CR1n6JckIWsQMdS8GdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1BMBWr1ZapiTl4ShTRIZ9qCtTrGfBWNivToaI28ShoYfkGaM/kU3xAvjgSncfje8ANigPe/aPt97DT9q4jLE8rOTfbrM/bdES4vhDkZoUlBTAlXRxMsPRIQpJJA/U8ZVfA028P5pvU7+uD1lxq4lLTnY+HOW5MjZCJiz4X+0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGq55n9y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGq55n9y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eedc94d37so957456f8f.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659484; x=1781264284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=kGq55n9yVRkwibr8hIjUU2uX+jY+pyOnmFoO8e12Kg1O1K2A4hp+aRKt9oze21sDuk
         ZValtRPHAczPNrSpAVQCS2HE9ci72S5PMzHh6QMX3MCUsEv6Q/qASsZBSfAQ4desi+4D
         p1JY/f3pNoFQF6cXDiEVxSEyav4fpKjs1PwF0T7x5FnquATv/Gv4WA1dlCBC0WpsRVXg
         6W3tYKA2Tw+sWYnWf/P7Qt0mLNo7ue9eRf4kkvq8Tw4pBpeejGAep43ljUETN0SZid8A
         gXvdxa5Gld/+psb0YAZoOpe/8jlg2ldUKdeJxBPgILOUbii5BW7nOSqqpDMC5na7cCG1
         3c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659484; x=1781264284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=peYjrkWGZTFnq5eutD7JAIj74DareRwqgCZVGNH4FavLo1H6QWHDO/DU2KuEBq9lWX
         u+uXwc3DTQE0Cf2gbNI23y46uX76578Kx9T9m6e07ujY4aqQOCafdM9+yYs6GZBYuuoO
         qWSUD4DLtJ8PYqwVucERJ1/IakcKDOgq63JGqb57p790iOiEXjEdNzT9ZWTW8hUH22WP
         cUaAhKysI+cs+mvAIXMSDtN159POxp6T3dVhxDu1niY8kguL66YT7ncaPWmxkdew8yo9
         HImsR19UFf7I+KT83vrJGR0XwZFqKluqiJ06QusHlZGihsHX5M0BOwWlhd+ZENyYafMz
         tYpA==
X-Gm-Message-State: AOJu0YxSA/x781S7BkxxmJYaWeJdvXymwE1okameSMLQhN2PD486PR5u
	PsZzxBZIKbn7rQUUNld7QEQQDnCzKyvJd+srBswAoYVIy0QC1JuB783h
X-Gm-Gg: Acq92OGXHXVEGg7lEhRAPwD7AjCVpO1BlnnLoSdmZHJi9Im4iNbzdIMQSxYF2uM5vs3
	oiF2HQk285egrFaxr8uZ5Em15NGWMg4GkBMmehZ7lQxYJpnhzXiwDHXEPaCPlyrwRDtOy1RoHVC
	y5oTLmsPpSD5NEhwf2zxhI9kx9kJivBedFVhaQ6e+13sY9fa5iTsykv4ICs2gJAMdaJzjF1Pih1
	SjxhD35JJgrvbtevvq29Pm5RZKO+NnyeF7Vo91K1FRjbHETd9zp1oWNDMizPi+APZouE6l0WrH5
	9kEeczr3XihG2ZyS+6et6VGrvJmP9JN5V0+DiiLSY4r2rsPjB6emYIChSm6XU9q0uIJesUjvfPy
	hlp3LjeoZ66BM2FGXb2e/fiqtaQCTtgTdJhXis8cttQBRnzYQhujlSo3r4fE4eDIeiK/NDDsi5g
	P/cE7LEsBYgNsgbuLr+O9tLqOY72b8K1avFubuJfRrzq6nzrKeyBk0/5H1/veD
X-Received: by 2002:a05:6000:a91:b0:460:1755:160e with SMTP id ffacd0b85a97d-46030757dd4mr3877576f8f.33.1780659484157;
        Fri, 05 Jun 2026 04:38:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Fri,  5 Jun 2026 04:36:20 -0700
Message-ID: <20260605113621.1479-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0

