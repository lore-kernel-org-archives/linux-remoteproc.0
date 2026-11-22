Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361963;
	b=zBFEonmhJIJkSPy59zl/hppGYkUOBH/Ig0GZnQDqvT/oU3frGIH6K+iYCYtp0fOASrtM
	 yuWuiAlpPZa+oE9+nt6MtDL7pxI0/Sdi+xASodcurMVRv069UtZAUTrH5C71oDcobJgxa
	 neXClGMkyJUdRLE+XWwLd+e3Tax8g6fWXvDg5ptv6xhq3Y67zF28FpS+aL0cGOLzvXyl+
	 Dly5BLi6v6BKtGSAdBhjDUBAw032qT1x2YG6nUseJFAPysnPlnqbUKZSWWpXN5ayxKJVI
	 vgppOElqkYnthwgOf+7jO+DzG0aeCOAwzAPRQMjrWdqNfXw3LKE4lIrn14c9oqmAW4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
	b=Z0BYX5HcF4J9iiBvM5Mp93cYQdWyz5GNy2Zg5TM1AswvBegX8wN+bwH8zie0ZwW1VA4P
	 NqF+siXKE/LEvqf35MITG6h0uBZIpFM5uaObJ+yHKMpx2/28pkRfnQu5msyNADLRe3KUo
	 FFaYijRHXrPHzSTd5luKa7+I/rpJrx+pMXKvA0mdFrFRQz5fT1O1a0F/2jI2dNLWlCYDI
	 bs/luLI2sukfRfXrrm+wfBs7zQ3ShpP2ZtyT7x4qTNdKiFH7Pzdum+XbxX3IW95sP0mTK
	 zE2WAjyGfO19DinIg/iRJ7s4HTPcUa/bJaKOCtz3eYSqoWERssGeM+PXVjOPVfAP5lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCleHAtn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTkaFyaf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BC606A32C
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 15:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6BC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCleHAtn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTkaFyaf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQPv93495153
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 15:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MhWnJ4+yNVf79wR6D1VGPP
	l7WznIwx6HJxt/TazmJ4M=; b=jCleHAtnRT+F+7BtLeC/6TjgIWvzHFkJnpS5Vb
	ihXisJVwLRLGXsJw6r7G9FvmwW951pgN+vRrj6DUeAlvhngscJgAdHUdIHKw7q2v
	LQ/KoOu3LWZ+JD8SlMGArBJjnTRrzp2M+uYRWzYToIcm8LYM4VIi7W5+vzQrl16E
	Q1x/OFjA+TdUP/f8m+ZPtx5sj7u4l0+4fLGZa9KORzkwtvOcNCDVJktvSfvpugoQ
	XNcbOKW2/i7pw998rgjZpMRkkJ1L69VwzPThqDicjm8UtWtyFKZSWS9yyuWXIrwe
	cVVaMvFpQzb6rs/sE1ENZBxczWpkOxd9OqkZAleErGLhe7Lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbrkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 15:39:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso3545576eec.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795361961; x=1795966761; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
        b=jTkaFyaflGEA9p5n7+vaQy2NsBNY3g7PPxub5LZz2dvSvDapWpoXGmuHzhO9iCQ6Is
         uYGQfXDx4GrZg+VD/RUEn00Usz+Vk97aCFLMFbkd0+ZI09WmBYV/TU163ZOc/MFUQIRs
         GOsPSvsqhmxFefw2TtqSITx1MTo1k9IlNa65ydFcnya8eN4DkC47+y16Ica3lxwTUxbC
         dK3y0ajxzUWh0jhfDsuxo6oj70SRxA/qB1mwee1WbUwqwyAwdCbAts0fGS4UxmYMI8td
         JgS4/JwvmIfwWqbJJO5+l6nsbaIPQbdkHErSR8j+nENNtnrZw2THSmqxlmkmJQjvzW5Z
         zNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361961; x=1795966761;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MhWnJ4+yNVf79wR6D1VGPPl7WznIwx6HJxt/TazmJ4M=;
        b=n6W4kIHna12hkguNV04ACuHeA5ngyY3MLn1qX1SG5W4SyOirNMFmBM5QcpBKV2E9wK
         Oih6OYIyYUfjpZ5j6Z/UnnMicOaTV6E/CVskUCRy1dLY+Hz39VtsschDLIIXqOHxw1yO
         IP4XgJNOIuPy0x2B675wObMdlK/4KEXGDCt/Br0zpOq6bLAkMTOy13S5H+Om7AAebI1L
         DxGXZ0gjPg71YOCsvEGcWC0lU4fQZ8xHTXGboUduvtSY6+z74F2hbk8n8anZG88iwlH/
         hK0DWeA9odwrU0Tioa6Vyr9p+iY3SJ9yxj17PJ4O0900U0IhQyuXhLOgr5lgwJUrXOwt
         hlxg==
