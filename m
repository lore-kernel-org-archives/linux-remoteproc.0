Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C23D47AA;
	Fri,  4 Sep 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551819; cv=fail; b=roHidk6gw6B+8LZFD9QPa/4g9KVrrKsJdcv+qY+iOuNbuCjFNQ5FpsZ6rk94Y6z/YajS60vHjBN7/1PL2a281l2kROOMXhRy2LLZEeAbh4AI69CUtKNQDUcH2KvTwT8zFUhrNwVp3KyzxqefGrKoUOAyqe2H3ZC5O9+GeInks+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551819; c=relaxed/simple;
	bh=0471ikH2LpIgxfkhdkIEGi5BpWz9E+HPZzw6ysCWrDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kog3eGnW2GE9nIid6PCdBReXIMWMj2hRsG7iKZTnqVJq8NTFMPq4nLy/yAbzi7WJ0SSMgUKstAkjiejj38ik4oa+xzDP0jIMigCL9U22d+f3kwpEvh2CERpIxlb+tZdm/dQJz3hsGW4Bj4cNNeawg9JKTjHsgPhdKCVltQElEVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=efzJ8c0w; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dfg2EvCM; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="efzJ8c0w";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dfg2EvCM"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIB1b4081100;
	Fri, 4 Sep 2026 14:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NSm24lCMFZXMt8G4iqVmBSxw1OCmRR3+hrqbintdj
	d4=; b=efzJ8c0wKsTCt3ECkEIdlz2W87Xx3c7zUtJmq/1tPJzFI/rTEHQY9BTyw
	JY3AFgrLU0R1pFyXn+tPXD3+tBw487Ny2K8NeAgOTMaehYbg+9T2ybi+y444k8qX
	kgLX5CFlXjAMa+JVu86LklhPnjdF+OCmtTOy8uaFTdauwAuhIWTF8JifBWugMUhx
	9MxcuYZmtOvXDHTyU77hPdFvcevKqbNA2uYE2TCjV1Z05rZqNBQ0WRrqvkv3/PJA
	q+QrfuNniImlxYV8ZO+ITuM7bhOIQe3xB5hHfGLvD222JSIY8LeN3D22WYNat9H0
	VLCG4+mhl1LppHDOCBnEXDzkti4ZA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq29dn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 14:56:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVgTU/5RxQ5l5bLE54/MNseSgJKvU0mBNX1JenJ8rK/z4deZjgtW1zSFjBCPsDzLVCTGsRaNvwCHGQCFKH9eqwsvTCBWDomGScjQE7Pgz4IMGVBqYCrmSDZg4ZTLdX/VwOie4CCevvPEaUjyrrJpHiV2dmnMIqXufbLv40FDkBMBsc+WqCZJzKotSP73VhyCETSnv7ibUYjc6amNCubewC7sAPgSha+1Vrm7zldH2DLYM2g15zWlVUvZ4wV+eYhRHrflDUJXtiWTgRO1ZNqPQqFjIEmnQ72A8nNWBnt0SnpqhihBtyxxfjrJ2cEVjfFhnd9wlKDXsyKyl+z2/yGwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSm24lCMFZXMt8G4iqVmBSxw1OCmRR3+hrqbintdjd4=;
 b=csOXWpx6guqK3PCnf1cnEwmwl4B9f325fI0aYWWLiQImErAQT9xVwY0sIpWMdQ2zidgpvW2/4CDW2dM59Y0mf2emuFQV4ixMpPtMDFSJrOIt6QjcivdMNLOf3tKTFrEhn6HwgND73SFeZttUbloXv+AJtcdaKUARgdx2Tx8PboyYrdWBYYVG98OWN7uBg19t69su0+2EDrlOAOZGuaAnUY1t39FwEz/FaktFT/IyRFP+sx0nNF0MfKRw9tZpF7wzohBtQd3ON4ETpJpegECQMLQ8sI/nzUN4b6aDglZKgwO6DWaHNgVD6vLk40lxsSNZSjrMRTDUjude6FWAOVLpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSm24lCMFZXMt8G4iqVmBSxw1OCmRR3+hrqbintdjd4=;
 b=Dfg2EvCMtbOXgO5cDnM/lUUB2DUSw3/2a0SpOBcHFmh/z/FD8G8ctninTsRtPvSFzRt33QF0tbg0XVlbpuoA9TxtBbVEuYepv2GuCgEA5irzdNP8YjVFH9PmvIcD0SGHEHFeVJPu1W4RAWhg4K975sRJ7B7b7JYUX3nKMTaWzNw=
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 IA0PR10MB7603.namprd10.prod.outlook.com (2603:10b6:208:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 19:56:47 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::36) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 19:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 19:56:46 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:35 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 14:56:35 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.126])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684JuYn14106413;
	Fri, 4 Sep 2026 14:56:35 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew Davis" <afd@ti.com>
