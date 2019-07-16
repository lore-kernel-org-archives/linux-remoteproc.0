Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 16 Jul 2019 12:00:57 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v5.3
Message-ID: <20190716190057.GA8572@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Pi-Hsun Shih <pihsun@chromium.org>, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v5.3

for you to fetch changes up to 54119bc1110dab2fa389f45c73a0787b8e037e8b:

  rpmsg: core: Make remove handler for rpmsg driver optional. (2019-05-21 23:54:06 -0700)

----------------------------------------------------------------
rpmsg updates for v5.3

This contains a DT binding update and a change to make the remote
function of rpmsg_devices optional.

----------------------------------------------------------------
Pi-Hsun Shih (1):
      rpmsg: core: Make remove handler for rpmsg driver optional.

Sibi Sankar (1):
      dt-bindings: soc: qcom: Add remote-pid binding for GLINK SMEM

 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
 drivers/rpmsg/rpmsg_core.c                                | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)
