Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C873ECBD8;
	Tue, 14 Apr 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183369; cv=fail; b=DVUjg8X1sMjMX4c+Cs/OtpHXXFg58btG4PMWzRjRrU9wTqMtgYoT3ES8aaw+djlCkPqQTlYQ8pPzFzEehRkOPMAoN7fyDh0TBPV167zuIjvvVUpSZLvlMqMg2mqX2DW8y92FGxjdM3F91BVaSf4JbaFYWmMRZ6uZxUAapWbsKAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183369; c=relaxed/simple;
	bh=HqA8X8QVcIaMil7/XG7Fy+NcFBOvv/xHMeh4tW0bAks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tZZiLZStG2i4pqBHPkufMa6ENQfs4qPB8R7O9mKCklLQmBmis7Y0Kby3RYXtP3+uOsrZInaZo11SglrWLgkDjswJJOWGBy+QDuIDRNeEHZnl5FgS/ghmtw7SSaQijnCbQF5J2E8NWtXUpdoMnHNRc8E+1fa/8Awss9WNi37Qmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=15Ajp4Xj; arc=fail smtp.client-ip=52.101.193.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="15Ajp4Xj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCgFK5YEP4wu/Pa3og274+uu8SQ7TlyZejY02PUucMcTnSHgtVzxjAlLC/gQDIJlAs0zq+C5PL9bGUjHPt3zJYPZfQTPYsTiCAvQ8mt/+mnDjti09Rk0m1gtwD/yXoP6O9da8x96ljp5sVVX7GJmfdB/sdpSOtKaMJLpB12kXEuTXHFA2JcdqwT3BBssVS7yZF19JGxoTKelwFMIAwkSkmT1AyqFR7OE/xwXTDe0QBDQLxhu0X0mwIAdlX3jE81TiZ2ekrdz/9XDBkVflv3/hZAxLWEetnMK5LVEXIIssHjSW16KUYQVoX9x7S7kGKAVTq/A3f+Ezu0JukURbwSRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVhfZ7O3mHiydTU4g0yDN0spvqofIeTxaws9q/L/Al0=;
 b=qtrXlDriySV0MS8bDK5k5oEsR34of6RXcrBDc4yk0KynfLf1OToT/K7p+fXHlXrfGtD5fcdx3b8FmwCDH7gS05Ii4z84V1smmMCgJpp+MZRLI1jaV73DUaMfTGEI680OYt4KStXT+asLQATe3OIUzkys/qLo3ggumJ90nhphjXPBfDcsqOC4rXZae/4+5Fu9MJe8HbQhkfV4z35O5Rs/L6buQ4G86xp6TVbOmtfz5aoFo/AyFkmU4B2fj0EM6oQku5IGUIm+15KJO1aAAgngF9aVAz6LBX/6lZW3mibYnY5Cmasr4RhqurfyOtzJstwgO69am1F78EWPttCT6TA1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVhfZ7O3mHiydTU4g0yDN0spvqofIeTxaws9q/L/Al0=;
 b=15Ajp4XjBRvU9OroSJBqgLfzt+d7IVeysoWTiI0F5gMIyAQ3Jnfz9GWqllHnii9sploPGDBFpFpq0WQicfiujBW/n4e6Npac0JuQltNv/sz2CqVCKJkejwOSUei3dTIM9vCMi/synvgs+Yx5s2yszaLAOPIuFhUngszi7+HNsU4=
Received: from BLAPR03CA0077.namprd03.prod.outlook.com (2603:10b6:208:329::22)
 by IA1PR12MB9499.namprd12.prod.outlook.com (2603:10b6:208:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Tue, 14 Apr
 2026 16:16:03 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::a8) by BLAPR03CA0077.outlook.office365.com
 (2603:10b6:208:329::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 16:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 16:16:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Apr
 2026 11:15:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Apr
 2026 11:15:59 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Apr 2026 11:15:58 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>,
	<tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH 0/2] Add a MicroBlaze remoteproc driver and binding
