Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED032C95A
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954304; cv=none; b=DDZmIYlmcb865bOUVn8pP59rPsod4SWhrNKE6E+6yUJPe35BBKwh1G3zOgUmU2ZyfYTbS26JP3TOYFohTzJbioNPevmYSb7+D1AIC+RK7RzA1uc+S01tt5K6X9FB+wxXsXn5Zi8vzrfAbnb9HO4+Nb8PXQwGVwX1b/tOJy2e3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954304; c=relaxed/simple;
	bh=0I0qvqymRF9QoC70JOSPLWPw0M52SYeSoFmasyfSf3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx1IAN8+8vxnLgGSqstA0zpfd31qZb5WrpOs4LbYDWFWfXuM41P5GhMblLE53leD7SaqAFAORroiv7Y9bR20XnwhPmgngkgwCkVvFYYPvA9f8O4GcUkFF5iA0hfJxgLuLsMPbsSEW5pzALlVGVy8s4y3zBOCl+E4xdOhDg50QZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Li+DlOsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsjiMA3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Li+DlOsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsjiMA3X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FETl1872485
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyqEdTkNehZ
	DD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=; b=Li+DlOsuK5SgcvNPolNg2yRB9hL
	OXELOynD+JAaSPlxYOAsc8cFFWR/GOUyv1q5c0xEGITWS21zrgDZFr/hVBCDEu2R
	dFPwCuGCuBRz79bN/9TL513SbB2u61G/qUCLm7ktK77TVGd90zGFdSKN1R/Eo0Mt
	4+fxlHgug8ixnR753JETKkqufgWhrImoeGUjp/oXbgwRS+mbTqW3utC0Duhg1eRM
	jhNdg3JmskjBKHd2NSE0E2JlqIh/4smmtlmsRoYSiZMeCAYMOYnHtZHGb1MFfLj1
	YfDcnB3V6mOxYSuhxQuJ5IjgY/yj4qxx7QPpKGviFJVMPIsQJ8Z9yqcacmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq8vqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso35881885ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954293; x=1766559093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyqEdTkNehZDD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=;
        b=QsjiMA3X/TPlaZfTKZ2zJbK9myO1itwW/VwNRnJt+ylPBBuIvuGtMXIPpRVWA7g6nt
         xSVdKh1ZY02ntCiIG2IIGGWKlEA4VQG1/fWfv5X/NHWCGgdprjvyZ1bhEXCcAiDZjN5h
         lW1Uc58F4tLr/fwI8UYrDiOXmVIYSEVmylssjQOXLcvWA2K4w1DHsM3NFQbNy0iUipB9
         WzEvcSY+B5RW+nmdbp7VGk9bdiAC3XnNYCauRULIwG+g/LqwgNA7V1EsytEix5TF65UD
         9P7+0apw3ACHaSmXkIlvdaxG0DQbvXcY702h24EYEdJyDUdckHCrausKCzdjH+iLyJhW
         WZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954293; x=1766559093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyqEdTkNehZDD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=;
        b=cZTqdsILRpcxxv7lUmuXNy6ELH5yCw7tymuXN9n2GomPRTE8W9U0vNp4mqOArrU3YA
         /24/mA3YmgPuQRgVP++7L/814Csty4JqCtH95JO2PW88rh2zcDvKpIl1o1mgDCQKkF3M
         FcSMPh1P149P2ywoAskAR/VFc4XkSgbaUawAnROxaWFL+YpqzS17J51CLSdMhREcFV3V
         j/1fk2nJXI91VOsE90KQ37CVNtxObkuF/2hn4nSrS3+mtMS3vBewm4p+ylgwtD5wKOEl
         iypPxe+YHksaZzFA4iOHQFIqSN2gsDodk6rm8ZAw29JcUjvW51u8LpoHEAfwvd5Dr14g
         kV0A==
X-Gm-Message-State: AOJu0YwywM1WUrJpMXYFDK6MIYqrUYXElMHg9jSMlwWNw9RvKlXJWfzu
	9CZ0ho6zM1MyrT/FKhKSDW0VUxGqcUj5F1YUIVTdhojiqIDWvLEDnbizU4pp6HX7nAKtv6Ns2ke
	qR1mnYbqZHkp9wFo34JKNnLA+NblufPyZzECadxAA5CR3NeiqE9pSbFrOj7tSQrDjF4H65L8H
