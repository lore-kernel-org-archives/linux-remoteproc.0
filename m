Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635600;
	b=xjcjFWU18kPDSnVnboe+7trfYZ3S+aHwKi6lfJZPRodxJ6w2IqNIz3dm7drzjRmRCUQF
	 XI6RQGbVJIJhsZu0LMYkP0hOjlZXmOoB1J+Bf5hfewxneLQ0CVu8cRozLl9cdH/AvrhIC
	 4uW8kJPYw8F9/cN3OVLbIwFWzQoqLShxrLZXFHiV68MKjyApr6N4e0VJJGvW8Zq7HCyoN
	 5drxRyieRtIqpJyj0wV9CKBuCRu1U02MGtFcMIDPpZTOk2P1BDJ7KFHeIHzbvO0BPHKnA
	 dw5jCoAyV9zjZc+EfGoZistatdWTA1+iMjOesT/8iMC0w0XF0iJlSsS/F4389Lc/Eyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/rGOYXe9uekj0837yJNOfEE6IAAgO/oDWUmH7/BGBw8=;
	b=T6bZCGzbQdv15JQhu3J/6U+uT7lj42UyyqGFWSmm/7UTd++wMQcBPWCt1gmlDK1XggJO
	 AcjSvkZvNbg81PEL5zBMCJswcmESPS5GMyBg2xAKr5hppmT5se9+CVibWnaR18yBJ9TgF
	 yWXYUJl3+3XYXGwvokCBGH8EFPUufeJlSnVTRdEe4w/XhVykDyMBV2UMQDlN5lBtrSC0D
	 9GDUxcyiR4TKnt36e+HysmFzmHBmIhq9nUy7m327phNHRsn7sfnuphyzyXY2X1++OUy0w
	 Gad43yPYhOZsrySiVlrQ2GhVHlHQNaviAucaNN6Z+dzTcsGcEazE6lx6GBf7gIQbEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EP+wrQd2;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8E9606A31A
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 02:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EP+wrQd2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1015476a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 19:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635599; x=1793240399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/rGOYXe9uekj0837yJNOfEE6IAAgO/oDWUmH7/BGBw8=;
        b=EP+wrQd2z/Sj8oihFv8APHWnyip4OC3LPRuwmh34SaEo5z4GMR9CT1wJQC5BFQkMuK
         xfQ6ZV86MbQA/s9eF8FFlxdRDuU0qQrTaOXs5gG7vuekeiim9+wj9xucmb5etCrc8SnG
         CxSEp3cR3/unPD1D1DgRbxBxYVZubRi4HixD6LCXRRMULob87Y7IsevDCFqEtyQBnmG7
         KbxCdKHNV5lH2lzzRV/zG42L8TPG4vh+RBJy686F+kaABWjNMZyauoEIhKBgvG4Ui9y4
         ReITVT+f0eUcqGR2yO7P5hp2GWaByd90eUh+RgbNDIVog9fkaXwy6hD2aDsr5Qu/ei1j
         niFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635599; x=1793240399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rGOYXe9uekj0837yJNOfEE6IAAgO/oDWUmH7/BGBw8=;
        b=fKv6cXJgnn0An/L4yYtP9FKFqoaIHM9QUcpbOXn20Dwuri/8Wz0hXvv1ad/Avh+sh0
         HNP9cLI2mIrQ1ZNk/3x2JkTx8uz9tr/R+rTBh3c/8/wS2CmW4bIDO09gBCmJRJXcsyZ+
         nPweSVi/tBrmsaRUVdYkivpJYQyv29SDQ/nMSKYL5LCCfGSoodAXUkzBDpPVQCGbJr+S
         +UNkFOAMpNDcDhskdx9RaljdP1dkghxnYMRm8hwlWp4QlVyYuP96wCuaZ4rSm8SQuwfn
         fTIAQ0dTLn0aHiXPw4wOP0Kh4ziPvP9SI8Nd1O1OOKxYg1xH1F1O9KbpG4lB/vIQHlJ3
         bNYQ==
X-Forwarded-Encrypted: i=1; AKwUvBys1AMnKo5O16LM5XJU/3JiwqsOITQ54msgyq/s3LxRnf9uu4IcZmtAbUR+98TNGAFyOqbeq1HZz3PAncvggAVn@vger.kernel.org
X-Gm-Message-State: AFq9FYLcMoUBG3J10I9L/me/7re1Ewo5uta8/LEFjvCTdVCQLhjKY5Nh
	ksiUlTiO4i0lId5opb8kH9N9FcKLrDXpI3AR8NLth9zMdw35uX65KMwN
