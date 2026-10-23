Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792777422;
	b=Vad0sWAJ3TxlEDb2bw0cvDQRwrx7ugXuDXYV4ONMv+bRHVntGntiJFFZV/sNHuPX3KTe
	 dpIqEzDXPnm+7qttvV6SbHQvXzvZYSdjJ9BcVPhI/1ShVT9yTM3tcVXaWjGmcOQLizZua
	 poCy8KRBtUtrwFlmpbfztQ4FUnZIai+QyPfcyB7HBMFmNrKtnzkYA28if/SIezaX7Ke8l
	 zH1CMXnpsJ+LR+2ZbmUx0348KzJ8ESZaFId/4uUrTUE1N4BV1kegG2vTuH6Q34AsWu0k4
	 JIqhKME1TQ8z+XZ1JlVQkykHAqdthkYS/KTtmjirIwyp4UKNWV/bDiEL546+DJSbeTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4XsDqjSi39IRDHB7eg96Rq4rbGW6QYB8mDa8oKwzEPo=;
	b=HEz4DSE8pBxKhHClS/io6bLUs8TRdGcYE3nkRMjdXStFnzzPVHcU9bbgT5d0cAQvDl4J
	 mT2Xb+1tPO0KfKUQcXoHwDQZTkVD1HLI1OqkeqG02MOuyg3QJ9SP76Mfxg0ehOwjCEXJz
	 ifm3V6q24KdUkVdchWx1GMO1l05b2HVnozM0mXSdpAnZkZBiYH0mts2pBzHwfzPUgu9WY
	 EBkKNMY99wLYgM6891e9PYoWcseM03Nj3YI7/o3coC9JjK3asxkvOzAwEkUzo9uj4T+xV
	 FGHzeYToU5unWlimnDbshb2f9Wt8nmkyPP5QeFpf+xYJFycvq0Y8L5dHHp8dcjSmjkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MMnRpd2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468D606A31E
	for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 17:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1468D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MMnRpd2A
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so363057566b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 23 Oct 2026 10:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792777420; cv=none;
        d=google.com; s=arc-20260327;
        b=WL6o7FeS8EucNZatwnl/06ln3HJaesevsZHzlyTDFFWUYj8Wg4d0MWI5WRggxjev65
         tR6iqTjjM2dj4hQDn2yvq81/KBYBfN4BMlg7Rq/FTHr+XrHKm46lifj0CegnxEV/uikd
         mRA9ZMU6mCf8Fo0l1rTPxIcAlurEJt0oPCkzDgqhbwYssRPfafrlGyF2X2B8ULFBMnma
         61s8vd/kT2l8A5Rqr5K3N+//FKnqQf1nIcJ8CI8r5EUuHGZn5D7P7xLDUsTYhYiFDW0u
         1fykpGuUVZa2HY6ORhN4IVg0ykqR1vL6Gl1fRrzDG8dcfCiC1mzJnjue0hHH1emasL4/
         b8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4XsDqjSi39IRDHB7eg96Rq4rbGW6QYB8mDa8oKwzEPo=;
        fh=/Nzg/GcRR7xV/b3bO+oybkZF2yHPc2lhooaAVr9A5h0=;
        b=Dsm2TuVVPmq8lrk/StRa50CNUhPoqv8guC5YAvzqnIKAFmTTNkUVGhwcL9/mp6hnLd
         po4DkxtRQPWtEimhnUN+1Jqs5t56XD5Sjnzjx8QCk1L8FTN5C9dHBfAg69cEYjM6PbKO
         ilOvrIBdZLRW5yfejlXd+fhqWRJ9pdiXu1RD5ArUzvUpdxya3N3Burc3QJes8XSC15my
         gWUrzyrlwNCsAczLMCx188oNWmSejfdIMAbnc7xQdtD+7oIecw6L9iW2t8DpyQ8TVgoV
         8ftvOSLEyo0PHhj/s9kpv3wpU3E8pf+QhuEnL254HY8LsJwb1LSnSM8csDveR1M01c5v
         VWTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792777420; x=1793382220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XsDqjSi39IRDHB7eg96Rq4rbGW6QYB8mDa8oKwzEPo=;
        b=MMnRpd2A4yFr+e/JjuNzVSYMzljETE4zqa2+tO2C8AO85QAAyOCLwRpGlquQmnF8LP
         alGk5N9zQcbwMje3B2d34fa0piFMD+KlK08gZJvkih5rr9JMhJ5MviChya2TglRefY0g
         FBOIvFmfVE2rFZimWT61ZlvvfV/inEESCayTwb3yH0Yh2pH8Su++updBYnxingpIHj1g
         K9s+vCsc2oj39PszIkwpMsWZsjLra1QUd6juY6h3w+aD6ZjdN6cKiVtI13kHxUnsZylz
         mDr8okqs1jmlHvdkv0Kj8YdtHdC/wmY2xHAyM0c0LCSzPfF4Ax570l4IRbdhkMNrsH47
         IvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777420; x=1793382220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4XsDqjSi39IRDHB7eg96Rq4rbGW6QYB8mDa8oKwzEPo=;
        b=MaCCY7/VTcYzHimL09SU8hYbLjFltLRAY1FF4yTDdmPV1FSTCeCUX8dnsSNT/UtHMH
         oOVh/sRnReSuKONAA5YSmH/u38SL3F23v78MsJFfdxiDwt0B5pew8JB3N7pO94XCBXMN
         2Gawvg7rSnryHX8tpbPTT2YWZH2wPPyjMOYVfJ0OIycwsolsowLcqjjl7Iyz34oHcL9o
         +JGgyDjKgyyBkpE01+koRs84RJsglhJVe5xmGgwyxNTjhJQYPsb6EGl4dclnO90aiIxL
         Plb0SbtEFE4HZIsmGW0fYuIRzRf+D4nkNEjlsoFGy/wh81d2SdL71MNoj//vPCZCjJ6O
         peVw==
