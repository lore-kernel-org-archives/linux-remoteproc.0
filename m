Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 7 Nov 2016 23:08:05 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/3] remoteproc: qcom: Embed private data structure
 for hexagon dsp.
Message-ID: <20161108070805.GL25787@tuxbot>
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
 <1478522240-11036-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478522240-11036-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 07 Nov 04:37 PST 2016, Avaneesh Kumar Dwivedi wrote:

> Embed resources specific to version of hexagon chip in device
> structure to avoid conditional check for manipulation of those
> resources in driver code.
> 

Please don't rename functions in the same patch as functional changes.

[..]
>  
> -static int q6v5_probe(struct platform_device *pdev)
> +static int q6_probe(struct platform_device *pdev)
>  {
>  	struct q6v5 *qproc;
>  	struct rproc *rproc;
> +	const struct q6_rproc_res *desc;
>  	int ret;
>  
> -	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
> -			    MBA_FIRMWARE_NAME, sizeof(*qproc));
> +	desc = of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6_ops,

If you didn't rename q6v5_ops the patch would look cleaner.

> +			    desc->q6_mba_image, sizeof(*qproc));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "failed to allocate rproc\n");
>  		return -ENOMEM;
>  	}
>  
> -	rproc->fw_ops = &q6v5_fw_ops;
> +	rproc->fw_ops = &q6_fw_ops;
>  
>  	qproc = (struct q6v5 *)rproc->priv;
>  	qproc->dev = &pdev->dev;
> @@ -826,6 +869,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	init_completion(&qproc->start_done);
>  	init_completion(&qproc->stop_done);
>  
> +	qproc->q6_rproc_res = desc;
>  	ret = q6v5_init_mem(qproc, pdev);
>  	if (ret)
>  		goto free_rproc;
> @@ -842,7 +886,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	ret = q6v5_init_reset(qproc);
> +	ret = qproc->q6_rproc_res->q6_reset_init(qproc, pdev);
>  	if (ret)
>  		goto free_rproc;
>  
> @@ -873,14 +917,12 @@ static int q6v5_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  
>  	return 0;
> -

Please don't do "random" cleanups.

