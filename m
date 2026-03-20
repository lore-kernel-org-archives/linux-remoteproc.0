Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1A33ADBA;
	Fri, 20 Mar 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998156; cv=none; b=bkr5OV3MOdzG9kt8T9J3trDxjlVlY8wB3pGvpB7Rz1ELSVyzPqWAusH1IieUTVIE9qgCBRoqC8DZxm1qOsTbwJdCqcFSPq95F2mVXK4eYAJQJ+j9SVuveiv5Iwri86RgpwK3ltWe1SbP/7WVw/mRMmcEQhTWqT9sDIIeMRYiW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998156; c=relaxed/simple;
	bh=cwr+cb2Z1L1v7mta4diXVk2hpldr2ucjqAXpkp/nQ/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPGC3mm6US3+qZeESg/n3EIxXQubUuuHrSESBHJknKS1T+tTMXdsfiaAdAqyIfVTwNxim+pMIhlgWFx2mzN4lwxdTUpFLv0o6R6/Bf0TNc+fbRToL7tIfAK6jhX+D4JDnQtHK4ISPXNdTujR/qoK6N4SLaLL29lwqLG96mf62aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cbe9x4CM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cbe9x4CM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE40C4CEF7;
	Fri, 20 Mar 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998155;
	bh=cwr+cb2Z1L1v7mta4diXVk2hpldr2ucjqAXpkp/nQ/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cbe9x4CMwiXaK/8gUoTvsiA/tdAetsKT5mQm6fu8NHgQek55VpqB2fHzKkl05RkM3
	 01wdr5OBCkTTGve0XeMQ/yl1piXiuYftazulWhVSpgJ9WM4h/vQRaarsz0L/2ZAlzM
	 RXQc9j/CboX0G/rHddhZILMTVB3b5EsXGlCs55H/fxctJc0oIq7SpDEdybapR5kW7m
	 dDqgay73v+m/usSy3+4lD3V3TksNQZGose88aqcZUv6xGmFaA8nd9VislM1cCo2awt
	 8uzlXs9Uykj3+tlrJyW6zMSpQC0zYxYHjyFioZY8jGkZIvwVD4aCS4NQK2+ryEwSdV
	 tEntrp/JGtyeg==
Date: Fri, 20 Mar 2026 10:15:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Hailong Fan <Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>
Subject: Re: [PATCH v3 2/6] remoteproc: Mediatek: Add VCP remoteproc driver
Message-ID: <20260320-impetuous-cougar-of-typhoon-e2da23@quoll>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
 <20260320032014.13608-3-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320032014.13608-3-xiangzhi.tang@mediatek.com>

On Fri, Mar 20, 2026 at 11:18:04AM +0800, Xiangzhi Tang wrote:
> +
> +static const struct of_device_id mtk_vcp_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_vcp_of_match);
> +
> +static struct platform_driver mtk_vcp_device = {
> +	.probe = vcp_device_probe,
> +	.remove_new = vcp_device_remove,

There is no such thing as remove_new (anymore) and it is a proof thar
you are using some obsolete kernel, so it cannot be taken upstream.
Please work on upstream/mainline kernel.

Best regards,
Krzysztof

