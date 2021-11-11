Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 10:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBBD661268
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 10:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhKKKcG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Nov 2021 05:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhKKKcG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Nov 2021 05:32:06 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D16FC061766;
        Thu, 11 Nov 2021 02:29:17 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j21so22054625edt.11;
        Thu, 11 Nov 2021 02:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cSSM2j7SejswRGsX3hwVtwe1H75qRZbtJPmBHlBpvfk=;
        b=JwjvF55wBHahJPzmJrcie24kBPiuCLzEytSWLiiAeCa9QhTXB3C/dB74BQ53eA5KhB
         QTnvyAi7Nc9HTFDHmZ0ZOc3Tj2S+pX3k+z0sge2QcDUehdlkDsS8uj02Bml4v/ovhY/e
         YpeMD1C6EShpVbbCWSG5SEoRoxOrrFloHOCoYDa6YnjLpUGpqOGiVQPFZBAeCcGWC33B
         M9xtrE9FFrrdF0nNKYNFGmwH1yuoqBMZonN5BPi33x4QhEAVD/EQkwnT+5/0j9bEeOr9
         m7hJLVBWw/7nfwo8OTSiaNil27cHeO3Kz/VIJOgnl/boItmeF3je8ZhWoTXgG7f12ppV
         /7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cSSM2j7SejswRGsX3hwVtwe1H75qRZbtJPmBHlBpvfk=;
        b=bm0pffMAxCE2KxEya6GEoX5SzBqKLfYVD1mUVBM1Uu+hRB26qVe2jGcm48AzwlQ44I
         aWpVAVLLiBYiOqClXvehXIkHTDsDByXqY4Wuvwg9td+rHa/nbZPl49Ap/4kFaUIPb7uG
         /VHJs50Kx51AddEwTP3mL3I/trTiZN5cgFFNbRPy6F4XVesQxLRF3OKSqKXaU3aBCjxM
         Hs6QhvMRwRJiSKWSs8lJfbmkHs23EM3FMIvYwdAvxm92Od3LFbpPgtHqnDbTLjf9kve7
         IkNszoNYbZ6v0T7n5J16foKhkpVk5kM+yA7AA5jrbAgMxIPCueTO1G7hNTpPA+cxjwlz
         zVKw==
X-Gm-Message-State: AOAM531eivdRdNSAQNp6G99dOZHtnj5nr/kZ9EZXYcy6CG4RJL7CIWHr
        CBKFBdPxy++1sg6JO3swcU8izwRB2c1h/33vkTc=
X-Google-Smtp-Source: ABdhPJxsXcQ6+SsTxDpq+4K6x2ySv0Hd6ZabWSws/AOSgPuFY/HY/wdPmNXt8RS6NuL96ehVuUquhqb9PR6Rea0U9iQ=
X-Received: by 2002:a17:907:9156:: with SMTP id l22mr8052110ejs.220.1636626555652;
 Thu, 11 Nov 2021 02:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20211109083926.32052-1-christian.gmeiner@gmail.com>
 <20211109083926.32052-2-christian.gmeiner@gmail.com> <YYq4tjyv0qh+Zpqe@ripper>
 <30de037d-3acd-8e9d-979c-b3d0c1c84002@foss.st.com>
In-Reply-To: <30de037d-3acd-8e9d-979c-b3d0c1c84002@foss.st.com>
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Thu, 11 Nov 2021 11:29:04 +0100
Message-ID: <CAH9NwWdy9WsaXW+XE06=yA9pGXGs_Ye6kRiNPMfM5D=Jd1rSGg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] rpmsg: add syslog driver
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud

>
> On 11/9/21 7:06 PM, Bjorn Andersson wrote:
> > On Tue 09 Nov 00:39 PST 2021, Christian Gmeiner wrote:
> >
> >> Allows the remote firmware to log into syslog.
> >>
>
> For you information a similar patch has been sent few years ago:
> https://www.spinics.net/lists/kernel/msg3045824.html
>

Interesting - do you know why the patch was not taken?

> The suspend /resume mechanism seems interesting to manage the low power use case.
>

Yeah .. nothing I thought about.

> >
> > This allows the remote firmware to print log messages in the kernel log,
> > not the syslog (although your system might inject the kernel log into
> > the syslog as well)
> >
> >> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> >> ---
> >>  drivers/rpmsg/Kconfig        |  8 +++++
> >>  drivers/rpmsg/Makefile       |  1 +
> >>  drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
> >
> > drivers/rpmsg is for rpmsg bus and transport drivers. Client drivers
> > should live elsewhere.
> >
> > But perhaps, rather than having a driver for this, you could simply use
> > rpmsg_char and a userspace tool; if you want to get the remote processor
> > logs into syslog, instead of the kernel log?
>
> This is also a question that comes to me while looking at the patch.
> rpmsg_tty service (if available in 5.16) could be another alternative.
>

