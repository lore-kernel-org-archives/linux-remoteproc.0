Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11C24CEE8
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856855; cv=none; b=ltD9iHLbXeEG5p74mFy0cPU102BxnYDann15bj/wOOSkRbF5Cxmn1su9/FeyrpDtPNBolbI7daDo0nAMGeUCc5q1XIKr+7kxfN6mz2+PzQ/7jAz8yZVTvhB12TionK9oL99wS4IQzNkJGTl/F8TVa1UD0UvYdyjE5bU+uuCkkJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856855; c=relaxed/simple;
	bh=Kblp6sKAW8B4L6uZ7Qz1y78hMa8c703M2PtOHhVJR2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQyWCPlBOkzGBbW645go5HvZZZOW7U4od+oA8v3ltRT8BG/6c+n4BKtTl4EhkOnB2m9UTj/w9il7vOqu0+S511ru/CQwGQUk12ypa5XLfeLPkb/dyGgCettmU/QAje5aj/RGx4NGdf2saGOA+MUdBbeKMyMf4ud/kyIGxs0/0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8jbTXcA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8jbTXcA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UONB018005
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ou+eOuaLoOa
	WUX3GqGDD1IBUPFka4u4YgsHz/dP4bTw=; b=R8jbTXcA2B6u2Fhq7mVibkSRVxO
	o0XjT6pJTNH9n9a+fdQdyLimGRgmEE8R62xoLiRbEB5XAPV5ZTLVo5D1q8y0A9lQ
	F8yyY1TBP25Q+cGfCb1fdbkJ/58HWJ3g+tdpQGZcMddeGvjnccrCcEKgRNdd4UO5
	jrF7EjE4hKqvIu27X+qyPo3izDHtA8UY7MeTJn/3UTyDuFH9SgnJ5cdQ/EG9uqJL
	mpCogml1yHl1KGC6VS168CLQtu3Xe6+8AxWW+4f+iUaUW4J6F5dlgLsb+T6sG8C9
	4ECSDeOLE3A/caS7/ZnO5SpTmmVOfT7b/iBKugxIoUkcBLrLJp7QfKaJEyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0nv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b29461f7f5so50886091cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755856852; x=1756461652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou+eOuaLoOaWUX3GqGDD1IBUPFka4u4YgsHz/dP4bTw=;
        b=F+ar0vHcrYrrTqPv10IYgOdwmuZ+NbEcauTf/yvyrAfQaSGuHRtXNIjjhBnOX+8qL1
         L/RJIOxLd9nSp8Jo67gMDo0yRl5FIobjUrPxUt4AvqdFFD3Ot8+wa6nEJR2KSBCUiWss
         AWF4iXBhrDTEJMmQTSn/tS0evfRPJhfrcHyf8N1my7tdAuprcANZ8Gyy4JKFi202x4x4
         YwZFp+RkbrqJfz6ULZLLALcS/5AB5p/dkRU/sPPP1UBCQzQGbUJeHI+QGtjDwuCeMWz6
         CEu5oS4FQD+55+k3lOBWylU9HHz9luBosGo7rg5ATMPJIQJP2JH8KyW5r470E8o7vLFr
         qUqw==
X-Forwarded-Encrypted: i=1; AJvYcCWSm39vXyKtSagClhzMhCfijWUC6l9wTRmfFsUD5Ky/Jx0EHOGZGtcyIGI3bxzgbf6brpOIgcsSdMUJkkkkBPDn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95s3sIlVB4kd4GYsSj2Wyy7JB5FHkjN53FAcvTIRUPtNTp/eP
	XeLfwNUD5bS+DhXp19d3f6XfKOIwe6mBQEwsrzC1+Otifr3+CxaM3ciroPe0j3nR0J0BhbJ7/bv
	20AU2xhseRl0sKMTehlAXlJ0QXpR/O2XeSC53IUrcDQvEON9U/Qu0qdGByJH78N7EzeTYGGip
X-Gm-Gg: ASbGnctCJJWTV5suJIiRmKOpkiz5MTGMhbizPkfAEh5e6xTNst48IMkJZ6PH89GjbCv
	TGUuDaUGgbdQ618KhRGKg4r+FpdR2Fk7WdnQ7dbsCDxlOFN5/SioNjayDRP1Wq45/UBqD8V8C6s
	0dUFcvWAUmQpUrx7ae02RrVXk8pRoPXTpatJPQMqhcwn0XzaOIR4Vwxzlq7Y+NmuXRc3lH9Fl5v
	ztXO+y65brenF5eAzQHu3/Fc6t7xfRa3qUsLNTaQNoAIyJSJUDxafUI2mxUTNQRQb49wymTqUqP
	wjLF0VqKpVqbF6emF3WxIf6kfXQjXA26a68C/D+NMrHqqKMbhR6+7Q==
