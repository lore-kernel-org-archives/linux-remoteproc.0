Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 21:37:29 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 15/16] remoteproc: st: associate memory device to
 memory regions
Message-ID: <20171214053729.GP17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-16-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-16-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> Enable memory device creation for each memory region added
> by rproc_add_carveout function.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/st_remoteproc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index da42ec9..bf83d82 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -279,6 +279,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  		mem->dma = res.start;
>  		mem->da = res.start;
>  		mem->len = resource_size(&res);
> +		strncpy(mem->name, node->name, sizeof(mem->name));

Please add this to the previous patch.

>  		mem->va = devm_ioremap_wc(dev, mem->dma, mem->len);
>  		if (!mem->va) {
>  			dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> @@ -286,7 +287,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  			return -EBUSY;
>  		}
>  
> -		rproc_add_carveout(rproc, mem, false);
> +		rproc_add_carveout(rproc, mem, true);

Here you can see how easy it is to accidentally double-map the memory
region.

Regards,
Bjorn
