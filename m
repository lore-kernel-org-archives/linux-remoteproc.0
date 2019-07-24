Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 24 Jul 2019 14:37:37 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
Message-ID: <20190724203737.GA27783@bogus>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
To: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc: agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, jassisinghbrar@gmail.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Jul 11, 2019 at 09:11:02PM +0530, Gokul Sriram Palanisamy wrote:
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
