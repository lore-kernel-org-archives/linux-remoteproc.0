Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C012DEA8F
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164857; cv=none; b=BaWnnTkXhDJXPY+8EFtjmmpNEH8jCE7s1lgI8thlwVCumheZJGPFu5BZE4YUDW6QUYsixT6vWxvpbKxjiYyltr+zRJOTDP9Yez+/D4WMeyHyN67fvu66qNDfENvHvCbV6wnqkkbCYixNNelniFeaIRoZ4YBPRLmsNsJ55yKiz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164857; c=relaxed/simple;
	bh=D0hVL3u+P+DKgbc0k33AbvhNVDj3aw4G1RtdJ+Joxrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZXYozKoYiAr04djdCUFEN5HVCckvhor15bumg3w1w6AAARBGA6def3Yyv/DlWhLD3Uh1HMwPS9tISV4P3dB2k8pJ46zbgUp92aAW4mv00p83gatd7sIyb7LG/d0b0GpeXnAsMOysuPbH88i95Ww1PUdS2z4QAFGmXoKJlalSvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DA/9cvxI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DA/9cvxI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53506b44151so557791cf.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792164855; x=1792769655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wCPy2TJXUd/051khMbJz0nmRExXjWEjeWV3Tkd6L+Uc=;
        b=DA/9cvxI819TeM6yExsvZ2GyMWM8BOBEY8jGDsCqYiFRTRmeSsHwrQvPSa0SCnzmR6
         1KdNSBEevfh8IttK19VxfXGEYpckJ36Fud9x2sLI5J+mrRrdLLpS0jRRUE31iEyGT9w0
         oSuefA5TVZDwcL2Hz6LTPOClP1PPIp+72PFemc6e8X1pdsN2PCjTz9AITNungH1CICsG
         PyY/lQ5JpMd6FDCpz5DpZH1GA6KcyshxmqkBMOANSKZVFzcMobRpuNZKZsX7qhYScE7h
         NLoUjwikar4IJZAZ1k2slKYXMfq5/Ouxqp6pRdSbExx5ekn05LHTJAejP+Rzd67OdV/a
         kBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164855; x=1792769655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCPy2TJXUd/051khMbJz0nmRExXjWEjeWV3Tkd6L+Uc=;
        b=lG6pG15FT6cc+7tlk1zhEG6CnTOM/SBkb6EffyECn1Yt0Ab0pyC0uOhFKQir3UEhMC
         u2NgSITDZ6r8pK8JTpfu97zvzQDDywcKtfRXWhetzjZCSvz3P6fYlBDQcA9v7TG9sNI7
         vnbuZrHBB0PHTGze90ewxxl2Ub7sYMafK/Guvf2YRqfZ/nIbDo3Bsu+EZ9jRWbPkZH9C
         lhFZPSsUajfWZUPRXwSiqmTOf1smi5v9A6JfQTJwsdkPEUYBx2kk8lYCVw2F4OSttl3t
         z68TGeQoatQtewGf8NY5a1TXGQ4+3xTsug9qfc54r0mmYZvhVJqxP2NnqrBUwjI16SwW
         i3Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxqxudFuKaC+7lfpI+v7LtkfQ5qc8zU5sY7l47D4HfUVtij7YsNZKbw8b3mPDfBTbT6dRJ/+SQBPGaeMqqcCF/Q@vger.kernel.org
X-Gm-Message-State: AFq9FYJMMDYyMGHkUREJT0LrQDltMmOsTvMdBskfhB14be68W9SXvDSr
	GDxNi9MykEDYEQV2EQJc393zWXSJNIouwv8ccFeVJhpqeGrEI0wEmbvWEqlUzw4lRNA=
X-Gm-Gg: AYBFou2IyIHQKBKoe0sNjk3scxz94wgR3bnc7TNL0US4RmQ6hhvaxh+v3FFKN4cjX85
	5vmlq/y+TDBGPhlMt0o9bZNH6w6frsOPBaSoU1Jhrw3MDQPZi1IagBZlGDrT9blMH2DecXyCsif
	uUmhUuD7M7SCikWf2+RHTBK8+/XJELzlm4GfqpQMOmOeFMx1jF4aavy0mY5+zb2VzMA/A6PmyMX
	fw6kZjRQR5eb1uQEJyIGev3EmwjpV3rOYxO8Yfr4oQRi/xzlKgW46JvqEOWQEep+j70QzGiNvPf
	2zUPZmeW897MRqQjP8rpwHHkGSbpa4oMAtqnY1AVJdanXuI7RKjEdmTHS1eYhcvfaqgcL+rzfKI
	A1FQbbv9zpoK9mU1KynzBy+QSk7piKsVHfLB9OexWgwpkdkJFHOm9TYUFApGOrCrY1bFsI7Hf2g
	AyleA2IxOjFQ6w5myrEsiK16UNze2PSXJHgK9fNiOhHgqogYMWWRX0e9k4XD+hZetZPTr2/f2Rw
	A==
X-Received: by 2002:a05:620a:880f:b0:93e:c12c:f13f with SMTP id af79cd13be357-93f29df893emr29655085a.73.1792164854385;
        Fri, 16 Oct 2026 08:34:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16b5e4sm236439085a.14.2026.10.16.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:34:13 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:34:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: core: Reset freed vring entries to
 FW_RSC_ADDR_ANY
