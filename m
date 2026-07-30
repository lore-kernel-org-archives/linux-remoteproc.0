Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9348644C4EA
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429330; cv=none; b=T8+9/wi9asj2nH4SOL/VHRaNIu6QSXVpPd5RNHpTy/cW3fDqE/3sw125uRV26IzLTDIkT7U7KP8+Q/NidoqcrmoWHKpnQ/Oze+UP4AOYnr4Y0JosWYEGAha4St4rQz5FRaH+pNi2kxvbqKEvUBzPyS5XuuzFuUbaDFkx/PsKs3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429330; c=relaxed/simple;
	bh=8yZPGfKuz/cimxOrEnowvfRBLrOfYWWMq5XiuETxLs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4QelnsS7IXXE6ga7PbBrnVbrS+fkGacZe4tPkeAKN+hlOCWPlqiA8xEiHtdIFnRmUFPDK8riUsQXGs/gbflw9CtVJ/4w1t29TCEA/iMH3CdKClTNEcKGlMOqwFthkqxsGeps58lvHVnMdUHoVKl6xAIvAoFYc4NVUaSKE//bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvhTPryt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvhTPryt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1517810f8f.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429327; x=1786034127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=QvhTPrytozXU+SSGw0Fm/6qHmUdy12VY+4rYKc2L29iruzIdjjSa14YljM52Du9F0u
         Fm+Sn/F5ddESbzIQUMdzE+9HyjidJ8Ae8nL9RN356NFr+a4LMgoDwsDyzlBuVry6XMSB
         NqY7wRoAZKV9scyEmq4whEBoJzm/wtuS532NBmhpaD5Isv4S9z3lOp8ocLM2aP8dhcOv
         k9p8FpWmxpRTAulsWukbuTzUJfPt3VsaJNpsXVCL2ubxmkcNnT2kSuoR6ZbXUt0RfY0k
         iIasOkUC0hclgO1n0GuTyoIQC+O1+L6pKHbJ58da4MEWh/L5mfbQSigDTQzKPQ81hXzB
         0Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429327; x=1786034127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=VcAPPSh8jrVnNBCNY8MrjI3nUteQTXxFE9bwY5J8BeU5m/qpq0ATh/UvWsurdMYcoh
         bEmaA6BeXnEl5r4EDVJ/6sNo1qInj6pdSL9k/YF3r2kGe1Ku+/FCkU8XVVsM8XccJqBD
         +CZPfPmH12SrIEfXoUXci6ZEppypa749p8b8XHxli/qIaYvYRIEoZw7jcbT8ItN6OzWd
         TUx2CTB56/wL1Z0t455CEdN3/SOud7KCH3ZjBJok9MTMwzjzghId+6fnm2B92ugPa0Jm
         8ogZU8EkFxsNaVMad44KUXUMb/YSPXNlWGkyIMejgCQv3uV/+LUFZNJcKpQU2b6XaJt2
         rw8A==
X-Gm-Message-State: AOJu0YyKndWP8HDljv0oI3tJgj6F1RZdcghFlp5OOPVsrW6Z2/igvh53
	7LEi145ZTKroJeFxLyAdr3SH2SInf6PIq/yLrmq5FoDqudBoVqLxF0Sy
X-Gm-Gg: AR+sD11/iVrD1REqh967Lqlr4H4QHbZON8LwgmKd7PRqeCBUdWcKwMMqSFla1cXHrUV
	SJsSDKnyAdNkVOJH0PMEJb7WmaEhwus8h7GUA4Z9FH2cQCob1khCFYkRDmjuApA+OdMqkMjQhNL
	lXsaUZilv4cQTmq2m0Ht0l8hM3deRuyUGZacXLUJOmH/YPQ8y5c6akGjmRIMJZPGmYGO/NhNPuV
	MIPG0X/Yaq2LOjFSDVeQAkB0h93sHmnqktdA+iUoQJvfPrhZUOSovoReMIRG2c64Beljx/IE3WG
	GIS3WLnbYhaJcVHR9JCVRtwzI4Ll+qH6K56eJXut2zzHjjAXGFQxMxkIIqcJImBi+4J5cJpopy4
	VAyWr6fkJJp/f/uFTVk+HM3BtIH9d2IYW/C+gMFPwsjTJqHzuqHaFSRJjyKkWYfWV6jBhyr8UCv
	CK8HUkaquTfwFZjGHn+ug94gSA4neX4W5egoeQdBgIB/PPjVrdHtdNqmDTLwAR9FHgVGzBL7eT9
	opXO2wPw4HgDg==
X-Received: by 2002:a05:6000:250d:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fc81ed0efmr4793087f8f.4.1785429326919;
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Thu, 30 Jul 2026 09:34:11 -0700
Message-ID: <20260730163412.1145-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
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
2.53.0

