Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9721E3BA;
	Wed, 16 Oct 2024 04:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729054613; cv=none; b=fHXMwsCEhLa7S55IoVqIFpDQpIR1ltPsGW0KElgx2mbRA35o3uo55bOGJt5Q2X/DTast6lOxtJMuZi36obRkdDBpZ+eD54yjNnp9Tc07GbDda8GaKcNeHaNqZi/yTmQPrdeKrFn7gyvCzCGx7XFC4cPRz0vPgPrbnjeR3jaeg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729054613; c=relaxed/simple;
	bh=6ekz6iVzk5XteDYQ0GWs5ZU46+bqXJJrgZgVi7ofYuo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVwGCX9NYTQPdszqHtMZD1a/UGzL/yCxfGOaBAOJpscpkJEcxNBTcC0oAp3szVT6Wj7qRoo8lS4mq8c6Rro4EUSTFM1Hu1GQqFTGjYHzn1Gc9rAmvLYFa1JaZI1ClbiAH7pJhJg4HziaM6kHXOnutjasDUqzsDcsURSyJmaApvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gmHYkerr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gmHYkerr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FIsavt019908;
	Wed, 16 Oct 2024 04:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ibjDTB40//wTO9DN3gi529
	06ZFqiy0Znf0JiRDBGjIs=; b=gmHYkerrghjsSmlUWSNv8QOpjcLPkGmz5pWM92
	obXxA+DcH0U1R43WdrcMExxPGcKAY4Z+s1fgjSJitgU6/o7+D3KNH75kb8fXTEmM
	ljj5IOW4iMFCnIWV+agd55Bh79hKKX6RAcjyGSFikCGWTKr4ovGEJnXl3XNbi4T3
	1pPpXqQ0GdKy7ruxJ1expQm6RIsgiAT5FJqfsusiK3qRyIPVIa8DGaKlxhg/NOfC
	jJZtPBHnGa3sqQHT2SENTbxMHEklIMdc4SOMsFKLeM6dhgL25ZGW0g/xQ2NSt6h0
	lXNpI41pX5RyD2ccZRxmkvncovPArxmuvOUzjE1eIdwZ7JmA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429nm3k3sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 04:56:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G4ukAv007590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 04:56:46 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 21:56:44 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Date: Wed, 16 Oct 2024 10:25:46 +0530
Message-ID: <20241016045546.2613436-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 82tyk_eZaIb9xj-Cu2iJ_0PrxmudIgZA
X-Proofpoint-ORIG-GUID: 82tyk_eZaIb9xj-Cu2iJ_0PrxmudIgZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160029

Multiple call to glink_subdev_stop() for the same remoteproc can happen
if rproc_stop() fails from Process-A that leaves the rproc state to
RPROC_CRASHED state later a call to recovery_store from user space in
Process B triggers rproc_trigger_recovery() of the same remoteproc to
recover it results in NULL pointer dereference issue in
qcom_glink_smem_unregister().

There is other side to this issue if we want to fix this via adding a
NULL check on glink->edge which does not guarantees that the remoteproc
will recover in second call from Process B as it has failed in the first
Process A during SMC shutdown call and may again fail at the same call
and rproc can not recover for such case.

Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of
remoteproc and the only way to recover from it via system restart.

	Process-A                			Process-B

  fatal error interrupt happens

  rproc_crash_handler_work()
    mutex_lock_interruptible(&rproc->lock);
    ...

       rproc->state = RPROC_CRASHED;
    ...
    mutex_unlock(&rproc->lock);

    rproc_trigger_recovery()
     mutex_lock_interruptible(&rproc->lock);

      adsp_stop()
      qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
      remoteproc remoteproc3: can't stop rproc: -22
     mutex_unlock(&rproc->lock);

						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
						recovery_store()
						 rproc_trigger_recovery()
						  mutex_lock_interruptible(&rproc->lock);
						   rproc_stop()
						    glink_subdev_stop()
						      qcom_glink_smem_unregister() ==|
                                                                                     |
                                                                                     V
						      Unable to handle kernel NULL pointer dereference
                                                                at virtual address 0000000000000358

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v3:
 - Fix kernel test reported error.

Changes in v2:
 - Removed NULL pointer check instead added a new state to signify
   non-recoverable state of remoteproc.

 drivers/remoteproc/remoteproc_core.c  | 3 ++-
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 5 ++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..c4e14503b971 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
 	if (ret) {
+		rproc->state = RPROC_DEFUNCT;
 		dev_err(dev, "can't stop rproc: %d\n", ret);
 		return ret;
 	}
@@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 		return ret;
 
 	/* State could have changed before we got the mutex */
-	if (rproc->state != RPROC_CRASHED)
+	if (rproc->state == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
 		goto unlock_mutex;
 
 	dev_err(dev, "recovering %s\n", rproc->name);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 138e752c5e4e..5f722b4576b2 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -171,6 +171,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_DELETED]		= "deleted",
 	[RPROC_ATTACHED]	= "attached",
 	[RPROC_DETACHED]	= "detached",
+	[RPROC_DEFUNCT]		= "defunct",
 	[RPROC_LAST]		= "invalid",
 };
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..3e4ba06c6a9a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -417,6 +417,8 @@ struct rproc_ops {
  *			has attached to it
  * @RPROC_DETACHED:	device has been booted by another entity and waiting
  *			for the core to attach to it
+ * @RPROC_DEFUNCT:	device neither crashed nor responding to any of the
+ * 			requests and can only recover on system restart.
  * @RPROC_LAST:		just keep this one at the end
  *
  * Please note that the values of these states are used as indices
@@ -433,7 +435,8 @@ enum rproc_state {
 	RPROC_DELETED	= 4,
 	RPROC_ATTACHED	= 5,
 	RPROC_DETACHED	= 6,
-	RPROC_LAST	= 7,
+	RPROC_DEFUNCT	= 7,
+	RPROC_LAST	= 8,
 };
 
 /**
-- 
2.34.1

