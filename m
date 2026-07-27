Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FC346AC2;
	Mon, 27 Jul 2026 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133761; cv=fail; b=WRaW9ODHH3gwUuUIgtM9jxdzdGCQ1Tqp8masqtkd1u0wSvEmYER8EJ+ADGGxaFUmZMe+mm7eG1pRjv5P1/hvz6ZL7/HMA4WVdzZFeAYz1kvpVbkj5vbyTZ9FtjBwOs2a71Z3UyJOgUtm6qsG+hDpxhW7RIgbPGlB3xjDOQaba+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133761; c=relaxed/simple;
	bh=ViAPafTgdVDKtYrdNmWSankqr9umZShQSkRLpWg/6sI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MSXjhhIR5yLRtgam0DR2tZCdL/p8M6dXej7YWYy+7g2UtvNo3ONvR4XvVFS+xY3fYX2XupcZaEMyEnintOvgeQpF71wOwnzbwCno0jo2h+FhFAqcnN23Shz8ChKDaGf0NXpD+n+0ms6KRqEoqPKl9meg164ZavuJPVk86VanAhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=i1+vUUbV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xB1XpP+v; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="i1+vUUbV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xB1XpP+v"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1j9IN3689769;
	Mon, 27 Jul 2026 01:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=A6JetovDK51ah
	fFEi0BU5h7kuKEpieMyqPy61mnGK1A=; b=i1+vUUbVNBSVHWveq6emQ5LvpunAg
	+H5VlVkQ5wL3cLXthps6LIckh8Vc47qD1HiZ7q1yFtaEPgdzeAEvjZPV5ECd1sQp
	AkJDDJC6soh3bGvbYQ/51Yy8TqvceL8xz0xYZ+LXKZsfmxZVen4JEHBMnq9bquDZ
	zZBVu+ez8569CwVCvqbvSN6pUeAPbGxS6uCp4oMesh5LxowouBdcA9Zke0+W5n6I
	on+1BaJEyQtdeM7xIU4+uC37SdsOl36Lzy5HSuv8eumg2+PB2JIsaFxrHQtzRT5C
	Sus6CbKhAYzSjGs9o7qsTiPOyE7ZdbPywXoILC1Akm1ybRVpLN7ejgXhA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fnh5rbf8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 01:29:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM5axlkBRAX9DomcR5xxye57AldtvKOURl7b3qlzwG6FZYDw2VVVavw7GQLz5k/QlTlheGn9xXcVXKCfNNrcc4pBneqHi2TkxwGdJbQDEdPmQboVrwUe7PQZtO1SZPU/TmbdEULHB4ROU01YWmC0Cj010359HAnN7zKbLUtBHnGfqh2jyzlV2eOqmMDLUGPtJ3bLDwzMabVFM70bG4HcwBGFNvAYfQ/a8aPOS2ZTpWmbjdM0JiHl42fR/rgFV1xcS9H09lqBEZ92Lcx/RYH5Ch80Ux0bhmTaERWllhVE8IS3bQR7c+xioMOLwpkoXT1KYXZIAdYvl3Q03fMAtmGCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6JetovDK51ahfFEi0BU5h7kuKEpieMyqPy61mnGK1A=;
 b=icZsy0Lhm2yHNpeV3n34pQuHL5PjCaSkhefFw3rj19oWjp26i261+tHpEhZdRHFVVXHJwFNlTO6HSJ+Oa/yL75o4zijU57fsAA/DKyAuWJ7iMAckRokySCThSMxPNO+f3veoIzqegYr6kGFN2amfh+dXo29L3B4fpiCgSPsXzna1LDu1Y98wXZGipA/jLi9d2bLGO0z4P9+A6ac66DGS6ZFSWqfcF/4wG/neYChl1R8KFcB82mcFmjJ/7Ajsg9BksSdQ8EpiNGWPm8bULF8CH/LjTI42SfkOFafHqU3MuVy4FwaieTTOtXpMnwraDUFgAbvz5YKOVE5cqKqT6NKTEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6JetovDK51ahfFEi0BU5h7kuKEpieMyqPy61mnGK1A=;
 b=xB1XpP+voSb7iJfHpcUfyQsHU//8EpRFBE268MHh+qt47c5GsSGT6U2BQmBIdoEtpYIYqkJTOUgLSmP6dHsdmy6at+kodbR/MlzbaVl1pNYF3fj1uSnaLidOOoUmt/wyFSqFlulSyDas221Cl+hK3dQJePDLOpAzcB5Y5lA5dmI=
