Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 30 Jul 2018 16:30:37 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/9] dt-bindings: soc: qcom: Add label for GLINK
 bindings
Message-ID: <20180730223037.GA17877@rob-hp-laptop>
References: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
 <1532693849-7037-2-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532693849-7037-2-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, arnaud.pouliquen@st.com, andy.gross@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jul 27, 2018 at 05:47:21PM +0530, Arun Kumar Neelakantam wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> There are GLINK clients who open the same channel on multiple GLINK
> links. These clients need a way to distinguish which remoteproc they
> are communicating to. Add a label property to identify the edge this
> node represents.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
