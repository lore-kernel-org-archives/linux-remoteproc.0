Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v4 4/5] remoteproc: qcom: Introduce sysmon
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-5-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <2a4cb3e2-16ea-49f4-e40d-ee1f2a56929b@codeaurora.org>
Date: Thu, 30 Nov 2017 17:52:48 -0800
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/29/2017 5:16 PM, Bjorn Andersson wrote:
> The sysmon client communicates either via a dedicated SMD/GLINK channel
> or via QMI encoded messages over IPCROUTER with remote processors in
> order to perform graceful shutdown and inform about other remote
> processors shutting down.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
Acked-By: Chris Lew <clew@codeaurora.org>

Looked into who is listening to the other notifications besides 
BEFORE_SHUTDOWN and I think subsequent patches will need to add support 
for at least AFTER_POWERUP.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