Received: from IA1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::9)
 by IA0PR10MB7384.namprd10.prod.outlook.com (2603:10b6:208:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:29:13 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::56) by IA1P220CA0018.outlook.office365.com
 (2603:10b6:208:464::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 06:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 06:29:11 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:28:55 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:28:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 01:28:55 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R6Sqrq4130487;
	Mon, 27 Jul 2026 01:28:53 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add 48-bit DMA mask for TI K3 remoteproc devices
Date: Mon, 27 Jul 2026 11:58:49 +0530
Message-ID: <20260727062851.2934443-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|IA0PR10MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 8885920d-0166-4976-3813-08deeba85f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	zt5NzTjYZCYbllSNMayPgADWkWHpM9TgtTbL2JXdU0FIH7xQ4h61CiUi3y4UcbPRoE6IkAJIETZpkt92z42XGyCIRybQQvyyKFZQiItrPndYA762/upnq4hg3M2YvYf7nIklQOCsUXj18SsRz3U0erZdV/4/5fyuqV/JtJ+d39iylhqtHRT08GmeZsiIxEmqvIeo6HLPgG13r61j0NR7titCYZt4P0TGqYgEgjd7gf/X3aZpahlJpnm0q/5Jy3j6AfvMBOtFVfu8cNLEYnKBocqbsxRqxI2UJVaeVe7arYvkGKvEQwpLd9tcEmvZ+IY3oV+sHT5Iao2QwopfjSOp7wYr7iujla24o4YQXq6JOmzJlrQ2zZ/CHsWXGK5JQxrGJQ22UGTmcUsAEqSo4t4VZo7TXKeumiCmfAwkIp56VdcnMMfX3m/FnXR4etXpjynG6jEqjpQ3Pr6ZcArYJf3XpSQzPQEDo6qT1eHjYSbY2onTsWfKcvRKXXfb8asUPfaa+AC1EZp51OYATmG7OJKh3OkAMQJcc7JlMc2U1wqCc94qcHzCwgnYEdrxQQWfVtJcOVjjzE0CDSSB9MHTx8zcPCU6nmSFP60Rm/Ke6EI3sYRE1ix0owS1h12lQATMpqS58x9fiUSDMCSwIpGrBEr9R/Y0Y/9AlwpJxZPUecYNJX5X6gi7E78JBgbl4nGd+qKXPschjlBbCj+JTErGGbuseg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u4c38bKhfu7Rs55j6c1kad6v0J10Mketb0TLJLfKfzUNJVElhgLj6CTxM9bdSpuMwOuHz+jtgM8cp6jXZayMNw1ohtUERd7bQzEutIw80/p+cGHa8V69+llFlg4M0dtvJ8YhnQ34lCMCeJ0ux5J3YoT7l5K9rf+cEF7QpZne92xp3p9cBmjEePF/NJvigP/f373DDu9912/8lPETUsRPUYf6Yttu76n5fUIi8oDWGKsb429wZ1XRLNwMAFCm0s94QKUHVv8/Li3CANr68p+hBPR+TEBljGzb2u0vaktDUf5PlRDcgDESwBQlZnb7qfVMQadfRG6vn7GhgLDg/sFMr2ESnbjlyflq06cJLnEYOQi1y0Kq9SJbevVjdJVokVK7I+Ml9fjUxpCqZIHjoY0O+adsCJd4TgumLrhSxK30ZlgFVY6WqmP2FiEbFqFVNvqy
X-Exchange-RoutingPolicyChecked:
	DGNSBHIsMqA38KZWy/ul5vcBTt0bIaTfkuODZjRlY0+vxX5e19KonAihybdZtXWibZMq0iF4Jgi9/hUgcqRn0Wqqik+stC3Is0sB3NLFGrH86RSwF4k5p9bvjkGTFg3C1pHBPcX24+4jsndEMnd7UqpAc55rn0Hfqas4F23G7LHxMCrg4EUvnLXF36qQkLnJZpsWGRrkQjo4hEBQ3uHF/H5+HScF5GG2Vz2l0PVFnd9ZWnAiM0FcShN4dOYWtQIAIK6PO/MF4PEFnZ/ornQSsWu/gYiVq96pyPrgTk0S60J9fzLndwvZ4VwNvhVNw4FflQ91bys4cTI1UK7f6iJGSw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:29:11.6529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8885920d-0166-4976-3813-08deeba85f37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7384
X-Proofpoint-ORIG-GUID: GAEsZ7RHPiNArSdtXYobcbC0D26ofJkH
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a66fabc cx=c_pps
 a=WJg1qJ+8ll6SXBP1xA03Zg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=EgXKMweb6dZznZ-9Kp0A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: GAEsZ7RHPiNArSdtXYobcbC0D26ofJkH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX6+yzbZgjem6A
 GeMHMq1DZc9y/5Va2Dj2ErifjQO0avTQbja/a3cM6BZ7rEPGQfVr4ru0nsveUvOPT6dRUK3DMuQ
 FL+oHie+zia2YW/eNXwSuqRgZTtSNjE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX5pAIHgV/Q4UO
 0o591qM21RGuPUgPrYJPQrkwTsaNY4KLrJLrMO9+mTPWfVHnUMdhxVfzN38pdDJgUaJYyA4xKL2
 t36lEa2hFqAmk+4Wku2P15xaVBnnw2RKPCuynM/+1Uw86dxgJ3VY7KLUl1yl2/2hkb1tSJ6CrMG
 j+gWLH6f/tZbBBc+Y45NVr43ExPJS+229scYDP5PNtHDW8F4lHJwosBOc9Y0aGGdMgHOlDJIqOa
 5mQoguWad+AYBQOfFBrz6TNBEdXp2/IneW4Znn7RL1QBVztOrWyuCBk5ts5lzDX7R56DhvpIqTL
 2hjX4Mv3uI/gjaouKjbTCUFKp7Gr/7e4c0d8iMZfptfmBriN39BMD62mgpuJUJQ81CdbwrNtLwJ
 Nfa1zM9OtYq1yELwK+cnsA4DkgVJzLbayiIu6wSkD2IGJVgm0ZZqPov9F+3u+Xkxo4ALyEaO3Ex
 kQGauH2ccHHtKT7yiXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270062

The TI K3 R5F and C6x cores can address 48-bit memory space through the
Region Address Translator (RAT) unit. Whereas the TI K3 C7x has a native
48-bit address bus. RAT is usually programmed from the firmware itself.
Configure the remoteproc device DMA mask to 48 bits to enable full
addressing capability for DMA operations.

Testing done:
1. Verified above devices are able to access 48-bit addresses with
   compatible firmware.
2. Verified IPC with Cortex-R5F and C7x DSPs on TI J784S4 EVM.
3. Verified none of the patch generate any new warning/errors.

Thanks,
Beleswar

Rahul T R (2):
  remoteproc: k3-r5: Set a 48-bit DMA mask for remoteproc device
  remoteproc: k3-dsp: Set a 48-bit DMA mask for remoteproc device

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++++
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.34.1

