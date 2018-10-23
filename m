Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 06/17] remoteproc: introduce rproc_add_carveout
 function
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-7-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <8f6737ec-6132-25df-107c-b646310b2dce@ti.com>
Date: Tue, 23 Oct 2018 12:05:28 -0500
MIME-Version: 1.0
In-Reply-To: <1532697292-14272-7-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, Loic,

On 7/27/18 8:14 AM, Loic Pallardy wrote:
> This patch introduces a new API to allow platform driver to register
> platform specific carveout regions.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Hmm, I do not prefer that this function be exported. It adds no value,
and this adds an asymmetric API for remoteproc drivers to add a mem
entry to the internal remoteproc lists, while relying on the remoteproc
core to remove them. The carveout list maintenance is a remoteproc
internal scheme, and so should be maintained that way. Further more, on
the current series, all the existing calls are immediately after a
rproc_of_resm_mem_entry_init() or a rproc_mem_entry_init() function,
which means this could very well be folded into those individual functions.

regards
Suman

> ---
>  drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>  include/linux/remoteproc.h           |  2 ++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b76760e..fe6c4e4 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -747,7 +747,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	if (!carveout)
>  		goto free_carv;
>  
> -	list_add_tail(&carveout->node, &rproc->carveouts);
> +	rproc_add_carveout(rproc, carveout);
>  
>  	return 0;
>  
> @@ -761,6 +761,20 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  }
>  
>  /**
> + * rproc_add_carveout() - register an allocated carveout region
> + * @rproc: rproc handle
> + * @mem: memory entry to register
> + *
> + * This function registers specified memory entry in @rproc carveouts list.
> + * Specified carveout should have been allocated before registering.
> + */
> +void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
> +{
> +	list_add_tail(&mem->node, &rproc->carveouts);
> +}
> +EXPORT_SYMBOL(rproc_add_carveout);
> +
> +/**
>   * rproc_mem_entry_init() - allocate and initialize rproc_mem_entry struct
>   * @dev: pointer on device struct
>   * @va: virtual address
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 4bc961f..55f30fc 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -558,6 +558,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  int rproc_del(struct rproc *rproc);
>  void rproc_free(struct rproc *rproc);
>  
> +void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
> +
>  struct rproc_mem_entry *
>  rproc_mem_entry_init(struct device *dev,
>  		     void *va, dma_addr_t dma, int len, u32 da,
> 