I thought about it too but I do not see how the syslog/journald can read the log
messages from this tty device without an extra user space component.

With a syslog redirection rpmsg service this happens automatically without any
extra user space daemon that reads from tty and writes to syslog.

Maybe I am missing something.

> Regards,
> Arnaud
>
> >
> >>  3 files changed, 74 insertions(+)
> >>  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
> >>
> >> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> >> index 0b4407abdf13..801f9956ec21 100644
> >> --- a/drivers/rpmsg/Kconfig
> >> +++ b/drivers/rpmsg/Kconfig
> >> @@ -73,4 +73,12 @@ config RPMSG_VIRTIO
> >>      select RPMSG_NS
> >>      select VIRTIO
> >>
> >> +config RPMSG_SYSLOG
> >> +    tristate "SYSLOG device interface"
> >> +    depends on RPMSG
> >> +    help
> >> +      Say Y here to export rpmsg endpoints as device files, usually found
> >> +      in /dev. They make it possible for user-space programs to send and
> >> +      receive rpmsg packets.
> >> +
> >>  endmenu
> >> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> >> index 8d452656f0ee..75b2ec7133a5 100644
> >> --- a/drivers/rpmsg/Makefile
> >> +++ b/drivers/rpmsg/Makefile
> >> @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
> >>  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
> >>  obj-$(CONFIG_RPMSG_QCOM_SMD)        += qcom_smd.o
> >>  obj-$(CONFIG_RPMSG_VIRTIO)  += virtio_rpmsg_bus.o
> >> +obj-$(CONFIG_RPMSG_SYSLOG)  += rpmsg_syslog.o
> >> diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
> >> new file mode 100644
> >> index 000000000000..b3fdae495fd9
> >> --- /dev/null
> >> +++ b/drivers/rpmsg/rpmsg_syslog.c
> >> @@ -0,0 +1,65 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/rpmsg.h>
> >> +
> >> +static int rpmsg_syslog_cb(struct rpmsg_device *rpdev, void *data, int len,
> >> +                       void *priv, u32 src)
> >> +{
> >> +    const char *buffer = data;
> >> +
> >> +    switch (buffer[0]) {
> >> +    case 'e':
> >> +            dev_err(&rpdev->dev, "%s", buffer + 1);
> >> +            break;
> >> +    case 'w':
> >> +            dev_warn(&rpdev->dev, "%s", buffer + 1);
> >> +            break;
> >> +    case 'i':
> >> +            dev_info(&rpdev->dev, "%s", buffer + 1);
> >> +            break;
> >> +    default:
> >> +            dev_info(&rpdev->dev, "%s", buffer);
> >> +            break;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
> >> +{
> >> +    struct rpmsg_endpoint *syslog_ept;
> >> +    struct rpmsg_channel_info syslog_chinfo = {
> >> +            .src = 42,
> >> +            .dst = 42,
> >> +            .name = "syslog",
> >> +    };
> >> +
> >> +    /*
> >> +     * Create the syslog service endpoint associated to the RPMsg
> >> +     * device. The endpoint will be automatically destroyed when the RPMsg
> >> +     * device will be deleted.
> >> +     */
> >> +    syslog_ept = rpmsg_create_ept(rpdev, rpmsg_syslog_cb, NULL, syslog_chinfo);
> >
> > The rpmsg_device_id below should cause the device to probe on the
> > presence of a "syslog" channel announcement, so why are you creating a
> > new endpoint with the same here?
> >
> > Why aren't you just specifying the callback of the driver?
> >
> >> +    if (!syslog_ept) {
> >> +            dev_err(&rpdev->dev, "failed to create the syslog ept\n");
> >> +            return -ENOMEM;
> >> +    }
> >> +    rpdev->ept = syslog_ept;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static struct rpmsg_device_id rpmsg_driver_syslog_id_table[] = {
> >> +    { .name = "syslog" },
> >> +    { },
> >> +};
> >> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_syslog_id_table);
> >> +
> >> +static struct rpmsg_driver rpmsg_syslog_client = {
> >> +    .drv.name       = KBUILD_MODNAME,
> >> +    .id_table       = rpmsg_driver_syslog_id_table,
> >> +    .probe          = rpmsg_syslog_probe,
> >> +};
> >> +module_rpmsg_driver(rpmsg_syslog_client);
> >
> > I would expect that building this as a module gives you complaints about
> > lacking MODULE_LICENSE().
> >
> > Regards,
> > Bjorn
> >
> >> --
> >> 2.33.1
> >>



-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
