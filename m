Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v4 1/5] soc: qcom: Introduce QMI encoder/decoder
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-2-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <f0d18551-f96f-dd4a-4710-93b293a57f3f@codeaurora.org>
Date: Thu, 30 Nov 2017 09:17:05 -0800
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> Add the helper library for encoding and decoding QMI encoded messages.
> The implementation is taken from lib/qmi_encdec.c of the Qualcomm kernel
> (msm-3.18).
> 
> Modifications has been made to the public API, source buffers has been
> made const and the debug-logging part was omitted, for now.
> 
> Tested-By: Chris Lew <clew@codeaurora.org>
> Tested-By: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
