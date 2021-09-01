Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3653DC432BE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Sep 2021 15:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10C9B6056C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Sep 2021 15:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343794AbhIAPvy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Sep 2021 11:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244434AbhIAPvx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Sep 2021 11:51:53 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27B3C061575
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Sep 2021 08:50:56 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so10211pjq.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Sep 2021 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qNB0tKe+YPZM3TdHiuuATVpTDN8fjKcxkbtEtf3WGZs=;
        b=D2VIIJH1pwcPd9oP8vDlWrHD7vywgcZDjqNwZHeE1fAtg4vzhJj6cWQRlSBtSkFJdk
         Ntq8DQXQgrmAeoxqmvrKRAvFQ7YduPAWOMeyjgN5U2Sc33oXmnvovWMi2mghrQqtvjDz
         X3RFYvT5u/rElfqxXmSsUjyK7+uCTNQgId67dl18kVbrcIlTLnFrDn7KdK/2FygGgmxy
         WHux9o83IwIT4sKzdRL7wrRS2/R+2vdHx+1Rv4ha8BCgWJ1lScOlu/Q8Xha7RAc78B6I
         QwOxrvvbhJhU8XPTmrNZw0Oyqb+j4zBgjCRDgUk83ItXwXxPXaiP0vwgvV7xPNdMkAz/
         NVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qNB0tKe+YPZM3TdHiuuATVpTDN8fjKcxkbtEtf3WGZs=;
        b=rqVyaYDnm4C2geP139Ovu21EtUchJrv3pxulj7rCMwGWOwLKFwXzSUkHnquvTh5LuF
         DCb38ja+smY4W/lSc+34MHQdoSBbX/nx92no5zb5TPv2u5aViEGjcOvvFbmwcisEXxjF
         Av/0XHT7PpeCF/Q+g/szPQ5yrU8LVAaoNA4lDLjVb23OSS719lUhW04H1jIYYx6N5qcW
         hEf2WTelgUbyqRhvP6H2g9dTGh9zxLQGq0LZUsea9VD1YAHeMUJISmwteoDTHrQo/mCU
         oVeEwSnkcZwz/RPTIbjRfu6OxUqXC0Nb1whvndBvMUxTREESoIZWrJczVBopI0UHC4an
         vlrw==
X-Gm-Message-State: AOAM530BZmm0a45kyr1IJdcBI84Jnf1tFdcavXI0+esxyhQxXWLcIa2A
        axcymM8CDNHr/D0h1sjKoAYJmg==
X-Google-Smtp-Source: ABdhPJxkyySCUKlwAICIssEef5Y7Lhbgx2xQ/jE8094p4LyKSF+NE/+JoJJe4ABG4D4FQZbcMydWCg==
X-Received: by 2002:a17:902:a586:b0:132:6a9c:f8d9 with SMTP id az6-20020a170902a58600b001326a9cf8d9mr128494plb.3.1630511455840;
        Wed, 01 Sep 2021 08:50:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n41sm382751pfv.43.2021.09.01.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 08:50:54 -0700 (PDT)
Date:   Wed, 1 Sep 2021 09:50:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
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
Subject: Re: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: add remoteproc driver
 for dsp on i.MX
Message-ID: <20210901155051.GA1033512@p14s>
References: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com>
 <1629876516-16513-2-git-send-email-shengjiu.wang@nxp.com>
 <20210831180156.GA981305@p14s>
 <CAA+D8AO8hGoQEngq-7f7H9oFwQzoxNkCcEA5fpr5ifuVuEkyxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AO8hGoQEngq-7f7H9oFwQzoxNkCcEA5fpr5ifuVuEkyxQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[...]

> 
> >
> > > +
> > > +/* address translation table */
> > > +struct imx_dsp_rproc_att {
> > > +     u32 da; /* device address (From Cortex M4 view)*/
> > > +     u32 sa; /* system bus address */
> > > +     u32 size; /* size of reg range */
> > > +     int flags;
> > > +};
> >
> > This is already defined in imx_rproc.c - why do we need another definition here?
> 
> I just want to avoid to modify imx_rproc.c driver.
> So with this comments, should I add imx_rproc.h for extracting the common
> structure in it?
> 