Date: Tue, 14 Apr 2026 09:15:56 -0700
Message-ID: <20260414161558.2579920-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|IA1PR12MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c59071-7513-42f7-5fd3-08de9a411fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B+d6eZSpVMG33DD9qQk8Tr8DOa64VhLMhznSFNbfPUUZBh6YlthTmp14Uu6qHMnFpeyCgHyAZM7769VvbQCQDF9B2sDo0ZthbCvfjKDIgUwcu9x0pVP+1D+ICjjEPru5Z1WpqwPaYu7u8zxtlgAj95juvGCewdKTd+hGV5L5gYiyTZyi3UhyEyFSvOhVrCBMZtk11X61cVBMN3mIBaSC0Ob+p9EcQdbJBP/uf+pt/uWnKko1jrI09CDoswITx2uL7pL2MXFCvrEWBE0ga83icwD2lwvy2RBmp9ev3/eCbsNagiAHyE2hTnp1W1eZbOqxpXq7ZFe1kQQCF3BIbwojyveQpV7IEs7JNp0dTuLbq8OXJk1KCo//sLv1E0Fbsm0xZj9KeZ7OJGOUvRJEbxKEoD16pU5cxbRwXBpMnUOgP8UXzL5xRqcMECN8/1mFdvefwPd31CBam9BCJBQ1yOVXa1UzxiqF3Sb++c7SvJgvxetcnqF4ZBGvA6RQsMmbd1xycsjLb8tu4O1qXZMeXyBRP4S7dbwtA7ogfZ8e2VGL/NXf5mbqMjLthBeeCRIquAQseXp4CF346EA4q2WQa4BfPFkale6tSWsE2e9qOeiaduS/61qSHeDDCruNyxdmzQ2ZkCh1ruBwOolxoedOO8YkfOC7yTxryX0XDE51DncQrzVhGO9lEURWDwMF0MlUHC1fc/UtMXuuyE/PKpqW74zO5awyqNzEx+fKZb5iplisVfZFSo0LvjxSqp7Ipb/I3ocyXiACOh5a6Tw38r63/CZJvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6DQLhcxbxDb/1piFqAXWWVc2qxB3xqpfQ1qPfmLCnMuDPxN8aDsVhgBCt5Bh2IRqccch8U9oQZyomhTAjJCEEjI3JcIgW/+bL559ZudXP8A3Ps5TjDOUiqvwwcemXo4XgDWT8pkjVqJ+IEFRijrZUqXb46fXO4sH2W7LV2JV2qR31rXqh6edZH2g0GZMp5uOaBpXn5bMDPpzS/LEZXWiCRq8y8vqLPoVFECR8RuCKG2MXW5riyFJgrns5X5Gn4EBSt35u/VHojmM2cy9L/+OpM/I8ZBjcGUxZ+oCYBQShgnk19Y5owMe5ge1EMXghTvx+mb216BYhuGsP9+JMMe0OITtiLurO4WgcCqUPfeZrpBaw72S+WunUueQCTCyfCEroqZjsthK4BUgXQnW35I3A8wcLPXxsZVdL8xfNhEg9qn9h1Rzx6XtFnGAV22OPaq6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 16:16:03.1211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c59071-7513-42f7-5fd3-08de9a411fe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9499

This series adds initial remoteproc support for AMD MicroBlaze soft
processors.

The binding models the MicroBlaze remote processor as a child node whose
reg property describes the executable firmware memory window in the
MicroBlaze-local address space. The parent bus ranges property provides
the standard devicetree address translation to the Linux-visible system
physical address.

The driver uses that translated memory window as the executable
remoteproc carveout and coredump segment, holds the MicroBlaze in reset
through an active-low GPIO until firmware loading completes, and allows
the firmware image to be selected with the optional firmware-name
property. Firmware images without a resource table are also accepted.

This initial series focuses on basic load/start/stop support for a
single executable memory window. It does not add any transport or
mailbox integration.

Ben Levinsky (2):
  dt-bindings: remoteproc: add AMD MicroBlaze binding
  remoteproc: add AMD MicroBlaze driver

 .../bindings/remoteproc/amd,microblaze.yaml   |  67 ++++++
 MAINTAINERS                                   |   7 +
 drivers/remoteproc/Kconfig                    |  15 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/amd_microblaze_rproc.c     | 202 ++++++++++++++++++
 5 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml
 create mode 100644 drivers/remoteproc/amd_microblaze_rproc.c

-- 
2.34.1
