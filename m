Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Oct 2018 17:26:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/5] rpmsg: Add signal callback to rpmsg char device
Message-ID: <20181004002651.GU2523@minitux>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
 <1538566463-24627-3-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538566463-24627-3-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Oct 04:34 PDT 2018, Arun Kumar Neelakantam wrote:

> Register a callback to get the signal notifications from rpmsg.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>

Please incorporate this into patch 4.

Regards,
Bjorn
 
> ---
>  drivers/rpmsg/rpmsg_char.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index a76b963..86003d5 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2012, PetaLogix
>   * Copyright (c) 2011, Texas Instruments, Inc.
>   * Copyright (c) 2011, Google, Inc.
> + * Copyright (c) 2018, The Linux Foundation.
>   *
>   * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>   * was based on TI & Google OMX rpmsg driver.
> @@ -120,6 +121,12 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  	return 0;
>  }
>  
> +static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv,
> +			 u32 old, u32 new)
> +{
> +	return 0;
> +}
> +
>  static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> @@ -136,6 +143,7 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  		return -EINVAL;
>  	}
>  
> +	ept->sig_cb = rpmsg_sigs_cb;
>  	eptdev->ept = ept;
>  	filp->private_data = eptdev;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
