Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/5] rpmsg: smd: Create device for all channels
Date: Tue, 12 Dec 2017 15:58:54 -0800
Message-Id: <20171212235857.10432-3-bjorn.andersson@linaro.org>
In-Reply-To: <20171212235857.10432-1-bjorn.andersson@linaro.org>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeremy McNicoll <jmcnicol@redhat.com>, Will Newton <will.newton@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Rather than selectively creating devices only for the channels that the
remote have moved to "opening" state let's create devices for all
channels found. The driver model will match drivers to the ones we care
about and attempt to open these.

The one case where this fails is if the user loads a firmware that lacks
a particular channel of the previous firmware that was running, in which
case we would find the old channel and attempt to probe it. The channel
opening handshake will ensure this will result in a graceful failure.

The result of this patch is that we will actively open the RPM channel
even though it's left in a state other than "opening" after the boot
loader's closing of the channel.

Reported-by: Jeremy McNicoll <jmcnicol@redhat.com>
Reported-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 58dd44493420..1beddea6f087 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1225,11 +1225,6 @@ static void qcom_channel_state_worker(struct work_struct *work)
 		if (channel->state != SMD_CHANNEL_CLOSED)
 			continue;
 
-		remote_state = GET_RX_CHANNEL_INFO(channel, state);
-		if (remote_state != SMD_CHANNEL_OPENING &&
-		    remote_state != SMD_CHANNEL_OPENED)
-			continue;
-
 		if (channel->registered)
 			continue;
 
-- 
2.15.0
