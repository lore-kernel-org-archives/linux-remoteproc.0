Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 2/3] rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer
 separately
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
 <1548949280-31794-3-git-send-email-xiaoxiang@xiaomi.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <01b88b99-ebc1-a5a3-2ff9-39fe476847be@st.com>
Date: Thu, 9 May 2019 14:02:05 +0200
MIME-Version: 1.0
In-Reply-To: <1548949280-31794-3-git-send-email-xiaoxiang@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Xiang Xiao <xiaoxiang781216@gmail.com>, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Xiang,

This patch has the opposite effect on my platform as DMA allocation is
aligned on 4k page.
For instance i declared:
- in RX  6 buffers (of 512 bytes)
- in TX  4 buffers ( of 512 bytes)

The result is (kernel trace)
[   41.915896] virtio_rpmsg_bus virtio0: rx buffers: va ebb5f5ca, dma
0x0x10042000
[   41.915922] virtio_rpmsg_bus virtio0: tx buffers: va a7865153, dma
0x0x10043000

The TX buffer memory is allocated on next 4k page...

Anyway separate the RX and TX allocation makes sense. This could also
allow to allocate buffers in 2 different memories.
For time being, issue is that only one memory area can be attached to
the virtio device for DMA allocation... and PA/DA translations are missing.
This means that we probably need (in a first step) a new remoteproc API
for memory allocation.
These memories should be declared and mmaped in rproc platform drivers
(memory region) or in resource table (carveout).
This is partially done in the API for the platform driver
(rproc_mem_entry_init) but not available for rproc clients.

Regards
Arnaud


On 1/31/19 4:41 PM, Xiang Xiao wrote:
> many dma allocator align the returned address with buffer size,
> so two small allocation could reduce the alignment requirement
> and save the the memory space wasted by the potential alignment.
> 
> Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 58 +++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index fb0d2eb..59c4554 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -40,7 +40,8 @@
>   * @num_sbufs:	total number of buffers for tx
>   * @buf_size:	size of one rx or tx buffer
>   * @last_sbuf:	index of last tx buffer used
> - * @bufs_dma:	dma base addr of the buffers
> + * @rbufs_dma:	dma base addr of rx buffers
> + * @sbufs_dma:	dma base addr of tx buffers
>   * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
>   *		sending a message might require waking up a dozing remote
>   *		processor, which involves sleeping, hence the mutex.
> @@ -62,7 +63,8 @@ struct virtproc_info {
>  	unsigned int num_sbufs;
>  	unsigned int buf_size;
>  	int last_sbuf;
> -	dma_addr_t bufs_dma;
> +	dma_addr_t rbufs_dma;
> +	dma_addr_t sbufs_dma;
>  	struct mutex tx_lock;
>  	struct idr endpoints;
>  	struct mutex endpoints_lock;
> @@ -872,9 +874,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	static const char * const names[] = { "input", "output" };
>  	struct virtqueue *vqs[2];
>  	struct virtproc_info *vrp;
> -	void *bufs_va;
>  	int err = 0, i;
> -	size_t total_buf_space;
>  	bool notify;
>  
>  	vrp = kzalloc(sizeof(*vrp), GFP_KERNEL);
> @@ -909,25 +909,28 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>  
> -	total_buf_space = (vrp->num_rbufs + vrp->num_sbufs) * vrp->buf_size;
> -
>  	/* allocate coherent memory for the buffers */
> -	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
> -				     total_buf_space, &vrp->bufs_dma,
> -				     GFP_KERNEL);
> -	if (!bufs_va) {
> +	vrp->rbufs = dma_alloc_coherent(vdev->dev.parent->parent,
> +					vrp->num_rbufs * vrp->buf_size,
> +					&vrp->rbufs_dma, GFP_KERNEL);
> +	if (!vrp->rbufs) {
>  		err = -ENOMEM;
>  		goto vqs_del;
>  	}
>  
> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> -		bufs_va, &vrp->bufs_dma);
> +	dev_dbg(&vdev->dev, "rx buffers: va %p, dma 0x%pad\n",
> +		vrp->rbufs, &vrp->rbufs_dma);
>  
> -	/* first part of the buffers is dedicated for RX */
> -	vrp->rbufs = bufs_va;
> +	vrp->sbufs = dma_alloc_coherent(vdev->dev.parent->parent,
> +					vrp->num_sbufs * vrp->buf_size,
> +					&vrp->sbufs_dma, GFP_KERNEL);
> +	if (!vrp->sbufs) {
> +		err = -ENOMEM;
> +		goto free_rbufs;
> +	}
>  
> -	/* and second part is dedicated for TX */
> -	vrp->sbufs = bufs_va + vrp->num_rbufs * vrp->buf_size;
> +	dev_dbg(&vdev->dev, "tx buffers: va %p, dma 0x%pad\n",
> +		vrp->sbufs, &vrp->sbufs_dma);
>  
>  	/* set up the receive buffers */
>  	for (i = 0; i < vrp->num_rbufs; i++) {
> @@ -954,7 +957,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  		if (!vrp->ns_ept) {
>  			dev_err(&vdev->dev, "failed to create the ns ept\n");
>  			err = -ENOMEM;
> -			goto free_coherent;
> +			goto free_sbufs;
>  		}
>  	}
>  
> @@ -979,9 +982,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	return 0;
>  
> -free_coherent:
> -	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> -			  bufs_va, vrp->bufs_dma);
> +free_sbufs:
> +	dma_free_coherent(vdev->dev.parent->parent,
> +			  vrp->num_sbufs * vrp->buf_size,
> +			  vrp->sbufs, vrp->sbufs_dma);
> +free_rbufs:
> +	dma_free_coherent(vdev->dev.parent->parent,
> +			  vrp->num_rbufs * vrp->buf_size,
> +			  vrp->rbufs, vrp->rbufs_dma);
>  vqs_del:
>  	vdev->config->del_vqs(vrp->vdev);
>  free_vrp:
> @@ -999,8 +1007,6 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	unsigned int num_bufs = vrp->num_rbufs + vrp->num_sbufs;
> -	size_t total_buf_space = num_bufs * vrp->buf_size;
>  	int ret;
>  
>  	vdev->config->reset(vdev);
> @@ -1016,8 +1022,12 @@ static void rpmsg_remove(struct virtio_device *vdev)
>  
>  	vdev->config->del_vqs(vrp->vdev);
>  
> -	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> -			  vrp->rbufs, vrp->bufs_dma);
> +	dma_free_coherent(vdev->dev.parent->parent,
> +			  vrp->num_sbufs * vrp->buf_size,
> +			  vrp->sbufs, vrp->sbufs_dma);
> +	dma_free_coherent(vdev->dev.parent->parent,
> +			  vrp->num_rbufs * vrp->buf_size,
> +			  vrp->rbufs, vrp->rbufs_dma);
>  
>  	kfree(vrp);
>  }
> 
