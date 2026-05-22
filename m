Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C03D88F0
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448844; cv=none; b=b0YW2qZaBRqnQA5SI5OxPTwERYrR+gUhOmZmG4Nc/kXxZ1iY2Dzs+Z2Ugxfbk9S82kpiHGmZP72Jl2zOClqUiTaXFIY+zXkhWnt4FjamI4Sxs5a/3iwJc5mIFO3OLo8JTZIPyylRxWp1YxYvOf06guNph9fNG4m3w8tWbEobpQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448844; c=relaxed/simple;
	bh=0Pw7565oM9nQ9BpHuXyhwCjYRS5Et2891IAzzti/3GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDzeoT252C/RQi1QFgfe3HTrSvwglnYcP3C+70M1QOC2IHlRAqYNXhu1NO7xP/cJ4HeHnUb5E2qW1TbrUB56SRokzQZQRWm9w4jauxSzi1uuKXPY2SjNaSW/gqSv61DgFTwEccD/OKZJsNcd0hYUNAiARMz3yN5U7l1vk6eIZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KF7xP8Aa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KF7xP8Aa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so6542725e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448840; x=1780053640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=KF7xP8AanoP7v0OuYjtkuU3m8KY5FLqvaIJa1Pwt//S6cIxMaOzwpbK4H+Bv/EmySX
         q5yAOMheAcXxdQeCQzJoa46hSXjH0fXF0pU+AcHoZ4hlAaaeJNU1Yf7GGdq4V95D++l+
         Zl3LFdaCRM8j4C+8ABn8qcRh5570bdfG3qF4q8+lP/XZTvkWbVrIa+5MrXaHUtgAIg61
         uVEky11Ad7Mkh2rWVZomv5ZvSXgdMQ/SpM1FSZ3N6t0IpCr4a4jjgJftuea8m3OwKhSK
         /77usTcfWskwxYVyHhFcZV1ojgYmkflY4dGCd03Txs1DU8DYxN0iWd2vVOBc/usrxQZY
         bPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448840; x=1780053640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=cqjPg+mY2wFFx1w7XWkTMXEwxxPvEjdgoDSNmH1gW2KPpvrNpP8IQVrBpAt4gYvwMo
         VfrVBZ8WUT3BJ+hFpRRUPJa6VwsZYvuyEX8ug3kMMB+BRbukjIa62thcLOomVbg/wiyO
         6zJPJ8dtpbBVzoqzR57/mIgKC6sKndtIYDMPEazv4mAfigPN21NmgBlS9zurxKRLH++o
         ThFf47Cyqk7EXKEGe5ZezQGCGTzzvKn61IlCUCvcKUcMdTY5wTz1ZnubCOn88bdlUKnH
         kxD0gKIickbdMSSIYgJ1E1N6NwHBnhywIM6Ruyp9yUZ04kDyA+yUe1GIsE7RRdupFHy8
         w0tg==
X-Forwarded-Encrypted: i=1; AFNElJ+YsQaZDWPHdRqe2bed8Z2T1tA2MpxkM6/Fsi5M0Zqe4o/UjZifcUfI30+p2ABPrCT1lRvwNjS34r3VB8OFsw+0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCOgZBg6EqnB31wGPV27Se4nP05kDEFuv5lC621RSNCOe4fT5G
	xI5DMgt2wuybdz/hdvOMew4wembXiSAfADl7DgaPl4OBBlM6a057Ab8P
X-Gm-Gg: Acq92OFpQOvQB9LEB0N0dA/7izuo8/R321LjeWM7SACZRDsbk0MiMkfzgWJcjbdEr66
	nT3jtvzXEdeGISa8ZUQY/G1oo99RD5da4dDiK1ejATAORvvUfm0xCL13tbCLlYgPy/0Fxg+bhSL
	rDfXnDIFf0QXJ0b2jQQohZsUaIHitpRVQ8c+UFhljP5twIpSgMseHoo4pa2ZJu3MEwKk/vzbl5D
	v9Sla2OxsCg4MtJ7XQdbNpS1VrMtw4psy7sgeBCYE9+k20e20uBtM0HccglgK1Ho/3ZwgFinnR+
	U81yEVYwSdd6+PkDX1WwSl581Fb8RiQ5b2Nd6Gud6PRm/fB/AUyiQsWaZxPtbAY/Rfd9cX0RJcx
	Lb8DHi9u1rDwHBWPVVecHS196r0FDNd5F5OYfffyC6gRuaRqkJ5F7xCWKFf8PFuD5u7Q4PiZyWm
	fJ/83f+wTt6LpnpD8BOnIOzgBHFZygB6UHlmd6glABjB2P7PdJeAGBS7JfAmLuledB8HoGzbQ=
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr33176065e9.24.1779448840049;
        Fri, 22 May 2026 04:20:40 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:39 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
Date: Fri, 22 May 2026 04:18:48 -0700
Message-ID: <20260522111849.783-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove the reserved memory regions that are common to the MX95-19x19-EVK,
MX95-15x15-FRDM, and MX95-15x15-EVK platforms and are used for remoteproc.
At the moment, these regions are not used for anything and can be included
in an RPMSG-specific DTS.

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

