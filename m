Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH 0/3] Add API to get rpmsg message max length
Date: Thu, 5 Sep 2019 16:27:07 +0200
Message-ID: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: arnaud.pouliquen@st.com, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

As introduction on the get_mtu api can impacts some rpmsg drivers,
i propose to discuss it separately.
The "rpmsg: core: add API to get message length" patch is extracted from
https://lkml.org/lkml/2019/9/4/556
In addition 2 patches implement the API for impacted rpmsg drivers.
The rpmsg tty client driver will be resent in a second step.

In this patchset the get_mpu is considered mandatory. The main reason is
that the rpmsg clients do not have access to the mtu information that is
platform dependent.

Notice that the GLINK and and SMD drivers have to be validated on target,
I don't have device to validate by myself...
Only a compilation check has been executed.

Arnaud Pouliquen (3):
  rpmsg: core: add API to get message length
  rpmsg: glink: implement get_mtu ops
  rpmsg: smd: implement get_mtu ops

 drivers/rpmsg/qcom_glink_native.c | 24 ++++++++++++++++++++++++
 drivers/rpmsg/qcom_smd.c          |  8 ++++++++
 drivers/rpmsg/rpmsg_core.c        | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  2 ++
 drivers/rpmsg/virtio_rpmsg_bus.c  | 10 ++++++++++
 include/linux/rpmsg.h             | 10 ++++++++++
 6 files changed, 75 insertions(+)

-- 
2.7.4
