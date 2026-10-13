Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5C3F58E8
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900589; cv=none; b=GfTwk/TBmf4CiY18nufN1K949D5ybnzCtVbhnHfntQwgEWaqcwbukgahCywtM8ihXGxzRdGI6WuRVXiE8o5EX1MGNHDxEtsfgNqbXL8QsNTZzYgMp24Mt8KBxPYLezL2bc8GN9sdN0OrH6QBbGq7Xk+525o3A2kUOqBGEfyx/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900589; c=relaxed/simple;
	bh=owMijsIp74FmdN5ni11gCTZYts5QncbUEPKxaSS5ctc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDid7CPFcJg7u21HFsCrXiQHXEK+1r2wEEWGob/qBp7XKmROuUUGoAFiJQmN+Y2jIEpOVSBioAk/tDgAuA2cEaYVSVaNtZGaqaFeGDMewF9/O5iEEYzRdUQRN7Nil47s++dH88zFNPt2o0xIBrATYSvMknhKHiciQzdMByvCBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAF1Ryta; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAF1Ryta"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e6038cebefso22915805ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900587; x=1792505387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4TUuZT1wFoqbpc7B/LNd/6pZfnJKi059fMqGVzqoVyA=;
        b=HAF1RytaC3wsjGApoKFWtMyAKh9w0agxUdBJzrYVAKrXryP3Q+Yq3kDitIAHGU/BrS
         Rt6CkBHEgDR/ai+apaNS9LuNA1u4q8xVJMYVVuvIdx5wDvTPB/Zg6fW5C2DoBu5r9B1G
         xoFkAzZ9bDe2uYT7eISqw1Q2uvh0O7fQl0VryaL1y9JtPym1prleNbFWuWOZ6iA5AmjY
         n4E3l6+aaeRRAUXIe1R02pAU1Huw/an006GwYDsVY9v/BxCwWaQTsxETNor4W5WMhXa2
         fiyEeWNbiNZlVcMTX62PvxdATS4nJUgvaIAh4oPLdyhPuqGWFIo8ik1E0sjzUDVJVIiW
         MFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900587; x=1792505387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TUuZT1wFoqbpc7B/LNd/6pZfnJKi059fMqGVzqoVyA=;
        b=PGa39hU6TXQJyFjziyNumGaOh5kN7ScURh1vIlplTQb2BiE0Adzagkg8kx/MrGOVzx
         Tab+c1v+QS0h4kcjF3yMI2Yy7Puae0GYnLNft9zY5m5m4X6DcBhkr5EJz56CSOWH1HuV
         0ynTiRgBkWMrToLG/54qVumoEQ/l9SULGU3RIjHGzqsFpkPwquHL/qXQjwnaQEtFEERy
         GpyclcMGy4t+HdTIjHlD2e5Zc+UJmYRHfZQxN3eV9swiLpxqApNK7VTAzdteolbH/2N5
         xkdBF6cQ04Q10JwendNO0snhUuLPl/yxHR6DN7RcLTUvDEPugNLR3JZffgQTuKuHBTHR
         5i6w==
X-Gm-Message-State: AFq9FYJsQn0D5u0nv6QZyUc6TBx2xV5Jl1UbK1thv+A9W7KXZp+zPFRU
	gSwBDkWBmd/VkqKns59Cb+Oqj1UZd0fufHBLuY1FW6DTlMaD4cdbYm2e
X-Gm-Gg: AYBFou1pnNJ6mGDwS5UBxokGMXSqaT7xSZ5JXsHP429YCYj9COPQUgjYGWMiCdFNAiw
	YY9/vafozS5VBqSjr9ZdToG86zzLe8fkerQfoDNXyn06LTPXA2WoOkh/qWlqB+zJ/t1va6vGO9q
	B8tK8Ld47eJooQU7MQcZZr7YZS3uPeTkCNjdwbsxNJ/EbXI4kYcpslLl3NJxe4/5/Sisp3nCwyc
	l9/PUu90CKB70z7S3d930ymCUjccQwnamAAFXpR0svOo4SuVdaMyivpXv2Jfhp3cy1LmMJ0J/nQ
	lLHQ5z5U4691gmH0AFTE8HF5wYajYiDCqpR79+aFoNYgUKrhtQGzC8LjcjCP30okFeIL8FVlPJn
	dS96spZ9N1RYSnu8agdkB1oH+WkvicDMivBh8hxPcQv5UIPcEt2ljCJ3qx0h0DFT/1iq3uDB3iF
	Jh4Me5TX9d0Dkn8D4Do9SjFwVwJszGPDJITdGMFXG+PIJzQsCT29EYmIWBACTIxag=
X-Received: by 2002:a17:902:e884:b0:2e8:b4a:43a4 with SMTP id d9443c01a7336-2e842ac3d95mr116552135ad.34.1791900586736;
        Tue, 13 Oct 2026 07:09:46 -0700 (PDT)