Subject: [PATCH 3/3] remoteproc: Add compile testing for additional TI drivers
Date: Fri, 4 Sep 2026 14:56:34 -0500
Message-ID: <20260904195634.2275867-3-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|IA0PR10MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe107fb-9b94-48cd-e1d8-08df0abea66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1L+r8zn/y0/9PgaAnbhYaq+Dlbus26tFo70dFLW8LeHLBOO1H7uEs2zb2IjkFgayA/VTRKHyWfBB97wIZl30meOKQ4QkE6O/lJLln4zL/BwJ9J7uuK2D3tmltiIk7YGKMmS1yQfdJVqRTPzn3WriXPUqC9zbl8SMctQ3BNatlSHBLGGR5MT++YMmp5CIlDAI+UJH4n7+Es5ixQelMa/Y3PBROP2lH/wigkr80YZ0a6FfqJ94lWkwpQGzf0SZaZ30FrWoUDPZBfMovL+0JWp971WnuxM+8vCtIhjomDom5b7zUOsNyG3fmbX1iHayQqeLRK13fHMCNieWYoHDipl5sdaeMW4obuFJvl5HfMm2xdHLEJ8ceVyITiCtXQOacHsLRx+SkUun/YuIX2lp61KSx1AXXYJ+Oz157gUdZVxlKrtsYGE8W5zXV6FXehKpdgyE32UauXwRp7PozhbmfpwnQT+jM41du7bacPA0cgUlJMLdR+BGGz2M9fmRBJb/cJH7BOE3c+cT0yobM3njk4s88Y0J0Tr52nYGcdt8i/ZEvfDbVVVdBcpD9BU8DKsZzFFjc0M8gdcoL+yeZmiQShsfdqoxX7ZiU+0Z6I5a060HEdvfbnq7syONW3+ZlEpqcCu5TN/d+5LvDY45MsTwXhtUtHLZHp3tUp81kMygPZAxV2l+T/UBFJakgAG/KXb2mnw26L5K1x50oNDwHQf/XnyFxw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RkBR2OwqnhklYhaiA/pRbtDqc92zFawgVUsCXpKQlteNP0hu6wTWoEs++IDwEXDNEKI1d1baR8UmXSbfNGZ4UZFhPwWtPgnSDg+mQCs5p3hJeFdUFoKbE66UgHJZjV4DQF2lqiTudxUdppcpRRrDiBspFxip14u8PDaCf4JcjZPMMaFGkovbur/vvVnlXCObyTrbtl10YmsqEekC/2jASeZWPuVUHwmKlODQo0au2rbAcZY04v1r2c5q9tfXIrFroOY+puz2kQUxNmFJuEZGood2h8R/y5bm63OkyfrAYmeiaEqdKISeYQMNPOLMZ/CDZtMhJGMhs4fk693miT6CgvWEsGATPW/Fk4GzIYcao+EES7yI0VgFbWp+otQ6GRTpRNBGY9GU2efIkZ8Gq5Scmu+K3bYY9Y7ypSmC4AsC8GW+/GKqk4E6lLwkRr/jMasf
X-Exchange-RoutingPolicyChecked:
	kyNhgafGuBRTlFsR30dhZUfMNPKGim0NeTY9qmyuSWtVvPMireRL1mBo9IhgfuFBYR2S4taP7rJK3uiwsyUTD87JqCWNwpkriu7lPJwDWhf7GpvxBIAQ0drAQttcFRVQ2JgJ0XdAGIiBJ1h+eP1ApsqW5t2NiNTsMnlvzEDoGXnmia7Cm8xNoOJgmC1DwnZ7w45F7U38FlFsdCOqFdLYAayswRSaeaG3uUgbPG7+RQQqD8OTpmCYuTqO9B2tANyWYaWLt71BEbonNf6ZHWvu4gRiFHCAGzbhDbyxSaiZHYsRbb+s7Y0Aac2u+Zs6SjSkAWq2k1FwqWGhBE/BxmcoBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:56:46.1437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe107fb-9b94-48cd-e1d8-08df0abea66e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7603
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9b2285 cx=c_pps
 a=dlt6EHtatQYmFek7NWVDaw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=sGLiTVeSwTWQJyIeeGQA:9
