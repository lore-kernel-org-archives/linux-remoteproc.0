Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 071/102] remoteproc/keystone: explicitly request exclusive
 reset control
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
 <20170719152646.25903-72-p.zabel@pengutronix.de>
From: Suman Anna <s-anna@ti.com>
Message-ID: <0756b169-6f70-5919-020b-367df898dc3f@ti.com>
Date: Wed, 19 Jul 2017 11:59:09 -0500
MIME-Version: 1.0
In-Reply-To: <20170719152646.25903-72-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 07/19/2017 10:26 AM, Philipp Zabel wrote:
> Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> reset lines") started to transition the reset control request API calls
> to explicitly state whether the driver needs exclusive or shared reset
> control behavior. Convert all drivers requesting exclusive resets to the
> explicit API call so the temporary transition helpers can be removed.
> 
> No functional changes.
> 
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/remoteproc/keystone_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 5f776bfd674a0..920fef072b364 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -410,7 +410,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	ksproc->reset = devm_reset_control_get(dev, NULL);
> +	ksproc->reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(ksproc->reset)) {
>  		ret = PTR_ERR(ksproc->reset);
>  		goto free_rproc;
> 
