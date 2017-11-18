Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Nov 2017 16:59:22 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.15
Message-ID: <20171118005922.GB12202@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9:

  Linux 4.14-rc5 (2017-10-15 21:01:12 -0400)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.15

for you to fetch changes up to 1a5d5c592e902191bfa091ec9169aa43299a7d0f:

  remoteproc: qcom: Fix error handling paths in order to avoid memory leaks (2017-11-14 23:20:11 -0800)

----------------------------------------------------------------
remoteproc updates for v4.15

This adds an interface for configuring Qualcomm's "secure SMMU" and adds
support for booting the modem Hexagon on MSM8996.

Two new debugfs entries are added in the remoteproc core to introspect the list
of memory carveouts and the loaded resource table.

----------------------------------------------------------------
Avaneesh Kumar Dwivedi (4):
      firmware: scm: Add new SCM call API for switching memory ownership
      remoteproc: qcom: refactor mss fw image loading sequence
      remoteproc: qcom: Make secure world call for mem ownership switch
      remoteproc: qcom: Add support for mss remoteproc on msm8996

Bjorn Andersson (1):
      remoteproc: qcom: Drop pr_err in q6v5_xfer_mem_ownership()

Christophe JAILLET (1):
      remoteproc: qcom: Fix error handling paths in order to avoid memory leaks

Loic Pallardy (2):
      remoteproc: debug: add resource table dump feature
      remoteproc: debug: add carveouts list dump feature

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/firmware/qcom_scm-32.c                     |   7 +
 drivers/firmware/qcom_scm-64.c                     |  27 ++
 drivers/firmware/qcom_scm.c                        |  95 +++++++
 drivers/firmware/qcom_scm.h                        |   5 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 291 ++++++++++++++++++---
 drivers/remoteproc/remoteproc_debugfs.c            | 130 +++++++++
 include/linux/qcom_scm.h                           |  16 ++
 8 files changed, 533 insertions(+), 39 deletions(-)
