Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:44:07 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 12/16] remoteproc: look-up memory-device for vring
 allocation
Message-ID: <20171214014407.GM17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-13-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-13-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>  	} else {
> +		/* Find any carveout matching vring */
> +		/* Try dedicated vdev j vring i pool. */
> +		snprintf(name, sizeof(name), "vdev%dvring%d", rvdev->index, i);
> +		carveout = rproc_find_carveout_by_name(rproc, name);

This might match a carveout representing remapped device memory, which
wouldn't have a memdev so the logic below would silently allocate from
the parent dma_mem instead.

I don't think this is user friendly and would be better to just use the
information in the already mapped carveout.

> +
> +		if (!carveout) {
> +			/* Try dedicated vdev j vrings pool. */
> +			snprintf(name, sizeof(name), "vdev%dvring", rvdev->index);
> +			carveout = rproc_find_carveout_by_name(rproc, name);
> +		}
> +
> +		if (carveout && carveout->memdev)
> +			memdev = &carveout->memdev->dev;
> +
> +		rvring->dev = memdev;
> +
>  		/*
>  		 * Allocate non-cacheable memory for the vring. In the future
>  		 * this call will also configure the IOMMU for us
>  		 */
> -		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
> +		va = dma_alloc_coherent(memdev, size, &dma, GFP_KERNEL);

It's possible that you have fulfilled a resource_table carveout request
with this memory, making the dynamic allocation likely to cause issues.

>  		if (!va) {
>  			dev_err(dev->parent, "dma_alloc_coherent failed\n");
>  			return -EINVAL;

Regards,
Bjorn
