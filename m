Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635285678CD
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968909; cv=pass; b=ZiNABksjmQ+DAQQBc8Up5WwtR79Bb3FByGCxhL24xcTLB/4EIBvdkQ07ocnuSY0/nfpWlPBP2mUUJdrx82DyNmCxP+8ez5VF6jdwcrcwO1CZVwlQnHfBfLHXc1bqU/mpex+RmcU21AIr512vpIxB7AYbCxeywQgziy5vSv9H16k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968909; c=relaxed/simple;
	bh=MTB4vhRYMuyozT5gOapSPVf+DqNctDkF69x23GTF/iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7FhPHUEez5B5XQnJTtOxNc3uKG9/l68m6F/m7/l4zmHpLO+6a4Wh7pkpaEdTFy6wZazpTGZEP0X+N6/QfykfQ6kIeyJBEASWO7nHD9npVb1kHRerStO++BupUbih4hWG40Y9sYCj22LNNEb4nR3D8CiGjVf5kI99oPZ/PmX0Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFFiIS4b; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFFiIS4b"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a998436551so1112422a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 08:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788968905; cv=none;
        d=google.com; s=arc-20260327;
        b=W4sE1UU4gafIyYAo8Gcfc5GFO7vtukAkb54soWpa4H7z/+SbKGpWUbWvuEj+ej4JGH
         jXTXFz34fbn/8ydzVDy/r2li0bSG12P8gZ1Faqe5wY6gF96m0xEhWsr5NV+nZFzY2D18
         jj22Ua+NKD+dg1RIlo3vjmjjYl1qcUaEoERi8AYmSMV/cQ9eTtgXgitaGqpUDMwb88iE
         C8Bp2+bmAnVliGbXHPV9rkz4oHetuhOHn+BHyqApm+A8NFIXXp+OUd87aP9T87wrDZpY
         GcyUXZIJHWoIFuijD/LHUQr1gkfgB2SqE7X9nmVYhrBxFdOvIEIW72p7NuGi6f8M+edd
         tjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AvEpio6Dr+dAXZtOEeFZQcmLQCRLUtc8KQUOMMbwMyw=;
        fh=OWs37YknSZkHXoGhTTe9nilvKmojkpqUeVGzWx9T0aQ=;
        b=Xeq3+O75GP4cuJknH72dtbGmyFLu9qSjN+YNizgZGoN3nO4D62tTW5ZewC05wb2slo
         h9d5JFu5FCey4YcabJTkzXk2qBWv5Bvy0t0RSfrvMQGOSqhpPG8NCdBQrNlCZdxxhbyq
         i6B9FBjE2+6JO//f5fEmLLE6r0iYGYi5Va/X5HfR/HKElVGLuTRiJDPc5scB2Clv14dp
         KMZ9PSxUllNLZZyn82juqbYiK/zGaTmpKNgRlLCvYsAoRn9GJ6e5k+WkFd2vo0l+NsTE
         AiU8ng/FD9LcnJ5+4RLncx/pe+17nUyC0dS9jt/44xPLW0riy0wX2ONeD0AagdF65b0p
         6idA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788968905; x=1789573705; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvEpio6Dr+dAXZtOEeFZQcmLQCRLUtc8KQUOMMbwMyw=;
        b=nFFiIS4bNHIHvPpce9RDUIhW6aOwlwQI4zzqE1gPbF/Shdhw5Nze1VqAhsrjIijUJB
         q0hFmMG+XMzBpQbOWAU06Lvn1/aP8mpq/HYUHFfy4yIs58M2tM3ctK86kzuzhKLFymih
         3MDFcJJIFKJCZsHFmHLzLYuZ2P+c7F37dw4ZUpQWCY6Wx1ZQvWPGNB7qG8BKkSpQq9Wb
         uG2xNJuysNjBjJJffy2KFl8uCNeUHJlF+Jtvj+D6gZdpCbQCecWGf93wbLfHCKcxlSav
         hkognObi857fhGzV9zq1QkSSk9mozxXCr8ufWOh5sJy5aT5LMx6wpipFknbvxLHqA0mE
         bpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968905; x=1789573705;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvEpio6Dr+dAXZtOEeFZQcmLQCRLUtc8KQUOMMbwMyw=;
        b=cDFmfq/a0Zpfl/xlUG1BabqnUsUwFUEGBysZasTmkeNo17CyYjYq37EPczi63IN7hX
         MS9Lvzo8POAQ8XqLZxy8ULuD+TCZCiAzAcKzfEgPqoqY49d1ocjICqLAniZnerBQhTrh
         Miy7ecJPmx2auUDZNo091MuBag2MBsY3XuZAN4N/Q+AYxkemvZu89g+h7AqzCC63UhXM
         vnJyRi/n3693k5klLBLPRmOXwq+HNR7hxoGlIi9s0bJO/qgRdUOCw3sO9IUIPkLnVbpJ
         c9hvHOtxyiX2Eccb/qrIZMH7WBnDv6D+uj0IH6HxYi1nmzFmVFNbtHKU752dr8HrZL/N
         pThg==
