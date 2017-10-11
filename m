Date: Wed, 11 Oct 2017 11:01:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg fixes for v4.14
Message-ID: <20171011180115.GN20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.14-fixes

for you to fetch changes up to b775d158530285c9657a1a0628c139b0dfd0d2e5:

  rpmsg: glink: Fix memory leak in qcom_glink_alloc_intent() (2017-10-10 11:22:09 -0700)

----------------------------------------------------------------
rpmsg fixes for v4.14

This corrects two mistakes in the Qualcomm GLINK SMEM driver.

----------------------------------------------------------------
Dan Carpenter (2):
      rpmsg: glink: Unlock on error in qcom_glink_request_intent()
      rpmsg: glink: Fix memory leak in qcom_glink_alloc_intent()

 drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