X-Forwarded-Encrypted: i=1; AL+hErHeSFtAJ5M2hXgH9Q9FeO3Yj14vIFqtI7ffZ20PAQUwNePghhBtQsaWeI/11HjiP5ueE5E7Gh5gk65nPssCgTxs@vger.kernel.org
X-Gm-Message-State: APuU4Z/oYu7lcerLgcBE0NKCSXCDkjBShcY75tUmjB5ek/rsEKQscsSO
	0miQYBNd5J38YEb7825Z7GZc9rtK5NCM1FnDCHqGlZoPLDCbw94S+rm+z5/sCxgQPVW0BqZaOfN
	ptvBclnjSD2jJVtrnix038+fZED/Wns13OdE1ioBlsav0oWwYiqoc3Qsl0WkVVUmJEettv0IW
X-Gm-Gg: AZFdTZdxXdPyEiGOsagscEQHUaAGdFc1H/4Ok4LUAtuXBYB4hgWdk/0M/ogkBlVynva
	mNxSAEwxUQTLb2A+8iL9Vka7QnT9mdrTMgwhdJw8lSYk95i8U7TgXrl5EyN5EuhLGLrfQzVgH+A
	43ry+zTBJ1FtzSzLQHEHVGsjbsbkTlI47nF3s8WM6wJfGfrmToI4p60mEh2OxXahkFAFYbh20ZF
	P1k6i7J5j1BU3MjV47uO3UPf04lBf0MbzhDfpysnFSseP1OALCeKqez4aVppZfvlCPPWCgYsuRX
	jHzocHQh5B4Gaa3Dmwa/UE3TujC/SUcj9AmjnzKqz3lI6amfKL2mP3PCTs+PkgegHUS/eQWcpRx
	hL4WhFnqZC5GJXBSEcSMXOpgqsuBkmCns6Nl+rHCFQra0M+OZirsXqoujhZbiCiyAw3XVLa0eFx
	tC82AgJ0jFig==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11417698eec.9.1795361960958;
        Sun, 22 Nov 2026 07:39:20 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11417676eec.9.1795361960347;
        Sun, 22 Nov 2026 07:39:20 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30354900eec.14.2026.11.22.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:39:19 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:09:13 +0530
Subject: [PATCH] rpmsg: glink: Don't reuse a channel that is still closing
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-rpmsg-glink-dont-reuse-closing-channel-v1-1-363d90d7e481@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKAMA2sC/x2NQQoCMQwAv7LkbMAGuge/Ih5Km+0Ga7okKsKyf
 7d6nMPM7OBswg6XaQfjt7h0HRBOE+Q1aWWUMhjoTHMIRGjbwyvWJnrH0vWJxi9nzK27aMWfpNy
 wUEpLpJgjJxixzXiRz390vR3HF+EtSPh4AAAA
X-Change-ID: 20261122-rpmsg-glink-dont-reuse-closing-channel-d2aaf525c5ea
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795361957; l=3880;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=bzjkglRWWIZIs5pK+2OezJTD1Sz6g4JZ9UMkqb6Z4gw=;
 b=zY2qGpnxXY08rKg4Hk/zXN19cJHiCfGrhAH7Dvyohdfw3hLrJijf4p/DUMj1miYmBqGHKE8S8
 ICzGXTTlx+hCOJqTvz3yonvqP3/gqys/YmYbT4ieDdL2D7PybNsUes0
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2MiBTYWx0ZWRfX+eIbQijOkEKe
 Aw4RrweWlSa3mYypirGZSQyWtuBLcjkbhKznNYlBEG9TdMlycEE1/D4CsJV99AC+pmwYYYJ9vjS
 xIcqDUO7bfkZMAKOeUN1AwHN0M9IrPMaPid2Todi8dhL2QNcdGCaIWnUQtbUm3VxskIvvRD3m1f
 FH+3Ayn0B6IGGLOtVINC05B15UbClsqLmab6YOFd8aBOZz5TV8nJLVxI3ClbBA9hvPdXcUV0Aez
 UGpxLP2GTEFQyMsu4xkWKveoG93smHCI+LcptyEtJtWW7nnApjQ54a0zReCEa6ySRYnu0sJ96xz
 KmgCHG32AfZ5Bd+m6BOmq9x4q3iWDQouFyGocJ2OSXfnuQedF4u3lY2CHX0zSPrKTYAY5jP+E6H
 vZn5nvGVZa2Q7q6t4lg590wPg7NpOj7qes68qMQyB8zq/pTlxcpiPUCpDAifC4fwBbtVe3eam9P
 Fjv6BQme6A+q2TOkC9g==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b030caa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2YlJufyw7Tv86nj3aO4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2MiBTYWx0ZWRfX+zUzFSSqC0jr
 UMNZJbBN9d9m1GIf8CmWcKKTq/y9+4A05pvUycA38o8veJ6BJBj7wXMcVIloDAIuLKxEpnyr0+P
 zF0aIzgMRIykqbmWvNOf3g5jP7Ex+/A=
