Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] rpmsg: glink: correctly annotate intent members
Date: Mon, 18 Jun 2018 13:33:37 +0100
Message-Id: <20180618123339.24115-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
References: <20180618123339.24115-1-srinivas.kandagatla@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

As intent structure members are not correctly annotated, leading to below warnings

qcom_glink_native.c:614:16: warning: incorrect type in assignment (different base types)
qcom_glink_native.c:614:16:    expected unsigned short [unsigned] [usertype] id
qcom_glink_native.c:614:16:    got restricted __le16 [usertype] <noident>
qcom_glink_native.c:615:18: warning: incorrect type in assignment (different base types)
qcom_glink_native.c:615:18:    expected unsigned short [unsigned] [usertype] lcid
qcom_glink_native.c:615:18:    got restricted __le16 [usertype] <noident>
qcom_glink_native.c:616:19: warning: incorrect type in assignment (different base types)
qcom_glink_native.c:616:19:    expected unsigned int [unsigned] [usertype] count
qcom_glink_native.c:616:19:    got restricted __le32 [usertype] <noident>
qcom_glink_native.c:617:18: warning: incorrect type in assignment (different base types)
qcom_glink_native.c:617:18:    expected unsigned int [unsigned] [usertype] size
qcom_glink_native.c:617:18:    got restricted __le32 [usertype] <noident>
qcom_glink_native.c:618:18: warning: incorrect type in assignment (different base types)
qcom_glink_native.c:618:18:    expected unsigned int [unsigned] [usertype] liid
qcom_glink_native.c:618:18:    got restricted __le32 [usertype] <noident>

Fix this by correctly annotating them.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f505f58b797d..e4eb5a1f417a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -603,11 +603,11 @@ static int qcom_glink_advertise_intent(struct qcom_glink *glink,
 				       struct glink_core_rx_intent *intent)
 {
 	struct command {
-		u16 id;
-		u16 lcid;
-		u32 count;
-		u32 size;
-		u32 liid;
+		__le16 id;
+		__le16 lcid;
+		__le32 count;
+		__le32 size;
+		__le32 liid;
 	} __packed;
 	struct command cmd;
 
-- 
2.16.2
