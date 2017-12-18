Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH] rpmsg: glink: smem: Ensure ordering during tx
References: <20171214201546.21942-1-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <dc10f17f-a4ac-911b-391e-ad46af7b1f01@codeaurora.org>
Date: Mon, 18 Dec 2017 14:09:24 -0800
MIME-Version: 1.0
In-Reply-To: <20171214201546.21942-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 12/14/2017 12:15 PM, Bjorn Andersson wrote:
> Ensure the ordering of the fifo write and the update of the write index,
> so that the index is not updated before the data has landed in the fifo.
> 
> Reported-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