Yes, that is probably the best way to proceed.

> >
> > > +
> > > +/* Remote core start/stop method */
> > > +enum imx_dsp_rproc_method {
> > > +     /* Through syscon regmap */
> > > +     IMX_DSP_MMIO,
> > > +     IMX_DSP_SCU_API,
> > > +};
> >
> > From where I stand it would be worth merging the above with imx_rproc_method
> > found in imx_rproc.c.  I don't see a need for duplication.
> 
> Should I add imx_rproc.h for extracting the common structure in it?
> 

See my comment above.

> >
> > > +
> > > +struct imx_dsp_rproc {
> > > +     struct device                   *dev;
> > > +     struct regmap                   *regmap;
> > > +     struct rproc                    *rproc;
> > > +     const struct imx_dsp_rproc_dcfg *dcfg;
> > > +     struct clk                      *clks[DSP_RPROC_CLK_MAX];
> > > +     struct mbox_client              cl;
> > > +     struct mbox_client              cl_rxdb;
> > > +     struct mbox_chan                *tx_ch;
> > > +     struct mbox_chan                *rx_ch;
> > > +     struct mbox_chan                *rxdb_ch;
> > > +     struct device                   **pd_dev;
> > > +     struct device_link              **pd_dev_link;
> > > +     struct imx_sc_ipc               *ipc_handle;
> > > +     struct work_struct              rproc_work;
> > > +     struct workqueue_struct         *workqueue;
> > > +     struct completion               pm_comp;
> > > +     spinlock_t                      mbox_lock;    /* lock for mbox */
> > > +     int                             num_domains;
> > > +     u32                             flags;
> > > +};
> > > +
> > > +struct imx_dsp_rproc_dcfg {
> > > +     u32                             src_reg;
> > > +     u32                             src_mask;
> > > +     u32                             src_start;
> > > +     u32                             src_stop;
> > > +     const struct imx_dsp_rproc_att  *att;
> > > +     size_t                          att_size;
> > > +     enum imx_dsp_rproc_method       method;
> >
> > The above is similar to imx_rproc_cfg.  As such:
> >
> > struct imx_dsp_rproc_dcfg {
> >         struct imx_rproc_cfg            *dcfg;
> >         int (*reset)(struct imx_dsp_rproc *priv);
> > };
> >
> 
> Yes, seems need to add imx_rproc.h header file.
>

[...]

> > > +
> > > +/* pm runtime */
> > > +static int imx_dsp_runtime_resume(struct device *dev)
> > > +{
> > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > +     const struct imx_dsp_rproc_dcfg *dcfg = priv->dcfg;
> > > +     int ret;
> > > +
> > > +     ret = imx_dsp_rproc_mbox_init(priv);
> >
> > Why is the mailbox setup and destroyed with every PM cycle?  I find an overall
> > lack of comments makes this driver difficult to review, resulting in having to
> > spend more time to look at and understand the code.  I will have to continue
> > tomorrow because, well, I ran out of time.
> >
> > Mathieu
> >
> 
> There is power domain attached with mailbox, if request the mailbox
> channel, the power is enabled. so if setup mailbox in probe(), then
> the power is enabled always which is no benefit for saving power.
> so setup mailbox in pm_runtime_resume().

This is the kind of very useful information that should be in comments.

> 
> Sorry for lack of comments, I will add more in next version.

That will be much appreciated.

> 
> Again, Thanks your time for reviewing this patch.

More comments to come in a minute...

> 
> Best regards
> Wang shengjiu
> 
> > > +     if (ret) {
> > > +             dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = imx_dsp_rproc_clk_enable(priv);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed on imx_dsp_rproc_clk_enable\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* reset DSP if needed */
> > > +     if (dcfg->reset)
> > > +             dcfg->reset(priv);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int imx_dsp_runtime_suspend(struct device *dev)
> > > +{
> > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > +
> > > +     imx_dsp_rproc_clk_disable(priv);
> > > +
> > > +     imx_dsp_rproc_free_mbox(priv);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void imx_dsp_load_firmware(const struct firmware *fw, void *context)
> > > +{
> > > +     struct rproc *rproc = context;
> > > +     int ret;
> > > +
> > > +     /* load the ELF segments to memory */
> > > +     ret = rproc_load_segments(rproc, fw);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     /* power up the remote processor */
> > > +     ret = rproc->ops->start(rproc);
> > > +     if (ret)
> > > +             goto out;
> > > +
> > > +     /* same flow as first start */
> > > +     rproc->ops->kick(rproc, 0);
> > > +
> > > +out:
> > > +     release_firmware(fw);
> > > +}
> > > +
> > > +static int imx_dsp_suspend(struct device *dev)
> > > +{
> > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > +     __u32 mmsg = RP_MBOX_SUSPEND_SYSTEM;
> > > +     int ret;
> > > +
> > > +     if (rproc->state == RPROC_RUNNING) {
> > > +             reinit_completion(&priv->pm_comp);
> > > +
> > > +             ret = mbox_send_message(priv->tx_ch, (void *)&mmsg);
> > > +             if (ret < 0) {
> > > +                     dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
> > > +                     return ret;
> > > +             }
> > > +
> > > +             if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
> > > +                     return -EBUSY;
> > > +     }
> > > +
> > > +     return pm_runtime_force_suspend(dev);
> > > +}
> > > +
> > > +static int imx_dsp_resume(struct device *dev)
> > > +{
> > > +     struct rproc *rproc = dev_get_drvdata(dev);
> > > +     int ret = 0;
> > > +
> > > +     ret = pm_runtime_force_resume(dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (rproc->state == RPROC_RUNNING) {
> > > +             /*TODO: load firmware and start */
> > > +             ret = request_firmware_nowait(THIS_MODULE,
> > > +                                           FW_ACTION_UEVENT,
> > > +                                           rproc->firmware,
> > > +                                           dev,
> > > +                                           GFP_KERNEL,
> > > +                                           rproc,
> > > +                                           imx_dsp_load_firmware);
> > > +             if (ret < 0) {
> > > +                     dev_err(dev, "load firmware failed: %d\n", ret);
> > > +                     goto err;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +err:
> > > +     pm_runtime_force_suspend(dev);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
> > > +     SET_SYSTEM_SLEEP_PM_OPS(imx_dsp_suspend, imx_dsp_resume)
> > > +     SET_RUNTIME_PM_OPS(imx_dsp_runtime_suspend,
> > > +                        imx_dsp_runtime_resume, NULL)
> > > +};
> > > +
> > > +static const struct of_device_id imx_dsp_rproc_of_match[] = {
> > > +     { .compatible = "fsl,imx8qxp-hifi4", .data = &imx_dsp_rproc_cfg_imx8qxp },
> > > +     { .compatible = "fsl,imx8qm-hifi4",  .data = &imx_dsp_rproc_cfg_imx8qm },
> > > +     { .compatible = "fsl,imx8mp-hifi4",  .data = &imx_dsp_rproc_cfg_imx8mp },
> > > +     { .compatible = "fsl,imx8ulp-hifi4", .data = &imx_dsp_rproc_cfg_imx8ulp },
> > > +     {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
> > > +
> > > +static struct platform_driver imx_dsp_rproc_driver = {
> > > +     .probe = imx_dsp_rproc_probe,
> > > +     .remove = imx_dsp_rproc_remove,
> > > +     .driver = {
> > > +             .name = "imx-dsp-rproc",
> > > +             .of_match_table = imx_dsp_rproc_of_match,
> > > +             .pm = &imx_dsp_rproc_pm_ops,
> > > +     },
> > > +};
> > > +module_platform_driver(imx_dsp_rproc_driver);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_DESCRIPTION("i.MX HiFi Core Remote Processor Control Driver");
> > > +MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
> > > --
> > > 2.17.1
> > >
