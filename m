Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77ABA27;
	Wed, 18 Jun 2025 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239893; cv=none; b=U9BCC5lpf8VE8AoAFo9XLqB12fB1qvgEkMztMV1AA0CEbFKGDgflbUvZX1pfeDzVj5mKwFirJQoRupeJXPCIs50Ha5IIY21ABiaVwN5vqMejoCHxQqxU7LEjGSj7APWmYimTqJbjTKRMGBR85Q2CBXKCTPojCjQ7ZaECKAlMoWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239893; c=relaxed/simple;
	bh=sFpOWYXshkQpPlzSxedcoc/wnEsD43hfCXIO/sJKvrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e7GTIB4thLkn9lyLbB1buKtSAf6eRl/KBKRaFQfpzOm4WHdic9JEccvzA7gp08zBSo7iy614ctRJlky+clcaXG+YFwgLayVDYBeMb6YIT0C9HetBoijp9xr4Qx5WTW3gZ4Nln6MIalmvinflO9TD5odcJ6jGPJm9wa4YERmWrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XpDDpXPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XpDDpXPn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8CvgP031861;
	Wed, 18 Jun 2025 09:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dGHxe/4dO5PqPpeX1XcV1iTak41bwpepmqG
	4zojzuHo=; b=XpDDpXPnhbzlBJ69q1kzeybNKo4if+pf2WDJHl42YjpAu82oSYW
	Qn1fXo8zzqbhGzg5VXpVBsQVCRs26+OnPLtGM+aNiMFBM6Zjk6EiMKYZrlqO8m8S
	3BeX8e2mgjrXlxadYlRHGk1RskeahuT0avbKVjbPJdK++hlhT+XcTnfzq4HZnS5I
	MNpokneOGTi0sW7RmmZ/CsJOwy3/NIaRsnpSR/gWYMj3SC6t2d9qr5ykna5TO7cI
	5NM2Wh/rHREBgGjpHIM7k8S2rM0I7JTr90/CogHh3wSOPCYiC7o+zNpQYoMNGX0Y
	dcLgIkNtJ2w1+YVpzaL2AdAwxj3BNm9rRbg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enkhn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 09:44:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9ihUd001024;
	Wed, 18 Jun 2025 09:44:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 479jy55q4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 09:44:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I9ihIU001016;
	Wed, 18 Jun 2025 09:44:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-schowdhu-hyd.qualcomm.com [10.213.97.56])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 55I9ihuS001013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 09:44:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365959)
	id 99D655A8; Wed, 18 Jun 2025 15:14:42 +0530 (+0530)
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v6] remoteproc: Add device awake calls in rproc boot and shutdown path
Date: Wed, 18 Jun 2025 15:14:41 +0530
Message-Id: <20250618094441.1994965-1-quic_schowdhu@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N38TyoJN50llmAZPtTHIt4KhnsxuMaKi
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68528a8f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XxzzxGOHeBMF7Ba7Dy4A:9
 a=Lht6sO32AvJXS5sg:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: N38TyoJN50llmAZPtTHIt4KhnsxuMaKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX4zkBQR5OJMYT
 J5U5/ifb0TL+84cXOihf975b3MuJ1ItPPWuwnV6FDdu79ROmslKXKcvek3eac4Eu9unoSTR+TFZ
 ybQ/GzWY1yR0MWxnbokxudkvXBqoyTZU3J2MFx77Das7litmmriLLWcP//lZdErLBqSreQNRvOV
 CTOaMCBxj4qkBQClsitWFiC6ccS8Dw4j+mGnQ0TEjRZnJxD7bBkOOnvN6w0s/r2MhVYz4xi08+O
 CDEeAaeMqEpEpP8B6Z/+xyea3px1/ab7iFdBew9c9iFZpBeDs0I4CBFa0SSvjbKeN3iI4E6kmXz
 eX17mAN1QGsqdS5vdiDDu06zcJ1MrFfwvaXd5YzBO71RSA9OcD7AyYhpkSFNou0lSCkG7XSXkZL
 Izw4fNNr2BftIm4dhiuCe9VWJn9idLUDMwo9ECXp5YTu2cAOGrJ7AffSlje6wFVprzgPS9WQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084

Device awake calls are only present in the recovery path of remoteproc.
If an user stops and starts rproc by using the sysfs interface, then on
pm suspension the firmware fails to load as the request_firmware call
under adsp_load relies on usermodehelper process which gets freezed on
pm suspension. Add device awake calls in the rproc boot and shutdown path
to fix this.

Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v6

*Add some correction to commit message

Changes in v5

*Added more details to commit description

Changes in v4

*Remove stability from mailing list
*Remove the extra tab in v3
*Change the commit description

 drivers/remoteproc/remoteproc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c2cf0d277729..5d6c4e694b4c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
 		return -EINVAL;
 	}
 
+	pm_stay_awake(rproc->dev.parent);
 	dev = &rproc->dev;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
@@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
 		atomic_dec(&rproc->power);
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
+	pm_relax(rproc->dev.parent);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_boot);
@@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret = 0;
 
+	pm_stay_awake(rproc->dev.parent);
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
@@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	pm_relax(rproc->dev.parent);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
-- 
2.34.1

