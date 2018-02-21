Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH] rpmsg: glink: Use spinlock in tx path
References: <20180213190404.25026-1-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <f376c90c-513d-0148-7bd2-9aae2151fd2d@codeaurora.org>
Date: Wed, 21 Feb 2018 11:39:45 -0800
MIME-Version: 1.0
In-Reply-To: <20180213190404.25026-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

Minor issue with the glink patch.

Thanks,
Chris

On 2/13/2018 11:04 AM, Bjorn Andersson wrote:

[..]
> @@ -288,15 +288,14 @@ static int qcom_glink_tx(struct qcom_glink *glink,
>   			 const void *data, size_t dlen, bool wait)
>   {
>   	unsigned int tlen = hlen + dlen;
> +	unsigned long flags;
>   	int ret;
>   
>   	/* Reject packets that are too big */
>   	if (tlen >= glink->tx_pipe->length)
>   		return -EINVAL;
>   
> -	ret = mutex_lock_interruptible(&glink->tx_lock);
> -	if (ret)
> -		return ret;
> +	spin_lock_irqsave(&glink->tx_lock, flags);
>   

qcom_glink_tx will return an uninitialized ret value with removal of 
mutex_lock_interruptible.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
