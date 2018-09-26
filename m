Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
Date: Wed, 26 Sep 2018 18:58:37 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: Rename Hexagon v5 PAS driver
Message-ID: <20180926165837.GA1773@centauri.lan>
References: <20180924234526.22916-1-bjorn.andersson@linaro.org>
 <20180924234526.22916-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924234526.22916-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Sep 24, 2018 at 04:45:25PM -0700, Bjorn Andersson wrote:
> The Hexagon v5 ADSP driver is used for more than only the ADSP and
> there's an upcoming non-PAS ADSP PIL for SDM845, so rename the driver to
> qcom_q6v5_pas in order to better suite this.
> 
> Cc: Rohit kumar <rohitkr@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Move the rename of qcom_q6v5_pil to the 2nd patch, where it belongs.
> 
>  drivers/remoteproc/Kconfig                    | 27 ++++++++++---------
>  drivers/remoteproc/Makefile                   |  2 +-
>  .../{qcom_adsp_pil.c => qcom_q6v5_pas.c}      |  4 +--
>  3 files changed, 17 insertions(+), 16 deletions(-)
>  rename drivers/remoteproc/{qcom_adsp_pil.c => qcom_q6v5_pas.c} (98%)
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
