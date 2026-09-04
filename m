Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65134CC29A;
	Fri,  4 Sep 2026 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551861; cv=fail; b=QwFrk/esT+er5MhuYIWHbePXGBQTrz0pW2RAcRs0EJMzU8RstLHNJuJslY4zRixdPTGQg33LOxAghbSE0AEXdfArp7CpfkdgLHISPkM1ZBmX2RE4LzxUXEMLHb9VWC/Pq+QEUX+8z2xfwl7oOCHEX4y1skz0gB794+YnoGMH+zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551861; c=relaxed/simple;
	bh=Uq4fcFu5zK/BXpybyOFTJeRC/euPcviTPhqYDBW1Rr8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f64wtOcWI3nxP49bZhDX63EMtSLZfEbUjbMuX9ZzergdHaPQyyY9oJFJIFiV3kEjW9qRT0TlcLTOwhcq5UAAm+Y3M/K6KrjeIZMU5iTEsDgADpr9kkvWaWxy4PpmheIV2zsSFqaxnY5e6vlk5unXcpXW8LGFsPfhjW4XuzK6JAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=opHsAf4c; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vQsOpS0U; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="opHsAf4c";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vQsOpS0U"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684HHreF2741869;
	Fri, 4 Sep 2026 14:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0twDeNEWOiPd/
	+Z4nf3V04XGQ+Smu46a83f983IoidE=; b=opHsAf4ccfOBpm5yfewEvNOQJ+w0c
	P+2I690Sp/bYt78UMwHRhLc3W1wznv82uBlyy/FcnyAtF2JCzHMLCCaF4Wj+4hn1
	m3m0Ggv1Y2iP3mj2X68bF/HO9ZH3DwyUTntCSHtLG1wBnKhQx3Iwo0m0Y84Vochv
	RgQLtVH3J9culXM4w+sJ47dbZN1YIgaCl6GT/MhkG0G3kUOHt8aCDD73DC5eece2
	rMKHlZGH7GLPGc6ugDgNHqnQy25O9tyZc6br6MC/k/pJFKYWMzlJ1/C8A9rrqTgD
	7s/27r4TXgVDZBMp+YA/FoRxbaoMn66sM0kO6U9WmdCudAg8ENI8uwB5Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfyx7t7s3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 14:57:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcP9CyHEl0oiudHsRda+EgH33O1jhiaVxm/H620jtgOo0PsJgAZVCRXjN5AdLjD8CRg2nnwfxXSTDdFqfy4xj+W2sAgUe0zndBI0aaZL230VxsHfS29QKfWJ2V+HarcsVZct6JZsPsUFkpXqI8tGtc08nZUkFCQ6nBKhHxePv+lWbK1AvF4fkCHJ+8oi+wERAEs5J0c7MS8uS2/ibXNvjl3MqhFj8hgoaAg03IZoQ5VRQeiBL0bsdrg17W/jzQ4UEng8SsN9jzCEpWWZGfRJHOHcf7MEM8w7Z79LpghDjgGd5aQW4UifQUQ0AIIhp7yszgmLPHQITdqn6i/rXbpBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0twDeNEWOiPd/+Z4nf3V04XGQ+Smu46a83f983IoidE=;
 b=L14ljpi5AJ0JjdxKwS3ittic+Ia5TEW8mr+zhmpDIiutVKzG18pTUjboHLRNGry2PHsbJ13XvB/XTtW/X6vDjQCTRIHXx3KsgW/2I5CUoNgiO1ceJj7V52SfPSwEoikNZpIpfMgPtPUnIzymqHiX52R+xMeSQArV4qfx8SBUyEqxYughhvV6qvEkmvyTH4NhUQGvTmKo7TGUVPnF9KRnIaTfisSco+rIKk82dJe22CIB7F+hGMuumBkf69BxkDGtOcsGtNa4drlVUQcppYMDknRlT2FYuvv7GqjcOBCeV1aY+y3gk+MLab9GK+gXvG4LQ5fWVhIn8v6Fn71qtzCpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0twDeNEWOiPd/+Z4nf3V04XGQ+Smu46a83f983IoidE=;
 b=vQsOpS0UyDVXKsPBSEWhChfAaVWEETDONYd5eNVBndVFCBDxCT+7UOq0uGaIRQ34CPNXFOhEldeOmrxPzOGPiGkkaJYkfJUygygftVWFi8bLpjR8U3uT7MH6tNxDgF99CIYlg8t6brLwXsKfeXOe4ERXcxGIdDZQqbBf/wysoFs=