X-Forwarded-Encrypted: i=1; AKwUvBzwCo5oLHoKp0P3t+4js/zAds41hMUprmD7bHZbDtCeMzVy7Y2JOt2mzso5NggjpHTRwDmHvTdHA+OdWQv6aU1R@vger.kernel.org
X-Gm-Message-State: AFuF++nhOFCn/uj4hbnj5nxYH5O/hmSDP3b1d7Vo0tDB5gzoIIda/tVG
	T6CAKG8N2yQdHFGXJQZRfLGc/Y9wZaBvPCIq2zMir+WebCEZz4lg4b5ym301MtY284Gl7cjgOP8
	w9emcoBjV+4poIibxcM76Sgn2qEFEkiL32UBmWV44fbH76ocSsUrr
X-Gm-Gg: AYBFou3yFUVwpZV1dF97I8EgXwaAfbcyYXZZrtOvCs3kt/Pxg2IWiMvJlbLw4iktOPh
	2noRMmjrskqXi8uDB+8DWCZi1hab3SuzvRisNrZw3laaSuKoP9eVi7bu8BOQ2RJ0uhBR0CyIctK
	D6a9G0r/0EkFRgCkOL6QPAS+nKQ2RapIPIyOtCnY1tBRvk1iMHZO/MOW30DT6Ngc1iDnPD88qNA
	Mf6cA7wCo8k7uh1VZJojmSZ3sItHZz9Q8TYUrQvUkLtchPtIl4/tQ9iajF+zzne/vbJMg4MCsBm
	XDIb4r7tNLVnR2yIrh4KY+PGFfQ//WzG9K68icsDRXY218M9zH2R6lG6ZSPQMu1J0flApjkMbQP
	BUYS338JiH+1Svg==
X-Received: by 2002:a05:6402:44cf:b0:6a7:ee54:f89d with SMTP id
 4fb4d7f45d1cf-6a7ee55004fmr9427767a12.33.1788968905485; Wed, 09 Sep 2026
 08:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904195634.2275867-1-afd@ti.com> <20260904195634.2275867-2-afd@ti.com>
In-Reply-To: <20260904195634.2275867-2-afd@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 9 Sep 2026 09:48:13 -0600
X-Gm-Features: AcwNN1XiyR7C76z1k0S5Yc-Wztfvzi4hQj7vmn2oE92ATkhGg1_zT0hJ4Av7cGY
Message-ID: <CANLsYkxzv53oxQ8NDaNM==u3xE0e9u1_BUUFCbNS+Xfcy9Yupg@mail.gmail.com>
Subject: Re: [PATCH 2/3] remoteproc: k3-dsp: Fix usage of omap_mbox_message
 and mbox_msg_t
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Andrew Davis <afd@ti.com> wrote:
>
> The type of message sent using omap-mailbox is always u32. The definition
> of mbox_msg_t is uintptr_t which is wrong as that type changes based on
> the architecture (32bit vs 64bit). Make the type fixed to u32.
>
> This then means we need to fix the helper macro omap_mbox_message so it
> doesn't cast to u32 twice. What this macro should be doing is converting
> from the message type returned from the mailbox framework into the
> omap-mailbox type. When fixing this we should add a macro for the other
> direction (from omap-mailbox type to something that can be used with
> mbox_send_message).
>
> After these changes, make use of the new macros as appropriate.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 10 +++++-----
>  drivers/remoteproc/ti_k3_common.c    | 10 ++--------
>  include/linux/omap-mailbox.h         |  5 +++--
>  3 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 6ed0f28edac9c..efff95b8e363f 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -499,7 +499,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>                                                 client);
>         struct device *dev = oproc->rproc->dev.parent;
>         const char *name = oproc->rproc->name;
> -       u32 msg = (u32)data;
> +       mbox_msg_t msg = omap_mbox_from_message(data);
>

