Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/5] Qualcomm SMD updates
Date: Tue, 12 Dec 2017 15:58:52 -0800
Message-Id: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeremy McNicoll <jmcnicol@redhat.com>, Will Newton <will.newton@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>
List-ID: <linux-remoteproc@vger.kernel.org>

A series of fixes for a few issues reported or seen with SMD.

The first two fixes changes the trigger for creating devices for channels
found, which should cause the rpm-smd driver to probe on 8909 and 8994 devices.

The third patch fixes an issue when multiple callers end up waiting on events.

The forth fix moves the check for a closed channel out of the tx-full loop, to
fail non-full send requests on a closed channel as well.

The last fix improves the handling of concurrent send-requests, allowing
concurrent sends, in particular try_send, to progress even though we're
sleeping waiting for room in the tx fifo.

Bjorn Andersson (5):
  rpmsg: smd: Perform handshake during open
  rpmsg: smd: Create device for all channels
  rpmsg: smd: Wake up all waiters
  rpmsg: smd: Fail send on a closed channel
  rpmsg: smd: Don't hold the tx lock during wait

 drivers/rpmsg/qcom_smd.c | 60 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 13 deletions(-)

-- 
2.15.0
