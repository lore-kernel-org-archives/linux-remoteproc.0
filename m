Return-Path: <sunnyliangjy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1481142941-15616-4-git-send-email-loic.pallardy@st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com> <1481142941-15616-4-git-send-email-loic.pallardy@st.com>
From: Wendy Liang <sunnyliangjy@gmail.com>
Date: Thu, 8 Dec 2016 13:59:45 -0800
Message-ID: <CAA07jV9+Tq_WO=ER05qY0uM+8v+dChBGZXn+j_vtc1vR7yHt9g@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] include: virtio_rpmsg: add virtio rpmsg
 configuration structure
Content-Type: text/plain; charset=UTF-8
To: Loic Pallardy <loic.pallardy@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, lee.jones@linaro.org, patrice.chotard@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

HI Loic,

As this introduce a new virtio config. How about to add a new header
file for virtio_rpmsg in the include/uapi/linux directory just like
other virtio device driver, such as virtio_blk?

Thanks,
Wendy

On Wed, Dec 7, 2016 at 12:35 PM, Loic Pallardy <loic.pallardy@st.com> wrote:
> Rpmsg channel configuration should be identical on host and
> coprocessor side.
> This patch proposes a new structure named struct virtio_rpmsg_cfg
> to gather all configuration information to characterize the
> communication link and.
> This structure will be exchanged with coprocessor via the resource
> table, expanding struct fw_rsc_vdev. It will guarantee that host
> and coprocessor will share the same information.
> virtio_rpmsg will access it thanks to virtio get and set features.
> Presence of struct virtio_rpmsg_cfg is optional.
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  include/linux/rpmsg/virtio_rpmsg.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 0000000..5f3f0d0
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,32 @@
> +
> +#ifndef _LINUX_VIRTIO_RPMSG_H
> +#define _LINUX_VIRTIO_RPMSG_H
> +
> +/* Offset in struct fw_rsc_vdev */
> +#define RPMSG_CONFIG_OFFSET    0
> +
> +/**
> + * struct virtio_rpmsg_cfg - optional configuration field for virtio rpmsg
> + * provided at probe time by virtio (get/set)
> + * @id: virtio cfg id (as in virtio_ids.h)
> + * @version: virtio_rpmsg_cfg structure version number
> + * @va: virtual address (used when buffer allocated by low level driver)
> + * @da: device address
> + * @pa: physical address
> + * @len: length (in bytes)
> + * @buf_size: size of rpmsg buffer size (defined by firmware else default value
> + *           used)
> + * @reserved: reserved (must be zero)
> + */
> +struct virtio_rpmsg_cfg {
> +       u32 id;
> +       u32 version;
> +       u64 va;
> +       u32 da;
> +       u32 pa;
> +       u32 len;
> +       u32 buf_size;
> +       u32 reserved;
> +} __packed;
> +
> +#endif
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
