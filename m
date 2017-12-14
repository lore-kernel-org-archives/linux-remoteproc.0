Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:29:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 10/16] remoteproc: add memory device registering in
 rproc_add_carveout
Message-ID: <20171214012959.GK17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-11-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-11-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> Add the possibility to associate a memory device to
> carveout.
> 
> Due to some memory mapping constraints, remoteproc related memory
> allocations should be done in a specific memory region.
> Constraint is not coming from remoteproc firmware (with defined
> device address), but from remoteproc platform driver itself.
> 
> In that case, platform driver has to register a carveout region with
> memory device. Memory device will be used for carveout, vring or buffer
> allocation accorfing to its name.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 14 +++++++++++++-
>  drivers/remoteproc/st_remoteproc.c   |  2 +-
>  include/linux/remoteproc.h           |  3 ++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 76d54bf..2b7effb 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -964,17 +964,29 @@ static int rproc_handle_carveout(struct rproc *rproc,
>   * rproc_add_carveout() - register an allocated carveout region
>   * @rproc: rproc handle
>   * @mem: memory entry to register
> + * @memdev: true if carveout shoult be associated to a memory device
>   *
>   * This function registers specified memory entry in @rproc carveouts list.
>   * Specified carveout should have been allocated before registering.
>   */
> -int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
> +int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem, bool memdev)
>  {
> +	struct rproc_memdev *memd;
> +
>  	if (!rproc || !mem)
>  		return -EINVAL;
>  
>  	mem->priv = (void *)CARVEOUT_EXTERNAL;
>  
> +	if (memdev) {
> +		memd = rproc_memdev_add(rproc, mem);

But this would likely cause the memory-region to be remapped twice, once by the
caller and once by the dmam_declare_coherent_memory().

> +		if (IS_ERR(memd))
> +			return -ENOMEM;
> +		mem->memdev = memd;
> +	} else {
> +		mem->memdev = NULL;
> +	}
> +
>  	list_add_tail(&mem->node, &rproc->carveouts);
>  
>  	return 0;
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 1549ce8..da42ec9 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -286,7 +286,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  			return -EBUSY;
>  		}
>  
> -		rproc_add_carveout(rproc, mem);
> +		rproc_add_carveout(rproc, mem, false);

So when memdev is false this should imply that "mem" has not been
remapped already. Which I think would be better captured by not
overloading the add_carveout function.

Regards,
Bjorn
