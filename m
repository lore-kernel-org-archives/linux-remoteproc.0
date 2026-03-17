Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F181D61B7
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760478; cv=none; b=YFDXFri80SEBK8/Otet438x+N/kI7yW4zK7BazJprSy08NIf1TXUkv/x0cQIUOoeW5fEmYvPPDRspAjisjVyflrYuKD62NF0IaOIINeVZJO3Yoss+6PDwVdnYjM0+fOD5pIFl3UfqwrS5ZFhPCifQTcAXfkpjpqyqxIJ+pFg8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760478; c=relaxed/simple;
	bh=8eIg/TsxhBfhrDXrcLNSgXHJF+jPGKAn9zEiVwie6to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vE/uDmwmOV4F/6o9KRPNshNdG9qUBFSsE9LLJP8A8b3dSRNXQtGm1CbhGpBqG1fiaGgt3AMaYJ4vgV7d6YKqVcDRPMYhxIiA+aIqjKzHIWZbUxvaH3qjShUTmKfNquoLnu0hgg1MZElKZVEw+f4DBE82RnvmZFxRKkcj7lHTfkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCz/uBzI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCz/uBzI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829ac4670c4so4460144b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773760477; x=1774365277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EtOSe21dSzIPk1g7D20jFSn+X/ojhgl/PZA3x4gz+zw=;
        b=oCz/uBzIG7FxbeyIxNDfFfC6cxEstDXE+qTrNKsWlfOhf5SnllRCiWVV7x0dgyKKOv
         KqlXZ4f2DUty6BlW1OkcTfkss/m8DqeVJeqk4KPtZfstvomXkte5QSvmLmWWv9Hn2JiK
         kSJKcf7eABdElCbHzyuEf2YguvwGhKWgJoURVUiPizx8I/jVC7FbOtcCaZZkIh45UkbP
         RbVfD68ROgjXp0szih0lv3i2M4gN4e7SVj1XUZfH0Ohlgi8mXDCGTEYg6tLp11whvN6v
         N/XuC9ueBHobPiENXAa4JVajqRzuwUJFM5p80moOz5lTec0te/2cJRQCZrO7tsyqzEG2
         Vg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760477; x=1774365277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtOSe21dSzIPk1g7D20jFSn+X/ojhgl/PZA3x4gz+zw=;
        b=Vh0poSw0jvgP2m/013tiG4vmtwTevpwpRwKGifLhiVB/94Fa/5CNiTZzASIulpPQgx
         TOoY/5I3wYOc6N/AT6Wk6RvcOPv9UgzYRwuR+ZGBTlVOn+gZpxplh8wi8yeQbI/ecfKt
         c9RB7ealONpx7R8T5pKlhRVW2GYZKC7NAZV2RUIqSuvtePdzqU+r+7kXS60veF7SxS/C
         E8VE640pOj238a+TU2DFeoOk3vfyxrTmSxuxiGhpuu7ZNJ9igKk+U5n32E5ptxu4A7Sf
         WRhRm72GX/TWBdYaQGW5irSXVtGzH3s4Thc1J04IZoDEu47gjqrr346zFPC1FHeHPCZ1
         SN3g==
X-Forwarded-Encrypted: i=1; AJvYcCWfF4hpIzJRsVvREuO95lOAP3Hil+x4U9YTHulmbVCUM5Ep4N0liAbmfwH+p2OHP0VYceZXrJmA3o1M7pQfCM3/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbQ9b42LJspRrzbmMcn909WWk8VHqQ7jqV7mL7JwD1y/F9kPo
	PuxmIfLygyMNZexOByn2jAyp96KSFQqafSzKWXhqVX37xFKBwprd2XpOyXAvLB9i1uo=
