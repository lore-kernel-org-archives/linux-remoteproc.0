Date: Sun, 19 Apr 2020 23:49:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 3/5] remoteproc: Add support for runtime PM
Message-ID: <20200420064950.GC1868936@builder.lan>
References: <20200417170040.174319-1-paul@crapouillou.net>
 <20200417170040.174319-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417170040.174319-3-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 17 Apr 10:00 PDT 2020, Paul Cercueil wrote:

> Call pm_runtime_get_sync() before the firmware is loaded, and
> pm_runtime_put() after the remote processor has been stopped.
> 
> Even though the remoteproc device has no PM callbacks, this allows the
> parent device's PM callbacks to be properly called.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Notes:
>     v2-v4: No change
>     v5: Move calls to prepare/unprepare to rproc_fw_boot/rproc_shutdown
>     v6: Instead of prepare/unprepare callbacks, use PM runtime callbacks
> 
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a7f96bc98406..d391b054efd8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -29,6 +29,7 @@
>  #include <linux/devcoredump.h>
>  #include <linux/rculist.h>
>  #include <linux/remoteproc.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/iommu.h>
>  #include <linux/idr.h>
>  #include <linux/elf.h>
> @@ -1384,6 +1385,8 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  
>  	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
>  
> +	pm_runtime_get_sync(dev);

This can return an error, should we ignore this?

Apart from that this looks good.

Regards,
Bjorn

> +
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
>  	 * just a nop
> @@ -1391,7 +1394,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	ret = rproc_enable_iommu(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't enable iommu: %d\n", ret);
> -		return ret;
> +		goto put_pm_runtime;
>  	}
>  
>  	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
> @@ -1435,6 +1438,8 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	rproc->table_ptr = NULL;
>  disable_iommu:
>  	rproc_disable_iommu(rproc);
> +put_pm_runtime:
> +	pm_runtime_put(dev);
>  	return ret;
>  }
>  
> @@ -1840,6 +1845,8 @@ void rproc_shutdown(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> +	pm_runtime_put(dev);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -2118,6 +2125,9 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> +	pm_runtime_no_callbacks(&rproc->dev);
> +	pm_runtime_enable(&rproc->dev);
> +
>  	return rproc;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
> @@ -2133,6 +2143,7 @@ EXPORT_SYMBOL(rproc_alloc);
>   */
>  void rproc_free(struct rproc *rproc)
>  {
> +	pm_runtime_disable(&rproc->dev);
>  	put_device(&rproc->dev);
>  }
>  EXPORT_SYMBOL(rproc_free);
> -- 
> 2.25.1
> 
