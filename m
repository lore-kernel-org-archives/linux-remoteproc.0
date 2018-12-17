Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-2-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-2-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Dec 2018 15:59:47 -0800
Message-ID: <CAD=FV=Ui6ys4R3nenix3USeRPAd_vVdrArXxdf-iEc=4QRhE+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: remoteproc: qcom: Add clock bindings
 for Q6V5
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 2:07 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt       | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
on msm8996")
Fixes: fb22022ff63d ("dt-bindings: remoteproc: Add Q6v5 Modem PIL
binding for SDM845")

...it probably doesn't matter too much but if we wanted to be really
careful we could split into two patches, one for the msm8996 and one
for sdm845.  I don't think people care that much about stable
backports of bindings though (someone can feel free to correct me)...


> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 9ff5b0309417..780adc043b37 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -39,13 +39,17 @@ on the Qualcomm Hexagon core.
>  - clocks:
>         Usage: required
>         Value type: <phandle>
> -       Definition: reference to the iface, bus and mem clocks to be held on
> -                   behalf of the booting of the Hexagon core
> +       Definition: reference to the list of 4 clocks for the modem sub-system
> +                   reference to the list of 8 clocks for the modem sub-system
> +                   on SDM845 SoCs

The above is confusing because you don't list the SoCs that are
supposed to use the 4 clocks.  How about instead:

Definition: reference to the clocks that match clock-names


>  - clock-names:
>         Usage: required
>         Value type: <stringlist>
> -       Definition: must be "iface", "bus", "mem"
> +       Definition: must be "iface", "bus", "mem", "xo" for the modem sub-system
> +                   must be "iface", "bus", "mem", "gpll0_mss", "snoc_axi",
> +                   "mnoc_axi", "prng", "xo" for the modem sub-system on SDM845
> +                   SoCs

Same here where it's confusing.  ...but also, it it correct?  As far
as I can tell you're missing msm8996.  It's better to just be explicit
and list each one, ideally without all the prose.

Definition: The clocks needed depend on the compatible string:

qcom,sdm845-mss-pil: "xo", "prng", "iface", "snoc_axi", "bus", "mem",
"gpll0_mss", "mnoc_axi"
qcom,msm8996-mss-pil: "xo", "pnoc", "iface", "bus", "mem", "gpll0_mss_clk"
qcom,msm8974-mss-pil: "xo", "iface", "bus", "mem"
qcom,msm8916-mss-pil: "xo", "iface", "bus", "mem"
qcom,q6v5-pil: "xo", "iface", "bus", "mem"

...as far as I can tell this binding is supposed to account for
"qcom,ipq8074-wcss-pil" too but it seems that one doesn't have
clock-names.


-Doug
