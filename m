Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78B3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Sep 2021 03:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98D9C6115B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Sep 2021 03:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhIODKf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Sep 2021 23:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233717AbhIODKe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Sep 2021 23:10:34 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B32C061574;
        Tue, 14 Sep 2021 20:09:16 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x5so1076505qtq.13;
        Tue, 14 Sep 2021 20:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiTlGDshcR2fX08C6KZjn8cjtZkgvc2tC9qDuSI8se4=;
        b=mQriKLpgspAX8o7Zn5W2tgGLNmy2RVyzN5jA9uvByH3ER1+jdMug8EjoNpQpLltUv0
         NrkcTQxr5AvAo7w1EWxmqSTH2/cnb2tZO6M5a9KXiQHXr/OY/i5UBHq8BH5RbEos3FI5
         okuLTexoVY3aoEFzXhFugYLXuAfgmLagjnmfZwJp1RoGwQ7yc1dcKU7jM1CZmFeaAy9Y
         YkqSiCSXKRjkIKsZvHiK9E6SOhk3PFaMxZTYV5ROHogbt3gBQ1jcVp79oRgpUVhGXkhU
         Vmk+9abl1mdInI4PsAZfAFOvLI70Iy9bilOToADNwwbDFMTcuU8z2g8SAHSL0fntva3y
         scHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiTlGDshcR2fX08C6KZjn8cjtZkgvc2tC9qDuSI8se4=;
        b=4fmMZR5V+nIW+YEKbW3daTysa8gk9p2RDc9VU1pQ4ylKQ17vNkrq+RxWR9Ksqy8212
         mTiDrWBpbEUjb/yIA+MXcXu3TRju8z6bR+x2lC/7XgZMCVgVLBjgNI0rj2Y+DMqfuh/x
         +hReQLbtYMTjRNbBG8mQqov51X9927rGBawBIxUOF1zFTgN1AFcVQppX2GFPgGcJaSL9
         gtljR2l21NxRTg8kOfLkJ/o1zLhPmZcfgU7XI9n+Ysf5TTbtALEy5RJseMLM8vUu0hQj
         +HB5+5ReplfhL3p0JYuigVO5OOn5XHWEAiKaAiPJS35g51lyVfpBNOpMmK5sPdtgcZOU
         WO2Q==
X-Gm-Message-State: AOAM5311G59DpH9dkLhvKSuO/jUa/P13IcJ/2PRKngOEOpqPRT0GVuo7
        KE/+pM8w42K6pVZsaz2xAnzjsSHTrkqDPCoRWqI=
X-Google-Smtp-Source: ABdhPJxoHDE0Sxit9eO5YltGm1GWpxfcnWJzdkGgVE/RsJ3iwx3CKOwzqPyri4/f3mbajwHtXgF+zbM+z2JdMd5vYkc=
X-Received: by 2002:ac8:4292:: with SMTP id o18mr8035934qtl.75.1631675355323;
 Tue, 14 Sep 2021 20:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com> <20210914175647.GD1719994@p14s>
