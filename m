Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDB3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 10:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBED261284
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 10:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhKKKjq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Nov 2021 05:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhKKKjq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Nov 2021 05:39:46 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30834C061766;
        Thu, 11 Nov 2021 02:36:57 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z21so22326890edb.5;
        Thu, 11 Nov 2021 02:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5pVKe47yKtjW0MKmtZXDquLokYlNX8+sMw+tEQRB2c=;
        b=bMoxvFeh4C/OUX+ZD+sGBxBE9zEBZs2apIIJXb9f/PuJd4S8IZhcctjsNAcvDDuc+8
         8MsO+YrrpLpX2diBL/ku5D8COPf5LpZR//zhvqkf8bvDR79WY7zghu09VnapvY7tNGfd
         uSSCjtpfT4DmGp1BlJWxi1zR4JcT6sUp8PYw6Hz9mCSQHujiBp/1NQDSG3cGgDSxj9eu
         nERh6lbvgQlvfa4RrO8DNeNyZ/caQMcIkG3PWAhtm6FJnf3tx/YhPRrWydjJW5R31l3Y
         Yr9rO6NMiczfCWqkqB7KgAX+AiScXWZgB6TSTOuIMY4qvbvCxo9OWrCI0F5XwT7p9ee4
         1BmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5pVKe47yKtjW0MKmtZXDquLokYlNX8+sMw+tEQRB2c=;
        b=632YO2GpCuU1K8QDdCDM5M/1U847xFLL5ZYVVyo23rshn98g3c976WQbZe76TJrrVy
         ZHZ2waVjFRi3TrfWJ5292ko7L4xHo2cGjyt2iBHDejW99MukZ0o2W+VS4zVhTXDkT4Lx
         prIufj+6ccCfwi5APW8Yp0r1DcuwTIypM5aYS0oH3v/OkmkX12SrrZsznXcbuayu1gze
         ztPpupj/4Ow4aAXSqd2UECK63E+On/CEQOfPPQuawIWjEM3dlISuRfJiyeUBdpyUuiIG
         nam3tRROfK8ws5/mdRkcPyA82zKWTK1GAIWUfbHsFaAf3Yf857PtZX4Dv7h4Q85VYgtZ
         Azeg==
X-Gm-Message-State: AOAM532FuuDfLbVRx5I0FMzArb339OjL7zPRoBSUvVe4xCRzU4pN1Tmf
        opYMWkJohXpGXZ8dPPJ5eOIiP9NO0wdLRBQq/48=
X-Google-Smtp-Source: ABdhPJzkWJzxENQ+uwppyRAue2SX6spIb5vmW0aJu04zaZbg/JLAstkKlVpptxxEn3SNkLosmat/lx4fa6jFFpHs1Mc=
X-Received: by 2002:a17:906:c152:: with SMTP id dp18mr7835459ejc.241.1636627015702;
 Thu, 11 Nov 2021 02:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20211109083926.32052-1-christian.gmeiner@gmail.com>
 <20211109083926.32052-2-christian.gmeiner@gmail.com> <YYq4tjyv0qh+Zpqe@ripper>
In-Reply-To: <YYq4tjyv0qh+Zpqe@ripper>
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Thu, 11 Nov 2021 11:36:44 +0100
Message-ID: <CAH9NwWcyKyaGrTZ1=N73gA+zjO0wH_oMzLG_zi2TUc3dN69SNg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] rpmsg: add syslog driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn


> > Allows the remote firmware to log into syslog.
> >
>
> This allows the remote firmware to print log messages in the kernel log,
> not the syslog (although your system might inject the kernel log into
> the syslog as well)
>

Correct.

> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/rpmsg/Kconfig        |  8 +++++
> >  drivers/rpmsg/Makefile       |  1 +
> >  drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
>
> drivers/rpmsg is for rpmsg bus and transport drivers. Client drivers
> should live elsewhere.
>

Ahh .. yes.

> But perhaps, rather than having a driver for this, you could simply use
> rpmsg_char and a userspace tool; if you want to get the remote processor
> logs into syslog, instead of the kernel log?
>

