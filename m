Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Message-ID: <5b8e8885.1c69fb81.971e7.0535@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: adsp: Add SDM845 ADSP and CDSP support
References: <20180828071458.26858-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828071458.26858-1-bjorn.andersson@linaro.org>
Date: Mon, 3 Sep 2018 19:26:19 -0500
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Aug 28, 2018 at 12:14:58AM -0700, Bjorn Andersson wrote:
> Add support for booting the Audio and Compute DSPs found in Qualcomm's
> SDM845 platform.
> 
> As with the previous platforms the power rail handling needs to be
> updated once the appropriate support lands upstream.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt     |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/remoteproc/qcom_q6v5_pas.c                   | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
