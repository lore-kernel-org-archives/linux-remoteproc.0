Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD72D063E;
	Wed, 10 Jun 2026 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077170; cv=none; b=Xmvp/WE5z8m5hiR+J6TxA8vudcwsyV7Oy7ll7yZ5fUxpY0KmrxjNJi6LP6FxO6+2zF61R9OZ9vxVlzz9rq5b+j9EW0U87QXLJ4TZenO8eEiRuZFYqcYcVD6qgP1BRFxHNaHJZ/f8PRpgFf+ZOqC25ToWrUzaYefQ1oOvhJtB62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077170; c=relaxed/simple;
	bh=UHh4kAwKMWiMrOtmQUAhWXpQL/uHaOELa989PLKrxWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siHwCsTY+1ENd5ZKi+dfprYnEyuqtu5hezWxb6eP2v9SIWVSHG87F0ocL7RH4zgMl56m2MU6iv0Yt89LmAqChkBM4uozjF0jAb0g2J+H7UHoJkf5PKmhi2VWQtQ/dfbNgjO4Tjv7WrUk8fpNWZrmmNV1ydkRrCSb6TAyAG5blFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn74MLRb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn74MLRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906191F00893;
	Wed, 10 Jun 2026 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077169;
	bh=FkWD23EcUZQ2Cyeh05Hbt+rL2iVJ4hm0EeKjVQhjWWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wn74MLRboT3MeAzGFBKlg+dPoTuRE5phWzuvQGqsBy8/z+BUc+xZHAlPvvLP1kjHz
	 7FDGuti1YRaOj651V4ia+GSH5vxGaUM6tIvY112szJnC2LnbcHyZQ3CUVDowYtLsLl
	 /Ng8Kt1w8m1G3RG7kS3oI1ryWUfsz9QSD78mgqaon07DFDqNT1fWq1yBGkQxTXKrc1
	 krpMFRZnFvPZ5XhSvQWCKLvos1XOp6YB65IKHkgLgtqECaHYLLqT9R8alcOIorMLl4
	 wFUj/2VsBeUQGvXxNy3Jpr6T1f4IAguYFNHJ7NYW4vrfuoYBwyaNVC4jPrxhoU4zj/
	 o8YrQX0ySMKfw==
Date: Wed, 10 Jun 2026 09:39:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Frank Li <Frank.li@oss.nxp.com>, 
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260610-accomplished-antique-mink-cf0ead@quoll>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
 <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>

On Tue, Jun 09, 2026 at 11:33:03AM -0600, Mathieu Poirier wrote:
> On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > >
> > > > The names of the carveout regions are derived using the names of the
> > > > reserved memory devicetree nodes, which are referenced using the
> > > > "memory-region" property. This adds a restriction on the names of said
> > > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > > specification's recommendation, which states that the devicetree node
> > > > names should be generic.
> > >
> > > I don't see what is so restrictive in using the node name of the reserved-memory
> > > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > > will you gain with this new "memory-region-names" that can't be done with the
> > > current solution?
> >
> > DT Binding check can't find such wrong if node name is not what expected.
> > Binding can't restrict memory's node name because there ware not specific
> > compatible string for it.
> >
> 
> But what "wrong" could that be, and what kind of restriction are you
> hoping to enforce?  What specific problem are you hoping to solve?
> 
> I'll wait to see what the DT people think about this - I personally
> don't see the value in it.

I see no point in this commit, but maybe because the commit msg is just
misleading. It mixes node names with names for phandles which are two
separate things.

Plus this change actually makes nothing - no names are restricted to any
meaningful values!

Best regards,
Krzysztof

