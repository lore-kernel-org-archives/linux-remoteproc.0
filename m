Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DDF3BB69D
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324955; cv=none; b=DTNqFaFt4IAlcuyG6gMAoxfQldZqREniqoHhLaB/IbkbLGWgt5kZOSXbZGqkL1pQV3aPh44JRu2u+D5RCn5pgfHekfG8cRYQy41zXZsdEbNqzA+v0/di4neu9xFBpCv1FTFYXSlpwr1njZTnh6GSWk00sMHyZX2UrcjGusnthuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324955; c=relaxed/simple;
	bh=KwKEkwDhKFllduxQFt6dT+HKbaAW3P77Mq493+G7AAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNV6JiM9ieB5EY1+XsgMYE1Zp8LWBEtGtcwqx0/be6Y5eJc8ofME6gnvZHA9XGanVO0P1/fiThwbaVGqT7KXUZB8iXtmiGjRigVWgUioZLpPtR7qqMFDVp3I87NaDR68aEGJqZahaYnrFvQGUU2f/pay94a7b2fRtPYGIEKeWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfVplF3P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfVplF3P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2d792c8so9506105ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780324953; x=1780929753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=hfVplF3PmsPoQqwZhHw84uwWoUUcR0wwcT/kGW6BmfQddv7vCn7DCId8KAEX1/ubBN
         AFZ5FlwNFYyF9zGHO06WRF3m36qClaRkMERZvP6em5fLFm34C590b28M/fuODPuEEjbL
         sK0rEa9KRseEUad4xJAKOE6JKLWBS+vvuWwxihpRWCOb3ge79HQ+vOMh9pwhItdCupcC
         tMn3x9xF1dO04ykTM4boJaUYQer6RnF9CLDWNsgnqe2TabLbUTWMc10IQQVV3xpcF9t3
         zzmJLQI0vny597fY0PKUgZEgcM9vUrRHwPxmXfEF7UWfWtC5itiUGKotVE8GY+DUZjB6
         wTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324953; x=1780929753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=gB/SSeckfCmLKL9t88LmsAQk5dx/VtWM8kI66Q/mNLRJB9CBmJH72S7HuhTiOdxdER
         4csHIU+PXeJCv8iMJuciJjXLCwjLzL9dcbsGFSc3BAOBdY1fEdjlLfY2ZnKRfSMx1ri+
         P8fDgDj/eqs60lteLSppZkpySUs0Ff0kGdkEnqNEuVyBqXSx7u/jTDC55mcC7lIbWz62
         IezvMbPKwkQ1t8rNwBI7CJ/1MFHTINC0WR2xkgk/vM2vJHLQwvSW3Bsw3fw5Y+/8TRcz
         LFwQwemIX8cZyUpv4EesR07VWxmJ/ZEebvLlAUgaf0qSSs/p71F5lkD2Hkf1wakj5IsP
         C5Gw==
X-Forwarded-Encrypted: i=1; AFNElJ82SLeR7CUQe746gEk6+cauTzGqSzipQtsoviGSJVIGjDThSfS+ku2LiPBl73lb4B0/fYgUZksvkb+L+2TOMyNb@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvBP5CT5Qly4JQzVEtq9lWez1Wa2dbgYUAGgQV03oiO7pE/lE
	KUg4WDNFoXnyBYr1aNg37V7VJ96l4rdvSYacAtkG1bq4oIIAdeo+vpVCiN8mZvjIRUw=
X-Gm-Gg: Acq92OGRLtCQ40wsykwdc+4cZjIEJLmIxtfz8fj7SOumYmhj//Sfg92FS8mCr3zxsvS
	qJdYDvWQH5d/3gkyu/nol90qrCKO2dYKSpF3xJKtmFREF2LOg6lhCaHQymOMX9QsefryCiRJkde
	xJ/ch5zPAS43+EUdoqPPtZvtaMLti6kNBnoB7FFEOgsLyRManZD2xw1d3db0+AyyUjOWoOlFwcw
	z+Z4dKP5vAfPLK5rlxY9YyOtidKexnI2sXc7C+Smq8NT9TSIRW1bcVS4+nln0xr58qcId348xdn
	OI+tiWXwi2hxi2uKjyPQnAvo461qvth6+Rg2jt9pCcmoAId/pjAS1i5AM9wUyVbGKSDwdeYXBi4
	HChXF1EaGJJp+JrbalMZhYt6Tqza8lqwG7KVL+Fxf4oDjq6zTWOL1bkGtqGSF5UwrTLA+Xf2KqS
	TvVoZ/vu+662RlehEZeezzzCQGhb5hUZqT4s1gnS5HNieHTh86
X-Received: by 2002:a17:902:e74b:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bf3679ebc4mr132076775ad.2.1780324953150;
        Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:86cc:b476:3696:fced])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0842esm107038115ad.57.2026.06.01.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:42:32 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:42:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <ah2aVdlsLqy9aeHP@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>

Good morning,

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------

This set looks good to me.  I am fine with the checkpatch warning on the macro -
given the redundancy it avoids, I think it can be tolerated.

Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
and Peng, please do the same for your platforms.

Thanks,
Mathieu

>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
