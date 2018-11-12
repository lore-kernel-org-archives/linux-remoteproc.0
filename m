Return-Path: <benjamin.gaignard@linaro.org>
Return-Path: <benjamin.gaignard@linaro.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v3 0/4] Add support of STM32 hwspinlock
Date: Mon, 12 Nov 2018 16:23:38 +0100
Message-Id: <20181112152342.6561-1-benjamin.gaignard@st.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This serie adds the support of the hardware semaphore block for stm32mp1 SoC.

version 3:
- fix clock name in properties description.
- use postcore_initcall() instead of module_platform_driver()

version 2:
- fix comments done by Bjorn about clock naming, license terms in header,
  alphabetic ordering in Makefile and Kconfig and remove function
- Do not push test module in this version while waiting for feedbacks about it


Benjamin Gaignard (4):
  dt-bindings: hwlock: Document STM32 hwspinlock bindings
  hwspinlock: add STM32 hwspinlock device
  ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
  ARM: dts: stm32: enable hwspinlock on stm32mp157c-ed1

 .../bindings/hwlock/st,stm32-hwspinlock.txt        |  23 +++
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |   4 +
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 ++
 drivers/hwspinlock/Kconfig                         |   9 ++
 drivers/hwspinlock/Makefile                        |   1 +
 drivers/hwspinlock/stm32_hwspinlock.c              | 156 +++++++++++++++++++++
 6 files changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
 create mode 100644 drivers/hwspinlock/stm32_hwspinlock.c

-- 
2.15.0
