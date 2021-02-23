Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AA3C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 16:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2A3264EB2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 16:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbhBWQuX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 11:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbhBWQuQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 11:50:16 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2722C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 08:49:29 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id q2so3798986vkn.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hppxaNuvZF4RtoIyCyx97F5+o6L1UtpFhzjnpRDReOU=;
        b=BCn631Zi8EX1COoO+C9ZI9wESGizzGZ1jl+x4MGHG6ldkf9l3InsoToEB1fZkEinaF
         RRN1F3gTEpgoCp5TJYpR+4ziIvjHW2L8ck04RM6YcmtBC8KBNLuFwG4gZ2nJdl1fUGN2
         ICMXi73V+wjUWH3sQ0iK1tQ3kR/52H+bToUGs+a2xEVBXdaAU0QbrrVSo6rMLGlz3vk0
         2EPx/5J/RBrZvwM7dINFACXJf3Enxtvi8wjhoIPXKwnDX3k8eGubUHYEqXorxomcvjh5
         VbKpCwun/qTOD6oQeZpyIr6NRDF7u43LyWoxqIJ1nFXBY2IZJv4cSf3bU/fVn9xn+DdD
         sTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hppxaNuvZF4RtoIyCyx97F5+o6L1UtpFhzjnpRDReOU=;
        b=UywXTYmXxtRTzpAsPA2d2jrgA1VA1cIdjUvKB3FuyZrqp+QqebJerDccM/aS7GF0K0
         ntD0VH6mAZc+IhdGNGu+UD5/XkMEmzO2IayLTBbniDZf7ZP7yzDqE9auUWP9V6LiIEtP
         v+ckZJogGUKWzAQDtjBj9CBknDT1vomplF4BrO9aPIqXcp/zAjj/JOaxfeIauCrpzKfV
         /T5efVCXsZDaKtW/buats3JAkUb2xSN4a3AY6JW+D2DVORVHz/fi+I4rk6LMwPf4+Cck
         XAkKxekd4Hmmo/32gro7Ojx7z04CqAjmiN/+oWoO6iKHSC3kNSNfKQdYM6u+5BUIbFE5
         VosA==
X-Gm-Message-State: AOAM5320EwSOwSk30OMFXNF1Vq3ghoI7CpoQLnumHRqShAYa63LPakJb
        nzH//wppuzWFsaMBws1pPc3hca34SO6GwMXyj8ulPg==
X-Google-Smtp-Source: ABdhPJxIldJarzDE6bop7IkLjGMHtktTZHgpT7YiWVyNfUErYV1SP9KN0TEO73Oq9gCpTia4ab3QttCbhHOfvuV+CG4=
X-Received: by 2002:a1f:3d49:: with SMTP id k70mr1740882vka.3.1614098968880;
 Tue, 23 Feb 2021 08:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20210222072217.15633-1-jindong.yue@nxp.com> <CABCJKudwajnmHAEC1XAH=pouCoOXq7q6NmpLST5pba8ejU6FtA@mail.gmail.com>
 <CANLsYkx0Y_f8tdeioUFrwBRV8M6OtLcSuPDZbgb6noPgrfyjOA@mail.gmail.com>
In-Reply-To: <CANLsYkx0Y_f8tdeioUFrwBRV8M6OtLcSuPDZbgb6noPgrfyjOA@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 23 Feb 2021 08:49:17 -0800
Message-ID: <CABCJKuemAmeaSshvb=B6D1kBt-n_unEx11rwzOZmDxAd+EQ31g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Remove casting to rproc_handle_resource_t
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
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

On Tue, Feb 23, 2021 at 8:41 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Mon, 22 Feb 2021 at 15:48, Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Hi,
> >
> > On Sun, Feb 21, 2021 at 11:18 PM Jindong Yue <jindong.yue@nxp.com> wrote:
> > >
> > > There are four different callback functions that are used for the
> > > rproc_handle_resource_t callback that all have different second
> > > parameter types.
> > >
> > > rproc_handle_vdev -> struct fw_rsc_vdev
> > > rproc_handle_trace -> struct fw_rsc_trace
> > > rproc_handle_devmem -> struct fw_rsc_devmem
> > > rproc_handle_carveout -> struct fw_rsc_carveout
> > >
> > > These callbacks are cast to rproc_handle_resource_t so that there is no
> > > error about incompatible pointer types. Unfortunately, this is a control
> > > flow integrity violation, which verifies that the callback function's
> > > types match the prototypes exactly before jumping.
> >
> > Thank you for sending the patch! It might be worth noting that Clang's
> > Control-Flow Integrity checking is currently used only in Android
> > kernels, so while the type mismatches are real and should be fixed,
> > they don't result in runtime errors without this feature.
> >
> > > To fix this, change the second parameter of all functions to void * and
> > > use a local variable with the correct type so that everything works
> > > properly. With this, we can remove casting to rproc_handle_resource_t
> > > for these functions.
> > >
> > > Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> > This looks correct to me. Please feel free to add:
> >
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
>
> Where is the original patch?  I can't find it on the linux-remoteproc
> and linux-kernel mailing lists.

Looks like it was sent to linux-remoteproc, but I also don't see it in
lore.kernel.org. Not sure what happened there. Jindong, perhaps it's
worth resending and including linux-kernel too?

Sami
