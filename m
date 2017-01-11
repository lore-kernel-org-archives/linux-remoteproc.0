Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 11 Jan 2017 06:07:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg fixes for v4.10
Message-ID: <20170111140708.GA31260@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.10-fixes

for you to fetch changes up to 63447646ac657fde00bb658ce21a3431940ae0ad:

  rpmsg: virtio_rpmsg_bus: fix channel creation (2016-12-30 03:12:11 -0800)

----------------------------------------------------------------
rpmsg fixes for v4.10

This fixes a regression introduced in v4.10-rc1 that prohibits multiple
channels with the same name but different endpoint addresses to be used.

----------------------------------------------------------------
Loic Pallardy (1):
      rpmsg: virtio_rpmsg_bus: fix channel creation

 drivers/rpmsg/rpmsg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
