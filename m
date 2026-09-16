Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85381494835;
	Wed, 16 Sep 2026 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595361; cv=pass; b=afv3w8CGGF0VUGs9reTGRPgVcdpGZcGJo/7lVnlR7bPwTOfMhd0EUc3MvSjlmxgaxfQKJbai/PSg+8ygDJ+42FbmM2Z2HdMFdWn4/7R5X/TRljVJCrbBbx4pCGyaCUXhe9AeOae1dxYOxNJYKgssRgFQL51FQ9wIKmOaLQeFdE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595361; c=relaxed/simple;
	bh=SArq2+UwtiAN8KF2iej4IW97HFnrOvv94ZfX1GMeV2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpBTOR1EbnqrwgYrpR2BElgCtR2tX9j27JMiCiWuLGtfqFS4m0qlc83TTiX/wBtTwMSQhmWXIYE2zfSBeyMsEiNzNiaWMGrpDc0Jw+x3Zo1avlsazAbfFQTac4sSIXiNfScvQeUUTMErZCmymnaaR6+4am+6D8ofcomHEX5YK/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=FtW+62q/; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=akkfbjnQ; arc=pass smtp.client-ip=185.56.87.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="FtW+62q/";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="akkfbjnQ"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789595358;
	 b=4qPrUuBZOHBy1+0H704Tk75qpSSNygqYWbv1cHjwpF3oCtS45HVaPDMuis8RdIvYt+ee3gw1P/
	  3AO7jGnySz5fxnnA6Abm9gXF9YgkxYlvQE9pnEj8AnjIQ/g60zz4I77MnY3PE2mPMV2zuAjmu5
	  vVeANLbKNy9az2YgolSghr6SACrwMNBU0ME6nASAJpsyDfN8oIGAejon/tDHF4le6qpBzOQnen
	  LBCe5ft1Iie6/1nBhkmMhTPBhVf9m2rROF74MCnjyyQvVkP5KVBow9UD9VNTbQ6OAfsDuQAn0O
	  jE7/JzEfY1ja1UblClvfEEOvCgPyvkLxm9PZ9YnhrUk9ww==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789595358;
	bh=SArq2+UwtiAN8KF2iej4IW97HFnrOvv94ZfX1GMeV2c=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=SGqwUWTeaXXS61b6eto7qlXVhhSFH1lSPpItnEi9rcjQD/aQL/3/Ay23WVKHKkcKKDGAPMN1Nk
	  J2/2HioGhw4DZkKn9Fds9LVpsmcW7/EXLPXPgsomiPEkmBqCLWFPq2n6TIY75l2rCy52Cou6So
	  Tiag41Ap/bhx/D5Wm4erhWT32Pc0d0qqZknr3UBWzhNBlmZKXLS//FsElcOmRjoBpNo7B4z0Pu
	  /ymJlKtW67j/cIHIZYsMmGX/Z0cvQn+MwEXOflksppfoZ+qkM0zJd/k/Kod45baAYCx0SreQ4C
	  MbGTidZhj+H144L4uleSCgWsnO5J/MjHsIIbSWgtcmVJEQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=/1xXAR7sHjfiShKLvtMcClqJDZUo+C9C2NEO/Y0JRUM=; b=FtW+62q/B07MpuKFw3cIUWNIZh
	ERM5Bat0OPR9wxXUcUGw3R0dGsgPWOezfexrnyBceyYbMh6E7NqqNqpY3lpLKld9FjhjVbQCJSo19
	4LvOUp/BbeTapAN84RFpyZxXgCnEI6xjOXWGjRKkv3EOTyhtcMtOxUvQBPRsls7eq+1Q=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6xV9-00000002cjz-1kKn;
	Wed, 16 Sep 2026 21:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=/1xXAR7sHjfiShKLvtMcClqJDZUo+C9C2NEO/Y0JRUM=; b=akkfbjnQKAX39GctHP0syTEnII
	DLYHpi+xCRoGyRpbvM7sB13vwPQrXehzIp2YtpSBCHtIOIu+7xVLEfyYX80mTiU+GUeDYw7PabRsr
	KtMW8JOZbi4InQ9KtQj//etRtThJILkS16sOkj3jS8Sia8fkYxykfu5iqGFUs7yjKpp4=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuS-0000000058P-3B0Q;
	Wed, 16 Sep 2026 21:11:16 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:56 +0200
Subject: [PATCH RFC 11/12] dt-bindings: remoteproc: imx-rproc: support
 virtio
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-11-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=francesco@valla.it;
 h=from:subject:message-id; bh=SArq2+UwtiAN8KF2iej4IW97HFnrOvv94ZfX1GMeV2c=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ/MSVkl8zrTvFOW0TZozZQTHX5Tr3Okt99Tdb57f
 s0JnZ2fO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJxC9hZFigZPTpgLCvUXRH
 WHH7rYUSvwtd5q7ZWCf876rHPkMdPjFGht13JldxuRXvP3L6YLFt1pQvnkZZRUwBkqFH/v9mejv
 RgQkA
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
X-SGantispam-id: 3d122d4309c718f4dc86ed172affefd7
X-AntiAbuse: ID - 3d122d4309c718f4dc86ed172affefd7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6xV9-00000002cjz-1kKn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add support for virtio devices description.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..32fc415c7028 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -92,6 +92,7 @@ required:
   - compatible
 
 allOf:
+  - $ref: remoteproc-virtio.yaml#
   - if:
       properties:
         compatible:
@@ -118,7 +119,7 @@ allOf:
       properties:
         power-domains: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.55.0