X-Gm-Gg: ATEYQzwY4v3IoCIdT3h+qbmEdXcLaHTJIDMe0o7nBFcAedyobdyEnIk5g9EKBQ6n3E6
	sAPVxOENaf2KY7jLFhEiwIDAVV3GEsKT3QM+LRWoGuVB8u823vUB4NxxOS4HuPS1n6HopynV6Bh
	C6j9dMVkLrQG63EazlMjkExAieQh2yAhTr8lGIftthwzuKxqbDkVosbd1GaHdA6W7a/XrLhfpuJ
	YqPHz7eUaKpSPzaKcurkV8duTN1WnprR047RN3NtFQMHaRiTwdma5yXOTqjFO9TtDkkudqpvrJY
	u+RjZoSCZNtZtCz6ohpsAIxljo49F7DXyuESpFbMGidMpE70LerrT7yUK5+Mm+0xl/dNjrVpiDs
	Eao3L5SSps2N88nddnllGThr5577FsnA+OhNAgaiQxn6h2UlODp5StkgFLQwfLE4KMhq5vAMC9p
	UZXn7W34WkiiPPEYxjA+LuO6coUKA=
X-Received: by 2002:aa7:8886:0:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82a19898705mr15504292b3a.40.1773760476640;
        Tue, 17 Mar 2026 08:14:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d74d:3187:221b:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0734039asm20131334b3a.41.2026.03.17.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:14:36 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:14:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: do not send new mailbox notification
Message-ID: <ablv2f7Y7bESE3Bg@p14s>
References: <20260219224329.3475032-1-tanmay.shah@amd.com>
 <abgfO32Dc9QbgQau@p14s>
 <dcf81aa3-a50e-4545-8d6f-7885c6804e87@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcf81aa3-a50e-4545-8d6f-7885c6804e87@amd.com>

On Mon, Mar 16, 2026 at 11:29:49AM -0500, Shah, Tanmay wrote:
> 
> 
> On 3/16/2026 10:18 AM, Mathieu Poirier wrote:
> > On Thu, Feb 19, 2026 at 02:43:30PM -0800, Tanmay Shah wrote:
> >> Only write a new message to the tx mbox queue if slot is available in
> >> the tx queue. If queue is full, then do not send new mbox notification.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u
> >>
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index bd619a6c42aa..622de733c929 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> >>  	int ret;
> >>  
> >>  	ipi = r5_core->ipi;
> >> -	if (!ipi)
> >> +	if (!ipi || !ipi->tx_chan)
> >> +		return;
> >> +
> >> +	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
> >>  		return;
> >>
> > 
> > Is see 3 options to handle this situation:
> > 
> > (1) I can provide an RB for this patch and Jassi picks it up in his tree.  The
> > downside is that if a subsequent submission conflicts with this change, we have
> > to wait for the next cycle.  In that case:
> > 
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > (2) Jassi provides me with a pull request to bring the patch in the
> > rproc-next tree.
> > 
> 
> Hi Mathieu,
> 
> I am curious what do you mean by pull request?
>
> Jassi had included remoteproc mailing list when sent the original patch
> here:
> https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/
> 
> Since then no other change was introduced in that patch. Isn't it enough
> for it to pick-up for rproc-next? I am just asking from the process
> point of view, what should have been done differently?
> 
> If all looks good, then I think you can pick up original patch from him
> for rproc-next, as the same patch got merged in the linux-next.

If I apply Jassi's patch to rproc-next, we'll end up with the same patch with
two different SHA1s in two different trees, something that is not compatible
with the linux-next process.  To avoid this kind of situation we work with pull
requests, which doesn't change the patch's SHA1.

Since preparing a pull request takes time that Jassi may not have, I provided my
R-B for your patch, allowing him to merge it in his mailbox tree.

> 
> Thanks,
> Tanmay
> 
> > (3) I pick it up in the rproc-next tree in 5 weeks when v7.1-rc1 comes out.
> >   
> >>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
> >>
> >> base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7
> >> -- 
> >> 2.34.1
> >>
> 
