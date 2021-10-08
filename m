Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDDDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 01:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F030160FE8
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 01:53:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhJHBz1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Oct 2021 21:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJHBzY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Oct 2021 21:55:24 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31121C061570;
        Thu,  7 Oct 2021 18:53:30 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so8031652qki.3;
        Thu, 07 Oct 2021 18:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7todBHdUdrk6e6UQ0gc/p1j76bLvlAp/nPJIsH1ZwrU=;
        b=pYnevWap+Nr7RyAO44CZlMPTpYR5EQmDloM6Oxm/wRKX1hYpweH+gBE4gQcMVfrbmQ
         K1/A21aj+3oJSnOuO3k3MkrlFKZCgHjIkn0ZrCBlXaOtt7r4L56575GtYEA4jqvBxsee
         m5cKizWctwS9lPtGra1C1CxemYkXhJEYYf2Xg/eBr7i3lTzJoslhdC2SnSyVuQdle0sC
         IxecV14wttzHpdidvAmBJpAerxuInifYORccHbTQvGsbmuPnig+TiPLMbE58/MIzWDUa
         gYC4M0+JxpYZPyjaqCmlvPZE11tt7CpFhgtIk9xPtPiYoiYwg/I2xEd8PUC8OemV1V8/
         DdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7todBHdUdrk6e6UQ0gc/p1j76bLvlAp/nPJIsH1ZwrU=;
        b=Q9EmrozJgTR7T18o7QCPT0Acu4GHkfqQEzJ192Hv0w4ipz5mHO2lg6kvDgR+hEsv8P
         FQwvB1dnnHiffaFtA7JG39JIxjDrlaxy/kYi5V+wIK9jtY/8x0iY25YKW0nPZj+n3HVa
         qgCBxAvYrMJNQE9rJTq88O2AcL8UtdCiMRK0anYP3v8r6hC8MDRhCfgrDuxVucKYDfUq
         fFiHh3+k0bdwDmdGdioe+OS0UeWxZhnitKofdcYIVg3CBah+SewDVz/FDVmMU6zPIP29
         YCx5QXJgNri3zDdTDwB/liUk7HEXJaTKlirE+TD5IN282PzBAgLeN6E174hOMIyb19xT
         qYoA==
X-Gm-Message-State: AOAM530q7Eo8W5AvrjbMTUESMBfOPpLqBOfExRmWEu5SnhcIud7e7JYq
        O+viPNvsLOlPga6VInSlcferu87fYc3AINPRaYg=
X-Google-Smtp-Source: ABdhPJyub/QHvISEi0k5mdUs2wnnkzAP+wB09A+dNspF4cZL5duX0GGffeUg7FUrIvC5sukpkWeX0AAH4FOnxhM9WBI=
X-Received: by 2002:a37:8ce:: with SMTP id 197mr663603qki.492.1633658009360;
 Thu, 07 Oct 2021 18:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-4-git-send-email-shengjiu.wang@nxp.com> <20211006162511.GA3370862@p14s>
In-Reply-To: <20211006162511.GA3370862@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Fri, 8 Oct 2021 09:53:18 +0800
Message-ID: <CAA+D8AOmnZ6wWBzJe5imMcyoVE0fSiOyLpWb83bYPwadJ5O-Mg@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

On Thu, Oct 7, 2021 at 12:25 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Shengjiu,
>
> This pachset doesn't apply to rproc-next, which is now located here[1].  The
> change is in linux-next but not in mainline yet.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=rproc-next

Ok, I will double check it and fix it.

>
> On Sun, Sep 26, 2021 at 11:07:09AM +0800, Shengjiu Wang wrote:
> > Provide a basic driver to control DSP processor found on NXP i.MX8QM,
> > i.MX8QXP, i.MX8MP and i.MX8ULP.
> >
> > Currently it is able to resolve addresses between DSP and main CPU,
> > start and stop the processor, suspend and resume.
> >
> > The communication between DSP and main CPU is based on mailbox, there
> > are three mailbox channels (tx, rx, rxdb).
> >
> > This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/Kconfig         |   11 +
> >  drivers/remoteproc/Makefile        |    1 +
> >  drivers/remoteproc/imx_dsp_rproc.c | 1206 ++++++++++++++++++++++++++++
> >  3 files changed, 1218 insertions(+)
> >  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
> >
>
> [...]
>
> > +
> > +/**
> > + * imx_dsp_attach_pm_domains() - attach the power domains
> > + * @priv: private data pointer
> > + *
> > + * On i.MX8QM and i.MX8QXP there is multiple power domains
> > + * required, so need to link them.
> > + */
> > +static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
> > +{
> > +     struct device *dev = priv->rproc->dev.parent;
> > +     int ret, i;
> > +
> > +     priv->num_domains = of_count_phandle_with_args(dev->of_node,
> > +                                                    "power-domains",
> > +                                                    "#power-domain-cells");
> > +
> > +     /* If only one domain, then no need to link the device */
> > +     if (priv->num_domains <= 1)
> > +             return 0;
> > +
> > +     priv->pd_dev = devm_kmalloc_array(dev, priv->num_domains,
> > +                                       sizeof(*priv->pd_dev),
> > +                                       GFP_KERNEL);
> > +     if (!priv->pd_dev)
> > +             return -ENOMEM;
> > +
> > +     priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_domains,
> > +                                            sizeof(*priv->pd_dev_link),
> > +                                            GFP_KERNEL);
> > +     if (!priv->pd_dev_link)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < priv->num_domains; i++) {
> > +             priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> > +             if (IS_ERR(priv->pd_dev[i])) {
> > +                     ret = PTR_ERR(priv->pd_dev[i]);
> > +                     goto detach_pm;
> > +             }
>
> I have pointed a problem with the error handling in the above during the
> previous review and it was not addressed.

I have considered your comments.  Actually when
dev_pm_domain_attach_by_id() return NULL, the device_link_add()
will break, I have added comments below, so above error handling
for dev_pm_domain_attach_by_id() is enough.

Best regards
Wang Shengjiu
>
> > +
> > +             /*
> > +              * device_link_add will check priv->pd_dev[i], if it is
> > +              * NULL, then will break.
> > +              */
> > +             priv->pd_dev_link[i] = device_link_add(dev,
> > +                                                    priv->pd_dev[i],
> > +                                                    DL_FLAG_STATELESS |
> > +                                                    DL_FLAG_PM_RUNTIME);
> > +             if (!priv->pd_dev_link[i]) {
> > +                     dev_pm_domain_detach(priv->pd_dev[i], false);
> > +                     ret = -EINVAL;
> > +                     goto detach_pm;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +
> > +detach_pm:
> > +     while (--i >= 0) {
> > +             device_link_del(priv->pd_dev_link[i]);
> > +             dev_pm_domain_detach(priv->pd_dev[i], false);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
