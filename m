Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v4 2/5] soc: qcom: Introduce QMI helpers
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-3-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <e011eb7b-61c2-9784-caa5-0075c4f20f14@codeaurora.org>
Date: Thu, 30 Nov 2017 09:33:54 -0800
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> Drivers that needs to communicate with a remote QMI service all has to
> perform the operations of discovering the service, encoding and decoding
> the messages and operate the socket. This introduces an abstraction for
> these common operations, reducing most of the duplication in such cases.
> 
> Tested-By: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
