Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B92C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 03:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A488861CB3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 03:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhGGDae (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 23:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhGGDae (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 23:30:34 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14A7C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 20:27:53 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t3so1826003oic.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jul 2021 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHVGRHLekYr8xHahpW/6KPPqJv6XJMo3tLIGMPUbYXs=;
        b=vLI1M2SVOOKUwdENIW7PdxjvgZlm/i8iThmo7EJNFe5Hs7hBLXbeR1NGcl98/ykiTt
         iLzjN/U2DV5DK2MgA5aVoq+MAj6J7bhtEQOjnY3tOSVXSc+X8dJhc+E2Ng6kCk2YRNoT
         AiS+IrTwy5bAowR1WeVzkeH3VIPgGMLUjZ5NJhxQc8CUFEMMvWNlamUxS5JbEaA8MX4/
         b7PesonuHxj3r8b5ntJGz6Fb5MUPWzV2g2YSWlbxJB8XnZsh3PvWhf2yOla9LSamDFv7
         OxFNnHAwYpV67u+XJNleCowpld9r4ZoDfbJdLq83Yt6PBr3cQ+Xh2XJFJtLtBuRUPcRh
         EhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHVGRHLekYr8xHahpW/6KPPqJv6XJMo3tLIGMPUbYXs=;
        b=VwdAzSJnBDQ32qaM3djz+1tZPgszZIvpudNqHGbUsEvmFYMiZO55Em1THWQZyIIyay
         7RP2uqeau/sGYUyeMDugV8ZA0pxATSHVo/nqtanCjoVbjZ32upwpFYBRvz2YwVskos4M
         qpERgNmNRmGv95emfzPgYO7a+7y6SPhdvdpgJASVExnxxDT4p78/tATM2++IDK7nUrxe
         c+Mf4y8ORTbuF5ceiDuggQv6jrgIB9LIyS0rEIH5adGK2kxPzNkiuX2MaUKgjcUM/JTR
         Q145KyRLoR0IMxxzM6eeLPaJh4fE6qb1viJbTRiykpE9jBlv6o3L+jhqYdrsFfsa3OUH
         4VYA==
X-Gm-Message-State: AOAM530pQqMfqt9ouIFCsTaWhZHiOSjCNYmzUwOj1UXmqejoayFTsE60
        DoZS6EWRuGqO2Uv/QgGdkDoyc7up21+FvJsqcWs=
X-Google-Smtp-Source: ABdhPJzlHb/SGvLJ8OiDFeiwjMAjBVqN/yvSahcDqL3Y3VIdVXsjFlW7weWpAQSWM8n7jTBsT1/9FhKdzB9pqWobeps=
X-Received: by 2002:aca:aa42:: with SMTP id t63mr11483395oie.142.1625628473182;
 Tue, 06 Jul 2021 20:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210706142335.952858-1-aisheng.dong@nxp.com> <DB6PR0402MB2760F2D114C3D6367774AC96881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760F2D114C3D6367774AC96881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 7 Jul 2021 11:25:57 +0800
Message-ID: <CAA+hA=STJ8ggd6Fb-hdaTa-yHz=wJFhzO2M7cbm8AjyEA33spw@mail.gmail.com>
Subject: Re: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 7, 2021 at 10:14 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
> >
> > Currently the is_iomem is a random value in the stack which may be default
> > to true even on those platforms that not use iomem to store firmware.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
>
> Please also include rproc_copy_segment.

Thanks for catching this
WIll update

Regards
Aisheng

>
> Thanks,
> Peng.
>
> >  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > b/drivers/remoteproc/remoteproc_elf_loader.c
> > index 469c52e62faf..2bee4d5a0995 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -178,8 +178,8 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> >               u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> >               u64 offset = elf_phdr_get_p_offset(class, phdr);
> >               u32 type = elf_phdr_get_p_type(class, phdr);
> > +             bool is_iomem = false;
> >               void *ptr;
> > -             bool is_iomem;
> >
> >               if (type != PT_LOAD)
> >                       continue;
> > --
> > 2.25.1
>