X-Proofpoint-ORIG-GUID: Xffks8BGY6MAi9BkdburqM6nM3iwx2HQ
X-Proofpoint-GUID: Xffks8BGY6MAi9BkdburqM6nM3iwx2HQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfX8OYKEHog/ySr
 m7kVtSI2t6p03/Zxka5WXT8K61d5DonOHbAGLoIIOroZROgVE9WfFvaowty8mRV6X8C99zIkvam
 lRXwq/PAWbrSmCqIFzWLH1d2//Q7Y0NOyu2Ub62s7LamPbmJuHp3Bsrzh8wGlwH45D244VwkDbk
 DExOM860ddYJCWMqKjZQEYIxzluQgWgFhrE29Vilp0bHhWGkeXg45ZBeghWJFVeF+KfY9wExdWG
 D4z/fyIIvBD8FWRmr1JAuFhq2XCJ1QpaCGSkJQxkPT4eihyMCqo5IgYgF4i1pBLHo3euQbtYu4x
 LPxgVY/K4wS/WBJexY6SWO902u5z/yXDdbQesypAwXPsl0VcJYPMYwq1r7I8gWQoXqUEUH5E0ob
 4jlQnvHJ3GpKz0hT3NOgRWOksWfsV4tHNJt1gB6rltVaO8YNEnGY01ELCYNG5MVA5KI8SG4cmRF
 l11QTadpPnXIjovM7aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfX8WWZSTww6lnZ
 RNgAmwDgeeXp5uZHQLGWu+3KE4hMzyEMG4vlW980vXe2zVXuoWC8j79+5eGDimhk9tqh4HQ5Fkp
 v+DCU5/ucUNZRIru8ByWbr7hqONn5LY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040183

Many Remoteproc drivers, including K3, can and are built for compile
testing. The WKUP_M3, Keystone, and DA8xx can be also, enable this here.

Doing this exposes a compile warning on 64bit platforms as size_t changes
size, use the correct printf format specifier for size_t.

We cannot compile test for OMAP_REMOTEPROC due to dependency on OMAP
clock framework. But while here fix up the Kconfig help text which claims
this driver only works for OMAP4, when it really works across several
OMAP-class devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/Kconfig           | 10 ++++------
 drivers/remoteproc/omap_remoteproc.c |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5b56b2dcc725f..73500fdc227db 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -83,9 +83,7 @@ config OMAP_REMOTEPROC
 	select OMAP2PLUS_MBOX
 	help
 	  Say y here to support OMAP's remote processors (dual M3
-	  and DSP on OMAP4) via the remote processor framework.
-
-	  Currently only supported on OMAP4.
+	  and DSP) via the remote processor framework.
 
 	  Usually you want to say Y here, in order to enable multimedia
 	  use-cases to run on your platform (multimedia codecs are
@@ -108,7 +106,7 @@ config OMAP_REMOTEPROC_WATCHDOG
 
 config WKUP_M3_RPROC
 	tristate "AMx3xx Wakeup M3 remoteproc support"
-	depends on SOC_AM33XX || SOC_AM43XX
+	depends on SOC_AM33XX || SOC_AM43XX || COMPILE_TEST
 	help
 	  Say y here to support Wakeup M3 remote processor on TI AM33xx
 	  and AM43xx family of SoCs.
@@ -120,7 +118,7 @@ config WKUP_M3_RPROC
 
 config DA8XX_REMOTEPROC
 	tristate "DA8xx/OMAP-L13x remoteproc support"
-	depends on ARCH_DAVINCI_DA8XX
+	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
 	depends on DMA_CMA
 	help
 	  Say y here to support DA8xx/OMAP-L13x remote processors via the
@@ -141,7 +139,7 @@ config DA8XX_REMOTEPROC
 
 config KEYSTONE_REMOTEPROC
 	tristate "Keystone Remoteproc support"
-	depends on ARCH_KEYSTONE
+	depends on ARCH_KEYSTONE || COMPILE_TEST
 	help
 	  Say Y here here to support Keystone remote processors (DSP)
 	  via the remote processor framework.
diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index efff95b8e363f..1e96506ce7ca7 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1208,7 +1208,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
 		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
 		oproc->mem[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
 			data->mems[i].name, &oproc->mem[i].bus_addr,
 			oproc->mem[i].size, oproc->mem[i].cpu_addr,
 			oproc->mem[i].dev_addr);
-- 
2.39.2

