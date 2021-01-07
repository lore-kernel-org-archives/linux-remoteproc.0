Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FD2C433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 17:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12089233FD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 17:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbhAGRyx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 12:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728963AbhAGRyw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 12:54:52 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5F0C0612FB
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 09:54:07 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n10so5433337pgl.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IWDaWvFgIj6PDvmAQcUMKtpRMVpX3sfMWCsGoHCRRMU=;
        b=zQLv9ng9eOHhK1e/h86+a9yh/LgrUGqObWfOKQ/BUlm1mbjrcEhbhfEibCjnX29o1t
         ttatKOq6oj/9QocQzsB5mfszuFViFwv1Jntdk6CaNo8ow8jS7r4Ofts2jdkZlddlsw7m
         1XF3MEUE0pEOCFwYwfZtWgXTGprOvTMRP5yS+7qRfM9nRFqpQDVW5pdEQJOpvCJX7dBe
         pjlGfjFc7bBZfGXEZgJYiCER3PT7Y8UatpbnpcCqFTns9aP2AX+u5A0UdpC/i9SZ8k5W
         m8OaSYPivBJnZLVzEOY4Y0+VadcxU5qOtTUkAhGBsoILN+ZhHeBRFcJYVhKMmILkkCHk
         cvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IWDaWvFgIj6PDvmAQcUMKtpRMVpX3sfMWCsGoHCRRMU=;
        b=bJRXRQ/nFijfLbhdtvPHXAkK0IZXHvJtkIJM933+Cq5PDpmlmYie4YYVaboPQ7N/Bh
         2iGW4f0c/6+02PlzJDKdsM1GyiB0CEt5nYJslkAwgtJ8L2R7uDWC+DPl9Cka5eIRVNeG
         Gf7I+it6UpaV3AfV23kBGsCxctn2MiEwC+JxKLb3nCKfKeZq0+5lkD1HAeoUJQRfh8Fl
         v+8aiKW3CavdMkahT8x84q1LbdVRyFZrPMUpqXDHf/Klv5IxAWPUHuQZPpZzWA48QPX6
         Wbiw5670hFP1rwU0PMbs3PuWUI6Zx0Cs+aOVoA1nWIZQMBhFs4QLbpHL804q+OHPuXVX
         hdtQ==
X-Gm-Message-State: AOAM530LFwCi5huxhtRMS6FEscXENXfhBg+2ExBiiR9Mg2lUGiKti5Lt
        KXtYGn2KTP9eEFt0J1XFSz41IA==
X-Google-Smtp-Source: ABdhPJxCfrjEXiW33j6eEsIDc7kOPI8fuEpZoFk+csDEAoECb4+ggDNJWA6uJddxVoP2HXVARmd61Q==
X-Received: by 2002:a62:fc4f:0:b029:19d:d060:27ca with SMTP id e76-20020a62fc4f0000b029019dd06027camr9499492pfh.66.1610042046636;
        Thu, 07 Jan 2021 09:54:06 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b12sm6364417pft.114.2021.01.07.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:54:05 -0800 (PST)
Date:   Thu, 7 Jan 2021 10:54:04 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
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
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <20210107175404.GA33624@xps15>
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

On Thu, Jan 07, 2021 at 09:50:21AM +0800, Tzung-Bi Shih wrote:
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

Very well - thanks for the clarification.

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
