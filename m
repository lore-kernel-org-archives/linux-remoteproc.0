Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v4 5/5] samples: Introduce Qualcomm QMI sample client
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-6-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <387d4624-f036-91ec-0948-8da3af664b7a@codeaurora.org>
Date: Thu, 30 Nov 2017 09:36:40 -0800
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-6-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> Introduce a sample driver that register for server notifications and
> spawn clients for each available test service (service 15). The spawned
> clients implements the interface for encoding "ping" and "data" requests
> and decode the responses from the remote.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Acked-By: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
