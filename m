Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA629DB6E
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856856; cv=none; b=WMECPyEVKVPkzroNKwbEzhtorqfb7W0/vtTMoi8dbzJav9iVbFf2PIokV0MRyrF39fy3uB4k5BvdAxpAM8YcMZigXEbHpFlazD065K2ThVVdBuTY10NgyG1xBTY+mivdDQyy8lrreATvFFWPmjYly8P74GIm20HfRHWFp273M9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856856; c=relaxed/simple;
	bh=pEetoVTDodelXBwJrt38dostCVJshVjnFzOU+XhTBjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTAKcuWcGRxoPoHHJ3lZb5eJmR6xKbNFMVnTr7vv3jJQ3KX4vYyrfHOjl+8A0fHMjbtbtTFQme9QOODq67NPJe7PT4RbmkyFNy51iD2pqMcF/H5rqAtpvxIKD8CKUw918CEXBWVN+Njrz4dCOuCAjAZvoxt20/shRQlcXNzacIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXbmBnsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXbmBnsf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UQrE001127
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=seU5VyNwZ7P
	hzDSFhbvRs6XB3sWasRwy3GspI+Jm/Rs=; b=XXbmBnsfM/h5W2KrZFVAzKUJTZt
	Z1HMKDfhL73N9zmko0vHj4DE1/2uIFzyajQNaY7RJkexgDqKZEdsFUKTPKuhvwl3
	1/AEhJmtWvegV9k/5+aZGMENqlhZpy64KRB5DMW6ND7hZCogtvVl970NuOht1oy0
	v1qAfTosPJv0JFEkiEZjiEyUTJ+bY4CFgCktnLoq3f3xslGRIycWxok31ThipGaT
	8fpvK/MzZ71t6SxePnGQM2FnTISo0FEg9zpdoQfPBEQB+a3rlqLucSmi/oHagUuN
	LoFkWa3gdUAr2IN0NdPOcK5R7zQ6YWl2zHo1H2iE6frDXdvioiw738goV1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298tys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:00:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10ab0062aso45634781cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 03:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755856852; x=1756461652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seU5VyNwZ7PhzDSFhbvRs6XB3sWasRwy3GspI+Jm/Rs=;
        b=EzRC0XrLPUDDbZSeIGEv4S8tWDwx3NYzsyqP2XLzJyIj/+yRGRp2OBlhZL/pUUxQ5c
         uBQAYv/Ho6ED5bnG/wdTW4YNggPP03GmchRdqnSZG0orqyBJs7dKygtkxlg0+un1teQf
         WkDas4jV1gMRCW7/Y5eixH6F7E99jNmUeCC7FJ+WfbFvP4JNatpSBjhUyrqHBqO9PY+H
         zUss9HHX8tkHDdFEFwhNgo5U+W3z61fL3DsRMr3LOF0Mzv2fw8S36IbyZJeS5Ndh/Fn8
         Fm0q+dKqFazeGQlsypSMZ1LVDXDlQsneYlt2cFmRA6rkRo54ALI0rLWyGP6sjGY/+r0b
         Lhcw==
X-Forwarded-Encrypted: i=1; AJvYcCU/tY6+Tww++ZOdFMSj1XyPGyg23BJVADMzdy53nY/K/EDj1exWpV+IqlAxgrckfJJSUAkagmkmBdtkTTRfj95i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzthva2fh2EXC+bG5vSgbfne/VcV8pgb5bsFnL/vFfbehQgEW93
	TYIJ/zsHoUpBPb0OSHB+mvcPzAxf/feoBQnGj1du0l87dqB5shjYW3sMJ2cVf2WFCPK/v1tTqXr
	rOTywOPL2+uoAb88KrYZrW4OsuJyHY64DDIVc9xfWOacJjdX0ca2oj8QizrlVcvfbCA2fcdYS
X-Gm-Gg: ASbGnctyRUnWE0xGPq7TkxXzs8FT7WQc6jLZ6V3GiS2z3ecOXHAOXqpBRxIwVLzzQj8
	zPhF6x2dQGiFAucA639DkuWjWzu/YERVr6q8HqigX47Wu3OYv5hXQnOhowe40PxHPh/wJKS89mi
	b79sWOjNmKbyqm8clzlhStpPPvMB4uLYnf8JPZIBr7sHbHVNgwGzD2G6SzRsmPSr30ss2mpTVjD
	Tc49T11GuZ2erMxqAw7oHbLwD3gAbFFNO/HzKZYRcE4hQwzRAWEd5NLckEYkU6U7K5p3IYyHUdr
	XuCH2Niu4r94KZFhBAdscGogxP8SJbAMspJQG3tXrsJYiHzxP9Ceyg==
