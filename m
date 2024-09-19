Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A676198A33
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2024 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726734410; cv=none; b=K6C8m3SaIafl4yRTr39pGqshQGiPv6PLOvcvl4Uro1PYtsx/IxE/8FaTI72Sv1jkh8pBy1RoVGx4ckw7JkZfKM9m/R47cZ9vx06dIuE7Ji3h3+3FrYSibP+1nhqvwOfqeyzsalCzjw7EJQcaiXUEdPlK7EQC6Wb7Bay6u3yHWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726734410; c=relaxed/simple;
	bh=SNnSe4+X9+S1zKkLqSUN/kNM3VzSGxHcNmVz8Sr0O1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+0SbY/MpWK4T+ECsb2L+lu83PKpUMsrjxpmsOsRsmtLBgOfd/N7P179CwWPQz+pPUYVgvCgDiQ0hjqGQXB+fVLD/mr299CLeGeuSwNpzWP9UO1tWJZvwDBxl5khu4PLoQln8MSr6LZ7GW52zdpySRVfi/RV2WHuaIBfUlru5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuHyWDCI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuHyWDCI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c40942358eso923640a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Sep 2024 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726734406; x=1727339206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMnmLpa5yTs94EHMp6Tjgq0ksZyXxBury+om39vf0fg=;
        b=QuHyWDCIz2gsEhYKSIeFWVH86Kb3RV9Qprt9yN2ABWYOJ4rQY0LRGXL0GMH/X9RUxX
         npDHWeE/it8VLOjqqKgyLTeA6I08daNMfuO24Dx21vKU4uyHKFhKw/ViCx+mbclFbM2x
         F0Tj2hDqxTg8DWCkLja/e8xfQlyRbbN2Lb3lB9kRyOMIOtV7Z0BBk6cWTghaeVAvio3v
         V6h+6F4ABR3VkDmTShVprIyM6QCpnThebH4UiyQGHNF5h0SQ9DfrL+0FC7dcxYbC6NLz
         OPtEak1rQqrK19jUwEcpflqnDTXLByaPzcWrP3TFW7gYgENPHhwAwfw/LzNTdb6Z0Zlo
         pHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726734406; x=1727339206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMnmLpa5yTs94EHMp6Tjgq0ksZyXxBury+om39vf0fg=;
        b=FZdfgBFO+HR1My/spxl9lUF9VPsgYI3rmYqaXn28sLUcSgY+mjjNTOjD/+DMRjMmPX
         vkoupfxlEvjzGg1cBBg5Yznd4y7iuUo2fVW9ilfpir6p9Qw3AvzHQpX7gaP1jkUBhcgW
         sW6CStomsGeV77v0DE+WT/5osfo3tUo+9xbSjGp06Tn9Vi18qlIGZ0Tf1vo3xkeirE86
         do1DlbSL6d0cbDv7UZJzrw7g3GcwkbuRG5dMp6oZzjxyd3YpA0epLiA50CvycJ44LQMc
         y4IrZ/G4rCCfNGchAxqOTsKqlF7INgerTdF7uB/btx8WxPMR1LTP6t/gBeK3JF9YQQXM
         3meA==
X-Forwarded-Encrypted: i=1; AJvYcCXOJA+VUhhjtrwHYtyj8VX1EknOmNgpIprRXHx7FU3E8kFEBo3jfaoNF4VeMaVUmawsCb520kYMPwZB1IS2YZVt@vger.kernel.org
X-Gm-Message-State: AOJu0YxLR3NMwj5nS8hlmGcDvMyoKPvw75ByLkUgl7Is9OkhQvFip6m/
	a/FVFSL33dznJtwWjTulQJ8s/6WEXE8+jHL0dtFIjqMwj1ZQjSPCpSbBCpgs+eez3bMofyicTuC
	87UV+2zc+UIf6wLPMpJFpK8Nvykva/66xTe9BNg==
X-Google-Smtp-Source: AGHT+IEr9Qngg/re7gFblpHj6r38UjAORdeHgAt3MkjdRpw63qPyVRuVO1/VeRmL1KzoAhdtm+FssF4bjg2tVckZedM=
X-Received: by 2002:a05:6402:430b:b0:5c3:cc44:570a with SMTP id
 4fb4d7f45d1cf-5c459205a2emr2214529a12.2.1726734405755; Thu, 19 Sep 2024
 01:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916083131.2801755-1-s-vadapalli@ti.com> <CANLsYkwTYqfAi+OFg3khMs7VD_PnL=CH-k8HXE71QSdqpR1fvA@mail.gmail.com>
 <fda85c12-e73f-44b8-b66b-1241e417a9b7@ti.com> <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
 <3ca4b2d1-5c47-4f85-969d-cd61c7ade2dc@ti.com>
In-Reply-To: <3ca4b2d1-5c47-4f85-969d-cd61c7ade2dc@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 19 Sep 2024 02:26:34 -0600
Message-ID: <CANLsYkyDro+mDe1c-xB5-ABcoZOHa=iyMUZ9kjD+p4hpEZO=fw@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: k3-r5: Fix check performed in k3_r5_rproc_{mbox_callback/kick}
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>, 
	andersson@kernel.org, b-padhi@ti.com, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	srk@ti.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Sept 2024 at 03:13, Kumar, Udit <u-kumar1@ti.com> wrote:
