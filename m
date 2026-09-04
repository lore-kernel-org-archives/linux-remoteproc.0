Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DFE3D523F;
	Fri,  4 Sep 2026 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551817; cv=fail; b=UyK/O0dB1VgzZG3oL5oPHygV3gMdf44JUolmTsAi5A2qF/6U2ZzLxMqt4R6uGIzN6FmDngLJXrJD92MQL/bGQaHZ6lWtxphS1lgHcZ5e6ljBE5KNZdA3Kxny16iihVfZKYKZV/cySDA7s6vn4mSVhPjxzX2YlOhXkji91r+GaY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551817; c=relaxed/simple;
	bh=oCiA9nVbRafcD42xDFBBXbbCrXzVFRBDGtgOylq1s8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcF/TmvuxiwMohFgHV00W+9LUm+vNAI3dLY6RqVNHa7eHqWX/agUrhppmt234WDLICrfhNsK0kFk2VPsDbOhv/MGnmlugoO8/zZqrD1WAMfVfqckNBgPEApSoGxQXbhwo/Sqfx8u0cu0cQcosZxRiwVuHXOZXSYJTpEmMD1bYZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=amDiCHXw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lWXZT+RJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="amDiCHXw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lWXZT+RJ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHtmT4080702;
	Fri, 4 Sep 2026 14:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mb+6ojF6KzliX+u2p/MavL6Ki5tTK09XKpx8Ig1GN
	nM=; b=amDiCHXwKH+eHNC5ksXON+SEkyVh4tOH0H8aWPsWkfL0J/t9hcchJC8Px
	uEAvEuEMZqirZW5mKGmF9nqn5GJmc/kL6ZB8PDGfRJTNt6PTlloo6jPu2Qv7bBMt
	sYS/ZXfwPOgxNBwNIaRe1DaCGgmU7ZQ2iA/Ka7J8QLFoVAYuWJLw4w9y48xwqQjb
	Lls8f9Jthb/EPCP9B95Ur/jnTyLuH0bq+QPjv3Q8ofI0cTpw+UMKnCEAqhjcuG4d
	WUq0XyW+g9NjyhlOmUXYDEG7bGXyF7daRSioHSCBzh30I4036kqp2Nwypm126K4A
	R5J4x9RLgGj/NTal+7V2a2MijWU0g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq29df-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 14:56:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck5EmtLr/LLbXY0icC9eYpEbr6M49bBsWGfAManPhWzGJ0Tt2jVeDbdHJAvprJCUMxOu+TFgHJ4sXKn+/GGS493d0wcFGkNJWmsZDAXSbnILYFbEA834CF6G64CIELi7rbSkd9ZAy+eGJ0mAK/QoqCXS+wStk2ZzVgtXAgUFo2IO1pVHs+8HwZgHM9yAzAR0sEC4XJCLd7/UNghLpnZ0HzaRcKNBcWS3xdOfqzrDeBv+rTkg+xzw4/9JG0d9F7mEj3dz5TaYQx6+nzksZ1YMSoPaLnZjmTj3INCj+SPU6LKbD8HnhPaUUmCouUzpEgJaGWO3IWrrYcM+Jxsqc33Ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb+6ojF6KzliX+u2p/MavL6Ki5tTK09XKpx8Ig1GNnM=;
 b=m9v6uWAAYJex6VYTNFdojbKD73xoBxvv37N5tUcnNl21eC/R6VscAvhq3gsNETl3Bkw+RJhqerDGjyZZzeEPxtmHknckZ84vis7JVFA163/bxA7apa0Ru1XuLUgmk7SPGWb94H+WA8rzLUud+6Q1BQ58MTGqfs6ILrUbEb9S21Dh67s2GYvNu1I9fLYBwqZfF6DNgkmvWb/gMZQIPEftEceWkwpe/x7Mxz+bcg6htAbKHpdgiE1JcEhBeFs9p+svCjsN4sqGh4eM0FDivkh+EY9YAQ0SDiT6NMF8FnHQtW9X9vsjGySwxrCIMxD6Hv95Eekm5mYnHx9lqyRr/nHwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb+6ojF6KzliX+u2p/MavL6Ki5tTK09XKpx8Ig1GNnM=;
 b=lWXZT+RJMXq/uk17d0BtPreKV8kSUvW7gZVmPPXqS0IbNpVH4JdFQ5OjjYs+1zwli+/fnFDwZ+0Aw2vFG4oyjBE+oqj97a7ThehDdN5SceOhp/93c38VoQggfVxthBPZJ9LYw5IXl18wapUlXsGRu6fG3Uxjn15EN7Jbvh5fkdM=
Received: from DS7PR06CA0015.namprd06.prod.outlook.com (2603:10b6:8:2a::26) by
 DS7PR10MB5214.namprd10.prod.outlook.com (2603:10b6:5:3a0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Fri, 4 Sep 2026 19:56:45 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::91) by DS7PR06CA0015.outlook.office365.com
 (2603:10b6:8:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 19:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 19:56:45 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:35 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 14:56:35 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.126])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684JuYn04106413;
	Fri, 4 Sep 2026 14:56:35 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew Davis" <afd@ti.com>
