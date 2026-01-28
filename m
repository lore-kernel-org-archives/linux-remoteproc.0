Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45FD23D7E6;
	Wed, 28 Jan 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596303; cv=fail; b=sguhIl+8FBIpuZIHxxZuqmQnZb9oL47OXqw2oLKu01jotQUNgD6F1ehXB82/Y2YG7NJl0QnDbNp4aFxJklEL3fDFA2DscbHRq2oK9qir5Nj34xYXgXMv6KiffJBZTEEFH2CbVetO50pRCi6bBcVF5P7anHmDLyTZ7peoYErUDEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596303; c=relaxed/simple;
	bh=3B7OhJbf0s0rNE/8kB0DB0tVWVxHjpU+yjb7Mg1pa8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBWCQeaPXvxuWJUXZP/LL9hT7c/IUqtAppb/9LQgV+oJHP2mpcOjimcGqskmnrU4glpyqFr9vwdtffHlB+grAxf5W96dY4d77AoNFt6hSJ1PM2YO9RnvmV0p/WLGjxgX7Anwyx3VlnWNX0fEEoti+wfEUOxL6tc1x5eobZvG8gY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oyO5F57M; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oyO5F57M"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SAI9BE2413590;
	Wed, 28 Jan 2026 11:31:32 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bvq59dxa1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 11:31:31 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu2JXxYcaiRvugiCJQjrapI94xk9aYlO0y9XF1FAwYcTu/hQx05yQbtQD5NiV7/usdQgDuObr51B3RP5B7Onj1aG//xysjj9t1cVioFXNmio5C0jqrL5oh3rx3kASStrpnMEzTR4YT12U4FOR/II4zeDGTM7dPL7jr70w8PVMQ9iS6QJBYp0ZgFnFEsYpBMXxX4bfMhlMj3ScYeNy+R/XmqTkl38T5THSom4IDNesU3OlLMtg8Urq/eape6x+LcBMAS9nTcqVy0Lw//mREiT8eCwshhG/eGKWcYBfA7/AtGrVuSAdT69DaDnT5xFsmfwguzb39I7l1gI3MHXyd3DhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY4ku8hsSlLpQPmldc609vzt8aVMkuH2k8U6YCqCkOI=;
 b=OCa4g/VtzgtLYEH5R7izPMwCOgPSs7qpQUkPBw7k+sNi/auV1TAch22jOxKTh9q675o1mNXgHlRz04dJEgF70UjwNX8ON5m/EYkZwW3kDyUH0CV8r4Mds7+2JeywWFDyxlHjW3suM22MRFOHuGJVAiz7+cbvRWYKLDEVhd181lzAQ4X7xJZwVRvbCdb3QM7scfhdhmtuR8ysDpvctiBD5DeRDR5D5WN41YFM1WpPjEC402jxtrV7oJ14YzAxIJI4MexcwOf440xhUj7lPgoinspJtNZJFVI6UAr2i8vdHFQWiKIJh7I2mZOGs/reEbc04KSSg9Te0saUnFcBwMrb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kY4ku8hsSlLpQPmldc609vzt8aVMkuH2k8U6YCqCkOI=;
 b=oyO5F57Mm/DDrD9YHCTXtSp4eExJb2+GJsiNzshXroyCeUK+cC712ZNyzqxNCX9rlAh9qw/eHZPiiX/hoeLqygZJWIw3BGZDPS7EYyp+IeAXUCPKImJNwnNFEuQUzD/WUU96/6tSUl5LmIIY41T1IGzPBnuo6Qty9arq601BPGkDtQ55TGx/DfNkZ6bSggr1wdWzVt79eOEcXE8YPelgHelGiYwK/m63wzld0ZUXLG0VbGDORl3K4Z5r0PtTJAgxCSFPPWSYFopbL3O7OdBCnx0Q4KD3OSKcqYLD8KyWOiBjqJ5JoYSLnCdvg9sx+dvmuG+PPABoLz8UFi3pKLu6cA==
Received: from DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) by DB8PR10MB3355.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:f8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 10:31:28 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::80) by DUZPR01CA0280.outlook.office365.com
 (2603:10a6:10:4b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 10:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 10:31:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:33:03 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:31:27 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, Andrew Davis <afd@ti.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/2] Support remoteproc fixed device index from DT aliases
