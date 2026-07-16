Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995232D45B
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216943; cv=pass; b=P4PWFu06W5eEG2COL0WqNZR5o0iH58S8O7eqfaB6lEXgKPR02ZtnhXanmi+ynZ9SrzBOl0qEram0qJMl5EpR3q8tDuUSf1kCQVrNBRgNdKkhhjEQnHENgvetlJ2R+1b1VsG1aa7gNDtnd744UxMSHX9+tbfTtavI/wPIOBiqZyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216943; c=relaxed/simple;
	bh=UEXyRcrLR/NC7O5VT7IsT6QSrIvIK2do2cEY+5CAQ8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHSTvOKSpLjbsXVyT8RxjUqZRHRQAfQB3KYlfV25DNvJyutmM5AH2eqU5gHRMMgmcBdOUiNz7QurL0zbkmuHV5HahkyWVwnVjmJDA6usUedP/hGgZYXOqI6IHP9OWBM/HdOWJKZtPh6et5keuIgaEZwPgfj3JqEFrPAwH7VEVtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFvJ22ac; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFvJ22ac"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1614804757so715026666b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 08:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784216939; cv=none;
        d=google.com; s=arc-20260327;
        b=HhTDeo75Bs7HN19v62WbHrKAvE5trHe5CGhXhVoGHgI1q0sGeFCsEZkI7cPa3rYEO6
         w+zb0dvrxHng3VHhQoJKvLdE/0t4CGBi0/1VgYtfBn96LodDNfNh6GM9Uravb9m6aL05
         vzv8r2qFHVswMg0IPnunMdjM0X/tf6ZbgggcBkulfH8mPcx+pxQRXkznooc9qFbAwA0S
         h0fUS//xQjbtl+RM45y9khk0NGgqvv738paRCCvmp/704zO941gWmb4Sx51yMfH6DEjj
         j9E9cPKZ271u5AwkcdtLsrc91T1kCIHtBFN/7j+q6ulIyTuZpyJI95zj4zwJ//B+YWJN
         w8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        fh=fAkcUyd6MvtlYtSQkxcpWmY406d2iHIDfZv9kCbDmKI=;
        b=HNFlFOJ5ghRwJcmJ18mB3Y8Zyt7iNHqIxTljeSOafXyees1WTChYQm4mF8L3sIKnEU
         EBUJkAqDQl6ktpDuj/lcFiqz4K+Y99e+Gas2ymavNoGbeMiKuysOtALkpXqOvpkl+ZXT
         vuVb4iHDoxcDnRwvisYiIdiZu206yaIJ7/imQDI1b/OYko5sl0re5apQGKGpBi2TBnkx
         RGwob+sgtUCyGGi2jgJXEX/4vsp1aLhxRzgbPmTjLxUCrY8HNyVxZJ+bCH173AGCM9Gz
         fbvmvyuVFrHl13W6zMKmglbromAuy8OtxW/Qh9hVZgH7sJi0ZawXKxzp99M0OLuoCJvQ
         xVig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784216939; x=1784821739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        b=HFvJ22acY08A0ZH5pzkLrxI9y5eisg+U3AQfIKhxWEX2QlOsaNBogrXrd0+UwYgWRQ
         hT/A/uGDSMAhqNInnZnGD6YWO85ft4YXpyE7rrKE0fRqyOome+GDjtOKUoUkQ24GuPCK
         m3G9qBzv+gOse9t2lMXJe6k8BpK/0Ubu89WnJdB2UUZY7Orm54+VDYqVjBd0zE8//Qkp
         KO81Cboh32JUwgttkq6qEcGou9HONLfy0A5vzxb7PQD34fUYHbZitMxYjnid9yedRETr
         eJ+XIBObv3Zc9RYyvhjN+pemJvEac7zGiYIEAfivr02CpRVKBsj4lvIao7MXQDQJMg2h
         stig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216939; x=1784821739;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PvF3PECHceKTp1msrpngOjA14xNenycZL6f6YaUqTqA=;
        b=WmhRSTKjan3vTXsz+vK3gF28M/SyW2NpNzD7agzA+HnGxrhsNrWjwc0WkjZg2LbZf1
         IQ4zNss1Gy0ka2DgFesHxRPjeiTOnQnyDAVBJq3bkaXO4vj3aaa1BSIXbMjahCTqd5QD
         vfMgBTQbg3Tw+MCQmA7zZMwyLKI1T8GjIx6Wh848i6nLXNuvIOuATbfvOiFEPf5RhXpF
         vY8Bn8TIM7wBIsrV0a3pjdeijgcG54/FZsfbrXgLTrF5bnHDsnzEMJ3zZvxwl9aRlVJQ
         JqskLTWrbGFf3qhupQKV/8IA7NyALnLjpyrcPG7J4R/HUfAJXp6Jlouch0Fgxubnc2oS
         9x/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpv2PeXiRGgBbqm6xs4ilALrSDdNMTgC1ZDOlINtAgBFZaMppZgjoDTSPHJesJA5aa8+kry/4bmDfSVO7F0Qn8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+DI6vcS87F3ldpChpwLLy+xvCVaYqejUv5OsTYGf+nhzGnzY
	7IL94QROGCNHA5gJtAcPNIlBKN0hWYQkrCQvrKg6TPJpOJC33w21XB0/10TTEOxXqqrFn1GC8Jo
	B/HFDT6a3Dcdumu9s/8EbCpAzJoltA1zWwTeRqeQtLg==
