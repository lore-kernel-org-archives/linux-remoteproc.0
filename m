Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A53BC667
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806941; cv=none; b=ATXn1rGaCTUhGUUcew4t8BZZ6d9LirpU+BuebKi+woP04NoD8rZLuNZ+vfdUoWBBnScfS7WAa2m3WYcsh0pQrMjeaaB1Xx1Tpnn6KmOf59JMpqIHlj+v5BOCOlnGLPM6bblcaBPX6w1i7NRfwKkR2elI/v+Ku9zHxrohudV262E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806941; c=relaxed/simple;
	bh=ecck07bOcbNm3/YlCDjLIf9sZiO58qMC9vwPSnIqd0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/0o2hGMb9I6ryFITu7+xFGmXACpuQ88wIXAQk7/AXlIXusbsTffurXjBh+Z23Rk7qVWCa3q3sl7PiZxII2cBkQoPfGjYUXvCbUCWct3jn9j2G3uUVn+hr3xv9O8PhfTLxibOYDBeEI1sSrh5Ns/Z11V+tl40cvQJ01+mXTCWYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUbaVTLN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUbaVTLN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367d88b9940so7136307a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806939; x=1780411739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckdI1nVy/o7Me4Ba/hSbBKzvPEAEcL3IaFI/nQK+jQw=;
        b=lUbaVTLNCX6GRyatfKFgqIbke5Vb9cAy7XgOJr8fN0rrIDb/1pn71RSvPzFYPYLjQi
         UkER++7FqzrOPqGKeHdMD3IxlbTnf+dTRj1KGMyKfLQZL70p/YeNoDCK8KivqbVy8MIZ
         RcqD5dA9KdNI7Aw2rVVvB9t9/1Yrklkh36u0I9nFuZJ/22c9Fed2zMta5df4rrPQi/nU
         iJMUvYazVsbpszdAJ8xC2LTNVxH3fBIB2vToyFwDK8cZJoOL5dqs3l65bqh5fQO56xKr
         OPrbdDhspYrjfcm8zjVQzm3NHtRTQviHqr1sIiKzS5xt394nPkd+oY5VvQf3G0/xLajS
         iG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806939; x=1780411739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckdI1nVy/o7Me4Ba/hSbBKzvPEAEcL3IaFI/nQK+jQw=;
        b=sH0cuqGMzxS73vN+3gd+xeTJNWq/GJs7pYR4JbAldU/pgIP4OWW73TbZlC1n0sL7ry
         4y29Bi0W+utT1amKl3s99Ips6wNbwvSMqaAMaScP/MANZKQmCJhELMhWJ8kaFI+4Obf8
         vOIjFDsS4UEjVDd40mzlNNIPypzueCT/zBNb/aMQBWBg9dXllyjVieE9VI/eZaYrI1x3
         mdfV6hnavOdJTMP4R9J8hdhWDZMdlRhPBpUgK+zV+hfJAG+9LBi7Yzil/1TnHk1lkyaT
         NXI1ccyj6Zpll2devJGG/tEG5qgx2flOXyzZv2PuMS+jMDjG8ooEw8oVTFM+HXGfdiGC
         uwKw==
X-Forwarded-Encrypted: i=1; AFNElJ/5OwunKzP7b+vRpIriFRrzg+ihlvbVi73xICTMW0cqpIFi1rHz34SpgCCojB+LlzTI4nu7ZveZZ34I1WV41hON@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+EO1M2+z8k9HVB5/PysoqH12J//pzr1QGP21AIo2fQndRQGj
	wVi5zjMqu4D/06Erl/rmmbaK1+gLZNWqUKiJUMOYkCYXdsXQFMqOkV+k6uQi8eXiLLE=
X-Gm-Gg: Acq92OFuSacX36Ml3WVqsV40F9+R3YTYEwfb7PhoPwOByQdGDKacex9rZjkm1jDIlzc
	k29Rme18FE25Lp9kdkcnQjLcdnPsDJmxYvDJqcW1h5iahqVIWYJRi5w2CjKZSA12rOknafVtj22
	/BTClF32AdLE6nlrwuLzzeAYODubXcFmFReph9bUSObrHPpXTNKksGTWROxBspfJY213jlWVqA2
	JAPoy3P8iH9mhjhleiqfULwjNverzidHJ218W2ZCe5Pn3UZsElSuWzAlzkcSvYTmqZnmuzpRT+E
	nTYgBhMbGAmlYdQRGaTBK280/wunuuXkqAAREfg04MeXVaSLGPGyIL92XbbFP5IeILoBxIeqBAP
	sWcltbEYwVdJKtdSlbsNNsMdxguAgl21rg3TFFm+jWM1pYm0wTXGbZehFk46Q+ECF3qW375onfp
	7h6FtMEWvTARKvzyCzIj3nXp3jVm4=
X-Received: by 2002:a17:90b:5863:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-36a676f5008mr15514395a91.2.1779806939493;
        Tue, 26 May 2026 07:48:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c09c:6784:4cd5:a34d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d810692sm5670372a91.9.2026.05.26.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:48:58 -0700 (PDT)
Date: Tue, 26 May 2026 08:48:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: remove binding header dependency
Message-ID: <ahWy2AxRwWYwg9o1@p14s>
References: <20260508174006.3783082-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508174006.3783082-1-tanmay.shah@amd.com>

On Fri, May 08, 2026 at 10:40:06AM -0700, Tanmay Shah wrote:
> Bindings can be deprecated and driver should not include bindings
> headers directly. Instead define needed constants in the driver.
>

Is there an official directive about not including bindings in drivers?  To me
it seems advantageous to have a focal point for the definition of constants,
guaranteeing eveyone uses the same values.
 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..f5b736fa3cb4 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -4,7 +4,6 @@
>   *
>   */
>  
> -#include <dt-bindings/power/xlnx-zynqmp-power.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/firmware/xlnx-zynqmp.h>
>  #include <linux/kernel.h>
> @@ -19,6 +18,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +#define		PD_R5_0_ATCM	15
> +#define		PD_R5_0_BTCM	16
> +#define		PD_R5_1_ATCM	17
> +#define		PD_R5_1_BTCM	18
> +
>  /* IPI buffer MAX length */
>  #define IPI_BUF_LEN_MAX	32U
>  
> 
> base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd
> -- 
> 2.34.1
> 
