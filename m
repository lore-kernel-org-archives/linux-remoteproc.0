Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD27C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Aug 2021 20:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE92260F55
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Aug 2021 20:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhHPUXw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Aug 2021 16:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhHPUXv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Aug 2021 16:23:51 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DF1C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Aug 2021 13:23:19 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id n27so3877672oij.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Aug 2021 13:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xtLKLxOTgP0hZbfnKrxJuZxeJBYBtihgXnXMIaAKNcM=;
        b=NS9zm4DWA8M5f8Pu+yOte7iHeGwmI955VvFCfdvRX0FM6D81n9hvnWPwxpJ+nsKxOm
         Kbr9ARehMrAnrwxvRIiKJlz1Va/LH4O0nkzqq5dAQLYL3ByG7MfP4XovhzjWCWgVYGGQ
         kwOC15KXnGlVs9aab3Rl/6EMapzkpCn04Cwpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xtLKLxOTgP0hZbfnKrxJuZxeJBYBtihgXnXMIaAKNcM=;
        b=gVlxRKr7YnSz3AW6zSk37q23cYjR+f/SAk3sCSCwtIkv4THsTOQL60HvpnWSUjdBuh
         bM6y8QV/xy7lxoGYNhOrMKMwaTYutqrMhN5yGE0ObX+qitozGgQtdcN+AfXlw4rtd3i0
         KWomXJdoJAHWkOFCExKCxTO+L4nkO9FBHbLosZQe9SEJPs+jOk2nOAlTPOd1S9EiIP42
         OkQVJEjf1apaqts0AJfFF4rCjvK43H1WbCPPxLkq+Xl+CtZmjE1zMdsy2neNaZiDq+Mc
         4aNvtloQ+Ogkda0OTtBNSTA+k6+5MDa/+rvj1pmU0FYuB5jzE2GhxIqX8xuS9x6zQvfS
         8TyQ==
X-Gm-Message-State: AOAM532o0RpPknwXMaUfhu+PpYQDWnBWIkQmWlyJxOQbSHmlr5e2oEh1
        EP1GxjelJkS478NolpJs0lJmoUF5sEWovAbT1gTdpw==
X-Google-Smtp-Source: ABdhPJyxxQVYP/BT04vEnLZi2+QGv58mJ8ZBNUuFmt5uMAbp70Fb0Ffzakyq3aesYr3ao9tRB/7vOl+eVQqngOkhvis=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr433479oiu.19.1629145399251;
 Mon, 16 Aug 2021 13:23:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Aug 2021 13:23:18 -0700
MIME-Version: 1.0
In-Reply-To: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
References: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 16 Aug 2021 13:23:18 -0700
Message-ID: <CAE-0n528DuP4MiAOhYY+Du+L=OZaGM5YJm=NwWia3JF7hp7sAA@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-16 03:05:35)
> Remote susbsystems notify fatal crash throught smp2p interrupt.
> When modem/wifi crashes it can cause soc to come out of low power state
> and may not allow again to enter in low power state until crash is handled.
>
> Mark smp2p interrupt wakeup capable so that interrupt handler is executed
> and remote susbsystem crash can be handled in system  resume path.
>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smp2p.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 2df4883..646848b 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -18,6 +18,7 @@
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/pm_wakeirq.h>

Please sort alphabetically by include name, 'p' before 's'.

>
>  /*
>   * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
> @@ -538,9 +539,20 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>                 goto unwind_interfaces;
>         }
>
> +       /* Setup smp2p interrupt as wakeup source */

This comment is bad. Please don't reiterate what the code is doing.
Instead, write something like

	/*
	 * Treat remoteproc crashes as wakeups by default so we handle
	 * them sooner rather than along with the next wakeup (e.g.
	 * power button). This avoids leaving the system in a shallower
	 * suspend power state if a remoteproc crashes during suspend,
	 * but requires userspace to actively suspend the device after
	 * handling the crash, or CONFIG_PM_AUTOSLEEP to be true.
	 */

> +       ret = device_init_wakeup(&pdev->dev, true);

I still wonder if it's better to leave this off by default and only
enable it if the kernel is using autosuspend (PM_AUTOSLEEP). Then
userspace is responsible to decide if it can handle the wakeup with the
screen off, reload the remoteproc, and go back to suspend if it isn't
using autosuspend.

> +       if (ret)
> +               goto unwind_interfaces;
> +