X-Gm-Gg: AfdE7cmVWp75yEhuV87jOlBBoLLY52XbEyfROHPbT/WXuKMDV/6EuQREI7sYj+3FbYx
	WQPm14xopCXukfP9Dt4sQRdUcbKthG33CWiqPOmI/6gsCn8rqXXYQpCdLkgZVi+N4HDmXTocqry
	+R4yCiu7iHavpPG+4b+U1bZBHW9hdpPMg4GAJ21FiUVHGS0mCr/bbe01Z9f0NQ+/0bIYuPZUk16
	odLZpJT7qHGkfDCfcrvgmflXnRBbCwbd9eLsRefpHvk0pQ932jUmDSf5Y+cy73093QCtYnk1lnC
	rvsp4u59lzSKYJDs/E/l
X-Received: by 2002:a17:906:478a:b0:c12:959a:1477 with SMTP id
 a640c23a62f3a-c16792a5896mr462980266b.40.1784216938593; Thu, 16 Jul 2026
 08:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710192831.3440427-1-tanmay.shah@amd.com> <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s> <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
In-Reply-To: <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Jul 2026 09:48:47 -0600
X-Gm-Features: AUfX_mzLfM9exUpIBMTfqHJwwmxDBQ4xwa4WD88FJUhtRPdx2rllkZk4ggWYQ8c
Message-ID: <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
>
> Hi,
>
> Please find my response below:
>
> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> > On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >> 512 bytes isn't always suitable for all case, let firmware
> >> maker decide the best value from resource table.
> >> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >> Changes in v5:
> >>
> >>   - fix documentation about alignment of the buffer size
> >>   - change version field from u16 to u8
> >>   - remove buffer alignment check
> >>   - Separate buffer alignment vs MTU of a single buffer
> >>   - Use buffer alignment only to get next buffer address at alignment
> >>     boundary
> >>
>
> [...]
>
> >> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >> +#define _LINUX_VIRTIO_RPMSG_H
> >> +
> >> +#include <linux/types.h>
> >> +#include <linux/virtio_types.h>
> >> +
> >> +/* The feature bitmap for virtio rpmsg */
> >> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
> >> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
> >> +
> >> +/* Version of struct virtio_rpmsg_config understood by this driver */
> >> +#define RPMSG_VDEV_CONFIG_V1        1
> >> +
> >> +/**
> >> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> >> + *
> >> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >> + * @size:   size of this structure in bytes.
> >> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
> >> + *               two. If 0 then no alignment will be done. This alignment
> >> + *               will not decide actual size of the buffer but will be
> >> + *               used to decided the start address of the buffer. The
> >> + *               actual size of the buffer can be different than the
> >> + *               aligned size of the buffer.
> >
> > Is there really a need to have a buffer size different from its alignment?  It's
> > not like the (small) delta between the buffer size and its alignment will be
> > used for something else.  I'm fine with a buffer alignment requirement but in
> > those cases, the firmware should set the size of the buffer in accordance with
> > its alignment requirement.  Otherwise, the complexity needed to manage the
> > discrpancy between the two yields a driver that is hard to maintain and prone to
> > bugs.
> >
>
> I had the same concern before. However, following example changed my mind:
>
> So, a single buffer size is the MTU size of a packet for the protocol
> supported by the firmware. Now that can be different than the aligned
> size of the buffer.
>
> For example, the higher level protocol (not rpmsg) has 430 bytes as the
> max size of a payload. However, cache line alignment is 64-bytes. Then
> in that case, the aligned buffer size is 448 bytes. But, that doesn't
> mean we can say protocol's MTU size is 448 bytes. If user end up
> treating MTU size 448 bytes and use space beyond 430 bytes, then the
> higher level apps might discard that data and communication may fail.
>

How is that scenario different from today's 512 byte buffer size?
Most users don't use all 512 bytes and we don't run in the problem
described above?

> The alignment field is used only to decide where the next buffer start
> address is to ease cache operations.
>
> Sure, we need to maintain this complexity, but I think it's worth it.
>

The same as in my previous email to Arnaud applies here - is this an
immediate requirement of something we think may be happening in the
future?


> Thanks,
> Tanmay
>
> >> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
> >> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
> >> + *
> >> + * This is the configuration structure shared by the device and the driver,
> >> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> >> + * the structure is naturally 32-bit aligned.
> >> + */
> >> +struct virtio_rpmsg_config {
> >> +    u8 version;
> >> +    __virtio16 size;
> >> +    __virtio16 rpmsg_buf_align;
> >> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >> +    __virtio32 txbuf_size;
> >> +    __virtio32 rxbuf_size;
> >> +} __packed;
> >> +
> >> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >> --
> >> 2.34.1
> >>
>
