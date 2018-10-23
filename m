Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 01/17] remoteproc: configure IOMMU only if device
 address requested
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-2-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <f6af2ded-dfcd-7cb9-6557-a17c40166836@ti.com>
Date: Tue, 23 Oct 2018 12:25:49 -0500
MIME-Version: 1.0
In-Reply-To: <1532697292-14272-2-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 7/27/18 8:14 AM, Loic Pallardy wrote:
> If there is no IOMMU associate to remote processor device,
> remoteproc_core won't be able to satisfy device address requested
> in firmware resource table.
> Return an error as configuration won't be coherent.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

This patch is breaking my Davinci platforms. It is not really required
that you _should_ have IOMMUs when a valid DA is mentioned. Please see
the existing description (paras 4 and 5) on the fw_rsc_carveout
kerneldoc in remoteproc.h file.

We do have platforms where we have some internal sub-modules within the
remote processor sub-system that provides some linear
address-translation (most common case with 32-bit processors supporting
64-bit addresses). Also, we have some upcoming SoCs where we have an MMU
but is not programmable by Linux.

There is one comment there, but I don't think this is actually handled
in the current remoteproc core.
"If @da is set to
 * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
 * overwrite @da with the dynamically allocated address."

regards
Suman

> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 4cd1a8e..437fabf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -657,7 +657,15 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	 * to use the iommu-based DMA API: we expect 'dma' to contain the
>  	 * physical address in this case.
>  	 */
> -	if (rproc->domain) {
> +
> +	if (rsc->da != FW_RSC_ADDR_ANY && !rproc->domain) {
> +		dev_err(dev->parent,
> +			"Bad carveout rsc configuration\n");
> +		ret = -ENOMEM;
> +		goto dma_free;
> +	}
> +
> +	if (rsc->da != FW_RSC_ADDR_ANY && rproc->domain) {
>  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>  		if (!mapping) {
>  			ret = -ENOMEM;
> 
