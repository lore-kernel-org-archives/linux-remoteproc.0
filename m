Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 19 Jan 2018 07:08:00 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: smd: Fix double unlock in __qcom_smd_send()
Message-ID: <20180119150800.GB887@minitux>
References: <20180119132236.GA32641@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180119132236.GA32641@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 19 Jan 05:22 PST 2018, Dan Carpenter wrote:

> We're not holding the lock here, so we shouldn't unlock.
> 
> Fixes: 178f3f75bb4e ("rpmsg: smd: Don't hold the tx lock during wait")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Thanks Dan!

Regards,
Bjorn

> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index cea9a0930c4d..dd3e7eea8c38 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -759,11 +759,11 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>  				       qcom_smd_get_tx_avail(channel) >= tlen ||
>  				       channel->state != SMD_CHANNEL_OPENED);
>  		if (ret)
> -			goto out;
> +			goto ret;
>  
>  		ret = mutex_lock_interruptible(&channel->tx_lock);
>  		if (ret)
> -			goto out;
> +			return ret;
>  
>  		SET_TX_CHANNEL_FLAG(channel, fBLOCKREADINTR, 1);
>  	}
