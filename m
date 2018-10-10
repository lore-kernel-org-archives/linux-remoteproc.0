Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 9 Oct 2018 23:10:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH -next] remoteproc: qcom: qcom_q6v5_adsp: Fix some return
 value check
Message-ID: <20181010061015.GR12063@builder>
References: <1539143979-82369-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539143979-82369-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rohit kumar <rohitkr@codeaurora.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 09 Oct 20:59 PDT 2018, Wei Yongjun wrote:

> In case of error, the functions devm_kcalloc() and devm_ioremap()
> returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return
> value check should be replaced with NULL test.
> 
> Also removed -EPROBE_DEFER check since devm_kcalloc never return
> this error.
> 
> Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks Wei, applied to rproc-next

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 3285a8b..79374d1 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -295,12 +295,8 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
>  	adsp->num_clks = ARRAY_SIZE(adsp_clk_id);
>  	adsp->clks = devm_kcalloc(adsp->dev, adsp->num_clks,
>  				sizeof(*adsp->clks), GFP_KERNEL);
> -	if (IS_ERR(adsp->clks)) {
> -		ret = PTR_ERR(adsp->clks);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(adsp->dev, "failed to get adsp clock");
> -		return ret;
> -	}
> +	if (!adsp->clks)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < adsp->num_clks; i++)
>  		adsp->clks[i].id = adsp_clk_id[i];
> @@ -337,9 +333,9 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	adsp->qdsp6ss_base = devm_ioremap(&pdev->dev, res->start,
>  			resource_size(res));
> -	if (IS_ERR(adsp->qdsp6ss_base)) {
> +	if (!adsp->qdsp6ss_base) {
>  		dev_err(adsp->dev, "failed to map QDSP6SS registers\n");
> -		return PTR_ERR(adsp->qdsp6ss_base);
> +		return -ENOMEM;
>  	}
>  
>  	syscon = of_parse_phandle(pdev->dev.of_node, "qcom,halt-regs", 0);
> 
