Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C48C3559E1;
	Tue, 27 Jan 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519189; cv=fail; b=XgygQQ9lOEAYvVE6rATsGu6ivWwWWbGt8Y/8QkwaqPlaCD2BbLTNvtjRj8A+2HyJPMJAB1w796oFKsc0r/69t2jWSblmM6/8l5JAm75OMSEXDfrkQwJBnwuMJcZQ4x+/XVducpkZ8eUxO8sElTyGJJEcaRW7A4cRWMWs//0MGqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519189; c=relaxed/simple;
	bh=F+EZWc7J7vo2ErsbnpumhhaQNah5o6tXkmgh51HsCrQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bsYK/SI7j/Tdq8JCw8HTghryW+8Nb3Xt6SBk6na2NefHdqFTT6P3mRFfXf9oykXDfyaTWpYARDjzWohYBHq5zR6DusOpcmO9pMkP1yFAc1GVVBCUGLAdTnOiDahSS+D5eCzUJZlKJC36r4/Rund6sqBUfqyMHgRWMgF0m4TorGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MPqAsoPr; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MPqAsoPr"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RD4Kbl620104;
	Tue, 27 Jan 2026 14:06:19 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bvq95smda-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:06:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUiWhlpn/MoPJ5ISnAdBGTNv/cJanOc5aZF+EBMk0/XknaHLZWQDqqmfxEBpzm+pCw72gckOAqFGL4Bztj75tVClN4JCerqheQXFjQAx7Di6C1MSL1KWx5k6Ha/2ZSG9K3a6QkAm6nt0p0z4uENucaAGie839IgqQdEeI33LWODkPb44eeaDAQayMiR6OaDAopuPoriWpXSP1vLXMVVS7UjKXY7PtEUIlX8foXQ4v7tPWmMuikYCH/Q+wmMex5vpZwYvEKfq/3h2G4W6u/LWJF24uj7/lCvDLQ3yCQvmUm+eN3114Ijuxh117EiKBM1fWISLdyuORc2hIcpN9bhrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7lO0OlxidyDucPNrjQoymSirx02dUjjUrlfC7NSgeU=;
 b=xAjK4yzm3DdSVoM4neco+eUjuLC5AphakphoDv/vNf6/tDzb7xn44wwr2QxjlAUTGLXcdmF81cgWMuSxYNC2/LdjPlCmoRERo1O2dnhFconm160DvrNSqJej5kxJj1ivkdBaxcA2gbLJ6UCOLfwUPbCDAUfRzkpGx6IeziQksJS258E8+6vCr/aDzOR5qfnsAw2ZSUQ5KkWKfhqxLfmWqLWjljNzdRW0eFSdNvzfEP5sHje3KKzwGkhT+lMu6UMHSY0X8Vl9CO5My73G9l9bhydv27/hMB6e8x35psr6FrNvVWjxMRxcu9vep8H5XVouvrNWTMCqV4tcERbLztPj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7lO0OlxidyDucPNrjQoymSirx02dUjjUrlfC7NSgeU=;
 b=MPqAsoPrFmiSf8P1DLD12oUnq9reld1+K3U9alu8MW9Y/FT3/vuwDNfnPPR1j0gyxHmkDzbsTg6b95tU8KemqZDtz7su9NHWAGxqDAs0ibze4vqqnSIPJRHixaTph81/Jsxy/PEniuN7tc1VhNJP+jMvo+ulbk/8hL0jfhoeDgll8q8FcLQjNB7j0yL9S70LtZ54NESjwGgtemPf3Pga7Rv8dDaQwGGaCntEBKjSZSL/la4AWeX0L0HoZGkaLcAHP3+uVfRopTErprG1vRSb5feIUKmASgOBDEj5mO/PwpNgGSRpJ9M74KuPed+uuD6qSw/J84PP6y4CCtX7u8uHbQ==
