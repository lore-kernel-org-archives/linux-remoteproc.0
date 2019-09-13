Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Message-ID: <5d7c0ec9.1c69fb81.a7d47.78c1@mx.google.com>
Date: Fri, 13 Sep 2019 16:48:57 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 08/12] dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-9-git-send-email-gokulsri@codeaurora.org>
Cc: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 13 Sep 2019 17:26:07 +0530, Gokul Sriram Palanisamy wrote:
> Add mailbox support required in IPQ8074 SoCs.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
