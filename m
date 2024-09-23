Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5701CA84
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Sep 2024 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727104418; cv=none; b=Lko3SfOpHrebcM9oQLlCPhVq0edHrF8HjV6hGGXDLXFdKCxhCR3WwDcJ08WxHcmf8VDUzVbd5ks1IP/PZObUAglXnzNJkffVhwuDy3aRURkB3Q6+kSKjyxsqdutXNlO7qIOfmDLdL8q8V5mcufpiO517DHSVguniHbakdPPbstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727104418; c=relaxed/simple;
	bh=LdNQWv3v1NvYgfpmz4wdY2LjrWp4bVtaEPEaZTyhDj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhuZCByUEpNUulo3brLns0emZEebqyCiNe+AF69R46Ye+ftpRu0yGrPd9JFbZumM4AqCs2pWzj/OgkAJysyw3lF++L5bb47iQXss8GEUcGV0njdi538fw8N9u86aJOBE8kEZkbwtpOET+ehZVlmOQXAw3nwOsW1Ixl/kadDeNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vff0c58n; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vff0c58n"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e6b32959easo156212a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Sep 2024 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727104416; x=1727709216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHlnbW3NKllRcJspO1pNGsF1SNs+MNN94ks3ff4dHtw=;
        b=vff0c58nfwFwdGciqSu4uhseCmk7QYSNDvDJ58oaHe21dRwdcWbgHUEkSF8N59bEcV
         BQ1TSEVj0G0CWhXKaPNCL9ja3a3H0+H+xrljWOve+/ofwr+rrOfci3rbBPVibSIR2kUC
         g0FGc5R8msot0xtltFzBWDiNZa8tkfsLteyxwLjcNWuUeYQtnVvKZ5hyBwTjhTENmJPh
         NUHyu5bCUY+DsMvbX4+RLp0LQaybNjgxmH16L2t42zsdC9NfusZRbZ3WWDcQ6mvhriiE
         aPtkPFW9+bwC1HA6cRXXPM3Bq5tEJFSEViDe5f/uyQzfAh8PwPurFvImLmxwDrmX9ifT
         X+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727104416; x=1727709216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHlnbW3NKllRcJspO1pNGsF1SNs+MNN94ks3ff4dHtw=;
        b=bTuplbWRDgGRxr/wbHgFjQWlZtckBRJ8DHlNHfLO48/jZJlEDWv8UsFP1EVpvxPXMA
         wtiiC7hdwe0wMeVkREYcI6jUw+S4ZbXWT8QxVqQom9RSWVh4yhrITMFjOm1G7rqxExuE
         XTWWBAOVWlJa8Ke5Zkp02FyTTJ1Rf+km6Zw9USiNuo2TZeZc/Ps4wbTcaya77lQEdCmR
         7G3p25ZJ8//fJptVFo3Xwl8oDyGMTZD8AkLuITAQCn+2zjFcsRCfkFJW8gkAZJ/uypg6
         t65c1vM8j9K3pLGmcDWHhb8xiWNXmB1aVE+GxdxLOEc915aJmdGNn1l6+AQ0qqK0vWZt
         +1dw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHjCdHNAiU2yTSx5jRlo/Jj/YshcNxirB0AIsluw6KPNgqfCanWk1Ya28DHGpUXLRWyj4M2TGYqlTaKnKFIYv@vger.kernel.org
X-Gm-Message-State: AOJu0YwTl48b5WF0ONmmsYNnZ+tNDhl3G5U7V3vC/DcelCQe9H3JOEut
	oDoiNnjY5NUYUCVW1wNrbLP6iM5POvAmGP2V/pmhuwzx0mgnGe/Jbwnnk8KGGAY=
X-Google-Smtp-Source: AGHT+IFbJhoxbZDPUB8xpdXKh4oBW7cnyX/oVOpugsG4Ru3LqNxXMRMWf4XdpOaiA2LQuH5+9FEH5A==
X-Received: by 2002:a05:6a21:3414:b0:1d2:ba7c:d8cf with SMTP id adf61e73a8af0-1d30c989839mr15685241637.7.1727104416169;
        Mon, 23 Sep 2024 08:13:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7512:bc48:5403:2376])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e51sm13955025b3a.162.2024.09.23.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 08:13:35 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:13:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
Message-ID: <ZvGFnKd3RkVY9Wb0@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <fabec69a-3b3a-4068-8906-7996cf125c0b@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabec69a-3b3a-4068-8906-7996cf125c0b@foss.st.com>

On Wed, Sep 18, 2024 at 04:43:32PM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 8/30/24 11:51, Arnaud Pouliquen wrote:
> > Add support for releasing remote processor firmware through
> > the Trusted Execution Environment (TEE) interface.
> > 
> > The tee_rproc_release_fw() function is called in the following cases:
> > 
> > - An error occurs in rproc_start() between the loading of the segments and
> >   the start of the remote processor.
> > - When rproc_release_fw is called on error or after stopping the remote
> >   processor.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 7694817f25d4..32052dedc149 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/debugfs.h>
> >  #include <linux/rculist.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc_tee.h>
> >  #include <linux/iommu.h>
> >  #include <linux/idr.h>
> >  #include <linux/elf.h>
> > @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> >  
> >  static void rproc_release_fw(struct rproc *rproc)
> >  {
> > +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> > +		tee_rproc_release_fw(rproc);
> 
> I'm requesting you expertise to fix an issue I'm facing during my test preparing
> the V10.
> 
> My issue is that here, we can call the tee_rproc_release_fw() function, defined
> in remoteproc_tee built as a remoteproc_tee.ko module.
> 
> I tried to use the IS_ENABLED and IS_REACHABLE macros in remoteproc_tee.h, but
> without success:
> - use IS_ENABLED() results in a link error: "undefined reference to
> tee_rproc_release_fw."
> - use IS_REACHABLE() returns false and remoteproc_core calls the inline
> tee_rproc_release_fw function that just call WARN_ON(1).
> 
> To solve the issue, I can see three alternatives:
> 
> 1) Modify Kconfig and remoteproc_tee.c to support only built-in.
> 2) Use symbol_get/symbol_put.
> 3) Define a new rproc_ops->release_fw operation that will be initialized to
> tee_rproc_release_fw.
>

Option (1) is best but make sure people can disable the TEE interface if they
don't wish to use it.

> From my perspective, the solution 3 seems to be the cleanest way, as it also
> removes the dependency between remoteproc_core.c and remoteproc_tee.c. But
> regarding previous discussion/series version, it seems that it could not be your
> preferred solution.
> 
> Please, could you indicate your preference so that I can directly implement the
> best solution (or perhaps you have another alternative to propose)?
> 
> Thanks in advance!
> 
> Arnaud
> 
> 
> > +
> >  	/* Free the copy of the resource table */
> >  	kfree(rproc->cached_table);
> >  	rproc->cached_table = NULL;
> > @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	if (ret) {
> >  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> >  			rproc->name, ret);
> > -		goto reset_table_ptr;
> > +		goto release_fw;
> >  	}
> >  
> >  	/* power up the remote processor */
> > @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	rproc->ops->stop(rproc);
> >  unprepare_subdevices:
> >  	rproc_unprepare_subdevices(rproc);
> > -reset_table_ptr:
> > +release_fw:
> > +	if (rproc->tee_interface)
> > +		tee_rproc_release_fw(rproc);
> >  	rproc->table_ptr = rproc->cached_table;
> >  
> >  	return ret;
