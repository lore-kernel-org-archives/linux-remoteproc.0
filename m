Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 9 May 2018 17:59:18 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 10/13] remoteproc: modify vring allocation to support
 pre-registered region
Message-ID: <20180510005918.GI29093@builder>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-11-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519921440-21356-11-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
[..]
> @@ -265,23 +269,45 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vring *rvring = &rvdev->vring[i];
>  	struct fw_rsc_vdev *rsc;
> -	dma_addr_t dma;
> -	void *va;
>  	int ret, size, notifyid;
> +	struct fw_rsc_carveout rsc_carveout;
> +	struct rproc_mem_entry *mem;
>  
>  	/* actual size of vring (in bytes) */
>  	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>  
> -	/*
> -	 * Allocate non-cacheable memory for the vring. In the future
> -	 * this call will also configure the IOMMU for us
> -	 */
> -	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
> -	if (!va) {
> -		dev_err(dev->parent, "dma_alloc_coherent failed\n");
> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> +
> +	/* Create virtual firmware carveout resource */
> +	rsc_carveout.da = rsc->vring[i].da;
> +	rsc_carveout.pa = FW_RSC_ADDR_ANY;
> +	rsc_carveout.len = size;
> +	rsc_carveout.flags = 0;
> +	rsc_carveout.reserved = 0;
> +	snprintf(rsc_carveout.name, sizeof(rsc_carveout.name), "vdev%dvring%d",
> +		 rvdev->index, i);
[..]
> @@ -437,6 +460,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  
>  	rvdev->id = rsc->id;
>  	rvdev->rproc = rproc;
> +	rvdev->index = index++;

This index isn't deterministic over multiple remoteproc instances and
multiple restarts of the remoteproc. It probably needs to be based
generated based on the ordering in the resource table.

Regards,
Bjorn
