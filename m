Return-Path: <benjamin.gaignard@linaro.org>
MIME-Version: 1.0
References: <20181114090027.7580-1-benjamin.gaignard@linaro.org>
In-Reply-To: <20181114090027.7580-1-benjamin.gaignard@linaro.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 30 Nov 2018 15:45:03 +0100
Message-ID: <CA+M3ks5m1=gsGqB55T4xSGtAQW9Ct3Fxqx-gbYg=GoNwoX6B-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add support of STM32 hwspinlock
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Le mer. 14 nov. 2018 =C3=A0 10:00, Benjamin Gaignard
<benjamin.gaignard@linaro.org> a =C3=A9crit :
>
> This serie adds the support of the hardware semaphore block for stm32mp1 =
SoC.
>
> version 4:
> - add Linaro SoB

Gentle ping on this series

Regards,
Benjamin

>
> version 3:
> - fix clock name in properties description.
> - use postcore_initcall() instead of module_platform_driver()
>
> version 2:
> - fix comments done by Bjorn about clock naming, license terms in header,
>   alphabetic ordering in Makefile and Kconfig and remove function
> - Do not push test module in this version while waiting for feedbacks abo=
ut it
>
> Benjamin Gaignard (4):
>   dt-bindings: hwlock: Document STM32 hwspinlock bindings
>   hwspinlock: add STM32 hwspinlock device
>   ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>   ARM: dts: stm32: enable hwspinlock on stm32mp157c-ed1
>
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        |  23 +++
>  arch/arm/boot/dts/stm32mp157c-ed1.dts              |   4 +
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 ++
>  drivers/hwspinlock/Kconfig                         |   9 ++
>  drivers/hwspinlock/Makefile                        |   1 +
>  drivers/hwspinlock/stm32_hwspinlock.c              | 156 +++++++++++++++=
++++++
>  6 files changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hws=
pinlock.txt
>  create mode 100644 drivers/hwspinlock/stm32_hwspinlock.c
>
> --
> 2.15.0
>
