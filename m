Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Dec 2016 15:23:32 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/1] remoteproc: core: probe subdevices before booting
 coprocessor
Message-ID: <20161207232332.GJ30492@tuxbot>
References: <1481143768-16377-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481143768-16377-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Dec 12:49 PST 2016, Loic Pallardy wrote:

> With subdevice support introduction, coprocessor boot sequence has
> changed. Related coprocessor subdevices are now starting after firmware
> and resource table loading and coprocessor boot.
> 

...just as they always have been.

> But some subdevices can resources to allocate before coprocessor start,
> like rpmsg buffers allocation for example.
> 

"for example"?

I can think of numerous examples where rpmsg devices would need this
mechanism as well, but there's no guarantees that just because we probe
subdevices before we boot that these devices has had their chance to
probe and register their resources.

How would this work if some of the virtio drivers used by the firmware
are compiled as modules and not yet loaded or anything hitting an
EPROBE_DEFER?

> This patch probes subdevices just before loading resource table,
> to keep backward compatibility with existing firmwares.
> 

Backward compatibility with firmware written specifically for the
single, yet unreleased, version of the Linux kernel with this behavior?



I still believe that resources that are so strictly tied to the state of
the firmware should be declared as part of the remoteproc, not
registered by other devices that might or might not finish their
registration in time - unless those resources can be associated
to the remote dynamically.

Regards,
Bjorn

> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> v2: remove unused stop_rproc label
> 
>  drivers/remoteproc/remoteproc_core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f0f6ec1..61f06a7 100644
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
> @@ -932,22 +940,12 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
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
>  
>  	return 0;
>  
> -stop_rproc:
> -	rproc->ops->stop(rproc);
>  clean_up_resources:
>  	rproc_resource_cleanup(rproc);
>  clean_up:
> -- 
> 1.9.1
> 
