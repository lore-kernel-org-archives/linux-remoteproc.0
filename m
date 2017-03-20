Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 20 Mar 2017 15:07:16 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc fix for v4.11
Message-ID: <20170320220716.GA32043@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.11-fixes

for you to fetch changes up to c3104aae5d8cc443556f8613466e16737326e215:

  remoteproc: qcom: fix QCOM_SMD dependencies (2017-03-20 14:45:44 -0700)

----------------------------------------------------------------
remoteproc fix for v4.11

This fixes a Kbuild dependency issue related to the Qualcomm remoteproc
drivers.

----------------------------------------------------------------
Arnd Bergmann (1):
      remoteproc: qcom: fix QCOM_SMD dependencies

 drivers/remoteproc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
