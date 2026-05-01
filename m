Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E423ABBE;
	Fri,  1 May 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646248; cv=fail; b=gP3JXNhooS1OYEz2JrctySdsgq2jVsZAz2c0W/Ucz7gcnHWSA6gjpU/uIiMGYw6rUfUe0DPwS42qYzSErj17VORPuJ329D6GPFneV7AzRoC5eIe2NQ1dQQnhfuQle1qo5WhmMIevaKFCcXGN76Y3kd5cZORVWFF+fo4jjep1j40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646248; c=relaxed/simple;
	bh=xv7L6gZw7Ak+58x/Ob5x2qyj4c6uD136vpBkEi1UC3I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j0+jtnRx1wxzBgmRhRkcxseT1I+vbCsRe/EaPvV725oEHK5WqtfPXxZ0V1H6g/aEwAvi+lGEEZDHqlzG1NpJWzvL1KXoI9SHUQaQi65r5SYKHene598tzMoL23PhDC3AmAWHA+2DIh6N6Bft0PKk2QXqAcw0SCvVte8BoRMOKiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RXO5gFaj; arc=fail smtp.client-ip=40.107.208.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RXO5gFaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcairT8mYrt3usp959P+cR4SKljQgafFnAiOaVIUbKow0g5k1yeOrrvfKwXmFu/1V+QWqQWMy2VQyXKYh1s8qBC07bI+84wN8YOvASZouSAQoLc8zuZ6mTCzpmQuWYcY57BPNGKzumkT9xoenK69rujx+alSYWhsssrKE1Z59iD90u3MfniwoqIf8EUIKwqHsz1ddSpdfFAkM1+g/MVezomjRnipQBjPgNwpex5ZqtRoz+sx3bKeeS4RhvoUhNiNcMwPnWBcR76elyPifmls1S8h7BfK2M3RQHXtUsmSa5QcF74uOuOWGpdq9OloJPMgl/VwVwF0XuuotDN+pOIM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YMX8QoBlAii4ScInIphfevMfdmmxHjJm41L9KSRHpc=;
 b=yCagJr4b6lILRBbNTZSatdJvnPdM47LwhGx21KCAhcMYJbuubNqZTrgB+7s2DSAwmBIMZrTopZdk4mW1H7FvpV4y2C98hTgMLrE5n761cJ8wdSWS7U0Jrw87rtQlhfhh1tdsd3yW9Aps8vHSidd3i9ROu3cuysMpzrxnOnv0+DtMcroM1wHw27E9uujRKEXK/oFGTN45zzt4Twrm6oNhHxVA3TDH3aIDTn0MG6osCyquoZh8diCGc7yR+xb0Rt1r3o5ui3a6SamqListNE+XPy4Nz3JKQl9uV5Zm4DqUaTZDb8UBcarcXzlvHTEfrKDuuerQwFxQLrCaV0KP9jx5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YMX8QoBlAii4ScInIphfevMfdmmxHjJm41L9KSRHpc=;
 b=RXO5gFajOhS20WqIgrhBSqxw3UjmsM3M9lf+WSeKQI09sbJ+fCa+Bx4xxKL81vT6QxyHjLtWkBx/seAQBPc9XeU+AP6Yc/dMpzQojtqArieSRJ8Q/KxNcaMEVg1IFyBEmAuURf9TgU7XICSK9TZdO83JGIoGATvYbNR2cXcU/34=
Received: from PH8PR07CA0014.namprd07.prod.outlook.com (2603:10b6:510:2cd::25)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Fri, 1 May
 2026 14:37:22 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::a3) by PH8PR07CA0014.outlook.office365.com
 (2603:10b6:510:2cd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 14:37:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 14:37:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 09:37:20 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 09:37:19 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] remoteproc: xlnx: add auto-boot support
Date: Fri, 1 May 2026 07:37:05 -0700
Message-ID: <20260501143707.1591110-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc6ef6d-e2e8-42c9-b6ac-08dea78f279d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XnJzAALLyzk0lGucjDoqgpDnEZXXXahzrwKH2xcivsSFPQWhyiXU26tZgMJRtQet7dz9ypFhluPgSNYC+WJTb5agQFkXUmFqRv8n2Yv0R0a/m0pWAZ/hAa99Vw03cAwJXCwjti+OHc1jRo+HvCEDOsowDDhqrWo+YFkhLHifqegZK8QyG3FJs25N4r6FH4d7mG52IC/nirGAwLNechjaRVQ0fVS08W2o5mLkEAIFCu4uqRNz4wd1cMPyPSC0vuEcVpVkIZ8bJhFZZY88zv6oeyTiCx5iZger5+QKsz0poOon6JrJx24e7Vu+kjZEBtcW0ktSaWZ/keeP6y1++evR7QBJbdmP57olo7tML8DxRy3Gswxh7OOlFm9XD4E0g/PTZ1H3KyvO8B5vRaEf70oJpLvf46UeTbXSww1F6Sf7idZ7t98ZSdl+7i2rPN4jtIHhCv/FI868TmqqEQ1e2aq76qXrQVglkc9h/Y/iwRDOlsNaMvrqKr17W8ufr8a2DZx11eRwe2XF660qFABWNuf5t/wvJeVIdcNSIFKZyZVsp/DpVsWtYB0iQGZjeGwPuASZn+aKqA7EkBy7TkrPsylFLeD1XfAE1mTwNKC5urn1L6+79iGEBjXkmdDxLRYikm6rEUZP4CgFsIiNOwWrfVODM7eTPJ3aV3S7RsBYJn+ft3Qkg7TI3GUoxQfVxRsBlP0tUfUobd9hbEZd83rTbKYA/uSlyTy6MvFeIo5Q3Umgi04=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	scCssobxJ2BLycoq1DfXJC9JYWMydMLp6PtQc22Q3EBrDMRE5bdK2PwunYLLSUtPJV1i0aeIMKivy0hJYCJ3SmU2o+Hh3vQRQMHL74O5QZL1p9cY4e6bg5JYRW4IjHgjxi+WuSHoAB8iKpxL13A22ijYiH7XfEZ2l+1TwzQjtO2d53e1yh6FIC1NO50qm0Qx3lxfYFWoEPPBlh4an3wawzGqrah6aX7bywAY2pZnXdjSAlv6bNa2IZRxHU9dn9XEKxhXfgXgMXGDEMWrCxiW3QUbRHKXx6TvpCFZK/7zFqCCZgecjqi/QuTCRcZZkiVgYT20qkO4PxzhTv5iBP30Io9Hl6kpceiOKQ0hZVPJHjWUdzpwb90ELKEJDrU6FNMfBfNd00MGaUdTW4qPOWTW5xej90HNAUHg+OWn6lezQzYm4mdv9qR2qykkbmay1Odc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:37:21.9117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc6ef6d-e2e8-42c9-b6ac-08dea78f279d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651

The Cortex-R remote processors on AMD-Xilinx platforms can run
before linux boot. Add auto-boot property to notify linux that remote
processor is ready to be used, so linux can load fw and start it or
attach to the running processor.


Tanmay Shah (2):
  dt-bindings: remoteproc: xlnx: add firmware-name property
  remoteproc: xlnx: enable auto boot feature

 .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
 drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
 2 files changed, 38 insertions(+), 14 deletions(-)


base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd
-- 
2.34.1

