Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB43268689;
	Tue,  8 Apr 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109014; cv=none; b=kQb0qsdnWiykPKf6u4It88ALSbQpVwlHQmT+4RMaCqHPg31t22rVYtpeC1p5jLMCgTe92gADC1zg2jV985DZALmF8QHvWawiKXdfKaj7hzAwCt45vLylx8eeZpVxBKjqazThObVhKkBYCZciIz+DnNKzVMYajJkX8Of/O1neUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109014; c=relaxed/simple;
	bh=ER7pJyP8cyU1upRaLZaLV1tqsLro3GCekAJ4FKS68K0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JhchCyzCGOO79sX3bpTzHSJWeOuNWdrC6lvcqS3t0A6T6OZm0oAog0hnB23msCi+Hi5CpXFh/TNwFsd1XmZw/9vKHQGuKc1j859k3eacOS4XfMAt5m35X9WRu17Sp5P8srZRQGNaQuHqUe8LyUhZn5CCGQ4ayAaAEDLjlM1Y6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O1L5VWX0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O1L5VWX0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLEa027665;
	Tue, 8 Apr 2025 10:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yDo0BBejvNuxYpbG3DGDEoFAOTLUWqtb4CF
	5lZ6osm0=; b=O1L5VWX0xC15YA4bukYH9MvRA+zu3Utzyt0e8nny/kT+Fs7YNSr
	0AefZg2U9Hurw1say09xbl61reldONFJvjcUrRlEDi+CpP0nFd2ovNZNIn5pJu2J
	j0dfDFB/UfK/v5kXh31zuOWz5QPEvTOMF+spZ+zk6yjs/CwDcBqxIPptm/wS8J1h
	HqL2JVVQtUdPPWR6lqEaFPr3jDKNl5qFbfNOfqxdQpCKD73abJGShihRRW1O452m
	5qy9vAGCrvNV1pqgk6dg5S6NDRsD+unexD9YyghLpPR1YwtadU/Vip34/C+C3r2L
	V8PUJxJDOyHD4q+loYTT+EaOqFI+XgUI3pA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyyfu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 10:43:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 538AhPul002674;
	Tue, 8 Apr 2025 10:43:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45ue7fqhp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 10:43:24 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 538AhOlE002663;
	Tue, 8 Apr 2025 10:43:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-schowdhu-hyd.qualcomm.com [10.213.97.56])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 538AhO2X002661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 10:43:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365959)
	id D469C589; Tue,  8 Apr 2025 16:13:23 +0530 (+0530)
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5] remoteproc: Add device awake calls in rproc boot and shutdown path
Date: Tue,  8 Apr 2025 16:13:17 +0530
Message-Id: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4iLr_MsrZkLDe6vUdxaXndwAVg8jJS6I
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f4fdd0 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XxzzxGOHeBMF7Ba7Dy4A:9 a=mNSaMJALY7kiOGNU:21
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4iLr_MsrZkLDe6vUdxaXndwAVg8jJS6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080076

Add device awake calls in case of rproc boot and rproc shutdown path.
Currently, device awake call is only present in the recovery path
of remoteproc. If an user stops and starts rproc by using the sysfs
interface, then on pm suspension the firmware fails to load as the
request_firmware call under adsp_load relies on usermodehelper 
process which gets freezed on pm suspension. Add device awake calls 
to fix this.

Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
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

