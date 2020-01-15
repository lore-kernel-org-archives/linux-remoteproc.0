Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: Add support for predefined notifyids
References: <20200115102142.11229-1-cleger@kalray.eu>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <088ceab9-f135-6e70-dcf6-f75ec46110b1@st.com>
Date: Wed, 15 Jan 2020 15:06:34 +0100
MIME-Version: 1.0
In-Reply-To: <20200115102142.11229-1-cleger@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Clément,

On 1/15/20 11:21 AM, Clement Leger wrote:
> In order to support preallocated notify ids, if their value is
> equal to FW_RSC_NOTIFY_ID_ANY, then do no allocate a notify id
> dynamically but try to allocate the requested one. This is useful when
> using custom ids to bind them to custom vendor resources. For instance,
> it allow to assign a group of queues to a specific interrupti in order
> to dispatch notifications.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/remoteproc_core.c | 27 +++++++++++++++++++--------
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 307df98347ba..b1485fcd0f11 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -351,14 +351,27 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	/*
>  	 * Assign an rproc-wide unique index for this vring
>  	 * TODO: assign a notifyid for rvdev updates as well
> -	 * TODO: support predefined notifyids (via resource table)
>  	 */
> -	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
> -	if (ret < 0) {
> -		dev_err(dev, "idr_alloc failed: %d\n", ret);
> -		return ret;
> +	if (rsc->vring[i].notifyid == FW_RSC_NOTIFY_ID_ANY) {
> +		ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
> +		if (ret < 0) {
> +			dev_err(dev, "idr_alloc failed: %d\n", ret);
> +			return ret;
> +		}
> +		notifyid = ret;
> +
> +		/* Let the rproc know the notifyid of this vring.*/
> +		rsc->vring[i].notifyid = notifyid;
> +	} else {
> +		/* Reserve requested notify_id */
> +		notifyid = rsc->vring[i].notifyid;
> +		ret = idr_alloc(&rproc->notifyids, rvring, notifyid,
> +				notifyid + 1, GFP_KERNEL);
> +		if (ret < 0) {
> +			dev_err(dev, "idr_alloc failed: %d\n", ret);
> +			return ret;
> +		}
>  	}
> -	notifyid = ret;
>  
>  	/* Potentially bump max_notifyid */
>  	if (notifyid > rproc->max_notifyid)
> @@ -366,8 +379,6 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  
>  	rvring->notifyid = notifyid;
>  
> -	/* Let the rproc know the notifyid of this vring.*/
> -	rsc->vring[i].notifyid = notifyid;
>  	return 0;
>  }
The rproc_free_vring function resets the notifyid to -1 on free.
This could generate a side effect if the resource table is not reloaded.

>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..dcae3394243e 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -123,6 +123,7 @@ enum fw_resource_type {
>  };
>  
>  #define FW_RSC_ADDR_ANY (-1)
> +#define FW_RSC_NOTIFY_ID_ANY (-1)This define can also be used in rproc_free_vring

Regards,
Arnaud
>  
>  /**
>   * struct fw_rsc_carveout - physically contiguous memory request
> 
