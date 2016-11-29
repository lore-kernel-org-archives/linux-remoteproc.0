Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 29 Nov 2016 09:20:30 +0000
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Message-ID: <20161129092030.GD2683@dell>
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 25 Nov 2016, Loic Pallardy wrote:

> Since virtio backend creation, it is no more possible for a firmware to
> register twice a service (on different endpoints). rpmsg_register_device
> function is failing when calling device_add for the second time as second
> device has the same name as first one already register.
> It is because name is based only on service name.
> 
> This patch adds destination endpoint to service name to create an
> unique device name.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Isn't this a fix?

If so, please use Fixes: tag.  This will ensure Bjorn looks at it
quickly and that it's applied to his -next branch.

We really do not want v4.9 to be an unusable kernel version for us.

> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3090b0d..dce880f 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -405,7 +405,8 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>  	 */
>  	rpdev->announce = rpdev->src != RPMSG_ADDR_ANY;
>  
> -	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
> +	snprintf(rpdev->id.name, RPMSG_NAME_SIZE, "%s-%d", chinfo->name,
> +		 chinfo->dst);
>  
>  	rpdev->dev.parent = &vrp->vdev->dev;
>  	ret = rpmsg_register_device(rpdev);

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
