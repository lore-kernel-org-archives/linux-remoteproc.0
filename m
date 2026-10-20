Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792476813;
	b=rx6ab9Z58XCFinZrWxR7c6RamWXe3SMibz5eYODdRXJ1OG62qbk9XIk3Ug9SJvcl4wwd
	 Qw8Ofl88W5dKwGgzevUC0mtdLO3BeSkkCwIVuflMLNtVAsjVsfK4DG25AwddCymkCMjGM
	 lbOOAjV/oFpGbBarga6S86nLrf/c4JJv/KiD7dqkzA1KAYI7i/E5ehATXBMYrJKAKIB+l
	 TeKJHU7Tl9tfIBBE/WE93IxSmMrcGAsmHvPTZ/8a1HV9Y/9D7gRwGuEznYw8Lu8yCmoXh
	 8XAitmsJA7poUxm9BstSfQ2IxmxH+qm7+tFIR2LRc7IoiB+ycV+uqcEwFZvLLORkdhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476813;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=;
	b=UGZ65aWQkqIHFFSsYkN4wHwzT+Iivplj9qI8v/u4lWAc7Q06QfihaDYkXqZddpToOFJi
	 FIn9wWdeFTbNR1I13FSrK7V5iznlsbDXLLZl7hPCKipGY4e2XtVNHUxPQwUb1dWnw7uj5
	 g2u+WkPyG95fE2Qa1ygFRw9yOZeRl5sDCSE7JTCi2GI3YAmx79ywSpDQyWtYwrBOABvvQ
	 /G4epc+yjvWpqRaqc+jbjpU/8lbYieQFmZuK2pB661fxzcsKRgnxm/SKR00EpRY8JlQcl
	 MqwyKCHGMQASkyKlxIhXhklTHzxX2NF7X9GM4fcFiTHby7DLtOUhKWIz+RKcxxOOnmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="I//iSo+7";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Lu1GRVPG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.4
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194E606A319;
	Tue, 20 Oct 2026 06:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F194E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=I//iSo+7;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Lu1GRVPG
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1792476811;
	 b=obnYuzMmbFzcfr2Yf13uEN2hIOnKk+6xJO8p7qzDg/hdumU5m25zT7/A3jln2AmUZi/sj+vs+P
	  ucWc+UK1UQwpXcx9i8tPWr2dpWzMWPB6gNmAEKDjeAf6keMmHAPkAMkmROP8lxhARS9arrX+vH
	  QosqnWBH9yG/zB/cEBUhnkN53wVxFtPNU9/AVO+QPP2HwiSa2MQi/fj8JF+Cyhw+d+D6PvT+et
	  EoeACWlHgTwQ+M6rl5YoxvpKQXZFhvpjmKPrK98jzsHj49mS3VyhecrW+qM27b3D8wHHm+Pqt9
	  DJ/gpsYqw5MjWRnitFjEI7a98H460IJJPI3dKva11Uhklg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1792476811;
	bh=BLyVi9noksr977RBj4Cms4tPuxnqjRaYZqn2pFov1I8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=XtBYdTjhkMkhVjaUeh+6iT2zb2/2SBN1Ho0NOfPSLEbNpJ81Eqydv79GWFeP5DleXcbbwcPnWx
	  /ccEV/kiORGwfrXAIomnpUhPC6TSpKs/rH9sRGDO4GplmnqWclRh5EiEnBopOIGtWRi9OmiKwU
	  N7mSaUTDfakw0ZgduzklUdhx85v+JlxwZC0a8f3Z74/2ukFgN2tQ1ePud8eNGIHHBS3v6leC6c
	  wHwffAnKIYuH/vHfWIRTzEWxk5aBHrBDD9T2NAJh4z/GTAFJdySCDjqd+YyJjEk33Dt84S60SJ
	  kQtGP2NEjK5icU0mjXbbp0ZvmDCFujLi75z3Z54B/iODLA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=I//iSo+7TD66i2BdewK5yU6xhQ
	1XltXlNeBS1UwEYyWdc4US23l6sDr1lNbzr9smpi6LZnNfLf2z18EnO7QesfWw99twSGBFwHs1IqS
	ShcLLIipyjbZ88+3aZpP0nCnTKflJsLLW2azEuotw6PFmxHlX29RUH5M4dUJw5ffY66Y=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c54f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ36A-00000005kW2-3wbo;
	Tue, 20 Oct 2026 06:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=Lu1GRVPGNdmlqmsYH5zsLHzoUD
	w9j7LpHN9aAToa+3AdoDIDlTFJZuelB/VAauhlvvjFMElg6G+qCBXQO/Zf3+sPVC9QqpJ7g85SQWQ
	4xkAWIvKObsXe0uveYUhD1ZKj7JBvyjSPOIkiRw1J3crjBYNmE99zI+w5opamT2rKI3g=;
Received: from [82.89.62.246] (port=60683 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ360-00000000CBU-2RNP;
	Tue, 20 Oct 2026 06:13:12 +0000
Date: Tue, 20 Oct 2026 08:13:10 +0200
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atcF6uQh0LE1UzNG@bywater>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
 <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 70cb3b80dc2a3e4722b7395af5bc37d8
X-AntiAbuse: ID - 70cb3b80dc2a3e4722b7395af5bc37d8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xJ36A-00000005kW2-3wbo-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Laurentiu,

On Mon, Oct 19, 2026 at 02:55:49PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..714c3615d1884 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -28,6 +28,25 @@
>  #include "imx_rproc.h"
>  #include "remoteproc_internal.h"
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

The position of this code here seems wrong - please move it down in this
same file, near the other functions.

With that fixed:

  Reviewed-by: Francesco Valla <francesco@valla.it>

>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
>  #define IMX7D_SW_M4P_RST		BIT(2)
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
>

Thank you!

Regards,
Francesco

