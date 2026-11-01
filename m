Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575630;
	b=hZbDjB7WrH6rANq8S8PVmv8hm6+x6931iBo+WYcr1DUY1PB4mNz82BJLp++L21eweLpe
	 AWcKOgRXMw2eqFxi4l43A0lT/C2Qfd07qfSS3R4MRbN0IZHb6IYcdDBqsXIBMy7kBv483
	 yk2Fc4RZNyLEfeOyyNH2FvFhejJjfAL4YGa90v2ZyjQWaGOtu6IcDlExP7SU+7LPvw0wd
	 GG/k/Y/WerPRain3HuaZuK4EYAjVSaTQiJ0b/dOrYcdbCDWHSpT5UNuYFWZH3Dx+rCZXy
	 lT3pX7pl+L9XxPK/h+KyFtjPLuLgMsmmICjXlyiez6MunoMxQE5PXLfuZH10cFN79wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575630;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=;
	b=vBHGgmTfeyZM1KZjRJyBmsAJlDKAfw5wDqTKAOgXMOTqQsl5tpEOI4EelDqgOUcPLE9m
	 F16XjH1TMCPwY9UmenHSXZ3Qg/Bc5KJ4kmbA3OJpkxJ85bNZV4vxZ/Yl9dE98DdB7+mQj
	 fNnA+6CZUI5nIQm7DQXj+iTs9NkpeJN9aeTnOLgM4Fbr2lXGGUMirxioB+JWXbFW9BBBH
	 vKARVCM9BVLYlJV6dV2kNR9jz399lBGCutX7vyrx2lNFvdz6E6Q+kdENXadMk1+XCsrlR
	 SYZfCodlIyF/D0h0yjNwIvbtUt4mmFkuFDoKLnc5YwctKmbDRq59mCGu9KjV3f5nfgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=GiBnYFIQ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=U3AlGv5f;
	arc=fail smtp.remote-ip=185.56.87.6
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90035606A32C;
	Sun,  1 Nov 2026 23:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90035606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=GiBnYFIQ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=U3AlGv5f
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575629;
	 b=Qy5yKdu/yx6FOLYZKbeiHcwR48VD1pda0uj/bCfsJrO6oiZjYJCHOq8P22EYT4QjKztCROPi5F
	  G6Mp4C9HQFYjDKDICUVZ+lOZlPq2W2r1iNj5ta3S0T6rAogm5Ax6XJ/JJsihOYO+nWhhzeLeCX
	  0UFXFe69ykmdOU3ljuJPYrq4zq4YNw8Ei1xMVOyveEzBYoCCb87Fu8du5ZIJMi/rnDsYc0N70m
	  WEoZ36+6utX+4E1abg8Dn/q+3HlOhxPezEIPaeAoSJXLUUrNWJxNz8pwEmMszOatr7XgqwSWr0
	  3pojy52MFtO8Si/cqocvGeGHmHzXLzyoU3ESbFa3Nza1Pw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575629;
	bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=eFgiqEd31hrvYeSTUC2ISfq+yGUFAFWQcprh0T8v+3snkVOVS/6nyAQ6EcddPA2+bxDzqa/vJ4
	  hGND+Nbij7+paCmEpFg7anYynXfAJI9znOCg4sYLBqRL4HqgSJMRmMVTiVCkZDXImelIWdcMdX
	  VrWEX+ta3fNW1wWo9GsZwQIkgvY7cik53kpOtRNfIUN9gTrE1RVjuopEaxzs0AoHYeQEvkn9U4
	  W4vdB/wWplzTkW5Mm4ZURnG8kjMLZY7/QFto86Hqr4oHVZHNktfou18IT2P/XrtKT3aFH1nYic
	  FrbrH4awvFqVUVmR+wDWQFsAKJXomlB7DBFydmkwuwbK9Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=GiBnYFIQ+Sq1oF6gDrHkdk+X7R
	uAJp3HQfRCWXC15l7atFzzd0J9960Qj2rN/EFIDbMGh9m373GC+ToEKI0wqHIFTqTryTyOGQxG4g8
	f+kIEyDjWsDbodqRmMueTXUX9GWt/f+vgNO3w55Zwyl73tyytDndBjRkBchRsw6dRw+c=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex3-00000005hsY-3Pfv;
	Sun, 01 Nov 2026 23:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=U3AlGv5f7jpjjD2BY3+3SenGka
	aZcHzGJUEB/6uzJVdIySOxtsqtBRQUnGiR5Nuqx1O8UMjJA+RIK4hW6ukmSPKT5rIWRcknLHZGBOk
	VX34+LAuIlqtV6PTMmuZglnARaX9HTV/ttzq5Fl9ijBzKsSNfNaCovfeVyIcBV9L3Z8Q=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewx-000000002I5-2bco;
	Sun, 01 Nov 2026 23:26:55 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:39 +0100
Subject: [PATCH RFC v2 02/11] remoteproc: virtio: replace commas with
 semicolons
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
Message-Id: <20261102-remoteproc_virtio_map-v2-2-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=francesco@valla.it;
 h=from:subject:message-id; bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05E6l1Z8uX6dx5LLHbO+76uzilnM7J/bBedM+ub
 VP3FlV+6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmcvgvw18pRW8uvYidOloB
 OcxSTsH+W2Y1Gi+/HqlWG6j+7fmW8lOMDD/62pZZmx9ccO1E/v/T23pr3P/V7ROLvvpMsHO2VLA
 JPzMA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3d2f0d38f54dada50814831fe96d0f8d
X-AntiAbuse: ID - 3d2f0d38f54dada50814831fe96d0f8d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex3-00000005hsY-3Pfv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

While not technically wrong, the comma at the end of an assignment
directive can lead to nasty bugs. Just replace the two occurrences with
semicolons.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index a86c9a949e4c..29a3a4c18097 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -443,8 +443,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->id.device	= id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device = id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 

-- 
2.56.0

