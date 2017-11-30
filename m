Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-4-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <8065b607-d251-e901-819e-d52ce7f10c55@codeaurora.org>
Date: Thu, 30 Nov 2017 09:35:26 -0800
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-4-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> remoteproc instances can be stopped either by invoking shutdown or by an
> attempt to recover from a crash. For some subdev types it's expected to
> clean up gracefully during a shutdown, but are unable to do so during a
> crash - so pass this information to the subdev remove functions.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