X-Forwarded-Encrypted: i=1; AKwUvByuTywaqlRL9s+/HTZqhHx5xO2njcYFHLnq5Ez8/wm2LR5omQ0gwmxvunP+5H4YyC+IGk5gWQlANBoAij5mxjJC@vger.kernel.org
X-Gm-Message-State: AFq9FYJn5cS5Z4VCvCjYkpTNcV76X5cduAt7Hkif9lmvogsHcmbWa97Z
	GT0PsK3FBooOJ/iCgJX8AOMgVjVFhELDgGAF+8xhObqfBNPH694Z47yuEG5wOaryd/7RGpIOHZl
	hFYzy2H/v6HrDNmZjNEfhD+YNw84TrVS/vT853wdLN0R/NwI/GKXS
X-Gm-Gg: AYBFou1XHu3fX9MqLeEuSnZdyxrTetsFCr3qeFE0Y8j+YDrjcycPPz5lXFRF4tpNpPo
	6NZT1aFmRpvGWcyZaqOvH+Azlhweezjnwa2mwSnRba76f4Caqn3lYN95RogmxyhAAKcvKy3d1OU
	53vISGrZkAubfYz7EJZ0GcpBECPjtMbdxjXTwLHDH2Kl9Sj6rN5byn4bGIhsK5gCupAz9gKSOYS
	DZYJ1frWT+9pgsv1yhtOiw5CoMMW1k2QWzGTis51CtUePlNlctEfPGvMc1S/TqeMhgfv+UhKuVc
	UUxMG3fdihcw35i9+yiDezmE6PtrkGujuucMNaHiBwvk5ypQe6qW2dBBr86mNL7g7wSeFGEYuZc
	29+2pd+bprFwY0uTK82RKHFMxp5sylnddGWyTi3y2AlIEtDsJ2+7IRxVxC0EOQ8VAFrJcwSQ=
X-Received: by 2002:a17:907:d643:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c468d80cc8amr956867466b.17.1792777420259; Fri, 23 Oct 2026
 10:43:40 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929075453.2324597-1-hyz3367@gmail.com> <20260929075453.2324597-4-hyz3367@gmail.com>
 <atZQEuXMwMpvmoBz@p14s> <20261022021953.ydvirxrtv3dxsiqz@gmail.com>
