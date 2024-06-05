Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90F1EA90;
	Wed,  5 Jun 2024 01:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717552433; cv=none; b=fYDeeWSxAXk6yxIG2u1Y7926NcLWw+JyfWm/fcoGGXnKp0Kl4+6sGOycvcEvn0YuaI1uYfpqdOZRDie0zBa1ViuEqa/7ig5mVihGqAw3K2oEJPEnHJciCQKKPY0f3NZc1gnGb7cNjB5khRPGLQNkg1IgvfFOKvnsn5rnOvnz4M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717552433; c=relaxed/simple;
	bh=8998V6laMiCQvCQaCORf2a6y4ADQO7WKzAVKA/sc3QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MSBaTI9kcxhAmoM/rLnagQKJnbDybwK51UeGozmKIhI/Nhq6ROKnMrgmz/1yYIVPzO3lb23oHlBSbzi8X7hzenxmTIwkWiM0lkYzA82WEe5+hjrjX/GzPQfAnrO+t3ZubFo1B/xsC8fVkRt6LyXHljTmcXinwQFpN/it9W3hgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QzGwk+sQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QzGwk+sQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454EcG4f026969;
	Wed, 5 Jun 2024 01:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3FSDyx0YMqVdfnfpfrcCyJ
	YaQMDyNVi2lg287MsQpw0=; b=QzGwk+sQRd1Y29HmaMcVcttN0IROuVI5N/Ck/l
	BoInvlARgA7GaRzr20tBe3jRYN4+5J6IgAFFPcLaSOdVADhOR9l/Oi++onGPDSvB
	etHn8uGn+FOpC4K1GoKFqI2tCIDiYpef/Ej2VVL2DVehO5TcMfA6y+y/xkV3r5QT
	Ltes7GoYVK2OrCCpwZn5hNuBAnQ8IAPlCvDd4Ziih5jfhvXn0yuKW3iSatRgUYG8
	n7klCVDViq2AWtC/hgHtRee0mnh6h2QFeeihntKF2YTE3qWsMP61c6OlWMtI2aUl
	NAXTUafD7d2wKvTt7cKRJxXDk7KSUg5SaJIdeyQPrhQymBwA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj4v2hbqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 01:53:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4551rkd5019435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 01:53:46 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 18:53:45 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 4 Jun 2024 18:53:44 -0700
Subject: [PATCH] rpmsg: char: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACfFX2YC/x3M0QrCMAyF4VcZuTbQlSDMVxGRro1bwNaR6BiMv
 bvRyw/O+XcwVmGDS7eD8iomr+boTx3kObWJUYobYogUzoGwFiwqK6uhLtWmu88UQxx6KpGI8wD
 +XZQfsv2715t7TMY4amp5/tWe0j4b1mRvVjiOL9IrMEuGAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SWOVAU7AbABCUYQqwoYKvL7bwQrHqkdr
X-Proofpoint-GUID: SWOVAU7AbABCUYQqwoYKvL7bwQrHqkdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406050013

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/rpmsg/rpmsg_char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index d7a342510902..73b9fa113b34 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -566,4 +566,5 @@ static void rpmsg_chrdev_exit(void)
 module_exit(rpmsg_chrdev_exit);
 
 MODULE_ALIAS("rpmsg:rpmsg_chrdev");
+MODULE_DESCRIPTION("RPMSG device interface");
 MODULE_LICENSE("GPL v2");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240604-md-drivers-rpmsg_char-02914d244ec9

