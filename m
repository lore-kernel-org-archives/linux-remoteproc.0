Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Mon, 10 Feb 2020 16:05:48 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss
 region on shutdown
Message-ID: <20200210230548.GA20652@xps15>
References: <20200204062641.393949-1-bjorn.andersson@linaro.org>
 <20200204062641.393949-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204062641.393949-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On Mon, Feb 03, 2020 at 10:26:40PM -0800, Bjorn Andersson wrote:
> Trying to reclaim mpss memory while the mba is not running causes the
> system to crash on devices with security fuses blown, so leave it
> assigned to the remote on shutdown and recover it on a subsequent boot.
> 
> Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - The assignment of mpss memory back to Linux is rejected in the coredump case
>   on production devices, so check the return value of q6v5_xfer_mem_ownership()
>   before attempting to memcpy() the data.
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 471128a2e723..25c03a26bf88 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -887,11 +887,6 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>  	}
>  
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> -				      false, qproc->mpss_phys,
> -				      qproc->mpss_size);
> -	WARN_ON(ret);
> -
>  	q6v5_reset_assert(qproc);
>  
>  	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
> @@ -981,6 +976,10 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
>  	}
>  
> +	/* Try to reset ownership back to Linux */
> +	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
> +				qproc->mpss_phys, qproc->mpss_size);

Would you mind adding more chatter here, something like what is mentioned in the
changelog?  That way I anyone trying to review this code doesn't have to suffer
through the same mental gymnastic. 

> +
>  	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
>  	qproc->mpss_reloc = mpss_reloc;
>  	/* Load firmware segments */
> @@ -1070,8 +1069,16 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>  
>  	/* Unlock mba before copying segments */
> -	if (!qproc->dump_mba_loaded)
> +	if (!qproc->dump_mba_loaded) {
>  		ret = q6v5_mba_load(qproc);
> +		if (!ret) {
> +			/* Try to reset ownership back to Linux */
> +			ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> +						      false,
> +						      qproc->mpss_phys,
> +						      qproc->mpss_size);
> +		}

I'm a bit puzzled here as to why a different reclaim strategy is needed.  It is
clear to me that if q6v5_mba_load() returns 0 then the MBA is running and we can
safely reclaim ownership of the memory.  But is it absolutely needed when we
know that 1) the MCU has crashed and 2) said memory will be reclaimed in
q6v5_mpss_load()?

If so I think an explanation in the code is needed.

I also assume there is no way to know if the mba is running, hence not taking
any chance.  If that's the case it would be nice to add that to the comment in
q6v5_mpss_load().

Thanks,
Mathieu

> +	}
>  
>  	if (!ptr || ret)
>  		memset(dest, 0xff, segment->size);
> @@ -1123,10 +1130,6 @@ static int q6v5_start(struct rproc *rproc)
>  	return 0;
>  
>  reclaim_mpss:
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> -						false, qproc->mpss_phys,
> -						qproc->mpss_size);
> -	WARN_ON(xfermemop_ret);
>  	q6v5_mba_reclaim(qproc);
>  
>  	return ret;
> -- 
> 2.23.0
> 
