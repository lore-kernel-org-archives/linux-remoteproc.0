Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 22 Nov 2019 17:12:54 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/16] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding for SC7180
Message-ID: <20191122231254.GA10382@bogus>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e807856d0-14dc2e21-4406-4150-8ffb-6982e37fc3cb-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e807856d0-14dc2e21-4406-4150-8ffb-6982e37fc3cb-000000@us-west-2.amazonses.com>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 18 Nov 2019 21:43:20 +0000, Sibi Sankar wrote:
> Add a new modem compatible string for Qualcomm SC7180 SoCs and introduce
> the "qcom,halt-nav-regs" bindings needed by the modem sub-system running
> on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
