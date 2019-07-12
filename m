Return-Path: <gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 12 Jul 2019 11:13:12 +0530
From: gokulsri@codeaurora.org
Subject: Re: [PATCH 00/12] remoteproc: qcom: q6v5-wcss: Add support for secure
 pil
In-Reply-To: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
Message-ID: <ca9223caff73548cccadd64ff8bffb2e@codeaurora.org>
To: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, jassisinghbrar@gmail.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org, sjaganat@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 2019-07-11 21:10, Gokul Sriram Palanisamy wrote:
> IPQ8074 needs support for secure pil as well.
> Also, currently only unified firmware is supported.
> IPQ8074 supports split firmware for q6 and m3, so
> adding support for that.
> 
> Gokul Sriram Palanisamy (12):
>   remoteproc: qcom: Add PRNG proxy clock
>   remoteproc: qcom: Add secure PIL support
>   remoteproc: qcom: Add support for split q6 + m3 wlan firmware
>   remoteproc: qcom: Add ssr subdevice identifier
>   remoteproc: qcom: Update regmap offsets for halt register
>   dt-bindings: clock: qcom: Add reset for WCSSAON
>   clk: qcom: Add WCSSAON reset
>   dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
>   mailbox: qcom: Add support for IPQ8074 APCS
>   dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
>   arm64: dts: Add support for scm on IPQ8074 SoCs
>   arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
> 

  Also, this series is based on Govind’s,
  “[v4] Add non PAS wcss Q6 support for QCS404”
  https://www.spinics.net/lists/linux-remoteproc/msg03612.html

Regards,
  Gokul


>  .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   1 +
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 131 
> +++++++++++++++++
>  drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss.c                | 158 
> +++++++++++++++++----
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
>  7 files changed, 264 insertions(+), 30 deletions(-)
