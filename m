Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 12 Oct 2017 11:20:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 4/4] remoteproc: qcom: Add support for mss remoteproc
 on msm8996
Message-ID: <20171012182052.GG1165@minitux>
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-5-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500634173-24416-5-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 21 Jul 03:49 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> This patch add support for mss boot on msm8996. Major changes
> include initializing mss rproc for msm8996, making appropriate
> change for executing mss reset sequence etc.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
>  drivers/remoteproc/qcom_q6v5_pil.c                 | 164 ++++++++++++++++++---
>  2 files changed, 141 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 92347fe..87a8e51 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
>  		    "qcom,msm8916-mss-pil",
>  		    "qcom,msm8974-mss-pil"
>  
> +		    "qcom,msm8996-mss-pil"

I like the empty line, but it should be after the list, not in the
middle.

>  - reg:

Please fix this and add my Acked-by

Regards,
Bjorn
