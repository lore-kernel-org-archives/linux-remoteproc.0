Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v2 6/6] rpmsg: glink: Free pending deferred work on remove
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
 <20191004222702.8632-7-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <e50eabc6-c8d3-f47f-dab8-91e85ad38fb8@codeaurora.org>
Date: Tue, 8 Oct 2019 18:17:21 -0700
MIME-Version: 1.0
In-Reply-To: <20191004222702.8632-7-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/4/2019 3:27 PM, Bjorn Andersson wrote:
> By just cancelling the deferred rx worker during GLINK instance teardown
> any pending deferred commands are leaked, so free them.
> 
> Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
> Cc: stable@vger.kernel.org
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
