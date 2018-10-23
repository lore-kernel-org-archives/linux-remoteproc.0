Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 07/17] remoteproc: introduce
 rproc_find_carveout_by_name function
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-8-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <df17f33f-3ccb-60b6-8d71-9d5170401ba0@ti.com>
Date: Tue, 23 Oct 2018 14:28:29 -0500
MIME-Version: 1.0
In-Reply-To: <1532697292-14272-8-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 7/27/18 8:14 AM, Loic Pallardy wrote:
> This patch provides a new function to find a carveout according
> to a name.
> If match found, this function returns a pointer on the corresponding
> carveout (rproc_mem_entry structure).
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fe6c4e4..77b39ba 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -217,6 +217,48 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  }
>  EXPORT_SYMBOL(rproc_da_to_va);
>  
> +/**
> + * rproc_find_carveout_by_name() - lookup the carveout region by a name
> + * @rproc: handle of a remote processor
> + * @name,..: carveout name to find (standard printf format)
> + *
> + * Platform driver has the capability to register some pre-allacoted carveout

%s/pre-allacoted/pre-allocated/

> + * (physically contiguous memory regions) before rproc firmware loading and
> + * associated resource table analysis. These regions may be dedicated memory
> + * regions internal to the coprocessor or specified DDR region with specific

I guess this is the part that perhaps was being thought of for
representing internal memories as well for removing the da_to_va ops
right. Question is how to handle the different alias views for the same
address space. Anyway, that is perhaps a discussion for later given that
the current series does not remove the ops.

> + * attributes
> + *
> + * This function is a helper function with which we can go over the
> + * allocated carveouts and return associated region characteristics like
> + * coprocessor address, length or processor virtual address.
> + *
> + * Return: a valid pointer on carveout entry on success or NULL on failure.
> + */
> +struct rproc_mem_entry *
> +rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
> +{
> +	va_list args;
> +	char _name[32];
> +	struct rproc_mem_entry *carveout, *mem = NULL;
> +
> +	if (!name)
> +		return NULL;
> +
> +	va_start(args, name);
> +	vsnprintf(_name, sizeof(_name), name, args);
> +	va_end(args);
> +
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		/* Compare carveout and requested names */
> +		if (!strcmp(carveout->name, _name)) {
> +			mem = carveout;

Bjorn had some comments on v3 about returning carveout directly here
instead of break, avoids the mem variable. I am ok either way.

regards
Suman

> +			break;
> +		}
> +	}
> +
> +	return mem;
> +}
> +
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> 
