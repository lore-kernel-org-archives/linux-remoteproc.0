Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 2 Dec 2016 17:33:45 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: core: probe subdevices before booting
 coprocessor
Message-ID: <20161203013345.GG9322@tuxbot>
References: <1480096150-5795-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480096150-5795-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 25 Nov 09:49 PST 2016, Loic Pallardy wrote:

> With subdevice support introduction, coprocessor boot sequence has
> changed. Related coprocessor subdevices are now starting after firmware
> and resource table loading and coprocessor boot.
> 
> But some subdevices can resources to allocate before coprocessor start,
> like rpmsg buffers allocation for example.
> 
> This patch probes subdevices just before loading resource table,
> to keep backward compatibility with existing firmwares.
> 

I'm sorry, it looks like I didn't properly describe this change in
behavior in the git log.

If you look in an older kernel (e.g. v4.0) you will find the following
sequence (abbreviated):

rproc_add()
  rproc_fw_config_virtio()
    rproc_add_virtio_dev()
      rpmsg_probe()
        rproc_virtio_find_vqs()
          rproc_alloc_vring()
          rproc_alloc_vring()
          rproc_boot()
            rproc->ops->start()
        dma_alloc_coherent() <- rpmsg buffers after start()
      rpmsg_probe()
        rproc_virtio_find_vqs()
          rproc_alloc_vring( <- vrings after start()!!!
          rproc_alloc_vring()
          rproc_boot()
        dma_alloc_coherent()
        virtqueue_add_inbuf()
      ...

I.e. we allocated vrings for the first virtio device, booted the
remoteproc and then allocate rpmsg buffers.

I accidentally screwed up the order of things when I introduced [2], so
in v4.9 we actually do:

rproc_add()
  rproc_fw_config_virtio()
    rproc_boot()
      rproc_add_virtio_dev()
        rpmsg_probe()
          rproc_virtio_find_vqs()
            rproc_alloc_vring()
            rproc_alloc_vring()
          dma_alloc_coherent() <- rpmsg buffers now before start()
        rpmsg_probe()
          rproc_virtio_find_vqs()
            rproc_alloc_vring() <- secondary vrings before start()
            rproc_alloc_vring()
          dma_alloc_coherent()
      rproc->ops->start()

As you point out we would here allocate the rpmsg buffers and add those
to the virtqueues. The rpmsg buffers are however added and removed from
the virtqueues dynamically, so this should not impact the firmware - it
has to be able to cope with a shortage of send buffers anyways.

The real difference was that we with this change allocated vrings for
all virtio devices, not only the first.

(And if someone has out-of-tree patches for static rpmsg devices these
will be probed before we actually start the remoteproc)


With the subdevices series in place ([1] in particular) the order is
changed to the following:

rproc_add()
  rproc_fw_config_virtio()
    rproc_boot()
      rproc_handle_vdev()
        rproc_alloc_vring()
        rproc_alloc_vring()
      rproc_handle_vdev()
        rproc_alloc_vring()
        rproc_alloc_vring()
      rproc->ops->start()
      rproc_probe_subdevices()
        rproc_add_virtio_dev()
          rpmsg_probe()
            rproc_virtio_find_vqs()
            dma_alloc_coherent()
          rpmsg_probe()
            rproc_virtio_find_vqs()
            dma_alloc_coherent()

With this the ordering wrt the first virtio device is restored and the
order of allocation for any additional virtio devices are now also
correct.


So, in my view the staged patches for v4.10 are doing the right thing
and it looks like v4.9 will be the outlier - but afaict this should be
fine (and we're too late to redesign it now).

[1] a863af5d4193 ("remoteproc: virtio: Anchor vring life cycle in vdev")
[2] ddf711872c9d ("remoteproc: Introduce auto-boot flag")

Regards,
Bjorn

> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f0f6ec1..15e9331 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -913,6 +913,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  		goto clean_up_resources;
>  	}
>  
> +	/* probe any subdevices for the remote processor */
> +	ret = rproc_probe_subdevices(rproc);
> +	if (ret) {
> +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> +			rproc->name, ret);
> +		goto clean_up_resources;
> +	}
> +
>  	/*
>  	 * The starting device has been given the rproc->table_ptr as the
>  	 * resource table. The address of the vring along with the other
> @@ -932,14 +940,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  		goto clean_up_resources;
>  	}
>  
> -	/* probe any subdevices for the remote processor */
> -	ret = rproc_probe_subdevices(rproc);
> -	if (ret) {
> -		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> -			rproc->name, ret);
> -		goto stop_rproc;
> -	}
> -
>  	rproc->state = RPROC_RUNNING;
>  
>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
> -- 
> 1.9.1
> 
