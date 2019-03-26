Return-Path: <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/8] stm32 m4 remoteproc on STM32MP157c
References: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <695af4c3-b3fe-183f-02c7-fd080048b29c@st.com>
Date: Tue, 26 Mar 2019 11:37:11 +0100
MIME-Version: 1.0
In-Reply-To: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Fabien Dessenne <fabien.dessenne@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ludovic Barre <ludovic.barre@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi fabien

On 3/5/19 3:24 PM, Fabien Dessenne wrote:
> STMicrolectronics STM32MP157 MPU are based on a Dual Arm Cortex-A7 core and a
> Cortex-M4.
> This patchset adds the support of the stm32_rproc driver allowing to control
> the M4 remote processor.
> 
> Fabien Dessenne (8):
>    dt-bindings: stm32: add bindings for ML-AHB interconnect
>    dt-bindings: remoteproc: add bindings for stm32 remote processor
>      driver
>    remoteproc: stm32: add an ST stm32_rproc driver
>    ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157c-ed1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157c-ed1
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157a-dk1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157a-dk1
> 
>   .../devicetree/bindings/arm/stm32/mlahb.txt        |  30 +
>   .../devicetree/bindings/remoteproc/stm32-rproc.txt |  67 +++
>   arch/arm/boot/dts/stm32mp157a-dk1.dts              |  54 ++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts              |  54 ++
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |  21 +
>   drivers/remoteproc/Kconfig                         |  15 +
>   drivers/remoteproc/Makefile                        |   1 +
>   drivers/remoteproc/stm32_rproc.c                   | 624 +++++++++++++++++++++
>   8 files changed, 866 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
>   create mode 100644 drivers/remoteproc/stm32_rproc.c
> 

Concerning DT patches, at first glance I don't see obvious issues. I'll 
take Dt patches as soon as driver and bindings patches are acked.

regards
Alex
