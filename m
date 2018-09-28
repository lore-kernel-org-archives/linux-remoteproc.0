Return-Path: <anup@brainfault.org>
MIME-Version: 1.0
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com> <1532697292-14272-18-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-18-git-send-email-loic.pallardy@st.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Sep 2018 13:26:50 +0530
Message-ID: <CAAhSdy3nyHqv+6EaYxN9qW0qhnNgTk-8MhFeB7QTBgxaFBtVVA@mail.gmail.com>
Subject: Re: [PATCH v4 17/17] rpmsg: virtio: allocate buffer from parent
Content-Type: text/plain; charset="UTF-8"
To: Loic Pallardy <loic.pallardy@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, arnaud pouliquen <arnaud.pouliquen@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, s-anna@ti.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jul 27, 2018 at 6:45 PM Loic Pallardy <loic.pallardy@st.com> wrote:
>
> Remoteproc is now capable to create one specific sub-device per
> virtio link to associate a dedicated memory pool.
> This implies to change device used by virtio_rpmsg for
> buffer allocation from grand-parent to parent.
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 664f957..5c89201 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -912,7 +912,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>         total_buf_space = vrp->num_bufs * vrp->buf_size;
>
>         /* allocate coherent memory for the buffers */
> -       bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
> +       bufs_va = dma_alloc_coherent(vdev->dev.parent,
>                                      total_buf_space, &vrp->bufs_dma,
>                                      GFP_KERNEL);
>         if (!bufs_va) {
> @@ -980,7 +980,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>         return 0;
>
>  free_coherent:
> -       dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> +       dma_free_coherent(vdev->dev.parent, total_buf_space,
>                           bufs_va, vrp->bufs_dma);
>  vqs_del:
>         vdev->config->del_vqs(vrp->vdev);
> @@ -1015,7 +1015,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
>
>         vdev->config->del_vqs(vrp->vdev);
>
> -       dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> +       dma_free_coherent(vdev->dev.parent, total_buf_space,
>                           vrp->rbufs, vrp->bufs_dma);
>
>         kfree(vrp);
> --
> 1.9.1
>

Reviewed-by: Anup Patel <anup@brainfault.org>

Also, tried this patch on Linux running inside Guest/VM on
Xvisor ARM/ARM64.
Tested-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
