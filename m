Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:15:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 07/16] remoteproc: st: add reserved memory support
Message-ID: <20171214011559.GI17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-8-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-8-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> ST remote processor needs some specified memory regions for firmware and IPC.
> Memory regions are defined as reserved memory and should be registered in
> remoteproc core thanks to rproc_add_carveout function.
> Memory region release is handled by ST driver itself on remove operation.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/st_remoteproc.c | 43 +++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index aacef0e..1549ce8 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> @@ -208,8 +209,10 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct st_rproc *ddata = rproc->priv;
> -	struct device_node *np = dev->of_node;
> -	int err;
> +	struct device_node *node, *np = dev->of_node;
> +	struct resource res;
> +	struct rproc_mem_entry *mem;
> +	int err, count, i;
>  
>  	if (ddata->config->sw_reset) {
>  		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
> @@ -254,10 +257,36 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	err = of_reserved_mem_device_init(dev);
> -	if (err) {
> -		dev_err(dev, "Failed to obtain shared memory\n");
> -		return err;
> +	count = of_count_phandle_with_args(np, "memory-region", NULL);
> +
> +	for (i = 0; i < count; i++) {

If you use of_phandle_iterator this becomes a little bit more compact
and using of_reserved_mem_lookup() gives you the flexibility of
specifying the reserved-memory using size= in addition to a reg=.

of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
while ((err = of_phandle_iterator_next(&it)) == 0) {
	rmem = of_reserved_mem_lookup(it->node);

	// Memory is rmem->base, rmem->size;
}

> +		node = of_parse_phandle(np, "memory-region", i);
> +		if (!node) {
> +			dev_err(dev, "No memory-region specified\n");
> +			return -EINVAL;
> +		}
> +
> +		err = of_address_to_resource(node, 0, &res);
> +		if (err) {
> +			dev_err(dev, "Bad memory-region definition\n");
> +			return err;
> +		}
> +
> +		mem = devm_kzalloc(dev, sizeof(*mem), GFP_KERNEL);
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		mem->dma = res.start;
> +		mem->da = res.start;
> +		mem->len = resource_size(&res);
> +		mem->va = devm_ioremap_wc(dev, mem->dma, mem->len);
> +		if (!mem->va) {
> +			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +				&res.start, mem->len);
> +			return -EBUSY;
> +		}
> +
> +		rproc_add_carveout(rproc, mem);
>  	}

We have a few copies of this logic, how about we move this into a helper
function in the core?

Regards,
Bjorn
