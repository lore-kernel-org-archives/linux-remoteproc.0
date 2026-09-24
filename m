Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E8207A20;
	Thu, 24 Sep 2026 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283633; cv=fail; b=G3tKRYRvZfrInTUZZ90M1BiaJAwXwpTx1r3Okvri4G4g1KjQt1PcdwlTh2OTBy0qfgDr7F1qy9SNW1JZp3aA6R4OtSHZ31zpWvvLXZMErsqpLJX+xXKJ9E/7Fd1NsWBh/aHpcuII30T87YGq+VbeFLurlApKZ0Tfcvb2Dk5ymOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283633; c=relaxed/simple;
	bh=aBVi2INyyBS5ImaY4IY0ONxuTBNEktc4yivRxfyop/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KoSb2qINDLOrU+q9RXKsCL5V7BmpNjwvbAll7SC6aL28mIEI2yXTmrSzoLfAdI/ioVSpGRTLhe3hobF2p6f5W44qJCm2SCL7jLx0j3Tq4I0wYr11lSTU4IOZ+Dtu/TPPep6dDCd1bUbg+pf5pgJNcSiCkzfVwfR1JDaeZhTIANk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c3wr1vr8; arc=fail smtp.client-ip=52.101.52.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c3wr1vr8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5g7B/WPTCMhIGN+fp9i3MU0FWCscwBl4ZFMpRmYZsgjL1AE5zHgpK+br36CkUDRZftgrKSKduI3G3VOWA2xUJceEzn/85MBjKiAqQdp1IJy1ncpCVU8ZWbWtIW0ibagmITRsExlM2srzQC1gCsJot6Cuk8noNzTu71YpcDEXnwNNLzsMZqohIzzC1OPywrkp61Hmp5Rz5KgVS/wcYlCUAPVxavsVf2fpmjt3U/dVzk3mBCuwGjlOThUTIjHTAJ/acOKblLQSqQwsDUzew//MvSK1vG921Wrs2S/oo+lPjOC6cQV1g3pmwc38UCLOniTNEi32AX/e1czhZIai2AZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWjfxy2zZgpydiVNlzZx++Tbzer7PdvDp0KvaNwy1vY=;
 b=WdbDJQjZQk7RWvndr0BWtunFD9CfdsNmxsi9p+kJQEquvLYX3Ndxw7jecDM4EmS2Puno9CyPZqSscrQ3S6Y+uJsRbi8pWyJXJydh9pLlmW5DXobmDUoPa3GBBaAzfhGB0C5t7POL2dfsjB52JGIGd/zOSC0oUF1POn78nQ5QVOmOKUEieDnV2TxnjPHyMsUUa12LFAIr97FDWDQ6LRYemAO5olLpDz2UV8yJQ9y9PQk+qkAnx4/3kUBB19jnbrpGa896J7fr0NFHH1nuPv+78YgTVrSaPZOcV1Y25NMse2gXbJ+rnWJBPzEid5uS84DDkqZ0ZEcnxdiMsEGWrmuAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWjfxy2zZgpydiVNlzZx++Tbzer7PdvDp0KvaNwy1vY=;
 b=c3wr1vr8acSw+YegEOExBZaPsqzFV7iaIqRHfsoPsP3YBo1qFvuCgJvn/S1QomZHkaSjzyRO93S+UKLRYXMeqfKcOlEdAdfIJyjEXXIiUs1Mf+IwgriDWEPvqxIeOA1iKpOFmgQf+R9VUNJMEVESjnYXbtST7sXnzCQ5nMq+6Uo=
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 21:00:25 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::4c) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Thu,
 24 Sep 2026 21:00:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 21:00:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 16:00:14 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 16:00:14 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <ohad@wizery.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: remoteproc_virtio: reset vdev before removing it
Date: Thu, 24 Sep 2026 13:59:02 -0700
Message-ID: <20260924205901.2505186-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|PH7PR12MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 604d1211-9892-45d2-4ea8-08df1a7edad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	FKiASTeVJzbI3zcJ6BGpOJ8lID8s1IdEJQMUJmxWgpHfoDHBpmeD7x6+7uPW+mvtPUaxBi5SFJbgACozoH7GZN4rSDE7AcdSvCfj0X+bjt5GzIVGhzUfu4+i2NjcBl9jbN+C4tDI1PU0lDrIXiYakELC/Y1ZlNT50rPNmVmKSGhG6mzBzKQwRNJJh44qMOvb3D7TvCI/gMx83ejxlxoMPhHVmDdCPq21dfyCA5ilWRxDJgTkY0A6qLsqB6eIC4CiWGpfcqXSd1fMP4hbAECTXgwVPbiMRxKMyHHvC2Jm2V5xxIsXJD4YFHZ58zUibzvq4G2KzJOeGnYs2Ct68jp8XuOEsL80f/0a2XupIr/rUaW8IpqdySofko/8+9i2awEiCyykQd0ir5by8ZFBLmUzpBVmvJTCcOBZp43gp0iIxxL0ABPXcL3Mpxh2yQ+qRTF7t2KFf7sZqPMSNgB3h8PMB/4ZFq2cuxm6M0tqPgeES9Iu59fV/qd79IswoEwDclVe8R/AL7v9N0eHSPxOME2wll0Yv7Y19TFVFgovgxhCVuLdf4yqO4zlmK7SsnOifhkROu6Mf/AvquKt7lNxoYi9wO1t+V2G1b4HDPnYNWlmvdFA9gbtkcFg7iLHaRQc2lGmeEfxTTg3q3eJlilC1RhkViCdufYM4q1KsgXKosYp4nYebFzytstKQ5Ti7jl5XGcqscg4CDwzt/vxY2rewwRUEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pjYKEhVuYGnQHhh5EuxxRdzp+mj/yZurQOfek/fJYwq7W+n5OU+p1JZDQdRq+JnchY3G+M2ObfbBwkNBR8eFp6HVeHzhkQ2DHJtBrc/vzSNCLendbaMjtOnoIeVaEK3GyZTGU57WG9Ff9N7XNRgBkTczPS+Poj8GtKNNUqdWsiS1/lJ+m8DDXOJFh2NOMVJI1VUpKKAniD7PLprPQC2OoTUniCyPJbkcJAgmeiSc75yB1hB/WBRGwE2IplXcCfN/kJt7qX2mGGDBkN4/oPeyP5hske2NWQNY3ts/JJ1l7OmF0TRop9AG3lTXx7jLHkiBS920EombD81PHdmvPdmd3pGPR4k3O20d5qPMQT4yH5MUt0e+2mOWBreyzD4bUP0Eq/JnQ62LgoOEB+ju7JwUE64vH8ogH+plKVVjRp/iJo8BFEj+52aoYhSYz9BZ4SZC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 21:00:24.9150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 604d1211-9892-45d2-4ea8-08df1a7edad6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758

The virtio device is removed when the remoteproc device is removed. The
driver should issue reset on the virtio device so the remote can do
corresponding cleanup.

Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..1cb0ee0ea656 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 
+	virtio_reset_device(vdev);
+
 	unregister_virtio_device(vdev);
 	return 0;
 }

base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
-- 
2.43.0

