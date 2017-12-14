Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:09:19 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 06/16] remoteproc: modify vring allocation to support
 preallocated region
Message-ID: <20171214010919.GH17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-7-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-7-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> Current version of rproc_alloc_vring function supports only dynamic vring
> allocation.
> This patch extends rproc_alloc_vring to verify if requested vring DA is
> already part or not of a registered carveout. If true, nothing to do, else
> just allocate vring as before.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 53 +++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 515a17a..bdc99cd 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -263,21 +263,41 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vring *rvring = &rvdev->vring[i];
>  	struct fw_rsc_vdev *rsc;
> -	dma_addr_t dma;
> +	dma_addr_t dma = -1;
>  	void *va;
>  	int ret, size, notifyid;
>  
>  	/* actual size of vring (in bytes) */
>  	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>  
> -	/*
> -	 * Allocate non-cacheable memory for the vring. In the future
> -	 * this call will also configure the IOMMU for us
> -	 */
> -	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);

This dma_alloc_coherent() should have been a full
rproc_handle_carveout(), so that we don't duplicate the effort of
allocation and setting up the iommu mapping.

> -	if (!va) {
> -		dev_err(dev->parent, "dma_alloc_coherent failed\n");
> -		return -EINVAL;
> +	/* get vring resource table pointer */
> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> +
> +	if (rsc->vring[i].da != FW_RSC_ADDR_ANY) {

I think it's reasonable in a system with iommu to specify da, rely on
dynamic allocation and expect the iommu to bet configured.

> +		va = rproc_find_carveout_by_da(rproc, rsc->vring[i].da, size);
> +
> +		if (!va) {
> +			/* No region not found */
> +			dev_err(dev->parent, "Pre-allocated vring not found\n");
> +			return -ENOMEM;
> +		}
[..]
> @@ -304,14 +325,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	rvring->dma = dma;
>  	rvring->notifyid = notifyid;
>  
> -	/*
> -	 * Let the rproc know the notifyid and da of this vring.
> -	 * Not all platforms use dma_alloc_coherent to automatically
> -	 * set up the iommu. In this case the device address (da) will
> -	 * hold the physical address and not the device address.
> -	 */
> -	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> -	rsc->vring[i].da = dma;

I prefer that we keep the rsc assignments in a single place.

> +	/* Let the rproc know the notifyid of this vring. */
>  	rsc->vring[i].notifyid = notifyid;
>  	return 0;
>  }
> @@ -348,7 +362,8 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  	int idx = rvring->rvdev->vring - rvring;
>  	struct fw_rsc_vdev *rsc;
>  
> -	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
> +	if (rvring->dma != -1)

This doesn't feel well designed.

> +		dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);

How about we start by reworking rproc_alloc_vring() to utilize the
carveout handler logic, i.e. when we parse the vring we create (or from
your other patches find an existing) carveout and assign this to rvring.
Then rproc_alloc_vring() becomes a matter of copying the information off
the associated carveout to the rvring and rsc.

This would also simplify the cleanup path as the carveout would be taken
care of by rproc_resource_cleanup(), both in the successful and
unsuccessful cases.

Regards,
Bjorn
