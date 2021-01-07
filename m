Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82EAC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 01:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B69D52223E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 01:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbhAGBvN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 20:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbhAGBvM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 20:51:12 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA468C0612F0
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 17:50:32 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id u26so4708884iof.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 17:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2P2u9jEjWHYVU1qxKrf4iKIpSUfUX3zNuv6jnN50kWY=;
        b=o9uaPPJjdoOqqWjDoF+6zow7bpzZM5nAd4zCN8YCAQETkDD3CrOk+M0aOrjER+Ma1P
         K+8feL8e1xUQrEePD7AMiNB2UaGYxrQFfbptq3Rgav+7h5GLeYHgxrN99bj4CZ0+HFl+
         QJW03cwujyZUkSKyslBTbIadFmtgAaGiMjmNOv78ZTLyjk1yo24TOx3kGRpYdcQk5dqR
         /xNf8s9seXFP/0DJrVhnvj+MmHCKBe3lvA1L431DZ0p3xKpegyJxMDzTTCjlIua5UL5f
         7wNU8HC650Eq0eCbp6nmzGqbLLtXJEnfxQqYb16lclGBr7XvlJYejMLfUeDhj0s5iG5+
         G5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2P2u9jEjWHYVU1qxKrf4iKIpSUfUX3zNuv6jnN50kWY=;
        b=jiVhdll5vepCFsL00uw6xIf/Un5e7yor/PhvFDEc1DLFjQ2njd4OehBCAkOTeFdQ8k
         OcQ/4GS4dhb6xJiWxSMbnEPFGpCs58MpkAYiQZ5KMKRQBImtP/dk5uSgDuLPyucpjKyk
         TKfOqvJi5HlM7SBFUlIt4KP8utf1CcTnXGxy30xFusviPRCKSUUVinZHiOyblTY+nmKm
         1pA9GKQ5yUfeKwWUvzQ+KgpEAkhxMB7m4o+D85AuEexb6dio1HWSJ3/CbUFE9vWgSUSg
         S5QyZpBQMoK3x3xKHacsnOzuySeFYK2JdxCYBRNJlRnuQ8c7z2sqtAQGEfEdcTcX+2Sx
         lZoA==
X-Gm-Message-State: AOAM532+cqV6ndYOyEyN0QlsBliy42c1gCyj4eqJ3wsSz44GNrn94QpG
        5chkm9CQ4Jp/SxoAOTDIfPcyFawFwsp873+EWijIug==
X-Google-Smtp-Source: ABdhPJwnLMZbzPVzAP5dJqQf/bIvgS2HPh2LtxSQphRjCMi9klzEWcLCchHZzWTLlzo2OiyqneoUmKEGjiuJIzgTWAE=
X-Received: by 2002:a02:c804:: with SMTP id p4mr6149995jao.110.1609984231882;
 Wed, 06 Jan 2021 17:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com> <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
In-Reply-To: <20210106231513.GC9149@xps15>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 7 Jan 2021 09:50:21 +0800
Message-ID: <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> >  static void mt8183_scp_stop(struct mtk_scp *scp)
> >  {
> >       /* Disable SCP watchdog */
> > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> >               goto free_rproc;
> >       }
> >       scp->sram_size = resource_size(res);
> > +     scp->sram_phys = res->start;
> > +
> > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > +     if (res) {
>
> As far as I can tell the if() condition isn't needed since
> platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> is capable of handling that condition.  As such the code to parse "l1tcm" can be
> the same as what is done for "sram".

The "l1tcm" memory region is optional.  The if() condition is for: if
DTS doesn't provide the memory region, kernel can skip the code block.

>
> With the above:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> > +             scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > +             if (IS_ERR((__force void *)scp->l1tcm_base)) {
> > +                     dev_err(dev, "Failed to parse and map l1tcm memory\n");
> > +                     ret = PTR_ERR((__force void *)scp->l1tcm_base);
> > +                     goto free_rproc;
> > +             }
> > +             scp->l1tcm_size = resource_size(res);
> > +             scp->l1tcm_phys = res->start;
> > +     }
