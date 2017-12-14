Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 16:36:41 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 03/16] remoteproc: introduce rproc_add_carveout
 function
Message-ID: <20171214003641.GE17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-4-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-4-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f23daf9..279320a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -737,6 +737,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	carveout->dma = dma;
>  	carveout->da = rsc->da;
>  	carveout->release = rproc_release_carveout;
> +	carveout->priv = (void *)CARVEOUT_RSC_ALLOCATED;

I don't fancy the (ab)use of priv to keep track of this, I also don't
see that it's ever used. Please drop it.

[..]
> +int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
> +{
> +	if (!rproc || !mem)
> +		return -EINVAL;

I don't see this function doing more than adding the item to the list of
carveouts, which can't fail. So let's just rely on the user calling it
with valid references and make it return void.

> +
> +	mem->priv = (void *)CARVEOUT_EXTERNAL;
> +
> +	list_add_tail(&mem->node, &rproc->carveouts);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rproc_add_carveout);

Regards,
Bjorn
