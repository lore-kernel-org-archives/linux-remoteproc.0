Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E047D47D;
	Fri, 14 Aug 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718747; cv=fail; b=WAO0FNexhzvP4zPL/BK0ut7Nor5nUrBmAK7fOKVzaasdyOE6G6QeqDhRUXxv1+V/Ycb6v3Wdk8dWVObFA3URzFZ8mCN2KK+b1HXdmeHuTj5yNfCUZFuxm/rXUnS1NYfY9qF0/y5WoW7Hhp2fotLiCPJz80JQWUeyC9Je592CoHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718747; c=relaxed/simple;
	bh=jN7M7YXAQVcnZh7dBnjGa8N4VyJx8k8w774qZx9sG7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pbb0FZSTNqRgg/8L8bdgV+MUJ638Rt3WKPmya8ii67k//sN4eUDFC3JlHtBcG6E2ooQWs0N4M4VZJ6lQNg4TMh4pfAvhiDwLmeBzVrwwPLT4STnOAE6SVTUfcxFhN2angZxNUb8UW/56AWSqpuLLFn703i1f11LaIaI7sDRIQJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZoS0CiX3; arc=fail smtp.client-ip=40.107.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZoS0CiX3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMu/IgH/7am0lQg8Mb+nf5N3M8d0wLvtjnO1zFfnRAK2gUEMOlDnVpr8O2BoSY1OQIChcTFFlK883jlZqwpVT3MgV8Lzpr1gn7DAQvD9sH+qVANxpzVjsiDeWyCHETuDh3pSciKhRChbhVporTzva0Jyw31qdpfikmMlsfPfuRfflmq3lCO+H4o9E5hYMioSiB6z+OlYnC3FNPCN/97Fs6zCBz/zhGs2il+hHvKBzz9ru+xSk0fE1DoAGn9RFvyNZIxtUfcF4nfVr1yhptWQcEdZ3hXcRXFkM6cEiNgl/unH2YSVlRFuxn8HoqQqagobOxzdBMd+T/b1jaIjOEDTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skFpr9cZTy/amuhbo48zxozsRP0Cs5Ao0adxqGjYzsY=;
 b=l5NCGjAsX7wxZA/ul2m1ms3EjPvWUjOWO/qT1sraIZwjUDYQxHi5toILSqVhg2F3t81yq6aSmLhNiBSUE2quUAVJge4GK69j04CKS7HTWd/dtO1E9uoaiBg/RsgdBbLiEi68SsEj/7ZEJ3Ah/2WkiBmxz9HfBbwjuYA+MZj5PTFD61JN2gR+5Akm9YcNtHWQEAhqn1m40OVpDcdh2peKUZVtkPjTG6/jnPX/AFZi+MPLHFSNhvIaFX63gHE9P7v0tnjNOJLWVN5FpaHzGUW64hKNGgHf5Dl2qp8bWZc6aJ4Bj2YqdrP22o40HnevAfCg7zNmVHBg/2YzxtwtzBurUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skFpr9cZTy/amuhbo48zxozsRP0Cs5Ao0adxqGjYzsY=;
 b=ZoS0CiX3Qyw6CNHhl69uPaLEOLtF1/rKOvRSF10aHHvXn2TXYnRqxj+BI2ulCbkMl+Zb6xoC5iUh+BO61thCzF1RulTFaWycuhDEtSimFia++McG77IhJUfwmpYHV9XW/fqlNWwDPkp2PPJ2slsHoxemwALQeiEHKu2NRGhsKYI=
Received: from PH7PR10CA0020.namprd10.prod.outlook.com (2603:10b6:510:23d::18)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:45:43 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::99) by PH7PR10CA0020.outlook.office365.com
 (2603:10b6:510:23d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 14:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 14:45:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:42 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 09:45:41 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v7 4/5] docs: rpmsg: add virtio config space details
