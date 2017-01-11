Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 11 Jan 2017 06:07:52 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc fixes for v4.10
Message-ID: <20170111140752.GB31260@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.10-fixes

for you to fetch changes up to a0c10687ec9506b5e14fe3dd47832a77f2f2500c:

  Revert "remoteproc: Merge table_ptr and cached_table pointers" (2016-12-30 03:26:31 -0800)

----------------------------------------------------------------
remoteproc fixes for v4.10

This fixes two regressions that has been reported to be introduced in
v4.10-rc1.

* The first fix corrects an incorrect usage of the kref api.

* The second reverts the change to make the resource table read-only. As the
  space each vdev resource is used as virtio device config space it must be
  shared with the remote.

----------------------------------------------------------------
Bjorn Andersson (1):
      Revert "remoteproc: Merge table_ptr and cached_table pointers"

Loic Pallardy (1):
      remoteproc: fix vdev reference management

 drivers/remoteproc/remoteproc_core.c | 29 ++++++++++++++++-------------
 include/linux/remoteproc.h           |  4 +++-
 2 files changed, 19 insertions(+), 14 deletions(-)
