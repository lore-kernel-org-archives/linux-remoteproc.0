Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 22 Nov 2019 17:15:03 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/16] dt-bindings: remoteproc: qcom: Add power-domain
 bindings for Q6V5 PAS
Message-ID: <20191122231503.GA13027@bogus>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80788d28-7370e0e3-7380-4cc7-9233-40b9fd76e8f3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e80788d28-7370e0e3-7380-4cc7-9233-40b9fd76e8f3-000000@us-west-2.amazonses.com>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 18 Nov 2019 21:43:34 +0000, Sibi Sankar wrote:
> Add power-domain bindings for Q6V5 PAS on MSM8974/MSM8996/QCS404/SDM845
> SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,adsp.txt         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