Date: Fri, 14 Aug 2026 07:45:23 -0700
Message-ID: <20260814144523.744382-6-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814144523.744382-2-tanmay.shah@amd.com>
References: <20260814144523.744382-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|CH8PR12MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: b02edd3e-1b4e-4e39-0add-08defa12b7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Rwb7CyOpKGzLab6mcHw7hzdhA0c7kJrhSc4BJS+50aTCcFDBhqCr4uby+ZIaFPypa7AQaSPud3ABVZzjyH/4PAaogIII5wn/5+FNewvue1NuNHGLDRVFwdy6Z39GjARRktM+TG30v+VYKZwJUab0hw+Dwrs5+Koq/pYAJRtE03uuxzR+lDSJPIuw8P3nvlopqemKQv8wP/yrGdX7htdUeYonIyz53mPnboCqkkwyNXjw2rzfkkP7o+VaUIf0pModGJThmRt+HrQY2pNthVUrz8DghMNfQGjQ26cGcZui6H90yW557JJT4mFiyfma+rbzjKAlgc7lI/JWTg3G7gwQPx3FPiKYl4AiNsmHWPET9hhuObT+ZYwW2ZiVl1bnmBnCIIepXB+GSzX7+TiKU9jvr2VYZb9MroISAdx0stB7rh0jFYx3goQyyvczFWCOMHx/YC8kvZuaujBCqzooWvNOnBfpVjo6qZvdcD0D0rQBxp4e6Wu8HBFO3eLTVx/l7M/txQjxkyhXVfKunHlQ4KCAUlWkC0FDew4dF6wyv2RPt1dW+iB2UaUIzADSIrBDC3G15DLKVqMJ9dBDC4C6JU8UtlgDAQuy8ur2ojuJ/IjFs9Y3Rur5HDzDdWlcYoAxaEohFdKec4iQRW3sFZCBCB/qD5RR7ghFwD6dU4w0ZQGAixf5v6Lnmr61AnpCjHwA/2AHIvDklXRCIG8AAAjCJPMHDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6G0zIYcz4LCHM+5S9YwjZt1ZYAT4nG8w3c4OrTHWDPLCqK/4SSRoBT84Ot9xnc/wveKZ2mSit6TaYXz23PzwuX2iPdbCVXMWImCITFE6+csuKTvpuVfuD9/VpazQgaQkoXDhWA/XFdbkJi1UeJ+uTmWWvjztEWJLPZ0CJvcz0GFby39h0OdILHk+Z2nl3zRUddKc8iDgBsC8D26s+xUdj4O5UVcJecVNnZqpYhjpt9V9HznX2SrXcc16gYi0mOxelEULnvCjndnwWRK4pCiAVGtrp7kABmOcDww5h/pp0j8xtezY9f1nSLUWWjDwnDLkEgJ4Zj+kpGzxO856V0e27adbhEUlqvbIOy5aybZWJR7PncifQpg0DpaSklkiqgQ0DPHNcT2p124wGOS7wkbWUNgnEujV0r2qRYoTjSKW3aaZJZYEFrxYCevfEPV7FwQC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:45:42.9383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02edd3e-1b4e-4e39-0add-08defa12b7a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9816

The virtio config space can provide single rpmsg buffer size in each
direction. Document details of the configurable buffer size via virtio
config space.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v6:
  - rpmsg.rst: modify alignment related documentation

Changes in v5:
  - fix documentation of buffer alignment

 Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 63612b7ee120..cabaf3d11ae7 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -299,3 +299,20 @@ by the bus, and can then start sending messages to the remote service.
 
 The plan is also to add static creation of rpmsg channels via the virtio
 config space, but it's not implemented yet.
+
+Configurable buffer sizes
+=========================
+
+By default each rpmsg buffer is 512 bytes, and the same size is used for both
+the receive and transmit directions. Remote processors that need a different
+size (for example a larger MTU, or different RX and TX sizes) can advertise it
+through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
+feature bit.
+
+When this feature is negotiated, the driver reads struct virtio_rpmsg_config
+from the config space. This structure provides the size of a single buffer for
+each direction (TX and RX). The device should advertise TX/RX buffer sizes
+that already satisfy its own alignment constraints.
+
+If the feature is not negotiated, the default 512-byte buffers are used for
+both directions.
-- 
2.43.0

