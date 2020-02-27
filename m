Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 27 Feb 2020 13:14:08 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 4/6] drivers: remoteproc: Add name field for every
 subdevice
Message-ID: <20200227201408.GB20116@xps15>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582167465-2549-5-git-send-email-sidgup@codeaurora.org>
To: Siddharth Gupta <sidgup@codeaurora.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, Rishabh Bhatnagar <rishabhb@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Feb 19, 2020 at 06:57:43PM -0800, Siddharth Gupta wrote:
> From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> 
> When a client driver wishes to utilize functionality from a particular
> subdevice of a remoteproc, it cannot differentiate between the subdevices
> that have been added. This patch allows the client driver to distinguish
> between subdevices and thus utilize their functionality.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c | 6 ++++++
>  include/linux/remoteproc.h       | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 60650bc..5d59538 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -58,6 +58,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> +	glink->subdev.name = kstrdup("glink", GFP_KERNEL);

Because @subdev is a member of qcom_rproc_glink (rather than a pointer), it is
possible to get to glink with container_of().  From there edge->name is
available - would that work?

>  
>  	rproc_add_subdev(rproc, &glink->subdev);
>  }
> @@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
>  	if (!glink->node)
>  		return;
>  
> +	kfree(glink->subdev.name);
>  	rproc_remove_subdev(rproc, &glink->subdev);
>  	of_node_put(glink->node);
>  }
> @@ -154,6 +156,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  	smd->dev = dev;
>  	smd->subdev.start = smd_subdev_start;
>  	smd->subdev.stop = smd_subdev_stop;
> +	smd->subdev.name = kstrdup("smd", GFP_KERNEL);

Same as above - qcom_smd_edge has a name.

Worse case scenario, both qcom_rproc_glink and qcom_smd_edge have a device_node
that can be used as well.

>  
>  	rproc_add_subdev(rproc, &smd->subdev);
>  }
> @@ -169,6 +172,7 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  	if (!smd->node)
>  		return;
>  
> +	kfree(smd->subdev.name);
>  	rproc_remove_subdev(rproc, &smd->subdev);
>  	of_node_put(smd->node);
>  }
> @@ -220,6 +224,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  			 const char *ssr_name)
>  {
>  	ssr->name = ssr_name;
> +	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
> @@ -233,6 +238,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>   */
>  void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>  {
> +	kfree(ssr->subdev.name);
>  	rproc_remove_subdev(rproc, &ssr->subdev);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e2eaba9..e2f60cc 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -519,6 +519,7 @@ struct rproc {
>  /**
>   * struct rproc_subdev - subdevice tied to a remoteproc
>   * @node: list node related to the rproc subdevs list
> + * @name: name of the subdevice
>   * @prepare: prepare function, called before the rproc is started
>   * @start: start function, called after the rproc has been started
>   * @stop: stop function, called before the rproc is stopped; the @crashed
> @@ -527,6 +528,7 @@ struct rproc {
>   */
>  struct rproc_subdev {
>  	struct list_head node;
> +	char *name;
>  
>  	int (*prepare)(struct rproc_subdev *subdev);
>  	int (*start)(struct rproc_subdev *subdev);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
