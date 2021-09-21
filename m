Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDF4C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 17:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40591610A0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 17:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhIUR2t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhIUR2r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 13:28:47 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD24C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Sep 2021 10:27:18 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 6so175994oiy.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Sep 2021 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4Dwfj98Yc1HEfTOzYMhxAK48M6ebYAEnvZEqsEY49Ik=;
        b=CO3RLCAgcY6ehQvKXBEDiG3P0K9ffpetCgRl1POMt2+HhdlFu/xjBJfVJpkRP+MTLQ
         p0egexm0ablmUuXMSXcTBDrse+pwp5K0M0YRM+hSRGJhHGA7xQwlDo3R6d8Y/Y3/pQtC
         tbHSvzrHY3xOnzIG1X/b3+6NQ/5QEp6LMhX4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4Dwfj98Yc1HEfTOzYMhxAK48M6ebYAEnvZEqsEY49Ik=;
        b=gLhj38Uln/fooxAqTZt/tSidbEG1pMEbzPAozkQNfb1iJ9Mnzra7ia5C1TqsmRAFCF
         P+yl00cmUUJUOPotUVzdILX5wXQzBdg6PpMY2SVcBFjCa+P9v+4ZiYxFVpfuenCiMlWg
         oUSX0FUs3qjG48ww8yianxFdg6UDVjjSVT2vMKJWEUZLHVzgfWCSn7G5viBfSLOIzUps
         r9m7LAZ1lrs1B7SJMM9TSFAVwf9yBaNKeHR3W+tPASYlgyvek+lFsVvF6zJgs44zdxae
         gpl3/SHIW7qwDgn5IiCZ678Aq/38f7y6uz9kL87M+v+e5wCWgZ8QQOMSonkTaiTj5kRt
         MTjA==
X-Gm-Message-State: AOAM533wDL7ghP4yeVcIGakp8Jn/mM7I/re+oXnQ+nbAOz62eQNmCgxn
        AHC8yNLqs3iLPuUpiyxTEhr9pkgNXYd24TZe/o8skvGh07M=
X-Google-Smtp-Source: ABdhPJyprcnvduIyewp0eo2HDH71eHPxrC3yu4FcnWSJ/10YHdtfTC+AvDmg9iuGw8fIf6v6TkfnHh2CAcrqnnq6JOQ=
X-Received: by 2002:a54:4419:: with SMTP id k25mr4696213oiw.32.1632245237527;
 Tue, 21 Sep 2021 10:27:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 10:27:17 -0700
MIME-Version: 1.0
In-Reply-To: <1632220467-27410-1-git-send-email-deesin@codeaurora.org>
References: <1632220467-27410-1-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 10:27:17 -0700
Message-ID: <CAE-0n51kCczyefN0r7Wb4TRa1mUWiCdkRqfooDdfnyD_jUq8PA@mail.gmail.com>
Subject: Re: [PATCH V5 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-21 03:34:27)
> Remote susbsystems notify fatal crash throught smp2p interrupt.
> When remoteproc crashes it can cause soc to come out of low power
> state and may not allow again to enter in low power state until
> crash is handled.
>
> Mark smp2p interrupt wakeup capable so that interrupt handler is
> executed and remoteproc crash can be handled in system  resume path.
> This patch marks interrupt wakeup capable but keeps wakeup disabled
> by default. User space can enable it based on its requirement for
> wakeup from suspend.
>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
