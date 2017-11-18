Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Nov 2017 16:59:48 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock update for v4.15
Message-ID: <20171118005948.GC12202@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.15

for you to fetch changes up to d048236dfdfe454f059a0837431c3ae3d166d4d6:

  hwspinlock: Change hwspinlock to a bool (2017-11-06 21:59:34 -0800)

----------------------------------------------------------------
hwspinlock update for v4.15

This changes the HWSPINLOCK core Kconfig option to bool, to aid when other core
code depends on it.

----------------------------------------------------------------
Baolin Wang (1):
      hwspinlock: Change hwspinlock to a bool

 drivers/hwspinlock/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
