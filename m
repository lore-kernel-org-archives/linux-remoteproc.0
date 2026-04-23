Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982723EAB0;
	Thu, 23 Apr 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935363; cv=none; b=fBPUr7znI3dT4JmRe0xiSjJF/Q6vcEWRMsybPILHQBr0mt63BH6Uphv1prq97V/XAyPKf85ML4C3iIDtdjUEIDJ+2z6ZqVdyL6cG/jEWzz7vVEjq4wh+poY8bXltoOhc1eXadlrXdCShwN6IedmPcUPlU57hx46xuDTZYGB0l+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935363; c=relaxed/simple;
	bh=xSWjk1676Q7PCysPeHLGeMmNMeG0xoGyvTSMFNz3Dmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuZ3U+Us4MoJcTvHYf8UWPuqAlUUedhYXnHZ2POe0Bgi9xFrPBNbDLWm9ZuJWei3forKGu49va9weSlxk6FxAIxc68UDcHzWD0gdvbvq8hMkmIjxWgvKxEvhck9W5BCuf1uiNyZQ0cmIciH9HzU3k9Pn0LEHaki/WQz4HaBP/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KldxjNFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KldxjNFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C3EC2BCAF;
	Thu, 23 Apr 2026 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935363;
	bh=xSWjk1676Q7PCysPeHLGeMmNMeG0xoGyvTSMFNz3Dmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KldxjNFHOgQbD0Bp2CLICe0KM0aGgWZEv4FooxeTyEzXHYC3xEsRWVwbmCNUkAlIb
	 u7PgncyiiJWOB4EEANfTQruQh+cPT8GLrmdEYIPEImTBttaJympadFfzZTT9GNpc8P
	 WBuzkXj78WIOoI1E4GEnrI2j3JXfHVAREpxRezz3ovtku0i1PbAEDE+tazqGeEVwLX
	 vIY84yJxFgF/uHd1OpuCAHsjmRHjaJ/vW6VLjP6VtuZTNjc0JOf2RiknPy8iidrUYK
	 Ussol50+MndKh3lJIU5BHgayOP9wWdFVe/bOjnuMYY2OLAv564PWCrnVhHj+9eF7fk
	 rKudyJ4WUB2Gw==
Date: Thu, 23 Apr 2026 11:09:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Message-ID: <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422202558.2362971-2-tanmay.shah@amd.com>

On Wed, Apr 22, 2026 at 01:25:57PM -0700, Tanmay Shah wrote:
> Add auto-boot property to notify that remote processor is setup and
> ready to boot. Linux can attempt to boot or attach to already running
> remote processor. "firmware-name" property is used to mention default
> firmware to boot when linux starts the remote processor.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> index ee63c03949c9..0d27260e3baa 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -135,6 +135,14 @@ patternProperties:
>            - description: vring1
>          additionalItems: true
>  
> +      auto-boot:

Last months, I have been asking AMD to follow writing-bindings doc or
other DT guidelines way too many times.

Or you just sent us downstream... Do you see anywhere such property?
What properties do you see? How are they named?

> +        type: boolean
> +        description: remote core is either already running or ready to boot

And why is this property of a board?

> +
> +      firmware-name:
> +        maxItems: 1
> +        description: default firmware to load

Can you load non-default firmware later? IOW, why adding description
here, what is special?

Best regards,
Krzysztof

