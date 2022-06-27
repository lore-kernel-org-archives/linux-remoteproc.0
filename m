Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30909C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Jun 2022 07:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiF0H6S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233183AbiF0H6P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Jun 2022 03:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B90DC108
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jun 2022 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656316690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gR36iGOYPRI7XA3wSmeHv9qI5C/E+Rq80TLdrN+txO0=;
        b=AobZvjq7OfvNi0ebg7J5cjjrKuYPAqWvOcmKhmRW5g9S+h7Pt7Dr6YYQr0DRlU8FgSLRBe
        wtIGtaIjl1nHNrn1SdE4+PyH2C7bWH9OMTvSyxi4XOuEEPuiXH/yXnFAmlx45JNUUgT7UM
        Q19mwvg/HM9faZR4YN7YUGkqnv5d3R4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Zoqgfb8jNdWFIkbkTNumjg-1; Mon, 27 Jun 2022 03:58:09 -0400
X-MC-Unique: Zoqgfb8jNdWFIkbkTNumjg-1
Received: by mail-wr1-f72.google.com with SMTP id s14-20020adfa28e000000b0020ac7532f08so955600wra.15
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jun 2022 00:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gR36iGOYPRI7XA3wSmeHv9qI5C/E+Rq80TLdrN+txO0=;
        b=1tEKttQslWN/yuHGNGA6HW6yRAykHt7hfpz4iliaJH6AkPzyS0JT6C5xWWLSM/xdYp
         UliXA+6p75aCpigyV8he3RRfBxS1YyPypAAVhK04nm2axBmXSnPdubiLIZUleE5HJ5Ln
         oq9nISh1bdo901p9ncuE0fjBZnR8hNoGdEypU0aBc0giKGsX2DvMbB5yf5zHNb+y5U6i
         gUINiRNgzY/zYWrfAYZ3qeIo7P04IJZuTrb4RxPlQb7oFs6CsPcQUvu6xrzxrnTAX4Yd
         S9HtPTK+uOBs3gKJpLdZBNUg5b7FHfFHfhoixAAfoyaIb/V3bAJWqeSr59iN9UGR0rlO
         BVeA==
X-Gm-Message-State: AJIora8hf3ONsDC5pOf+Qx3ofvYR1GyAE6lhgFW0X9Gcbpcc9lIqaZxu
        rY7wpTNyxgWkyYnt3vbvdKNbUeIftVYfPqRSbYAp7TIlU01swjr08aJt8hqLxnwvfaeGQ7yYR3c
        2PgAtpPTMsukJW8EWk/G7qUUMo+kjWw==
X-Received: by 2002:a5d:6d8b:0:b0:21b:9804:1959 with SMTP id l11-20020a5d6d8b000000b0021b98041959mr10779902wrs.605.1656316688446;
        Mon, 27 Jun 2022 00:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u006yfHOEqWpSmwDiypaX+nb3Ki7jpntJhsVXGDo34rsHtagr1loLXbMMVyBM9VityuTjV+A==
X-Received: by 2002:a5d:6d8b:0:b0:21b:9804:1959 with SMTP id l11-20020a5d6d8b000000b0021b98041959mr10779871wrs.605.1656316688168;
        Mon, 27 Jun 2022 00:58:08 -0700 (PDT)
Received: from redhat.com ([2.54.45.90])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d674d000000b0021bbdc3375fsm6171009wrw.68.2022.06.27.00.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 00:58:07 -0700 (PDT)
Date:   Mon, 27 Jun 2022 03:57:59 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        kangjie.xu@linux.alibaba.com
Subject: Re: [PATCH v10 25/41] virtio_pci: struct virtio_pci_common_cfg add
 queue_notify_data
Message-ID: <20220627034733-mutt-send-email-mst@kernel.org>
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
 <20220624025621.128843-26-xuanzhuo@linux.alibaba.com>
 <20220624025817-mutt-send-email-mst@kernel.org>
 <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
 <20220627023841-mutt-send-email-mst@kernel.org>
 <CACGkMEvy8xF2T_vubKeUEPC2aroO_fbB0Xe8nnxK4OBUgAS+Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEvy8xF2T_vubKeUEPC2aroO_fbB0Xe8nnxK4OBUgAS+Gw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 27, 2022 at 03:45:30PM +0800, Jason Wang wrote:
> On Mon, Jun 27, 2022 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 10:30:42AM +0800, Jason Wang wrote:
> > > On Fri, Jun 24, 2022 at 2:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 24, 2022 at 10:56:05AM +0800, Xuan Zhuo wrote:
> > > > > Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> > > > > here https://github.com/oasis-tcs/virtio-spec/issues/89
> > > > >
> > > > > For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
> > > >
> > > > What exactly is meant by not breaking uABI?
> > > > Users are supposed to be prepared for struct size to change ... no?
> > >
> > > Not sure, any doc for this?
> > >
> > > Thanks
> >
> >
> > Well we have this:
> >
> >         The drivers SHOULD only map part of configuration structure
> >         large enough for device operation.  The drivers MUST handle
> >         an unexpectedly large \field{length}, but MAY check that \field{length}
> >         is large enough for device operation.
> 
> Yes, but that's the device/driver interface. What's done here is the
> userspace/kernel.
> 
> Userspace may break if it uses e.g sizeof(struct virtio_pci_common_cfg)?
> 
> Thanks

Hmm I guess there's risk... but then how are we going to maintain this
going forward?  Add a new struct on any change? Can we at least
prevent this going forward somehow?


> >
> >
> >
> > >
> > > >
> > > >
> > > > > Since I want to add queue_reset after queue_notify_data, I submitted
> > > > > this patch first.
> > > > >
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > ---
> > > > >  include/uapi/linux/virtio_pci.h | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> > > > > index 3a86f36d7e3d..22bec9bd0dfc 100644
> > > > > --- a/include/uapi/linux/virtio_pci.h
> > > > > +++ b/include/uapi/linux/virtio_pci.h
> > > > > @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
> > > > >       __le32 queue_used_hi;           /* read-write */
> > > > >  };
> > > > >
> > > > > +struct virtio_pci_common_cfg_notify {
> > > > > +     struct virtio_pci_common_cfg cfg;
> > > > > +
> > > > > +     __le16 queue_notify_data;       /* read-write */
> > > > > +     __le16 padding;
> > > > > +};
> > > > > +
> > > > >  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> > > > >  struct virtio_pci_cfg_cap {
> > > > >       struct virtio_pci_cap cap;
> > > > > --
> > > > > 2.31.0
> > > >
> >

