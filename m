Date: Mon, 12 Dec 2016 16:17:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.10
Message-ID: <20161213001750.GC3439@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.10

for you to fetch changes up to 5c8a934349ee61027a48e3e6c0bba2b7d3dd09d1:

  dt-binding: soc: qcom: smd: Add label property (2016-12-08 10:55:47 -0800)

----------------------------------------------------------------
rpmsg updates for v4.10

Argument validation in public functions, function stubs for COMPILE_TEST-ing
clients, preparation for exposing rpmsg endponts to user space and minor
Qualcomm SMD fixes.

----------------------------------------------------------------
Bjorn Andersson (7):
      rpmsg: smd: Reduce restrictions when finding channel
      rpmsg: Introduce a driver override mechanism
      rpmsg: Support drivers without primary endpoint
      rpmsg: Handle invalid parameters in public API
      rpmsg: Provide function stubs for API
      rpmsg: qcom_smd: Correct return value for O_NONBLOCK
      dt-binding: soc: qcom: smd: Add label property

 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   7 ++
 drivers/rpmsg/qcom_smd.c                           |  17 +--
 drivers/rpmsg/rpmsg_core.c                         |  74 +++++++++---
 include/linux/rpmsg.h                              | 125 +++++++++++++++++++--
 4 files changed, 185 insertions(+), 38 deletions(-)