In-Reply-To: <20210914175647.GD1719994@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Wed, 15 Sep 2021 11:09:04 +0800
Message-ID: <CAA+D8AMbuE9oCgyHw_68G-JmOLE9n6253HYzWDxc90BoWTMC=w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, daniel.baluta@nxp.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 15, 2021 at 1:56 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Sep 08, 2021 at 05:10:54PM +0800, Shengjiu Wang wrote:
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
> >  drivers/remoteproc/imx_dsp_rproc.c | 1178 ++++++++++++++++++++++++++++
> >  3 files changed, 1190 insertions(+)
> >  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index 9a6eedc3994a..890a14e6f3f9 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -34,6 +34,17 @@ config IMX_REMOTEPROC
> >
> >         It's safe to say N here.
> >
> > +config IMX_DSP_REMOTEPROC
> > +     tristate "i.MX DSP remoteproc support"
> > +     depends on ARCH_MXC
> > +     depends on HAVE_ARM_SMCCC
> > +     select MAILBOX
> > +     help
> > +       Say y here to support iMX's DSP remote processors via the remote
> > +       processor framework.
> > +
> > +       It's safe to say N here.
> > +
> >  config INGENIC_VPU_RPROC
> >       tristate "Ingenic JZ47xx VPU remoteproc support"
> >       depends on MIPS || COMPILE_TEST
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index bb26c9e4ef9c..37d5cb1c04bf 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -12,6 +12,7 @@ remoteproc-y                                += remoteproc_virtio.o
> >  remoteproc-y                         += remoteproc_elf_loader.o
> >  obj-$(CONFIG_REMOTEPROC_CDEV)                += remoteproc_cdev.o
> >  obj-$(CONFIG_IMX_REMOTEPROC)         += imx_rproc.o
> > +obj-$(CONFIG_IMX_DSP_REMOTEPROC)     += imx_dsp_rproc.o
> >  obj-$(CONFIG_INGENIC_VPU_RPROC)              += ingenic_rproc.o
> >  obj-$(CONFIG_MTK_SCP)                        += mtk_scp.o mtk_scp_ipi.o
> >  obj-$(CONFIG_OMAP_REMOTEPROC)                += omap_remoteproc.o
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > new file mode 100644
> > index 000000000000..a12e306b06bd
> > --- /dev/null
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -0,0 +1,1178 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright 2021 NXP
> > +
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +#include <linux/arm-smccc.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/firmware.h>
> > +#include <linux/firmware/imx/sci.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/slab.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "imx_rproc.h"
> > +#include "remoteproc_elf_helpers.h"
> > +#include "remoteproc_internal.h"
> > +
> > +#define DSP_RPROC_CLK_MAX                    5
> > +
> > +#define REMOTE_IS_READY                              BIT(0)
> > +#define REMOTE_READY_WAIT_MAX_RETRIES                500
> > +
> > +/* att flags */
> > +/* DSP own area */
> > +#define ATT_OWN                                      BIT(31)
> > +/* DSP instruction area */
> > +#define ATT_IRAM                             BIT(30)
> > +
> > +/* Definitions for i.MX8MP */
> > +/* DAP registers */
> > +#define IMX8M_DAP_DEBUG                              0x28800000
> > +#define IMX8M_DAP_DEBUG_SIZE                 (64 * 1024)
> > +#define IMX8M_DAP_PWRCTL                     (0x4000 + 0x3020)
> > +#define IMX8M_PWRCTL_CORERESET                       BIT(16)
> > +
> > +/* DSP audio mix registers */
> > +#define IMX8M_AudioDSP_REG0                  0x100
> > +#define IMX8M_AudioDSP_REG1                  0x104
> > +#define IMX8M_AudioDSP_REG2                  0x108
> > +#define IMX8M_AudioDSP_REG3                  0x10c
> > +
> > +#define IMX8M_AudioDSP_REG2_RUNSTALL         BIT(5)
> > +#define IMX8M_AudioDSP_REG2_PWAITMODE                BIT(1)
> > +
> > +/* Definitions for i.MX8ULP */
> > +#define IMX8ULP_SIM_LPAV_REG_SYSCTRL0                0x8
> > +#define IMX8ULP_SYSCTRL0_DSP_DBG_RST         BIT(25)
> > +#define IMX8ULP_SYSCTRL0_DSP_PLAT_CLK_EN     BIT(19)
> > +#define IMX8ULP_SYSCTRL0_DSP_PBCLK_EN                BIT(18)
> > +#define IMX8ULP_SYSCTRL0_DSP_CLK_EN          BIT(17)
> > +#define IMX8ULP_SYSCTRL0_DSP_RST             BIT(16)
> > +#define IMX8ULP_SYSCTRL0_DSP_OCD_HALT                BIT(14)
> > +#define IMX8ULP_SYSCTRL0_DSP_STALL           BIT(13)
> > +
> > +#define IMX8ULP_SIP_HIFI_XRDC                        0xc200000e
> > +
> > +/*
> > + * enum - Predefined Mailbox Messages
> > + *
> > + * @RP_MBOX_SUSPEND_SYSTEM: system suspend request for the remote processor
> > + *
> > + * @RP_MBOX_SUSPEND_ACK: successful response from remote processor for a
> > + * suspend request
> > + *
> > + * @RP_MBOX_RESUME_SYSTEM: system resume request for the remote processor
> > + *
> > + * @RP_MBOX_RESUME_ACK: successful response from remote processor for a
> > + * resume request
> > + */
> > +enum imx_dsp_rp_mbox_messages {
> > +     RP_MBOX_SUSPEND_SYSTEM                  = 0xFF11,
> > +     RP_MBOX_SUSPEND_ACK                     = 0xFF12,
> > +     RP_MBOX_RESUME_SYSTEM                   = 0xFF13,
> > +     RP_MBOX_RESUME_ACK                      = 0xFF14,
> > +};
> > +
> > +/**
> > + * struct imx_dsp_rproc - DSP remote processor state
> > + * @regmap: regmap handler
> > + * @rproc: rproc handler
> > + * @dsp_dcfg: device configuration pointer
> > + * @clks: clocks needed by this device
> > + * @cl: mailbox client to request the mailbox channel
> > + * @cl_rxdb: mailbox client to request the mailbox channel for doorbell
> > + * @tx_ch: mailbox tx channel handle
> > + * @rx_ch: mailbox rx channel handle
> > + * @rxdb_ch: mailbox rx doorbell channel handle
> > + * @pd_dev: power domain device
> > + * @pd_dev_link: power domain device link
> > + * @ipc_handle: System Control Unit ipc handle
> > + * @rproc_work: work for processing virtio interrupts
> > + * @workqueue: workqueue for processing virtio interrupts
> > + * @pm_comp: completion primitive to sync for suspend response
> > + * @num_domains: power domain number
> > + * @flags: control flags
> > + */
> > +struct imx_dsp_rproc {
> > +     struct regmap                           *regmap;
> > +     struct rproc                            *rproc;
> > +     const struct imx_dsp_rproc_dcfg         *dsp_dcfg;
> > +     struct clk_bulk_data                    clks[DSP_RPROC_CLK_MAX];
> > +     struct mbox_client                      cl;
> > +     struct mbox_client                      cl_rxdb;
> > +     struct mbox_chan                        *tx_ch;
> > +     struct mbox_chan                        *rx_ch;
> > +     struct mbox_chan                        *rxdb_ch;
> > +     struct device                           **pd_dev;
> > +     struct device_link                      **pd_dev_link;
> > +     struct imx_sc_ipc                       *ipc_handle;
> > +     struct work_struct                      rproc_work;
> > +     struct workqueue_struct                 *workqueue;
> > +     struct completion                       pm_comp;
> > +     int                                     num_domains;
> > +     u32                                     flags;
> > +};
> > +
> > +/**
> > + * struct imx_dsp_rproc_dcfg - DSP remote processor configuration
> > + * @dcfg: imx_rproc_dcfg handler
> > + * @reset: reset callback function
> > + */
> > +struct imx_dsp_rproc_dcfg {
> > +     const struct imx_rproc_dcfg             *dcfg;
> > +     int (*reset)(struct imx_dsp_rproc *priv);
> > +};
> > +
> > +static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
> > +     /* dev addr , sys addr  , size      , flags */
> > +     { 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> > +     { 0x596f0000, 0x556f0000, 0x00008000, ATT_OWN },
> > +     { 0x596f8000, 0x556f8000, 0x00000800, ATT_OWN | ATT_IRAM},
> > +     { 0x55700000, 0x55700000, 0x00070000, ATT_OWN },
> > +     /* DDR (Data) */
> > +     { 0x80000000, 0x80000000, 0x60000000, 0},
> > +};
> > +
> > +static const struct imx_rproc_att imx_dsp_rproc_att_imx8qxp[] = {
> > +     /* dev addr , sys addr  , size      , flags */
> > +     { 0x596e8000, 0x596e8000, 0x00008000, ATT_OWN },
> > +     { 0x596f0000, 0x596f0000, 0x00008000, ATT_OWN },
> > +     { 0x596f8000, 0x596f8000, 0x00000800, ATT_OWN | ATT_IRAM},
> > +     { 0x59700000, 0x59700000, 0x00070000, ATT_OWN },
> > +     /* DDR (Data) */
> > +     { 0x80000000, 0x80000000, 0x60000000, 0},
> > +};
> > +
> > +static const struct imx_rproc_att imx_dsp_rproc_att_imx8mp[] = {
> > +     /* dev addr , sys addr  , size      , flags */
> > +     { 0x3b6e8000, 0x3b6e8000, 0x00008000, ATT_OWN },
> > +     { 0x3b6f0000, 0x3b6f0000, 0x00008000, ATT_OWN },
> > +     { 0x3b6f8000, 0x3b6f8000, 0x00000800, ATT_OWN | ATT_IRAM},
> > +     { 0x3b700000, 0x3b700000, 0x00040000, ATT_OWN },
> > +     /* DDR (Data) */
> > +     { 0x40000000, 0x40000000, 0x80000000, 0},
> > +};
> > +
> > +static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
> > +     /* dev addr , sys addr  , size      , flags */
> > +     { 0x21170000, 0x21170000, 0x00010000, ATT_OWN | ATT_IRAM},
> > +     { 0x21180000, 0x21180000, 0x00010000, ATT_OWN },
> > +     /* DDR (Data) */
> > +     { 0x0c000000, 0x80000000, 0x10000000, 0},
> > +     { 0x30000000, 0x90000000, 0x10000000, 0},
> > +};
> > +
> > +/* Reset function for DSP on i.MX8MP */
> > +static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > +{
> > +     void __iomem *dap = ioremap_wc(IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
> > +     int pwrctl;
> > +
> > +     /* Put DSP into reset and stall */
> > +     pwrctl = readl(dap + IMX8M_DAP_PWRCTL);
> > +     pwrctl |= IMX8M_PWRCTL_CORERESET;
> > +     writel(pwrctl, dap + IMX8M_DAP_PWRCTL);
> > +
> > +     /* Keep reset asserted for 10 cycles */
> > +     usleep_range(1, 2);
> > +
> > +     regmap_update_bits(priv->regmap, IMX8M_AudioDSP_REG2,
> > +                        IMX8M_AudioDSP_REG2_RUNSTALL,
> > +                        IMX8M_AudioDSP_REG2_RUNSTALL);
> > +
> > +     /* Take the DSP out of reset and keep stalled for FW loading */
> > +     pwrctl = readl(dap + IMX8M_DAP_PWRCTL);
> > +     pwrctl &= ~IMX8M_PWRCTL_CORERESET;
> > +     writel(pwrctl, dap + IMX8M_DAP_PWRCTL);
> > +
> > +     iounmap(dap);
> > +     return 0;
> > +}
> > +
> > +/* Reset function for DSP on i.MX8ULP */
> > +static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
> > +{
> > +     struct arm_smccc_res res;
> > +
> > +     /* Put DSP into reset and stall */
> > +     regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> > +                        IMX8ULP_SYSCTRL0_DSP_RST, IMX8ULP_SYSCTRL0_DSP_RST);
> > +     regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> > +                        IMX8ULP_SYSCTRL0_DSP_STALL,
> > +                        IMX8ULP_SYSCTRL0_DSP_STALL);
> > +
> > +     /* Configure resources of DSP through TFA */
> > +     arm_smccc_smc(IMX8ULP_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &res);
> > +
> > +     /* Take the DSP out of reset and keep stalled for FW loading */
> > +     regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> > +                        IMX8ULP_SYSCTRL0_DSP_RST, 0);
> > +     regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> > +                        IMX8ULP_SYSCTRL0_DSP_DBG_RST, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +/* Specific configuration for i.MX8MP */
> > +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
> > +     .src_reg        = IMX8M_AudioDSP_REG2,
> > +     .src_mask       = IMX8M_AudioDSP_REG2_RUNSTALL,
> > +     .src_start      = 0,
> > +     .src_stop       = IMX8M_AudioDSP_REG2_RUNSTALL,
> > +     .att            = imx_dsp_rproc_att_imx8mp,
> > +     .att_size       = ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> > +     .method         = IMX_RPROC_MMIO,
> > +};
> > +
> > +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
> > +     .dcfg           = &dsp_rproc_cfg_imx8mp,
> > +     .reset          = imx8mp_dsp_reset,
> > +};
> > +
> > +/* Specific configuration for i.MX8ULP */
> > +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
> > +     .src_reg        = IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
> > +     .src_mask       = IMX8ULP_SYSCTRL0_DSP_STALL,
> > +     .src_start      = 0,
> > +     .src_stop       = IMX8ULP_SYSCTRL0_DSP_STALL,
> > +     .att            = imx_dsp_rproc_att_imx8ulp,
> > +     .att_size       = ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
> > +     .method         = IMX_RPROC_MMIO,
> > +};
> > +
> > +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
> > +     .dcfg           = &dsp_rproc_cfg_imx8ulp,
> > +     .reset          = imx8ulp_dsp_reset,
> > +};
> > +
> > +/* Specific configuration for i.MX8QXP */
> > +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
> > +     .att            = imx_dsp_rproc_att_imx8qxp,
> > +     .att_size       = ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
> > +     .method         = IMX_RPROC_SCU_API,
> > +};
> > +
> > +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
> > +     .dcfg           = &dsp_rproc_cfg_imx8qxp,
> > +};
> > +
> > +/* Specific configuration for i.MX8QM */
> > +static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
> > +     .att            = imx_dsp_rproc_att_imx8qm,
> > +     .att_size       = ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
> > +     .method         = IMX_RPROC_SCU_API,
> > +};
> > +
> > +static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
> > +     .dcfg           = &dsp_rproc_cfg_imx8qm,
> > +};
> > +
> > +static int imx_dsp_rproc_ready(struct rproc *rproc)
> > +{
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     int i;
> > +
> > +     if (!priv->rxdb_ch)
> > +             return 0;
> > +
> > +     for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
> > +             if (priv->flags & REMOTE_IS_READY)
> > +                     return 0;
> > +             usleep_range(100, 200);
> > +     }
> > +
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +/*
> > + * Start function for rproc_ops
> > + *
> > + * There is a handshake for start procedure: when DSP starts, it
> > + * will send a doorbell message to this driver, then the
> > + * REMOTE_IS_READY flags is set, then driver will kick
> > + * a message to DSP.
> > + */
> > +static int imx_dsp_rproc_start(struct rproc *rproc)
> > +{
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > +     const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > +     struct device *dev = rproc->dev.parent;
> > +     int ret;
> > +
> > +     switch (dcfg->method) {
> > +     case IMX_RPROC_MMIO:
> > +             ret = regmap_update_bits(priv->regmap,
> > +                                      dcfg->src_reg,
> > +                                      dcfg->src_mask,
> > +                                      dcfg->src_start);
> > +             break;
> > +     case IMX_RPROC_SCU_API:
> > +             ret = imx_sc_pm_cpu_start(priv->ipc_handle,
> > +                                       IMX_SC_R_DSP,
> > +                                       true,
> > +                                       rproc->bootaddr);
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     if (ret)
> > +             dev_err(dev, "Failed to enable remote core!\n");
> > +     else
> > +             ret = imx_dsp_rproc_ready(rproc);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Stop function for rproc_ops
> > + * It clears the REMOTE_IS_READY flags
> > + */
> > +static int imx_dsp_rproc_stop(struct rproc *rproc)
> > +{
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > +     const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > +     struct device *dev = rproc->dev.parent;
> > +     int ret = 0;
> > +
> > +     if (rproc->state == RPROC_CRASHED) {
> > +             priv->flags &= ~REMOTE_IS_READY;
> > +             return 0;
> > +     }
> > +
> > +     switch (dcfg->method) {
> > +     case IMX_RPROC_MMIO:
> > +             ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> > +                                      dcfg->src_stop);
> > +             break;
> > +     case IMX_RPROC_SCU_API:
> > +             ret = imx_sc_pm_cpu_start(priv->ipc_handle,
> > +                                       IMX_SC_R_DSP,
> > +                                       false,
> > +                                       rproc->bootaddr);
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     if (ret)
> > +             dev_err(dev, "Failed to stop remote core\n");
> > +     else
> > +             priv->flags &= ~REMOTE_IS_READY;
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_sys_to_da() - internal memory translation helper
> > + * @priv: private data pointer
> > + * @sys: system address (DDR address)
> > + * @len: length of the memory buffer
> > + * @da: device address to translate
> > + *
> > + * Convert system address (DDR address) to device address (DSP)
> > + * for there may be memory remap for device.
> > + */
> > +static int imx_dsp_rproc_sys_to_da(struct imx_dsp_rproc *priv, u64 sys,
> > +                                size_t len, u64 *da)
> > +{
> > +     const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > +     const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > +     int i;
> > +
> > +     /* Parse address translation table */
> > +     for (i = 0; i < dcfg->att_size; i++) {
> > +             const struct imx_rproc_att *att = &dcfg->att[i];
> > +
> > +             if (sys >= att->sa && sys + len <= att->sa + att->size) {
> > +                     unsigned int offset = sys - att->sa;
> > +
> > +                     *da = att->da + offset;
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     return -ENOENT;
> > +}
> > +
> > +static void imx_dsp_rproc_vq_work(struct work_struct *work)
> > +{
> > +     struct imx_dsp_rproc *priv = container_of(work, struct imx_dsp_rproc,
> > +                                               rproc_work);
> > +
> > +     rproc_vq_interrupt(priv->rproc, 0);
> > +     rproc_vq_interrupt(priv->rproc, 1);
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_rx_callback() - inbound mailbox message handler
> > + * @cl: mailbox client pointer used for requesting the mailbox channel
> > + * @data: mailbox payload
> > + *
> > + * This handler is invoked by mailbox driver whenever a mailbox
> > + * message is received. Usually, the SUSPEND and RESUME related messages
> > + * are handled in this function, other messages are handled by remoteproc core
> > + */
> > +static void imx_dsp_rproc_rx_callback(struct mbox_client *cl, void *data)
> > +{
> > +     struct rproc *rproc = dev_get_drvdata(cl->dev);
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     struct device *dev = rproc->dev.parent;
> > +     u32 message = (u32)(*(u32 *)data);
> > +
> > +     dev_dbg(dev, "mbox msg: 0x%x\n", message);
> > +
> > +     switch (message) {
> > +     case RP_MBOX_SUSPEND_ACK:
> > +             complete(&priv->pm_comp);
> > +             break;
> > +     case RP_MBOX_RESUME_ACK:
> > +             complete(&priv->pm_comp);
> > +             break;
> > +     default:
> > +             queue_work(priv->workqueue, &priv->rproc_work);
> > +             break;
> > +     }
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_rxdb_callback() - inbound mailbox message handler
> > + * @cl: mailbox client pointer used for requesting the mailbox channel
> > + * @data: mailbox payload
> > + *
> > + * For doorbell, there is no message specified, just set REMOTE_IS_READY
> > + * flag.
> > + */
> > +static void imx_dsp_rproc_rxdb_callback(struct mbox_client *cl, void *data)
> > +{
> > +     struct rproc *rproc = dev_get_drvdata(cl->dev);
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +
> > +     /* Remote is ready after firmware is loaded and running */
> > +     priv->flags |= REMOTE_IS_READY;
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_mbox_init() - request mailbox channels
> > + * @priv: private data pointer
> > + *
> > + * Request three mailbox channels (tx, rx, rxdb).
> > + */
> > +static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)
> > +{
> > +     struct device *dev = priv->rproc->dev.parent;
> > +     struct mbox_client *cl;
> > +     int ret;
> > +
> > +     if (!of_get_property(dev->of_node, "mbox-names", NULL))
> > +             return 0;
> > +
> > +     cl = &priv->cl;
> > +     cl->dev = dev;
> > +     cl->tx_block = true;
> > +     cl->tx_tout = 100;
> > +     cl->knows_txdone = false;
> > +     cl->rx_callback = imx_dsp_rproc_rx_callback;
> > +
> > +     /* Channel for sending message */
> > +     priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> > +     if (IS_ERR(priv->tx_ch)) {
> > +             ret = PTR_ERR(priv->tx_ch);
> > +             dev_dbg(cl->dev, "failed to request tx mailbox channel: %d\n",
> > +                     ret);
> > +             goto err_out;
> > +     }
> > +
> > +     /* Channel for receiving message */
> > +     priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> > +     if (IS_ERR(priv->rx_ch)) {
> > +             ret = PTR_ERR(priv->rx_ch);
> > +             dev_dbg(cl->dev, "failed to request rx mailbox channel: %d\n",
> > +                     ret);
> > +             goto err_out;
> > +     }
> > +
> > +     cl = &priv->cl_rxdb;
> > +     cl->dev = dev;
> > +     cl->rx_callback = imx_dsp_rproc_rxdb_callback;
> > +
> > +     /*
> > +      * RX door bell is used to receive the ready signal from remote
> > +      * after firmware loaded.
> > +      */
> > +     priv->rxdb_ch = mbox_request_channel_byname(cl, "rxdb");
> > +     if (IS_ERR(priv->rxdb_ch)) {
> > +             ret = PTR_ERR(priv->rxdb_ch);
> > +             dev_dbg(cl->dev, "failed to request mbox chan rxdb, ret %d\n",
> > +                     ret);
> > +             goto err_out;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_out:
> > +     if (!IS_ERR(priv->tx_ch))
> > +             mbox_free_channel(priv->tx_ch);
> > +     if (!IS_ERR(priv->rx_ch))
> > +             mbox_free_channel(priv->rx_ch);
> > +     if (!IS_ERR(priv->rxdb_ch))
> > +             mbox_free_channel(priv->rxdb_ch);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
> > +{
> > +     mbox_free_channel(priv->tx_ch);
> > +     mbox_free_channel(priv->rx_ch);
> > +     mbox_free_channel(priv->rxdb_ch);
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_add_carveout() - request mailbox channels
> > + * @priv: private data pointer
> > + *
> > + * This function registers specified memory entry in @rproc carveouts list
> > + * The carveouts can help to mapping the memory address for DSP.
> > + */
> > +static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > +{
> > +     const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > +     const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > +     struct rproc *rproc = priv->rproc;
> > +     struct device *dev = rproc->dev.parent;
> > +     struct device_node *np = dev->of_node;
> > +     struct of_phandle_iterator it;
> > +     struct rproc_mem_entry *mem;
> > +     struct reserved_mem *rmem;
> > +     void __iomem *cpu_addr;
> > +     int a;
> > +     u64 da;
> > +
> > +     /* Remap required addresses */
> > +     for (a = 0; a < dcfg->att_size; a++) {
> > +             const struct imx_rproc_att *att = &dcfg->att[a];
> > +
> > +             if (!(att->flags & ATT_OWN))
> > +                     continue;
> > +
> > +             if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
> > +                     return -EINVAL;
> > +
> > +             cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
> > +
> > +             /* Register memory region */
> > +             mem = rproc_mem_entry_init(dev, cpu_addr, (dma_addr_t)att->sa,
> > +                                        att->size, da, NULL, NULL, "dsp_mem");
> > +
> > +             if (mem)
> > +                     rproc_coredump_add_segment(rproc, da, att->size);
> > +             else
> > +                     return -ENOMEM;
> > +
> > +             rproc_add_carveout(rproc, mem);
> > +     }
> > +
> > +     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > +     while (of_phandle_iterator_next(&it) == 0) {
> > +             /*
> > +              * Ignore the first memory region which will be used vdev buffer.
> > +              * No need to do extra handlings, rproc_add_virtio_dev will handle it.
> > +              */
> > +             if (!strcmp(it.node->name, "vdev0buffer"))
> > +                     continue;
> > +
> > +             rmem = of_reserved_mem_lookup(it.node);
> > +             if (!rmem) {
> > +                     dev_err(dev, "unable to acquire memory-region\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             if (imx_dsp_rproc_sys_to_da(priv, rmem->base, rmem->size, &da))
> > +                     return -EINVAL;
> > +
> > +             cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
> > +
> > +             /* Register memory region */
> > +             mem = rproc_mem_entry_init(dev, cpu_addr, (dma_addr_t)rmem->base,
> > +                                        rmem->size, da, NULL, NULL, it.node->name);
> > +
> > +             if (mem)
> > +                     rproc_coredump_add_segment(rproc, da, rmem->size);
> > +             else
> > +                     return -ENOMEM;
> > +
> > +             rproc_add_carveout(rproc, mem);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > + * @rproc: remote processor which will be booted using these fw segments
> > + * @fw: the ELF firmware image
> > + *
> > + * This function specially checks if memsz is zero or not, otherwise it
> > + * is mostly same as rproc_elf_load_segments().
> > + */
> > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > +                                        const struct firmware *fw)
> > +{
> > +     struct device *dev = &rproc->dev;
> > +     u8 class = fw_elf_get_class(fw);
> > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > +     const u8 *elf_data = fw->data;
> > +     const void *ehdr, *phdr;
> > +     int i, ret = 0;
> > +     u16 phnum;
> > +
> > +     ehdr = elf_data;
> > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > +
> > +     /* go through the available ELF segments */
> > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > +             void *ptr;
> > +             bool is_iomem;
> > +
> > +             if (type != PT_LOAD || !memsz)
> > +                     continue;
> > +
> > +             dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> > +                     type, da, memsz, filesz);
> > +
> > +             if (filesz > memsz) {
> > +                     dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
> > +                             filesz, memsz);
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             if (offset + filesz > fw->size) {
> > +                     dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
> > +                             offset + filesz, fw->size);
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             if (!rproc_u64_fit_in_size_t(memsz)) {
> > +                     dev_err(dev, "size (%llx) does not fit in size_t type\n",
> > +                             memsz);
> > +                     ret = -EOVERFLOW;
> > +                     break;
> > +             }
> > +
> > +             /* grab the kernel address for this device address */
> > +             ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > +             if (!ptr) {
> > +                     dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > +                             memsz);
> > +                     ret = -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             /* put the segment where the remote processor expects it */
> > +             if (filesz)
> > +                     memcpy(ptr, elf_data + offset, filesz);
> > +
> > +             /*
> > +              * Zero out remaining memory for this segment.
> > +              *
> > +              * This isn't strictly required since dma_alloc_coherent already
> > +              * did this for us. albeit harmless, we may consider removing
> > +              * this.
> > +              */
> > +             if (memsz > filesz)
> > +                     memset(ptr + filesz, 0, memsz - filesz);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +/* Prepare function for rproc_ops */
> > +static int imx_dsp_rproc_prepare(struct rproc *rproc)
> > +{
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     struct device *dev = rproc->dev.parent;
> > +     struct rproc_mem_entry *carveout;
> > +     int ret;
> > +
> > +     ret = imx_dsp_rproc_add_carveout(priv);
> > +     if (ret) {
> > +             dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> > +             return ret;
> > +     }
> > +
> > +     pm_runtime_get_sync(dev);
> > +
> > +     /*
> > +      * Clear buffers after pm rumtime for internal ocram is not
> > +      * accessible if power and clock are not enabled.
> > +      */
> > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +             if (carveout->va)
> > +                     memset(carveout->va, 0, carveout->len);
> > +     }
> > +
> > +     return  0;
> > +}
> > +
> > +/* Unprepare function for rproc_ops */
> > +static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > +{
> > +     pm_runtime_put_sync(rproc->dev.parent);
> > +
> > +     return  0;
> > +}
> > +
> > +/* Kick function for rproc_ops */
> > +static void imx_dsp_rproc_kick(struct rproc *rproc, int vqid)
> > +{
> > +     struct imx_dsp_rproc *priv = rproc->priv;
> > +     struct device *dev = rproc->dev.parent;
> > +     int err;
> > +     __u32 mmsg;
> > +
> > +     if (!priv->tx_ch) {
> > +             dev_err(dev, "No initialized mbox tx channel\n");
> > +             return;
> > +     }
> > +
> > +     /*
> > +      * Send the index of the triggered virtqueue as the mu payload.
> > +      * Let remote processor know which virtqueue is used.
> > +      */
> > +     mmsg = vqid;
> > +
> > +     err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
> > +     if (err < 0)
> > +             dev_err(dev, "%s: failed (%d, err:%d)\n", __func__, vqid, err);
> > +}
> > +
> > +static const struct rproc_ops imx_dsp_rproc_ops = {
> > +     .prepare        = imx_dsp_rproc_prepare,
> > +     .unprepare      = imx_dsp_rproc_unprepare,
> > +     .start          = imx_dsp_rproc_start,
> > +     .stop           = imx_dsp_rproc_stop,
> > +     .kick           = imx_dsp_rproc_kick,
> > +     .load           = imx_dsp_rproc_elf_load_segments,
> > +     .parse_fw       = rproc_elf_load_rsc_table,
> > +     .sanity_check   = rproc_elf_sanity_check,
> > +     .get_boot_addr  = rproc_elf_get_boot_addr,
> > +};
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
> > +             if (IS_ERR(priv->pd_dev[i]))
> > +                     return PTR_ERR(priv->pd_dev[i]);
> > +
> > +             priv->pd_dev_link[i] = device_link_add(dev,
> > +                                                    priv->pd_dev[i],
> > +                                                    DL_FLAG_STATELESS |
> > +                                                    DL_FLAG_PM_RUNTIME);
> > +             if (IS_ERR(priv->pd_dev_link[i])) {
> > +                     dev_pm_domain_detach(priv->pd_dev[i], false);
> > +                     ret = PTR_ERR(priv->pd_dev_link[i]);
> > +                     goto detach_pm;
> > +             }
>
> The kernel documentation for dev_pm_domain_attach_by_id() and device_link_add()
> cleary mention the possibility to return a NULL value - are you sure those calls
> will never return NULL and as such don't check for it?

Good catch, thank you.  It should be update as below

        for (i = 0; i < priv->num_domains; i++) {
                priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
                if (IS_ERR(priv->pd_dev[i])) {
                        ret = PTR_ERR(priv->pd_dev[i]);
                        goto detach_pm;
                }

                /*
                 * device_link_add will check priv->pd_dev[i], if it is
                 * NULL, then will break.
                 */
                priv->pd_dev_link[i] = device_link_add(dev,
                                                       priv->pd_dev[i],
                                                       DL_FLAG_STATELESS |
                                                       DL_FLAG_PM_RUNTIME);
                if (!priv->pd_dev_link[i]) {
                        dev_pm_domain_detach(priv->pd_dev[i], false);
                        ret = -EINVAL;
                        goto detach_pm;
                }
        }

Best regards
Wang Shengjiu
