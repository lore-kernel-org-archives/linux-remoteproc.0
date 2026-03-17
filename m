Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B403C4566
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751036; cv=none; b=Q+IAgjVRbpqAupJyQ1hc0p5ZDfijKXGL8WBwl6OeRZe6x9D0Ldi/dpuDcW3/1AKFQW/9EMUnWQWt36rM9SMYNo7cq/V92mI4bEXixupthDbymC6AEvV4HCXEvYNO6N9MPGCxE15+iQj55VcLv3mLBfnKuD4+NdlH+rMSr4smChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751036; c=relaxed/simple;
	bh=Jasx6mrT3KTPv64fBNBn5bwZKlN7tZTYnUZJNQj/84k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaMMwt8LW8M0N3aWwC4TeIlDXGHvHV47Vu6l3M43TT6H98iwHeJEa+UqCVOTehdLcAyueq2YCwBsdgy9Yh/8aS3WPu8nJxzm9LhlCEmhyMsURSOf+YYOunmwm8kzpBLfwuXbqOc2JMaB+PHK41MQG3iVJqwH2BjElJqVX3ES7wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuFx0XbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3Ohf3sF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuFx0XbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3Ohf3sF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8rbNZ2315648
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkZNNb+2TnjXOVXhkg3lk8FFLvFPiM6EXM36fB+6xUg=; b=IuFx0XbLIaafjgGC
	pw295rrrfdS5OH5aKEEU1VKL/w35VinC2WRVrpvmZqpYKkzn7xwyK1fhVjSsDxun
	y2I2o+lu5f4HvEOvv39j6gNQIlPsSxPJXL4mf3ig39aT+4wgoQFGO9WoeNFWaUWQ
	5FlVbb200FPhbw0cpj65+nLUiUUyefCPd3iWjCsPTqLKM9LYqqRJEtj4KZplqoYO
	bXURt4K6NhU4S0NpdPws4NVcYD4B1djCNyMsuPn8fwe5kVoodLrMc4ZJkK0Vfpeu
	qLi8wNv9zJEbx6itURcJ3TlNlmULmgFVutiaQRrceBg0APr89tAtFc/BzttInLuv
	PrCd2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2bunc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd80c4965aso497181385a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751030; x=1774355830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkZNNb+2TnjXOVXhkg3lk8FFLvFPiM6EXM36fB+6xUg=;
        b=Y3Ohf3sFfo5vuP/g718whI80KF4L9H3pRBRKR4JRWebUCg/zPIoRNHvvxSTYkxtPzn
         FD/OnYy5F92xGlZQtC0VG6hJWvz7jlgd1+ufiHz/ateSKADONR3F3uoYizay7VU135Mp
         f6NBUMhk0HKCvW0RX/ApB5a7ccLv4lVx4BqNzyR62Un0RV8oL5IPS4LI6nSB7idfWn2d
         6Wu4hR7fXrRkjl8NXMvfk0rZn+wZwobs8a9lieQ+yQ1vInkufIbdYFeRPQ09m7dcQg/W
         x/bN+Wz3JC9TGNmR7Hx618TMv6Zp6bdJaA9YuQP4WXWxqkAI9mnaY8nOfF4pBpqY3yK4
         n8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751030; x=1774355830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BkZNNb+2TnjXOVXhkg3lk8FFLvFPiM6EXM36fB+6xUg=;
        b=PVfS2WDw+iNpUXLUg/WBeVfkajqHWItA6q4W1aO2LAY0+f/dbLXFB+RdQRbX8Dwve3
         i57N4jpe0ll7ipRocGkDljJ1yfAF74k/2ILuoTVrgSWqVA8e0cqQqCMFPhKdCyJXPdnQ
         F2XxqtwrYtHKjOKl+fhf9JPeog/CV7Q71kU4wGnyk+kvSHpWuwoaMYpzgKFoV0zWQvhc
         pSUVCK4IPtSSKjMu7r5Wu1sG/dY8+pc6+M/g+Y1bhtuTQwstBbHnedv/CijzeDyhLWG5
         15j0Vx979vdg2aNp7O6WwkX6hK1EwqaEIEQotuzMY/Z/T2QzR6peZb2SweKD5wyq+bfy
         DZ0g==
X-Gm-Message-State: AOJu0Yyk2gWopAJ0/T0o9YfJaASBf6HUmiq73UuuvUjMS0ML1qiaElnv
	mftMCpGBxn3YfQC0Ckf4QIROW7chwqFUss4KFWKdStTJxbASlrSC9OebA+ET8UiIiF/9A3DEUNn
	BUddjxyUAbPFR5vLwRVqvg7hDcF7j3AadC0eFiJhlRB4zK3Sue/KPZVUSVK9PyBiZEq1Dw5sZ
