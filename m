Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 1/1] remoteproc: replace "%p" with "%pK"
References: <1530880707-29333-1-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <4ca468d8-046e-b7ee-1505-f7d0e85c5101@ti.com>
Date: Wed, 25 Jul 2018 15:27:09 -0500
MIME-Version: 1.0
In-Reply-To: <1530880707-29333-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 07/06/2018 07:38 AM, Loic Pallardy wrote:
> The format specifier "%p" can leak kernel addresses.
> Use "%pK" instead.
> 
> This patch proposes changes for remoteproc core only.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/remoteproc/remoteproc_core.c    | 6 +++---
>  drivers/remoteproc/remoteproc_debugfs.c | 4 ++--
>  drivers/remoteproc/remoteproc_virtio.c  | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a9609d9..c597f0c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -241,7 +241,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	if (notifyid > rproc->max_notifyid)
>  		rproc->max_notifyid = notifyid;
>  
> -	dev_dbg(dev, "vring%d: va %p dma %pad size 0x%x idr %d\n",
> +	dev_dbg(dev, "vring%d: va %pK dma %pad size 0x%x idr %d\n",
>  		i, va, &dma, size, notifyid);
>  
>  	rvring->va = va;
> @@ -497,7 +497,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
>  
>  	rproc->num_traces++;
>  
> -	dev_dbg(dev, "%s added: va %p, da 0x%x, len 0x%x\n",
> +	dev_dbg(dev, "%s added: va %pK, da 0x%x, len 0x%x\n",
>  		name, ptr, rsc->da, rsc->len);
>  
>  	return 0;
> @@ -635,7 +635,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		goto free_carv;
>  	}
>  
> -	dev_dbg(dev, "carveout va %p, dma %pad, len 0x%x\n",
> +	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%x\n",
>  		va, &dma, rsc->len);
>  
>  	/*
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index a204883..a5c29f2 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -231,7 +231,7 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>  			}
>  			break;
>  		default:
> -			seq_printf(seq, "Unknown resource type found: %d [hdr: %p]\n",
> +			seq_printf(seq, "Unknown resource type found: %d [hdr: %pK]\n",
>  				   hdr->type, hdr);
>  			break;
>  		}
> @@ -260,7 +260,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
>  
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
>  		seq_puts(seq, "Carveout memory entry:\n");
> -		seq_printf(seq, "\tVirtual address: %p\n", carveout->va);
> +		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
>  		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
>  		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
>  		seq_printf(seq, "\tLength: 0x%x Bytes\n\n", carveout->len);
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index b0633fd..bbecd44 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -96,7 +96,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  	size = vring_size(len, rvring->align);
>  	memset(addr, 0, size);
>  
> -	dev_dbg(dev, "vring%d: va %p qsz %d notifyid %d\n",
> +	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
>  		id, addr, len, rvring->notifyid);
>  
>  	/*
> 