X-Gm-Gg: AYBFou2fm5RW93s80YOSNHqxhFfnZke8WnTCHRgG5aEyo0PES3eGvOwmzmSSimxLaKn
	CJRcHHrkWaC2isV3GmWlw0bC8pZWlcBagXwf39/F0LTjCyq/yipEOh4vEE8DWmjT33xWI6oE3TW
	jnh79Wkj2A1H2aokHhG+1wjBZW9hbaXRjRYLKUYlcgr4Yv689nwlhhTXcYEyhPBzDkTGcdGr84P
	mnLxuNSvVw3E3sajeVLtl9k+MFF/05nXIR3imxpWJhV5B9OG2Vw086SChxY+D+427aoFGfXBPJM
	nSRGpA2lvk0Lgj1EO7dH3y4iN9TpKxo2+MYZLR8+7SlJbNETEk3u9Zuy4czHLKk4Pt60ENDGbVq
	IcGnzGDFn/l0mBC28O6M8MJr5Q6FJBSHC7Gs0XmdJYflq55OVToV0ESV4zXQpLzml4mAL93z1iT
	STfd/TEAW7dVPsnMthKjhoXgeIDgs+YhvGXszfieDttgH6GAQiJ6d3Gq7klnD1ivHJXpqLaI7SU
	fz/aXvvgnpT8sCAHfMKnDzP6Rshu9NViuaDJ6HZ5+MH9KfCRg==
X-Received: by 2002:a17:90b:4b92:b0:3ab:ab5a:ef06 with SMTP id 98e67ed59e1d1-3ad86ccd949mr3362570a91.12.1792635599418;
        Wed, 21 Oct 2026 19:19:59 -0700 (PDT)
Received: from gmail.com ([183.34.209.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed6c0sm1804101a91.6.2026.10.21.19.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:19:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:19:53 +0800
From: Yonghao Zhang <hyz3367@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: core: Roll a failed attach back with
 detach() when available
Message-ID: <20261022021953.ydvirxrtv3dxsiqz@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-4-hyz3367@gmail.com>
 <atZQEuXMwMpvmoBz@p14s>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZQEuXMwMpvmoBz@p14s>

On Mon, Oct 19, 2026 at 11:14:58AM -0600, Mathieu Poirier wrote:
> @Arnaud Pouliquen - please review this patch to make sure it doesn't break
> STM32.
> 
> On Tue, Sep 29, 2026 at 03:54:52PM +0800, Yonghao Zhang wrote:
> > When the subdevice registration that follows ops->attach() fails,
> > __rproc_attach() rolls back with an unconditional ops->stop() call.
> > That is wrong on three counts.
> >
> 
> It isn't wrong, simply implemented during a time where any kind of fault in the
> attach()/detach() scenario called for a stop().  I would certainly appreciate a
> less reproachful tone.
> 
>  
> > An attach-only implementation, one without stop() such as
> > commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
> > mode for all R5Fs"), dereferences NULL right there.  A processor that
> > is being attached to was started by another entity and is not ours to
> > power off: detach() is the matching undo of attach(), and stop()
> > should only be used as a last resort, when there is no detach() or
> > it fails.  This is reachable today: when the re-attach of an
> > RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
> > xlnx_r5 use the feature), the unwind stops a processor which,
> > per the feature's own contract, "does not need help from Linux to
> > recover... Linux just needs to attach".  And the unwind leaves
> > the accounting inconsistent -- no resource table bookkeeping
> > is done, unlike on the rproc_stop() and __rproc_detach() paths,
> > and a processor powered off through the fallback keeps its
> > RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
> > core that is no longer running.
> > 
> 
> Remove the above paragraph.
> 
> > Roll the attach back with detach() first, along with the same
> > rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
> > and fall back to stop() only when detach() is unavailable or failed.
> > A failed resource table reset does not abort the unwind: this is an
> > error path, and detaching from the remote processor, or powering it
> > off as the last resort, takes precedence over the bookkeeping.  A
> > successful fallback moves the processor to RPROC_OFFLINE so the next
> > boot reloads firmware instead of attaching to a dead core;
> > implementations with neither handler keep the processor running and
> > untouched, which is all an attach-only core needs.  The rollback is
> > factored into rproc_unwind_attach().
> > 
> > The unwind runs the same resource table resets as the detach and
> > stop paths, which free clean_table and leave a cached copy of the
> > installed table in rproc->cached_table.  Make rproc_attach()'s error
> > cleanup, which runs right after, null clean_table after freeing it
> > and release that copy along with table_ptr, or a failed attach
> > double-frees clean_table and leaks the copy.
> > 
> > Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
> > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
> >  1 file changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 19e0ea3e7240..c52212a1d180 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
> > +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
> > +
> > +/*
> > + * Undo an attach whose subdevice registration failed.  The remote
> > + * processor was started by another entity and is not ours to power
> > + * off, so roll back with detach() when available and fall back to
> > + * stop() when there is no detach() or when it failed.  stop() is
> > + * the only rollback that does not rely on the remote side.  A
> > + * processor powered off through the fallback is marked RPROC_OFFLINE,
> > + * so the next boot reloads firmware instead of attaching to a dead
> > + * core; with neither handler there is nothing to roll back with and
> > + * the processor is left running.
> > + *
> > + * The resource table resets are best-effort: when one fails, the
> > + * unwind carries on with detach()/stop() anyway.  Unlike
> > + * __rproc_detach() and rproc_stop(), which bail out before touching
> > + * the processor when their reset fails, this is already an error
> > + * path, and detaching the remote processor -- or, failing that,
> > + * powering it off -- is the minimum it must still deliver.
> > + */
> > +static void rproc_unwind_attach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	if (rproc->ops->detach) {
> > +		ret = rproc_reset_rsc_table_on_detach(rproc);
> > +		if (ret)
> > +			dev_err(dev, "can't reset rsc table on detach: %d\n",
> > +				ret);
> > +
> > +		ret = rproc->ops->detach(rproc);
> > +		if (!ret)
> > +			return;
> > +
> > +		dev_err(dev, "can't detach from rproc %s: %d\n",
> > +			rproc->name, ret);
> > +	}
> > +
> > +	if (rproc->ops->stop) {
> > +		ret = rproc_reset_rsc_table_on_stop(rproc);
> > +		if (ret)
> > +			dev_err(dev, "can't reset rsc table on stop: %d\n",
> > +				ret);
> > +
> > +		if (rproc->ops->stop(rproc))
> > +			dev_err(dev, "can't stop rproc %s\n", rproc->name);
> > +		else
> > +			rproc->state = RPROC_OFFLINE;
> > +	}
> > +}
> 
> 
> Please remove all the dev_err() above.  An error messages are already generate
> in __rproc_attach() when something goes wrong.
> 
> > +
> >  static int __rproc_attach(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> > @@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
> >  	if (ret) {
> >  		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> >  			rproc->name, ret);
> > -		goto stop_rproc;
> > +		goto unwind_attach;
> >  	}
> >  
> >  	rproc->state = RPROC_ATTACHED;
> > @@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
> >  
> >  	return 0;
> >  
> > -stop_rproc:
> > -	rproc->ops->stop(rproc);
> > +unwind_attach:
> > +	rproc_unwind_attach(rproc);
> >  unprepare_subdevices:
> >  	rproc_unprepare_subdevices(rproc);
> >  out:
> > @@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
> >  	 * rproc_set_rsc_table().
> >  	 */
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> 
> This change is not needed.
>

