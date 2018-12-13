Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181127085828.17908-1-sibis@codeaurora.org>
In-Reply-To: <20181127085828.17908-1-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Dec 2018 14:17:11 -0800
Message-ID: <CAD=FV=U+LHa0QpPuZhd04=WkMrrM1kBUYhkS9RqSSR6uLijbBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Tue, Nov 27, 2018 at 12:58 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> The remoteproc mss node depends on the following bindings:
> https://patchwork.kernel.org/patch/10490559/ - rpmhp dt bindings

This is an older version of the patch.  Now at v7 at
<https://patchwork.kernel.org/patch/10725801/>


> https://patchwork.kernel.org/patch/10678301/ - AOP QMP dt bindings
> https://patchwork.kernel.org/patch/10691215/ - mss power-domain dt bindings
> https://patchwork.kernel.org/patch/10691213/ - shutdown-ack dt bindings
>
> It also depends on the mpss and mba memory regions and pdc reset node.
> https://patchwork.kernel.org/patch/10662089/
> https://patchwork.kernel.org/patch/10657325/
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 63 ++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 58870273dbc9..df16ee464872 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1095,6 +1095,69 @@
>                         };
>                 };
>
> +               remoteproc@4080000 {
> +                       compatible = "qcom,sdm845-mss-pil";
> +                       reg = <0x04080000 0x408>, <0x04180000 0x48>;

s/0x04080000/0x4080000 to appease the DT folks.


> +                       reg-names = "qdsp6", "rmb";
> +
> +                       interrupts-extended =
> +                               <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +
> +                       interrupt-names = "wdog", "fatal", "ready",
> +                                         "handover", "stop-ack",
> +                                         "shutdown-ack";

nit: maybe remove blank line between "interrupts-extended" and
"interrupt-names".  Nice to keep -names close to the things they're
naming.


> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +                                <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +                                <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +                                <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +                                <&gcc GCC_MSS_MFAB_AXIS_CLK>,
> +                                <&gcc GCC_PRNG_AHB_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +
> +                       clock-names = "iface", "bus", "mem", "gpll0_mss",
> +                                     "snoc_axi", "mnoc_axi", "prng", "xo";

Bindings list clock-names as "iface", "bus", "mem".  You have "iface",
"bus", "mem", "gpll0_mss", "snoc_axi", "mnoc_axi", "prng", "xo".  It
looks like these extra clocks were added in commit 231f67d1fb2f
("remoteproc: q6v5: Add support for mss remoteproc on SDM845") but you
forgot to update the bindings.  Looking in that patch I also see an
"axis2" which you seem to be missing.  Do you need it?


> +                       qcom,smem-states = <&modem_smp2p_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +                       reset-names = "mss_restart", "pdc_reset";
> +
> +                       qcom,halt-regs = <&tcsr_mutex_regs
> +                                               0x23000 0x25000 0x24000>;
> +
> +                       power-domains = <&aoss_qmp_pd AOSS_QMP_LS_MODEM>,
> +                                       <&rpmhpd SDM845_CX>,
> +                                       <&rpmhpd SDM845_MX>,
> +                                       <&rpmhpd SDM845_MSS>;
> +                       power-domain-names = "aop", "cx", "mx", "mss";
> +
> +                       mba {
> +                               memory-region = <&mba_region>;
> +                       };
> +
> +                       mpss {
> +                               memory-region = <&mpss_region>;
> +                       };
> +
> +                       glink-edge {
> +                               interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
> +                               label = "modem";
> +                               qcom,remote-pid = <1>;

The "qcom,remote-pid" property isn't documented for "glink-edge".  Do
you need it?  ...if you do, please send a patch to update the
bindings.


-Doug
