Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB33FB91
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711600326; cv=none; b=MNViDQR60py6oB9CkJ09MXGVhZzK0Ya9QoyigwVuFW0hOc58Z8D+SoB25dDPx3eOJMEulGNLn5XTPWXcxtUyVSrQnx15zTYdNUXYlyp2bhZ0V+ognJ2rvnLLqVGvxsDfdPyuMc3jCrRApBP5yAmTE0ck1Sx+hsi5tic8jlVAvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711600326; c=relaxed/simple;
	bh=xJLYLskzclvh4a5XLgAZO+G3VyABn3yHoq3XyBR9i64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ4Nlm1A5MofSV10Zn/EHTwgSScoxrTdlAxnaCxQO0i9A1Bv9P7GU3sDD2shpzy0m+Obp53RRMh0Eb1Yoe3bXO67Y9ErReY/g5azE9CQg0qGjaVR9i5F4MZv5WvBNVUBIziDC+gCVX1kpNq9sKtIEfGqaPFsF7dF2hrP5E0BLpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLMt6dpI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLMt6dpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711600323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww5dkbusXK+Y9Hp6j8VLO9/563+oqik9XmCTRysRCC4=;
	b=QLMt6dpIUMZp6V+JUDLoS0eSJ4xJc80gdOXDNlcson7/6Ju+VG3c1r8tasBDQ2JM2yWORP
	GGWUronjO8ci918xK+oeagNXJtJWvK6EuXwttDQFZJ9u9xMfvgxMc/YgVmQwl/xZmiR3m3
	SJluVu+OotUsd9AVD4M09j9/tXa7ICU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-kJzQVrTgNdCswWluj_YWLQ-1; Thu, 28 Mar 2024 00:32:01 -0400
X-MC-Unique: kJzQVrTgNdCswWluj_YWLQ-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5d8dc8f906aso312297a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 21:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711600320; x=1712205120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ww5dkbusXK+Y9Hp6j8VLO9/563+oqik9XmCTRysRCC4=;
        b=u5zvyY6eF0t31KoWGjvD7MEokt7RFkfgP+ZwZIMHb4+3ptCAd+WXxEXBeKVwZVni9Z
         Z+eZ8gl0XZ/E78F+eV5gTl5vqhyVXF9kgbhk0+ZGjGzh8axPJzFE7a+Xiz+KOXsH82u4
         KV0p7nvWqcdJPsdZmBFfeN2GDQQ86DWmsgQw69SDwyqNacDyqHjPsh2bYoBYw5BEvDHD
         /BwQKxv4ta0KhOPtjdxHC5sx3WTiiugbTRURt0QurGLjPL9n9nBfr/1CNtnvTFegvA0k
         XBqN+e8vKX64KQBziNMCnMaBa9CNK8dTkcFy/685RTTcxdAboJH9gLTKPOKJGE43u4qK
         w1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWW8Fbc0iRimSX1Gn8fyaQN4zVybUMt+484N6zaFrkPY/bsbevdTAzryb0azr1nhZJU/gw0uHzdinbVhVvzBBXEG+zKU+31EXLlSh3a+Rel/w==
X-Gm-Message-State: AOJu0YwgvoqfW67i1FipugldTAsqgZTvXbL2noNH4lq1UGf2QdQ31p6T
	QZ7/LFIisq+Hhw3J+0BFvJaZvWcs+vVYik95SkRCmw9RUtBe8JplwUvPpbvGE0ik6anshhJjaLY
	KKT1o6X8pjkq3+qQbSbOYiXAwCXzsCuHUCHtwpeDVE7yaE5ZuS37vlahJvB7ksZl7aNpBDnmiMU
	iGHtS962fcUs0fXxE91LmQ7dr9d11S0jwkhqvsfbdgrw==
