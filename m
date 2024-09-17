Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE115D5C5
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Sep 2024 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726562253; cv=none; b=iAUhdciCBUrIc7XyfuHoQkbEJ/I9RtlXOi9DbUlsJcRFWjup3GIklzRUjw77m6fNi5GgEJhnfJqAxej3/yJXlVXxddf76M9orVexeahgjNQrUjh0vVUOHyU4Pfnmd0feBGlA8OtLgQTRrj6rhYvEy/TWtH8W8BPTIRHXCRDnPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726562253; c=relaxed/simple;
	bh=vkTfWEv1p87r8ENqhmzFzFp3lqpgHtlSvjpfe4VSQWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+nP4DSBG8AF0DWG+zduyoLIiM9P/MV2/Nq2S27Vcb1E2+MNYbB+qbBNlKjNUupRsEY2Z9hO3DHyvMiLF5A8l5UbYIfpvZZBln/c2s38Psm9ABckRT0mMlQH51tJwPecnMn4GC0f49un5lIpLSVPrNFZ8bixDCEZY5YiGnG74UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/+jwhXH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/+jwhXH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a706236bfso289812366b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Sep 2024 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726562238; x=1727167038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7wFLbxZR/AUMoD3yFvr7pHF33BoVAx7GBIvilNEGlHw=;
        b=c/+jwhXHeSXaqnAWugsWtcDgnWLYZUhozH31aBPIiBmaI/gh+YkzV0QIYOQ2AJ/qGG
         x6DPE29QFFXBSOq+iwS8AJrz9UZotqdUQSZQel1XoQ1XfG752nmSrm69sH0vLIh/Lebk
         IwK96YgNOS9XqZ52axZ6h/BLauAaxdsZfQenqksQhj0Fv607tHx4ebE8M7yYNT+DBBFW
         Vn5UwEvI8mG4+LUA+FhS9HZX5sB5579/1qTZdFgLhL+zFKF8QU1PV6NoXUdxNtW9brs8
         BlTURs06g1IechTNO35vsK5qD7HkW5h9Rg4DyJFYdUnkpsEM8H4ZaaE7PD3bNV6btqJw
         /fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726562238; x=1727167038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wFLbxZR/AUMoD3yFvr7pHF33BoVAx7GBIvilNEGlHw=;
        b=KOUmwPbR8JSIEifLXNDEv+KZsb4Apln3q9CVmVUJwoRZMBWC6FfjXWxbnL0chzDb4z
         fVhgbgU/Ymt+kPn0mtXioOc8tLAAyffivD+/9O1ZLtpir17AxwO2WdIWYHkm0f1squQ8
         K+03x46hiFHA5fjWUa9BHTWefK9C1sOyrz5fyezJKjHhtUdhts2FIn49Q7ZJGl4GXlpT
         i4dfzBrgPe1upm2kD778kpCsdH0riYo8+wzZL1R7tI8S2I3zI88xJX5KufwLESWOwJnc
         BIu2GK5kHC4eUEHCmaaAocVpSSTCxffPxevvOLSOKYFkzZXnsYCOUC82OHMazi1r/2DQ
         1Kuw==
X-Forwarded-Encrypted: i=1; AJvYcCU8lCGg+LZ2O0QKYLMHXELp+OOZhrq1Px5mhE0GTv9z9aSY71bRjcIRW/xhteYxTbjZxuhtpxDpb3i4HOlNxGCy@vger.kernel.org
X-Gm-Message-State: AOJu0YzYXVyUPZ4D406l3oUngyi6J0ggCA7hcxqRkQLzgPgKGER8RZIc
	NSSIdKrGX/NzYSsajfUO5+aHqsKd71sHJdYWHAmCzoBOj4hl/SO/qvZNNxgc6rnwKsRzHATFZBX
	Q4F4eK0VYZwzO7x/MyTunCQrzM4gOemlyk/mFNg==
X-Google-Smtp-Source: AGHT+IFCcpyArmdqkZssE8o3eOmTVnWNAEAOEwL0jL2Mf21ARGUdRzigqaQPpatmalmg/h/zqJ+wN3fg+HwHHUgJbfY=
X-Received: by 2002:a05:6402:5108:b0:5c2:6311:c9d1 with SMTP id
 4fb4d7f45d1cf-5c41e1b5325mr20977024a12.22.1726562237988; Tue, 17 Sep 2024
 01:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916083131.2801755-1-s-vadapalli@ti.com> <CANLsYkwTYqfAi+OFg3khMs7VD_PnL=CH-k8HXE71QSdqpR1fvA@mail.gmail.com>
 <fda85c12-e73f-44b8-b66b-1241e417a9b7@ti.com>
