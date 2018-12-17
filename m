Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 17 Dec 2018 14:48:15 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] remoteproc: qcom: wcss: Add non pas wcss Q6
 support for QCS404
Message-ID: <20181217204815.GA17099@bogus>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-7-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215103557.2748-7-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, Dec 15, 2018 at 04:05:56PM +0530, Govind Singh wrote:
> Add non PAS WCSS remoteproc driver support for QCS404 SOC.
> Add WCSS q6 bootup and shutdown sequence handled from
> Application Processor SubSystem(APSS).
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++

Please add acks/reviewed-bys when posting new versions.

In the future, please split bindings to a separate patch.

>  drivers/remoteproc/qcom_q6v5_wcss.c           | 544 +++++++++++++++++-
>  2 files changed, 577 insertions(+), 28 deletions(-)
