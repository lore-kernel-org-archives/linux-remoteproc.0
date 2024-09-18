Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2E13667E;
	Wed, 18 Sep 2024 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726673759; cv=none; b=AzKUHvzY/4KKwqQpyxRkpn1EYvQYuRjOILIXyfArvzauzHlw7MQCl+MqaVdBi2VJ+2wzeo2VI1/wcvQOVt++uTv4xYM4eMhUv1maoo5rSyskL9kiNF7y3Tz8Ks8QWx4xGuV3oc/6c2MEAv236s8aqPzGH2PbmRg7eSJzX4A6IhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726673759; c=relaxed/simple;
	bh=t6/c5gLj5Sr5S19QSIiY4LV1QuDRPt2TAIfzZnvEPL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHLhrQllxg2oz0/NIhsjm6dwEO35+llna4RsSrLrCYUzZTAFScxUYeBA3LGQ0ulKuy1pUGIeHA9+pl3my7LIclh8paXXbPgaJKGoChZq5f4H45ryga9YWpG26CkVrQRvFLTe3Pj/y6BvPFM4638fmuCn1GLj41Gv7Bkk9FIKvjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sb1eBrFg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb1eBrFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FDFC4CEC2;
	Wed, 18 Sep 2024 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726673759;
	bh=t6/c5gLj5Sr5S19QSIiY4LV1QuDRPt2TAIfzZnvEPL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb1eBrFgQG+VGo4qvB3wbm8AsE/+UXeCFh2UwONZyzvBE034FqXsJKUcm5oWvdAYc
	 OsPjknNg2Zq9regd9voTw8vbPTwI9/XIebsla9aKJVlE4B0t2q42T0C/CSWnk6Ktee
	 81fXj7YOLONzahwPJg7911QqFFd2NPRQFV2RJTs8LAVAbM+9zPEpoL5DxJ60aIrwiM
	 OedF3BhOGnapShKgYlav/hBKYLfdylDomJEhYg2LmZ9C55rCoNXNKOCcYQdRv4jkqc
	 SruDPZEsKKDkLqWnJxSr0r0rf8fWPlnz0mmTbxrlae18oHKsXrhnw6P3hVs18nbBjP
	 98vAHay3S0+1w==
Date: Wed, 18 Sep 2024 10:35:58 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	conor.dooley@microchip.com
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240918153558.GA1567736-robh@kernel.org>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
 <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
 <20240916-palpable-flock-7217424ed8db@spud>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916-palpable-flock-7217424ed8db@spud>

On Mon, Sep 16, 2024 at 05:31:36PM +0100, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 04:23:44PM -0500, Samuel Holland wrote:
> > Hi Valentina,
> > 
> > On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> > > Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> > > mailbox controller.
> > > 
> > > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > ---
> > >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
> > >  1 file changed, 115 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > new file mode 100644
> > > index 000000000000..dc2cbd5eb28f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > @@ -0,0 +1,115 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Microchip Inter-processor communication (IPC) mailbox controller
> > > +
> > > +maintainers:
> > > +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > +
> > > +description:
> > > +  The Microchip Inter-processor Communication (IPC) facilitates
> > > +  message passing between processors using an interrupt signaling
> > > +  mechanism.
> > > +  This SBI interface is compatible with the Mi-V Inter-hart
> > > +  Communication (IHC) IP.
> > > +  The microchip,sbi-ipc compatible string is inteded for use by software
> > > +  running in supervisor privileged mode (s-mode). The SoC-specific
> > > +  compatibles are inteded for use by the SBI implementation in machine
> > > +  mode (m-mode).
> > 
> > There is a lot of conditional logic in this binding for how small it is. Would
> > it make sense to split this into two separate bindings? For example, with the
> > current binding microchip,ihc-chan-disabled-mask is allowed for the SBI
> > interface, but doesn't look like it belongs there.
> 
> I dunno. Part of me says that because this is two compatibles for the
> same piece of hardware (the choice depending on which programming model
> you use) they should be documented together. The other part of me is of
> the opinion that they effectively describe different things, given one
> describes the hardware and the other describes a firmware interface that
> may have any sort of hardware backing it.
> 
> I suppose it's more of a problem for "us" (that being me/Rob/Krzysztof)
> than for Valentina, and how to handle firmware interfaces to hardware
> like this is one of the topics that's planned for Krzysztof's devicetree
> BoF session at LPC.

If how the client interacts with the device is fundamentally different, 
then I think different compatibles is fine.

Rob