In-Reply-To: <20261022021953.ydvirxrtv3dxsiqz@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 23 Oct 2026 11:43:29 -0600
X-Gm-Features: AclHuK_x5LPEoM2dLLZ64KhwCr8107V0LuixxSfsC5kKuS5_FUcoXXnkiBoTlWE
Message-ID: <CANLsYkzdetrDtRY02Eb=1mq6Y1MjX=Ub+GHF3bqks0FgVmz4sA@mail.gmail.com>
Subject: Re: [PATCH 3/4] remoteproc: core: Roll a failed attach back with
 detach() when available
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 20:20, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:14:58AM -0600, Mathieu Poirier wrote:
> > @Arnaud Pouliquen - please review this patch to make sure it doesn't break
> > STM32.
> >
> > On Tue, Sep 29, 2026 at 03:54:52PM +0800, Yonghao Zhang wrote:
> > > When the subdevice registration that follows ops->attach() fails,
> > > __rproc_attach() rolls back with an unconditional ops->stop() call.
> > > That is wrong on three counts.
> > >
> >
> > It isn't wrong, simply implemented during a time where any kind of fault in the
> > attach()/detach() scenario called for a stop().  I would certainly appreciate a
> > less reproachful tone.
> >
> >
> > > An attach-only implementation, one without stop() such as
> > > commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
> > > mode for all R5Fs"), dereferences NULL right there.  A processor that
> > > is being attached to was started by another entity and is not ours to
> > > power off: detach() is the matching undo of attach(), and stop()
> > > should only be used as a last resort, when there is no detach() or
> > > it fails.  This is reachable today: when the re-attach of an
> > > RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
> > > xlnx_r5 use the feature), the unwind stops a processor which,
> > > per the feature's own contract, "does not need help from Linux to
> > > recover... Linux just needs to attach".  And the unwind leaves
> > > the accounting inconsistent -- no resource table bookkeeping
> > > is done, unlike on the rproc_stop() and __rproc_detach() paths,
> > > and a processor powered off through the fallback keeps its
> > > RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
> > > core that is no longer running.
> > >
> >
> > Remove the above paragraph.
> >
> > > Roll the attach back with detach() first, along with the same
> > > rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
> > > and fall back to stop() only when detach() is unavailable or failed.
> > > A failed resource table reset does not abort the unwind: this is an
> > > error path, and detaching from the remote processor, or powering it
> > > off as the last resort, takes precedence over the bookkeeping.  A
> > > successful fallback moves the processor to RPROC_OFFLINE so the next
> > > boot reloads firmware instead of attaching to a dead core;
> > > implementations with neither handler keep the processor running and
> > > untouched, which is all an attach-only core needs.  The rollback is
> > > factored into rproc_unwind_attach().
> > >
> > > The unwind runs the same resource table resets as the detach and
> > > stop paths, which free clean_table and leave a cached copy of the
> > > installed table in rproc->cached_table.  Make rproc_attach()'s error
> > > cleanup, which runs right after, null clean_table after freeing it
> > > and release that copy along with table_ptr, or a failed attach
> > > double-frees clean_table and leaks the copy.
> > >
> > > Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
> > > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
> > >  1 file changed, 62 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 19e0ea3e7240..c52212a1d180 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > >     return ret;
> > >  }
> > >
> > > +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
> > > +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
> > > +
> > > +/*
> > > + * Undo an attach whose subdevice registration failed.  The remote
> > > + * processor was started by another entity and is not ours to power
> > > + * off, so roll back with detach() when available and fall back to
> > > + * stop() when there is no detach() or when it failed.  stop() is
> > > + * the only rollback that does not rely on the remote side.  A
> > > + * processor powered off through the fallback is marked RPROC_OFFLINE,
> > > + * so the next boot reloads firmware instead of attaching to a dead
> > > + * core; with neither handler there is nothing to roll back with and
> > > + * the processor is left running.
> > > + *
> > > + * The resource table resets are best-effort: when one fails, the
> > > + * unwind carries on with detach()/stop() anyway.  Unlike
> > > + * __rproc_detach() and rproc_stop(), which bail out before touching
> > > + * the processor when their reset fails, this is already an error
> > > + * path, and detaching the remote processor -- or, failing that,
> > > + * powering it off -- is the minimum it must still deliver.
> > > + */
> > > +static void rproc_unwind_attach(struct rproc *rproc)
> > > +{
> > > +   struct device *dev = &rproc->dev;
> > > +   int ret;
> > > +
> > > +   if (rproc->ops->detach) {
> > > +           ret = rproc_reset_rsc_table_on_detach(rproc);
> > > +           if (ret)
> > > +                   dev_err(dev, "can't reset rsc table on detach: %d\n",
> > > +                           ret);
> > > +
> > > +           ret = rproc->ops->detach(rproc);
> > > +           if (!ret)
> > > +                   return;
> > > +
> > > +           dev_err(dev, "can't detach from rproc %s: %d\n",
> > > +                   rproc->name, ret);
> > > +   }
> > > +
> > > +   if (rproc->ops->stop) {
> > > +           ret = rproc_reset_rsc_table_on_stop(rproc);
> > > +           if (ret)
> > > +                   dev_err(dev, "can't reset rsc table on stop: %d\n",
> > > +                           ret);
> > > +
> > > +           if (rproc->ops->stop(rproc))
> > > +                   dev_err(dev, "can't stop rproc %s\n", rproc->name);
> > > +           else
> > > +                   rproc->state = RPROC_OFFLINE;
> > > +   }
> > > +}
> >
> >
> > Please remove all the dev_err() above.  An error messages are already generate
> > in __rproc_attach() when something goes wrong.
> >
> > > +
> > >  static int __rproc_attach(struct rproc *rproc)
> > >  {
> > >     struct device *dev = &rproc->dev;
> > > @@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
> > >     if (ret) {
> > >             dev_err(dev, "failed to probe subdevices for %s: %d\n",
> > >                     rproc->name, ret);
> > > -           goto stop_rproc;
> > > +           goto unwind_attach;
> > >     }
> > >
> > >     rproc->state = RPROC_ATTACHED;
> > > @@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
> > >
> > >     return 0;
> > >
> > > -stop_rproc:
> > > -   rproc->ops->stop(rproc);
> > > +unwind_attach:
> > > +   rproc_unwind_attach(rproc);
> > >  unprepare_subdevices:
> > >     rproc_unprepare_subdevices(rproc);
> > >  out:
> > > @@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
> > >      * rproc_set_rsc_table().
> > >      */
> > >     kfree(rproc->clean_table);
> > > +   rproc->clean_table = NULL;
> >
> > This change is not needed.
> >
>
> Hi Mathieu,
>
> Thanks for the review.  I'll adjust the changelog, drop the dev_err()
> calls and remove the table_ptr assignments.
>
> I traced both assignments again and I'd like to keep them.  The one in
> rproc_reset_rsc_table_on_detach() is what keeps the pointer from being
> freed twice:
>
>   __rproc_attach() -> rproc_unwind_attach() ->
>   rproc_reset_rsc_table_on_detach() -> kfree(clean_table)
>
> Then __rproc_attach() returns, rproc_attach() jumps to
> clean_up_resources, which does kfree(rproc->clean_table) again on the
> same pointer. This holds whether detach() succeeds or fails: On
> failure, rproc_reset_rsc_table_on_stop() takes the cached_table early
> exit and leaves clean_table alone.
>

Ok

> The assignments in rproc_reset_rsc_table_on_stop() matters when
> rproc_reset_rsc_table_on_detach() bails out at its kmemdup() with
> -ENOMEM, before freeing clean_table, and detach() then fails. The
> stop() fallback can then make its own copy and be the one taht frees
> clean_table, and clean_up_resources() would free it again. With no
> detach() at all, clean_table is already NULL, so these two paths are
> the only ones that matter.
>

Ok

> I'll wait for Arnaud's feedback on STM32 before sending the v2.
>
> Thanks,
> Yonghao
>
> > >
> > >     return 0;
> > >  }
> > > @@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> > >      * won't be needed.  Allocated in rproc_set_rsc_table().
> > >      */
> > >     kfree(rproc->clean_table);
> > > +   rproc->clean_table = NULL;
> >
> >
> > This change is not needed.
> >
> > >
> > >  out:
> > >     /*
> > > @@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
> > >     /* release HW resources if needed */
> > >     rproc_unprepare_device(rproc);
> > >     kfree(rproc->clean_table);
> > > +   rproc->clean_table = NULL;
> > > +   kfree(rproc->cached_table);
> > > +   rproc->cached_table = NULL;
> > > +   rproc->table_ptr = NULL;
> >
> > ->table_ptr doesn't need to be set to NULL.
> >
> > Thanks,
> > Mathieu
> >
> > >  disable_iommu:
> > >     rproc_disable_iommu(rproc);
> > >     return ret;
> > > --
> > > 2.34.1
> > >
