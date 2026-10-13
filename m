Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB83530DF4
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904713; cv=pass; b=g0+Xna95llnWSD3vjQqM9V7q6XEBFonRzocV8r47uEQFEF5yEolB6wTM1BSRf0ZE+quZ+GqYUrfDMnZfNrEK1lMPyb4cQcGc6fMMHe9eu3jUfWGrCIwukX5kw/vjsItjAIZXCS+PIeNsBLVdKHAGcBYdtlKFCLFkW5PS5kcV028=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904713; c=relaxed/simple;
	bh=2Jsv0BRyroaUKtuN9tRNv/ahrTnvXTbR+DCRXc0RRpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBou5D1XXzwcCqIcjdG0BfnXDz/ONaPhGSINGv+Fv3fMHF4v+Hu4BMb4PCrrIPNbD2AB3Um+8/qNfrt9zRCGwe/2i9uJwjQsJj04UPZkBJ/+caPVPnNZKSAHT77rra1AkMG3fjs3mnZgBvzOth1gGxLxPva2E1ZFfB46UlDT1wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqFHI9JS; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqFHI9JS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso4454339a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904710; cv=none;
        d=google.com; s=arc-20260327;
        b=e++tpVBepxXJ4i0R29kXVP+RTc1mGfvcGtrhiHzgDbKHMk78XwHBIo3STOWccPLZ3V
         SCSwu7sjF+HAXMZ5oVQt1WrRY5cjUzVzbyF+8ocytV172wyJ6XZo7hMXPBUzNNkI2GDw
         vTtdyzwfP10Y21C6Wm0fQINYR2+0UIUZpbdYaoU3TFF5y0ZHIGM3VgY6lTl7jh3FWE3A
         ni1MgdTpEZ2l9dc2x9rHMS3/3JdX16PU3GfctkO79g/85sVkIiTQTvDzzyqioCIoXHJv
         eoMj3nJ1fRkRGekYK2yZGEKnQhhGue3BuTDEsJ/GvM2guHKAK6Cs2fcWZm01l8mv1jHO
         rYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        fh=gSrFOeLyH3XepzJTfPlcLjepgYBk5bi/Fn0jv0hb/ho=;
        b=aTrCOo2F9zEG/hbySQspEjlgN5XbYvM8fV1cwsreGUvKF9F8X/KykVDmat07IE4rxa
         K4CPnnVFkC+KTUZag5NLwrEUVaoH9jBDZUcxqGB17ZbQX/Un8cmK8d0D/jw1UKNWsYuy
         tdoSd8OcAdZG4scrmyqxWCTvMGAw+WYpF/r/eRWWQ+UNvfGLLlypbWj6ULYTWIyGggGg
         n8qXomZsjVii9f32sEkfdrPGGa4XaD3Kxib0N6eQqpQchVWukGP5UdDfxImwuc+oBWjb
         LxG7zD9N4sapEZBcn3UIwW2sHmiEbNypQxShLNTOyz7dQN7BU+RxDe3UnYEdaippAvRh
         3syg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791904710; x=1792509510; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        b=KqFHI9JSR/Z6QMRlESwTD8Y9uvEhZ5TZgbAXrYlckf7rTxprCS63CsUyoKxWZXfNVf
         8wRdmek38p/5w2O1ZQTkuH4kLiwVI8OfWo0vZpkWQ/RGq2VTpYWPT7p1i/8jrdc4nm0o
         Y8XK9hK4+XH0tinbgxVhuu+jAj+hPD8/vWLyCMpi9yQHDX4sn+l0pSVCRI4hciWVs6DH
         SpZz30LjuNTugHd9mcnZmn9Pkfn/2AkdE4DjAjmGKmCfbPAS3S50El3UK7p3TBNPH1h2
         RNArOXB2P7KqDUoE8ZDpBd80A9BUBAWH+ganvfnIwJkb6oTgLSnWZIsr/0po19XQ67Nl
         ntIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904710; x=1792509510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        b=ix9opWV6vuReX5nQpp+jVe29wzJQ7u5tO4oub1Z95StrtUqC7gkEvnjO6wCkonDowK
         aqrk1axkV8G3sUXpifTY0VlzYu1BTldm4bRyWNmb0titk6/fVlbd+andV74sd4M2CrVb
         rE68Rx3HTl+ceHgot5PvlOk2k1CINHxG+Ui4hZJBzOBu14VYrsXnF5tbDs+Mz6qRo/V1
         66XjpbRtm1F2cmsURdigPtHPpa1hHeXsvOFkDlqP1dNgKGZBIGrphUqFz5Xb73520zl2
         +9lt2WxM82gYIRkSkSwI0egHIz367p0e7eZXJDhXPTLzmAly0iJZmcQq2fUDqD3g/rfu
         IF/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIVSHh8CjANc/C0xoa3GMWPXfy5gE4snNJDw9aBUXIQy9Kf1jaAiR4ade1CFCtf+meYrRj6HKsohxVycjjZ+VY@vger.kernel.org
