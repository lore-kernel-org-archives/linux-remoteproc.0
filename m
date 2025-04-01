Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A931078F;
	Tue,  1 Apr 2025 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494373; cv=none; b=oOoHNSJiL/rXzV5+7Gxrb0waCqrAopN0eseYvTaGD+uqz9eeeJ1Uwb5QNc4rmDtOY67TH5UwMqtyKtt8GP8m+7zbpCOkWn25vgv5qSLPkuYy2yrQA7VCjN3jXXknwv4CyJpNyiYuDS3XbaFgPSkWwg3kDJrCqx8DCOjaRotL8MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494373; c=relaxed/simple;
	bh=Dfq7WiNK602AzQsYblKxlrzbsnY3MpTXmY2+dHrocdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fe12WrRDWnwyhueSvYWvbbRWu567/gxxoqU45PJ2MMeX6expwdfG4CKXUpl5oZ+tH2H4iqurw/fYoetGgwEeTMgGrBvmOC8FPaDdS8L8eLZv1Qq5fTxW1TGrrSxVHht/9MDqellU6LwReLzjah5QktWAjGvfHd8PYDBFFBSYLkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TmKLQh8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TmKLQh8Y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316Ja8x031775;
	Tue, 1 Apr 2025 07:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1YYsH+ZMKlmkp92zmY1ycy5uvFBtZnFCbdn
	wgqyeKdM=; b=TmKLQh8YlsKM/EzGz1nuNincq+UBf0oKXbyY7wd7u0sU6waqW/2
	F36EKfJFgZ87UmDY3RSzj8deG13e7u5NUgWZORd1t61qGwXXo/NzU5SZqFdXrY0s
	m7FcwXhO0slrh/Dmb1T6264ttVEocbCvmYeQROyw7VfQDoeB3yNQpmKRjwWw0tJB
	v4HdqkpTdZtMriqFFxtXEYnerQFroxAa0x5eJY2Zh+7wuvLfOWE7DsE5Rgg3BgHC
	czt4SFlmtQ1zNJ/bLTEVFcMGnmg8OQRCuBA2IgxE4RnNwHYy2HZsMqOVWQicekDj
	HbFHLH+PTTH5k2yH1/+FHcoSIPMA3YqNR4w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7t25u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:59:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5317xNl7016793;
	Tue, 1 Apr 2025 07:59:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45p9xm7df9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:59:23 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5317xMj5016785;
	Tue, 1 Apr 2025 07:59:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-schowdhu-hyd.qualcomm.com [10.213.97.56])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5317xMFk016784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:59:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365959)
	id 12DE35A0; Tue,  1 Apr 2025 13:29:22 +0530 (+0530)
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: [PATCH v4] remoteproc: Add device awake calls in rproc boot and shutdown path
Date: Tue,  1 Apr 2025 13:29:21 +0530
Message-Id: <20250401075921.313348-1-quic_schowdhu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: iGjTO1M-5f7KpRC8uop9R8Pttwiq57B1
X-Proofpoint-GUID: iGjTO1M-5f7KpRC8uop9R8Pttwiq57B1
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67eb9cdf cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=XxzzxGOHeBMF7Ba7Dy4A:9 a=sb7ZHG4HBnG-2caz:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010051

Add device awake calls in case of rproc boot and rproc shutdown path.
Currently, device awake call is only present in the recovery path
of remoteproc. If a user stops and starts rproc by using the sysfs
interface, then on pm suspension the firmware loading fails as the
request_firmware call under adsp_load returns failure. Add device
awake calls to fix this.

Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
---
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

