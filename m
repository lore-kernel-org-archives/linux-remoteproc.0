Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D423EAB3
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720751; cv=none; b=Y3kqcLQ1Iiwf4tUgUGR+fJcnj4QUpYo9DEyw+okRVZiBZHySovVZg1XILCRG3kE66i19TvNn3fSdRm04JUEXyEwh/6YD/N5foW50ObHj6nSpInUOt30P0s2BWqoqXOWneu7kIFgUx98FlTVpL4Gk1+eRGqFTKH9SpiW3FprZX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720751; c=relaxed/simple;
	bh=B4KVrUQ7tVwcm9ysslsg1SoUXgtzP4XMPnnmGqIi9Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUfEdhYcw1gynqC0mRFdSu6MT/N7farimgJaxoA6D2xTC7qzTuhayJThfiKcIeB3bFyQcruKtcfB8dLZMzUrrx/1dP3+4IygmQTx4o69UIO7vzOCKji+51Rs0qaB1l7TrBzPmJzfypqHtLLxl9jjQ4/eRaYjXtxu9H5QR51Gx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPEZxVLm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPEZxVLm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bd2c147abaso57739825ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779720749; x=1780325549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMxNLv05fM25q8J30cDMAB5OgpvYercmYEs6tGB59ds=;
        b=sPEZxVLmxF5oYPPRjL4jLZXeTpiiyvR3yiU6UelAG+TUhyZ6gGen7LYlBhdtCK/VY6
         AzkqyBnJ+hTQxyD4oWMTBlngjiyMRvn45zfXa73F4qQLTi5lnS10uk/eKQcU73ewgWXS
         SeOxjypTeN9A0+TbByMcLU8lOeU6qTjnovUtJYMNRUHCtPkL8SBR9uTYyclkYYgAwVB6
         FrjUxUXKiAK1noX81i+uo+gpRdLv4sZTcq2rOVB6WAaN1bzDwRNJPcSA5qRt1H1H3rLg
         HC1Qg8FfybkLk9v9pxXbffhBtfTgJzG8Xm0q06stdnpRnjM5gAZAdGdM2nDrGf9kg59+
         EGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720749; x=1780325549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMxNLv05fM25q8J30cDMAB5OgpvYercmYEs6tGB59ds=;
        b=ZCJek4xb0Yw08l+FxbvVtRZfoHTFA3CjYLGWcaGEo6v6LuHVLYy96XXVsnifxcvCt8
         b6wFJXp3WCqHCf1ZPSPM3pBBUKrfaqJCa00H3nso1j14/q8p5y/JNK4HM0yqS3z/YQyS
         1K99UCAquqM20/z/88OWiVxra+PLMtm3ir8MxdASqv7ZmyyOXtCrUAUbdnamqCWz+zfP
         oLOiA8yx68D7zmlbEGNF/0z62ks3+cscwYNcYpuqA5toG6zZ7oEvcOUF9VWqw9uVzhOm
         /QNibpFl9m+8tEwcfLJQkEs1zheOnUIpIPXpUrtsky0ndkY4BOLRpVY5GCL+c6wNzqkz
         sTrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LcFAsnkvSV0rjDtZqShZEXledg7G/k7kXBYq8UOvcCnCKDAbU/jLdtJ2ge+RirVKz5XQGDrAdXBLWsWD4+9fm@vger.kernel.org
X-Gm-Message-State: AOJu0YzToLKi3j3nzJGNGiYRPkeMlbpVS2No8asV9/TJi3+H0d8/BtOc
	G55o64V0smoECL8ghoUIXPdOkMxRcQ+w5oWdr7BIeovpKgiZP4kbfZ/EUeU405/wzNlf6d3M5Sh
	FzmSs
X-Gm-Gg: Acq92OEby4xQxxAp6BRASSY5xseqoTgtLBBMMYgoggJmlCgg5frYxlvqfiu8GjlS0RF
	MlMTx9dig4kfLQ9iKzSx6pC85uTFy0feh/xnFGHG3th1JhcK4Pi4K7k8sv7KSZ1or1TJxFEfCCc
	v4x3JKF8gqJdIfvyjrNxbqGzIKRGEr6v8QZzjD65gQekHoP7pmV0dkQ8maL0GX+wSfNiSZlg843
	G+G8mktM7/OtaPhCrTZd51954z3Hh0IoJrMrzNMAXFUqbLTGuZ4xUKIbSlhqTO+47CznD+6dFfL
	vuSdk+ELyEkaFb4cqQwyw23enhkUkWiyraR4JiVfOO6JR+wa5gjjk2bNvLtA6ZigWrVE4sXVII9
	+LhJc5MaiaR00+5JGK6phWLJkwwyKjqVqz08BDbyv0/ENgrf9Y2sTzX7P4EahCOiqrxDYU99Sdp
	YS2lpRkWyckdMA3iU3hfsUiPC1apo=
X-Received: by 2002:a17:902:ebc4:b0:2be:9659:591c with SMTP id d9443c01a7336-2beb031ae09mr168901795ad.4.1779720749021;
        Mon, 25 May 2026 07:52:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bf9f:259d:c433:fb32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5903bcasm104765695ad.77.2026.05.25.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:52:28 -0700 (PDT)
Date: Mon, 25 May 2026 08:52:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Message-ID: <ahRiKmwn8YdHGCyZ@p14s>
References: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>

On Mon, May 25, 2026 at 02:20:31PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure)

s/none/non

> and 0xB0000000-0xBFFFFFFF(Secure) are both mapped to
> 0xA0000000-0xAFFFFFFF in the A55 address space.
> 

So the M33 has secure and non-secure ranges mapped at the same address in the
A55?  Are you sure it is not the other way around, i.e A55 has secure and
non-secure address ranges that both map to the same address on M33? 

More details are needed in this changelog.

I'm also wondering how this problem hasn't been fixed before.  The original
patch (9222fabf0e39) was merged over 4 years ago...

> These ranges are currently missing from the i.MX93 remoteproc
> address translation table, which may lead to invalid address
> translation for firmware accessing these regions.
> 
> Add the missing mappings to complete the DRAM coverage.
> 
> Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")

The SHA should be 12 characters.

> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V3:
>  - Added more info in the changelog.
> 
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244aca..175c2d3099794 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	{ 0x80000000, 0x80000000, 0x10000000, 0 },
>  	{ 0x90000000, 0x80000000, 0x10000000, 0 },
>  
> +	{ 0xA0000000, 0xA0000000, 0x10000000, 0 },
> +	{ 0xB0000000, 0xA0000000, 0x10000000, 0 },
> +
>  	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
>  	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
>  };
> -- 
> 2.43.0
> 