X-Received: by 2002:a05:622a:13d2:b0:4b0:6a5e:8ad1 with SMTP id d75a77b69052e-4b2aaa55f58mr24495201cf.34.1755856851303;
        Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1lhU0nNajRhkep+UK06py4s7lsk85UT2mVW85Uh0DrKqoYvpPCeaNTFYhevGzZqID8fPp9g==
X-Received: by 2002:a05:622a:13d2:b0:4b0:6a5e:8ad1 with SMTP id d75a77b69052e-4b2aaa55f58mr24494611cf.34.1755856850512;
        Fri, 22 Aug 2025 03:00:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797a1sm14184608f8f.5.2025.08.22.03.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:00:50 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 1/2] rpmsg: glink_native: fix rpmsg device leak
Date: Fri, 22 Aug 2025 11:00:42 +0100
Message-ID: <20250822100043.2604794-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+2V3KbBYtJ7i
 SdodNKi4VbHJ2IeCrclDhs5FXcU/Iy4O8eEyjiVynhUxRwnOBXafFvhlhmp6U8Hnqnl/MDAiL/d
 0KSGR5C/UOWoDwrUDA2VJMAMcBi6bxqEazhI8zQFQB5i7wPvqLSTRJROdiP4Py7g4IkC/Wpe71r
 /m6Y0ZyifHrwoBqoF4AelPdwOqPgysKxyYo61cIxEm1C7JcJsFhGEi6PWNcdzlkA4WsREEWlptf
 zAPgty0djUar+ufyBSCI5r6PfPAWLCYDGl5u2d7bCjYBEZlFyYNjZtZKhNOtSkaYqVdT2x1sfd+
 qfpI1ceS9c1EtknSQCekSoqos19X1hmLTQiSM+Ol6y/8Ud2AeO2dN0o1atGo2KwKGrYyZiQTqcC
 kA+TzHuJgudIekfOwzc5CBTx5ZB4yg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a83fd4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TywJypLWJUn14OWOvxEA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lpEwYrQXlNprqOqQ9OZRk3N2zbXmhxw1
X-Proofpoint-GUID: lpEwYrQXlNprqOqQ9OZRk3N2zbXmhxw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

While testing rpmsg-char interface it was noticed that duplicate sysfs
entries are getting created and below warning is noticed.

Reason for this is that we are leaking rpmsg device pointer, setting it
null without actually unregistering device.
Any further attempts to unregister fail because rpdev is NULL,
resulting in a leak.

Fix this by unregistering rpmsg device before removing its reference
from rpmsg channel.

sysfs: cannot create duplicate filename '/devices/platform/soc@0/3700000.remot
eproc/remoteproc/remoteproc1/3700000.remoteproc:glink-edge/3700000.remoteproc:
glink-edge.adsp_apps.-1.-1'
[  114.115347] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not
 tainted 6.16.0-rc4 #7 PREEMPT
[  114.115355] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
[  114.115358] Workqueue: events qcom_glink_work
[  114.115371] Call trace:8
[  114.115374]  show_stack+0x18/0x24 (C)
[  114.115382]  dump_stack_lvl+0x60/0x80
[  114.115388]  dump_stack+0x18/0x24
[  114.115393]  sysfs_warn_dup+0x64/0x80
[  114.115402]  sysfs_create_dir_ns+0xf4/0x120
[  114.115409]  kobject_add_internal+0x98/0x260
[  114.115416]  kobject_add+0x9c/0x108
[  114.115421]  device_add+0xc4/0x7a0
[  114.115429]  rpmsg_register_device+0x5c/0xb0
[  114.115434]  qcom_glink_work+0x4bc/0x820
[  114.115438]  process_one_work+0x148/0x284
[  114.115446]  worker_thread+0x2c4/0x3e0
[  114.115452]  kthread+0x12c/0x204
[  114.115457]  ret_from_fork+0x10/0x20
[  114.115464] kobject: kobject_add_internal failed for 3700000.remoteproc:
glink-edge.adsp_apps.-1.-1 with -EEXIST, don't try to register things with
the same name in the same directory.
[  114.250045] rpmsg 3700000.remoteproc:glink-edge.adsp_apps.-1.-1:
device_add failed: -17

Fixes: 835764ddd9af ("rpmsg: glink: Move the common glink protocol implementation to glink_native.c")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 820a6ca5b1d7..3a15d9d10808 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1399,6 +1399,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 	struct qcom_glink *glink = channel->glink;
+	struct rpmsg_channel_info chinfo;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
@@ -1406,6 +1407,13 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
+	if (channel->rpdev) {
+		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
+		chinfo.src = RPMSG_ADDR_ANY;
+		chinfo.dst = RPMSG_ADDR_ANY;
+
+		rpmsg_unregister_device(glink->dev, &chinfo);
+	}
 	channel->rpdev = NULL;
 
 	qcom_glink_send_close_req(glink, channel);
-- 
2.50.0

