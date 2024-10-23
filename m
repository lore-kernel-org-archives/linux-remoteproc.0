Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33731D2238
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704295; cv=none; b=nrk9FLEQkYevO0Q8YiPW28dqJoHnzJ993eHkwF6BFEt0MFRqwXpeP0DfWZtp7ehRAk10ygC81vK2l/hxVoAgOBGt7cHl+hodQjJwsq0ZwGHp2Mf/1KQFKbTXlNaQRLWG8534e6KfBsb0wlG0beYyKn8mvfFDPPApTQosOoI0S8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704295; c=relaxed/simple;
	bh=J4eLe0vdqprPu0DSDCMS++nYOGIjfvxAIlO6B9wv6/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uU6n31zvSAOkgpFUehMKpToI5GfcRlupvXE7gKESObVPNGStaF1R+qxPETStgHrbXs+AaxHdmSpYtLiANFum5n13zu/neJb92frVwMHVW/xKwm9zC1xPqtBQNHHehjM5F9difbwDInjbytvBL9MwUUpM5M9j9ATyobEhqAVmUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNIuwKA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNIuwKA1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9hLPc028308
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DkCP8eSRQSPej2Q5XXyp8TUa5YWXFZpFuh8TfS+xzik=; b=CNIuwKA1jqTD0M6/
	RYqOzxcxWgH66QjVlID5CLMHUhZDJQLpiUHvhdfpgcuGx8xes30D0XR/v5Ie7+5j
	gqoH9pqUZuSCZUuk6WCA74nuvdDeZ3gCxrWiuE8Ipz/rCdrjuR7X9rjlRRdO6cTJ
	h01zQzOxq3J3ihkxzsP4IQh5KPuiFCrFDpL8OGjuLNz6U0AzY0YpPiec9bC4b6Cw
	wzTTIa7mBgXhu54Fja9klMnnFS7dqp3fyhN9QVGBt29oAympiJxcVvGAY2xiBy3W
	GqW33Weq2gdtFY/LNkiheaw8n2xSCtIa4uG5bpsMvWDyD8+4e94Y0dN+W7nLwCGq
	trTEBg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41txm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 17:24:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-20c8b0b0736so60601965ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 10:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704290; x=1730309090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkCP8eSRQSPej2Q5XXyp8TUa5YWXFZpFuh8TfS+xzik=;
        b=VOogl6E8XEVTQ8StPL1dWEle4cPoX4J8B+rgcMI4mMg2tqjhGdQBQFuRzZmO97lCAE
         U+zlhJoE5MtLcv/0CAqbZAILZR9QldNC9JfQVESIzo3q4W/CUgTUL8pRG5VXvLLJpbL2
         +4W/npNSGnKbWygdFdKa6S1z7xrHhdIY9GFfG9B7/j8hJEliNLweHnFh9QfmcHa1Xw3o
         tZj+ilzVizpb2OTPta8IaePjpURlaDKpuz138ggWvQgLsDXp04+rwkWkiOWzYKJ+4COW
         jefE8E6AFRV4/SjvWacJWU40SzaD++wJ7M6lRsdS0hjzFcUtGn2lOH2OlUJ2FIAnOw7o
         gnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZRs5u9sUDWTH4o7CquZ4566pGMhY5P7RaA6DmcSMXTXf2ZuxMI3pF4tMrg/kG3VKhXXLH4KJHqeXT5gwfpWAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46jvJHp5q5li19udhiqcXBOXmjAEXYPz6D9ArxuQQpZruVGHd
	w0usMDD2G94gBPCCNzi7xptg3+df3fZeEYNFYgxOCfuUoBe1FSQDZcv0gaAPh1o0fMlLsCaZ9wv
	6k9RZ3bOLq9r2/eqiE++dG0jbZjR46hHtxxtO6XIfuVC82TeMRbTbZ2+8bXYM8iqXyTeQa/GcJI
	XA
X-Received: by 2002:a17:903:1c3:b0:20c:d8e4:8798 with SMTP id d9443c01a7336-20fa9eb548cmr41774805ad.49.1729704290128;
        Wed, 23 Oct 2024 10:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvKXi1nBrPodNbSIhUp/iYe0ti2gl+9cfryTqmaiBOo50APhliCHn4Nw7dp3ZSYrmBZDVopQ==