X-Received: by 2002:a17:90a:ee92:b0:29c:7566:a1d6 with SMTP id i18-20020a17090aee9200b0029c7566a1d6mr1452981pjz.25.1711600320211;
        Wed, 27 Mar 2024 21:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6KnNAzlSfMV27jArSGHkdRB+9NNyzb6JyLO1cDdJIUW2utpq8RXpVu5JtztSKrL4nBed2puHeDPxBZIwYEYc=
X-Received: by 2002:a17:90a:ee92:b0:29c:7566:a1d6 with SMTP id
 i18-20020a17090aee9200b0029c7566a1d6mr1452958pjz.25.1711600319900; Wed, 27
 Mar 2024 21:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327095741.88135-1-xuanzhuo@linux.alibaba.com> <20240327095741.88135-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240327095741.88135-6-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Mar 2024 12:31:48 +0800
Message-ID: <CACGkMEu4J0ZD26GjahKr6YysBrj==rgtiKcnpnuV7dC9Zj-+CQ@mail.gmail.com>
Subject: Re: [PATCH vhost v6 5/6] virtio: vring_new_virtqueue(): pass struct
 instead of multi parameters
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	David Hildenbrand <david@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 5:58=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Now, we pass multi parameters to vring_new_virtqueue. These parameters
> may from transport or from driver.
>
> vring_new_virtqueue is called by many places.
> Every time, we try to add a new parameter, that is difficult.
>
> If parameters from the driver, that should directly be passed to vring.
> Then the vring can access the config from driver directly.
>
> If parameters from the transport, we squish the parameters to a
> structure. That will be helpful to add new parameter.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 12 ++++---
>  drivers/remoteproc/remoteproc_virtio.c   | 11 ++++---
>  drivers/virtio/virtio_ring.c             | 29 +++++++++++-----
>  include/linux/virtio_ring.h              | 42 +++++++++++++++++++-----
>  tools/virtio/virtio_test.c               |  4 +--
>  tools/virtio/vringh_test.c               | 28 ++++++++--------
>  6 files changed, 84 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/=
mellanox/mlxbf-tmfifo.c
> index 4252388f52a2..d2e871fad8b4 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -1059,6 +1059,7 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virt=
io_device *vdev,
>                                         struct virtio_vq_config *cfg)
>  {
>         struct mlxbf_tmfifo_vdev *tm_vdev =3D mlxbf_vdev_to_tmfifo(vdev);
> +       struct vq_transport_config tp_cfg =3D {};
>         struct virtqueue **vqs =3D cfg->vqs;
>         struct mlxbf_tmfifo_vring *vring;
>         unsigned int nvqs =3D cfg->nvqs;
> @@ -1078,10 +1079,13 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct vi=
rtio_device *vdev,
>                 /* zero vring */
>                 size =3D vring_size(vring->num, vring->align);
>                 memset(vring->va, 0, size);
> -               vq =3D vring_new_virtqueue(i, vring->num, vring->align, v=
dev,
> -                                        false, false, vring->va,
> -                                        mlxbf_tmfifo_virtio_notify,
> -                                        cfg->callbacks[i], cfg->names[i]=
);
> +
> +               tp_cfg.num =3D vring->num;
> +               tp_cfg.vring_align =3D vring->align;
> +               tp_cfg.weak_barriers =3D false;
> +               tp_cfg.notify =3D mlxbf_tmfifo_virtio_notify;
> +
> +               vq =3D vring_new_virtqueue(vdev, i, vring->va, &tp_cfg, c=
fg);
>                 if (!vq) {
>                         dev_err(&vdev->dev, "vring_new_virtqueue failed\n=
");
>                         ret =3D -ENOMEM;
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/=
remoteproc_virtio.c
> index 489fea1d41c0..2319c2007833 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -106,6 +106,7 @@ static struct virtqueue *rp_find_vq(struct virtio_dev=
ice *vdev,
>  {
>         struct rproc_vdev *rvdev =3D vdev_to_rvdev(vdev);
>         struct rproc *rproc =3D vdev_to_rproc(vdev);
> +       struct vq_transport_config tp_cfg;

Should we zero this structure?

Thanks

