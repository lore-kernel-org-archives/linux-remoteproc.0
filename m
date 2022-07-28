Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA70C04A68
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Jul 2022 07:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbiG1HnM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Jul 2022 03:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbiG1HnI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Jul 2022 03:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E087606B1
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Jul 2022 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658994186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MiRkDMIa3SaNcNAA4LhevtztHl/rFve9e8RNCF7+zFQ=;
        b=POYs+tR1CbaHEBBdnwWt5I8sawi+BPhuWQWS/87Mxv92GZPUnDVieKuQuUoKdj6G3276+7
        AzSMfs+aHFqS1+tlxZldctU35dOIh0myBDTtfGw19JdbGJ1SXZaCtgjdbs1gHxwxLoydJS
        QyvjCSXe+NVQ0crLD5AUSfUXwf6cFWA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-5mzoiJiGNbCqJMwUdAqRwg-1; Thu, 28 Jul 2022 03:43:03 -0400
X-MC-Unique: 5mzoiJiGNbCqJMwUdAqRwg-1
Received: by mail-lf1-f71.google.com with SMTP id 9-20020ac25f09000000b0048aae4b6e40so388667lfq.20
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Jul 2022 00:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MiRkDMIa3SaNcNAA4LhevtztHl/rFve9e8RNCF7+zFQ=;
        b=s8AZZF4+2NWwOVkVZNcQ8LXw5wX00YPpqdsHF236cz4SiCEfGj/ipEdc9L7AO2J1xg
         ba0nwWZyjMJvnN60uaGfDroAg66K05pPDVCWzztVlHzJ76q7vCS6vLfy6LNmR5Jgql+C
         OTcmT4QhWzf63pi3owrKxyPxQenOMYOviqwi2EJlXfJHyWnIMoz7qrpqG1u5AcHgWl3u
         VX6WDHB39oA3aToiZMrZs+kYSQDJ2/DW+787In8O9YQM3fMn1WLQN9ByyeZt87cIVXOe
         J/LITgHy2Cxmb/ZDlQui5obXHoU2oegtx0O+WifcL9ZB3zgbSq1mDDAJeUsJ64t3K+6o
         OGZg==
X-Gm-Message-State: AJIora/UNC1E9R82MAqPADrAsf9M8W1aWA6Jj22ZxYqe1uMiZ6HiHLyQ
        Hi8ZOygiIdfUBHWqjXl8+NAh7CUgPmmGcA7PUrNSLwVKvQQKxik68fHSy3Q1C4Wpeonn4YM4941
        U+4gLBplPsx1s4kTpF/LTOIiUIr+CbTvR4iXHk7qD3sR2qw==
X-Received: by 2002:a2e:a99e:0:b0:25e:a54:8328 with SMTP id x30-20020a2ea99e000000b0025e0a548328mr5494951ljq.141.1658994181673;
        Thu, 28 Jul 2022 00:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u68nBKmGtn3ybA4uLX2AOBJSklXcUMjbmYLhRoC0rjTaSlVKsgAzpWU4s1tY/769/tc0LwTRbMsEcj8iXfSPw=
X-Received: by 2002:a2e:a99e:0:b0:25e:a54:8328 with SMTP id
 x30-20020a2ea99e000000b0025e0a548328mr5494947ljq.141.1658994181424; Thu, 28
 Jul 2022 00:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-17-xuanzhuo@linux.alibaba.com> <15aa26f2-f8af-5dbd-f2b2-9270ad873412@redhat.com>
 <1658907413.1860468-2-xuanzhuo@linux.alibaba.com> <CACGkMEvxsOfiiaWWAR8P68GY1yfwgTvaAbHk1JF7pTw-o2k25w@mail.gmail.com>
 <1658992162.584327-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1658992162.584327-1-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 28 Jul 2022 15:42:50 +0800
Message-ID: <CACGkMEv-KYieHKXY_Qn0nfcnLMOSF=TowF5PwLKOxESL3KQ40Q@mail.gmail.com>
Subject: Re: [PATCH v13 16/42] virtio_ring: split: introduce virtqueue_resize_split()
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
        Kangjie Xu <kangjie.xu@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 28, 2022 at 3:24 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Thu, 28 Jul 2022 10:38:51 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> > On Wed, Jul 27, 2022 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> =
wrote:
> > >
> > > On Wed, 27 Jul 2022 11:12:19 +0800, Jason Wang <jasowang@redhat.com> =
wrote:
> > > >
> > > > =E5=9C=A8 2022/7/26 15:21, Xuan Zhuo =E5=86=99=E9=81=93:
> > > > > virtio ring split supports resize.
> > > > >
> > > > > Only after the new vring is successfully allocated based on the n=
ew num,
> > > > > we will release the old vring. In any case, an error is returned,
> > > > > indicating that the vring still points to the old vring.
> > > > >
> > > > > In the case of an error, re-initialize(virtqueue_reinit_split()) =
the
> > > > > virtqueue to ensure that the vring can be used.
> > > > >
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > ---
> > > > >   drivers/virtio/virtio_ring.c | 34 +++++++++++++++++++++++++++++=
+++++
> > > > >   1 file changed, 34 insertions(+)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio=
_ring.c
> > > > > index b6fda91c8059..58355e1ac7d7 100644
> > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > @@ -220,6 +220,7 @@ static struct virtqueue *__vring_new_virtqueu=
e(unsigned int index,
> > > > >                                            void (*callback)(struc=
t virtqueue *),
> > > > >                                            const char *name);
> > > > >   static struct vring_desc_extra *vring_alloc_desc_extra(unsigned=
 int num);
