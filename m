Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v2 5/6] rpmsg: glink: Don't send pending rx_done during
 remove
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
 <20191004222702.8632-6-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <3e4a7fe5-fc7a-b7d5-19bf-7fb8a26d8e55@codeaurora.org>
Date: Tue, 8 Oct 2019 18:08:46 -0700
MIME-Version: 1.0
In-Reply-To: <20191004222702.8632-6-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/4/2019 3:27 PM, Bjorn Andersson wrote:
> Attempting to transmit rx_done messages after the GLINK instance is
> being torn down will cause use after free and memory leaks. So cancel
> the intent_work and free up the pending intents.
> 
> With this there are no concurrent accessors of the channel left during
> qcom_glink_native_remove() and there is therefor no need to hold the
> spinlock during this operation - which would prohibit the use of
> cancel_work_sync() in the release function. So remove this.
> 
> Fixes: 1d2ea36eead9 ("rpmsg: glink: Add rx done command")
> Cc: stable@vger.kernel.org
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
