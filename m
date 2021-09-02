Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D1C432BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Sep 2021 01:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B48796101A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Sep 2021 01:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhIBBra (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Sep 2021 21:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhIBBr3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Sep 2021 21:47:29 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D267C061575;
        Wed,  1 Sep 2021 18:46:32 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d11so284774qtw.3;
        Wed, 01 Sep 2021 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g9zMm0wQBYncTahrxYJv3K/Bs9abCmirG19RIagmFCc=;
        b=gO89lspNIi+NgnttAs4uYbisBWusCRRcdv1YOLr9MF9fp4Vp6jtAhz9oqMdnvykZgh
         lwJHwcsPRbaW5ikcYqpmW1RFIdVgPWfDj/gSWD57kEkUYd2cC5jXy/Zz0vSrGVp4VBI/
         0vswC6gg+PIg+5SOIh6ov/nWRI8V+C5+SDU0EwSvy1epVj+/bJy2WILpEcGLzkTrGPJY
         TbYGC02a4TgGn+OwObWrtttSq5ZbD1yCkC91eSwAuxzwYBu4YnzX6KDl1yFEGUpTevSX
         LOO4PCtvh2le9CiOzUs59HwtcqOIxE5PnXlnizjUCN1jMoPN2cBtdFgMoCduXPWVFYC8
         NIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9zMm0wQBYncTahrxYJv3K/Bs9abCmirG19RIagmFCc=;
        b=PwNIDOoiGuFO8Mn6t+GG0gX1hYI2pMFM1oCFnHe0zdcsq90AIcMaRE++jwid+b4+1k
         u5gBf6bbdIOwpgjuESHa8sqX41E9NWcfbc1qPBeWoQZas2JfKjkuS9yiOcdOPoUKf7rj
         iS3BVWlhwfnHwu8JFmAVoBJnZL5geWTnLgfKjcb/tP6LqPO4T0nItbPmy2hT8gijOwL0
         e0Nej7RcaqWC4oEXmVb1CkrNcb9bV4QLQmT3f5jkVSHj5pc5MeNjxkjpayW/EjLk5wT8
         PrDRLPn4pkTPHWXu+3/e1it/Spxm2jBQcl6qLTGGzbLfwCc13c2YrsuLTXcY+6sM7/7D
         vBtQ==
X-Gm-Message-State: AOAM530gcS04IySGrbSQ0ns6lDFYX4VZm1l7n5qQ7tnvJze/Zto9XDrJ
        xy+yLZi+IkshFSdM9z0VWHvmnZZ4LomqAm2gmaA=
X-Google-Smtp-Source: ABdhPJyZQ/288RashrbchD7NLwMQ7vl7uMB0kvu4432jvDs9QxTvnbaCJ8GGC9Qz236RoqB48u4209S8rBYqjEcaRFs=
X-Received: by 2002:ac8:5805:: with SMTP id g5mr768332qtg.360.1630547175767;
 Wed, 01 Sep 2021 18:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com>
 <1629876516-16513-2-git-send-email-shengjiu.wang@nxp.com> <20210831180156.GA981305@p14s>
 <CAA+D8AO8hGoQEngq-7f7H9oFwQzoxNkCcEA5fpr5ifuVuEkyxQ@mail.gmail.com> <20210901155051.GA1033512@p14s>
In-Reply-To: <20210901155051.GA1033512@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Thu, 2 Sep 2021 09:46:04 +0800
Message-ID: <CAA+D8APDU8H-nC2xnp+dpa8sLALAnYQFDCb2stv4=o0Hp6NOvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: add remoteproc driver
 for dsp on i.MX
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>, bjorn.andersson@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 1, 2021 at 11:50 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> [...]
>
> >
> > >
> > > > +
> > > > +/* address translation table */
> > > > +struct imx_dsp_rproc_att {
> > > > +     u32 da; /* device address (From Cortex M4 view)*/
> > > > +     u32 sa; /* system bus address */
> > > > +     u32 size; /* size of reg range */
> > > > +     int flags;
> > > > +};
> > >
> > > This is already defined in imx_rproc.c - why do we need another definition here?
> >
> > I just want to avoid to modify imx_rproc.c driver.
> > So with this comments, should I add imx_rproc.h for extracting the common
> > structure in it?
> >
>
> Yes, that is probably the best way to proceed.

Ok, I will do it in the next version.

>
> > >
> > > > +
> > > > +/* Remote core start/stop method */
> > > > +enum imx_dsp_rproc_method {
> > > > +     /* Through syscon regmap */
> > > > +     IMX_DSP_MMIO,
> > > > +     IMX_DSP_SCU_API,
> > > > +};
> > >
> > > From where I stand it would be worth merging the above with imx_rproc_method
> > > found in imx_rproc.c.  I don't see a need for duplication.
> >
> > Should I add imx_rproc.h for extracting the common structure in it?
> >
>
> See my comment above.
>
> > >
> > > > +
> > > > +struct imx_dsp_rproc {
> > > > +     struct device                   *dev;
> > > > +     struct regmap                   *regmap;
> > > > +     struct rproc                    *rproc;
> > > > +     const struct imx_dsp_rproc_dcfg *dcfg;
> > > > +     struct clk                      *clks[DSP_RPROC_CLK_MAX];
> > > > +     struct mbox_client              cl;
> > > > +     struct mbox_client              cl_rxdb;
> > > > +     struct mbox_chan                *tx_ch;
> > > > +     struct mbox_chan                *rx_ch;
> > > > +     struct mbox_chan                *rxdb_ch;
> > > > +     struct device                   **pd_dev;
> > > > +     struct device_link              **pd_dev_link;
> > > > +     struct imx_sc_ipc               *ipc_handle;
> > > > +     struct work_struct              rproc_work;
> > > > +     struct workqueue_struct         *workqueue;
> > > > +     struct completion               pm_comp;
> > > > +     spinlock_t                      mbox_lock;    /* lock for mbox */
> > > > +     int                             num_domains;
> > > > +     u32                             flags;
> > > > +};
> > > > +
> > > > +struct imx_dsp_rproc_dcfg {
> > > > +     u32                             src_reg;
> > > > +     u32                             src_mask;
> > > > +     u32                             src_start;
> > > > +     u32                             src_stop;
> > > > +     const struct imx_dsp_rproc_att  *att;
> > > > +     size_t                          att_size;
> > > > +     enum imx_dsp_rproc_method       method;
> > >
> > > The above is similar to imx_rproc_cfg.  As such:
> > >
> > > struct imx_dsp_rproc_dcfg {
> > >         struct imx_rproc_cfg            *dcfg;
> > >         int (*reset)(struct imx_dsp_rproc *priv);
> > > };
> > >
> >
> > Yes, seems need to add imx_rproc.h header file.
> >
>
> [...]
>
> > > > +
> > > > +/* pm runtime */
> > > > +static int imx_dsp_runtime_resume(struct device *dev)
> > > > +{
> > > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > > +     const struct imx_dsp_rproc_dcfg *dcfg = priv->dcfg;
> > > > +     int ret;
> > > > +
> > > > +     ret = imx_dsp_rproc_mbox_init(priv);
> > >
> > > Why is the mailbox setup and destroyed with every PM cycle?  I find an overall
> > > lack of comments makes this driver difficult to review, resulting in having to
> > > spend more time to look at and understand the code.  I will have to continue
> > > tomorrow because, well, I ran out of time.
> > >
> > > Mathieu
> > >
> >
> > There is power domain attached with mailbox, if request the mailbox
> > channel, the power is enabled. so if setup mailbox in probe(), then
> > the power is enabled always which is no benefit for saving power.
> > so setup mailbox in pm_runtime_resume().
>
> This is the kind of very useful information that should be in comments.

All right,  I will add it in the next version.

>
> >
> > Sorry for lack of comments, I will add more in next version.
>
> That will be much appreciated.
>
> >
> > Again, Thanks your time for reviewing this patch.
>
> More comments to come in a minute...
>
> >
> > Best regards
> > Wang shengjiu
> >
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret = imx_dsp_rproc_clk_enable(priv);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed on imx_dsp_rproc_clk_enable\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     /* reset DSP if needed */
> > > > +     if (dcfg->reset)
> > > > +             dcfg->reset(priv);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int imx_dsp_runtime_suspend(struct device *dev)
> > > > +{
> > > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > > +
> > > > +     imx_dsp_rproc_clk_disable(priv);
> > > > +
> > > > +     imx_dsp_rproc_free_mbox(priv);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void imx_dsp_load_firmware(const struct firmware *fw, void *context)
> > > > +{
> > > > +     struct rproc *rproc = context;
> > > > +     int ret;
> > > > +
> > > > +     /* load the ELF segments to memory */
> > > > +     ret = rproc_load_segments(rproc, fw);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     /* power up the remote processor */
> > > > +     ret = rproc->ops->start(rproc);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     /* same flow as first start */
> > > > +     rproc->ops->kick(rproc, 0);
> > > > +
> > > > +out:
> > > > +     release_firmware(fw);
> > > > +}
> > > > +
> > > > +static int imx_dsp_suspend(struct device *dev)
> > > > +{
> > > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > > +     __u32 mmsg = RP_MBOX_SUSPEND_SYSTEM;
> > > > +     int ret;
> > > > +
> > > > +     if (rproc->state == RPROC_RUNNING) {
> > > > +             reinit_completion(&priv->pm_comp);
> > > > +
> > > > +             ret = mbox_send_message(priv->tx_ch, (void *)&mmsg);
> > > > +             if (ret < 0) {
> > > > +                     dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
> > > > +                     return ret;
> > > > +             }
> > > > +
> > > > +             if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
> > > > +                     return -EBUSY;
> > > > +     }
> > > > +
> > > > +     return pm_runtime_force_suspend(dev);
> > > > +}
> > > > +
> > > > +static int imx_dsp_resume(struct device *dev)
> > > > +{
> > > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > > +     int ret = 0;
> > > > +
> > > > +     ret = pm_runtime_force_resume(dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (rproc->state == RPROC_RUNNING) {
> > > > +             /*TODO: load firmware and start */
> > > > +             ret = request_firmware_nowait(THIS_MODULE,
> > > > +                                           FW_ACTION_UEVENT,
> > > > +                                           rproc->firmware,
> > > > +                                           dev,
> > > > +                                           GFP_KERNEL,
> > > > +                                           rproc,
> > > > +                                           imx_dsp_load_firmware);
> > > > +             if (ret < 0) {
> > > > +                     dev_err(dev, "load firmware failed: %d\n", ret);
> > > > +                     goto err;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err:
> > > > +     pm_runtime_force_suspend(dev);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
> > > > +     SET_SYSTEM_SLEEP_PM_OPS(imx_dsp_suspend, imx_dsp_resume)
> > > > +     SET_RUNTIME_PM_OPS(imx_dsp_runtime_suspend,
> > > > +                        imx_dsp_runtime_resume, NULL)
> > > > +};
> > > > +
> > > > +static const struct of_device_id imx_dsp_rproc_of_match[] = {
> > > > +     { .compatible = "fsl,imx8qxp-hifi4", .data = &imx_dsp_rproc_cfg_imx8qxp },
> > > > +     { .compatible = "fsl,imx8qm-hifi4",  .data = &imx_dsp_rproc_cfg_imx8qm },
> > > > +     { .compatible = "fsl,imx8mp-hifi4",  .data = &imx_dsp_rproc_cfg_imx8mp },
> > > > +     { .compatible = "fsl,imx8ulp-hifi4", .data = &imx_dsp_rproc_cfg_imx8ulp },
> > > > +     {},
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
> > > > +
> > > > +static struct platform_driver imx_dsp_rproc_driver = {
> > > > +     .probe = imx_dsp_rproc_probe,
> > > > +     .remove = imx_dsp_rproc_remove,
> > > > +     .driver = {
> > > > +             .name = "imx-dsp-rproc",
> > > > +             .of_match_table = imx_dsp_rproc_of_match,
> > > > +             .pm = &imx_dsp_rproc_pm_ops,
> > > > +     },
> > > > +};
> > > > +module_platform_driver(imx_dsp_rproc_driver);
> > > > +
> > > > +MODULE_LICENSE("GPL v2");
> > > > +MODULE_DESCRIPTION("i.MX HiFi Core Remote Processor Control Driver");
> > > > +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> > > > --
> > > > 2.17.1
> > > >
