Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31BAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 15:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A2F61037
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 15:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243345AbhJHPpA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 11:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243306AbhJHPot (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 11:44:49 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867CDC06177C
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 08:42:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id cs11-20020a17090af50b00b0019fe3df3dddso7419831pjb.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M+x5MOER261MbUl0OssjbNlVFcMcQKLgCQodPM213LU=;
        b=uBYvelRobKTfrDeV3HYp85ouWk4dpJoJmi8LRMKm+v4WEZNLzrwNNM2uwITNlZqyKx
         9nJhun35xgulMrcjVdIEaHTDcA6P22Gece914rSouoUkTYTSEKLL2P+V98A9JV9E962r
         IsDpEyl+2igx9kfpAhTABuj7LhFNsTGJsrrxJtTVWmVJ2ZevVjhz22U+O64OfD5CfphV
         c5CX28NOkKW372SSjJxpdxw214uXsaHMC2ihgyIp9YFkw38//zvzZKYVDeDZUqwjgX2F
         xJ/DX9HGQSNuaCxBEUTter4ka5UkKjCgKjngvw9qIZfk/MtJORNHZksNkarVYzruX5NE
         ZChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M+x5MOER261MbUl0OssjbNlVFcMcQKLgCQodPM213LU=;
        b=S2Mjw6dvg5hraKSExIYNGfcN1snqsAdMYp4Ktauo+Z5SdYJC9x4gFFRNjvZYOiiD8q
         GRg+74S1JGq31GGNMTblMSWgeQZkMAnv34evBvz+RF7Q4GKIYurH2angLxfIQPMHMGmR
         fiKrgIgZId9gnLVOEXfntH7Sv9OpxKGta62W5LiOWmRKpEZAqKl/iJUQi4MaELT/eHEk
         qI8XKXcJPrvGGrLfcMJUFu3qwoTiw903tK8AXqps9UcujUA32838XtvR/4hNMEo5iAwR
         e8KiYQMouIzyturTh/JdhUGXgZS+mkLQ2hhzfbrsDOdSJJRcDfB/XvPiXDAWHqiHF1vZ
         2Teg==
X-Gm-Message-State: AOAM530ekQ6gF423NWv0u7BbMywcHTg8Wl2E5AMlCCJgZF/MBF0XOuXW
        R9MFTecQWAoSchGsJeeadiR0wg==
X-Google-Smtp-Source: ABdhPJy6lAXGCc3KLUKlrLv5Ow61pYCX9c+ztKIVvvukaQ2lF377BooN5dvvWlHZzOw9nftYOjNkgw==
X-Received: by 2002:a17:90a:c68b:: with SMTP id n11mr13173254pjt.90.1633707770960;
        Fri, 08 Oct 2021 08:42:50 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 130sm3110371pfy.209.2021.10.08.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:42:49 -0700 (PDT)
Date:   Fri, 8 Oct 2021 09:42:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
Message-ID: <20211008154247.GA3614893@p14s>
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-4-git-send-email-shengjiu.wang@nxp.com>
 <20211006162511.GA3370862@p14s>
 <CAA+D8AOmnZ6wWBzJe5imMcyoVE0fSiOyLpWb83bYPwadJ5O-Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOmnZ6wWBzJe5imMcyoVE0fSiOyLpWb83bYPwadJ5O-Mg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Oct 08, 2021 at 09:53:18AM +0800, Shengjiu Wang wrote:
> Hi Mathieu
> 
> On Thu, Oct 7, 2021 at 12:25 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Hi Shengjiu,
> >
> > This pachset doesn't apply to rproc-next, which is now located here[1].  The
> > change is in linux-next but not in mainline yet.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=rproc-next
> 
> Ok, I will double check it and fix it.
> 
> >
> > On Sun, Sep 26, 2021 at 11:07:09AM +0800, Shengjiu Wang wrote:
> > > Provide a basic driver to control DSP processor found on NXP i.MX8QM,
> > > i.MX8QXP, i.MX8MP and i.MX8ULP.
> > >
> > > Currently it is able to resolve addresses between DSP and main CPU,
> > > start and stop the processor, suspend and resume.
> > >
> > > The communication between DSP and main CPU is based on mailbox, there
> > > are three mailbox channels (tx, rx, rxdb).
> > >
> > > This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/Kconfig         |   11 +
> > >  drivers/remoteproc/Makefile        |    1 +
> > >  drivers/remoteproc/imx_dsp_rproc.c | 1206 ++++++++++++++++++++++++++++
> > >  3 files changed, 1218 insertions(+)
> > >  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
> > >
> >
> > [...]
> >
> > > +
> > > +/**
> > > + * imx_dsp_attach_pm_domains() - attach the power domains
> > > + * @priv: private data pointer
> > > + *
> > > + * On i.MX8QM and i.MX8QXP there is multiple power domains
> > > + * required, so need to link them.
> > > + */
> > > +static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
> > > +{
> > > +     struct device *dev = priv->rproc->dev.parent;
> > > +     int ret, i;
> > > +
> > > +     priv->num_domains = of_count_phandle_with_args(dev->of_node,
> > > +                                                    "power-domains",
> > > +                                                    "#power-domain-cells");
> > > +
> > > +     /* If only one domain, then no need to link the device */
> > > +     if (priv->num_domains <= 1)
> > > +             return 0;
> > > +
> > > +     priv->pd_dev = devm_kmalloc_array(dev, priv->num_domains,
> > > +                                       sizeof(*priv->pd_dev),
> > > +                                       GFP_KERNEL);
> > > +     if (!priv->pd_dev)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_domains,
> > > +                                            sizeof(*priv->pd_dev_link),
> > > +                                            GFP_KERNEL);
> > > +     if (!priv->pd_dev_link)
> > > +             return -ENOMEM;
> > > +
> > > +     for (i = 0; i < priv->num_domains; i++) {
> > > +             priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> > > +             if (IS_ERR(priv->pd_dev[i])) {
> > > +                     ret = PTR_ERR(priv->pd_dev[i]);
> > > +                     goto detach_pm;
> > > +             }
> >
> > I have pointed a problem with the error handling in the above during the
> > previous review and it was not addressed.
> 
> I have considered your comments.  Actually when
> dev_pm_domain_attach_by_id() return NULL, the device_link_add()
> will break, I have added comments below, so above error handling
> for dev_pm_domain_attach_by_id() is enough.

I would have used IS_ERR_OR_NULL() so that potential code inserted between the
two function doesn't automatically assume priv->pd_dev[i] is valid.  But what
you have here will work.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> Best regards
> Wang Shengjiu
> >
> > > +
> > > +             /*
> > > +              * device_link_add will check priv->pd_dev[i], if it is
> > > +              * NULL, then will break.
> > > +              */
> > > +             priv->pd_dev_link[i] = device_link_add(dev,
> > > +                                                    priv->pd_dev[i],
> > > +                                                    DL_FLAG_STATELESS |
> > > +                                                    DL_FLAG_PM_RUNTIME);
> > > +             if (!priv->pd_dev_link[i]) {
> > > +                     dev_pm_domain_detach(priv->pd_dev[i], false);
> > > +                     ret = -EINVAL;
> > > +                     goto detach_pm;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +detach_pm:
> > > +     while (--i >= 0) {
> > > +             device_link_del(priv->pd_dev_link[i]);
> > > +             dev_pm_domain_detach(priv->pd_dev[i], false);
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
