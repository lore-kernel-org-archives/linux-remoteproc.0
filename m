Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5927FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 02:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhKWCUH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 21:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45011 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232138AbhKWCUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 21:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637633819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ecCKMHgh1nP5alHe1rExeQVJFcZLj5dbAYvcIuSvMp8=;
        b=VG8Xqdyi/3vrjMtWhIk9rx182nOzySy9PxzY/2qbbn7wODOsrCOcY6SN49JLX66a0NUoqD
        RTVcPP5GI+5V0a0+L8bebxZi824bPpTcnVD6YNMfIaEtVTIjztuAdWk289i97t/lprwf4u
        G3oFEDBfUbtTJK7Vl0yl8km3IktEeBk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-FxmsnzM0P6GONSH9Nr_Xwg-1; Mon, 22 Nov 2021 21:16:58 -0500
X-MC-Unique: FxmsnzM0P6GONSH9Nr_Xwg-1
Received: by mail-lf1-f69.google.com with SMTP id k32-20020a0565123da000b0041643c6a467so2746507lfv.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Nov 2021 18:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ecCKMHgh1nP5alHe1rExeQVJFcZLj5dbAYvcIuSvMp8=;
        b=PoKcBsNRg1ULl5cY3AeGTMtLHE3HyEgZSlzhmS10gDlBVfK0DrG1Vu1THw3mhxZZbT
         WV5A4KnrAWIpgKYGQrTGI8XQmyOxpnpmhPDnmmE5CtekTKnKuktU7NWVUnoYiz7LjJI3
         4Tr5ijj0XOTQIQcA+lRd6s/Lf3gt08tTRoGTRQxtbnJA4lLxCL2UJKhH2F+d8xAkF47N
         TvwHjS3JGuywliEHcarAqTzVVivkt0wKYBx8HhA2wA/ptT1Sb2P0aCJcctUxtG0bnXkA
         tllm6YTUQOPXOinT7CIe7x+9CSSoadNjj0ZTVHCZOlXgVf6AaKE/y1ck3Q009Ot8/Nu2
         joEA==
X-Gm-Message-State: AOAM530BX/kiqQXhtEQDdonf5PKFIp9WnwN/eoyKsx1Yy4kYPh1vK46j
        v06f4wBVVMqC8VQ9DmA3TonvwcanIAefritVEPIEhxid6DvlgyolJZ4qN0yZRT3OEKP8QsVOltE
        YfmTc03qCkRf3wOdT02pyVT3ol/zItGRP7Z/W8Zu/gvS8Dw==
X-Received: by 2002:a05:6512:3d09:: with SMTP id d9mr1123009lfv.481.1637633816979;
        Mon, 22 Nov 2021 18:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZdt/n+KGQPmtzq9KuLUyNSmS94ktfV31AZ4jOSU6mpao1hmU4eoYuLOvVeqk6uzcISZjccIPmcIlCHFZVPA8=
X-Received: by 2002:a05:6512:3d09:: with SMTP id d9mr1122994lfv.481.1637633816808;
 Mon, 22 Nov 2021 18:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com> <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
In-Reply-To: <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 23 Nov 2021 10:16:46 +0800
Message-ID: <CACGkMEvXNbAseqQSyJL-7W5VZvEQGnK0WttVYLvGY2btJ_mTPw@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: don't let virtio core to validate used length
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 23, 2021 at 10:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Nov 23, 2021 at 12:08 AM Arnaud Pouliquen
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > For RX virtqueue, the used length is validated in all the three paths
> > (big, small and mergeable). For control vq, we never tries to use used
> > length. So this patch forbids the core to validate the used length.
>
> If I understand the code correctly, the function that calls
> virtqueue_get_buf() ares:
>
> rpmsg_recv_done()
> get_a_tx_buf()
>
> So it looks to me like the above change log needs some tweak? (It
> looks like a copy from the virtio-net patch).
>
> The codes are fine.
>
> Thanks
>
> >
> > Without patch the rpmsg client sample does not work.


Btw, this probably uncovers a bug of the rpmsg device which needs to be fixed.

Thanks

> >
> > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> >
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 9c112aa65040..5f73f19c2c38 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> >         .feature_table_size = ARRAY_SIZE(features),
> >         .driver.name    = KBUILD_MODNAME,
> >         .driver.owner   = THIS_MODULE,
> > +       .suppress_used_validation = true,
> >         .id_table       = id_table,
> >         .probe          = rpmsg_probe,
> >         .remove         = rpmsg_remove,
> > --
> > 2.17.1
> >