>  free_rproc:
>  	rproc_free(rproc);
> -
>  	return ret;
>  }
>  
> -static int q6v5_remove(struct platform_device *pdev)
> +static int q6_remove(struct platform_device *pdev)
>  {
>  	struct q6v5 *qproc = platform_get_drvdata(pdev);
>  
> @@ -890,20 +932,80 @@ static int q6v5_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id q6v5_of_match[] = {
> -	{ .compatible = "qcom,q6v5-pil", },
> +char *proxy_8x96_reg_str[] = {"mx", "cx", "vdd_pll"};

This list is the same in both versions, so no need to define it here.

> +int  proxy_8x96_reg_action[3][2] = { {0, 1}, {1, 1}, {1, 0} };

This is just a magic matrix, please use a struct with some descriptive
names for these. I presume they represents "matching index in reg_load
and reg_min_voltage is non-zero and should be used" - in which case it
shouldn't be needed at all.

> +int  proxy_8x96_reg_load[] = {0, 100000, 100000};
> +int  proxy_8x96_reg_min_voltage[] = {1050000, 1250000, 0};
> +char *proxy_8x96_clk_str[] = {"xo", "pnoc", "qdss"};
> +char *active_8x96_clk_str[] = {"iface", "bus", "mem", "gpll0_mss_clk",
> +		"snoc_axi_clk", "mnoc_axi_clk"};

All these needs to be static, but I would prefer if you just put the
values directly into the resource structs below.

> +
> +static const struct q6_rproc_res msm_8996_res = {
> +	.proxy_clks = proxy_8x96_clk_str,
> +	.proxy_clk_cnt = 3,

It's common practice to use a NULL terminator in the definition list
rather than keeping separate count of the number of items.

While acquiring the resources you would have to "calculate" the number
and store it in the q6v5 struct, but this would make turn this struct
into something only used during probe() - which is nice.

> +	.active_clks = active_8x96_clk_str,
> +	.active_clk_cnt = 6,
> +	.proxy_regs = proxy_8x96_reg_str,
> +	.active_regs = NULL,
> +	.proxy_reg_action = (int **)proxy_8x96_reg_action,
> +	.proxy_reg_load = (int *)proxy_8x96_reg_load,
> +	.active_reg_action = NULL,
> +	.active_reg_load = NULL,
> +	.proxy_reg_voltage = (int *)proxy_8x96_reg_min_voltage,
> +	.active_reg_voltage = NULL,
> +	.proxy_reg_cnt = 3,
> +	.active_reg_cnt = 0,
> +	.q6_reset_init = q6v56_init_reset,
> +	.q6_version = "v56",

q6_version would be better to have as a enum.

> +	.q6_mba_image = "mba.mbn",
> +};
> +
> +char *proxy_8x16_reg_str[] = {"mx", "cx", "pll"};
> +char *active_8x16_reg_str[] = {"mss"};
> +int  proxy_8x16_reg_action[4][2] = { {0, 1}, {1, 0}, {1, 0} };
> +int  active_8x16_reg_action[1][2] = { {1, 1} };
> +int  proxy_8x16_reg_load[] = {100000, 0, 100000, 100000};
> +int  active_8x16_reg_load[] = {100000};
> +int  proxy_8x16_reg_min_voltage[] = {1050000, 0, 0};
> +int  active_8x16_reg_min_voltage[] = {1000000};
> +char *proxy_8x16_clk_str[] = {"xo"};
> +char *active_8x16_clk_str[] = {"iface", "bus", "mem"};
> +
> +static const struct q6_rproc_res msm_8916_res = {
> +	.proxy_clks = proxy_8x16_clk_str,
> +	.proxy_clk_cnt = 1,
> +	.active_clks = active_8x16_clk_str,
> +	.active_clk_cnt = 3,
> +	.proxy_regs = proxy_8x16_reg_str,
> +	.active_regs = active_8x16_reg_str,
> +	.proxy_reg_action = (int **)proxy_8x16_reg_action,
> +	.proxy_reg_load = (int *)proxy_8x16_reg_load,
> +	.active_reg_action = (int **)active_8x16_reg_action,
> +	.active_reg_load = (int *)active_8x16_reg_load,
> +	.proxy_reg_voltage = (int *)proxy_8x16_reg_min_voltage,
> +	.active_reg_voltage = active_8x16_reg_min_voltage,
> +	.proxy_reg_cnt = 3,
> +	.active_reg_cnt = 1,
> +	.q6_reset_init = q6v5_init_reset,
> +	.q6_version = "v5",
> +	.q6_mba_image = "mba.b00",

q6v55 (msm8916) also uses mba.mbn, while q6v5 (msm8974) uses mba.b00.

> +};
> +
> +static const struct of_device_id q6_of_match[] = {
> +	{ .compatible = "qcom,q6v5-pil", .data = &msm_8916_res},

As I was looking in the CAF tree, I believe the correct version for 8916
is 5.5 and v5 was used in 8974.

But I presume these versions are not strictly tied to certain platforms,
so please name the resource structs based on the q6v5 version, rather
than platforms.

> +	{ .compatible = "qcom,q6v56-pil", .data = &msm_8996_res},
>  	{ },
>  };
>  
> -static struct platform_driver q6v5_driver = {
> -	.probe = q6v5_probe,
> -	.remove = q6v5_remove,
> +static struct platform_driver q6_driver = {
> +	.probe = q6_probe,
> +	.remove = q6_remove,
>  	.driver = {
>  		.name = "qcom-q6v5-pil",
> -		.of_match_table = q6v5_of_match,
> +		.of_match_table = q6_of_match,
>  	},
>  };
> -module_platform_driver(q6v5_driver);
> +module_platform_driver(q6_driver);
>  

Regards,
Bjorn