Received: from DUZP191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::11)
 by DU0PR10MB7237.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 13:06:14 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::30) by DUZP191CA0034.outlook.office365.com
 (2603:10a6:10:4f8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 13:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 13:06:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 14:07:49 +0100
Received: from localhost (10.252.13.36) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 27 Jan
 2026 14:06:13 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [RFC PATCH] remoteproc: core: support fixed device index from DT aliases
Date: Tue, 27 Jan 2026 14:05:55 +0100
Message-ID: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DU0PR10MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db0dad2-cb4b-42ef-344d-08de5da4d9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?djXifVWtgUwX/ulERJX3kqWhiOfT05HAEbpeEazFKpTxTWjRCbyazjAoK0lZ?=
 =?us-ascii?Q?kbqscdoukBGG4QlimfBWLUeCL79FbFLtd2qUyCyGmcAHSz7F01z3yZNnQEfJ?=
 =?us-ascii?Q?s9kfbowMWVlK2rAsdgPkGw+S++D7Gg7s+MKCfvrW+b2p/tLEO39eiHVa/qOp?=
 =?us-ascii?Q?0ftfPt84il6uycjtRDtJnDXFul3LuyGby2IlwSwKX2q+JO67u+5XgRTtVzKj?=
 =?us-ascii?Q?WuO8yMlq3U9c0OxnM7Y2AX7IEuGsoVlonrt1JBnL1QqsDMhBBxSyXXdsYgFu?=
 =?us-ascii?Q?TG1H4JxO+kYXezpK8fPKq0RuTV16cyDnMvypy5/MqdlQuFFwaQaqoqmzA0P2?=
 =?us-ascii?Q?7rCDzVLsuBm1Lhsjq4YV2MPHKdz5G4GJAJDBxmSvYvx/9Qf1GEjE87iscQFq?=
 =?us-ascii?Q?UHnjX3yewECK0Sx52IzZZ8oEDoiPt6VMUnVyydR2C60LlCbEQOf1YxmEvO67?=
 =?us-ascii?Q?/6M0tqO9TLAZx04rInog2pRXIhbsYJQTZNVSY2dUVXHTyBvwSFQsaEpmOHxF?=
 =?us-ascii?Q?i97BqEddR4zBlljiDl9Upnb46dkR9LAmORYuSKIm44KETf92hE0r0fNg2RoD?=
 =?us-ascii?Q?L5aznmkxycqGjmmkveUybAQSNvtKXRsjecxZ2tCe9zZsieeV+CGSVpsH+WJp?=
 =?us-ascii?Q?TUF5iNk69EPMqE5Bd/+ry+SR08cDqOMczi8L5nZzPPLzF/TSaAukCHUPfwBN?=
 =?us-ascii?Q?T0WEtrvATphCLJI7WgCwd8XICILP6PIHxmRJy6DUHgUYI5IVVsGA2b/Hisst?=
 =?us-ascii?Q?w7bY2vrqXo0QmAos7B78qCS9kimWrfmVE0B4r4siBVxzUigoAd1a6LcJausc?=
 =?us-ascii?Q?Wyq1nq2ZmCoY6wvnF0JsTm0CwYagugwRdhuNmdNve2WZA7Yl1mb9uzB+BMMy?=
 =?us-ascii?Q?Mg8UVqA1uGlJb1VcEKC49dpFSnHdScxv1r+ke35uIx/wEsGEN2/BR7E+9WtF?=
 =?us-ascii?Q?naU70KgKn6+EAfukUPc1G9Ln+I8uZ/5MfNWqPlJNkXMwleq0t+5jQ/3zRlwR?=
 =?us-ascii?Q?9ZCNYs25AuYgG4W+slVkJ5gvAl6Pe48RahhtEw84sftlOhOWvpDazwUsPQrp?=
 =?us-ascii?Q?u4pUisJRsY7MTz5CNOov9/o33nMqA37YflDJ/SNWgjXpcZlwxcTVYGzj5wQc?=
 =?us-ascii?Q?i28irsckohVPiPX3Q19TQp+nKxyW58NIrtLpqVGaso08/i9Z10ddFZXcRdJG?=
 =?us-ascii?Q?rvA2n2GqXGzVETSjQh384sR6gkCpcsXr92q5lhj7tByb+UU1zI8a1GVFC7Zb?=
 =?us-ascii?Q?LtliUA4renfLwCT9cvPCmoSGKzoi0ASW2aFhiQIwWFhcMs0WL30ls29kb68u?=
 =?us-ascii?Q?3Lb52mvRpoajluqjlO4mR3e31dOdLn542sjK0/m9861361HbbVjKiSVruS94?=
 =?us-ascii?Q?yq7zQun3sqzsbHpJelouUOCQ5aGI947kVV3q2Srr0Ew3o97NhzeqmX838IlN?=
 =?us-ascii?Q?jm5gDzhOUr43TEFE1eRhv3NmZ/WobzUNMIaw6Oq9MFS1KP+dzEZh4KvTFAUT?=
 =?us-ascii?Q?fWHn1Vw/UR0C5nJVIueDMthLSy9Bjwkh8ithx6h02lHELcqyvoYJBeGlu4gk?=
 =?us-ascii?Q?zYu9gEFOd1c7/T3Oi1ulDQEVTeXCEkqPTX7Dg7j4l8U8DLbDLzHc+E2lhNiG?=
 =?us-ascii?Q?Lvw9FZAYyoyzqVcYs5kwYkeOa52FxgOWPRwB9IRGyoT2WYV2FDNZAjtsWqoU?=
 =?us-ascii?Q?HfQ0zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:06:14.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db0dad2-cb4b-42ef-344d-08de5da4d9fe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7237
X-Proofpoint-ORIG-GUID: ido_5TvKK668GKCLLQ1mWIS8i6sVyMrk
X-Authority-Analysis: v=2.4 cv=UIHQ3Sfy c=1 sm=1 tr=0 ts=6978b84b cx=c_pps
 a=Llug80rbSaTcBnkUtfFniA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ovqo7BHi4x0A:10 a=vUbySO9Y5rIA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=wx8CEvD3tLIHXqhHXXYA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNyBTYWx0ZWRfX+1dJlfUuea1K
 +I7oZI3Qp5kQmDeecYqgfJpPa4Obi4d4T0i1LjSA/oVqIlwg1fxuWt/cXd4t+zY8BiagR4E2g6+
 CEd1J5UPDXrWxMAF6dl5JIsZsl0EH1/PgggyFdx1AGZCRViV/Drfh1xBRTF6o2p6ZGpVZUFwma6
 UQ/STdOngF/rm02sogOkFzmWYeknJr3E7S/KXXU64R9XFhiGmQjCv6aw3MruH5jsw9Q99jP7RxU
 zSaiPxDxE7PYayuxDreu7Smjl9ozVX9WbOw4TqKaWFzv1ZC2XKI1Hc46YZbhkRaaN5jZpKFGu5/
 nBSzlmSHJsRMjJt7I9Ftzt9zsyCg1euxZpH2biKVdLl6tDdlXsXzDPZps5OzgTRnyAUrLxEHEGz
 kzeRuuTyftqnhbUIxc7HYy6P6cA8sqJRVrUnS8WLtf/jc5vKjk2CF9q6A1SWX64VTqhBFDRD9HW
 kxkPyXi6460KG52JN/w==
X-Proofpoint-GUID: ido_5TvKK668GKCLLQ1mWIS8i6sVyMrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270107

On systems with multiple remote processors, the remoteproc device
enumeration is not stable as it depends on the probe ordering.
As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
always refer to the same remote processor instance, which complicates
userspace applications.

Inspired by the SPI implementation, this commit allows board-specific
numbering to be defined in device tree while still supporting dynamically
registered remote processors.

For instance, on STM32MP25 Soc this can be used by defining:

    aliases {
        remoteproc0 = &m33_rproc;
        remoteproc1 = &m0_rproc;
    };

When a "remoteproc<x>" DT alias is present, use it to assign a fixed
"/sys/class/remoteproc/remoteproc<x>" entry.
If no remoteproc alias is defined, keep the legacy index allocation.
If only some remoteproc instances have an alias, allocate dynamic
index starting after the highest alias index declared.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Notes:

- This patch is submitted as an RFC in this first version.
  The main reason is that support for the Cortex-M33 and Cortex-M0 on
  the STM32MP25 SoC is not yet upstream. The primary objective is to
  trigger discussion on the concept; if there is agreement, I can drop
  the RFC tag in a next version.

- The keystone_remoteproc driver also uses DT aliases. As it uses the
  "rproc" alias only to construct the firmware name, it should remain
  compatible with this change.
---
 drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aada2780b343..8da6c410870a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2461,6 +2461,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const char *firmware, int len)
 {
 	struct rproc *rproc;
+	int index = -ENODEV;
+	int first_dynamic;
 
 	if (!dev || !name || !ops)
 		return NULL;
@@ -2481,8 +2483,27 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
-	/* Assign a unique device index and name */
-	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
+	/*
+	 * Assign a unique device index and name
+	 * Look for a static index coming from the "remoteproc" DT alias
+	 * (e.g. "remoteproc0"). If none is found, start allocating
+	 * dynamic IDs after the highest alias in use.
+	 */
+	if (dev->of_node)
+		index = of_alias_get_id(dev->of_node, "remoteproc");
+	if (index < 0) {
+		first_dynamic = of_alias_get_highest_id("remoteproc");
+		if (first_dynamic < 0)
+			first_dynamic = 0;
+		else
+			first_dynamic++;
+		rproc->index = ida_alloc_range(&rproc_dev_index, first_dynamic,
+					       ~0, GFP_KERNEL);
+	} else {
+		rproc->index = ida_alloc_range(&rproc_dev_index, index,
+					       index, GFP_KERNEL);
+	}
+
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
 		goto put_device;

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.43.0

