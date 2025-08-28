Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB22F0C45;
	Thu, 28 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373351; cv=none; b=mnEsx2FuA3nqC+d7jaRh5vI8I1iG+CanhEi5bQdTWX1+FVA57LZFanXPwm9SKchcdm8Q1dSf8OjcuXypdKh/UyNtGs4H8WkyrZ+/8GLoxMh3ngSKIUk+eI3cAP2Z97MBH/FPP8CfgAKo617Lu3v3gLG6L+fl9DERRR790tYDADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373351; c=relaxed/simple;
	bh=9dsGbqg53s4ASEyIdhfo08eoyZhYeWX5cu/3oJW4coI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VkF5ggQni9vC+nXCf2Y52JW70S7RQuoePEwIGY8JfgUbEwBDcm6xtE9z9suGKPsNtSjTbLsImWYL3Roroqsx8vCvfHZpGJbSCSmMf+SYJ9iXLnirpGGNWOj2IcTVrPkGd8s4aN0FpDUCCXLI8D8EN2qhNCnwNqSu4PB92rivz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMJyciO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMJyciO5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6XZfh014807;
	Thu, 28 Aug 2025 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uQtXUblv98Dz8aXT+yu+Rsdj3WnWi8qqnTj
	9mkMM8Yg=; b=VMJyciO5ToSA4uendKoR5ezYN/C15/yZoY0pJ9KdpZMA9OItV5K
	dH9db32Ct3Tf0KuJv10Cu1f1CcRRZKobZDsqsHuuIzdN2XXC05u/o+Z7zQK8EIMd
	11Cvl2T9PhgDceolfEr7UmEn1UpPySx3OOT9fhd6APeyYF1R02lGVfgErBoR+JJF
	r2B8NOFeNHUe0uzBR2P525flijg3bGFvqEpnI3gYmZs93/+5dCkkUSVgedTDasGO
	0OAXFVmLHiVXNcJ2AeQsd0yQiBdwLZYKLb+GDPgc31yGYNjcUorIdREpry6Lnwbl
	cs8z5DeEfHHJRUkkXtUUGavWgdKc8rmnqeQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we7e43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 09:29:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S9T1jC026601;
	Thu, 28 Aug 2025 09:29:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48q6qm301x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 09:29:01 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57S9T1Ox026596;
	Thu, 28 Aug 2025 09:29:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-schowdhu-hyd.qualcomm.com [10.213.97.56])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 57S9T15h026594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 09:29:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365959)
	id 947485A6; Thu, 28 Aug 2025 14:59:00 +0530 (+0530)
From: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>,
        Souradeep Chowdhury <quic_schowdhu@quicnc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v7] remoteproc: Add device awake calls in rproc boot and shutdown path
Date: Thu, 28 Aug 2025 14:56:15 +0530
Message-Id: <20250828092615.2114183-1-souradeep.chowdhury@oss.qualcomm.com>
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
X-Proofpoint-GUID: AuURT4US3g1hF0GIdCqt86MAeEHbmsC7
X-Proofpoint-ORIG-GUID: AuURT4US3g1hF0GIdCqt86MAeEHbmsC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxyYC/VCGMtp0
 QMPrDe4l9OV+yfFgLxhFM65HY/4is76pF/qTiG6uUisNlKbhri0esZdFy5+1h938wngVrjK5xuE
 wMetKNVHF54eeu41hhlVSfkQaMuhOtFhDMWWgBHUbA9Ez913kYyHZtq8Dr1Bk3xkjIoWqVoqWp9
 xLmqTunjgKs7wsA18ILH1txZSzY3JjucAYL7xXDncnEnAJ6T2CLRt9gXVRKn7owyd5VLHRblZJQ
 PXUlrUkDhMEAVtMyYwAmS2PGUuZqmHeNpMb6F8gXEqLYK3N61sPMELQAjEdmGL8TYyZkr3XRF51
 yJhuvsyEvJTNF84ZvdYsZpdM3I6ky8elemrTBA8Z4JrGqo/tTMHBmRsLBUaHUVzn/d0emb2VKWK
 +80t9HOZ
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b02161 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=jGnfN1tMAAAA:8 a=EUspDBNiAAAA:8 a=Jq6zdSINm0DTzP18XioA:9
 a=6MwZEyB11foWsxG17m01:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

If an user stops and starts rproc by using the sysfs interface, then on
pm suspension the firmware fails to load as the request_firmware call
under adsp_load relies on usermodehelper process via firmware_fallback_sysfs 
which gets frozen on pm suspension. Currently pm_awake calls are present 
in the recovery path, add the same in start and stop path of rproc for 
proper loading of the firmware in non-recovery path.  

Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicnc.com>
Signed-off-by: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v7

*Justify this fix by adding more details in commit message

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