X-Gm-Gg: ATEYQzzC95RZkyvCyqyDp3j8fjN4yV54eg6wNHRbNpL9LUZ1gU5PstpdRmb2j2fynra
	wxxfSd7S6kEFfMmerThaZpfuZjFeSyk5Zk6E8cadExigED3pk52zvuXIreB78BUjA+ayVLW/rjd
	J6u9sWvDIp98tSPd9jGTamY5z4MceT1q8ysDWhyuER84CqShUXT1w1X+FQd7zrutQuiTUQy5g7K
	cQzL+lHCx/gd5crYR8zuX/yJV+t3dD7bPRHFxlf1y1A6W5XC560V8NaYwtRzg6mitY5yYGo4HTw
	JCqvhdNrjBQFrCZoR03gobvmT5AiKugEaUqDS04d798yAVaLOhWos0ik7QrJ3kJQBuA6CqVFeZx
	lbZvt74fbmwg+N7W5AaAXIKbc8n0IC4/h1gDojGQU7AVT
X-Received: by 2002:a05:620a:298d:b0:8cd:9020:f041 with SMTP id af79cd13be357-8cde1512e14mr361286885a.34.1773751029361;
        Tue, 17 Mar 2026 05:37:09 -0700 (PDT)
X-Received: by 2002:a05:620a:298d:b0:8cd:9020:f041 with SMTP id af79cd13be357-8cde1512e14mr361282085a.34.1773751028718;
        Tue, 17 Mar 2026 05:37:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:52 +0100
Subject: [PATCH v3 3/5] rpmsg: Constify buffer passed to send API
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-3-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13629;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jasx6mrT3KTPv64fBNBn5bwZKlN7tZTYnUZJNQj/84k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrp/30qzgAy8cOZXGTXGuGGDebqtfbDv2CNx
 xX9zb1aj4yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6QAKCRDBN2bmhouD
 10ubD/9ja6JgtUxcfD1ZLzleawunPEH6dEaXI3hWiN+2fBnHnJOcaST7qigFlmUfyHaI514yuMy
 jyFJrTOcN8S13Xc5lvrsLmNLCMzmzHcaaqf6g8z0maBu8sW9N0nWjA/MLS21Hb6NOkBG3oNKfQB
 hVYxhOi8Eqq0nMKmXjeu+Znu21tBMOiPo3Ly1sCdPBe4XVnK4wuBXH6pRSNzz1QbeLiMDdpyMp3
 qzO8dT3sNGYl8mEMs6XNAqHRnFNV6E4jxtvsEGZQZoUDNQX3Bai3PGyQsEeIens4c+eksrswKd4
 h3r9IwuFEgBILpX4Zn4JzMMtCpMycD1axMoUEYqPQHbRaMWGuvqprzKtDwGABOBseOuQYQpHy12
 AFav4g+BUL7bw+vJQxWm6s/+iYbwgFC0lHh55xt0VJ7FsEVTubwwSfnBMo/k0vPjYChFn2DbWhi
 Mz/s0xVcZ6v9pE7toSJ1ZwUAkH48HbgBcu55y9Q91rMV+52foklaxAm9agrj8UA+E6kzGdWH3vU
 WxVcwgClsuOdN9i6UIRf//FQQmQ9kMJ3SGvZPVSa0YaEcRSLwxYuS73Xooyt4Q8rT+dOw5nBcLq
 dvO6VSOSZV7u4BGOuVqmukefchOLTuxpqCOr9JpaPMwB/MRKmEmJ9kK2gQc+rkJsEBOMgG4i4vy
 es2RiiPMMveQq2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: GTbqAcptV7refk9gMX7YhDbWVUlYxgnu
X-Proofpoint-GUID: GTbqAcptV7refk9gMX7YhDbWVUlYxgnu
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b94af6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=7kuhv_acGB6hOQYBqC0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX5cyGZRfT+il1
 Nw1vvxpISAL03r5XpSDZFY87Cjxb/rGfcl2OmyeFs0LI5JsJ571ntk8Oh96vHrQZp4Me7VyWTJY
 cg8r1MKW3luCPkcL+bipr9kPrOF0jO7ft0gUiZcrBuaMNf5YIA/YhDh3RQeEo0WE2JBAFIu+CB6
 +fgco7TgtprM2Yo6giCFYnJLolHrbiePziDJu1CH1gl4SL+1I51//FvBPbEOcBBBQx8p/7wC067
 ClQo88AY7u3sRk5HaMKts3l1ui07M34XtGcnxTLgTetYjSTxomnm+W7wM9IxAlLSLDzcBcGS6Yx
 zX12VFaT0FPL2shdW3YRPrP+nncNdIAc/oJkcbZJc8YN5UQpPQwFoGmaHuULxyyg5Wcuwv4AAyw
 JMw/LT4BQsFkIT8oBmqfgwCXEFHuoUQomDx/CQWdja6YCzJ5SOp4KzTh7RBhxnorgndcfA5whdP
 uylyFj2Ja4czDbrLUvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111