Date: Wed, 28 Jan 2026 11:31:16 +0100
Message-ID: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DB8PR10MB3355:EE_
X-MS-Office365-Filtering-Correlation-Id: ae916f35-a77c-47a5-d157-08de5e586515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WXo/FzsthzuFxGsy/fKigxaIQEBQkobDgL4zk8aGcPLqjZDwJDsXkdoaOnXR?=
 =?us-ascii?Q?5I6TChXLWudEpTaRO3bwtehJExjz2Fx7ttDJJXv1BnZdTSbAK76hYCX9vaeq?=
 =?us-ascii?Q?a95IhGeYiNQ7g0dGLvuhky3cybmUBe1b1e+OgS0Yq38A0B1KSsGrjFXDiFvf?=
 =?us-ascii?Q?IHLViXyG8Ylk79TVPYBOC+UsqdjHLIu+qwS7Bk5z35E1hvQMiBah/frDRNCX?=
 =?us-ascii?Q?ruflEt14Yy4J6BX3Am/KzMVEcBBBHcR2DHPOJXUh477VNbFOB4mbXNcVkWlo?=
 =?us-ascii?Q?e0b6Heo0PM4Zw1D0auoAm2NUiKjWu5lkT/RF9o3dmq9cmnFQNClGoa5icXMp?=
 =?us-ascii?Q?ZEKFKCxG+GYoYiXUJS3DHv37D5Jcq8Aqpgd0wlf73ZBwuhmihdIcrHTZd8Rp?=
 =?us-ascii?Q?szrCfjb+Eav6c79B+lsoPMHJ3sm1zo+ZkRbx8pOJzYKhcQjezvSjkBwQf61i?=
 =?us-ascii?Q?sdafcOWvPH+2qEu8JnunQYDBv0Oz+6FuwigpI181i5JeiPgeDDV4lCd1WO5V?=
 =?us-ascii?Q?56QE/MNr7J9dr1Fx5OXrUavLDmcBK6slpX5aHfshD/cdlG26bRT2Hvz1Izuo?=
 =?us-ascii?Q?IqO0uEFYT2ZoqLi7ZSSbtVJYFo9hVGIiNY3B9eSDqGUXpxMmchqnNjBlESAr?=
 =?us-ascii?Q?CBLaEOBw0WdpOUTNIjuiUEWADdTU3Ck0cQqszE3cLYHYUd7P7EbZopZRoTA6?=
 =?us-ascii?Q?6a2pWLyuL/IiJTplTmJYQxRIx4j4hD4bK37j/hEecxHf+/hc8wvXcEHySKdm?=
 =?us-ascii?Q?q50Y5YcDMDPjILgKgIcippDE1auOqv5YkzSSkeNR9l77G8Lsgsj/A136Y6CN?=
 =?us-ascii?Q?TGoOKubF1VbYfV//HkPKZjh2CJ2DIp9rtuyCdeC5ud4WiW0nUKkQeHDHW/w3?=
 =?us-ascii?Q?7Tnlch0Aek/C66gWLB4Cjg2vN5eAFKggWsNnzBOGE7QP7mAI14HsgrSajTpA?=
 =?us-ascii?Q?8GJCp6mSiLoIXyaJ2vsCHTDxtXAIQM/umSPM/OPsrKBrH6gcdemi4FYuzMW+?=
 =?us-ascii?Q?NbQojCqvFXxDSX0333kgv4maMKLUBwOwaf1jgBGqVwbVGoA/cp/UO8J99rW4?=
 =?us-ascii?Q?aWds4ZS5+F0o/dFnwc9S2Q37f5MhmeuDBDnECkXfrGLo+ABsrpWPuLdRiKL4?=
 =?us-ascii?Q?EvSgRyDlmaJSk9pIQ0qv+c0fD1DHMyAUU14oCxleUy54zuKNepiA7tromW43?=
 =?us-ascii?Q?ekcG0dGXZ8OE4PVK9Ur+yo5CC/p5aVGk0PAphzoNYtlbp2vsiQWqT1iq51Ps?=
 =?us-ascii?Q?U/e02o8w79WPk+b5eUhFey+aAzMJ2/WHCbLkPI1OYxWLogSiITDgzqZjVTqW?=
 =?us-ascii?Q?E8r7nX8TwJGMtr/bDQ4VLWgKY3Fr1RDfESr/BtafLaOD8xS0xCRfL6y2uxiW?=
 =?us-ascii?Q?yBqxEEU+Sv501uF7I7j1Mi6tnIML3LCs59n6gXFP3OLlTRisU/2tf87EOp8Z?=
 =?us-ascii?Q?TWpE6q0+NvAH1Smez4/Iz9Ak/cUgngHofPUUcGv0XGrtUe10kxdLfyVosvdA?=
 =?us-ascii?Q?NdIvVXWu1rvSGMEk6yVPQBXnXqBD23KIcLne94lYWIJZHLJ9hV4qF7zSaq6C?=
 =?us-ascii?Q?bM2q6uOf8XpeP1aRg+zNV32b3IDShqbD+jMLo3tXHud38LSo/gZIDvr6ieWd?=
 =?us-ascii?Q?lKwy2ZUrlnhi6YVrepNAsNbQeP4nRPmWzpMPEMI95aCDqS0Oon3POdYENqNf?=
 =?us-ascii?Q?d4ZPaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:31:27.8172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae916f35-a77c-47a5-d157-08de5e586515
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3355
X-Proofpoint-GUID: n01CfyzfFa6xFK-SKP5OVXzUzx3sstBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NiBTYWx0ZWRfX1tx0pDB+X0jV
 dvgHmVHCY92GfIsX1Q/e/PFI3TL4BaT1zUsqYmQSJyKSpLRKNX4Le2CbDMF43eJaEojwiOVnhqT
 gIq5MNc/lSHUTr4d3YWcBR3eoE/eAB0QGoor3x2Q3xPG7Ncqp3iw5+gxe+YDgdyA+97rqcUYlvV
 5aekcAFtX9XEkVCvp2xrL5RL2xjTT4iMtC/dYTWL5faGR0mv0DrEUjfvh/G9PBC2z97G/9ClUYZ
 4E0AJhAUGGtANMQZSH2EKmmmXwO4yAa9yX4zXHj55JRP857AXmoO15IJ53mqvDPtzSmSvtFQ8ev
 H5+EErLtMFPsVHGQZg0qeptvZf8IlxFBGO28y5o1pRncgro7b9Pl+WZXx54ZUDWCRCiLmqkELBu
 xy9msfYk+4LyEsVUjRMCbiynRuDhZlCG5VCtbio/xE5LYyxv3CAGYDzP3xJ0slabo6XJTajJ+2E
 c6Fk5k5Y8QoTaDBxbWA==
