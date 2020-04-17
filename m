Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
References: <20200403175005.17130-1-elder@linaro.org>
 <20200403175005.17130-3-elder@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <1b1abaa2-8059-5a2a-aad1-841f8487632e@ti.com>
Date: Fri, 17 Apr 2020 11:26:57 -0500
MIME-Version: 1.0
In-Reply-To: <20200403175005.17130-3-elder@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/3/20 12:50 PM, Alex Elder wrote:
> If looking up the DT "firmware-name" property fails in q6v6_probe(),
> the function returns without freeing the remoteproc structure
> that has been allocated.  Fix this by jumping to the free_rproc
> label, which takes care of this.
> 

Please add the Fixes: line.

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ce49c3236ff7..60cdf699ea80 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1675,7 +1675,7 @@ static int q6v5_probe(struct platform_device *pdev)
>   	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
>   					    1, &qproc->hexagon_mdt_image);
>   	if (ret < 0 && ret != -EINVAL)
> -		return ret;
> +		goto free_rproc;
>   
>   	platform_set_drvdata(pdev, qproc);
>   
> 
