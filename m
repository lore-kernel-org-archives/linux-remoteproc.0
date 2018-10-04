Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Oct 2018 17:54:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/5] rpmsg: Add TIOCMGET/TIOCMSET ioctl support
Message-ID: <20181004005433.GX2523@minitux>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
 <1538566463-24627-4-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538566463-24627-4-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Oct 04:34 PDT 2018, Arun Kumar Neelakantam wrote:

> Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
> to get/set the low level transport signals.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_char.c | 54 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 86003d5..c983d6c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -20,6 +20,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
> +#include <linux/termios.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> @@ -274,15 +275,62 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
>  	return mask;
>  }
>  
> +static int rpmsg_eptdev_tiocmset(struct file *fp, unsigned int cmd,
> +				 unsigned long arg)

Make arg type int __user *

> +{
> +	struct rpmsg_eptdev *eptdev = fp->private_data;
> +	u32 lsigs, rsigs, val;
> +	int ret;
> +
> +	ret = get_user(val, (u32 *)arg);
> +	if (ret)
> +		return ret;
> +
> +	ret = rpmsg_get_sigs(eptdev->ept, &lsigs, &rsigs);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (cmd) {
> +	case TIOCMBIS:
> +		lsigs |= val;
> +		break;
> +	case TIOCMBIC:
> +		lsigs &= ~val;
> +		break;
> +	case TIOCMSET:
> +		lsigs = val;
> +		break;
> +	}
> +
> +	ret = rpmsg_set_sigs(eptdev->ept, lsigs);

This is racy, as the signals might change while we update them. Mimic
tty_tiocmset() instead and make rpmsg_set_sigs() take a clear and set
mask.

And please do spell out rpmsg_set_signal() and rpmsg_get_signal().

> +	return ret;

return rpmsg_set_signals();

> +}
> +
>  static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			       unsigned long arg)
>  {
>  	struct rpmsg_eptdev *eptdev = fp->private_data;
> +	u32 lsigs, rsigs;
> +	int ret;
>  
> -	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
> -		return -EINVAL;
> +	switch (cmd) {
> +	case TIOCMGET:
> +		ret = rpmsg_get_sigs(eptdev->ept, &lsigs, &rsigs);
> +		if (!ret)
> +			ret = put_user(rsigs, (u32 *)arg);

Cast to int __user *

> +		break;
> +	case TIOCMSET:
> +	case TIOCMBIS:
> +	case TIOCMBIC:
> +		ret = rpmsg_eptdev_tiocmset(fp, cmd, arg);
> +		break;
> +	case RPMSG_DESTROY_EPT_IOCTL:
> +		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	default:
> +		ret = -EINVAL;
> +	}
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return ret;
>  }

Regards,
Bjorn
