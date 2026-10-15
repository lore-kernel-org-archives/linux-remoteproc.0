Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140447B406;
	Thu, 15 Oct 2026 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094938; cv=none; b=cpinZ7UHvt9WjtIT0x3g/qHWRZy3gRt4jizcisuYgL3rOYUEzjoYInDuOCCtatlWNvlqBXYtmwqLyo0oXTqMqURBD/Apl1WrBx1Lhj2eu2LRmAxtMjfAmjP+va+OruokwvpjFwJluT+VZ1uGs5k+UUvsckub/OQ2XCT92kGhWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094938; c=relaxed/simple;
	bh=dwE/67uaybHNglH4LBSAcOL/EhJ5N0UM+zdkc5ca0HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrTAa+R9GLx3ib2BbrrXLrHuThDKem7jQut9gh6Uk6vgaI7T2BdnBHtdVw81vF0D3QMJZ8yAwSyM2GI/jVYT8nI+ZvTUfJ6tsQ8r94lPbsItpK4DwQfZQ8R376CWSntO2hTBwsTq4Q2KzmH79shb0TXPMCEWNIE2f64TgHktAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le80fort; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le80fort"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EDA1F000C4;
	Thu, 15 Oct 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094935;
	bh=MyqUgRNC8TTLXJOkDSkT/WyzPSUxfkFlEDCnXzm6lfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=le80fortspeqftGamzmiSMSuo0PkgBlXQzfv60zEfh5BTVudPeOsoL34qGK/Awi5z
	 8PHxOyyOd0lE5OmXoYU4Tlbw7jVEtrfhcspbHmyyJoItMbutaypYv/XpgzGX2/YYRI
	 bC3n//oLHsMBfiXwIkpGAknmWg7wUVL0Q9kwRf3liVQp0pf9NfYO47BXOm2DTwBnM2
	 0OWxO3s8kmGAYfZdyC/kJg/cMmqXnvpVix7knIVBZ8DZyXCXb7YbeDjXzqALnOy2kD
	 E4oBnTfqgMXOPsBbNhfJeZh5jHcFupu74hX7KhxC6AzUcRRHKfkgOK4boLwLXGRNUa
	 NgXrjyGJzMHnw==
Date: Thu, 15 Oct 2026 15:08:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Message-ID: <179209493314.2837720.2349962210068858296.robh@kernel.org>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>


On Thu, 15 Oct 2026 10:39:22 -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional memory-region-names property.
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Add memory-region-names to explicitly identify the expected memory regions
> and avoid relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Use optional property to keep back compatible with old platform.
> New platform should use memory-region-names.
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

