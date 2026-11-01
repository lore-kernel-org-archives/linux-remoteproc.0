Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793576289;
	b=KZ6T0gaV1U+ZJtktycNlie8ntn5yO2eQ+LT0eXdj1BGap3CStsiFeXJzs92fs22TzBvo
	 tLxetBW6mQ36BTST5LbYyhiyJrkcvkWz1wlZhHOSLxZrdcaOWyIlH2U2vIDjotnTWLMho
	 np5tmqQuePviPn8xtk/1HSuzSM8HD/YxC90u9co+LLwIm4LmJMwsALTNelWknf1GlZlzm
	 ajR74q229MB///YyMfuAtSDqt0MKGox8oNX4tNXHPUpcBANTwL4RlFYA1J2g03dxUDwVy
	 raFJtFIRTuZFWiCAo9IZ4vSIaDfm9CM2QcZhbzes4SDxhi9iAvz9o7CCzyWS5ZrUkZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576289;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=;
	b=RdpNNGWaFKNGqtxocrU6LYONApFb7B3lwBjIJFA1RfTNWMDcK69jx8Ha/qGsW5Bz17yp
	 noTdAlIcH7W6e5fUTo6d3nMRjcf5rPrR7fxl3JR/SzJVtCEgDSse/hWGQmRmC+8Q0XhzP
	 OFVbEuayYhZVtydBtRqXnz/Y5kEiLH43nQTB0OHXPTAM1aZWsrSSnJK6EnW1MDVwdV9pK
	 faK26ysnfXAWyRGPI7jD28vG3JqLpBHxxbn/1LiFpkJfOG5ILLcMbxLukRhoOvdm7OcPp
	 iLXKvv9SM1isCKbBWQNZALSEnrirvaBsvyUQN/o2bLVRCp28izrZK9E2CGNVM2y+eHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=ieTSstGx;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=LZBK1gbk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.9
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E02606A324;
	Sun,  1 Nov 2026 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=ieTSstGx;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=LZBK1gbk
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793576288;
	 b=j/g2IXZwtyaxeu03qRRevOmI0tE2oiQORih5pyWJUG5KrFMbnUUqPlCUjfADsEZX4IUK9MxTvi
	  ZYSV2VKVLp22GgAtwiDbC2tiyBX28blGnVfWJMrbnvGhkLLhX1NA9o5WkEaaTaSFgHJGO/2rTZ
	  l8CA4jstdmQxEPpVzLugq67pTEsOuXnChZG/qyHwxiW1D2fLPT3NQj6P5xJxjtZxhzk2JSQcfk
	  GEwZPpOk4v3KDlA+65Mbt1dXtrqD/F/YZvD9tX5O1cC8Jp3adl8k/DMdqUOc7qN7GKIk88+MZf
	  POwVRKdEcZlJQRINRMmf5eNzP8C1I4Rc2+/pv6ae6wEUlA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793576288;
	bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=KPpFGy2XJg/Sm2MiW12YPRTv5xd5iepDgzXhD7xJhtmVljAbhqBOZ1T+IyW7bUbLdgCSmMDdXc
	  7pdqX22OP1PeTYxaEvT6mD+9A3BUAISb4/p0SbzqAgTmcbVcJZqfBMjwzwl0CmMtyeeMaRKSAv
	  1tctRRUHQDPgWvWI0t/FOAP5hXPByQpoRvbCbk4UUvvyE48rsAYsnDLuW/7cDPpoaF/nqOCCCa
	  TvwgdcOxS6jAAjZjmI7qoPDgidwxgscwCdXZiYDx9KxEC1WHVMG+XQCG5/RwCBGuQopZswSOC8
	  RBABvNFiNkUXPI11a5/5WXKTqzXkMwp3bjvwHAjoPLOLPA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=ieTSstGx270Rjdfx8adl2/fiYg
	ViRRoId6GXz6qQ82HT3FBGN9L1YinhnZCV9uds0GmzbY8BtQOZ6PYyF5WkY+aq3vUjXjucmods30+
	3WQMuXXGV5hYqc4ecqCWE0tk5wRNNsHCYkM4fFXhP92v2EIq0NA9llKrdUPi+605uoEU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNf7m-00000007F7S-09RP;
	Sun, 01 Nov 2026 23:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=LZBK1gbkx1xKTU/yLEhk5AVcnx
	JZp/8TE38n9SCpNZy5oVP2C/OiqiXBfEDSVt5YspvCObs2UGDB+jWgKCJAjahy2HAXkBjUZ7k/zgJ
	TLP2Obf1xFhWwLUVaEwozxyl/n4PUdueBSTZkR3VYVMh6vmraNDp1+HZ22ZTy+1wkwdg=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex4-000000002I5-1jEm;
	Sun, 01 Nov 2026 23:27:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:47 +0100
Subject: [PATCH RFC v2 10/11] dt-bindings: remoteproc: imx-rproc: support
 virtio
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
Message-Id: <20261102-remoteproc_virtio_map-v2-10-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=francesco@valla.it;
 h=from:subject:message-id; bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+35GL1ZfeoOluP6+64JCXXfWsylzcvLXc/97ab0v
 MsHOnds7ChlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmMn83I8Mc09lCMadyH+XN
 WrZeT3teRIfIkeehx+8H9+2aGLtJ9kIww/+6G/cMToYLN8Y4vg5M1lf+v8eYw2kiy6yQK8tn8O3
 2V+EGAA==
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
X-SGantispam-id: fd2c21fdc2a8d7b25c9b082e16c0de12
X-AntiAbuse: ID - fd2c21fdc2a8d7b25c9b082e16c0de12
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNf7m-00000007F7S-09RP-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add support for virtio devices description for i.MX remoteproc devices.

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
2.56.0

