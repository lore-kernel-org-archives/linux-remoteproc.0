Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35867C3DA7A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Jan 2023 22:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjABWq2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Jan 2023 17:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjABWq1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Jan 2023 17:46:27 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FBE9FDD
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Jan 2023 14:46:25 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so21871097wms.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Jan 2023 14:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AtjE2laAJrZAoAMWshDqVzFKF504AUwZ6NedPp+9YuQ=;
        b=P5/6AyIJgcQNS6IYUPS34oUqK976qWEONc7RwLTazUhwO6g6TaMKbI0LbilkfcF83h
         VPPDp1eklbMvC51m3kpauXl1jG8MpTUUkSojAeIA8PRw0hWQr6A+8PlKRNWeA30zZlJr
         UPpnRRTZAAmL5CphI/WXDqehKD57xX1fE2b89UWgjbKayTKH3vq6HmTTCVXjBPKygqoK
         DgIpA8VxixIPmblaBUbIBSgzwZY/HyDhTtiuZ2UXazMeTUWNZMAW9x3L4wDPvxSVN4cY
         3J7RMbhHAePyVh1B/PqDH3o75/u6FRk7upJ74Dcf7ivHzppS9a4i8zvecTKHwMhyZt/z
         pzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtjE2laAJrZAoAMWshDqVzFKF504AUwZ6NedPp+9YuQ=;
        b=en6PHRF0ym3ItGQaNN8gjWELbS9+z2U51pI9qGJtYscEl8Cp7ko86X8UQ3HGZ5NdAJ
         mQ1K/waELQiHpwR9mAaatdere4Q12j4AgMAPjh0Lqf5XV3pN65Hb/JMH99YBhkvvTPpR
         mPjXHpo6A4fAOEG//Kuk/4R/gYqhdGq+T7zVWcrMFnXZvuo+sbrpnxpVhk+LL/XW3Ytd
         KjT3PUnLMI4uYh4CAzR8r1E2Js+0YNE9laS4dJOLo1UE+euSo77ODRA1UKqKEdOYpRQk
         Nlgw0i1GyuKVuhmUz2xaSMRIi+TAPssAIvGCdyfV/uSGE1TyCmAmUVjFJeeVyDxG922k
         RxrQ==
X-Gm-Message-State: AFqh2kq0oWsSKga2s5TvWRn1crzg+0S6KeO3ZKKkCrn+PRSZBsV+csTL
        osGdUEswbhToy8Yo/s//iLEBJQYaugk1XIMj9tutqg==
X-Google-Smtp-Source: AMrXdXtzp0g8dvonkcKIyjtQyCf0nDodsli8WXgpe/SYWHilPvgZt+uSgJjcbu29puuYehlYbW2bGlMBBB/d1lJqQJM=
X-Received: by 2002:a05:600c:4e44:b0:3d1:e2e9:573a with SMTP id
 e4-20020a05600c4e4400b003d1e2e9573amr2070525wmq.106.1672699584506; Mon, 02
 Jan 2023 14:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20220111033333.403448-1-peng.fan@oss.nxp.com> <20221221105508.3ukfhevdn2fv6aud@pengutronix.de>
In-Reply-To: <20221221105508.3ukfhevdn2fv6aud@pengutronix.de>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 2 Jan 2023 15:46:13 -0700
Message-ID: <CANLsYky2L6p7uAPzc_X6ka464LSJFzhRzm+oi5XCkR78Rs0D6w@mail.gmail.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 21 Dec 2022 at 03:55, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi,
>
> On 22-01-11, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > If there is a resource table device tree node, use the address as
> > the resource table address, otherwise use the address(where
> > .resource_table section loaded) inside the Cortex-M elf file.
> >
> > And there is an update in NXP SDK that Resource Domain Control(RDC)
> > enabled to protect TCM, linux not able to write the TCM space when
> > updating resource table status and cause kernel dump. So use the address
> > from device tree could avoid kernel dump.
> >
> > Note: NXP M4 SDK not check resource table update, so it does not matter
> > use whether resource table address specified in elf file or in device
> > tree. But to reflect the fact that if people specific resource table
> > address in device tree, it means people are aware and going to use it,
> > not the address specified in elf file.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V2:
> >  Update commit message
>
> What is the status of this patch?
>

That one has obviously slipped through the cracks...  It boggles my
mind that nobody, i.e Peng, has reminded me of it, which raises
obvious doubts about the real necessity of the patch.

Marco - do you need this patch and if so, are you in a position to
provide a Tested-by?

> Regards,
>   Marco
>
> >
> >  drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 7a096f1891e6..0bd24c937a73 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -499,6 +499,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
> >       return (struct resource_table *)priv->rsc_table;
> >  }
> >
> > +static struct resource_table *
> > +imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
> > +{
> > +     struct imx_rproc *priv = rproc->priv;
> > +
> > +     if (priv->rsc_table)
> > +             return (struct resource_table *)priv->rsc_table;
> > +
> > +     return rproc_elf_find_loaded_rsc_table(rproc, fw);
> > +}
> > +
> >  static const struct rproc_ops imx_rproc_ops = {
> >       .prepare        = imx_rproc_prepare,
> >       .attach         = imx_rproc_attach,
> > @@ -508,7 +519,7 @@ static const struct rproc_ops imx_rproc_ops = {
> >       .da_to_va       = imx_rproc_da_to_va,
> >       .load           = rproc_elf_load_segments,
> >       .parse_fw       = imx_rproc_parse_fw,
> > -     .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > +     .find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
> >       .get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
> >       .sanity_check   = rproc_elf_sanity_check,
> >       .get_boot_addr  = rproc_elf_get_boot_addr,
> > --
> > 2.25.1
> >
> >
