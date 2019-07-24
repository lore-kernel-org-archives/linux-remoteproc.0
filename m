Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 24 Jul 2019 14:38:15 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/12] dt-bindings: firmware: qcom: Add compatible for
 IPQ8074 SoC
Message-ID: <20190724203815.GA29982@bogus>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-11-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562859668-14209-11-git-send-email-gokulsri@codeaurora.org>
To: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, jassisinghbrar@gmail.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 11 Jul 2019 21:11:06 +0530, Gokul Sriram Palanisamy wrote:
> Add compatible for IPQ8074 support.
> This does not need clocks for scm calls.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