X-Gm-Message-State: AFq9FYLU+pEPt9z8sH6XIkX115GYwITD2h9F1sIdF3bklmdZuqvKmErZ
	tdqMxAlWV2Haw87KWGx7iKwIwwTgsMSxyMJ27py9eCTdFpvGLjTIr7TKgTMHAeH1xPcG2ELCU7k
	GsyjpcLJZiZBpr3DRrqBZGsGtCW7VauP+M1UEetFgww==
X-Gm-Gg: AYBFou2u/rAmxpvRM4yIkPyc2rK108InCOuQYMpGM0unqgj7USzpsxq91Mj6ViNL1nU
	jy8qUJqS0Omv5eLdu6cJNodHW0jCgF5s6kpk5wKlhg18T4S4XaDoonmtZYUBHYWQdqCFins8/m9
	NTNTgsyXTyQucvA62gfTqnEXvEEjEeRG6jG4qLPpTbaVDldZFdPUzAadbyey9c0kWGp+7R9yufI
	TYG6wbobbSMtNAFLxr9mlXTlBsAjr46PvNfZDVmJVFkYBwhEvLRRVXpG7CVOAeTdTz06kiwhyUt
	HazyfzMSTKyp11lLsyaskROQ6fz0Kze86M3QtBfxDGJ4Uzw2aNI4ShGUCIIun6IkBRbcVaCYm3C
	SaUksb5mJRPEzRjUi20AYQKir
X-Received: by 2002:a05:6402:a0d3:b0:6b1:c49c:c0d with SMTP id
 4fb4d7f45d1cf-6b1c49c109fmr4178015a12.27.1791904708391; Tue, 13 Oct 2026
 08:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929075453.2324597-1-hyz3367@gmail.com> <20261013140721.fbmsl2xn4xi5ljn6@gmail.com>
In-Reply-To: <20261013140721.fbmsl2xn4xi5ljn6@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:18:16 -0600
X-Gm-Features: AclHuK-NLU3gQe10W-ZbOyAwC_kGN7Z8CPvZmyr5136BNSmzjxHJLWY65oGxuIU
Message-ID: <CANLsYkyvF9Z_7uFJ9Z-8cXV9RbX+mQthKOKcuCCj+ps7L3vBNw@mail.gmail.com>
Subject: Re: [PATCH 0/4] remoteproc: core: Fix the error unwind paths
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 08:09, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 03:54:49PM +0800, Yonghao Zhang wrote:
>
> Hi Mathieu,
>
> Gentle ping on this series: it makes rproc_free_vring() reset freed
> vring entries to FW_RSC_ADDR_ANY, guards the error-path stop() call
> in rproc_start() against implementations without stop(), rolls a
> failed attach back with detach() when available, and releases the
> resources and power references left behind by a failed recovery.
>
> Happy to provide anything else you need.

Your patchset is in my queue for review.  Unfortunately there is some
backlog caused by remoteproc/virtio patches that needed more time to
review and attending Linux Plumbers last week.

