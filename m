Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2312273803
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Feb 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049007; cv=none; b=fsTdFH39/NrNadHWL3SSMhmL3XwRIG+qSTVHTZRZz56lRiUcGXxtUpKuP+1PWnC32moEeRpL+h70KkuZnH28gwKxEwF+qzTjB8WXEAGrCU60ZLhS32MNydnuZ1x82LHQ7nHDq9SlWTXpp8P2AFv5SunnqjLK/2F7qHnSS2fJIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049007; c=relaxed/simple;
	bh=PMp4djD8pRzTfzCwrEWdLRidXLy0AL6hraTfCK1hKTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTI+o4jkcgOCKzU/aA0i7yqVvBFBZytdy6LiSZw9cv0GBqNtlxdt+seMXL4qgqSy6l4LcXClcWukNmo7ExgpFs5341w3GvKTFVAaxbxkStMmvV8Q/DglO2CmXcoX5SbyiD0EQx2ESS8Dbr+3+h4/afKKCeCn6oFn0F0YD5i0vPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWbgTv5c; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWbgTv5c"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c633984fbeeso1864404a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770049005; x=1770653805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=;
        b=CWbgTv5c8Io0cIiRd9rSz6q1Qpein0lLZLFY38XhSy0BEXwjecDMbfaUMO6Pp9bEd/
         kQcffYvQix74IkzH3aD7iBFKe40cDACIfoHvWqTyGJOoIoFcRQs7/aaAuVHitHnBlFjx
         66RE9zaeDoxCewjPK61LG3HgoWZSPKIpckz8lVMeVXWsHtc1j/snVLaHHU44KPAzYc/B
         LBZ5ha0uhDREkQ/opDd71zNtiXr0LrqjUX8Ns8iIzVXcCNEk1FdAb6c98GephXBkFtOF
         CQDY+dKR4eZRv3hsh/r1jAsLCslQUiWNizp4nUuizP8/LO9BdNGjF7bq51ciyecBkQQE
         0wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049005; x=1770653805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDIwIvjoA0KVZj8266aGVsS4EvreJW/WICQfNeIuAso=;
        b=ZVyNZ0/qCL2UFm7lJIrWvkenhxBQXQRwkBr4wZgjSQma1FlZSdIgJlSN3RV7IRqcvH
         SzT9rAMB3idbH7f1rli3bHlXXMIGHDRFLJ7zR29hcpMrK7Yvd6xoqyFxgpAzjmGMn7ap
         14+9Zzz89/bK4lsh+ge0lEDTplrm2U6PUETgcBU9qmL0VsuUCaKKvxr5qAfLjf0p/qfx
         OPtK75u/ZZhgiLrOMrowkiAGPkD3sWnuqjk4sNEqBs/aj3qjR0wrOOKGo22QscE1bGMt
         B7jPkVBFTNwQ9p7PK3Mff3PWo1/XPZ8OzCqvxiC2zypuv3Yg8Ollw1S8JBRyZDCTLyjb
         BXEw==
X-Forwarded-Encrypted: i=1; AJvYcCXlmZhqyG8X8xSA48rHAJDip9DoRi8DzkOZAkXPR0r5GuF5vr/iy9OquYTA7ehel/lsd8PbtUSj2Q7RIjX523xm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kOMUqPKiNB676kdI/z7UP/aG17qX5lqZoe/pTkeQktQBuqEs
	anAHSaXF7q1NG4wQ9iPL8o6/oX9+vc4dFIZaZNh4aaMTxA8kFdqigPBG+RNO2FfveP4=
X-Gm-Gg: AZuq6aKL+GmETSm/4bO212xDwobVbNqYnyhRngYW4OSP0xeZvr7O4R3VghCmeMQV7d7
	iCuy+1XAU0ijkd9JZZALJEMQcnjQSyPu8/SYvqrh98mH5xH8x8l0FoJ17CGO9EnBPPpM8/Mxtt2
	KM/OeFzrOx7RsMPmtWfGYQUHYuX/VsAK7PU+txrQUhjAKPTJ03SPSDDGdntyUnXAE7x2SX9ef8q
	JdSctpLZ6Njc8K7suovbNgf+TY4W0kwUrzJ9pXuzRsNFB5F3qafbjjw4wz15RTlgXyZ+3OazxDD
	OEL/F4yO2lOZg4CO2Cz9XTcB2658NnSCjz4WkfYsteCoiPyA+/R+zGAg2oJsGt57I9VE2e0JedN
	PsWB+LBQW5vsxqOFynAKI63UqCvkK+Mahx2XZcOItW5IkOBw3fgbz546QNX9kR4uDfbnObg4479
	XSxw7QoY/FWPhtZFiugE8uUEf5
X-Received: by 2002:a17:902:e749:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2a8bd4c6f2cmr162675685ad.14.1770049004918;
        Mon, 02 Feb 2026 08:16:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ef20:b488:c934:4d5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4154fcsm147962315ad.36.2026.02.02.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:16:44 -0800 (PST)
Date: Mon, 2 Feb 2026 09:16:41 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table
 detection
Message-ID: <aYDN6X0WVT9nV8fg@p14s>
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
 <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>

On Thu, Jan 29, 2026 at 06:02:21PM +0200, Daniel Baluta wrote:
> On Thu, Jan 29, 2026 at 3:45 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> > resource table even when the current firmware does not provide one.
> >
> > When the device tree contains a "rsc-table" entry, priv->rsc_table is
> > non-NULL and denotes where a resource table would be located if one is
> > present in memory. However, when the current firmware has no resource
> > table, rproc->table_ptr is NULL. The function still returns
> > priv->rsc_table, and the remoteproc core interprets this as a valid loaded
> > resource table.
> >
> > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> > there is no resource table for the current firmware (i.e. when
> > rproc->table_ptr is NULL). This aligns the function's semantics with the
> > remoteproc core: a loaded resource table is only reported when a valid
> > table_ptr exists.
> >
> > With this change, starting firmware without a resource table no longer
> > triggers a crash.
> >
> > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Changes looks good to  me >
> 
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
> >  {
> >         struct imx_rproc *priv = rproc->priv;
> >
> > +       /* No resource table in the firmware */
> > +       if (!rproc->table_ptr)
> > +               return NULL;
> 
> I wonder if we can make this change generic because it should happen
> on other platforms also.
> 
> Maybe something like this:
> 
> remoteproc: core: Only copy loaded table when valid
> 
> Copy resource table in memory only when:
> * the current loaded firmware provides one
> AND
> * there is an explicit request to have the rsc table copied in memory
> via rsc-table
> 
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
> const struct firmware *fw)
>          * that any subsequent changes will be applied to the loaded version.
>          */
>         loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> -       if (loaded_table) {
> +       if (rproc->cached_table && loaded_table) {

But we would be doing the check for rproc->table_ptr twice (->table_ptr and
->cached_table should be the same).  The way it is currently writting forces
vendor specific implementation of rproc_elf_find_loaded_rsc_table() to do the
right thing.

The merge window has been pushed by a week, giving me an opportunity to merge
this patch.  Should I do that or should we continue discussing the best
approach?

>                 memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>                 rproc->table_ptr = loaded_table;
>         }
