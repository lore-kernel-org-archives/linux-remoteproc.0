Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 6 Jun 2017 12:33:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 05/16] rpmsg: use dev_groups and not dev_attrs for
 bus_type
Message-ID: <20170606193309.GH12920@tuxbook>
References: <20170606192221.1617-1-gregkh@linuxfoundation.org>
 <20170606192221.1617-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170606192221.1617-6-gregkh@linuxfoundation.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 06 Jun 12:22 PDT 2017, Greg Kroah-Hartman wrote:

> The dev_attrs field has long been "depreciated" and is finally being
> removed, so move the driver to use the "correct" dev_groups field
> instead for struct bus_type.
> 
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: <linux-remoteproc@vger.kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for cleaning this up.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_core.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 600f5f9f7431..ad3d2a9df287 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -330,7 +330,8 @@ field##_show(struct device *dev,					\
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
>  									\
>  	return sprintf(buf, format_string, rpdev->path);		\
> -}
> +}									\
> +static DEVICE_ATTR_RO(field);
>  
>  /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
>  rpmsg_show_attr(name, id.name, "%s\n");
> @@ -345,15 +346,17 @@ static ssize_t modalias_show(struct device *dev,
>  
>  	return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
>  }
> -
> -static struct device_attribute rpmsg_dev_attrs[] = {
> -	__ATTR_RO(name),
> -	__ATTR_RO(modalias),
> -	__ATTR_RO(dst),
> -	__ATTR_RO(src),
> -	__ATTR_RO(announce),
> -	__ATTR_NULL
> +static DEVICE_ATTR_RO(modalias);
> +
> +static struct attribute *rpmsg_dev_attrs[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_modalias.attr,
> +	&dev_attr_dst.attr,
> +	&dev_attr_src.attr,
> +	&dev_attr_announce.attr,
> +	NULL,
>  };
> +ATTRIBUTE_GROUPS(rpmsg_dev);
>  
>  /* rpmsg devices and drivers are matched using the service name */
>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> @@ -455,7 +458,7 @@ static int rpmsg_dev_remove(struct device *dev)
>  static struct bus_type rpmsg_bus = {
>  	.name		= "rpmsg",
>  	.match		= rpmsg_dev_match,
> -	.dev_attrs	= rpmsg_dev_attrs,
> +	.dev_groups	= rpmsg_dev_groups,
>  	.uevent		= rpmsg_uevent,
>  	.probe		= rpmsg_dev_probe,
>  	.remove		= rpmsg_dev_remove,
> -- 
> 2.13.0
> 
