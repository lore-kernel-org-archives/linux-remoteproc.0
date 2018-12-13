Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181120210828.12590-1-sibis@codeaurora.org>
In-Reply-To: <20181120210828.12590-1-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Dec 2018 14:05:18 -0800
Message-ID: <CAD=FV=WC7UQnNsbqwevhxML2Xmq3z4c7uiJ8ddn4tE2H3zAHZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Add power-domain bindings
 for Q6V5
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Ohad Ben Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Tue, Nov 20, 2018 at 1:08 PM Sibi Sankar <sibis@codeaurora.org> wrote:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 14947562bc67..bd9f4882fcf0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -75,6 +75,17 @@ on the Qualcomm Hexagon core.
>         Definition: reference to the regulators to be held on behalf of the
>                     booting of the Hexagon core
>
> +- power-domains:
> +       Usage: required

Assuming I understand correctly, presumably you want to say that it's
required to list _either_ power-domains or supplies.  Right now you
have the bindings saying that you need both regulators and
power-domains on all boards.


> +       Value type: <phandle>
> +       Definition: reference to the cx, mx and mss power-domains to be held on
> +                   behalf of the booting the Hexagon core
> +
> +- power-domain-names:
> +       Usage: required
> +       Value type: <stringlist>
> +       Definition: must be "cx", "mx", "mss"

Comparing to the patch you posted at
<https://lkml.kernel.org/r/20181127085828.17908-1-sibis@codeaurora.org>,
it seems like maybe you also need "aop" listed here?



-Doug
