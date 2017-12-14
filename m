Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 16:34:27 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 02/16] remoteproc: add release ops in rproc_mem_entry
 struct
Message-ID: <20171214003427.GD17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-3-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-3-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:

> +static int rproc_release_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = &rproc->dev;
> +
> +	/* clean up carveout allocations */
> +	dma_free_coherent(dev->parent, mem->len, mem->va, mem->dma);
> +	list_del(&mem->node);

The core is responsible for putting the node on a list, so let the
cleanup take if off the list.

> +	kfree(mem);
> +	return 0;
> +}
> +
[..]
> @@ -319,12 +322,11 @@ struct rproc_mem_entry {
>  	dma_addr_t dma;
>  	int len;
>  	u32 da;
> +	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);

The placement here seems random, please move it last in the struct.

>  	void *priv;
>  	struct list_head node;
>  };
>  

Regards,
Bjorn