X-Received: by 2002:a05:622a:1cc9:b0:4b2:94a7:217b with SMTP id d75a77b69052e-4b2aaa599d7mr28342441cf.37.1755856852110;
        Fri, 22 Aug 2025 03:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTI6SJSLk1AF3i7MxH2gUf6ex3W/Wf5mKpRmzSeB4ddoFBiT2mWoh4+lF7VcoIx6vuIho8PA==
X-Received: by 2002:a05:622a:1cc9:b0:4b2:94a7:217b with SMTP id d75a77b69052e-4b2aaa599d7mr28341801cf.37.1755856851491;
        Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797a1sm14184608f8f.5.2025.08.22.03.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] rpmsg: glink_native: remove duplicate code for rpmsg device remove
Date: Fri, 22 Aug 2025 11:00:43 +0100
Message-ID: <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: KGpuQ6BP4zebeWxW56KBHhVFZstphY7-
X-Proofpoint-ORIG-GUID: KGpuQ6BP4zebeWxW56KBHhVFZstphY7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/c2WoGiTdRwU
 Jmi+DMDK0n5HCs0rz3f719ziM6zJLaj6+SwchW3JFQNU4XiEihiP4YI6EKcI6oDB69W0Tazma3b
 Mv0WwWxen5QEr0Adp1jBByehb4J9R52rNpIGJHnL2A9pDY3+1xDeXSlqww/osMKRI/Y3XM9aZ4H
 qmnGFm0/Hd2PGrqcwmvY3huPr2QyKXZLNCPsVkQvxsLjOLdmbUZg0QGzjPj85xvFxrgnKAw/6G7
 xsqE3r9WEQ+KkqtsJ3zlJRuNM7u7/3jCg2Y6sJGNL7E4r97N1/mKSsrOM558Q+q9yClS/mVLybx
 7BPrwFxZn7bBaIbPD0SAZseON1v3ep8Smd2GGvmwdbUvsBSxZc2Rl+umXVtTbY46jGml5ZHMsce
 uLOCPYWsuG3GUc0EfkZK88nP4pg17g==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a83fd5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9_ireLxDWfKNmGTEU-MA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

rpmsg device remove code is duplicated in at-least 2-3 places, add a
helper function to remove this duplicated code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 43 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 3a15d9d10808..5ea096acc858 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1395,11 +1395,23 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	return 0;
 }
 
+static void qcom_glink_remove_rpmsg_device(struct qcom_glink *glink, struct glink_channel *channel)
+{
+	struct rpmsg_channel_info chinfo;
+
+	if (channel->rpdev) {
+		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
+		chinfo.src = RPMSG_ADDR_ANY;
+		chinfo.dst = RPMSG_ADDR_ANY;
+		rpmsg_unregister_device(glink->dev, &chinfo);
+	}
+	channel->rpdev = NULL;
+}
+
 static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 	struct qcom_glink *glink = channel->glink;
-	struct rpmsg_channel_info chinfo;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
@@ -1407,14 +1419,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
-	if (channel->rpdev) {
-		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	qcom_glink_send_close_req(glink, channel);
 }
@@ -1705,7 +1710,6 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 
 static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 {
-	struct rpmsg_channel_info chinfo;
 	struct glink_channel *channel;
 	unsigned long flags;
 
@@ -1721,14 +1725,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 	/* cancel pending rx_done work */
 	cancel_work_sync(&channel->intent_work);
 
-	if (channel->rpdev) {
-		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	qcom_glink_send_close_ack(glink, channel);
 
@@ -1742,7 +1739,6 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 
 static void qcom_glink_rx_close_ack(struct qcom_glink *glink, unsigned int lcid)
 {
-	struct rpmsg_channel_info chinfo;
 	struct glink_channel *channel;
 	unsigned long flags;
 
@@ -1764,14 +1760,7 @@ static void qcom_glink_rx_close_ack(struct qcom_glink *glink, unsigned int lcid)
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
-	if (channel->rpdev) {
-		strscpy(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	kref_put(&channel->refcount, qcom_glink_channel_release);
 }
-- 
2.50.0

