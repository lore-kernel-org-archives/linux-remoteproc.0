Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
Date: Wed, 26 Sep 2018 18:58:59 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Rename Hexagon v5 modem driver
Message-ID: <20180926165859.GB1773@centauri.lan>
References: <20180924234526.22916-1-bjorn.andersson@linaro.org>
 <20180924234526.22916-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924234526.22916-3-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Sep 24, 2018 at 04:45:26PM -0700, Bjorn Andersson wrote:
> The qcom_q6v5_pil implements support for the self-authenticating modem
> subsystem. With the introduction of other q6v5 based non-TZ based
> remoteproc driver the current name is cause for confusion, so rename it
> to be more specific.
> 
> No functional change.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Chances since v2:
> - Updated module description, driver name and header comment
> 
>  drivers/remoteproc/Kconfig                         | 14 +++++++-------
>  drivers/remoteproc/Makefile                        |  2 +-
>  .../{qcom_q6v5_pil.c => qcom_q6v5_mss.c}           |  6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
>  rename drivers/remoteproc/{qcom_q6v5_pil.c => qcom_q6v5_mss.c} (99%)
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
