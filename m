Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 1 Jul 2019 23:27:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190702062705.GG1263@builder>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701070245.32083-1-cleger@kalray.eu>
To: Clement Leger <cleger@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 01 Jul 00:02 PDT 2019, Clement Leger wrote:

> When preparing the subdevice for the vdev, also copy dma_pfn_offset
> since this is used for sub device dma allocations. Without that, there
> is incoherency between the parent dma settings and the childs one,
> potentially leading to dma_alloc_coherent failure (due to phys_to_dma
> using dma_pfn_offset for translation).
> 
> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> Acked-by: Loic Pallardy <loic.pallardy@st.com>

Thanks for the update. Applied

Regards,
Bjorn

> ---
> Changes in v2:
>  - Fix typo in commit message
>  - Add "Fixes" in commit message
>  - Add Signed-off
>  - Add Acked-by Loic Pallardy
> 
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48feebd6d0a2..06837b1f2d60 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = rproc->dev.parent;
> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> -- 
> 2.15.0.276.g89ea799
> 
