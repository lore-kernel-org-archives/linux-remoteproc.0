Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25846C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 18:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D540323435
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 18:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbhAGSDV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 13:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAGSDU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 13:03:20 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ADDC0612F6
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 10:02:40 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a109so7136107otc.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nQ6Ok2qv3kfguUtTE5w7jI9nGycF4ZB8N3EBEUPDAj8=;
        b=GwN3LcQd554wGKPgJZjH1S7VHyf+0nrBX7wmPn3JVgqimfAzoUPQLhWHotgOQe7ajF
         6De7OUFvPfIMGE4dDVzXUKNrYKlmP9OyvJ8fg+47iV01+hf3T+w+TiwAtX3U8MmqxRZr
         LI01MTRfxwQb5EfDfTtAyMCPzm8bkI/S4dL793hljuLJg1vRMtn9lFeX/geK8/3fKbr7
         y8TEAdTkxnpOBjIjtoinf6V66xDyy4CXMzlh2NNGIqf4XUY3tONryrCf35zsvB2lfp2W
         hiu+wCzN8jMKi7gWx391yzyIV6X3ZpdltVMG1arUX114ausrADiHORtjP1XY7AzorT6p
         wVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nQ6Ok2qv3kfguUtTE5w7jI9nGycF4ZB8N3EBEUPDAj8=;
        b=VaM5E+wapCjrvOTsvIv2CPm3NOpnoWK4Ve05Qy82En28qJdNexPH+12QPYCwxA0Iu7
         6reLBqjAufAFTLtW6ZEd5M8E8rqKEzEjoi89+20OjAVYBs0BSRXcYHiYGoJ7bqtdjW9t
         Fb5g7+aTm+49e1NGaMHQhCga92vnz1XS1s40o3ezXLFYbmyV+dvcYooj1egp4A4JSDB5
         2FyheogRTMoG7LukF7TkHLQRwpmU0J0zXvmifyMmSqvWQzxnLBOM4p8Bqb1ZU1SvEwcu
         1335VDK+ymuIC+206t/oiaYRtQbxvf2DLb3MONZhzpIdj5FdPkEbez9Jr37XiMiJDf0d
         W9tQ==
X-Gm-Message-State: AOAM5310hT8zdOlFUzHl4Hy/+xKg9+VAA+XVQ81SxeQVm9damSMpU2KE
        XtKGhJeRdkp177OdT/uee+KrKw==
X-Google-Smtp-Source: ABdhPJw0C/3EMOrNHLY5ELywjkiY+brXvZR5p3DxYWimDV92myKzXZGMLQS8FRc3/VYO9pYkAA4nZQ==
X-Received: by 2002:a05:6830:204b:: with SMTP id f11mr7177993otp.372.1610042559828;
        Thu, 07 Jan 2021 10:02:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t186sm1438689oif.1.2021.01.07.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 10:02:39 -0800 (PST)
Date:   Thu, 7 Jan 2021 12:02:37 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <X/dMvWdwVfnjsUXM@builder.lan>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
 <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 06 Jan 19:50 CST 2021, Tzung-Bi Shih wrote:

> On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > >  static void mt8183_scp_stop(struct mtk_scp *scp)
> > >  {
> > >       /* Disable SCP watchdog */
> > > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> > >               goto free_rproc;
> > >       }
> > >       scp->sram_size = resource_size(res);
> > > +     scp->sram_phys = res->start;
> > > +
> > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > +     if (res) {
> >
> > As far as I can tell the if() condition isn't needed since
> > platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> > is capable of handling that condition.  As such the code to parse "l1tcm" can be
> > the same as what is done for "sram".
> 
> The "l1tcm" memory region is optional.  The if() condition is for: if
> DTS doesn't provide the memory region, kernel can skip the code block.
> 

People are actively looking for platform_get_resource_byname +
devm_ioremap_resource() pairs to replace with
devm_platform_ioremap_resource_byname(), so we're probably going to have
someone try to patch this soon...

So please change the pair to devm_platform_ioremap_resource_byname() and
treat a returned -EINVAL as the memory isn't specified and other
IS_ERR() as errors.

Thanks,
Bjorn

> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > > +             scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > > +             if (IS_ERR((__force void *)scp->l1tcm_base)) {
> > > +                     dev_err(dev, "Failed to parse and map l1tcm memory\n");
> > > +                     ret = PTR_ERR((__force void *)scp->l1tcm_base);
> > > +                     goto free_rproc;
> > > +             }
> > > +             scp->l1tcm_size = resource_size(res);
> > > +             scp->l1tcm_phys = res->start;
> > > +     }
