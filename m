Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E919C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 17:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F392764E83
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 17:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhBWRdM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 12:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbhBWRdL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 12:33:11 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED30C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 09:32:31 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id y202so17992676iof.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sCzg+nKVxIuCagcfYdWxuIEnUuuQqfinjAUu5/j1YI=;
        b=HY5ll+63utPg958PzpC+i8JM7QhPmHqigip37BLFjKnX5XT478VILpqKcgs8iYpGFO
         HN0nVkDqRo/rGPNfeQgu0V2baqGLNx0MMVwEzm57EeDqGl44IGdLWB3bk+iMCgIJ3TX4
         5ENjgC8usx5r7M2TZW3Wcvhhjgmqx8vtNAWCL7dgUKiA8r3fXevwPT5TqTLwtQ6If4Da
         f3n7IcZKeAv8+ov6DVC0bC+hJ9DRNIQpRwKdKaC8TfGzlzVG/00fmjamSinRAIf7Cjyh
         s8cQGcDvsm0dGZtxiqedZDalM+PlQpwU4y+LCjVM3JgI855hd2qRJw5Iy+a/gPP25D+c
         aRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0sCzg+nKVxIuCagcfYdWxuIEnUuuQqfinjAUu5/j1YI=;
        b=OdcHOsOIdMGrC8PypTaJsJ3OFtKHzfuiofRsJhO68XwE4K3oMki9H1TJ7SoGi8Q1hw
         04OaosTJnNHceeNj1weG1C8kkzSMMHWH8x2tqVdXObC2TeqHqGlecTvoXat3RrIX2dm2
         q7Gd49skzJLZdx00dhGFq77EDDwe5KNeciJZbx+aLuPKOeclabdSeDOoGKQKjp/ENtC0
         VajzYWhi52Yvji7uzJdQA/kldrv/I2NJpQED/OR5cSDV+UCDD0cyBYEyxxsQV8u8NzIX
         YxsscAvC1yffJJavDZxTDm3a3M5wXJKyqMEVQwJJJN8jKLTVA308UFLeQYK1XoxjATpG
         AlZg==
X-Gm-Message-State: AOAM53367LAaG38MI7OqU/iY+ixSiKtGQxGNUJh8MNdfC/PJHKPf+CcV
        PdUfKVSPxVvazqohFO1PoERfAx1UVUfe2PGwG4jgpg==
X-Google-Smtp-Source: ABdhPJz2j5az4KiW7kby7Dt0obvVh8ftfw8CWNaHRcOKVpSbWP24TNkLATI8qFyxclmqIDWvy9uIT1N0L2lVfyQ6GMA=
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr710607jad.83.1614101550799;
 Tue, 23 Feb 2021 09:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20210222072217.15633-1-jindong.yue@nxp.com> <CABCJKudwajnmHAEC1XAH=pouCoOXq7q6NmpLST5pba8ejU6FtA@mail.gmail.com>
 <CANLsYkx0Y_f8tdeioUFrwBRV8M6OtLcSuPDZbgb6noPgrfyjOA@mail.gmail.com> <CABCJKuemAmeaSshvb=B6D1kBt-n_unEx11rwzOZmDxAd+EQ31g@mail.gmail.com>
In-Reply-To: <CABCJKuemAmeaSshvb=B6D1kBt-n_unEx11rwzOZmDxAd+EQ31g@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 23 Feb 2021 10:32:19 -0700
Message-ID: <CANLsYkz+ZZS-gGL8uK9cR46PreF5to0PRk_nGGmZiNKUkToYdw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Remove casting to rproc_handle_resource_t
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Jindong Yue <jindong.yue@nxp.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 23 Feb 2021 at 09:49, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Tue, Feb 23, 2021 at 8:41 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Mon, 22 Feb 2021 at 15:48, Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sun, Feb 21, 2021 at 11:18 PM Jindong Yue <jindong.yue@nxp.com> wrote:
> > > >
> > > > There are four different callback functions that are used for the
> > > > rproc_handle_resource_t callback that all have different second
> > > > parameter types.
> > > >
> > > > rproc_handle_vdev -> struct fw_rsc_vdev
> > > > rproc_handle_trace -> struct fw_rsc_trace
> > > > rproc_handle_devmem -> struct fw_rsc_devmem
> > > > rproc_handle_carveout -> struct fw_rsc_carveout
> > > >
> > > > These callbacks are cast to rproc_handle_resource_t so that there is no
> > > > error about incompatible pointer types. Unfortunately, this is a control
> > > > flow integrity violation, which verifies that the callback function's
> > > > types match the prototypes exactly before jumping.
> > >
> > > Thank you for sending the patch! It might be worth noting that Clang's
> > > Control-Flow Integrity checking is currently used only in Android
> > > kernels, so while the type mismatches are real and should be fixed,
> > > they don't result in runtime errors without this feature.
> > >
> > > > To fix this, change the second parameter of all functions to void * and
> > > > use a local variable with the correct type so that everything works
> > > > properly. With this, we can remove casting to rproc_handle_resource_t
> > > > for these functions.
> > > >
> > > > Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > >
> > > This looks correct to me. Please feel free to add:
> > >
> > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> >
> > Where is the original patch?  I can't find it on the linux-remoteproc
> > and linux-kernel mailing lists.
>
> Looks like it was sent to linux-remoteproc, but I also don't see it in
> lore.kernel.org. Not sure what happened there. Jindong, perhaps it's
> worth resending and including linux-kernel too?

Something definitely happened because I can't find anything from
Jindong on the linux-remoteproc list...  A resend it indeed in order.

>
> Sami
