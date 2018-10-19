Date: Fri, 19 Oct 2018 11:35:14 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 0/5] Add coredump support for Q6v5 Modem remoteproc
Message-ID: <20181019183514.GU12063@builder>
References: <20181017135527.30592-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017135527.30592-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 17 Oct 06:55 PDT 2018, Sibi Sankar wrote:

> This patch series add coredump support for modem on SDM845, MSM8996
> and MSM8916 SoCs. Modem requires the mba to be loaded before a
> coredump can be performed and this is achieved using a custom per
> segment dump function.
> 
> V5:
>   Add software bypass to avoid high MX current in mpss_load error path.
>   Remove the proxy votes of clk/regs only after the active/reset clks/regs.
>   Reclaim MBA memory after mpss_load failure in mba_reclaim func.
>   Revert to dump_fn to as done with v3 with a mask based approach.
> 
> V4:
>   Addressed Bjorn's comments.
> 
> V3:
>   [bjorn]:replace prepare/unprepare ops with a more generalised per segment
>   dump function
> 
> V2:
>   Introduce prepare/unprepare ops for rproc coredump
> 

Applied

Regards,
Bjorn

> Sibi Sankar (5):
>   remoteproc: Introduce custom dump function for each remoteproc segment
>   remoteproc: Add mechanism for custom dump function assignment
>   remoteproc: qcom: q6v5-mss: Refactor mba load/unload sequence
>   remoteproc: qcom: q6v5-mss: Add custom dump function for modem
>   remoteproc: qcom: q6v5-mss: Register segments/dumpfn for coredump
> 
>  drivers/remoteproc/qcom_q6v5_mss.c   | 379 +++++++++++++++++----------
>  drivers/remoteproc/remoteproc_core.c |  55 +++-
>  include/linux/remoteproc.h           |  11 +
>  3 files changed, 303 insertions(+), 142 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
