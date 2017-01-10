Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 10 Jan 2017 07:51:07 +0000
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Message-ID: <20170110075107.GC2155@dell>
References: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 15 Dec 2016, Loic Pallardy wrote:

> Since commit 4dffed5b3ac796b ("rpmsg: Name rpmsg devices based on
> channel id"), it is no more possible for a firmware to register twice
> a service (on different endpoints). rpmsg_register_device function
> is failing when calling device_add for the second time as second
> device has the same name as first one already register.
> It is because name is based only on service name and so is not more
> unique. Previously name was unique thanks to the use of rpmsg_dev_index.
> 
> This patch adds destination and source endpoint numbers device name to
> create an unique identifier.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> v2: Update commit header with commit ID generating regression
> Fix rpmsg_core instead of virtio_rpmsg
> 
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index a79cb5a..18c73e0 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -453,8 +453,8 @@ int rpmsg_register_device(struct rpmsg_device *rpdev)
>  	struct device *dev = &rpdev->dev;
>  	int ret;
>  
> -	dev_set_name(&rpdev->dev, "%s:%s",
> -		     dev_name(dev->parent), rpdev->id.name);
> +	dev_set_name(&rpdev->dev, "%s.%d.%d.%s", dev_name(dev->parent),
> +		     rpdev->src, rpdev->dst, rpdev->id.name);
>  
>  	rpdev->dev.bus = &rpmsg_bus;
>  	rpdev->dev.release = rpmsg_release_device;

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
