Return-Path: <anup@brainfault.org>
MIME-Version: 1.0
In-Reply-To: <20180420194321-mutt-send-email-mst@kernel.org>
References: <20180420194321-mutt-send-email-mst@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 22 Apr 2018 09:38:10 +0530
Message-ID: <CAAhSdy2JncLrpc0WUoBtB4g+bnGtUWiFOS=sxnTF9fkw9a3UnQ@mail.gmail.com>
Subject: Re: virtio remoteproc device
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 20, 2018 at 10:23 PM, Michael S. Tsirkin <mst@redhat.com> wrote=
:
> Hello!
> I note the following in the serial console:
>
>       if (is_rproc_serial(vdev)) {
>                 /*
>                  * Allocate DMA memory from ancestor. When a virtio
>                  * device is created by remoteproc, the DMA memory is
>                  * associated with the grandparent device:
>                  * vdev =3D> rproc =3D> platform-dev.
>                  */
>                 if (!vdev->dev.parent || !vdev->dev.parent->parent)
>                         goto free_buf;
>                 buf->dev =3D vdev->dev.parent->parent;
>
>                 /* Increase device refcnt to avoid freeing it */
>                 get_device(buf->dev);
>                 buf->buf =3D dma_alloc_coherent(buf->dev, buf_size, &buf-=
>dma,
>                                               GFP_KERNEL);
>         }
>
> Added here:
>         commit 1b6370463e88b0c1c317de16d7b962acc1dab4f2
>         Author: Sjur Br=C3=A6ndeland <sjur.brandeland@stericsson.com>
>         Date:   Fri Dec 14 14:40:51 2012 +1030
>
>     virtio_console: Add support for remoteproc serial
>
>
> I am not familiar with rproc so I have a question:
> why is it required to use coherent memory here,
> and why through a grandparent device?

I faced similar issue when I tried VirtIO RPMSG bus over
VirtIO MMIO transport.

Here's my fix for VirtIO RPMSG bus driver:
https://patchwork.kernel.org/patch/10155145/

Regards,
Anup