Subject: [PATCH 2/3] remoteproc: k3-dsp: Fix usage of omap_mbox_message and mbox_msg_t
Date: Fri, 4 Sep 2026 14:56:33 -0500
Message-ID: <20260904195634.2275867-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260904195634.2275867-1-afd@ti.com>
References: <20260904195634.2275867-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|DS7PR10MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 437c3667-2814-44e2-0f32-08df0abea5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|18002099003|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Nmn2vv35OhEw1NMKKhRGcCMyiV4mQr4iwWXaaqZwYR8TcQaxgNfRkLLq7Z5HFTY2oUg0E991eTjHSJHx4M+O7y/SQRoGK4pp+PWDZW5aYJU1t19w6SAEaxGwl2fwROA14WfeqoZmqb/qfCOXi6FL+6eJ7dtZ3BN9Li4lY/2oPx3HmYt8lirt/kax9DweZ96rarUFWTreCKxXVAng+oqy98BvutEzWOdhHw3OFOLzlQdIcmwpJsNtiCZmCxuSYFXK3FGDb5RNc7rRkmhxhfOHdx7xVHTS8hAbAmQPUd39D7OpAvRFfF8IopcvbmuRzRC3dAOXvtbyprtQwHuu+m81T7H9DLjzd869p8IDun2E2zE6Tvx9s7EwZbxWTHNthh2bGaaCGuiJnstzasJrrx2MDRtmLvAa7bI8Bv2OYbRwO4tl4qjlLZ1O7pvrSWWyEh0tODyRBjV9pS9jovC38l2WgO1AByL2i3is2fVDSzmq30MUy60jJOUmPvvqttNuU1KaOIJdqGncktQFhk2yNb6VPtcJr5U8Pj2Ec5HwNVYny2sMaGuPxq4++Y3ameac6shhWcdq8QbUKS+TrmUXFxO/r1floldNlfzdZskDjWuUyVdRVH3a5DByrw5EP/w0ZSurnOpUiY/f7ls8sDqlegf4R2+smuQvdU6F0py3gXBj/29MfmqqA9EGQPReVvR9oU4cfqEc6/Gf4oV/IoaEhAbrSA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(18002099003)(56012099006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FhjA5NLobEnENdQL0o57Ht6ojT3cQ42K5Bz+h7R79WbmXIMe+UkAF1rpZ6Np3glCTHnJl1qKuf+btgxPzifKaIG/bX4Yydd731V1vcdr3EqEHTp6YOfv1PtViKMLWl3UKIf3vA9fgVomwzRCd0mn0NRaSftWVFxsbNRYUxJzf0z/E12ocgLRVz5qofNpwARq4Ep/UgINNmxSRKtPD9U9CGG57yoTDuGsbRll7bogYqrZc94bQK9vi5vEaw298MAOYREp7BavavzGFF4JpT99Nn73FGG4mpgfyZdLYZhL1peO9OU4s1DVNOurOzMpp3PDIuTE4Cixbylri82c2XqYiGGRsjtaAZN1/PSbcprC599SuWqmNzvzbJ83q4wFrSm7EjYfAEzGbHn8mKsPjL3TBdFJIfphvAlW7zmyuRmoYmGzLFpWlGfrjTmaUjgFiYQ3
X-Exchange-RoutingPolicyChecked:
	Pjyj6FJhKZctLtxwcn+jYOPH58z80NrQu4X2y1saGRq/ZOdVu4VofqvqsXEfl+1PXGCa8uBeA0O4QrFYfw/5Y/oP5X4bUKfgS6CEPwYJA4j+JimOV43OT1RPb24ATkjmkr3pFiFFv0SpYhHaTXW2FHALmhHGas5s2/fknPck8eFMFIT6/eGCdk+0b2ux9ZzbVsVhc49HI0XwKQ1xtBwkOGwUx/Ch9VBC2k9j/Otow2xt0yGi9cR14Tu/90X2P4ip03kMz2eiGDk4Ac6Uc9rGXfHEPN0k9ratnHzSL4LRhC61MvgxGH179r/DvB95KKIuQS6CUev1Oa/OjnIe4qNG8w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:56:45.0000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 437c3667-2814-44e2-0f32-08df0abea5c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5214
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9b2283 cx=c_pps
 a=Tu5Wf88tfLtYLtD+ArEHOw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=XbQcxU3utJnGEacPL7YA:9
X-Proofpoint-ORIG-GUID: 8v1GGAl-9PhfgcqDZ_He1nBUvKO82gDk
X-Proofpoint-GUID: 8v1GGAl-9PhfgcqDZ_He1nBUvKO82gDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfX0UX8XOzb2DUt
 p/T47mpd5ciniNwlV9bWQvugeNhOTnsuYEcnB+9rTfPYmqRqsXrRXLVfKV/9RI3qeZx0zFOoeym
 CMl8Ww2qphjVO12v9nw/CXFep7cB7D4OUT2SGVzQkojMn7ErRJXyvE5JGUH5pMjBcBoFHWxnA5P
 WvemrOdUsJ6YTrsyk/A7rdIlBxIKNR6N7+KgDDkJJ/ypsSzCkbY6TtqW/w72LiwricyiplaPg6u
 05xFAXayVJXqkdOZbL78nrnXF1swOweSsEOKaGHw5D4b9sNSnKTSKaCiqBkaRaeYgqJhw8zk7nm
 MlmeLFm5pzJaD5ig7ta9Lu3ZbI1IDheTDBYZr35B1thGN44oLhvM4MHAyjAXBRLd6knTTi+dMG1
 qiYSk0FVsq7BjoY5veswgcE6sNHBZZG4IIuLWgZY0bTlwCUyJROk0Jhvu3FAfb04XVNUIIdXsGm
 XLql1G0qtK9bJ0Sxzxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfXz9gpwruoGKNJ
 Te3+yvmiZsoXf+RCx36ZWzARYFk4E8aHi3Lbcf0/iGmmSKYrBd48PgLR9NddBerjQ4o8ALGAyx9
 NGMDIimnu+dVWXzMSBLPJk3wjpp4qP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040183

The type of message sent using omap-mailbox is always u32. The definition
of mbox_msg_t is uintptr_t which is wrong as that type changes based on
the architecture (32bit vs 64bit). Make the type fixed to u32.

This then means we need to fix the helper macro omap_mbox_message so it
doesn't cast to u32 twice. What this macro should be doing is converting
from the message type returned from the mailbox framework into the
omap-mailbox type. When fixing this we should add a macro for the other
direction (from omap-mailbox type to something that can be used with
mbox_send_message).

After these changes, make use of the new macros as appropriate.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 10 +++++-----
 drivers/remoteproc/ti_k3_common.c    | 10 ++--------
 include/linux/omap-mailbox.h         |  5 +++--
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9c..efff95b8e363f 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -499,7 +499,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 						client);
 	struct device *dev = oproc->rproc->dev.parent;
 	const char *name = oproc->rproc->name;
