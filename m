Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 0/2] remoteproc: stm32: allow wdg irq to be a wakeup source
Date: Mon, 26 Aug 2019 17:38:41 +0200
Message-ID: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The watchdog IRQ which notifies the remote processor crash is used by the
remoteproc framework to perform a recovery procedure.
Since this IRQ may be fired when the Linux system is suspended, this IRQ may
be configured to wake up the system.

Fabien Dessenne (2):
  dt-bindings: remoteproc: stm32: add wakeup-source
  remoteproc: stm32: wakeup the system by wdg irq

 .../devicetree/bindings/remoteproc/stm32-rproc.txt |  3 ++
 drivers/remoteproc/stm32_rproc.c                   | 47 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.7.4
