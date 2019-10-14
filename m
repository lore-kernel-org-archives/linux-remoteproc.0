Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 14 Oct 2019 09:40:46 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Message-ID: <20191014144046.GA23210@bogus>
References: <20191011132928.9388-1-govinds@codeaurora.org>
 <20191011132928.9388-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011132928.9388-2-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org, sboyd@kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 11 Oct 2019 18:59:27 +0530, Govind Singh wrote:
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/clock/qcom,q6sstopcc.yaml        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
