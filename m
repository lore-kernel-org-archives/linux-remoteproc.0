Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 17 Oct 2018 15:08:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: qcom: wcss: Add non pas wcss Q6
 support for QCS404
Message-ID: <20181017200844.GA25486@bogus>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-7-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539337244-9505-7-git-send-email-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Oct 12, 2018 at 03:10:44PM +0530, Govind Singh wrote:
> Add non PAS WCSS remoteproc driver support for QCS404 SOC.
> Add WCSS q6 bootup and shutdown sequence handled from
> Application Processor SubSystem(APSS).
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/remoteproc/qcom_q6v5_wcss.c                | 638 +++++++++++++++++++--
>  2 files changed, 601 insertions(+), 38 deletions(-)
