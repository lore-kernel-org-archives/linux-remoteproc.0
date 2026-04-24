Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BABF23AB9D
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2026 04:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777006146; cv=pass; b=tn3epTJThTs+mIlSbWOlrg80wbEU2PSSjxk3PSmlkcHErVlbEExOtH/4GaiNn6G1TqaW1Y3NbQhwKcVaxZRZsWqWLaDiqebneqry9KUsFnsf4ytRbgR2CQ06iWMeJiOpmkApbQa0IHARJrsTVleRrbLNRiAjPtWR1CNFz6WgkRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777006146; c=relaxed/simple;
	bh=cb2eWSw+22Qonpn9Tb22KQ4icCPJxn0cmAYICJrufNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUtHgXk2w8TbnQWCEvB7WTeJHEmSYlYa/0i6YoCavTcv6OFV/Hi8d2m2L682E4ey/llVAEt/MNzyIVQsPSb4iwlCfs+mqNy58oWjYs5seNzevt8wk2AvY0UfbpwOgeQk5/+M98zEviIfBkwYF8Otn6xV/ZVTOcWPOX3Q4vPxfH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFFM/2q4; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFFM/2q4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so11248441a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2026 21:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777006143; cv=none;
        d=google.com; s=arc-20240605;
        b=VscC06bya9PnKC3lbF1336CF82XvtIN8zqqgHxIQO5OllCXEnEFI+9XPsWx3Vu0vgP
         5YGcUc/VwKtcHseBcAZ1g83hOg11XWUH45umFvolRfbQWQarDn6SxcBbjdGazAffjVCu
         uGy9K1vr1vIDvhtdRY85cgzz41xCHP4OubHg/wCsP+ziJJRFrzjQgCuTO9DyBht7i5EJ
         Qm5MhuAF1w3T+HoPApQPQpX5eDivajCi0ZX6WYi+dbJNC8OrK095xiMUwogsSKCgahmq
         EmmYj3YtVEB1vj7/kTRgncVJs8ZraeC5bcG32FMwG3F8dRnnCpbW6io1dpuZjqEI5cvK
         7SmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PhaWClBL8TyGygG56i3QMPE/xAGru7icQmop6bWUldI=;
        fh=f+wror7WeoYWLM79l/GrPIDeK6Xl0JR7XNG1srEbLXw=;
        b=V4c8eSv5+msfFBa7xtD8V6Ifum/JNqtEeEXxUsZaVYrZZ4t/vmfmN4PpRcSQyy4DRw
         P7aPQfiJ29IDCcjh27fe2wg2d5CB1gLCEvaU31VtoRJes9Y3uwgLXil7guuXgWPVML6h
         3WLvnJpY8I1S5uTAMhQEW2WuX7MdDrFAkBocNvMoPdXkPUZmauYGIYDx5+Drz05h1cev
         jescrqnP+yRnhsYQMNP8UErBzC8VWDVkgBQXWlvz1fll/9dX3wjPJnPpPoVhx4Wzb/pY
         uMdFXhFdObv3lw9D4dqXIZewx1ndl33bTajEuHNRETSFc9OZIDttLMHBN7apfumHEhvk
         aFeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777006143; x=1777610943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PhaWClBL8TyGygG56i3QMPE/xAGru7icQmop6bWUldI=;
        b=kFFM/2q4OHPa8iJZ5PYIFs1r5W1rr5zfFnPG/JxWkT5q9UrAHxNRXarld3Lou4vwVr
         lh3KLqSmcNVPJ2LMLMN/zYAQQmJDnUdGLvMNsqJILSMDgmsLbhUbdfMNPk02L3irs5i1
         SNk9zV12tMaJOMI/MipiL3cGeZFV/wZyu6dbI3mKTMDKUDQwz9ipwLbsIaVIH4t09H1O
         4CJjvQymt/N0hlWh0CQ/UwPsnexPTYvnRJnLxz2jiFFrmY1p8XTvYrV/Gstrm69yU+Sp
         WUyMVXNGMXOBAmA8Q5kfJ/xgFHP3y9AEKzz3rGoaOEPb7vIc0nsxD7hio8xP73mqTaWL
         aAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777006143; x=1777610943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhaWClBL8TyGygG56i3QMPE/xAGru7icQmop6bWUldI=;
        b=dT7Wew8WRE7FDMljWU+6Ri2lU4+tGUnzuG0qIrVxRb74IVLj1emGaZ+tgDm9QkvMie
         mdTmzLS2CxpSJbKigKfby7EtYaexwS91v+uxJ2ivOpOMYeiZc8hhoBxy2jC9opwDAIzL
         B+6zlGQkX9hQi7IwZLXsA8WMvaQHOfL2/34rCZphWooF7tn38B9mbBMEUrirA86rrrgy
         vlS481r7AKUD38i7HBtOffVhFzRugjy7EEJAZQqt61+djA0rvbvmE7o+FTp5SXknlCpM
         ECYwFP/gDchfwl3tjQjJ0HIx0CqOyXrPZOnm4GheSozhn/4aiv1AYIXs9Ilbi6NfSe2w
         tWTw==