Received: from gmail.com ([183.34.68.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm54023525ad.61.2026.10.13.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:09:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:09:36 +0800
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] remoteproc: core: Fix the error unwind paths
Message-ID: <20261013140721.fbmsl2xn4xi5ljn6@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-1-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:49PM +0800, Yonghao Zhang wrote:

Hi Mathieu,

Gentle ping on this series: it makes rproc_free_vring() reset freed
vring entries to FW_RSC_ADDR_ANY, guards the error-path stop() call
in rproc_start() against implementations without stop(), rolls a
failed attach back with detach() when available, and releases the
resources and power references left behind by a failed recovery.

Happy to provide anything else you need.

Thanks,
Yonghao

> The remoteproc core unwinds failed boots, failed attaches and failed
> recoveries in a handful of places, and those paths have drifted over
> the years: an unconditional stop() here, a missing cleanup there, a
> reset value a running remote processor could misread.  This series
> fixes four of them.  The success paths are untouched, and no in-tree
> driver changes behaviour when nothing fails.
> 
> The single-sided ops configuration that two of the patches guard
> against is not hypothetical.  Version 9 of the TI k3 refactor series
> briefly introduced it [1]: ti_k3_dsp registered in IPC-only mode
> with start() kept and stop() cleared, on the reasoning that
> rproc_attach() never invokes start().  The shape sat on the list for
> a month before the rework that finally landed removed the ops
> overrides altogether (commit 41d746b3423a ("remoteproc: k3-dsp: Don't
> override rproc ops in IPC-only mode")).  The point stands: nothing in
> the core would have caught the intermediate version, and a driver
> sent today with the same single-sided ops would pass rproc_validate()
> just the same.
> 
> Patch 3 mostly benefits the attach-on-recovery users (imx_rproc when
> the Mcore resource is owned by another partition, xlnx_r5 when the
> RPU is already running firmware): since attach recovery was introduced
> (commit ba194232edc0 ("remoteproc: Support attach recovery after rproc
> crash")), a failed re-attach was unwound with an unconditional
> ops->stop() -- powering off a processor which, per the feature's own
> contract, "does not need help from Linux to recover... Linux just needs
> to attach", and which zynqmp_r5_rproc_stop() would additionally flip out
> of attach recovery mode by clearing the feature bit.  With the unwind
> detaching instead, the processor keeps running under its original owner
> and the next attempt attaches again; attach()/detach() stay paired
> one-to-one with the attach() calls that succeeded.
> 
>  - 1/4: rproc_free_vring() writes FW_RSC_ADDR_ANY rather than 0 into
>    a freed vring entry, for the callers that reach it while the
>    remote processor is running and the reset lands in the installed
>    resource table.
>  - 2/4: rproc_start() no longer calls stop() unguarded when it
>    unrolls a failed subdevice registration.
>  - 3/4: __rproc_attach() rolls a failed attach back with detach()
>    when available, keeping the resource table accounting and the
>    state consistent, instead of unconditionally stopping a processor
>    that was started by another entity.
>  - 4/4: a failed recovery releases the resources of the boot it was
>    trying to restore and voids the power count, which nothing else
>    can drain once the processor is offline or detached.
> 
> Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
> driven by an out-of-tree platform driver for the Allwinner remoteproc
> hardware.
> 
> The error paths of patches 1 and 3 were hit on this hardware rather
> than constructed.  During development, a subdevice registration
> failure during rproc_attach(), unwound by an intermediate version
> that called detach() without the resource table reset, left the
> freed vring entries at da 0 in the installed table: the next
> rproc_attach() failed in rproc_check_carveout_da(), called from
> rproc_alloc_vring(), with "Registered carveout doesn't fit da request"
> That trace motivated the reset bookkeeping of patch 3 and the
> FW_RSC_ADDR_ANY reset value of patch 1; with the series applied, a
> failed attach can simply be retried.
> 
> The failure path of patch 4 was exercised by renaming the firmware
> file once the processor was up and then crashing the remote core:
> recovery fails in request_firmware() as expected, and after the
> file is restored the next rproc_boot() performs a real new boot
> instead of silently returning success on the stale power count,
> with no "already associated to resource table" leftovers from the
> failed recovery.
> 
> [1] [PATCH v9 17/26] remoteproc: k3: Refactor .start rproc ops into
>     common driver, 2025-03-17:
>     https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/
> 
> Yonghao Zhang (4):
>   remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
>   remoteproc: core: Guard against a missing stop() in rproc_start()
>   remoteproc: core: Roll a failed attach back with detach() when
>     available
>   remoteproc: core: Clean up after a failed recovery
> 
>  drivers/remoteproc/remoteproc_core.c | 144 +++++++++++++++++++++++----
>  1 file changed, 127 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 586a2fadadb160295a93e5d5d32db1a2558a4d3f
> -- 
> 2.34.1
> 