In-Reply-To: <fda85c12-e73f-44b8-b66b-1241e417a9b7@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 17 Sep 2024 02:37:05 -0600
Message-ID: <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: k3-r5: Fix check performed in k3_r5_rproc_{mbox_callback/kick}
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>, 
	andersson@kernel.org, b-padhi@ti.com, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	srk@ti.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Sept 2024 at 23:20, Kumar, Udit <u-kumar1@ti.com> wrote:
>
> On 9/16/2024 8:50 PM, Mathieu Poirier wrote:
> > On Mon, 16 Sept 2024 at 02:31, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> >> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
> >> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()" and
> >> "k3_r5_rproc_kick()" callbacks, causing them to exit if the remote core's
> >> state is "RPROC_DETACHED". However, the "__rproc_attach()" function that is
> >> responsible for attaching to a remote core, updates the state of the remote
> >> core to "RPROC_ATTACHED" only after invoking "rproc_start_subdevices()".
> >>
> >> The "rproc_start_subdevices()" function triggers the probe of the Virtio
> >> RPMsg devices associated with the remote core, which require that the
> >> "k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
> >> functional. Hence, drop the check in the callbacks.
> > Honestly, I am very tempted to just revert f3f11cfe8907 and ea1d6fb5b571.
>
>
> Please don't :) , it will break rproc in general for k3 devices.
>

Why not - it is already broken anyway.  Reverting the patches will
force TI to actually think about the feature in terms of design,
completeness and testing.  The merge window opened on Sunday - I'm not
going to merge whack-a-mole patches and hope the right fix comes
along.

> Couple of solutions for this race around condition (in mine preference
> order)
>

This is for the TI team to discuss _and_ test thoroughly.  From hereon
and until I see things improve, all patches from TI will need to be
tagged with R-B and T-B tags (collected on the mailing lists) from two
different individuals before I look at them.

> 1) In
> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L190
> have a check , if probe in is progress or not
>
> 2)
> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L1205
> -- correct the state to ON or something else
>
> 3) Move condition
> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/remoteproc_core.c#L1360
> before rproc_start_subdevices
> <https://elixir.bootlin.com/linux/v6.11/C/ident/rproc_start_subdevices>
> calling
>
>
>
> >
> >> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
> >> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> >> ---
> >>
> >> Hello,
> >>
> >> Since the commit being fixed is not yet a part of Mainline Linux, this
> >> patch is based on linux-next tagged next-20240913.
> >>
> >> An alternative to this patch will be a change to the "__rproc_attach()"
> >> function in the "remoteproc_core.c" driver with
> >> rproc->state = RPROC_ATTACHED;
> >> being set after "rproc_attach_device()" is invoked, but __before__
> >> invoking "rproc_start_subdevices()". Since this change will be performed
> >> in the common Remoteproc Core, it appeared to me that fixing it in the
> >> TI remoteproc driver is the correct approach.
> >>
> >> The equivalent of this patch for ti_k3_dsp_remoteproc.c might also be
> >> required, which I shall post if the current patch is acceptable.
> >>
> >> Kindly review and share your feedback on this patch.
> >>
> >> Regards,
> >> Siddharth.
> >>
> >>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
> >>   1 file changed, 8 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> index 747ee467da88..4894461aa65f 100644
> >> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >> @@ -194,10 +194,6 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
> >>          const char *name = kproc->rproc->name;
> >>          u32 msg = omap_mbox_message(data);
> >>
> >> -       /* Do not forward message from a detached core */
> >> -       if (kproc->rproc->state == RPROC_DETACHED)
> >> -               return;
> >> -
> >>          dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> >>
> >>          switch (msg) {
> >> @@ -233,10 +229,6 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
> >>          mbox_msg_t msg = (mbox_msg_t)vqid;
> >>          int ret;
> >>
> >> -       /* Do not forward message to a detached core */
> >> -       if (kproc->rproc->state == RPROC_DETACHED)
> >> -               return;
> >> -
> >>          /* send the index of the triggered virtqueue in the mailbox payload */
> >>          ret = mbox_send_message(kproc->mbox, (void *)msg);
> >>          if (ret < 0)
> >> --
> >> 2.40.1
> >>