I thought about that too (also regarding the rpmsg tty driver) but that means I
need to start/supervise a user space tool.

> >  3 files changed, 74 insertions(+)
> >  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
> >
> > diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> > index 0b4407abdf13..801f9956ec21 100644
> > --- a/drivers/rpmsg/Kconfig
> > +++ b/drivers/rpmsg/Kconfig
> > @@ -73,4 +73,12 @@ config RPMSG_VIRTIO
> >       select RPMSG_NS
> >       select VIRTIO
> >
> > +config RPMSG_SYSLOG
> > +     tristate "SYSLOG device interface"
> > +     depends on RPMSG
> > +     help
> > +       Say Y here to export rpmsg endpoints as device files, usually found
> > +       in /dev. They make it possible for user-space programs to send and
> > +       receive rpmsg packets.
> > +
> >  endmenu
> > diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> > index 8d452656f0ee..75b2ec7133a5 100644
> > --- a/drivers/rpmsg/Makefile
> > +++ b/drivers/rpmsg/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
> >  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
> >  obj-$(CONFIG_RPMSG_QCOM_SMD) += qcom_smd.o
> >  obj-$(CONFIG_RPMSG_VIRTIO)   += virtio_rpmsg_bus.o
> > +obj-$(CONFIG_RPMSG_SYSLOG)   += rpmsg_syslog.o
> > diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
> > new file mode 100644
> > index 000000000000..b3fdae495fd9
> > --- /dev/null
> > +++ b/drivers/rpmsg/rpmsg_syslog.c
> > @@ -0,0 +1,65 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/rpmsg.h>
> > +
> > +static int rpmsg_syslog_cb(struct rpmsg_device *rpdev, void *data, int len,
> > +                        void *priv, u32 src)
> > +{
> > +     const char *buffer = data;
> > +
> > +     switch (buffer[0]) {
> > +     case 'e':
> > +             dev_err(&rpdev->dev, "%s", buffer + 1);
> > +             break;
> > +     case 'w':
> > +             dev_warn(&rpdev->dev, "%s", buffer + 1);
> > +             break;
> > +     case 'i':
> > +             dev_info(&rpdev->dev, "%s", buffer + 1);
> > +             break;
> > +     default:
> > +             dev_info(&rpdev->dev, "%s", buffer);
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
> > +{
> > +     struct rpmsg_endpoint *syslog_ept;
> > +     struct rpmsg_channel_info syslog_chinfo = {
> > +             .src = 42,
> > +             .dst = 42,
> > +             .name = "syslog",
> > +     };
> > +
> > +     /*
> > +      * Create the syslog service endpoint associated to the RPMsg
> > +      * device. The endpoint will be automatically destroyed when the RPMsg
> > +      * device will be deleted.
> > +      */
> > +     syslog_ept = rpmsg_create_ept(rpdev, rpmsg_syslog_cb, NULL, syslog_chinfo);
>
> The rpmsg_device_id below should cause the device to probe on the
> presence of a "syslog" channel announcement, so why are you creating a
> new endpoint with the same here?
>
> Why aren't you just specifying the callback of the driver?
>

Good question. I think I was happy that I got work working somehow. I
also want to send out
a documentation update as it is not up to date with the current API.

> > +     if (!syslog_ept) {
> > +             dev_err(&rpdev->dev, "failed to create the syslog ept\n");
> > +             return -ENOMEM;
> > +     }
> > +     rpdev->ept = syslog_ept;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct rpmsg_device_id rpmsg_driver_syslog_id_table[] = {
> > +     { .name = "syslog" },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_syslog_id_table);
> > +
> > +static struct rpmsg_driver rpmsg_syslog_client = {
> > +     .drv.name       = KBUILD_MODNAME,
> > +     .id_table       = rpmsg_driver_syslog_id_table,
> > +     .probe          = rpmsg_syslog_probe,
> > +};
> > +module_rpmsg_driver(rpmsg_syslog_client);
>
> I would expect that building this as a module gives you complaints about
> lacking MODULE_LICENSE().
>

Yeah .. I never built it as a module.

The biggest question I have: do you see any possibility to get such a
redirection
driver into mainline? At the moment I have not heard a big no.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
