Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 27 Aug 2018 20:08:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: Convert to using %pOFn instead of device_node.name
Message-ID: <20180828030847.GH5090@builder>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-42-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828015252.28511-42-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 27 Aug 18:52 PDT 2018, Rob Herring wrote:

> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied

Thanks,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  drivers/rpmsg/qcom_smd.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 2b5cf2790954..ab23da3d7131 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -205,7 +205,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
>  	dev->parent = parent;
>  	dev->of_node = node;
>  	dev->release = qcom_glink_smem_release;
> -	dev_set_name(dev, "%s:%s", node->parent->name, node->name);
> +	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
>  	ret = device_register(dev);
>  	if (ret) {
>  		pr_err("failed to register glink edge\n");
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da83a4ebadc..0dae7c9f4a8f 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1454,7 +1454,7 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  	edge->dev.release = qcom_smd_edge_release;
>  	edge->dev.of_node = node;
>  	edge->dev.groups = qcom_smd_edge_groups;
> -	dev_set_name(&edge->dev, "%s:%s", dev_name(parent), node->name);
> +	dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
>  	ret = device_register(&edge->dev);
>  	if (ret) {
>  		pr_err("failed to register smd edge\n");
> -- 
> 2.17.1
> 
