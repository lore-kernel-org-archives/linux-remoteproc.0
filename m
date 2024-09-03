Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1957581B
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Sep 2024 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373972; cv=none; b=qdUwyK/yZD7kvb9AH4u+gFJkxwF8FqkLztIAk/USI/1pc0k5MESjmldAtv81507jCEuOE8gK0DGgb7jZYdxxR0ipwbanIJHpCOndGh8+xnOE81tXrgt/ssS8fX8/oP6h5CD2AaZ6M/PbOco4H4Svrk03MNYWw5iFJm0Wy1lOvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373972; c=relaxed/simple;
	bh=3NYB37O3R9YiG6QSPIMVcXeGErTw9KUagPZ6nHR8UiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEBt9DaYAyAbOehp5XHODFYdQNcRyu3xioW+X11PJ70SEklq8LDcHytD1sReXsllTiRWObfG7L+e5fB7OSsaTk0ZAtQRUwYqKn+/Z67sBZLHyC/Mbcom+8WpSEtENTz71PeEzwX2VYjCZwSD8mlaquffhjzvs8SndWy2ttVEpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dc89M94v; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dc89M94v"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so710710a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Sep 2024 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725373969; x=1725978769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55Opw2LoBYgIb7dsZXRiPDb5CcbeKPiDbF6ZSpw6/ho=;
        b=dc89M94vzwsU3xOJdCrICzdBF8yL/39GkHOjCnbPGh4nXeYuouTMC66AHLtVTwz0Fd
         q97qEzDdKDFEamgw/oDI8GAeSVbQ/Vu4KJt/pyarimblDusNrXTnwY9uYBSc3o0Ypd88
         h5wE4989lU+UXFG/XYrMKIuJLTToSJ3QH9P9NuL8k0/02jVb7s3oMmoUuqVxVbrBwUJS
         kXeeYGms66CPYs7o8srYLCdhZcqrA5LvwErl5p0cSemBHybCBrOcTncSD4GTwldScsLr
         go8WUD7QKW1l2th69B9NiIU3+Jt9CEvoV984mHGVyuR2pjH/VMjb4qHQRuDSOd0IQuvq
         glHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373969; x=1725978769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55Opw2LoBYgIb7dsZXRiPDb5CcbeKPiDbF6ZSpw6/ho=;
        b=tc+WqqNE8T/Sn8gs/AjbdrPo9XZOo6d8e7xpTJrIQLlbEAmDU42tbPcqNSoOjir9lq
         hDKbyJ9HYBJhjxVCMYShq2luMvxsvRqYbAztAODgYVcxjPLZ6zahMkUfNfNEFSvYQo1h
         Vj07b3uwFcuDKpUfkih3k5h/I4D/zNOA7HHoCWYKsWP19NHqQjZxN/DY1lObBkClWZbg
         +y1L2/s+LFSLOItu/e7Kyz1DvLZtvWRPrI6tYmzWSPIZxVVrFNnnGmKFtX8wte3pyKDz
         fH8MW8XGmqhu2kzdCKOIf7G8C1rKmHv9VMeGU1Fawbf0yb3oAGR/t8C4TrRY8bB+TxYk
         3yLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy6jgoNz8vc4jxzpI3iuDwvLryVWu3x34fWYmrl8TO5wpH/VBjzhv8M/2sLUTIQztOPqtV4KOotUfCgrCy5Jq4@vger.kernel.org
X-Gm-Message-State: AOJu0YzToGPg0cXepAGVqBTjRRaFUo3qV6b4/R00Rz854v9gbbl2n+ly
	3Zzt0rF+B+cA51N2pvCS/4cARofW4igt4ZBXx/lF081eCyCksAOOFZDJp1djDtijeTpATnpyWnn
	P2dWzfSSRihNtqYs4oZ+f0p3Og3dk4Vm6inAjBw==
X-Google-Smtp-Source: AGHT+IGedt9kw2KGALBV+62OSvR+nilmJxqwNYVWOjk8DXOtccnyl0Je1vILxyNdMm+W++xzApGTs5bdjpJmA/nBUgA=
X-Received: by 2002:a05:6402:27c7:b0:5c2:5620:f72 with SMTP id
 4fb4d7f45d1cf-5c2562011e0mr5909505a12.0.1725373968445; Tue, 03 Sep 2024
 07:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820105004.2788327-1-b-padhi@ti.com> <522affaa-47ad-4834-be3c-acdd04902821@ti.com>
In-Reply-To: <522affaa-47ad-4834-be3c-acdd04902821@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 3 Sep 2024 08:32:37 -0600
Message-ID: <CANLsYkzfpO4dcF=xkfZRo8ekCOzyNwvjHkwu8t5T58B2hV8-AQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: k3-r5: Delay notification of wakeup event
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 04:15, Beleswar Prasad Padhi <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> On 20-08-2024 16:20, Beleswar Padhi wrote:
> > From: Udit Kumar <u-kumar1@ti.com>
> >
> > Few times, core1 was scheduled to boot first before core0, which leads
> > to error:
> >
> > 'k3_r5_rproc_start: can not start core 1 before core 0'.
> >
> > This was happening due to some scheduling between prepare and start
> > callback. The probe function waits for event, which is getting
> > triggered by prepare callback. To avoid above condition move event
> > trigger to start instead of prepare callback.
> >
> > Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
>
>
> Please put this patch on hold. I have some additional changelog that
> should go in v3.
>

I applied this patch a couple of weeks ago - are those changes to the
code?  If so please send another patch on top of rproc-next.

> Thanks,
> Beleswar
>
> > Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> > [ Applied wakeup event trigger only for Split-Mode booted rprocs ]
> > Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > ---
> > v2: Changelog:
> > * Mathieu
> > 1) Rebased changes on top of -next-20240820 tag.
> >
> > Link to v1:
> > https://lore.kernel.org/all/20240809060132.308642-1-b-padhi@ti.com/
> >
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > index 8a63a9360c0f..e61e53381abc 100644
> > --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > @@ -469,8 +469,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
> >                       ret);
> >               return ret;
> >       }
> > -     core->released_from_reset = true;
> > -     wake_up_interruptible(&cluster->core_transition);
> >
> >       /*
> >        * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
> > @@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >               ret = k3_r5_core_run(core);
> >               if (ret)
> >                       return ret;
> > +
> > +             core->released_from_reset = true;
> > +             wake_up_interruptible(&cluster->core_transition);
> >       }
> >
> >       return 0;