X-Authority-Analysis: v=2.4 cv=eu7SD4pX c=1 sm=1 tr=0 ts=6979e583 cx=c_pps
 a=5tVRatAlR71lqUljYdswKA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=vUbySO9Y5rIA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HCtAAd-tuwZygx5QaxwA:9
X-Proofpoint-ORIG-GUID: n01CfyzfFa6xFK-SKP5OVXzUzx3sstBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280086

On systems with multiple remote processors, the remoteproc device
enumeration is not stable as it depends on the probe ordering.
As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
always refer to the same remote processor instance, which complicates
userspace applications.

This series:

- Introduces support for "rproc" device tree aliases to fix remoteproc device
  names and their corresponding /sys/class/remoteproc/remoteproc<x> entries.
- Updates the keystone_remoteproc driver, which also uses DT aliases, to adopt
  a common RPROC_ALIAS definition. Although it already uses the "rproc" alias
  to construct the firmware name, the change proposed in this series should be
  compatible.

Please refer to the patch commit messages for details on the implementation.

Arnaud Pouliquen (2):
  remoteproc: core: support fixed device index from DT aliases
  remoteproc: keystone: use RPROC_ALIAS definition

 drivers/remoteproc/keystone_remoteproc.c |  2 +-
 drivers/remoteproc/remoteproc_core.c     | 40 ++++++++++++++++++++++--
 include/linux/remoteproc.h               |  3 ++
 3 files changed, 42 insertions(+), 3 deletions(-)


base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.43.0