X-Gm-Gg: AY/fxX5oubtP7LckyIHB69yvhKQ+CkuMuSdPpe/uZN+AdgTr4CCLJSLyFD5sq2yYcB2
	QTjwhW6WnAjKNA4onsJvjrjKrjRbO9zPl2dvM/knYzc5oMj0y9sH+fNP411122xTvBEBMI+bW03
	p2Jb2bcYAwRCrg7jBUDOoVL6J1wPqXhBDMD4SlQpdkMUZ+NGGjjnd0IobYuH5Oopc8ZwvDT2QKa
	So8iKId7Noapl/ZHDoF/JS84J59A4GfSedgnqiqM1aubyJJJe2aPYyvCs0Ik5jncuFwvVX05bwM
	VLnFGAB99saHBxz+KoCAXfHpQ86oIg0JQ1uFednt2sTOic7wC/dZ/mp84tACYT9/VKqCZx2Xj8u
	8HsIYj6aGNB/HUpwtFe6Yuw0A0q6vm3gH49tyL4duRTTtU+ODh7pqJYVt/zXshon8BrI8Xgm4HR
	27
X-Received: by 2002:a17:903:11ce:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a13cd8d5c2mr49204215ad.57.1765954293253;
        Tue, 16 Dec 2025 22:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtqz6CiOwlW1tkl+yctLuwFblPw8bJgxrwHp/33FxU5mFEQrIOanR0EDlUZNhr30xxaWfvwg==
X-Received: by 2002:a17:903:11ce:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a13cd8d5c2mr49204035ad.57.1765954292751;
        Tue, 16 Dec 2025 22:51:32 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:32 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [RFC PATCH 5/5] rpmsg: virtio: Optimize endpoint lookup in RX path with RCU
Date: Wed, 17 Dec 2025 14:51:12 +0800
Message-ID: <20251217065112.18392-6-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=694252f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4XvfFkW6Ni2-fQWSjOsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX9Kokk4/UAsKn
 xSrt1szPKCy2rg/11f9voB3ZxW1pekD/GUtjvpWbySDxRPwsS4yGX7q4wE5HwRclhdXQr3OWqDA
 8nuHp08JEYcrBGDOrseazTt3sfukaYtG97P88H96quvGql1g2dA19uQY1Z4HbYdWV9cx5bfsXpT
 BPudc45RUtdPLldkXEVsIy229oDXI0DV2B/pStINKBjrKumOkGKe2Aj3aGBR8ULKtyEMm2UZqSZ
 vKpqvbI4LA2b+sPK2oNEhveCGkFtP9tFu/pjgZiUc+Iz/D5ycfCO5w5er51KJzO0FWofEn06U9s
 Kf0O4nxKDJfznHYyQu7ZH8U9DsQuKuu2rt2AccMPTzCkcwyzYKwwhWc3qKOdJg/5T0D66hwfh2X
 sDizcijKBZNGIVu8f7ly36yjEjm02A==
X-Proofpoint-ORIG-GUID: FToaB5zfbVplCQ0TNMJJBE1BkikncbhU
X-Proofpoint-GUID: FToaB5zfbVplCQ0TNMJJBE1BkikncbhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170053

Endpoint lookup in the receive path acts as a demultiplexer routing
incoming messages to the appropriate endpoint. This is a read-heavy
operation (frequent message receives) with infrequent writes
(endpoint creation/destruction). Since idr_find() is safe under RCU
read-side protection, RCU can be used to optimize this path.

Convert endpoint lookup to use RCU:
- Read path: Use rcu_read_lock/unlock for lockless lookup
- Destroy path: Add synchronize_rcu() after endpoint removal

This reduces lock contention in the hot receive path.

RCU safety note:
When idr_alloc() returns, the endpoint becomes immediately visible to
idr_find(), but ept->addr might not yet be set. This creates a theoretical
window where RX could find an endpoint with uninitialized addr.

This is safe because:
1) When endpoints are created via rpmsg core callbacks, initialization
   completes before announce_create() is sent. Remote processors only
   send messages after receiving the announcement.
2) For manually created endpoints, drivers control timing and typically
   do not announce until ready.

Thus, messages only arrive after ept->addr is initialized, making this
RCU optimization safe.

No functional change except reduced contention.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 79d983055b4d..4cbb8a8aaec5 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
@@ -297,6 +298,12 @@ __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
 	idr_remove(&vrp->endpoints, ept->addr);
 	mutex_unlock(&vrp->endpoints_lock);
 
+	/*
+	 * Wait for any ongoing RCU read-side critical sections to complete.
+	 * This ensures no one is accessing the endpoint after removal.
+	 */
+	synchronize_rcu();
+
 	/* make sure in-flight inbound messages won't invoke cb anymore */
 	mutex_lock(&ept->cb_lock);
 	ept->cb = NULL;
@@ -680,7 +687,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	}
 
 	/* use the dst addr to fetch the callback of the appropriate user */
-	mutex_lock(&vrp->endpoints_lock);
+	rcu_read_lock();
 
 	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
 
@@ -688,7 +695,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	if (ept)
 		kref_get(&ept->refcount);
 
-	mutex_unlock(&vrp->endpoints_lock);
+	rcu_read_unlock();
 
 	if (ept) {
 		/* make sure ept->cb doesn't go away while we use it */
-- 
2.43.0

