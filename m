Return-Path: <vkoul@kernel.org>
Date: Tue, 7 Aug 2018 11:45:39 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/6] remoteproc: Introduce custom dump function for
 each remoteproc segment
Message-ID: <20180807061539.GG2395@vkoul-mobl>
References: <20180727152003.11663-1-sibis@codeaurora.org>
 <20180727152003.11663-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152003.11663-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Sibi,

On 27-07-18, 20:49, Sibi Sankar wrote:
> Introduce custom dump function per remoteproc segment. It is responsible
> for filling the device memory segment associated with coredump
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 15 ++++++++++-----
>  include/linux/remoteproc.h           |  3 +++
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 283b258f5e0f..ec56cd822b26 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1183,13 +1183,18 @@ static void rproc_coredump(struct rproc *rproc)
>  		phdr->p_align = 0;
>  
>  		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
> -		if (!ptr) {
> -			dev_err(&rproc->dev,
> +
> +		if (segment->dump) {
> +			segment->dump(rproc, ptr, segment->size, data + offset);

Am not sure I follow, you are calling this w/o checking if ptr is valid,
so you maybe passing null to segment->dump() ?

> +		} else {
> +			if (!ptr) {
> +				dev_err(&rproc->dev,
>  				"invalid coredump segment (%pad, %zu)\n",
>  				&segment->da, segment->size);
> -			memset(data + offset, 0xff, segment->size);
> -		} else {
> -			memcpy(data + offset, ptr, segment->size);
> +				memset(data + offset, 0xff, segment->size);
> +			} else {
> +				memcpy(data + offset, ptr, segment->size);
> +			}

-- 
~Vinod
