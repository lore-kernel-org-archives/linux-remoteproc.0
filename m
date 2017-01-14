Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v1 4/6] rpmsg: virtio_rpmsg: get buffer configuration from
 virtio
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <1481142941-15616-5-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <eee13ee7-b728-ac4f-53f0-40692bd7c4a9@ti.com>
Date: Fri, 13 Jan 2017 20:26:40 -0600
MIME-Version: 1.0
In-Reply-To: <1481142941-15616-5-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 12/07/2016 02:35 PM, Loic Pallardy wrote:
> Some coprocessors have memory mapping constraints which require
> predefined buffer location or specific buffer size different from
> default definition.
> Coprocessor resources are defined in associated firmware resource table.
> Remoteproc offers access to firmware resource table via virtio get
> interface.
> 
> This patch modifies rpmsg_probe sequence to:
> - retrieve rpmsg buffer configuration (if any)
> - verify and apply configuration
> - allocate buffer according to requested configuration
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 52 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 0810d1f..1a97af8 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -32,6 +32,7 @@
>  #include <linux/sched.h>
>  #include <linux/wait.h>
>  #include <linux/rpmsg.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  
> @@ -871,6 +872,45 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	return 0;
>  }
>  
> +static int virtio_rpmsg_get_config(struct virtio_device *vdev)
> +{
> +	struct virtio_rpmsg_cfg virtio_cfg;
> +	struct virtproc_info *vrp = vdev->priv;
> +	size_t total_buf_space;
> +	int ret = 0;
> +
> +	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
> +	vdev->config->get(vdev, RPMSG_CONFIG_OFFSET, &virtio_cfg,
> +			  sizeof(virtio_cfg));
> +
> +	if (virtio_cfg.id == VIRTIO_ID_RPMSG && virtio_cfg.version == 1 &&
> +	    virtio_cfg.reserved == 0) {
> +		if (virtio_cfg.buf_size <= MAX_RPMSG_BUF_SIZE) {
> +			vrp->buf_size = virtio_cfg.buf_size;
> +		} else {
> +			WARN_ON(1);
> +			dev_warn(&vdev->dev, "Requested RPMsg buffer size too big: %d\n",
> +				 vrp->buf_size);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		vrp->bufs_dma = virtio_cfg.pa;

I believe this line belongs to the next patch. It gets overwritten in
this patch anyway since you go through the normal dma allocation.

> +
> +		/* Check rpmsg buffer length */
> +		total_buf_space = vrp->num_bufs * vrp->buf_size;
> +		if ((virtio_cfg.len != -1) && (total_buf_space > virtio_cfg.len)) {
> +			dev_warn(&vdev->dev, "Not enough memory for buffers: %d\n",
> +					total_buf_space);
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		return !ret;
> +	}
> +out:
> +	return ret;
> +
> +}
> +
>  static int rpmsg_probe(struct virtio_device *vdev)
>  {
>  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
> @@ -901,6 +941,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	vrp->rvq = vqs[0];
>  	vrp->svq = vqs[1];
>  
> +	vdev->priv = vrp;
> +
>  	/* we expect symmetric tx/rx vrings */
>  	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
>  		virtqueue_get_vring_size(vrp->svq));
> @@ -911,9 +953,15 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	else
>  		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
>  
> +	vrp->buf_size = MAX_RPMSG_BUF_SIZE;

As pointed previously, this assignment should be moved into Patch 1.

> +
> +	/* Try to get rpmsg configuration if any */
> +	err = virtio_rpmsg_get_config(vdev);
> +	if (err < 0)
> +		goto free_vrp;
> +
>  	total_buf_space = vrp->num_bufs * vrp->buf_size;
>  
> -	/* allocate coherent memory for the buffers */

don't delete the comment here, has nothing to do with the change you are
doing.

regards
Suman

>  	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
>  				     total_buf_space, &vrp->bufs_dma,
>  				     GFP_KERNEL);
> @@ -946,8 +994,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	/* suppress "tx-complete" interrupts */
>  	virtqueue_disable_cb(vrp->svq);
>  
> -	vdev->priv = vrp;
> -
>  	/* if supported by the remote processor, enable the name service */
>  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
>  		/* a dedicated endpoint handles the name service msgs */
> 
