Return-Path: <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
References: <0101016e80781930-69ece8d5-deda-4950-8cfc-da44d5955ac8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e80781930-69ece8d5-deda-4950-8cfc-da44d5955ac8-000000@us-west-2.amazonses.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 18 Nov 2019 14:52:58 -0700
Message-ID: <CAOCk7NqQPY8rtQB-_K76FW+AUqp5nADtxWDsU0a50L=4G+s9cg@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add missing remoteprocs on MSM8998/SC7180/SM8150 SoCs
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, DTML <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Nov 18, 2019 at 2:43 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> The patch series adds support for the following remoteprocs:
> * MPSS reset sequence fixup for MSM8998 (Patches 1,2)
> * MPSS on SC7180 SoCs (Patches 3,4)
> * ADSP, SLPI on MSM8998 SoC (Patches 8,9)
> * ADSP, CDSP, MPSS and SLPI on SM8150 SoC (Patches 10,11,12)
>
> Patch 6,7 Adds support for active/proxy voting of power-domain
> for the q6v5_pas driver.
>
> Jeff,
> Please free to drop MPSS node on MSM8998 if you already
> have something prepared and replace the xo with the
> rpmcc xo clock. Just included patch 14 in the series for
> completeness.

IMO, it would be nicer if if this series was broken up by SoC.  I
don't think the 8998 patches require the below dependency, and really,
it would be nicer for me to review the 8998 stuff without having to
futz about with the other, seemingly unrelated patches.

>
> This patch series depends on:
> https://patchwork.kernel.org/cover/11250067/
>
> Sibi Sankar (16):
>   remoteproc: q6v5-mss: fixup MSM8998 MSS out of reset sequence
>   remoteproc: q6v5-mss: Streamline the MSS out of reset sequence
>   dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
>   remoteproc: mss: q6v5-mss: Add modem support on SC7180
>   remoteproc: qcom: pas: Disable interrupt on clock enable failure
>   dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5 PAS
>   remoteproc: qcom: pas: Vote for active/proxy power domains
>   dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998
>     SoC
>   remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
>   dt-bindings: remoteproc: qcom: SM8150 Add ADSP, CDSP, MPSS and SLPI
>     support
>   remoteproc: qcom: pas: Add SM8150 ADSP, CDSP, Modem and SLPI support
>   remoteproc: qcom: pas: Add auto_boot flag
>   arm64: dts: qcom: msm8998: Update reserved memory map
>   arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
>   arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI smp2p
>   arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI remoteprocs
>
>  .../bindings/remoteproc/qcom,adsp.txt         |  44 +++
>  .../bindings/remoteproc/qcom,q6v5.txt         |  23 +-
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |   8 +
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         | 184 +++++++++++-
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |  12 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          | 231 +++++++++++++++
>  drivers/remoteproc/qcom_q6v5_mss.c            | 264 +++++++++++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c            | 260 ++++++++++++++++-
>  8 files changed, 979 insertions(+), 47 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
