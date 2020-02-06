Date: Thu, 6 Feb 2020 12:18:30 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: warn on kick missing
Message-ID: <20200206201827.GP2514@yoga>
References: <20200206055419.15897-1-NShubin@topcon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206055419.15897-1-NShubin@topcon.com>
To: Nikita Shubin <NShubin@topcon.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 05 Feb 21:54 PST 2020, Nikita Shubin wrote:

> .kick method not set in rproc_ops will result in:
> 
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference
> 
> in rproc_virtio_notify, after firmware loading.
> 
> At least a warning needed on attempt to call missing method.

Is this not a fatal error only happening during development? In which
case the NULL pointer dereference will come with an oops with sufficient
information to pinpoint what's going on?

Regards,
Bjorn

> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..77a81f331e3f 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -32,6 +32,12 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
> 
>         dev_dbg(&rproc->dev, "kicking vq index: %d\n", notifyid);
> 
> +       if (unlikely(rproc->ops->kick == NULL)) {
> +               WARN_ONCE(rproc->ops->kick == NULL, ".kick method not defined for %s",
> +                       rproc->name);
> +               return false;
> +       }
> +
>         rproc->ops->kick(rproc, notifyid);
>         return true;
>  }
> --
> 2.24.1
> 
> Confidentiality Notice: This message (including attachments) is a private communication solely for use of the intended recipient(s). If you are not the intended recipient(s) or believe you received this message in error, notify the sender immediately and then delete this message. Any other use, retention, dissemination or copying is prohibited and may be a violation of law, including the Electronic Communication Privacy Act of 1986.   ??