Received: from MN2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:208:234::27)
 by MN6PR10MB7543.namprd10.prod.outlook.com (2603:10b6:208:473::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 19:57:23 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::af) by MN2PR16CA0058.outlook.office365.com
 (2603:10b6:208:234::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 19:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 19:57:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:35 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 14:56:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 14:56:35 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.126])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684JuYmx4106413;
	Fri, 4 Sep 2026 14:56:34 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew Davis" <afd@ti.com>
Subject: [PATCH 1/3] remoteproc: k3: Include what we need and only what we need
Date: Fri, 4 Sep 2026 14:56:32 -0500
Message-ID: <20260904195634.2275867-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MN6PR10MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c786e69-d791-44c0-3273-08df0abebafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2D8pvkoFkUyB3oHgvzUowkkThnFP73H+3gUIqmnp2R2pTupDADrKEyCsoRnu+HyDv9f3/4Zcgf0AVoGmfAyGd2RaMyxkZmI5WAKjqNgFO4nC2HaIzQhk6bHliiPdrmBYiR5RKeFjMKBe55oDr/otHzlvkI6VRUPDN2aSniG18af1ODKcmT1sFZ8CCT67hvpY4lIQvdew+SjvnbrNfGNQNG+DjdHxu3Z+Dlg7nhcA4uR1ga/GbruJHhPAGOdT5+odhgevEEs1klHGvXxDNnz5RDtQpxSZvKuq8buLNJ8Q+6PL0Ja0WTiZLU2THYmLM6ls6g1lhhGodod1CNTEvQWBjFLonDWfLr6pb5Byw3yOY7kB2nNU2UQOPtILsKGegyjze8F6dDlqnU1y4qXCLKQ2pPtcr6PxbHFIX7uD4Ibcpsg4oiyXhshGGRe+anKZnl6cOCpu6s0xXyxSA5AcU9x0eOd9FLu/lQDeIXk8X1GGHWakutUJWtDcxIrbLquR8Qe91GgcitbdOznyhPeapF2tfsuoARba3HhJ0Coh/sRf319F0uJA368nUb5IpKSZLi64AXhrFAzkjv2OgReqqGEJxCKVRLRmm1ttZUHybxhiuUUFelWKCT7xWMnilp63eMH7FmULVJC3lWsU6cS4IflytXjO+qVS51j5JXN2485XDZ29OTz14nIZ5KC+vteSTt1F
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J8SOOAsGHAtA3k6sTjoD9s+wydRltrlGp3ffqGsKrbA7d6QT9WCnYXKiUHX1K6tMacgksMNU3aMZcoqk/+wewm16mvavrZE8BXOe9z92NVBGNXv4CaUIs4ipf/I2zgJxWoLcRJe74fl9yCai8dHId3VZqIOY+2p6kJJp8hlNVXYzguamdlMfaXgSIQwPojZNN4j9fDtKfX2YgTkBrOkxSnwBBQqX49MSPDosd/tAqjgzwHDftMk+vBC3W9uy6ZH3bKf24K0ICYyqT1TlRY7tCsrBKm909ZFgOrqoDPq/Hnq2lTddDfKtBiV8WUgGLkUS5Eo8/8It5GgFZAEksKz7FfUY8jr090QwwKU6vxxWFiAF0/vWWl5aYM3fFj+e7k+5+YpRtOHdwpj2SzUatFJrxrTd4apjoTcOWKIgjq1WDRL6KVMIx4vEdFzn+rrPKOp0
X-Exchange-RoutingPolicyChecked:
	1XZgdyuKAcqxL+nLoPpPXTZrdf/xUgabSRvfc9mEGm32tB9KZfcCBybLlda3W2EiNEwKDIUbRFG+umYEQzBX6HHHhGc5eeWZ+soxy7kBXUUxIi972+dbiVL7Br3BPfGtSBfcl5OTbA3k5+GJ2qX9yfMnPwdGOxZEUB4ccq1T/esg2ELdRHM9On22BRY6fSJgigzyP6ulvSxWwKVEVC+PXyt0y69z0uly8LfmNNqq+GzQXhx4Uy+VYMCqcOsquHGuHLCP007YrAPwrl9pOoz4/Z1HMNWiORIAuwhwCXqGecjRaDzX7BgdUieafxcpZg+RDCkfGud7EhV99tmiBCYfmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:57:20.5934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c786e69-d791-44c0-3273-08df0abebafe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7543
