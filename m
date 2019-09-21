Date: Sat, 21 Sep 2019 09:58:50 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.4
Message-ID: <20190921165845.GA6693@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Fabien Dessenne <fabien.dessenne@st.com>, Sibi Sankar <sibis@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Linus,

I've finally moved my trees to kernel.org, please pull this and the
coming rpmsg request from their new location.

Regards,
Bjorn

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc tags/rproc-v5.4

for you to fetch changes up to 150997fac770c37b12459ec52fdf67a5dc1366f5:

  MAINTAINERS: remoteproc: update git tree location (2019-08-26 23:16:44 -0700)

----------------------------------------------------------------
remoteproc updates for v5.4

This exposes the remoteproc's name in sysfs, allows stm32 to enter
platform standby and provides bug fixes for stm32 and Qualcomm's modem
remoteproc drivers. Finally it updates MAINTAINERS to reflect the move
to kernel.org.

----------------------------------------------------------------
Bjorn Andersson (2):
      remoteproc: qcom: Move glink_ssr notification after stop
      MAINTAINERS: remoteproc: update git tree location

Fabien Dessenne (2):
      remoteproc: stm32: clear MCU PDDS at firmware start
      remoteproc: stm32: manage the get_irq probe defer case

Sibi Sankar (1):
      remoteproc: qcom: q6v5-mss: fixup q6v5_pds_enable error handling

Stephen Boyd (1):
      remoteproc: Remove dev_err() usage after platform_get_irq()

Suman Anna (1):
      remoteproc: Add a sysfs interface for name

 Documentation/ABI/testing/sysfs-class-remoteproc | 10 +++++++
 MAINTAINERS                                      |  2 +-
 drivers/remoteproc/da8xx_remoteproc.c            |  4 +--
 drivers/remoteproc/keystone_remoteproc.c         |  4 ---
 drivers/remoteproc/qcom_common.c                 |  4 +--
 drivers/remoteproc/qcom_q6v5.c                   | 35 ++++--------------------
 drivers/remoteproc/qcom_q6v5_mss.c               |  4 +--
 drivers/remoteproc/remoteproc_sysfs.c            | 11 ++++++++
 drivers/remoteproc/stm32_rproc.c                 | 14 ++++++++++
 9 files changed, 46 insertions(+), 42 deletions(-)
