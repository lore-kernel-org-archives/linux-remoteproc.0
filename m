Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0813F20EE
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000594; cv=none; b=qsoWXzt0Knlpbcv/adEFX2Ywp3jNOND00ADIfzYupoMFU+UDP0PonvB2kQQ4sMghN++AIoPaUKfeUflXCnSqhnDjG6C4PK7z+U2GwyvIqXMQ7nCgtG8Bzm2t/mvaJ7j5G6yHewSWOxc588YE2fkf7C3Lhyo+yssECGo8krCSuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000594; c=relaxed/simple;
	bh=kCOJWtO9F47+b3gcGs0sqsq2t7/rJoV4159sYbTNwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrXTn5PHx9iRETYb55aeZJWdx9E95HVax/a6rcTdAqIAc0/Lo/ak1gd86g3cRISpKgTTeHAf2/qbbZ0LYEywdiLuHdwZv+OEieA8tOg6tlI0Km0aUe8kfM9dppnE8FWyKfZZw17HJfMy54pZcZRkbz2jNx/JfKH9LrpGWpRLAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJxaiRNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiCaM8YT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJxaiRNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiCaM8YT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xaNH2320656
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6543jtmJUE
	4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=; b=XJxaiRNTSqd5roaNqNiPS/EZIgK
	VJf1nzyeNjzj6k9/oSLDrjylCqGas0knhhYoN7jc60SCm/240dYUnQE7Wf9TNmw8
	s3N119IvtVzw4GTDzgDru2+CFBJejd2MDbI6mRcIXK9GTS7mjtxbW3m63kM7KJhF
	Y79Y6Y0A0xftorUVp0+LU8j0cVkIOHRkwA40g3JQW2Aq6TXBY8F5aeS5JnHuPfaf
	YITLG8+CeV8jOApDzkayCjrrZtfudZD2K3FT2bzaLiJkBhAcgdfUXhxvZ/Kc7GVi
	iF+ZtNY24EgC7etkf0Rppw55RwkYtzYhkpDciNtLikijD/VHZMan++4Xz9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearq1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf11699875so55576065ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000591; x=1781605391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=PiCaM8YT3pAGD5UpVDWNACRXFkXw2FZNRVBF3VFerszgY8uS5sOWujb+vl/bg5mtse
         bLw5xNFO6+gd07c3G+VpTKpqJr5uNr6VhxxB20xM3we4SAJiUJLNO7cQGwnxEftxH59k
         4+3+JgbAokCxE84EsGtvL5c1qkqOSIJEK2SO+juJsJ20U/vKjnMKL0EZRRC/NrAOF4bw
         fwDEYg8aCATb9dqKlGx1O1oG+QONWlLQ7ABSVAWrFf4QOCOd80ZmFmpXiEZy9R7ZoHum
         3s5+jzCvPTr43LO/QeLjAN03RLk94l15KpVihjJHvs48h2oyVPBS626TyJVktOawffxp
         KWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000591; x=1781605391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=G/3QKGQWS1LWyHktK7v4XRjkwfnHw8gglA1/fTx91ZFHbvDzK/lJRpp4EpqZNlcy8q
         wYvo5jLnCahbkoJKB8J6oo5RYlvqX+mQ6264yq9po13gRRjfmF0VjTJW0TNkjlXoq4Rv
         kuT213zWON6LhBZpyEMWFgFm5KTty744LICgyieq+pbSvNSr2DaCl1ZR/ts4G65OiVBP
         n7fizw5bpsuiGDWkMXYZWk0dmEnI9jRoNoTqcOXtkv9fGbwCNU3DMPxt7IeytnrwI9KF
         Lt+DaCXnvCyvnNuZ49XEW3J4l42MVZAGYI2uSyLlfJeMP0xfwzqBu5H862c7Mv76RjfT
         6H2A==
X-Forwarded-Encrypted: i=1; AFNElJ+Fez6wR6O46HwW8OtVgHMI6QrSf20vPgH7txSPDGH4jWGaVPKeHG+eoWBm28Iz8Aj5gYj1gYKLCk/rtuT6zxoU@vger.kernel.org
X-Gm-Message-State: AOJu0YzbclUF5Tqe1Ps+UQltk5PXp/JyfokqNehIwjXI7ubKTUhdelcg
	mcJLhmXPr+kArXUYhUnl4RCEZx9gykScTxlvOOJ/jdV/k+d8HgMtgNWmVsB32XqbIx4dD6UZhgU
	1CCvdrs2DhR+bmTf5otyvfb5Ufpn2WAUpawlQUFhN6pkGOV/03hyqogPGUHjN/28puAsGBXth
