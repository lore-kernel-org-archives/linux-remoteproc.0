Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 2 Dec 2016 15:19:44 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Message-ID: <20161202231944.GF9322@tuxbot>
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 25 Nov 09:54 PST 2016, Loic Pallardy wrote:

> Since virtio backend creation, it is no more possible for a firmware to
> register twice a service (on different endpoints). rpmsg_register_device
> function is failing when calling device_add for the second time as second
> device has the same name as first one already register.
> It is because name is based only on service name.
> 

Afaict rpmsg_create_channel() first looks for any existing devices with
the same src, dst and name and if such device is found we fail early and
this logic is found before all those changes as well.

> This patch adds destination endpoint to service name to create an
> unique device name.

As the code didn't look to support multiple services with the same name
I have not considered this scenario. Can you describe your use case for
this?

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
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

But in rpmsg_id_match() we match rpdev->id.name against the id_table of
the registered drivers to find out which driver to probe, please help me
understand what I'm missing here.

Regards,
Bjorn