X-Proofpoint-GUID: zuRdLoB1J6yvVJNqdUdY4w596OxzM7Yj
X-Proofpoint-ORIG-GUID: zuRdLoB1J6yvVJNqdUdY4w596OxzM7Yj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfX1x79I8f798jS
 M+JV00MJVb8eEL/qNwihMsvypa1MutiF1Xr+WkBFl3gU/bnublPvPs7urSHuwc+pAnqUuUPRIS+
 2cbaPrPAhd/+G34+mjPdXGaFeF3yHP8=
X-Authority-Analysis: v=2.4 cv=PPM/P/qC c=1 sm=1 tr=0 ts=6a9b22a6 cx=c_pps
 a=LBR8CsJoUNkXwF8+XrmcNA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=UBZWY0DgWjV9GpcX:21 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=JthTk-mfROXdH5gyLUgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MyBTYWx0ZWRfX6VHwtE35VwNa
 20GM8ByGtWBg/UC4/r4a66oSInSfYbl+r1xRX1qPCXgSo5wXH4N7MSIXg0/oIx7gVmloB4EYOUe
 Rhy0DWad/TNh9qK3sY51Ly/5PS8hkrwgMUbrrn+2aThVZhzztPyzYW+RlxHaE9gAsxVwt9/dI5L
 YYVPE04Ax/+8BWAT3smsJ+rC9F4ygAXipHwtWqx3w6DWBFDMQPLBHPwsJ9Rt/aCQmtu+TzVJ8AR
 G4XmRHU+5J6L6RezN66q+glqCi31HyU3As2YOCGdu8In9QBYMabVnecEp/P6SRSoLcYf98khbRR
 DHslMfkl6LoziTXtDRTb8g3xuWubPBihF+YLv8OKQMyU4HuIr1wJa8CNsw2obrkA6HMn+AYJAy8
 jvUHvpD63uWgcgIvo5LNnWFM2VtHG5SnFvu6zF+sC+nPAJsZIb9kRTKJiACo8fVfsX4Y9ty4aO9
 oGTxeE/l4Ljllnpk/Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040183

The header ti_k3_common.h uses several definitions in headers it does not
include itself, this makes users of this header responsible for including
the right headers first. Instead include what we need here. Then go and
remove some headers that we do not use from the K3 Remoteproc drivers.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_common.h         | 4 ++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ---
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 4 +---
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 5 -----
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe510..c8430e42225fe 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -21,6 +21,10 @@
 #ifndef REMOTEPROC_TI_K3_COMMON_H
 #define REMOTEPROC_TI_K3_COMMON_H
 
+#include <linux/mailbox_client.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
 /**
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d6ceea6dc920e..c916a86bc8294 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -7,11 +7,8 @@
  */
 
 #include <linux/io.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_reserved_mem.h>
-#include <linux/omap-mailbox.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 3a11fd24eb52b..4c46f4a256a92 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -7,10 +7,8 @@
  */
 
 #include <linux/io.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_reserved_mem.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index b1d04d082e44c..404acc1a9bb7c 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -6,17 +6,12 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
-#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_reserved_mem.h>
 #include <linux/of_platform.h>
-#include <linux/omap-mailbox.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/remoteproc.h>
-- 
2.39.2

