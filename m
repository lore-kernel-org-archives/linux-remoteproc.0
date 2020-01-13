Date: Mon, 13 Jan 2020 09:24:57 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] rpmsg: core: add API to get MTU
Message-ID: <20200113172453.GQ738324@yoga>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113172249.32412-1-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:

> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 

I won't merge this new api without a client, and I'm still concerned
about the details.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  V1 to V2
> 
>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>   - Change patch title,
>   - as not solution today to support MTU on GLINK make ops optional,
>     RPMsg client API returns -ENOTSUPP in this case,
>   - suppress smd and glink patches.

That's ok.

> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..a6ef54c4779a 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.
> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.

Is the expectation that a call to rpmsg_send() with this size will
eventually succeed?

> + */
[..]
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +
> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);

I'm still under the impression that the rpmsg protocol doesn't have to
operate on fixed size messages. Would this then return vrp->num_bufs *
vrp->buf_size / 2 - sizeof(rpmsg_hdr)?

> +}
> +

Regards,
Bjorn