-	u32 msg = (u32)data;
+	mbox_msg_t msg = omap_mbox_from_message(data);
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
@@ -550,7 +550,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 	}
 
 	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(oproc->mbox, (void *)vqid);
+	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(vqid));
 	if (ret < 0)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
@@ -628,7 +628,7 @@ static int omap_rproc_start(struct rproc *rproc)
 	 * Note that the reply will _not_ arrive immediately: this message
 	 * will wait in the mailbox fifo until the remote processor is booted.
 	 */
-	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
+	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(RP_MBOX_ECHO_REQUEST));
 	if (ret < 0) {
 		dev_err(dev, "mbox_send_message failed: %d\n", ret);
 		goto put_mbox;
@@ -777,13 +777,13 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
 	struct omap_rproc *oproc = rproc->priv;
 	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
 	unsigned long ta = jiffies + to;
-	u32 suspend_msg = auto_suspend ?
+	mbox_msg_t suspend_msg = auto_suspend ?
 				RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
 	int ret;
 
 	reinit_completion(&oproc->pm_comp);
 	oproc->suspend_acked = false;
-	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
+	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(suspend_msg));
 	if (ret < 0) {
 		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
 		return ret;
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f67..4b6da3363f6c2 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -54,7 +54,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
 	struct device *dev = kproc->rproc->dev.parent;
 	struct rproc *rproc = kproc->rproc;
-	u32 msg = (u32)(uintptr_t)(data);
+	mbox_msg_t msg = omap_mbox_from_message(data);
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
@@ -94,15 +94,9 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
-	u32 msg = (u32)vqid;
 	int ret;
 
-	/*
-	 * Send the index of the triggered virtqueue in the mailbox payload.
-	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
-	 * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
-	 */
-	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
+	ret = mbox_send_message(kproc->mbox, omap_mbox_to_message(vqid));
 	if (ret < 0)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
diff --git a/include/linux/omap-mailbox.h b/include/linux/omap-mailbox.h
index 3cc5c4ed7f5a6..e45f8c3841c23 100644
--- a/include/linux/omap-mailbox.h
+++ b/include/linux/omap-mailbox.h
@@ -6,8 +6,9 @@
 #ifndef OMAP_MAILBOX_H
 #define OMAP_MAILBOX_H
 
-typedef uintptr_t mbox_msg_t;
+typedef u32 mbox_msg_t;
 
-#define omap_mbox_message(data) (u32)(mbox_msg_t)(data)
+#define omap_mbox_to_message(data) ((void *)(uintptr_t)(data))
+#define omap_mbox_from_message(data) ((mbox_msg_t)(uintptr_t)(data))
 
 #endif /* OMAP_MAILBOX_H */
-- 
2.39.2

