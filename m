Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 4 May 2018 17:29:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc and rpmsg fixes for v4.17
Message-ID: <20180505002940.GG17344@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ramon Fried <rfried@codeaurora.org>, Tobias Jordan <Tobias.Jordan@elektrobit.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.17-1

for you to fetch changes up to 93dd4e73c0d9cc32f835d76a54257020b0bfc75a:

  rpmsg: added MODULE_ALIAS for rpmsg_char (2018-04-25 16:46:55 -0700)

----------------------------------------------------------------
remoteproc and rpmsg fixes for v4.17

Fixes screw up when reversing boolean for rproc_stop(), add missing of
node dereferences and add missing MODULE_ALIAS in rpmsg_char.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      remoteproc: fix crashed parameter logic on stop call

Ramon Fried (1):
      rpmsg: added MODULE_ALIAS for rpmsg_char

Tobias Jordan (1):
      remoteproc: qcom: Fix potential device node leaks

 drivers/remoteproc/qcom_q6v5_pil.c   | 2 ++
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 drivers/rpmsg/rpmsg_char.c           | 2 ++
 include/linux/remoteproc.h           | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)
