Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66F6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jun 2022 16:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241721AbiFFQU4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Jun 2022 12:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241714AbiFFQUz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Jun 2022 12:20:55 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832DD2B2BB0
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jun 2022 09:20:54 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id h23so18866057ejj.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jun 2022 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12UkLhNWmn2NlSuxlr6S4i7rRJBFRzlnkvu5nBhtCdk=;
        b=DFflpyIFsZnXHHqmPDg2ed5oqgbXienQBXEPLAaCN/Rw/SD9GDpUQKli40bGJQrMvW
         d+mCUp9VxvOfdf5J0RrlUNq7WdkjaSStwDF4au+pvldwh621urWTtklhLgROAMxL6Zb0
         /12gojX0eluv6wl7sIV3Cb+6xpuA68WDLF4eopEzoDyz1FilA1N40+ZRysXVjgyBZ3my
         ydGPh5FvCWvFpOCLtzcbqk1eabc01zfqE3A8+cy9O7r2XTkvpDje1arAnkuTEpgT1OSO
         yFNMJa5+XiBnHZB/lCCWXGKcmG1hqtTH6eIHfuRHNkrVZDoQFvKPEhqaMSY6JBMtn0pc
         3Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12UkLhNWmn2NlSuxlr6S4i7rRJBFRzlnkvu5nBhtCdk=;
        b=VsztBUnn9L8rWbGLYsLeTPSwwfoLOjq8Au1arnN7tYkOok4+kXuA5KvuqXWU9BAvNK
         TALemmnS3BJ6jJwJlwXHwPo5B3jQfbJ3V5NlJeGNQjzdhAqgdB5RCTQ6nfrH7zEhD2zs
         sAxKaltvhDe/w8Ebc4OK46MmJ5jO2nGT4DX1BtiCOczBlz1wCXKtRPXzZfMPzngWAF54
         6eLgPz3exHa2gUfw98hSqXdjKr41zvVkK5FUxyqqHsLrMTaBxw9PiD2AmHrIXignV9fY
         qERYPpNO2UnI95c1DDO0ALKeBU65y3mz4Ls11hNX1fOVdu/dgQJCuRi6vCFAhHysubJZ
         mZXw==
X-Gm-Message-State: AOAM533qzsBNt7jD3IwqoU+bHO8W7nx5YWXNEHy4ZbQlB/TueppSGxD8
        UkSR1mxj/OVtLBXTONw8l2faUqFri70ew9RJ4QG/LQ==
X-Google-Smtp-Source: ABdhPJySZx0kslKEfNGrGcdenQ/vGoHfPvIpIIerAHQ96ovYKU6gs5Xm9U68o1ARI3U9vVrPknGE2fegJ/Nwqo5tf6g=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr396834ejc.62.1654532453015; Mon, 06
 Jun 2022 09:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com> <20220601174159.GD531268@p14s>
 <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
In-Reply-To: <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 6 Jun 2022 10:20:41 -0600
Message-ID: <CANLsYkwsqoKVoYSj7bWxT+t=rMp3dhsrpMYaWm6DhFKHvMSEKw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/4] remoteproc: core: Introduce
 rproc_register_rvdev function
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 3 Jun 2022 at 05:54, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 6/1/22 19:41, Mathieu Poirier wrote:
> > On Wed, Apr 06, 2022 at 11:54:44AM +0200, Arnaud Pouliquen wrote:
> >> The rproc structure contains a list of registered rproc_vdev structure.
> >
> > This should be rproc_rvdev.
>
> Thanks for your review!
>
> I will send a new version according to your comments except
> this one.
> The structure name rproc_vdev is the good one, or
> or maybe I'm missing something?
>

You are correct - I had the name of the variable, i.e rvdev, found in
rproc_handle_vdev() in my head.  You can forget this comment.

> Thanks,
> Arnaud
>
> >
> >> To be able to move the management of the rproc_vdev structure in
> >> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> >> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> >> and rproc_unregister_rvdev functions.
> >
> > The name of those functions doesn't match the content of the patch.
> >
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
> >>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 3a469220ac73..081bea39daf4 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
> >>      return 0;
> >>  }
> >>
> >> +static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> >> +{
> >> +    if (rvdev && rproc)
> >> +            list_add_tail(&rvdev->node, &rproc->rvdevs);
> >> +}
> >> +
> >> +static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >> +{
> >> +    if (rvdev)
> >> +            list_del(&rvdev->node);
> >> +}
> >> +
> >>  static struct rproc_vdev *
> >>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> >>  {
> >> @@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> >>                      goto unwind_vring_allocations;
> >>      }
> >>
> >> -    list_add_tail(&rvdev->node, &rproc->rvdevs);
> >> +    rproc_add_rvdev(rproc, rvdev);
> >>
> >>      rvdev->subdev.start = rproc_vdev_do_start;
> >>      rvdev->subdev.stop = rproc_vdev_do_stop;
> >> @@ -576,7 +588,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> >>      }
> >>
> >>      rproc_remove_subdev(rproc, &rvdev->subdev);
> >> -    list_del(&rvdev->node);
> >> +    rproc_remove_rvdev(rvdev);
> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> >>      device_unregister(&rvdev->dev);
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
