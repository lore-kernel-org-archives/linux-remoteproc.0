Return-Path: <nikita.shubin@maquefel.me>
From: nikita.shubin@maquefel.me
In-Reply-To: <20200206055419.15897-1-NShubin@topcon.com>
References: <20200206055419.15897-1-NShubin@topcon.com>
Subject: Re: [PATCH] remoteproc: warn on kick missing
MIME-Version: 1.0
Date: Thu, 06 Feb 2020 13:40:18 +0300
Message-Id: <25402731580985618@sas2-1c82b59a1818.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
To: Nikita Shubin <nshubin@topcon.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Sorry for malformed message, please ignore it.

06.02.2020, 08:53, "Nikita Shubin" <nshubin@topcon.com>:
> .kick method not set in rproc_ops will result in:
>
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference
>
> in rproc_virtio_notify, after firmware loading.
>
> At least a warning needed on attempt to call missing method.
>
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..77a81f331e3f 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -32,6 +32,12 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
>
>         dev_dbg(&rproc->dev, "kicking vq index: %d\n", notifyid);
>
> + if (unlikely(rproc->ops->kick == NULL)) {
> + WARN_ONCE(rproc->ops->kick == NULL, ".kick method not defined for %s",
> + rproc->name);
> + return false;
> + }
> +
>         rproc->ops->kick(rproc, notifyid);
>         return true;
>  }
> --
> 2.24.1
>
> Confidentiality Notice: This message (including attachments) is a private communication solely for use of the intended recipient(s). If you are not the intended recipient(s) or believe you received this message in error, notify the sender immediately and then delete this message. Any other use, retention, dissemination or copying is prohibited and may be a violation of law, including the Electronic Communication Privacy Act of 1986. ­­
