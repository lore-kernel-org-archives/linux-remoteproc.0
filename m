Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F5187FE2
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868889; cv=none; b=t730SlYrUB8812Z8xBQznH5tugYoZoUrbXQBJCy3BYOjCtABf2fU5/7T12ZhZq+GLg0T4typ2yqHbJFSbYeu4JrgZM310IeULS40lk64jJdyTZuOb6KWwg5AOjEcXNlKx2a8slZ93b/OdYNbOBIjxFgp5xwW4PAYmCv4c9IEWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868889; c=relaxed/simple;
	bh=4peeo6Few82Q+xg3xCDJ0t2U0//W1VaWFAFJfBgJGRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsFjzynFpYbxqJP3KBE74uO2mkxvYDFnA7C+1T5iMRZONjaqXehJwtRS5Bw/3YT9kegmdbIv8jYi7OQy4BUPGnbTRGUiay/j+JcsIYZJJrESVpFvc0uYve72JqTvEEBC8slnPSNhqj23wOrwWfhpEBxzRElgKL+QGRKfmB89nFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/lYDKLk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/lYDKLk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c693b68f5so21904865ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868886; x=1730473686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2HS54kY4Dy54FUiR/GFChYcQgtXdPXBZagoZSZxLfpw=;
        b=p/lYDKLkrZmKkAV4TeLnpTVag76u/yUvL84dbgXmYSVfpdmYzi8AVfGlnlxnU69TQP
         l0CkWOmSZrzMDcoZ4IH24tJt3O3rDW5PRcL1APLj8FVgrkPJbEtmJS0ZlBymq6l1bZ8x
         AL4OlHInlAaU4+F53KDkmfr42SScoK++Z2WNdtCtxLEszd9lxuV4l/9k07InZ/9dImBe
         5eifVFmD6nttImzpXX32GGG8HRQZPSR53pajeowN2Lv02SoqMTy74nmuVFcJwDAtN6mx
         WzG/jR0DCOAFAAe+8mMrweLEdnzNCLPJmQnlwHbnoegDop39KvXsnLpbrY+p+J1skNYZ
         nbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868886; x=1730473686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HS54kY4Dy54FUiR/GFChYcQgtXdPXBZagoZSZxLfpw=;
        b=JkMUHpMfRB3O3gJ9nzX5wZjsEmd1s03dXeU/CSlV28RJV7Z9QhLMUG2Dz4PzyJs0f4
         TC2rkM/Z7GbspKXVTEkB4xQNNOBMEDNTSi758lkxb4bR2tftoBPAImqtJopYBDWGhy8B
         U0p4D+AypaaqPdWB8/FjpRzfKYlGqQn1rqOJ33Zdy44L8eHkDpVsB6V7GUmR9Cpo2VJY
         LF0CYaLux3glSDnfrNwEd7aHeb0xLhHgw7o57sllg5xGBM/Vz0xa57fcFOVgAFArm8cF
         eU2Mx1+E1x1duZ1rgJl2w3ZAr61ztgm4K7YMS2tUEq9isZ5ayElMDKy3YWJoimBKvrbM
         cVYw==
X-Forwarded-Encrypted: i=1; AJvYcCV1rNczdncsXCXNs0OMl76OJYfhzX22zBfYwYvPbLtsNOl0roT9o0m5wVV37PIxvxHmJc8zzLwSmj1Xjjhif1Rd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0AccTbVZNoosv2eTNdfeKbMl/mFE5bJZlXTu93nYL/3SpRY80
	PIDB3RHFBGHF+aZknaPokbyo7U/tGolacBOeS0IlEsb595PhHDR8EocJxDs86YA=
X-Google-Smtp-Source: AGHT+IGJIiOTJtt7BklqPSp9+hFnXE4gMEk0XWWZnh/qL/c/sBG0cBkkovZDcuJoVDcCtbUb4QjaXQ==
X-Received: by 2002:a17:902:f693:b0:20c:ee48:94f3 with SMTP id d9443c01a7336-20fa9e0977emr134940625ad.14.1729868885829;
        Fri, 25 Oct 2024 08:08:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:99d9:af10:67fb:8243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b384sm10311025ad.273.2024.10.25.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:08:05 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:08:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <Zxu0U9U+BvTo20Zq@p14s>
References: <20241016045546.2613436-1-quic_mojha@quicinc.com>
 <ZxZvbz9C/eHzosFN@p14s>
 <ZxtShfshsuyVzGx3@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxtShfshsuyVzGx3@hu-mojha-hyd.qualcomm.com>