>
> Thanks,
> Yonghao
>
> > The remoteproc core unwinds failed boots, failed attaches and failed
> > recoveries in a handful of places, and those paths have drifted over
> > the years: an unconditional stop() here, a missing cleanup there, a
> > reset value a running remote processor could misread.  This series
> > fixes four of them.  The success paths are untouched, and no in-tree
> > driver changes behaviour when nothing fails.
> >
> > The single-sided ops configuration that two of the patches guard
> > against is not hypothetical.  Version 9 of the TI k3 refactor series
> > briefly introduced it [1]: ti_k3_dsp registered in IPC-only mode
> > with start() kept and stop() cleared, on the reasoning that
> > rproc_attach() never invokes start().  The shape sat on the list for
> > a month before the rework that finally landed removed the ops
> > overrides altogether (commit 41d746b3423a ("remoteproc: k3-dsp: Don't
> > override rproc ops in IPC-only mode")).  The point stands: nothing in
> > the core would have caught the intermediate version, and a driver
> > sent today with the same single-sided ops would pass rproc_validate()
> > just the same.
> >
> > Patch 3 mostly benefits the attach-on-recovery users (imx_rproc when
> > the Mcore resource is owned by another partition, xlnx_r5 when the
> > RPU is already running firmware): since attach recovery was introduced
> > (commit ba194232edc0 ("remoteproc: Support attach recovery after rproc
> > crash")), a failed re-attach was unwound with an unconditional
> > ops->stop() -- powering off a processor which, per the feature's own
> > contract, "does not need help from Linux to recover... Linux just needs
> > to attach", and which zynqmp_r5_rproc_stop() would additionally flip out
> > of attach recovery mode by clearing the feature bit.  With the unwind
> > detaching instead, the processor keeps running under its original owner
> > and the next attempt attaches again; attach()/detach() stay paired
> > one-to-one with the attach() calls that succeeded.
> >
> >  - 1/4: rproc_free_vring() writes FW_RSC_ADDR_ANY rather than 0 into
> >    a freed vring entry, for the callers that reach it while the
> >    remote processor is running and the reset lands in the installed
> >    resource table.
> >  - 2/4: rproc_start() no longer calls stop() unguarded when it
> >    unrolls a failed subdevice registration.
> >  - 3/4: __rproc_attach() rolls a failed attach back with detach()
> >    when available, keeping the resource table accounting and the
> >    state consistent, instead of unconditionally stopping a processor
> >    that was started by another entity.
> >  - 4/4: a failed recovery releases the resources of the boot it was
> >    trying to restore and voids the power count, which nothing else
> >    can drain once the processor is offline or detached.
> >
> > Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
> > driven by an out-of-tree platform driver for the Allwinner remoteproc
> > hardware.
> >
> > The error paths of patches 1 and 3 were hit on this hardware rather
> > than constructed.  During development, a subdevice registration
> > failure during rproc_attach(), unwound by an intermediate version
> > that called detach() without the resource table reset, left the
> > freed vring entries at da 0 in the installed table: the next
> > rproc_attach() failed in rproc_check_carveout_da(), called from
> > rproc_alloc_vring(), with "Registered carveout doesn't fit da request"
> > That trace motivated the reset bookkeeping of patch 3 and the
> > FW_RSC_ADDR_ANY reset value of patch 1; with the series applied, a
> > failed attach can simply be retried.
> >
> > The failure path of patch 4 was exercised by renaming the firmware
> > file once the processor was up and then crashing the remote core:
> > recovery fails in request_firmware() as expected, and after the
> > file is restored the next rproc_boot() performs a real new boot
> > instead of silently returning success on the stale power count,
> > with no "already associated to resource table" leftovers from the
> > failed recovery.
> >
> > [1] [PATCH v9 17/26] remoteproc: k3: Refactor .start rproc ops into
> >     common driver, 2025-03-17:
> >     https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/
> >
> > Yonghao Zhang (4):
> >   remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
> >   remoteproc: core: Guard against a missing stop() in rproc_start()
> >   remoteproc: core: Roll a failed attach back with detach() when
> >     available
> >   remoteproc: core: Clean up after a failed recovery
> >
> >  drivers/remoteproc/remoteproc_core.c | 144 +++++++++++++++++++++++----
> >  1 file changed, 127 insertions(+), 17 deletions(-)
> >
> >
> > base-commit: 586a2fadadb160295a93e5d5d32db1a2558a4d3f
> > --
> > 2.34.1
> >
