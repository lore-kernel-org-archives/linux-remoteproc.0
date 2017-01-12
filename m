Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 12 Jan 2017 10:39:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 2/3] dt-binding: remoteproc: Introduce DT binding for
 Qualcomm slpi subsystem.
Message-ID: <20170112183916.GI10531@minitux>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484229217-23364-3-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 12 Jan 05:53 PST 2017, Avaneesh Kumar Dwivedi wrote:

> This document defines the binding for a component that loads firmware
> and control the life cycle of the Qualcomm slpi core.

Rather than duplicating the adsp binding I think we should just amend
the adsp binding - and probably rename the file.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt b/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt
[..]
> += EXAMPLE
[..]
> +		clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
> +				<&rpmcc MSM8996_RPM_SMD_AGGR2_NOC_CLK>;
> +		clock-names = "xo",
> +					"aggre2";
> +

I still haven't managed to acquire the block diagram for this chip and
we have ongoing msm_bus discussions, but I believe we want something
representing a bus to control this clock.

Regards,
Bjorn
