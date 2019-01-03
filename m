Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 3 Jan 2019 12:02:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v4.21
Message-ID: <20190103200259.GA1563@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Wei Yongjun <weiyongjun1@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.21

for you to fetch changes up to 4d5a91fd1f42a821d14b92b082b8e71be9911ba5:

  hwspinlock: fix return value check in stm32_hwspinlock_probe() (2019-01-03 11:42:10 -0800)

----------------------------------------------------------------
hwspinlock updates for v4.21

This adds support for the hardware semaphores found in STM32MP1.

----------------------------------------------------------------
Benjamin Gaignard (2):
      dt-bindings: hwlock: Document STM32 hwspinlock bindings
      hwspinlock: add STM32 hwspinlock device

Wei Yongjun (1):
      hwspinlock: fix return value check in stm32_hwspinlock_probe()

 .../bindings/hwlock/st,stm32-hwspinlock.txt        |  23 +++
 drivers/hwspinlock/Kconfig                         |   9 ++
 drivers/hwspinlock/Makefile                        |   1 +
 drivers/hwspinlock/stm32_hwspinlock.c              | 156 +++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
 create mode 100644 drivers/hwspinlock/stm32_hwspinlock.c
