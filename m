Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20190109170010.15430-1-sibis@codeaurora.org>
In-Reply-To: <20190109170010.15430-1-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Jan 2019 13:06:42 -0800
Message-ID: <CAD=FV=Xu3m5=ByHo_38T=H2cm4VqkndVjJ1rUkD2gp-2SWFXdQ@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Wed, Jan 9, 2019 at 9:00 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> v5:
>   * Use qmp_aop updated dt binding

nit: since this is now a singleton patch in v5 (because patches #1 -
#7 landed), the general policy is to drop the "8/8" in the subject.
AKA I believe the subject of the patch ought to have been:

[PATCH v5] arm64: dts: qcom: sdm845: Add Q6V5 MSS node


> v3:
>   * with shutdown-ack irq redesign make it mandatory,
>     merge multiple patches into a single one
>
> v2:
>   * Fixed style changes
>   * Added missing clocks in the dt-bindings
>   * Split mss remoteproc node into a number of patches
>
> This patch depends on the following bindings:
> https://patchwork.kernel.org/patch/10662089/ - mba/mpss reserved regions
> https://patchwork.kernel.org/patch/10657325/ - pdc reset node
> https://patchwork.kernel.org/patch/10753659/ - rpmhpd dt node
> https://patchwork.kernel.org/patch/10749469/ - AOP QMP dt bindings
> https://patchwork.kernel.org/patch/10751757/ - shutdown-irq binding
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 60 ++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 5da9fa1feb8a..e021b15f87fd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1366,6 +1366,66 @@
>                         };
>                 };
>
> +               remoteproc@4080000 {

It would be handy if you added a label here, AKA:

mss_pil: remoteproc@4080000 {

It's expected that boards will need to refer to this node so that they
can provide a firmware-name, so you need to give them a label to grab
onto.

...and actually, I wonder if boards will also need to be able to set
status = "okay"?  Right now they don't because you don't have a status
= "disabled" in sdm845.dtsi, but maybe you should?  Are there ever
going to be any boards with sdm845 that don't hook up the modem?


-Doug
