Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v2 1/6] rpmsg: glink: Fix reuse intents memory leak issue
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
 <20191004222702.8632-2-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <22fc76bf-9d2e-f016-fb63-a481f69f0a6c@codeaurora.org>
Date: Tue, 8 Oct 2019 17:49:29 -0700
MIME-Version: 1.0
In-Reply-To: <20191004222702.8632-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/4/2019 3:26 PM, Bjorn Andersson wrote:
> From: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> Memory allocated for re-usable intents are not freed during channel
> cleanup which causes memory leak in system.
> 
> Check and free all re-usable memory to avoid memory leak.
> 
> Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents")
> Cc: stable@vger.kernel.org
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
