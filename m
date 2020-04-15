Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 15 Apr 2020 12:11:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 4/6] remoteproc: qcom: Add name field for every
 subdevice
Message-ID: <20200415181140.GF16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-5-git-send-email-sidgup@codeaurora.org>
To: Siddharth Gupta <sidgup@codeaurora.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, Rishabh Bhatnagar <rishabhb@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Apr 08, 2020 at 04:36:41PM -0700, Siddharth Gupta wrote:
> From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> 
> When a client driver wishes to utilize functionality from a particular
> subdevice of a remoteproc, it cannot differentiate between the subdevices
> that have been added. This patch allows the client driver to distinguish
> between subdevices and thus utilize their functionality.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/qcom_common.c | 6 ++++++
>  include/linux/remoteproc.h       | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 60650bc..1d2351b 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -56,6 +56,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
>  		return;
>  
>  	glink->dev = dev;
> +	glink->subdev.name = kstrdup("glink", GFP_KERNEL);
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
>  
> @@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
>  	if (!glink->node)
>  		return;
>  
> +	kfree(glink->subdev.name);
>  	rproc_remove_subdev(rproc, &glink->subdev);
>  	of_node_put(glink->node);
>  }
> @@ -152,6 +154,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  		return;
>  
>  	smd->dev = dev;
> +	smd->subdev.name = kstrdup("smd", GFP_KERNEL);
>  	smd->subdev.start = smd_subdev_start;
>  	smd->subdev.stop = smd_subdev_stop;
>  
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
> index c5d36e6..687e1eb 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -523,6 +523,7 @@ struct rproc {
>  /**
>   * struct rproc_subdev - subdevice tied to a remoteproc
>   * @node: list node related to the rproc subdevs list
> + * @name: name of the subdevice
>   * @prepare: prepare function, called before the rproc is started
>   * @start: start function, called after the rproc has been started
>   * @stop: stop function, called before the rproc is stopped; the @crashed
> @@ -531,6 +532,7 @@ struct rproc {
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
