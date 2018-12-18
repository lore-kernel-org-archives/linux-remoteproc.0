Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-4-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-4-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Dec 2018 16:01:31 -0800
Message-ID: <CAD=FV=UVm=p4Vo7g5-9z0mEN2xD1JXHK-_1tj8WLvxzr04M0RQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: remoteproc: qcom: Add power-domain
 bindings for Q6V5
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add power-domain bindings for Q6V5 MSS on MSM8996 and SDM845 SoCs.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> v2:
>   * Add load_state power-domain
>   * List cx and mx power-domains for MSM8996
>
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 98894e6ad456..50695cd86397 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -80,6 +80,22 @@ on the Qualcomm Hexagon core.
>                     reference to the pll-supply regulator to be held on behalf
>                     of the booting of the Hexagon core on MSM8996 SoCs
>
> +- power-domains:
> +       Usage: required
> +       Value type: <phandle>
> +       Definition: reference to the list of 2 power-domains for the modem
> +                   sub-system on MSM8996 SoCs

This is truly required for msm8996 SoCs?  The code I'm looking at
doesn't try to get these power domains for 8996 so presumably you're
breaking backward compatibility with old device tree files by making
this required now.  I don't personally know how widespread msm8996
usage is w/ upstream, so I'd let Bjorn comment on whether he thinks
this is OK.

As with the other patches in this series, I personally prefer less
prose and more lists / tables of exactly what is required for which
compatible string.


> +                   reference to the list of 4 power-domains for the modem
> +                   sub-system on SDM845 SoCs
> +
> +- power-domain-names:
> +       Usage: required
> +       Value type: <stringlist>
> +       Definition: must be "cx", "mx" for the modem sub-system on MSM8996
> +                   SoCs
> +                   must be "cx", "mx", "mss", "load_state" for the modem
> +                   sub-system on SDM845 SoCs

I haven't see a patch for using "load_state".  Can you point at it?  I
guess this was "aop" in your last version?


-Doug