>
> Hi Mathieu,
>
> On 9/17/2024 2:07 PM, Mathieu Poirier wrote:
> > On Mon, 16 Sept 2024 at 23:20, Kumar, Udit <u-kumar1@ti.com> wrote:
> >> On 9/16/2024 8:50 PM, Mathieu Poirier wrote:
> >>> On Mon, 16 Sept 2024 at 02:31, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> >>>> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
> >>>> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()" and
> >>>> "k3_r5_rproc_kick()" callbacks, causing them to exit if the remote core's
> >>>> state is "RPROC_DETACHED". However, the "__rproc_attach()" function that is
> >>>> responsible for attaching to a remote core, updates the state of the remote
> >>>> core to "RPROC_ATTACHED" only after invoking "rproc_start_subdevices()".
> >>>>
> >>>> The "rproc_start_subdevices()" function triggers the probe of the Virtio
> >>>> RPMsg devices associated with the remote core, which require that the
> >>>> "k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
> >>>> functional. Hence, drop the check in the callbacks.
> >>> Honestly, I am very tempted to just revert f3f11cfe8907 and ea1d6fb5b571.
> >>
> >> Please don't :) , it will break rproc in general for k3 devices.
> >>
> > Why not - it is already broken anyway.  Reverting the patches will
> > force TI to actually think about the feature in terms of design,
> > completeness and testing.  The merge window opened on Sunday - I'm not
> > going to merge whack-a-mole patches and hope the right fix comes
> > along.
>
> Now, I am not advocating here to revert or not.
>
> But where we stand currently
>
> 1-  Without this patch, IPC is broken in general.
>
> 2-  With this patch, IPC is conditionally broken.
>
> In either case, we need to fix it.
>
> your call to revert or keep it.
>

I will keep f3f11cfe8907 and ea1d6fb5b571 but will not take this one
because 1) we are in the merge window and 2) I have no assurance that
this is the right (and complete) fix.

>
> >
> >> Couple of solutions for this race around condition (in mine preference
> >> order)
> >>
> > This is for the TI team to discuss _and_ test thoroughly.  From hereon
> > and until I see things improve, all patches from TI will need to be
> > tagged with R-B and T-B tags (collected on the mailing lists) from two
> > different individuals before I look at them.
>
> Sure we will take care of above
>
> and fair ask on R-B and T-B tags
>
> >
> >> 1) In
> >> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L190
> >> have a check , if probe in is progress or not
> >>
> >> 2)
> >> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L1205
> >> -- correct the state to ON or something else
> >>
> >> 3) Move condition
> >> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/remoteproc_core.c#L1360
> >> before rproc_start_subdevices
> >> <https://elixir.bootlin.com/linux/v6.11/C/ident/rproc_start_subdevices>
> >> calling
> >>
> >>
> >>
> >>>> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
> >>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> >>>> ---
> >>>>
> >>>> Hello,
> >>>>
> >>>> Since the commit being fixed is not yet a part of Mainline Linux, this
> >>>> patch is based on linux-next tagged next-20240913.
> >>>>
> >>>> An alternative to this patch will be a change to the "__rproc_attach()"
> >>>> function in the "remoteproc_core.c" driver with
> >>>> rproc->state = RPROC_ATTACHED;
> >>>> being set after "rproc_attach_device()" is invoked, but __before__
> >>>> invoking "rproc_start_subdevices()". Since this change will be performed
> >>>> in the common Remoteproc Core, it appeared to me that fixing it in the
> >>>> TI remoteproc driver is the correct approach.
> >>>>
> >>>> The equivalent of this patch for ti_k3_dsp_remoteproc.c might also be
> >>>> required, which I shall post if the current patch is acceptable.
> >>>>
> >>>> Kindly review and share your feedback on this patch.
> >>>>
> >>>> Regards,
> >>>> Siddharth.
> >>>>
> >>>>    drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
> >>>>    1 file changed, 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >>>> index 747ee467da88..4894461aa65f 100644
> >>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >>>> @@ -194,10 +194,6 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
> >>>>           const char *name = kproc->rproc->name;
> >>>>           u32 msg = omap_mbox_message(data);
> >>>>
> >>>> -       /* Do not forward message from a detached core */
> >>>> -       if (kproc->rproc->state == RPROC_DETACHED)
> >>>> -               return;
> >>>> -
> >>>>           dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> >>>>
> >>>>           switch (msg) {
> >>>> @@ -233,10 +229,6 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
> >>>>           mbox_msg_t msg = (mbox_msg_t)vqid;
> >>>>           int ret;
> >>>>
> >>>> -       /* Do not forward message to a detached core */
> >>>> -       if (kproc->rproc->state == RPROC_DETACHED)
> >>>> -               return;
> >>>> -
> >>>>           /* send the index of the triggered virtqueue in the mailbox payload */
> >>>>           ret = mbox_send_message(kproc->mbox, (void *)msg);
> >>>>           if (ret < 0)
> >>>> --
> >>>> 2.40.1
> >>>>
