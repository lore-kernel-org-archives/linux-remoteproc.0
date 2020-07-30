Return-Path: <SRS0=xwos=BJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B2CC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 21:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 978262083B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jul 2020 21:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXq4WTCP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730602AbgG3Vyy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jul 2020 17:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730552AbgG3Vyx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jul 2020 17:54:53 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3A7C061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2020 14:54:53 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id e64so29790439iof.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2020 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hz6qbfDEuhZyd0+x8odAvWpkuP8UaNczToSkFGvnkFk=;
        b=XXq4WTCPC7+tz1SDKdUi3QhlL2AziVHW6ufg5IaUDVj/PPY8yId2LXr49FGP9QMHgA
         +6PIbDXgPxiMnANJkkJWoHlf7V/xrVIHmtT7st/kjFLsxqbTDE12SlFu8/mv45+/i2uh
         zjAYCIWQ/crNEhaXO8S3F11ceJLYqrX0aIiv9yOv9peKJS41mDA8lLL4SJyQ4tDydVC/
         cTXNC8j6pyW9NPjfyA5TLM0yeCg0DOLPFWelNgtTbOrV2CoZ6XZd1miuCO/p9fIYoytu
         x4o/sCU/1POFbzkWTvhcf2t00xeJ9dx3hYZofEnFBj4ijp68az1QMTdXuEp2KA0tFxCO
         o6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hz6qbfDEuhZyd0+x8odAvWpkuP8UaNczToSkFGvnkFk=;
        b=M4qEVrGq+REEjjsA/jx583tJGW5OKeuYQbKb6730W5iFh3VVvIExuRFN6thtc7D3tv
         hGtYxX4EeJhCgYRnzrs7zb2L0AixRThyTOTwR7XL/KfHVqX+r6txqmMFXguhFEsv6r7B
         ld+el9IbJdxWxR1b7emrj/UKzEyu3z44913FXlA3ZAECfvaBTKlSM9j93GwZzlXzQO4t
         /lcgW3LJbYfkaZYt/A6X4iwnYsB1sqwcwiOW1LHJoBQ5qTYWJL4CeUSCFzNXrT0hFDGr
         hahoG36uQ18jMr7b9oeRTYNeiXlV5xQtngfr8xvURdjk3yEBCwY//VY2EO2bAHqTx5wn
         RalQ==
X-Gm-Message-State: AOAM530bgNI9d25IwDlMqUjc3ktgp0klK2eZnf3b5Pq9BdVhw9pdNsP2
        Y24Aknm35QkR2/UsZ7a016fxuoN6y4Cto8OwqM1HjzAn
X-Google-Smtp-Source: ABdhPJxfaQq5HeiMdevqGMWqFwqGsny4Dy1qiomWJuQvLs0WDvh1gLD/SMeUG/RmSS335Pisek5x4JO4bpQQI0HhYSw=
X-Received: by 2002:a05:6638:138a:: with SMTP id w10mr1466182jad.36.1596146093086;
 Thu, 30 Jul 2020 14:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200722131543.7024-1-peng.fan@nxp.com> <20200729170516.GA3059951@xps15>
 <DB6PR0402MB2760BF33BCBFF1CD1F1C4EED88710@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760BF33BCBFF1CD1F1C4EED88710@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 30 Jul 2020 15:54:42 -0600
Message-ID: <CANLsYkzOOs5999zD-1EPujpk9ZbfZwCHmNRvxE_cO+-zkZdzbA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: virtio: support sharing vdev buffer
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 30 Jul 2020 at 00:22, Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Mathieu,
>
> > Subject: Re: [PATCH] remoteproc: virtio: support sharing vdev buffer
> >
> > Hi Peng,
> >
> > On Wed, Jul 22, 2020 at 09:15:43PM +0800, Peng Fan wrote:
> > > Support sharing vdev buffer between multiple vdevs by using name
> > > "vdevbuffer".
> > >
> > > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> > > b/drivers/remoteproc/remoteproc_virtio.c
> > > index dfd3808c34fd..5d78ebea111e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -343,6 +343,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev,
> > > int id)
> > >
> > >     /* Try to find dedicated vdev buffer carveout */
> > >     mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer",
> > > rvdev->index);
> > > +   if (!mem)
> > > +           mem = rproc_find_carveout_by_name(rproc, "vdevbuffer");
> >
> > We already have a way to share buffers [1], do you think it would work for you?
> > I would rather proceed that way to avoid introducing a 3rd way to deal with
> > vdev buffers.
>
> That should work for me. I just need to move the vdevbuffer to the 1st one
> inside the memory-region.

Perfect

>
> BTW: Do you have time to give a review for
> https://patchwork.kernel.org/patch/11688751/
>

Unfortunately not in a little while.  There are a couple of beefy
patchset in the queue ahead of yours and to make matters worse I am
away next week.

> Thanks,
> Peng.
>
> >
> > Thanks,
> > Mathieu
> >
> > [1].
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.b
> > ootlin.com%2Flinux%2Fv5.8-rc4%2Fsource%2Fdrivers%2Fremoteproc%2Frem
> > oteproc_virtio.c%23L389&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7C
> > 760ae238005c49fe20db08d833e193ca%7C686ea1d3bc2b4c6fa92cd99c5c30
> > 1635%7C0%7C0%7C637316391223184319&amp;sdata=UTN8YVaEynomrwFx
> > 7aTCJ7fp0fjfIS8fscfGG67naKk%3D&amp;reserved=0
> >
> > >     if (mem) {
> > >             phys_addr_t pa;
> > >
> > > --
> > > 2.16.4
> > >
