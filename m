Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D403AC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jul 2021 16:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC9F60EB2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jul 2021 16:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238627AbhGZPso (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jul 2021 11:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238995AbhGZPsl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jul 2021 11:48:41 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85D1C061757
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jul 2021 09:29:08 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id z3so9481440ile.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jul 2021 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WtUArQuv8CsBA1Qj+vhrmvBRh3ZVBqE+J2O75XToP5I=;
        b=NvqEDT0SXLhG9MlJik2c0jDD+EwyH7OZixKlqLjLfStoK2bf0aOpqEAIy9nZqUF35b
         buTN8/lsYHnYGdGNXUezbKINt6VeVKhVWBMelWnzywkouPmnEIMoHyaJmPhObVP0emiV
         R/aX9BxpmGG4fyNnBvwA+QhN5bh7DvpQgMBpS95y1EBuuGbgyPgXE1t/JtYjYxL/SEyE
         Fr8fxya9InbqoH2+z+kbcNh3wwmCD6Vl4HN71n7x9UFBc4B5MG/xbAO8uDhl0HzzpATj
         bA8/GYo0C9WRjjwp3YnPzGr7oU1ZX9WpXR4e+dHbIhcahHCqzd06nXbkUZqGkBHU4IHq
         ZF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WtUArQuv8CsBA1Qj+vhrmvBRh3ZVBqE+J2O75XToP5I=;
        b=UsXz9BvcBj/LqBIyAskZANKbTV0wCiJ7NQnd34yS7qnllxFXSHJR0ALx67LqaoD43/
         Vn283/0jFdKBKRrXlvkI+tw2fDtsjM/lx7OyQWurCwcykH6yPaEvAFT44Ap4+xfckpMA
         E5YNenQ/V2FHoIff8bpM135AUN5Yf5++10+hSh1HO8fLTPY5v1TPL6iaoKwb1S2DK/RZ
         vPPBjaCynjDDgZ0BpJnOPujZe1Nu5TqNS5iKpP0/Jb7lpBMfn2lkVckFOnJBZxY3aU+g
         pYqzMTy+Z9nz2EAb4I2aHtPZHkVwVXuCtMK+AzjCe68+cnkCY4boomORa5kK9m+/ilG3
         1ovg==
X-Gm-Message-State: AOAM530ut4r5Emfp5lx4hgpLWy8JLqt9X5pqk84md0QeozMw6jL2AJup
        Rwcr5S+1iv/jGq2Xa3aW6St+ZLUpTmQbEtBGFIUi6g==
X-Google-Smtp-Source: ABdhPJyVXHemrBp/Hm3o+cSj71flq4ks2yPOb44QiXQMLAeEO+8swe14Jq9+xuGEyOUh1x79kcH8wKJCx8WnNFX/PMU=
X-Received: by 2002:a05:6e02:d93:: with SMTP id i19mr13196637ilj.72.1627316948168;
 Mon, 26 Jul 2021 09:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210723220248.6554-1-s-anna@ti.com>
In-Reply-To: <20210723220248.6554-1-s-anna@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 26 Jul 2021 10:28:56 -0600
Message-ID: <CANLsYkw=+xJs3V8y89mSnUYo=8cHL_-U8UTC3gt6oO5zmS4jXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] K3 R5F & DSP IPC-only mode support
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman,

I have added your patchset to my review list.  Unfortunately due to an
impressive backlog and upcoming vacation won't be able provide
feedback for a few weeks.

Thanks,
Mathieu

On Fri, 23 Jul 2021 at 16:03, Suman Anna <s-anna@ti.com> wrote:
>
> Hi All,
>
> The following is a revised version of the series that adds the IPC-only
> mode support for the TI K3 R5F and DSP (C66x and C71x) remoteprocs
> covering AM65x, J721E, J7200 and AM64x SoCs. Patches are on top of
> 5.14-rc1 (the other dependent patches from v1 made it into 5.14-rc1).
>
> Please see the v1 cover-letter [1] for the design details of the
> 'IPC-only' mode functionality.
>
> The following are the main changes from v1, please see the individual
> patches for the exact deltas:
>  - The first patch in v1 "remoteproc: Introduce rproc_detach_device()
>    wrapper" is dropped
>  - Removed the addition of the rproc state flag 'detach_on_shutdown'
>    and the 'ipc-only' state flag in each of the remoteproc drivers
>  - IPC-only mode and remoteproc mode are supported by registering only
>    the appropriate rproc ops.
>
> The following is a summary of patches in v2:
>  - Patch 1 enhances the remoteproc core to restrict stop on early-booted
>    remoteprocs.
>  - Patches 2 and 4 refactor the mailbox request code out of start
>    in the K3 R5F and DSP remoteproc drivers for reuse in the new attach
>    callbacks.
>  - Patch 3 adds the IPC-only mode support for R5F.
>  - Patch 5 adds the IPC-only mode support for both K3 C66x and C71x
>    DSPs.
>
> I have re-verified the different combinations on J721E, J7200 and AM65x
> SoCs. AM64x currently lacks early-boot support, but the logic is ready
> for Single-CPU and Split modes that are specific to AM64x SoCs.
>
> regards
> Suman
>
> [1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20210522000309.26134-1-s-anna@ti.com/
>
> Suman Anna (5):
>   remoteproc: Add support for detach-only during shutdown
>   remoteproc: k3-r5: Refactor mbox request code in start
>   remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
>   remoteproc: k3-dsp: Refactor mbox request code in start
>   remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs
>
>  drivers/remoteproc/remoteproc_cdev.c      |   7 +
>  drivers/remoteproc/remoteproc_core.c      |   5 +-
>  drivers/remoteproc/remoteproc_sysfs.c     |   6 +
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 197 ++++++++++++----
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 265 +++++++++++++++++++---
>  5 files changed, 407 insertions(+), 73 deletions(-)
>
> --
> 2.32.0
>
