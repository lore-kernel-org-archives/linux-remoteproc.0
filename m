Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH 2/2] rpmsg: glink: Fix memory leak in
 qcom_glink_alloc_intent()
References: <20170908103440.junitv63lrzc5ih5@mwanda>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <4f052d23-b632-2423-7201-a51d8815ea91@codeaurora.org>
Date: Fri, 8 Sep 2017 16:44:21 +0530
MIME-Version: 1.0
In-Reply-To: <20170908103440.junitv63lrzc5ih5@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 9/8/2017 4:04 PM, Dan Carpenter wrote:
> We need to free "intent" and "intent->data" on a couple error paths.
> 
> Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index fecb1dafa8f3..5dcc9bf1c5bc 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -635,19 +635,18 @@ qcom_glink_alloc_intent(struct qcom_glink *glink,
>  	unsigned long flags;
>  
>  	intent = kzalloc(sizeof(*intent), GFP_KERNEL);
> -
>  	if (!intent)
>  		return NULL;
>  
>  	intent->data = kzalloc(size, GFP_KERNEL);
>  	if (!intent->data)
> -		return NULL;
> +		goto free_intent;
>  
>  	spin_lock_irqsave(&channel->intent_lock, flags);
>  	ret = idr_alloc_cyclic(&channel->liids, intent, 1, -1, GFP_ATOMIC);
>  	if (ret < 0) {
>  		spin_unlock_irqrestore(&channel->intent_lock, flags);
> -		return NULL;
> +		goto free_data;
>  	}
>  	spin_unlock_irqrestore(&channel->intent_lock, flags);
>  
> @@ -656,6 +655,12 @@ qcom_glink_alloc_intent(struct qcom_glink *glink,
>  	intent->reuse = reuseable;
>  
>  	return intent;
> +
> +free_data:
> +	kfree(intent->data);
> +free_intent:
> +	kfree(intent);
> +	return NULL;

Acked-by: Sricharan R <sricharan@codeaurora.org>

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