> > > > > +static void vring_free(struct virtqueue *_vq);
> > > > >
> > > > >   /*
> > > > >    * Helpers.
> > > > > @@ -1117,6 +1118,39 @@ static struct virtqueue *vring_create_virt=
queue_split(
> > > > >     return vq;
> > > > >   }
> > > > >
> > > > > +static int virtqueue_resize_split(struct virtqueue *_vq, u32 num=
)
> > > > > +{
> > > > > +   struct vring_virtqueue_split vring_split =3D {};
> > > > > +   struct vring_virtqueue *vq =3D to_vvq(_vq);
> > > > > +   struct virtio_device *vdev =3D _vq->vdev;
> > > > > +   int err;
> > > > > +
> > > > > +   err =3D vring_alloc_queue_split(&vring_split, vdev, num,
> > > > > +                                 vq->split.vring_align,
> > > > > +                                 vq->split.may_reduce_num);
> > > > > +   if (err)
> > > > > +           goto err;
> > > >
> > > >
> > > > I think we don't need to do anything here?
> > >
> > > Am I missing something?
> >
> > I meant it looks to me most of the virtqueue_reinit() is unnecessary.
> > We probably only need to reinit avail/used idx there.
>
>
> In this function, we can indeed remove some code.
>
> >       static void virtqueue_reinit_split(struct vring_virtqueue *vq)
> >       {
> >               int size, i;
> >
> >               memset(vq->split.vring.desc, 0, vq->split.queue_size_in_b=
ytes);
> >
> >               size =3D sizeof(struct vring_desc_state_split) * vq->spli=
t.vring.num;
> >               memset(vq->split.desc_state, 0, size);
> >
> >               size =3D sizeof(struct vring_desc_extra) * vq->split.vrin=
g.num;
> >               memset(vq->split.desc_extra, 0, size);
>
> These memsets can be removed, and theoretically it will not cause any
> exceptions.

Yes, otherwise we have bugs in detach_buf().

>
> >
> >
> >
> >               for (i =3D 0; i < vq->split.vring.num - 1; i++)
> >                       vq->split.desc_extra[i].next =3D i + 1;
>
> This can also be removed, but we need to record free_head that will been =
update
> inside virtqueue_init().

We can simply keep free_head unchanged? Otherwise it's a bug somewhere I gu=
ess.


>
> >
> >               virtqueue_init(vq, vq->split.vring.num);
>
> There are some operations in this, which can also be skipped, such as set=
ting
> use_dma_api. But I think calling this function directly will be more conv=
enient
> for maintenance.

I don't see anything that is necessary here.

>
>
> >               virtqueue_vring_init_split(&vq->split, vq);
>
> virtqueue_vring_init_split() is necessary.

Right.

>
> >       }
>
> Another method, we can take out all the variables to be reinitialized
> separately, and repackage them into a new function. I don=E2=80=99t think=
 it=E2=80=99s worth
> it, because this path will only be reached if the memory allocation fails=
, which
> is a rare occurrence. In this case, doing so will increase the cost of
> maintenance. If you think so also, I will remove the above memset in the =
next
> version.

I agree.

Thanks

>
> Thanks.
>
>
> >
> > Thanks
> >
> > >
> > > >
> > > >
> > > > > +
> > > > > +   err =3D vring_alloc_state_extra_split(&vring_split);
> > > > > +   if (err) {
> > > > > +           vring_free_split(&vring_split, vdev);
> > > > > +           goto err;
> > > >
> > > >
> > > > I suggest to move vring_free_split() into a dedicated error label.
> > >
> > > Will change.
> > >
> > > Thanks.
> > >
> > >
> > > >
> > > > Thanks
> > > >
> > > >
> > > > > +   }
> > > > > +
> > > > > +   vring_free(&vq->vq);
> > > > > +
> > > > > +   virtqueue_vring_init_split(&vring_split, vq);
> > > > > +
> > > > > +   virtqueue_init(vq, vring_split.vring.num);
> > > > > +   virtqueue_vring_attach_split(vq, &vring_split);
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +err:
> > > > > +   virtqueue_reinit_split(vq);
> > > > > +   return -ENOMEM;
> > > > > +}
> > > > > +
> > > > >
> > > > >   /*
> > > > >    * Packed ring specific functions - *_packed().
> > > >
> > >
> >
>

