Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E01B4153;
	Wed, 19 Mar 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394326; cv=none; b=p74ioIemsSkSvFYh159AzM22IvjdIUj1qFzIi+JMYqBDT8B2TJKIfbuU/S2ktyRDF8EF4cojjhn5r7+RSXxFfYDbpHYHsBQVFyIxGkOG+mN6Ubop8rpHO/OwlbO0E7pu4YfhHNMHsiGebFEgxruxKkxZR987VrOGhyLHRSX8Dtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394326; c=relaxed/simple;
	bh=dFq9WrBtYmONyZNM0GrXKYpn3Y8FJf3WJUh0aWFuRDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VchTavwn9qnr6D2MerBcJYm56wIPjpSgjApXWjMu3IxIDKkZxCtDlHuGXEqpSwjIfJHhm5UO2SsMqueKHm0d0rpiah7mtljHPB1CgDsRZvAeJ2PmQLnp8jpx2RdpaKUoA49ExWxFzDl5B9vwV7wkuwQKhkMl6RGMdePWFf1Gyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XEaBF0Zw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XEaBF0Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742394322;
	bh=dFq9WrBtYmONyZNM0GrXKYpn3Y8FJf3WJUh0aWFuRDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEaBF0Zw5wjvy+eBCil3EcYkJF2wSPeFtX1kPSWyGjhnxBDElCHihextQz/qmFjc8
	 /wrYmrpDXW58niMFnfxdg7iyC0fd7TagGcq2Phgp3JcGgh3wamxXZ+hMxCxYpiI3ys
	 /j4rEt17Bsf4qH5OHPs2xpAZKlkZgeed5yib6nF/Mb77Y8FT4XS83pgviijv+i2MId
	 TGT7GNwykxbXkQUDzRk6yfu9PB+7+DYlBuX5EJIEMhApA0zQin2wtfDnE/jS40scjd
	 03WgDdnp1pqnqi/QMUGcMRm6BEYDQsi5r3TJCYp5u0ve8/Hl08Ja8ULWMPavOR3kvI
	 GQy1jOiW5CnmQ==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4313B17E0599;
	Wed, 19 Mar 2025 15:25:20 +0100 (CET)
Date: Wed, 19 Mar 2025 11:25:18 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
Message-ID: <7ab084b8-e77a-4881-a6a6-057b89613fb4@notapiano>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
 <3fa1573d-e3b4-434c-867d-38fa69ad3a8e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fa1573d-e3b4-434c-867d-38fa69ad3a8e@linaro.org>

On Wed, Mar 19, 2025 at 08:16:37AM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2025 23:22, Nícolas F. R. A. Prado wrote:
> > Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> > in reg, and therefore reg's minItems should be 3, as is already implicit
> > by reg-names. Override minItems to 3 for MT8192 and MT8195.
> 
> I think that was the original intention already, because reg-names are
> expecting min 3 items. Basically you just correct the missing lower
> constraint.

Yes, exactly, that's what I meant by "is already implicit by reg-names".

> 
> > 
> > Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -185,6 +185,7 @@ allOf:
> >      then:
> >        properties:
> >          reg:
> > +          minItems: 3
> >            maxItems: 3
> 
> maxItems can be dropped.

Sure, I can send a patch for that in the next version.

Thanks,
Nícolas
