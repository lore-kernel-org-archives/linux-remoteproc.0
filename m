Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v2 2/6] rpmsg: glink: Fix use after free in open_ack
 TIMEOUT case
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
 <20191004222702.8632-3-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <3db040ee-6b0f-be45-0e23-ab65f16329b6@codeaurora.org>
Date: Tue, 8 Oct 2019 17:51:05 -0700
MIME-Version: 1.0
In-Reply-To: <20191004222702.8632-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/4/2019 3:26 PM, Bjorn Andersson wrote:
> From: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> Extra channel reference put when remote sending OPEN_ACK after timeout
> causes use-after-free while handling next remote CLOSE command.
> 
> Remove extra reference put in timeout case to avoid use-after-free.
> 
> Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
> Cc: stable@vger.kernel.org
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
