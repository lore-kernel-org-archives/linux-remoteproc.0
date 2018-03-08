Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 0/2] rpmsg: use put_device() if device_register fail
Date: Thu,  8 Mar 2018 15:06:06 +0530
Message-Id: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

if device_register() returned an error! Always use put_device()
to give up the reference initialized. unregister device for
other return error.


Arvind Yadav (2):
  [PATCH 1/2] rpmsg: glink: use put_device() if device_register fail
  [PATCH 2/2] rpmsg: smd: use put_device() if device_register fail

 drivers/rpmsg/qcom_glink_smem.c | 3 ++-
 drivers/rpmsg/qcom_smd.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.9.1