The rpmsg_send(), rpmsg_sendto() and other variants of sending
interfaces should only send the passed data, without modifying its
contents, so mark pointer 'data' as pointer to const.  All users of this
interface already follow this approach, so only the function
declarations have to be updated.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/rpmsg/mtk_rpmsg.c         |  4 ++--
 drivers/rpmsg/qcom_glink_native.c | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c          | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c        |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h    |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  | 24 +++++++++++++-----------
 include/linux/rpmsg.h             | 17 +++++++++--------
 7 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 0e03c5336609..1b670ed54cfa 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -135,7 +135,7 @@ static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __mtk_ept_release);
 }
 
-static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
@@ -144,7 +144,7 @@ static int mtk_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 					  len, 0);
 }
 
-static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
 		to_mtk_rpmsg_endpoint(ept)->mtk_subdev;
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 9ef17c2e45b0..401a4ece0c97 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1474,7 +1474,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 }
 
 static int __qcom_glink_send(struct glink_channel *channel,
-			     void *data, int len, bool wait)
+			     const void *data, int len, bool wait)
 {
 	struct qcom_glink *glink = channel->glink;
 	struct glink_core_rx_intent *intent = NULL;
@@ -1553,28 +1553,31 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	return 0;
 }
 
-static int qcom_glink_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_glink_trysend(struct rpmsg_endpoint *ept, const void *data,
+			      int len)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, false);
 }
 
-static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, const void *data,
+			     int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
 	return __qcom_glink_send(channel, data, len, true);
 }
 
-static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, const void *data,
+				int len, u32 dst)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index e1eb450f4fea..3ac863f400ec 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -960,28 +960,30 @@ static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
 	kref_put(&ept->refcount, __ept_release);
 }
 
-static int qcom_smd_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int qcom_smd_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
-static int qcom_smd_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
+			   u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
 	return __qcom_smd_send(qsept->qsch, data, len, true);
 }
 
-static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, const void *data,
+			      int len, u32 dst)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 96964745065b..2f9444d1f194 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -182,7 +182,7 @@ EXPORT_SYMBOL(rpmsg_send);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
  *
  * Return: 0 on success and an appropriate error value on failure.
  */
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst)
 {
 	if (WARN_ON(!ept))
 		return -EINVAL;
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 397e4926bd02..a8b7065fd165 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -63,11 +63,11 @@ struct rpmsg_device_ops {
 struct rpmsg_endpoint_ops {
 	void (*destroy_ept)(struct rpmsg_endpoint *ept);
 
-	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*sendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
-	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+	int (*trysend)(struct rpmsg_endpoint *ept, const void *data, int len);
+	int (*trysendto)(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
 	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8d9e2b4dc7c1..5ae15111fb4f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -136,11 +136,12 @@ struct virtio_rpmsg_channel {
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst);
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst);
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len);
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst);
 static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 				  poll_table *wait);
@@ -490,7 +491,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
  */
 static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 				     u32 src, u32 dst,
-				     void *data, int len, bool wait)
+				     const void *data, int len, bool wait)
 {
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 	struct virtproc_info *vrp = vch->vrp;
@@ -580,7 +581,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	return err;
 }
 
-static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -588,8 +589,8 @@ static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
-			       u32 dst)
+static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
+			       int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr;
@@ -597,7 +598,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
 }
 
-static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
 	u32 src = ept->addr, dst = rpdev->dst;
@@ -605,7 +607,7 @@ static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
-static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index fb7ab9165645..83266ce14642 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -182,11 +182,11 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
 					rpmsg_rx_cb_t cb, void *priv,
 					struct rpmsg_channel_info chinfo);
 
-int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
-int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
-int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
+int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int len);
+int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data, int len, u32 dst);
 
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
@@ -249,7 +249,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
 	return NULL;
 }
 
-static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -257,7 +257,7 @@ static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
+static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data, int len,
 			       u32 dst)
 {
 	/* This shouldn't be possible */
@@ -267,7 +267,8 @@ static inline int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 
 }
 
-static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
+static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data,
+				int len)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
@@ -275,7 +276,7 @@ static inline int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return -ENXIO;
 }
 
-static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
+static inline int rpmsg_trysendto(struct rpmsg_endpoint *ept, const void *data,
 				  int len, u32 dst)
 {
 	/* This shouldn't be possible */

-- 
2.51.0

