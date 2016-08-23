Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 22 Aug 2016 21:39:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH -next] remoteproc: qcom: wcnss: Fix return value check in
 wcnss_probe()
Message-ID: <20160823043927.GA15161@tuxbot>
References: <1471790370-3127-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471790370-3127-1-git-send-email-weiyj.lk@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 21 Aug 07:39 PDT 2016, Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks Wei, applied to rproc-next.

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_wcnss.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 14c4585..1917de7 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -528,8 +528,8 @@ static int wcnss_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pmu");
>  	mmio = devm_ioremap_resource(&pdev->dev, res);
> -	if (!mmio) {
> -		ret = -ENOMEM;
> +	if (IS_ERR(mmio)) {
> +		ret = PTR_ERR(mmio);
>  		goto free_rproc;
>  	};
> 
