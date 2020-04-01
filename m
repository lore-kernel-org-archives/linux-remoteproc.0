Return-Path: <jslaby@suse.com>
Subject: Re: [PATCH v7 1/2] rpmsg: core: add API to get MTU
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-2-arnaud.pouliquen@st.com>
From: Jiri Slaby <jslaby@suse.com>
Message-ID: <356fe539-6ec4-6000-1f68-23404fc5d373@suse.com>
Date: Wed, 1 Apr 2020 08:28:39 +0200
MIME-Version: 1.0
In-Reply-To: <20200324170407.16470-2-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 24. 03. 20, 18:04, Arnaud Pouliquen wrote:
> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Acked-by: Suman Anna <s-anna@ti.com>
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
> + */
> +
> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_mtu)
> +		return -ENOTSUPP;

Hmm, I don't think all callers of tty_write_room() handle negative values...

But some drivers also return negative values. There is some work to be
done, adding to TODO.

For the time being, I suggest returning 0 instead.

thanks,
-- 
js
suse labs
