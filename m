Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
Date: Thu, 5 Sep 2019 13:13:53 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] rpmsg: glink-smem: Name the edge based on parent
 remoteproc
Message-ID: <20190905111353.GA1936@centauri>
References: <20190820041656.17197-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820041656.17197-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Aug 19, 2019 at 09:16:56PM -0700, Bjorn Andersson wrote:
> Naming the glink edge device on the parent of_node short name causes
> collisions when multiple remoteproc instances with only different unit
> address are described on the platform_bus in DeviceTree.
> 
> Base the edge's name on the parent remoteproc's name instead, to ensure
> that it's unique.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 64a5ce324c7f..4238383d8685 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -201,7 +201,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
>  	dev->parent = parent;
>  	dev->of_node = node;
>  	dev->release = qcom_glink_smem_release;
> -	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
> +	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
>  	ret = device_register(dev);
>  	if (ret) {
>  		pr_err("failed to register glink edge\n");
> -- 
> 2.18.0
> 

This was sent 19 of August, then again (unchanged) on 29 of August.

Yet it is still not in linux-next.
It fixes a real issue on qcs404, so please merge :)


Kind regards,
Niklas