On Fri, Oct 25, 2024 at 01:40:45PM +0530, Mukesh Ojha wrote:
> On Mon, Oct 21, 2024 at 09:12:47AM -0600, Mathieu Poirier wrote:
> > Hi Mukesh,
> > 
> > On Wed, Oct 16, 2024 at 10:25:46AM +0530, Mukesh Ojha wrote:
> > > Multiple call to glink_subdev_stop() for the same remoteproc can happen
> > > if rproc_stop() fails from Process-A that leaves the rproc state to
> > > RPROC_CRASHED state later a call to recovery_store from user space in
> > > Process B triggers rproc_trigger_recovery() of the same remoteproc to
> > > recover it results in NULL pointer dereference issue in
> > > qcom_glink_smem_unregister().
> > > 
> > > There is other side to this issue if we want to fix this via adding a
> > > NULL check on glink->edge which does not guarantees that the remoteproc
> > > will recover in second call from Process B as it has failed in the first
> > > Process A during SMC shutdown call and may again fail at the same call
> > > and rproc can not recover for such case.
> > > 
> > > Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of
> > > remoteproc and the only way to recover from it via system restart.
> > > 
> > > 	Process-A                			Process-B
> > > 
> > >   fatal error interrupt happens
> > > 
> > >   rproc_crash_handler_work()
> > >     mutex_lock_interruptible(&rproc->lock);
> > >     ...
> > > 
> > >        rproc->state = RPROC_CRASHED;
> > >     ...
> > >     mutex_unlock(&rproc->lock);
> > > 
> > >     rproc_trigger_recovery()
> > >      mutex_lock_interruptible(&rproc->lock);
> > > 
> > >       adsp_stop()
> > >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> > >       remoteproc remoteproc3: can't stop rproc: -22
> > >      mutex_unlock(&rproc->lock);
> > 
> > Ok, that can happen.
> > 
> > > 
> > > 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> > > 						recovery_store()
> > > 						 rproc_trigger_recovery()
> > > 						  mutex_lock_interruptible(&rproc->lock);
> > > 						   rproc_stop()
> > > 						    glink_subdev_stop()
> > > 						      qcom_glink_smem_unregister() ==|
> > >                                                                                      |
> > >                                                                                      V
> > 
> > I am missing some information here but I will _assume_ this is caused by
> > glink->edge being set to NULL [1] when glink_subdev_stop() is first called by
> > process A.  Instead of adding a new state to the core I think a better idea
> > would be to add a check for a NULL value on @smem in
> > qcom_glink_smem_unregister().  This is a problem that should be fixed in the
> > driver rather than the core.
> > 
> > [1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/drivers/remoteproc/qcom_common.c#L213
> 
> 
> I did the same here [1] but after discussion with Bjorn, realized that
> remoteproc might not even recover and may fail in the second attempt as
> well and only way is reboot of the machine.

Whether in RPROC_CRASHED or RPROC_DEFUNCT state, the end result is the same -
manual intervention is needed.  I don't see why another state needs to be added.

> 
> [1]
> https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
> 
> > 
> > > 						      Unable to handle kernel NULL pointer dereference
> > >                                                                 at virtual address 0000000000000358
> > > 
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > ---
> > > Changes in v3:
> > >  - Fix kernel test reported error.
> > > 
> > > Changes in v2:
> > >  - Removed NULL pointer check instead added a new state to signify
> > >    non-recoverable state of remoteproc.
> > > 
> > >  drivers/remoteproc/remoteproc_core.c  | 3 ++-
> > >  drivers/remoteproc/remoteproc_sysfs.c | 1 +
> > >  include/linux/remoteproc.h            | 5 ++++-
> > >  3 files changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index f276956f2c5c..c4e14503b971 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> > >  	/* power off the remote processor */
> > >  	ret = rproc->ops->stop(rproc);
> > >  	if (ret) {
> > > +		rproc->state = RPROC_DEFUNCT;
> > >  		dev_err(dev, "can't stop rproc: %d\n", ret);
> > >  		return ret;
> > >  	}
> > > @@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
> > >  		return ret;
> > >  
> > >  	/* State could have changed before we got the mutex */
> > > -	if (rproc->state != RPROC_CRASHED)
> > > +	if (rproc->state == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
> > >  		goto unlock_mutex;
> > 
> > The problem is that rproc_trigger_recovery() an only be called once for a
> > remoteproc, something that modifies the state machine and may introduce backward
> > compatibility issues for other remote processor implementations.
> > 
> 
> I missed one more point to add here which i tried to highlight in second
> version[2] that setting of RPROC_DEFUNCT should happen for this case
> from vendor remoteproc driver and not at the core and that should take
> care of the backward compatibility.
> 
> [2]
> https://lore.kernel.org/lkml/Zw2CAbMozI8vu4SL@hu-mojha-hyd.qualcomm.com/
> 
> -Mukesh
> 
> > Thanks,
> > Mathieu
> > 
> > >  
> > >  	dev_err(dev, "recovering %s\n", rproc->name);
> > > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > > index 138e752c5e4e..5f722b4576b2 100644
> > > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > > @@ -171,6 +171,7 @@ static const char * const rproc_state_string[] = {
> > >  	[RPROC_DELETED]		= "deleted",
> > >  	[RPROC_ATTACHED]	= "attached",
> > >  	[RPROC_DETACHED]	= "detached",
> > > +	[RPROC_DEFUNCT]		= "defunct",
> > >  	[RPROC_LAST]		= "invalid",
> > >  };
> > >  
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index b4795698d8c2..3e4ba06c6a9a 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -417,6 +417,8 @@ struct rproc_ops {
> > >   *			has attached to it
> > >   * @RPROC_DETACHED:	device has been booted by another entity and waiting
> > >   *			for the core to attach to it
> > > + * @RPROC_DEFUNCT:	device neither crashed nor responding to any of the
> > > + * 			requests and can only recover on system restart.
> > >   * @RPROC_LAST:		just keep this one at the end
> > >   *
> > >   * Please note that the values of these states are used as indices
> > > @@ -433,7 +435,8 @@ enum rproc_state {
> > >  	RPROC_DELETED	= 4,
> > >  	RPROC_ATTACHED	= 5,
> > >  	RPROC_DETACHED	= 6,
> > > -	RPROC_LAST	= 7,
> > > +	RPROC_DEFUNCT	= 7,
> > > +	RPROC_LAST	= 8,
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.34.1
> > > 
