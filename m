Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 00/11] remoteproc: stm32: Add support for synchronisation with MCU 
Date: Tue, 24 Mar 2020 16:03:18 -0600
Message-Id: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patchset needs to be applied on top of this one [1].

It refactors the STM32 platform code in order to introduce support for
synchronising with an MCU that would have been started by another entity.

Most of the code is taken from work that Arnaud has already published [2].

On top of making sure the classic case where the remoteproc core is in
charge of the MCU's lifecyle is still functional, this set also tested that
it can synchronise with the MCU on ST's mp157c board. 

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Get coprocessor state
  remoteproc: stm32: Get loaded resource table for synchronisation
  remoteproc: stm32: Introduce new start and stop ops for
    synchronisation
  remoteproc: stm32: Introduce new parse fw ops for synchronisation
  remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
  remoteproc: stm32: Allocate rproc for synchronisation with MCU

 drivers/remoteproc/stm32_rproc.c | 285 ++++++++++++++++++++++++++++---
 1 file changed, 265 insertions(+), 20 deletions(-)

-- 
2.20.1