This patch looks familiar - was it submitted before but not merged?

I'm fine with this set but would like an RB/TB from someone else at TI
(for all 3 patches).

Thanks,
Mathieu

>         dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>
> @@ -550,7 +550,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>         }
>
>         /* send the index of the triggered virtqueue in the mailbox payload */
> -       ret = mbox_send_message(oproc->mbox, (void *)vqid);
> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(vqid));
>         if (ret < 0)
>                 dev_err(dev, "failed to send mailbox message, status = %d\n",
>                         ret);
> @@ -628,7 +628,7 @@ static int omap_rproc_start(struct rproc *rproc)
>          * Note that the reply will _not_ arrive immediately: this message
>          * will wait in the mailbox fifo until the remote processor is booted.
>          */
> -       ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(RP_MBOX_ECHO_REQUEST));
>         if (ret < 0) {
>                 dev_err(dev, "mbox_send_message failed: %d\n", ret);
>                 goto put_mbox;
> @@ -777,13 +777,13 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
>         struct omap_rproc *oproc = rproc->priv;
>         unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
>         unsigned long ta = jiffies + to;
> -       u32 suspend_msg = auto_suspend ?
> +       mbox_msg_t suspend_msg = auto_suspend ?
>                                 RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
>         int ret;
>
>         reinit_completion(&oproc->pm_comp);
>         oproc->suspend_acked = false;
> -       ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
> +       ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(suspend_msg));
>         if (ret < 0) {
>                 dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
>                 return ret;
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 3cb8ae5d72f67..4b6da3363f6c2 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -54,7 +54,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>         struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
>         struct device *dev = kproc->rproc->dev.parent;
>         struct rproc *rproc = kproc->rproc;
> -       u32 msg = (u32)(uintptr_t)(data);
> +       mbox_msg_t msg = omap_mbox_from_message(data);
>
>         dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>
> @@ -94,15 +94,9 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
>  {
>         struct k3_rproc *kproc = rproc->priv;
>         struct device *dev = kproc->dev;
> -       u32 msg = (u32)vqid;
>         int ret;
>
> -       /*
> -        * Send the index of the triggered virtqueue in the mailbox payload.
> -        * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
> -        * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
> -        */
> -       ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
> +       ret = mbox_send_message(kproc->mbox, omap_mbox_to_message(vqid));
>         if (ret < 0)
>                 dev_err(dev, "failed to send mailbox message, status = %d\n",
>                         ret);
> diff --git a/include/linux/omap-mailbox.h b/include/linux/omap-mailbox.h
> index 3cc5c4ed7f5a6..e45f8c3841c23 100644
> --- a/include/linux/omap-mailbox.h
> +++ b/include/linux/omap-mailbox.h
> @@ -6,8 +6,9 @@
>  #ifndef OMAP_MAILBOX_H
>  #define OMAP_MAILBOX_H
>
> -typedef uintptr_t mbox_msg_t;
> +typedef u32 mbox_msg_t;
>
> -#define omap_mbox_message(data) (u32)(mbox_msg_t)(data)
> +#define omap_mbox_to_message(data) ((void *)(uintptr_t)(data))
> +#define omap_mbox_from_message(data) ((mbox_msg_t)(uintptr_t)(data))
>
>  #endif /* OMAP_MAILBOX_H */
> --
> 2.39.2
>
