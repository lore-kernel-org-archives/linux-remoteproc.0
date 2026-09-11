Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B011E371887;
	Fri, 11 Sep 2026 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103003; cv=none; b=mJVK67MNqxbUNKrwQ5F9ruBl8xBX/PaVxKSDdSbFV9gVU/8bwY9fb7+7/F5V1wQmAzFE+GM3UfesWQyu92F15Eq8Lg821KTTcjZ2UZbl8PYMQNz++zqvZtT6NfO0Nvc4exX8XoZaBRnEbHSR6ZHdKirbCsvg2RM18JDdfBBSE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103003; c=relaxed/simple;
	bh=yojgajLT1MsSC3LDZi2bNyxUtnX0rB27ru+ZjVPCI8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsmyEHOscYDNTgQM3whqCTiVgfhz3fw+LZjAO/OXN7O+hqE0aWciDQvVxJCpANtEfW2yoRJJO9PBFa+aRvziMlylvHg4jpBkmZYapqW7mbAGjOUYYZb8lzpU25pR3IlACgMY4bn7jPmDCnkFNlRgMd4bOs+8+cMUCRfdsKOMZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENIXNsJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENIXNsJY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vv6d2987480;
	Fri, 11 Sep 2026 05:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GYfgh0dE3ijt+0Th+RMqpHJzDK9XPTORIqWGLCzPBs=; b=ENIXNsJYPPADg854
	B1u3KcIPtqQ1xXTbU2W1/NjLqCdJAWgc+KMO+8J24ixYxoplDvC6u0VGYAyRtBoU
	E004lzmPvKtjnTxzVNQT5M2hfpJCmJUqhvJIhT94OirC/72HPlPveGy8fKffJLWu
	oN8hwNHvxWrUucwRzcS1sNwUhjOuf6frVIq965M9399lhChgzajSdMHZsApoRqmH
	Qk7/3Yw6BKvlW5JylJnz7Uq2Cco1CuqemqhDAtfLD6uL/Y7BU2pHePOBwmuks75T
	rtZ1MhGiWMx3Duo0BirXC9NWLwQ2jM/cQP3Wt1on7nCT1doSNZqCbNmLfeWjQ3Na
	mM9O7w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2a2h8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:17 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B53E0b2535831;
	Fri, 11 Sep 2026 05:03:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B53ERr2535806
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:14 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id B9EB4673;
	Fri, 11 Sep 2026 10:33:13 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:33:03 +0530
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support
 for Shikra
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789102993; l=1161;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=yojgajLT1MsSC3LDZi2bNyxUtnX0rB27ru+ZjVPCI8o=;
 b=jQPq9s6lQxzudw+TXwAlzYbjX1xTLULwqdMDiRXQnfioUGDVbg3WPCYg0crjkaS6dN3PaKK68
 l2q7eQSREZbC2oysWcd8uUSGlYuiyUeY9YyBNGIy34xntzLwBgQi/Li
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa38b95 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lma1dDF5hPHvXXyS2tYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qZI40F88m19tpFNG49hOF6RGMrOvRhzU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfXymlgFrTTKw+Z
 Li4ptehATZEpvrhp2wggc8/KjoV5ijOXp33N8ndWoEvs85xqV3WvK8LnhWcHTN8ACQZG1CjWZ+0
 LiJ9hTXfV482BK3SZDNqcwydqiFg5q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfX3j63bVUTfGvp
 M+ldZ3uJbQfazrmPlSQM84CLeFiiuctTynvCIhIpVIXS8oqgEenjpoBW3ixmHruWtkQG8MaCNPB
 VJ2ZjzR08hS99O96eg5ANyXNrrSRX6UNDpBxJ+IiOSgIq/jmqpwjj1vgKyNjb/Rwndpvn4hZMwd
 uNsFRV3ldlb2gu5UNLcAkbaW3oS9LIzWAbr5FOQ8ofYh9el5owrU0PrwTZSaDSZwHLVlL/FiijS
 iEfWHnk8XgCSKYauenTZwNRPDnaIgcWA05Dr/y9fLGyT0bAwpkSFHHFqXNiZnGGHnfCQ/ByA3gN
 tPpGSOBBdL/cjejoKwrod6+jkuu9RFU3vB7SW+WOkNxXqvinlba7PvNqFVib8RPLyl9xPmJNdQ8
 ysaWQ00pyLu8DsN9Oj4Ok0mtzDsKa9/UpNO7gWBT8CWo11PH9AmpWeSinOjTYI+GcqBJVWdIBHB
 Oks6/Dh2p48BmFoEGyQ==
X-Proofpoint-ORIG-GUID: qZI40F88m19tpFNG49hOF6RGMrOvRhzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110067

Add QMI TMD instance IDs and cooling device name arrays for CDSP
and MPSS subsystems on Shikra to enable thermal mitigation support.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..3daaed6ca596 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
 	.smem_host_id = 5,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data shikra_lpaicp_resource = {
@@ -1688,6 +1691,9 @@ static const struct qcom_pas_data shikra_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sm8650_cdsp_resource = {

-- 
2.34.1

