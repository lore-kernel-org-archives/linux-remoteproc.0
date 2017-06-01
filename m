Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 1 Jun 2017 13:33:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/4] remoteproc: qcom: Add support for mss remoteproc
 on msm8996
Message-ID: <20170601203324.GA12920@tuxbook>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-5-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496344641-6291-5-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Jun 12:17 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> This patch add support for mss boot on msm8996. Major changes
> include initializing mss rproc for msm8996, making appropriate
> change for executing mss reset sequence etc.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
>  drivers/remoteproc/qcom_q6v5_pil.c                 | 163 ++++++++++++++++++---
>  2 files changed, 140 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 92347fe..87a8e51 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
>  		    "qcom,msm8916-mss-pil",
>  		    "qcom,msm8974-mss-pil"

This blank line should be moved one step down.

> +		    "qcom,msm8996-mss-pil"
>  - reg:
>  	Usage: required
>  	Value type: <prop-encoded-array>

Apart from that I think this looks good.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