X-Gm-Gg: Acq92OGgtTEhncJwC5DMNSlSwc0kyKNLHD0AEv4n4zx+XsVK3/6xG7ZjOqF/bthcQNv
	t4A6N4/N0eCiCwmTUHjdg+b3jNyP/6WDgtysbOZt1np/T2T72SEwiR+/IULbybCMENDzsW7iOFw
	vjm0n8mCpSAXJQvm3H0mDL7CtISVIR+tnhlRdd9LG5y4gEn8/s/Z0DVtVhf6mNZ5/yni2VTtODC
	cec03lEGtVblrViHBBPlZLmlDaLZQHgnINByedZ+pXB+ybk3OhW3yU9jh8+yVYV+CAOP4dSTd46
	YwGlr/WPELIBNN5pSMDuCsE9Kg4O+A+Ah710XGvULjOYWFHJCUBJXmCeuHvWV7+w5IxkHO3bTEU
	0gSpoDbwE3ZR3jPIQoH9k2EpwbwOYa9cFXcY8KnbmUXKvf6DKR4S5qXmul1k=
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681575ad.13.1781000590907;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681235ad.13.1781000590335;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: abort subdev stop sequence on first failure
Date: Tue,  9 Jun 2026 15:52:52 +0530
Message-ID: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zlp3xBzQOjHxR3UbDEVsu6dENE9hIA9p
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e990 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BqsRjhFJy6yuMY8SxUQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfX9syBnAb3rjGe
 PAFbbSivH8JmZYnOxozoBtanQdD/pRQ5ioM0uCxIMBNm0nwzULShJXKUMYhBU3DZriwzNwxaSLg
 UVEu0KYnglS2tk9BPLX+AwrznMo8LirEfkGmGufTDxeU3EHK8I8LhPf5MfC6sZn9ixoBWrbxfe5
 MCFYjzFejz0La6wZB3dind4TTJFuPwHwpePGwuNmkYplH21BzqAVJotfK86Pu6O4KKaU5OIShwG
 /AXpIPo17HmiWkcbl/zJ6zMHjqNmqfABtjvO6X3cgvMeuU/zZ+6OJNa2TIHyZgS661lZnLOxX4x
 RaxuShO2f1+UX7pPhuQPBlhmTpyyM7Woa+tJJodL1jUDmfn/WZE70hZIvH/+AZPou1m+T93MuGW
 PCy5pnBIcMeOc8JJMJ3Lssy7MbWO5+rsQi01JYA1DEpgMAhMWnOQEhQP6XY74MEMkt4mqrdH9XM
 7AXYc7B7O4VwBN0lt4g==
X-Proofpoint-GUID: zlp3xBzQOjHxR3UbDEVsu6dENE9hIA9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096

If a subdevice fails to stop, it indicates broken communication with the
DSP. Continuing to stop further subdevices against an unresponsive
remote processor could close rpmsg devices that could remove the memory
mapping from HLOS and in case if remote processor touches those memory
can result in SMMU fault.

Change rproc_stop_subdevices() to return int and abort on the first
failing subdev. Propagate the error through rproc_stop() and
__rproc_detach() so callers are aware the teardown did not complete
cleanly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 21127d972bff..77c4f09c7604 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1110,7 +1110,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	return ret;
 }
 
-static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
+static int rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 	int ret;
@@ -1118,10 +1118,14 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->stop) {
 			ret = subdev->stop(subdev, crashed);
-			if (ret)
-				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+			if (ret) {
+				dev_err(&rproc->dev, "subdev stop failed: %d\n", ret);
+				return ret;
+			}
 		}
 	}
+
+	return 0;
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
@@ -1712,7 +1716,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	ret = rproc_stop_subdevices(rproc, crashed);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
@@ -1751,7 +1760,12 @@ static int __rproc_detach(struct rproc *rproc)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, false);
+	ret = rproc_stop_subdevices(rproc, false);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_detach(rproc);
-- 
2.53.0