X-Proofpoint-GUID: xVH3Qu_Mtk32L5JIt9DGMVRY1TPDEn09
X-Proofpoint-ORIG-GUID: xVH3Qu_Mtk32L5JIt9DGMVRY1TPDEn09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220062

qcom_glink_destroy_ept() sends CLOSE, but the channel stays in rcids
until the remote's CLOSE arrives. If the same name is opened again in
that window, qcom_glink_create_ept() finds the old channel and joins it
a second time, sending another OPEN_ACK for the old rcid. open_ack is
already completed from the previous session, so the open returns at once,
but the old remote intents are still marked in use and every
non-blocking send fails with -EBUSY.

When the remote then closes the old rcid and opens a new one,
qcom_glink_rx_open() finds the reused channel in lcids and adds it to
rcids without taking a reference, relying on the allocation reference
that qcom_glink_rx_close() has already dropped. Closing the endpoint
drops the last reference on CLOSE_ACK and frees the channel while it is
still in rcids. The remote's CLOSE then works on the freed channel, and
the next open walks the stale rcids entry:

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:28 at refcount_warn_saturate+0xf4/0x148
  Call trace:
   refcount_warn_saturate+0xf4/0x148 (P)
   qcom_glink_work+0x318/0x10b8
  ...
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : __pi_strcmp+0x24/0x140
  lr : qcom_glink_create_ept+0x78/0x2a8
  Call trace:
   __pi_strcmp+0x24/0x140 (P)
   rpmsg_create_ept+0x40/0x60
   rpmsg_eptdev_open+0xcc/0x128 [rpmsg_char]

This is seen on Qualcomm Shikra SoC with an rpmsg_char client that
closes a channel on the LPAICP edge and opens it again right away.

open_ack and open_req are never reinitialized, so a completed one
marks a channel from a previous session. Fix this by skipping such
channels in both lookups. A new local channel gets allocated instead,
and the old one is released as before when the remote CLOSE and
CLOSE_ACK arrive.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d170ac82d906782ff473d3e63f490..b23db2b90fcdbf3592bd73aa24486f592f7189aa 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1331,9 +1331,14 @@ static struct rpmsg_endpoint *qcom_glink_create_ept(struct rpmsg_device *rpdev,
 	int ret;
 	unsigned long flags;
 
+	/*
+	 * open_ack is never reinitialized, so a completed open_ack means a
+	 * previous local endpoint used this channel. Don't reuse it.
+	 */
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_for_each_entry(&glink->rcids, channel, cid) {
-		if (!strcmp(channel->name, name))
+		if (!strcmp(channel->name, name) &&
+		    !completion_done(&channel->open_ack))
 			break;
 	}
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
@@ -1637,9 +1642,14 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	int ret;
 	unsigned long flags;
 
+	/*
+	 * open_req is never reinitialized, so a completed open_req means this
+	 * channel was already paired with a remote open. Don't reuse it.
+	 */
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_for_each_entry(&glink->lcids, channel, lcid) {
-		if (!strcmp(channel->name, name))
+		if (!strcmp(channel->name, name) &&
+		    !completion_done(&channel->open_req))
 			break;
 	}
 	spin_unlock_irqrestore(&glink->idr_lock, flags);

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-rpmsg-glink-dont-reuse-closing-channel-d2aaf525c5ea

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