X-Received: by 2002:a17:903:1c3:b0:20c:d8e4:8798 with SMTP id d9443c01a7336-20fa9eb548cmr41774515ad.49.1729704289756;
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f20aesm59525435ad.246.2024.10.23.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 23 Oct 2024 17:24:32 +0000
Subject: [PATCH v2 1/2] rpmsg: glink: Handle rejected intent request better
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-pmic-glink-ecancelled-v2-1-ebc268129407@oss.qualcomm.com>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
In-Reply-To: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729704288; l=4096;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=J4eLe0vdqprPu0DSDCMS++nYOGIjfvxAIlO6B9wv6/8=;
 b=MZ/+ZBjJlhOtFqt150vi/FblgOHbTxD2m9Ml5Zc+SwSVJFEpQXeQIEH23C2n/nP0CLVBHrHi4
 NEZlLdNqDMfByq/SyWNMkpGv3XKAj/sSvrKFaCr7wPcrJIArUW/BDH/
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: lihWKmyPUOXwbo5znvfO0tkyvMcLY0fM
X-Proofpoint-ORIG-GUID: lihWKmyPUOXwbo5znvfO0tkyvMcLY0fM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230109

GLINK operates using pre-allocated buffers, aka intents, where incoming
messages are aggregated before being passed up the stack. In the case
that no suitable intents have been announced by the receiver, the sender
can request an intent to be allocated.

The initial implementation of the response to such request dealt
with two outcomes; granted allocations, and all other cases being
considered -ECANCELLED (likely from "cancelling the operation as the
remote is going down").

But on some channels intent allocation is not supported, instead the
remote will pre-allocate and announce a fixed number of intents for the
sender to use. If for such channels an rpmsg_send() is being invoked
before any channels have been announced, an intent request will be
issued and as this comes back rejected the call fails with -ECANCELED.

Given that this is reported in the same way as the remote being shut
down, there's no way for the client to differentiate the two cases.

In line with the original GLINK design, change the return value to
-EAGAIN for the case where the remote rejects an intent allocation
request.

It's tempting to handle this case in the GLINK core, as we expect
intents to show up in this case. But there's no way to distinguish
between this case and a rejection for a too big allocation, nor is it
possible to predict if a currently used (and seemingly suitable) intent
will be returned for reuse or not. As such, returning the error to the
client and allow it to react seems to be the only sensible solution.

In addition to this, commit 'c05dfce0b89e ("rpmsg: glink: Wait for
intent, not just request ack")' changed the logic such that the code
always wait for an intent request response and an intent. This works out
in most cases, but in the event that an intent request is rejected and no
further intent arrives (e.g. client asks for a too big intent), the code
will stall for 10 seconds and then return -ETIMEDOUT; instead of a more
suitable error.

This change also resulted in intent requests racing with the shutdown of
the remote would be exposed to this same problem, unless some intent
happens to arrive. A patch for this was developed and posted by Sarannya
S [1], and has been incorporated here.

To summarize, the intent request can end in 4 ways:
- Timeout, no response arrived => return -ETIMEDOUT
- Abort TX, the edge is going away => return -ECANCELLED
- Intent request was rejected => return -EAGAIN
- Intent request was accepted, and an intent arrived => return 0

This patch was developed with input from Sarannya S, Deepak Kumar Singh,
and Chris Lew.

[1] https://lore.kernel.org/all/20240925072328.1163183-1-quic_deesin@quicinc.com/

Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
Cc: stable@vger.kernel.org
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0b2f290069080638581a13b3a580054d31e176c2..d3af1dfa3c7d71b95dda911dfc7ad844679359d6 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1440,14 +1440,18 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 		goto unlock;
 
 	ret = wait_event_timeout(channel->intent_req_wq,
-				 READ_ONCE(channel->intent_req_result) >= 0 &&
-				 READ_ONCE(channel->intent_received),
+				 READ_ONCE(channel->intent_req_result) == 0 ||
+				 (READ_ONCE(channel->intent_req_result) > 0 &&
+				  READ_ONCE(channel->intent_received)) ||
+				 glink->abort_tx,
 				 10 * HZ);
 	if (!ret) {
 		dev_err(glink->dev, "intent request timed out\n");
 		ret = -ETIMEDOUT;
+	} else if (glink->abort_tx) {
+		ret = -ECANCELED;
 	} else {
-		ret = READ_ONCE(channel->intent_req_result) ? 0 : -ECANCELED;
+		ret = READ_ONCE(channel->intent_req_result) ? 0 : -EAGAIN;
 	}
 
 unlock:

-- 
2.43.0

