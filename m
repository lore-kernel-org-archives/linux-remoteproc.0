Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A742DCC1F;
	Wed, 10 Jun 2026 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077083; cv=none; b=sGakyOalGn6ktk1jS1UnAbIYunIgii74SNFtrHOuUafHRCXccA4lu91wMYa+mymL1i29wb21ze3OHEcGURGeKxh1zA+MjtF6u5NdQ+RdBHEXieaXWXH826HyM91NOP2Q145oXXO9SlPBMB9gXg5I+cVi4ScC+QrTeCB5jdchIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077083; c=relaxed/simple;
	bh=K2VDpKCIFs1838nBciT+Skwxqwab6E906/rTCAvSPXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZ2dzQNKlNMnZktWzd4B4f4wUnussN3htwptOxoXE3eZExBKtL5g5eh/jOyqRFrw18W20XDZ+7kz8rf67tXIM245+vj2g4B2PMjhktx0VkkrhohOO8wEELJbDp+pQeoTMP3f0hAeVn7nhR5lipubcBVw5RvS8ey6ywmEfrPgyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLfu2WYV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLfu2WYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F07E1F00898;
	Wed, 10 Jun 2026 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077082;
	bh=P7CRDgQRCgbswaPyjvGXosFvqSn1cQaZz3l28dfD8pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aLfu2WYV9r7arf9MLaBIu2ytvYUSx9dTUD0tgLBGlvbQFBSLSkMkr+9GF41qVul09
	 7s2nk+Kiaf8Dm8YOGAWSOw2ttxjDChRHf1DtTPjZZPvVUOrLWseonB8S96DH+Et7Dj
	 3b2P9FZcn5p+YBliCxcwujDZ+zFO0UNigzY62VglAYWOkWZfzoo1jqJd4QNrhL7Kyh
	 c8RnsDAtYB1xfIjKdo+s56AqsgXJVwWgcOcnQo2DAHdGCAQjlg0HXlbISMWaD6CfDZ
	 sVfadXSbyBBUXt34cnjfIJYaAfK99SlRv863wfBOHvYbCURqP3vNFhpBuPRWpo45u+
	 iTz3pxu3dkziw==
Date: Wed, 10 Jun 2026 09:37:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>

On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The names of the carveout regions are derived using the names of the
> reserved memory devicetree nodes, which are referenced using the
> "memory-region" property. This adds a restriction on the names of said
> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> specification's recommendation, which states that the devicetree node
> names should be generic.

No, it does not. Names like rsc-table feels exactly like DT spec is
asking - for a name matching purpose. Are you sure you read the spec?

> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the carveout names can use the values
> passed via "memory-region-names", while keeping the devicetree node
> names of the reserved memory regions generic.

I don't see how anything here is fixed. memory-region-names has nothing
to do with node names.

Best regards,
Krzysztof

