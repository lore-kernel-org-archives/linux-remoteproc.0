Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659635A12A
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047954; cv=none; b=cF9EAtUiXDMQbqrtyJ7T6a70cKhQKNFYTu62ptnhmyyk3gdtdvtKBMuafYjkSp9/9KPcfddgoYdGvqLenb0n8518uj54x74woOSZh9bRMkYfEd7xiN0FKEd0Dyhve7Gne5FcQYCgUKLncd6CKiOVk97lrV2EjQi2d8csLNk4HA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047954; c=relaxed/simple;
	bh=Z1vu2MOiIFQBcyrWVUVPL9kCsj3sq6loXCLsmGoUKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcrMDXJDJl7IQa2vll6yK6XV7BTvd2sGNtOniRb94jGP95s81zanYTpg1b6Sbq61qL4KF8jndd/0PDpTfTNpRZF3teb5tGIcn6uN1b2HkOvT8WmxMYdMaEWHbt4wZiBVAxB6pzdIuoEcQhPKagLzoJh37gJ7rQ+MX4hvgkvXhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKOg9J7D; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKOg9J7D"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2953e415b27so8734735ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 07:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763047952; x=1763652752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=AKOg9J7D1B07L3Zh86GSs72adKKQAo9kFP0iXvWJ909llen+LapyTKuuk246YLU+SW
         9ZrrsIEiPHi9soWwzFXzwQXsLZVyLxxNnuKUuKg2ZO9ft+J+jiN5BEoxuZxXGWTAa0zy
         YOeraq2pUM8BG7X3A+qbpTcPaepIP2B0kN3YbDuY8f1VKOIZqSiDjmyCvH7z6r2kaHnH
         osp6dwA5tbmapRvjSmA32Q4C5yl7WUd6dHTSWoXdsSitS76CGkYxUdhxdKDWp+iSbPYJ
         2kQgNBYmsARlIYl/TVv7i1W79/CjvyLvkkFwBzEaRRSHvQwddKPrKwnlP0P+a2QC4PYV
         +o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047952; x=1763652752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
        b=bSRLJ2+L5SuOI5eyMiliW8sZXyERklaJxlvqhINDM2VX+xGc8+MBocsOqufQkOE1DZ
         WLO7St0RjzCW1jAn6aTloptvLwxUy+O0oCmgARTAgvmPWY9KNExx1CuYcS9a8xbf/p8G
         IOtc9E2OCIqUleYSNJ6eY7txpuMM47WYerTHAvE6NqIBDqdfUIxiYnqCg50uYP5bfnrX
         fsWsESU4CHujRGkOQPjzEk2qLWbPyYcegY2n4Fh13qmjd2l79gd2+9J5OP+6iodBxMs0
         B/YeD289qn4Yk9NagipTEaZulQSruUNdv49d1nuKALOD0Ev6ET0g646+uQQlelwDJO63
         +Fuw==
X-Forwarded-Encrypted: i=1; AJvYcCVWjpe36efF0myKVjFFVxp7lHOyu0ogcdTRm08/wkuW69tN2Cv4E25lp0Lhqv8UsIQPw2dAxALiY0Uzz9RTNyq5@vger.kernel.org
X-Gm-Message-State: AOJu0Yysl5emW0O1XYI4O5c/zgmM5vxs/Rpxl/o5fpT4WGjerXTd5JOG
	Ig+IeKZ3YYR8mNOa2Dfl7LemIoUaGqTdLnpget993wPbdRsIQ1YV9hEMk1pNkuZ+dCo=
X-Gm-Gg: ASbGncvDMeRn8jZLR3AlVRJLcAJaPGFSGYpx10Yv1Folj3+7zcAy8em0Wh/fNxTADX8
	7Eh6tC1L3JZv4qGhyhz+A9rKNHG5xfJ8+6Sbh2npIWbgJr50OMIeC2WKqI3mGkG+0Pc31CS2uP8
	B3wWSw8DT/uSUxAmXEd9plSF2uqD6pl82cnVLx04jIfSbA1tTy1vPL2b0POtX6ng/bJAjTLjhnv
	gEvA1ERsT2p9+6nv1pYFLkLMeXVjjNTcfg8giecRP//XzwOfE8xUOavfYB2vAieNKvdIS7bDq2+
	TJ1A4fnVpvmXvHFEt2TxX3kZQpLGoyhkItGb364bdATO7rjZcyLlizieJrgfwuQrzE63vo8wUQW
	vc9Bjalmrgd/d32fRchd1aTEyympDH5HF9JAMgwcK5aRJU6onNg8wAgkSEu8PQ6XQEdVAxNYBnv
	ceknv7CZpdPP48O6TCVnhSEWQ=
