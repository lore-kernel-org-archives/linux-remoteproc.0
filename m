Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F373EE1FA;
	Wed, 10 Jun 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086971; cv=none; b=CzACyevAKcT3emZXDaQniYK9ja0yapqn6pBdRZrDM90auaiusYzQ0v8UVlNujgUe55GqyHGlF1QYfYWvBRoaGfjRwfVX/zrfm76xGw4Mxoey75EX1D4w15b6L88kVAkrOfp/rF+WQ/qKoG7OYlt9EW6bxqcH+RjmrFSpVzZ+VGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086971; c=relaxed/simple;
	bh=V3GPjC4xDWSVt2U5uFb+5QSWnJTT5bcQBuFIafHxkCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa5ag8Qsgj1oduZsfEoG6H0wV7mM7AXwyrnG4dogDD5QgvYLgJxwJAFyA9yIoWT8+YtuZWjgAmAMpICWVTPHJYA3QZdTkcuBR9vXEx+1b3FjqfCSi9p/MsWJStgJkjvky/T4EK0mYFPj7gb6vBuJfE7T7YkhEyEbYu7XlievjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=pC8mYV7X; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="pC8mYV7X"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9D78522715;
	Wed, 10 Jun 2026 12:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781086964;
	bh=L6bxtzQsXU5V2ZLqW/tYugnU81O7/hqnwZwvA1uMdL8=;
	h=Received:From:To:Subject;
	b=pC8mYV7Xz1TRYqsof6BGWIwTZf7J6GAzFKMNJBiXoNGclnIzszxJMfPsQ4lVyEWlp
	 id8MqVeYdb09FIworIJ+W+/Aqa8ttaP4qtih5Tu15BX3wTxoLrlh3qhQYMpID2lfaW
	 3bU8F0kg2Wetv3NlsovGSYAVGOfxlksDwSvweQ8K1EORX5undFEnvo5HA43fcZA2WD
	 g1zIwMfeW57yfstKt99jOXwQ5/j9SItqXODr80EFXHiSLekrerHOwYY2W51DPQHpPF
	 /touJX3xeB6F20k2DaDBufw4DkU8LQHwXj2BsdBXZ0KFXanZRKBy703fDUwSrFrFym
	 aLbhV50d4xpqA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 540DA7FD97; Wed, 10 Jun 2026 12:22:44 +0200 (CEST)
Date: Wed, 10 Jun 2026 12:22:44 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>

On Wed, Jun 10, 2026 at 02:10:37AM -0700, Laurentiu Mihalcea wrote:
> 
> 
> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> The names of the carveout regions are derived using the names of the
> >> reserved memory devicetree nodes, which are referenced using the
> >> "memory-region" property. This adds a restriction on the names of said
> >> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> >> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> >> specification's recommendation, which states that the devicetree node
> >> names should be generic.
> > 
> > No, it does not. Names like rsc-table feels exactly like DT spec is
> > asking - for a name matching purpose. Are you sure you read the spec?
> 
> Quoting from the spec:
> 
> "The name of a node should be somewhat generic, reflecting the function of the
> device and not its precise programming model"
> 
> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
> wouldn't "memory" be a more appropriate choice for the DT node name instead of
> "rsc-table" since it's more generic, while still matching the purpose
> of the device? Or perhaps I'm interpreting this the wrong way?

Please see
https://lore.kernel.org/all/CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com/

Francesco

