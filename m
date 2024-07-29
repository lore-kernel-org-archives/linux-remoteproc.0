Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8E155A39
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265160; cv=none; b=f4qxbxxIjQrlCjx+HCnQjk4mdNud3UyuyFMkFWZqnkU99XiZHzclU8Cc7Jr890FtYljdntgrUjwgrMqpxStGV3tLeryqFp3zOXgp7xNP8thkpKMC74WBleZQAkstmtNauncarwEby56c3LRCE2lVKBsEKZg9KQEqC0IGOuPPlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265160; c=relaxed/simple;
	bh=BNOXPZtZKWW/vqL54/YmXApUaSlHoTjVustBzHzHkRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcyXiZ6QvvdAuKlQHWyQ+h9YC8lPSRExnYLAffkocxnfdppqkjyTXPfemAIWXsfgGqEk82bALPkt/x69bhlxh3vAZS6R6yzDcQHfE0ipZ+BcC6ZjfxQEhEy9rMYWtMu5KRnxiG5yjiKCUi0AI8fe7g5ENct4k1N5hMe2ha5z3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Klxiz99q; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Klxiz99q"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70942ebcc29so1559822a34.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722265158; x=1722869958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dhV9pLkwnO6TngFTZ6PEmd1aRr+aIvv72OqFegZv0k=;
        b=Klxiz99qEAjun3Go0JSyZaIe2zPvp6/YgRPpkpVGySenBsmW0kZ3z0m59pYV2OH6SS
         ymFgo+/jYu+K5GXj2wd2cF7369Vf8K68eIPnbxG+Dn5A7qXwveRUiZvzPlxfYtdxR5tb
         P+ahPWmxlc8O/RMGyqUS6ZxKpAQgnHhxEEjDvaEMIS6TcHLsachyzpQEtuKif1TuUp9E
         zEHw0Vijmq37ibOpPbnFT48Co6W49aOvC9bXHO/oSBeWO4SAJsYisJ2LcqBbe3ZdHKKZ
         Zmp5KnhcHbHr7ljSsMS+U+3VNdp8hQz+hUO8JysvzgvhGwdZupjv+i1kHcZhd9p0Pu+E
         NHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265158; x=1722869958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dhV9pLkwnO6TngFTZ6PEmd1aRr+aIvv72OqFegZv0k=;
        b=gYZXpCFKQEmRL+EDf9WXE4jlibHVx6y8VFyp8y+tQ4YOf0M0nyKz8+v0yhLZ9eT0US
         YWKXznTJNDxQsIoVh+MTRhNxgGvwqsOipiaF8w37aAHwHsB1453LtX4b4Ok13G/13jTu
         poEqUeNOjEfzRrZXrxMLW+2nEb/ckjCrfiveRpHbwSKR2ac/++LIO8WWkSofO1iFlzmB
         rNwJBPn/rZOvOU3OSrLDWYBTaB2HzU93ootaVWdSeWhJLbYQBuVkSzVxWziWsa1nRFj6
         OFYPzv9Gd99CxCuyKkyyt5R3oCSgo77S6mlydeO7HNSgmhJDLod89WrMUDgYc17zhJi1
         AgPw==
X-Forwarded-Encrypted: i=1; AJvYcCX51iLPdwVQPPpphetK/5scVhE5Lv9cC9M2gM6mdHa2I7QRDRvyPKZ5ddyu7Synvb0yHHy52uiPhVcqfYnxZVaXkiqVqpnHbF24/5Qu/QBz+Q==
X-Gm-Message-State: AOJu0Ywp1vvLIKLYM4W7Jj0mbCeO6O0b1GMAVzNahB3o6PfZu2Ox5+1r
	lsrPgUSjo/ydH4tmAM3Jq/YJmCN4iOvcFD3gfpUxkq0cJW95yJ1uonY9vPcR/Sg=
X-Google-Smtp-Source: AGHT+IEdbCnGqwPNsJw9sRMXxW9hssPlB3eNzpMfeFiqhxqlaGC54wLTPHxF2sPrKmY2qW30e4vafQ==
X-Received: by 2002:a05:6871:520f:b0:25e:368:b5a4 with SMTP id 586e51a60fabf-267d4d0a47cmr9601699fac.18.1722265157961;
        Mon, 29 Jul 2024 07:59:17 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b771:7ecc:900e:e070])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f7b7b1besm7398510a12.2.2024.07.29.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:59:17 -0700 (PDT)
Date: Mon, 29 Jul 2024 08:59:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Terry Lv <terry.lv@nxp.com>
Subject: Re: [PATCH v2 0/4] remoteproc: imx_rproc: various patches for misc
Message-ID: <ZqeuQSNUA1X1wlD2@p14s>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>

On Fri, Jul 19, 2024 at 04:36:10PM +0800, Peng Fan (OSS) wrote:
> This patchset is to upstream a few patches that in NXP downstream for
> quite sometime. For patches directly cherry-picked from NXP downstream,
> I keep the R-b tags.
> 
> Patch 1 is a minor fix to DDR alias.
> Patch 2 was sent out before,
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-1-peng.fan@oss.nxp.com/#25144792
> this is just a resend
> Patch 3 is to avoid mu interrupt trigger earlier.
> Patch 4 is merge small area to support elf that has large section
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Add R-b for patch 1,2,4
> - Add Fixes tag for patch 3
> - Drop downstream R-b tag
> - Drop patch 5,6 which will be in a new patchset for 7ULP
> - Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: imx_rproc: correct ddr alias for i.MX8M
>       remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
>       remoteproc: imx_rproc: initialize workqueue earlier
>       remoteproc: imx_rproc: merge TCML/U
> 

I have applied this set.

Thanks,
Mathieu

>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
> ---
> base-commit: f477dd6eede3ecedc8963478571d99ec3bf3f762
> change-id: 20240712-imx_rproc-25f3ab753c58
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
