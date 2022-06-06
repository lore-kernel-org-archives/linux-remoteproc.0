Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E62C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jun 2022 15:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbiFFPrv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Jun 2022 11:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241175AbiFFPru (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Jun 2022 11:47:50 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB308FD5B
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jun 2022 08:47:48 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h19so19433211edj.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jun 2022 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jLpWvMlf+YUwu7qBpzspLbufy8yyDTs9EuJTxwHjhIs=;
        b=sAgL1HX3YrPvng7nckLZkM6PqZZq8RKPIRXtt7wwM4al/LJSnm1WAVNBbbzeQh4R2H
         Jq7/nQtKQuCFpgc0sv062DxA8dvn2F/t4f5EYYVz81sdhSFtwHdehGNkLnvoab3T1fwP
         YZSY2QPUMi83ez2/lssfP34+EvEtX5nx65of/XBbu3YJIBp4+O35V5RUeroJr0wl7/bS
         BTqZbvIrwzkeuYlBV0ekUNJg7WpdLF55ymyo794mVag6VrVpqKYFhUklQ17gZT+mipiB
         Z6xXhQoEDesesVKLQbxfUsgj0TSrARi9FwRMZDSczxSXkNoyBcUGA27qutTVyGgvlpyH
         riCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLpWvMlf+YUwu7qBpzspLbufy8yyDTs9EuJTxwHjhIs=;
        b=0TSr0pE4GKakBMHALlLdvOlyYA/ncQ6+qqDuE+JPHzy7sTpYlF+pC3szOIhuIm2Pgz
         ZjzNCRYUshJ84YYj2oihQCbLqcakeq2dW0IUorJhr23EgsyuuzKhFLKH9t3rqww1dQvQ
         GwGQ5YcdcutYR7rFbOBFLklJHC3rpF3axCEWnJvY6MNkvMjTxB/v1/5MiO8yHIFQVz1A
         HyazlZcPQkOrDvB0h0wDXMFUI3YtSqdOeSXnwLKpkEBjxaUErgB+I9QDAxnkf/lppwdL
         bVXb9+rIaoqzAJLopJLbAJEug/cd5mQ9NFHDzF7uy82KtVh/5pNV5MdyyJHJqVp7UFUg
         Uueg==
X-Gm-Message-State: AOAM532QdyGmSRqVjcV4HLtI1lxLix/WnwZEIcjJq70OaCmxqGIRPi+m
        4FqV5MTSwHHh9XVzb7qDQSAKMNr3Tv6WunwvZMmqzMnamIc=
X-Google-Smtp-Source: ABdhPJziEwq+2TK54NAomosbKFoIgCbxKZ0vpPY7wD/35TTSTUyrCW2Y4sC6CD4fFotGJU9nupk9KF/eT9WvZshZfmE=
X-Received: by 2002:a05:6402:274a:b0:42d:dcd1:c847 with SMTP id
 z10-20020a056402274a00b0042ddcd1c847mr27773129edd.169.1654530466868; Mon, 06
 Jun 2022 08:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com> <20220601174159.GD531268@p14s>
 <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
In-Reply-To: <b85c7526-80a4-35f2-7629-319d172bc734@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 6 Jun 2022 09:47:35 -0600
Message-ID: <CANLsYkzcgC3+pWSzyRKaRQuWEp=m_tML5W9hc1+fR9CLgMYHSQ@mail.gmail.com>
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

Structure rproc does not contain a list of rproc_vdev, it contains a
list of rproc_rvdev in rproc::rvdevs.

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
