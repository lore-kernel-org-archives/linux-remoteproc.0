Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF637C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 01:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7321B64F01
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 01:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCRB2U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Mar 2021 21:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRB2A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 21:28:00 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DEBC06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:28:00 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id 19so3374143ilj.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOjKjs4Ioywu0sks2JQgWXB9Qs16kCgcivZBVvJn86U=;
        b=hld3X585HJjdQYYvS1ETXFpQGVKx7mDNLAtLYOgu+wuT1IKtaU2FB9hVR3EiTHCy27
         n5xmwhVcaAALDu505A73xYuf+RxQNqAtx04AbBpONFPx3wWzkNiq5+GQ//iZzRya+S1x
         ENMkMB5tOZ8G0PWqmDAwWAaSzgA9unoj3r/MfbKYQ+BbbJXC7TvD63ac6h2dFN9+t0bv
         J5Ly8WcbXIefKCsejDjhX03u0Lak0SLjD2UE7GJrNWajdOlQGhVqLX9kMp0cPSYSQEST
         Fm+24STN6xAltjN30CoeAXdkn6/G35+lTu7QkaePD9G9NH/ppqBfCiFotaszdLwgk3UT
         7P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOjKjs4Ioywu0sks2JQgWXB9Qs16kCgcivZBVvJn86U=;
        b=kwpa2Fh8M0GKfbY/q7YPupUcLb+gkO2cj7+CC6w8d6QMx4MsuMCnzCOFVC/7SdJxzM
         cch8S6gnggjMSQ/iCgNdgaKT1He1bZHoklxjHT47LrF1fsvoswenY5mZij/nYZSKrMtX
         FojrPP5veFxudZ0l/5iOlw9qkF6bmMsWp4aLLAWYL/Y8wmIHXzruDqDnQ7cRZwkawoM3
         au+vfrXGnSD9yx/J8Sm3gzNoCqQwyY7N00lDVHuENAJBYQY8DLbqfBezeXV04NhXxqo8
         N7COekOVFcfby8Qm44m5yCAz3nQYLoYgyPiV+qurUg0+vnXldzKI7yty0K652oSKbLL6
         B96A==
X-Gm-Message-State: AOAM531MPrzUgV7iN2b3L3nOEQ2CQO7F3LS9gcYKVw330pVpUH/zOtdt
        5tim+n4l9rBrkZZOEVaPQVv4vDA1DSDdezFGA4XOlAg8vVd67Q==
X-Google-Smtp-Source: ABdhPJwmiUIwFrt8IB4rlFnwaZV57qrA05SCd9JxNA1keQIDqtP/M6+MT42UhtfAknTN84Jbp8hmm+nARoMRtG8+3q8=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id l6mr9251401iln.218.1616030879356;
 Wed, 17 Mar 2021 18:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210317034311.2281708-1-tzungbi@google.com> <YFJVIfTPnZe/SfgX@builder.lan>
In-Reply-To: <YFJVIfTPnZe/SfgX@builder.lan>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 18 Mar 2021 09:27:48 +0800
Message-ID: <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 18, 2021 at 3:14 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:
>
> > DEVAPC (device access permission control) is a MPU (memory protection
> > unit) in MT8192.
> >
> > To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> > domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> > domain.
> >
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>
> As written here Tinghan is the author of the commit, but the author of
> the patch is Tzung-Bi. Please resolve this.

Tinghan is the co-author of the patch.  Added "Co-developed-by" tag in v2[1].

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210318012416.2816574-1-tzungbi@google.com/

>
> Regards,
> Bjorn
>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> > ---
> >  drivers/remoteproc/mtk_common.h | 2 ++
> >  drivers/remoteproc/mtk_scp.c    | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > index 61901f5efa05..2aa9fdf5e59b 100644
> > --- a/drivers/remoteproc/mtk_common.h
> > +++ b/drivers/remoteproc/mtk_common.h
> > @@ -51,6 +51,8 @@
> >  #define MT8192_CORE0_WDT_IRQ         0x10030
> >  #define MT8192_CORE0_WDT_CFG         0x10034
> >
> > +#define MT8192_SCP_DEVAPC_DOMAIN     0x85080
> > +
> >  #define SCP_FW_VER_LEN                       32
> >  #define SCP_SHARE_BUFFER_SIZE                288
> >
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index 9679cc26895e..50bdec5a97e3 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
> >       /* enable MPU for all memory regions */
> >       writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> >
> > +     /* set to DEVAPC (device access permission control) domain 3 */
> > +     writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.31.0.rc2.261.g7f71774620-goog
> >
