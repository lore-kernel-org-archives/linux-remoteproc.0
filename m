Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Oct 2017 21:27:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1] rpmsg: glink: Initialize the "intent_req_comp"
 completion variable
Message-ID: <20171031042715.GL1275@minitux>
References: <1509342085-15185-1-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509342085-15185-1-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 29 Oct 22:41 PDT 2017, Arun Kumar Neelakantam wrote:

> The "intent_req_comp" variable is used without initialization which
> results in NULL pointer dereference in qcom_glink_request_intent().
> 
> we need to initialize the completion variable before using it.
> 
> Fixes: 27b9c5b66b23 ("rpmsg: glink: Request for intents when unavailable")
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>

Thanks, applied.

Regards,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_native.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 5dcc9bf..fcd46ab 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -227,6 +227,7 @@ static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>  
>  	init_completion(&channel->open_req);
>  	init_completion(&channel->open_ack);
> +	init_completion(&channel->intent_req_comp);
>  
>  	INIT_LIST_HEAD(&channel->done_intents);
>  	INIT_WORK(&channel->intent_work, qcom_glink_rx_done_work);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
