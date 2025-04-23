Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09028935F;
	Wed, 23 Apr 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423507; cv=none; b=DrXCEYnE+JAzQqEAsIcD0Sduw099yQO+tjuPIXRxQlc2SyLdqkVWMMJMM6vf5HmU1p1O/uwYNzpgohU3osGGQckFsgTWwD+amSgP8cyTbM/bHY5wyuA5SE5bqLLfHF9uF/6h3nAqgo1nZtwWrnq01ytwefbOATV0az4Vfs9irxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423507; c=relaxed/simple;
	bh=Q6PcQ8O3FSmUk2TwPF7gCzpyOKQyy07Lo0eWC7IuJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avLB2IP1KGGtlePQTqMHxEKqvyjkxOePi4YUILHeNEbHqw1WRiPd4xMEkzkejRYHdmoHO3Nnyxzvsqbz+QkMZARxLAJ0EPRc8lj2jQhUlU16nyfvMY8V4543wM6NdEqlvuPSzyuPy4/Xje5fGBsPgyF0EptVs5yt7l8osWhzUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmgPy7oN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmgPy7oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFD3C4CEE2;
	Wed, 23 Apr 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423506;
	bh=Q6PcQ8O3FSmUk2TwPF7gCzpyOKQyy07Lo0eWC7IuJ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmgPy7oNLM0uB7pP3DNkeEMd8gByPbo3asds+AarzLLyrC3Gzj86gGQNq1pVjbJ5N
	 g7JU98A9UbuJuyqi5Y6icJSXeVltbtdDoNSSSD3NIs/gc8XhO6WMPuR2VlZauZq4du
	 eB/3iqRuz7qJJLIP0ICaiq6y7u4sXqy807rLeUWT2bxgBphAHgJ3xMF8jzwjdMlgz8
	 7tPFVgLqnQAVM5l90H6TJirFaT+OExzULT45LJJP4s1qRoriaeZyiUEgK8BQ0QkFH6
	 Vv0q3Te2Xe4j3ElXN0hJgRQ4eRVm7sNcyMLIRoGCL5dFl22cXQDstZE8m8KRY9WhhL
	 xIg4IxhWm7z2w==
Date: Wed, 23 Apr 2025 10:51:44 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: remoteproc: mediatek: Drop redundant
 maxItems for mt8192/95
Message-ID: <20250423155144.GA581441-robh@kernel.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>

On Mon, Apr 21, 2025 at 04:49:06PM -0400, Nícolas F. R. A. Prado wrote:
> reg's maxItems is already defined as 3 in the base schema. Remove the
> redundant assignment in the if branch for mt8192/mt8195.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 04348cfcb0424dc78ff1ddd77665285a052925e9..82c7edd5a2fbb8610315881a4033a3a43198162e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -187,7 +187,6 @@ allOf:
>        properties:
>          reg:
>            minItems: 3
> -          maxItems: 3

Sigh. I would squash this as using maxItems was the error in the first 
place. But either way:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
