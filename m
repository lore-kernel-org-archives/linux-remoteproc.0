Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1C1C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 01:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333A064DF1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 01:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhCRBdy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Mar 2021 21:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCRBdx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 21:33:53 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE7DC06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:33:53 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so3734092otn.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Mlqkc8Fn80lOlVJTmFiV3+xf4AvW508aTxYk8g0qyng=;
        b=u+kJYPGobHpiqa7F8jXyRAuD/inJzoGpu7JeU6eVNhzhp3zF1wJj/Yt4GJxOKKUC7O
         azzp5Wnx9l9URng/E8lPA9NPv4SHChZgMYk/1nD9xaJuaFjzuX2v6sKYFIW6sRpKba0/
         9gcY1Fcw/MmDKhmiMSYrYFPyCjvYg6ODTve34pWaBW16UlkwuDKk956b9baGeWHhIG8m
         k3cZY1RLYcUlmQt90DpnCFKZvkFQsGemy3wLGyEZ4oB9EE5jWJ07wjqRLxIRsVpKAQ2R
         dFOj1T0F93523CHglEfpOzzifOurPprSXPq2av2qHqZQJkt5XvM4jejuoDX71GuzgWz9
         YpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Mlqkc8Fn80lOlVJTmFiV3+xf4AvW508aTxYk8g0qyng=;
        b=Jas1s2J8LQZhycXYFqrA9xUHQ1Ds7fu6Ab+VXylxVcIP/rGq6C0hWXDGvAg1Z50FQr
         D0Oq0qf5XGbQCcczl90IaGIhzawhwAdEnn1/Ic8rO1r5GcVbFrSO48thbO1vvoQ72J0a
         b894wl0bVTvYxAW4j2GCzQ+4EvoFAeWOtO/6/ol5swUYROfWFpNICp22ZzFcOLgd4yOq
         qGdFft3XN9VonQ8/my/HZZmdUS/38HXXQ+AvFk3866xJqaz8xVcm9/DIeu8yJlMlWa7T
         Gm404VFQP3OUujR1tU3eguPxlnYy6ZSNnN7d0LSZND7FuhcX+CUpadPGZtQEITrPnZP3
         MfOQ==
X-Gm-Message-State: AOAM533YDLk7v2bM55uRLkKElHUvAJlwjs7OHKXIQzvlnXw1OnaShMRQ
        HYqDSqRx/JKIVroh6HcucwimfzVpbVOhoA==
X-Google-Smtp-Source: ABdhPJwsxmRm8d1n02rxEzbhmTn9pUWKBbLrm4gdM2T4c6U3pXEpaVAOiRceW3oKi3Wh/dqvXbY4yg==
X-Received: by 2002:a9d:590e:: with SMTP id t14mr5439141oth.1.1616031233150;
        Wed, 17 Mar 2021 18:33:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w7sm131363ote.52.2021.03.17.18.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 18:33:52 -0700 (PDT)
Date:   Wed, 17 Mar 2021 20:33:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192
 SCP
Message-ID: <YFKt/mGha/IQRDz4@builder.lan>
References: <20210317034311.2281708-1-tzungbi@google.com>
 <YFJVIfTPnZe/SfgX@builder.lan>
 <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 17 Mar 20:27 CDT 2021, Tzung-Bi Shih wrote:

> On Thu, Mar 18, 2021 at 3:14 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:
> >
> > > DEVAPC (device access permission control) is a MPU (memory protection
> > > unit) in MT8192.
> > >
> > > To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> > > domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> > > domain.
> > >
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> >
> > As written here Tinghan is the author of the commit, but the author of
> > the patch is Tzung-Bi. Please resolve this.
> 
> Tinghan is the co-author of the patch.  Added "Co-developed-by" tag in v2[1].
> 

Perfect, thank you!

> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210318012416.2816574-1-tzungbi@google.com/
> 
> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> > > ---
> > >  drivers/remoteproc/mtk_common.h | 2 ++
> > >  drivers/remoteproc/mtk_scp.c    | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > > index 61901f5efa05..2aa9fdf5e59b 100644
> > > --- a/drivers/remoteproc/mtk_common.h
> > > +++ b/drivers/remoteproc/mtk_common.h
> > > @@ -51,6 +51,8 @@
> > >  #define MT8192_CORE0_WDT_IRQ         0x10030
> > >  #define MT8192_CORE0_WDT_CFG         0x10034
> > >
> > > +#define MT8192_SCP_DEVAPC_DOMAIN     0x85080
> > > +
> > >  #define SCP_FW_VER_LEN                       32
> > >  #define SCP_SHARE_BUFFER_SIZE                288
> > >
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index 9679cc26895e..50bdec5a97e3 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
> > >       /* enable MPU for all memory regions */
> > >       writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> > >
> > > +     /* set to DEVAPC (device access permission control) domain 3 */
> > > +     writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> > > +
> > >       return 0;
> > >  }
> > >
> > > --
> > > 2.31.0.rc2.261.g7f71774620-goog
> > >
