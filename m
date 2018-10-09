Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 8 Oct 2018 23:21:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-pil: add SCM probe dependency
Message-ID: <20181009062125.GA2518@tuxbook-pro>
References: <20181009020805.143982-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181009020805.143982-1-briannorris@chromium.org>
To: Sibi Sankar <sibis@codeaurora.org>, Brian Norris <briannorris@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 08 Oct 19:08 PDT 2018, Brian Norris wrote:

> Similar to qcom_q6v5_pas and qcom_wcnss drivers, probe will fail if SCM
> is not up.
> 

Thanks Brian, this dependency was introduced with the memory ownership
support.

I applied it with an updated conditional to make it explicit that it
related to need_mem_protection, updated the commit message to describe
actual relationship to the memory protection mechanism and added a
Fixes: tag.


Don't we also need to add the ability to disable need_mem_protection
when we're running ATF?

Regards,
Bjorn

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index a839b07a58b1..8836ca1bc0c1 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1151,6 +1151,9 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
>  			    desc->hexagon_mba_image, sizeof(*qproc));
>  	if (!rproc) {
