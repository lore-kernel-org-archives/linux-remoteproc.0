Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358D4C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 03:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06792619A8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Mar 2021 03:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCWDd1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 23:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhCWDdP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 23:33:15 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FACEC061756
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Mar 2021 20:33:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so9537405pjb.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Mar 2021 20:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5P3DscWIA5E6KtbKwWeXRGnWsYVIZfqGL9jI0er3QEs=;
        b=PLfVMqXjw89ipCctSy0pa6GgYFf1dh4um6iGJvb8Q6End4A9Gp2XHOQIGzHTD0K+x+
         bVdxdFQbFHkwdcHNEu8gUZu9QyBrOc3xnYopvtHQ4k3Zpmp7iQ+885WxtmZpDgXNhaoi
         1ZIlAyMEmgukmdDmMwj4mzKqgddJddNeh8PrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5P3DscWIA5E6KtbKwWeXRGnWsYVIZfqGL9jI0er3QEs=;
        b=oS5zT3QPFMdTNq3wjdcqHJV6vWjh0ZZH80XZ9PjHLb8jUs4yrEg3/LLpB7tUQ2W/jq
         gx4o+Ktjj+sEEYISn3pUb+xQR0xkHx2v5rGuwNEnqkCxAZvqG6Kve4uRSko0xvkhHdg4
         qAl1TDovIbUIrQQy9Ef6tTkOfgXUJKfDL0uj6A4oTvcwZneMbiBPyKEPt6N5oKw2J7Kz
         mndXtsg4Z7Z1oL2TSzlip7eeVIJZ0CnnR25pHoStIo100e2H8CUuQaJcsmWo3mISWHaM
         Cw7IX8005TE6LxC8X8pyEhbGrmxUyOcefDmBxLESpnuSP01Mcag7NAHTxkXBYzZ42wA7
         svQQ==
X-Gm-Message-State: AOAM530xIeE15BslJNw3OaZBOka0Tyd/fXMw+P8L6QStKt4FFTDy7S9m
        TDCi/12u6haLoZP7/3wgyK4yvQ==
X-Google-Smtp-Source: ABdhPJxCD6gbqkvS8RYoP3vs3t39AIDWuEDPHS2FZinVx4PxUyWhPvheyI42K1jrwIYwKSzsBRm8Yw==
X-Received: by 2002:a17:90a:fd89:: with SMTP id cx9mr2216844pjb.93.1616470394007;
        Mon, 22 Mar 2021 20:33:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id cp22sm727217pjb.15.2021.03.22.20.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:33:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616092624-31870-1-git-send-email-deesin@codeaurora.org>
References: <1616092624-31870-1-git-send-email-deesin@codeaurora.org>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add enable_irq_wake to SMP2P IRQ
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org
Date:   Mon, 22 Mar 2021 20:33:12 -0700
Message-ID: <161647039218.3012082.1225143087605342937@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-03-18 11:37:04)
> SMP2P interrupts are expected to wake the processor from suspend.
> Use enable_irq_wake to mark it wakeup capable from suspend.
>=20
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smp2p.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 2df4883..df47ee6 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -538,6 +538,7 @@ static int qcom_smp2p_probe(struct platform_device *p=
dev)
>                 goto unwind_interfaces;
>         }
> =20
> +       enable_irq_wake(irq);
> =20

Can this use device_init_wakeup() and dev_pm_set_wake_irq() instead? I
think that will help us recognize that this irq woke up the CPU and
allow userspace to indicate that it doesn't want to get this wakeup for
some reason.

>         return 0;
>
