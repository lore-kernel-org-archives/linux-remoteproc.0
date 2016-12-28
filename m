Return-Path: <sboyd@codeaurora.org>
Date: Wed, 28 Dec 2016 15:40:16 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 7/7] clk: qcom: Add GCC_MSS_RESET support
Message-ID: <20161228234016.GG17126@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-8-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-8-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/15, Avaneesh Kumar Dwivedi wrote:
> Add support to use reset control framework for resetting MSS
> with hexagon v56 1.5.0.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next. I take it the dts part won't be landing in
v4.11 so no need to make a special branch for this new define.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