Hi Mathieu,

Thanks for the review.  I'll adjust the changelog, drop the dev_err()
calls and remove the table_ptr assignments. 

I traced both assignments again and I'd like to keep them.  The one in
rproc_reset_rsc_table_on_detach() is what keeps the pointer from being
freed twice:

  __rproc_attach() -> rproc_unwind_attach() ->
  rproc_reset_rsc_table_on_detach() -> kfree(clean_table)

Then __rproc_attach() returns, rproc_attach() jumps to
clean_up_resources, which does kfree(rproc->clean_table) again on the
same pointer. This holds whether detach() succeeds or fails: On
failure, rproc_reset_rsc_table_on_stop() takes the cached_table early
exit and leaves clean_table alone.

The assignments in rproc_reset_rsc_table_on_stop() matters when
rproc_reset_rsc_table_on_detach() bails out at its kmemdup() with
-ENOMEM, before freeing clean_table, and detach() then fails. The
stop() fallback can then make its own copy and be the one taht frees
clean_table, and clean_up_resources() would free it again. With no
detach() at all, clean_table is already NULL, so these two paths are
the only ones that matter.

I'll wait for Arnaud's feedback on STM32 before sending the v2.

Thanks,
Yonghao

> >  
> >  	return 0;
> >  }
> > @@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> >  	 * won't be needed.  Allocated in rproc_set_rsc_table().
> >  	 */
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> 
> 
> This change is not needed.
> 
> >  
> >  out:
> >  	/*
> > @@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
> >  	/* release HW resources if needed */
> >  	rproc_unprepare_device(rproc);
> >  	kfree(rproc->clean_table);
> > +	rproc->clean_table = NULL;
> > +	kfree(rproc->cached_table);
> > +	rproc->cached_table = NULL;
> > +	rproc->table_ptr = NULL;
> 
> ->table_ptr doesn't need to be set to NULL.
> 
> Thanks,
> Mathieu
> 
> >  disable_iommu:
> >  	rproc_disable_iommu(rproc);
> >  	return ret;
> > -- 
> > 2.34.1
> > 
