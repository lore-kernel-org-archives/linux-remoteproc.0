Return-Path: <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 0/4] Add support of STM32 hwspinlock
References: <20181112152342.6561-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e252e4c7-ec95-b4c2-f988-526fd8bda942@st.com>
Date: Tue, 13 Nov 2018 09:09:48 +0100
MIME-Version: 1.0
In-Reply-To: <20181112152342.6561-1-benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Benjamin

On 11/12/18 4:23 PM, Benjamin Gaignard wrote:
> This serie adds the support of the hardware semaphore block for stm32mp1 SoC.
> 
> version 3:
> - fix clock name in properties description.
> - use postcore_initcall() instead of module_platform_driver()
> 
> version 2:
> - fix comments done by Bjorn about clock naming, license terms in header,
>    alphabetic ordering in Makefile and Kconfig and remove function
> - Do not push test module in this version while waiting for feedbacks about it
> 
> 
> Benjamin Gaignard (4):
>    dt-bindings: hwlock: Document STM32 hwspinlock bindings
>    hwspinlock: add STM32 hwspinlock device
>    ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
>    ARM: dts: stm32: enable hwspinlock on stm32mp157c-ed1

DT patches applied on stm32-next.

Regards
Alex

> 
>   .../bindings/hwlock/st,stm32-hwspinlock.txt        |  23 +++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts              |   4 +
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 ++
>   drivers/hwspinlock/Kconfig                         |   9 ++
>   drivers/hwspinlock/Makefile                        |   1 +
>   drivers/hwspinlock/stm32_hwspinlock.c              | 156 +++++++++++++++++++++
>   6 files changed, 202 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>   create mode 100644 drivers/hwspinlock/stm32_hwspinlock.c
> 
