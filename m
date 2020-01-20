Date: Mon, 20 Jan 2020 11:37:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/4] Improve general readability of MSS on SC7180
Message-ID: <20200120193737.GL1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:

> This series aims to improve the general readability of the mss reset
> sequence on SC7180 SoCs. No functional change intended.
> 

Thanks Sibi, I picked up patch 2 and 3 for now.

Regards,
Bjorn

> Sibi Sankar (4):
>   remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
>   remoteproc: qcom: q6v5-mss: Improve readability across clk handling
>   remoteproc: qcom: q6v5-mss: Rename boot status timeout
>   remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 69 +++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 29 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
