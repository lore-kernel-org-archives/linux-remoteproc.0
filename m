Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4261FECC5
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Mar 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741983505; cv=none; b=MMpFKomTNAUClc0nUe5ZyfxMLdnn6BnXLp76y3f1KRmwgj80SuuHj0Lkl89wWioySpwhC6OAANlx1YdLQhGpnWmp0fJrKXDQu/YqzyqEHjcJI6t3iVhOvNYKPSXyDlxbCdhpax4WZBl5GxaOZmsHCCV/vGysQGVjJE/epIdPDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741983505; c=relaxed/simple;
	bh=4ESTlD1VAk2LRhm46kGze9fKTdLnaNIw02AlFjlKnqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1dL8Cs+Q+fZJSXOQ5eehzLNia6gR9kylnlHczdkvMEYMeO8FYfvvgIdjjFaM9OivT2Y0DoG1lBCuQNUkm6pRsZU4ec0hCiRL1eRWx9BUSqYddMv168/gprLIa1Y69wPJoaRAwmPkDmQaue3mNxaS/gllvBZMjOE7yGh6EkNgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaE90lqw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaE90lqw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso68091495ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Mar 2025 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741983503; x=1742588303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=gaE90lqwdHRBkcSKO1r498yMZ0+muDLisUgXeSbpwuR2wxtLmj1MTwe9dtTWls0kFr
         5ZR0l2iJuV+vJKa9OmAMruWQFwkiVpZKZEVKkHtuLof4o0oKW/a5+2Et6fEfu6Gfc8s2
         YdZfwYakYj7fhGIhBO8zmVcNdAfcFN96jvMnPtK/iRZj6kPgwllyB5XAQPAdIMt3/DsC
         Xc1iMSaNMMxfBlUAc/9x7iZnYVxd819zxc4REQZkXLmgkceQmZj3xkMxEvm8E7NvJ8ND
         mW/bAGHd79DgVW0v0SW5aqfQb6Vd3h89v+v51txyXALSPqktqrVd7WPPNR0obH6cHYL4
         MINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741983503; x=1742588303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=aJO59hCKC4iwscOni1mNW8W3LysSEeqaKicvZIPx00vnmhlmwfgEYfJeEQD6usnnkP
         8UZzWVLb8Sh3t5xNyBqPHhFk+A09R12ObTyaTEpEcOBewniSDUMpI3Mq2hLtaNyWJ3SF
         iHYY9voxXiTaYmq5bkziLPHouXX8wsBZilgTCNf/l0HP/wMlRdSfYzdk7gucMeK8iwaC
         F1/LTvT1lea8U7AtUKaHrZYrFQOrZnWacVRSBhe5nLEG59aLy7ojuoPuggOxmomVhc3h
         oQkHXOg2/abc1LCjnvyb1TCsr7L5sZafmAyUCjxQ/pnVOiUsclSHfFIEXEyyjDAdj97q
         kwRg==
X-Forwarded-Encrypted: i=1; AJvYcCWYFVj48rX4jK24b9Dp3QCtZ4KR+kfOr3E6zdnvXwVFl5+5a2up2Y5iGHCEl7B+HQKcpv1Ws4lBFDjLnvOgSQdN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eAvOxyNot+q3OWOiPzKMBwORkHwXpdfOh0yXCdzOkni4L5I7
	g7MhtrH+XeRiuinWHaXaDUfV337OPl36SqOfdFWNAGTRDgTdb8R2p1w2C/DOm9o=
X-Gm-Gg: ASbGncuyUOBlmilaNQ4Svchy1FEnQnD9i1vh2uvJF8O5LXad7NOPausiaAWH0PMu7qJ
	K7c4K6+X3Mam8Az52Z4KF1+AB36PJbwxraQOgf4c9FkMV00RKq+nTsUw3Dx4vCwFalTgooU60oG
	/N+Ozz+j3U0pWEpALLgp6zV33lMd3pr3Td7zAP96k6yos1fRBylYLgZ23kcm07zIB5OIkM1bXib
	O7iITSU8/dtCBdSs5njACeHihgOZW6vA7JS59YWB31Tv5ZZcTz3iTRZq3ls+6DI9gysUSUL9zNH
	oTw0HqvcMA79ZFxgbZlcbDBcgWVjl+ybICw3vmIvqWNdY7w=
X-Google-Smtp-Source: AGHT+IHXBdYKz+0nlSrPK7TcM2iKiILeG/wu7hs+o6yF94fn14To6hkfN4AHSD2DhQ5uyimEFEKDcQ==
X-Received: by 2002:a17:902:e843:b0:224:1acc:14db with SMTP id d9443c01a7336-225e0ac3830mr51638205ad.29.1741983502703;
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:edf2:f43:33df:904c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5a7dsm32535845ad.251.2025.03.14.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 14:18:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, peng.fan@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Document run_stall struct
 member
Message-ID: <Z9SPC1Rl28NKjFTV@p14s>
References: <20250314151720.1793719-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314151720.1793719-1-daniel.baluta@nxp.com>

On Fri, Mar 14, 2025 at 05:17:19PM +0200, Daniel Baluta wrote:
> Add documentation for 'run_stall' imx_dsp_rproc struct member.
> This also fixes the following warning:
> 
> warning: Function parameter or struct member 'run_stall'
> not described in 'imx_dsp_rproc'
> 
> Fixes: 0184b4fdbad1 ("imx_dsp_rproc: Use reset controller API to control the DSP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503142125.IE33sCto-lkp@intel.com/
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
>

Applied.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index bc60edcdd661..90cb1fc13e71 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -96,6 +96,7 @@ enum imx_dsp_rp_mbox_messages {
>  /**
>   * struct imx_dsp_rproc - DSP remote processor state
>   * @regmap: regmap handler
> + * @run_stall: reset control handle used for Run/Stall operation
>   * @rproc: rproc handler
>   * @dsp_dcfg: device configuration pointer
>   * @clks: clocks needed by this device
> -- 
> 2.43.0
> 
