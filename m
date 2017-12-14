Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 16:30:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 01/16] remoteproc: add rproc_va_to_pa function
Message-ID: <20171214003056.GC17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-2-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> This new function translates CPU virtual address in
> CPU physical one according to virtual address location.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index eab14b4..faa18a7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -139,6 +139,17 @@ static void rproc_disable_iommu(struct rproc *rproc)
>  	iommu_domain_free(domain);
>  }
>  
> +static phys_addr_t rproc_va_to_pa(void *cpu_addr)
> +{
> +	if (is_vmalloc_addr(cpu_addr)) {

Please add a comment describing when is_vmalloc_addr() would be true.

> +		return page_to_phys(vmalloc_to_page(cpu_addr)) +
> +				    offset_in_page(cpu_addr);
> +	}
> +
> +	WARN_ON(!virt_addr_valid(cpu_addr));
> +	return virt_to_phys(cpu_addr);
> +}
> +
>  /**
>   * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
>   * @rproc: handle of a remote processor
> @@ -700,7 +711,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	 * In this case, the device address and the physical address
>  	 * are the same.
>  	 */
> -	rsc->pa = dma;
> +	rsc->pa = (u32)rproc_va_to_pa(va);

This is more correct than using "dma", so this is good.

Regards,
Bjorn
