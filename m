Date: Mon, 6 Apr 2020 22:30:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v8 15/19] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200407053041.GH20625@builder.lan>
References: <20200407011612.478226-1-mst@redhat.com>
 <20200407011612.478226-16-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407011612.478226-16-mst@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 06 Apr 18:16 PDT 2020, Michael S. Tsirkin wrote:

> These are used for legacy ring format, switch to APIs that make this
> explicit.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c   | 2 +-
>  drivers/remoteproc/remoteproc_virtio.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..c350a01e6c4e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -322,7 +322,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	struct rproc_mem_entry *mem;
>  
>  	/* actual size of vring (in bytes) */
> -	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> +	size = PAGE_ALIGN(vring_legacy_size(rvring->len, rvring->align));
>  
>  	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>  
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 8c07cb2ca8ba..35b02468197a 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -95,7 +95,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  	len = rvring->len;
>  
>  	/* zero vring */
> -	size = vring_size(len, rvring->align);
> +	size = vring_legacy_size(len, rvring->align);
>  	memset(addr, 0, size);
>  
>  	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
> -- 
> MST
> 