X-Google-Smtp-Source: AGHT+IExGtwG81uwzj9JgnEK26nwTkuowQ0TGIoI/B/ng4jHpuOWuk3RVAjeNdIAjjrFddHoISsZ3w==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr85532495ad.43.1763047952195;
        Thu, 13 Nov 2025 07:32:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aee4:3fd6:a52:8e9a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed4fsm29590765ad.75.2025.11.13.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:32:31 -0800 (PST)
Date: Thu, 13 Nov 2025 08:32:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <aRX6DJoaP4MXG3fN@p14s>
References: <20251031175926.1465360-1-robh@kernel.org>
 <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>

On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> On Wed, Nov 12, 2025 at 9:43 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > Hi Rob,
> > > >
> > > > Please see may comment for st_remoteproc.c
> > > >
> > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > > properties.
> 
> [...]
> 
> > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > > > index e6566a9839dc..043348366926 100644
> > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > > > >     struct device *dev = rproc->dev.parent;
> > > > >     struct device_node *np = dev->of_node;
> > > > >     struct rproc_mem_entry *mem;
> > > > > -   struct reserved_mem *rmem;
> > > > > -   struct of_phandle_iterator it;
> > > > > -   int index = 0;
> > > > > -
> > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > > -   while (of_phandle_iterator_next(&it) == 0) {
> > > > > -           rmem = of_reserved_mem_lookup(it.node);
> > > > > -           if (!rmem) {
> > > > > -                   of_node_put(it.node);
> > > > > -                   dev_err(dev, "unable to acquire memory-region\n");
> > > > > -                   return -EINVAL;
> > > > > -           }
> > > > > +   int index = 0, mr = 0;
> > > > > +
> > > > > +   while (1) {
> > > > > +           struct resource res;
> > > > > +           int ret;
> > > > > +
> > > > > +           ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > > > +           if (ret)
> > > > > +                   return 0;
> > > >
> > > > The original code calls rproc_elf_load_rsc_table() [1] after iterating through
> > > > the memory region, something that won't happen with the above.
> > >
> > > Indeed. it needs the following incremental change. It is slightly
> > > different in that rproc_elf_load_rsc_table() is not called if
> > > 'memory-region' is missing, but the binding says that's required.
> > >
> > > 8<--------------------------------------------------
> > >
> > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> > > index 043348366926..cb09c244fdb5 100644
> > > --- a/drivers/remoteproc/st_remoteproc.c
> > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >         struct device *dev = rproc->dev.parent;
> > >         struct device_node *np = dev->of_node;
> > >         struct rproc_mem_entry *mem;
> > > -       int index = 0, mr = 0;
> > > +       int index = 0;
> > >
> > >         while (1) {
> > >                 struct resource res;
> > >                 int ret;
> > >
> > > -               ret = of_reserved_mem_region_to_resource(np, mr++, &res);
> > > -               if (ret)
> > > -                       return 0;
> > > +               ret = of_reserved_mem_region_to_resource(np, index, &res);
> > > +               if (ret) {
> > > +                       if (index)
> > > +                               break;
> > > +                       else
> > > +                               return ret;
> > > +               }
> >
> > This looks brittle and I'm not sure it would work.
> >
> > Going back to the original implementation, the only time we want to
> > "break" is when @index is equal to the amount of memory regions _and_
> > ret is -EINVAL.  Any other condition should return.
> 
> @index equal to number of entries returns -ENODEV, so that condition
> is impossible. We can simply it to this:
> 
> if (ret == -ENODEV && index)
>     break;
> else
>     return ret;

To me this needs to be:

entries = of_reserved_mem_region_count(np); 

...
...

if (ret == -ENODEV && index == entries)
        break;
else
        return ret;

But taking a step back, it might even be easier to go from a while() to a for(),
the same way you did in imx_rproc_addr_init().

> 
> If you want to keep the prior behavior when 'memory-region' is
> missing, then '&& index' can be removed, but I think that was wrong
> behavior.
> 
> Rob