Message-ID: <atJD8lUISK6yblmy@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-2-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-2-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:50PM +0800, Yonghao Zhang wrote:
> rproc_free_vring() resets a vring entry in the resource table as it
> releases it.  Resetting da to 0 leaves the entry looking like a vring
> at device address 0; write FW_RSC_ADDR_ANY instead, the marker for an
> unallocated address, which is what the entry means from then on.
> 

The above is enough to describe what this patch does.  An additional line will
also be enough to justify the modifiation of the comment (see below).

> That matters on the error paths of rproc_start() and rproc_attach(),
> where rproc_free_vring() runs while the remote processor is already
> running: the failure originates in rp_find_vq(), called through
> virtio_find_vqs() from e.g. rpmsg_probe(), which the core only
> reaches through rproc_start_subdevices(), after ops->start() or
> ops->attach() have completed.  At that point table_ptr is the
> resource table installed in remote processor memory, and whatever
> the reset writes is visible to the remote side.  Whether and when a
> running processor reads the entry cannot be known, so the value must
> be safe for one: 0 is a plausible device address, FW_RSC_ADDR_ANY is
> not.  On the teardown paths, stop and detach, the write lands in the
> cached table or in a copy of the installed one and reaches no one.
> 
> The comment replaced along with it was written for a call graph that
> no longer exists.  It described the teardown callers only:
> rproc_stop() has run, table_ptr points at the cached table, and that
> table is NULL for a processor started by another entity, so there is
> nothing to clear.  Two facts have overtaken it:
> 
> - rp_find_vq() has been calling rproc_free_vring() when
>   vring_new_virtqueue() fails since commit 6db20ea8d850 ("remoteproc:
>   allocate vrings on demand, free when not needed"), and that call
>   was present, unchanged, when commit 9dc9507f1880 ("remoteproc:
>   Properly deal with the resource table when detaching") landed: it
>   runs from rproc_start_subdevices(), after ops->start() or
>   ops->attach() have completed, with table_ptr at the table installed
>   in remote processor memory and the processor running.  The comment
>   never described this caller, not on the day it was written.

Are comments supposed to describe all the paths that lead to a function?

> 
> - commit 9dc9507f1880 ("remoteproc: Properly deal with the resource
>   table when detaching") and commit 8088dd4d9316 ("remoteproc: Properly
>   deal with the resource table when stopping") later taught the
>   detach/stop paths to take a kmemdup() copy of the installed table for
>   processors started by another entity, so the NULL case the guard was
>   deciding between is gone: table_ptr is always valid where the teardown
>   callers run.  (Those callers have since moved to the rproc-virtio
>   platform driver, 9c31255ce5fe.)
> 
> Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")
> Fixes: 4d3ebb3b9990 ("remoteproc: Refactor function rproc_free_vring()")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 40 +++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..123aadb467a0 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -403,6 +403,33 @@ rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
>  	return 0;
>  }
>  
> +/*
> + * rproc_free_vring() runs while a remote processor is being torn down
> + * (rproc_stop()/rproc_detach() paths) or while a boot or attach attempt
> + * is failing.  Whether the reset below can reach the remote processor
> + * depends on what rproc->table_ptr refers to at that point:
> + *
> + * - teardown paths: the call comes from the rvdev cleanup in
> + *   rproc_resource_cleanup(), by which time rproc_stop()/__rproc_detach()
> + *   have switched table_ptr to the table the core was booted with, or
> + *   to a copy of the installed table when the remote processor was
> + *   started by another entity (rproc_reset_rsc_table_on_{stop,detach}()),
> + *   so the write cannot reach the remote processor.
> + *
> + * - error paths of rproc_start()/rproc_attach(): the failure originates
> + *   in rp_find_vq() (virtio_find_vqs() failing in e.g. rpmsg_probe()),
> + *   which rproc_start_subdevices() calls only once ops->start() or
> + *   ops->attach() have completed.  table_ptr still points at the
> + *   resource table installed in remote processor memory and the remote
> + *   processor is already running.
> + *
> + * Especially in the last case the reset has to tell the remote
> + * processor that the vring entry is not usable: with da set to the
> + * invalid FW_RSC_ADDR_ANY a running remote processor sees the address
> + * as unallocated, and notifyid is invalidated along with it.

Why is there a need to describe all that?

> + *
> + * Reset the virtio device section only if there is a table to work with.
> + */
>  void rproc_free_vring(struct rproc_vring *rvring)
>  {
>  	struct rproc *rproc = rvring->rvdev->rproc;
> @@ -411,20 +438,9 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  
>  	idr_remove(&rproc->notifyids, rvring->notifyid);
>  
> -	/*
> -	 * At this point rproc_stop() has been called and the installed resource
> -	 * table in the remote processor memory may no longer be accessible. As
> -	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
> -	 * resource table (rproc->cached_table).  The cached resource table is
> -	 * only available when a remote processor has been booted by the
> -	 * remoteproc core, otherwise it is NULL.

Just remove the last sentence if it has become obsolete.   

> -	 *
> -	 * Based on the above, reset the virtio device section in the cached
> -	 * resource table only if there is one to work with.
> -	 */
>  	if (rproc->table_ptr) {
>  		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
> -		rsc->vring[idx].da = 0;
> +		rsc->vring[idx].da = FW_RSC_ADDR_ANY;

I agree with this change.

>  		rsc->vring[idx].notifyid = -1;
>  	}
>  }
> -- 
> 2.34.1
> 
