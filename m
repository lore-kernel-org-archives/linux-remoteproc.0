Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 25 Jun 2018 19:22:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH resend 1/5] remoteproc: Rename subdev functions to
 start/stop
Message-ID: <20180626022259.GH1860@tuxbook-pro>
References: <20180626013409.5125-1-elder@linaro.org>
 <20180626013409.5125-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180626013409.5125-2-elder@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 25 Jun 18:34 PDT 2018, Alex Elder wrote:

> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> "start" and "stop" are more suitable names for how these two operations
> are used, and they fit better with the upcoming introduction of two
> additional operations in the struct.
> 
> [elder@linaro.org: minor comment edits]
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Alex Elder <elder@linaro.org>
> Tested-by: Fabien Dessenne <fabien.dessenne@st.com>

Sorry for not spotting this before, but per section 11 of
Documentation/process/submitting-patches.rst the tag part should read:


Tested-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[elder@linaro.org: minor comment edits]
Signed-off-by: Alex Elder <elder@linaro.org>


I.e. as you're sending the email you must be the last one certifying the
origin of the patch.

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++--------------
>  include/linux/remoteproc.h           | 14 ++++++-------
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a9609d971f7f..5dd58e6bea88 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -774,13 +774,13 @@ static int rproc_handle_resources(struct rproc *rproc,
>  	return ret;
>  }
>  
> -static int rproc_probe_subdevices(struct rproc *rproc)
> +static int rproc_start_subdevices(struct rproc *rproc)
>  {
>  	struct rproc_subdev *subdev;
>  	int ret;
>  
>  	list_for_each_entry(subdev, &rproc->subdevs, node) {
> -		ret = subdev->probe(subdev);
> +		ret = subdev->start(subdev);
>  		if (ret)
>  			goto unroll_registration;
>  	}
> @@ -789,17 +789,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
>  
>  unroll_registration:
>  	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
> -		subdev->remove(subdev, true);
> +		subdev->stop(subdev, true);
>  
>  	return ret;
>  }
>  
> -static void rproc_remove_subdevices(struct rproc *rproc, bool crashed)
> +static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
>  {
>  	struct rproc_subdev *subdev;
>  
>  	list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
> -		subdev->remove(subdev, crashed);
> +		subdev->stop(subdev, crashed);
>  }
>  
>  /**
> @@ -901,8 +901,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  		return ret;
>  	}
>  
> -	/* probe any subdevices for the remote processor */
> -	ret = rproc_probe_subdevices(rproc);
> +	/* Start any subdevices for the remote processor */
> +	ret = rproc_start_subdevices(rproc);
>  	if (ret) {
>  		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>  			rproc->name, ret);
> @@ -1014,8 +1014,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> -	/* remove any subdevices for the remote processor */
> -	rproc_remove_subdevices(rproc, crashed);
> +	/* Stop any subdevices for the remote processor */
> +	rproc_stop_subdevices(rproc, crashed);
>  
>  	/* the installed resource table is no longer accessible */
>  	rproc->table_ptr = rproc->cached_table;
> @@ -1657,16 +1657,16 @@ EXPORT_SYMBOL(rproc_del);
>   * rproc_add_subdev() - add a subdevice to a remoteproc
>   * @rproc: rproc handle to add the subdevice to
>   * @subdev: subdev handle to register
> - * @probe: function to call when the rproc boots
> - * @remove: function to call when the rproc shuts down
> + * @start: function to call after the rproc is started
> + * @stop: function to call before the rproc is stopped
>   */
>  void rproc_add_subdev(struct rproc *rproc,
>  		      struct rproc_subdev *subdev,
> -		      int (*probe)(struct rproc_subdev *subdev),
> -		      void (*remove)(struct rproc_subdev *subdev, bool crashed))
> +		      int (*start)(struct rproc_subdev *subdev),
> +		      void (*stop)(struct rproc_subdev *subdev, bool crashed))
>  {
> -	subdev->probe = probe;
> -	subdev->remove = remove;
> +	subdev->start = start;
> +	subdev->stop = stop;
>  
>  	list_add_tail(&subdev->node, &rproc->subdevs);
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index dfdaede9139e..bf55bf2a5ee1 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -477,15 +477,15 @@ struct rproc {
>  /**
>   * struct rproc_subdev - subdevice tied to a remoteproc
>   * @node: list node related to the rproc subdevs list
> - * @probe: probe function, called as the rproc is started
> - * @remove: remove function, called as the rproc is being stopped, the @crashed
> - *	    parameter indicates if this originates from the a recovery
> + * @start: start function, called after the rproc has been started
> + * @stop: stop function, called before the rproc is stopped; the @crashed
> + *	    parameter indicates if this originates from a recovery
>   */
>  struct rproc_subdev {
>  	struct list_head node;
>  
> -	int (*probe)(struct rproc_subdev *subdev);
> -	void (*remove)(struct rproc_subdev *subdev, bool crashed);
> +	int (*start)(struct rproc_subdev *subdev);
> +	void (*stop)(struct rproc_subdev *subdev, bool crashed);
>  };
>  
>  /* we currently support only two vrings per rvdev */
> @@ -568,8 +568,8 @@ static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
>  
>  void rproc_add_subdev(struct rproc *rproc,
>  		      struct rproc_subdev *subdev,
> -		      int (*probe)(struct rproc_subdev *subdev),
> -		      void (*remove)(struct rproc_subdev *subdev, bool crashed));
> +		      int (*start)(struct rproc_subdev *subdev),
> +		      void (*stop)(struct rproc_subdev *subdev, bool crashed));
>  
>  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
>  
> -- 
> 2.17.1
> 
