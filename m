Return-Path: <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com> <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 5 Sep 2019 08:42:08 -0600
Message-ID: <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rpmsg: core: add API to get message length
Content-Type: text/plain; charset="UTF-8"
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, lkml <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
> Return the rpmsg buffer size for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
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

What is the intent of this?

The term "mtu" is "maximum transfer unit" - ie the largest payload of
data that could possibly be sent, however at any one point in time,
that might not be able to be accommodated.

I don't think this is implemented correctly.  In GLINK and SMD, you've
not implemented MTU, you've implemented "how much can I send at this
point in time".  To me, this is not mtu.

In the case of SMD, you could get the fifo size and return that as the
mtu, but since you seem to be wanting to use this from the TTY layer
to determine how much can be sent at a particular point in time, I
don't think you actually want mtu.

For GLINK, I don't actually think you can get a mtu based on the
design, but I'm trying to remember from 5-6 years ago when we designed
it.  It would be possible that a larger intent would be made available
later.

I think you need to first determine if you are actually looking for
mtu, or "how much data can I send right now", because right now, it
isn't clear.