X-Forwarded-Encrypted: i=1; AFNElJ/m+ptZTE93SzyAfPN4WNCiAQa6rkZ/jCArqwHSU2eEOmoy5P2UEFFZoWx63AC43U2UVCbLNmNZzc6mtJ6UIB44@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwX3Mv0kyyWV+sTn8JSn9r2t07xy05kxunKO4WF4vtoMrz43G
	nad30rnWJrYP21boD3uE0cF2CiZTIsA87F+IsQbrkCvoQWuvXdUbIGUk+2+Zv1v8C399E86DqFw
	15PWpZGuMoy68eIB2yg2bwWPRA+NIYdU=
X-Gm-Gg: AeBDieutZGtGRC6yGKEjGFVSYhKUhSoOjSqitB4MOz1QmqT4wPnTgirCKv1yaDVKQ5H
	MhuzV6bt4gUauRopdldatwAY6P8ynMgpH8Bk+0xbi0m446v7NBuIyV3yL5JLosUc6aiD2U2Dgl5
	o4uIEyLmoyphUFw5G7TGxsbBh4Fs/HgrJQ0a+IQvG/AQs+MXjAmKMAaLgjQNMSwX7GBAKyBEk/N
	NOGgN06RhNhf6qnhRDoWQR8SsefqfkKZPTeJVY64uev9V/MY1a+B1cAcS5MzBj7mCYoIsg+EvzG
	AXZar/0k7lkqiRVhSJJMcn5gGtCQ
X-Received: by 2002:a05:6402:28c8:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-677270f7f6cmr3558097a12.1.1777006142494; Thu, 23 Apr 2026
 21:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416042338.10146-1-dbgh9129@gmail.com> <aejgg4J6ygbsP-kI@p14s>
In-Reply-To: <aejgg4J6ygbsP-kI@p14s>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 24 Apr 2026 00:48:50 -0400
X-Gm-Features: AQROBzAqD2os1JxswIMBqd-1RLnhiKI245OS-d0vpVsWAX4YRwsrQgCmPrLhX0A
Message-ID: <CACrCO_VZgTCm5ZF9FN6MDftQW6TgODsA3trDghycFW0ufswk5A@mail.gmail.com>
Subject: Re: [PATCH v1] rpmsg: char: fix use-after-free on probe error path
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Mathieu

Thanks for the review.

I will fix the Fixes tag and remove the header in v2.
The check will be added in the next patch.

Thanks,
Yuho

On Wed, 22 Apr 2026 at 10:51, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good morning,
>
> On Thu, Apr 16, 2026 at 12:23:38AM -0400, Yuho Choi wrote:
> > rpmsg_chrdev_probe() stores the newly allocated eptdev in the default
> > endpoint's priv pointer before calling rpmsg_chrdev_eptdev_add(). If
> > rpmsg_chrdev_eptdev_add() then fails, its error path frees eptdev while
> > the default endpoint may still dispatch inbound messages through
> > rpmsg_ept_cb(), leaving the callback with a dangling priv pointer.
> >
> > Avoid publishing eptdev through the default endpoint until
> > rpmsg_chrdev_eptdev_add() succeeds. Any message that arrives before the
> > priv is published should be ignored, so make rpmsg_ept_cb() return
> > success when priv is NULL.
> >
> > Fixes: bc69d10665690 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
>
> The SHA should be 12 characters.
>
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index ca9cf8858a5ef..549a24b70884d 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -11,6 +11,7 @@
> >   * was based on TI & Google OMX rpmsg driver.
> >   */
> >
> > +#include "asm-generic/rwonce.h"
>
> Why is this needed?
>
> >  #define pr_fmt(fmt)  KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/cdev.h>
> > @@ -104,6 +105,9 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
> >       struct rpmsg_eptdev *eptdev = priv;
> >       struct sk_buff *skb;
> >
> > +     if (!eptdev)
> > +             return 0;
> > +
>
> If this is needed, the same check is probably needed in rpmsg_ept_flow_cb().
>
> Thanks,
> Mathieu
>
> >       skb = alloc_skb(len, GFP_ATOMIC);
> >       if (!skb)
> >               return -ENOMEM;
> > @@ -490,6 +494,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >       struct rpmsg_channel_info chinfo;
> >       struct rpmsg_eptdev *eptdev;
> >       struct device *dev = &rpdev->dev;
> > +     int ret;
> >
> >       memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
> >       chinfo.src = rpdev->src;
> > @@ -502,13 +507,17 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >       /* Set the default_ept to the rpmsg device endpoint */
> >       eptdev->default_ept = rpdev->ept;
> >
> > +     ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> > +
> > +     if (ret)
> > +             return ret;
> >       /*
> >        * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
> > -      * Storedit in default_ept *priv field.
> > +      * Stored it in default_ept *priv field.
> >        */
> >       eptdev->default_ept->priv = eptdev;
> >
> > -     return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> > +     return 0;
> >  }
> >
> >  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> > --
> > 2.50.1 (Apple Git-155)
> >
