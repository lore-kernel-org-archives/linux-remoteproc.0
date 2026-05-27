Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42E8F4A;
	Wed, 27 May 2026 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858990; cv=fail; b=ZPRvUugyegQKyVSRagzW3prlgvTfrjm40BW5z+9Mx64z+7KiCAFG4on5Tlj1kfrlyR4cLzqJd7mJeoqkaFNYu9AJ0IA08VUWlbd6jI5l2aJMKBGNciyx2kEwYu5niPgTrqrPA5C57AIM/BZTIsoj0LjoRdea0QwW8gcoY9zSNeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858990; c=relaxed/simple;
	bh=WFYrE7xVXF/Uo28Hp1fJvkYbbWpy/RfaXClQvIqPXeA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TzgRZT1qheqYOYX+5/ikT3QJTpvfRHWnICI4KjW43gDmMz/OAYd7SR3ieqh3sZb0oVCpUuF4nHlBhKfDusumDHZDOqm7cYG1qS88Agxvc3PSFipGuAYNQMFQc/UgvjNAtGEkbkWu8Jh1YNttMpZO2ozIBZ4XBmsGia013aWLgas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ElF+uIh2; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ElF+uIh2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUY9SDs+we36AvxEjYakIhH8tUbA/vFG3MA5Jf+MBiZJwZ5gnYDTROGTHAQPXn4HEXOnCWvDx5Ip5UCMTgYFKh1rLT09uplRjA1FT9owAuqB9DNhe9H6nbIei1DhetKiX3JWP8NpsY06+8ddyUXtVNCj+03Ne05COL4HfPrD53jVzFU41M0rwtpHHeM24yQxVyA+UEaTtTKYaGV/1vPFuxWt0YoEEt9et380TiUrq2hmHq4l/KmHo/5ihj+u12x7RamTap9f3AdBoonIH7HDmt7+gmDFVd3xDx96tT4NPu+gJcvcs+Nmi+H1t1s/W9lSpuRdlLJswGcXrmRd3Awlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+kIqASLGw26fXL+jraOSl8GfF/u/55D+yJw4YU+/Bo=;
 b=YawOzBatGA8See4jJVCXMf65Gq9qc9mg2d+FpN6diZKDCU4tXL33vEH7YEPn9XZWpNQ25Wauy1nbU/Syqqvs6WitwyjFMw5rQwITSafI78GvlHMwHHTbRMOGIvkPT4g/FyibNnpN0qPouMem5QVYhicZzdCEKecDkv4TrXJ+zFceVR2cBtLlK0tqW2n8QbG14Yk8yyafO9BIoTMLzrJwUoEcM8kgUyiJQXvvfCwTii9XHC2AtDcMvcb1tHs1+EloI+Y4KL/f1QNkdouYeScVckb58ou4Dq6b70lxyfPhYoW6/Nzd/hQyYtGG/6erSp82KjHLC5fX035j1k9BmgLESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+kIqASLGw26fXL+jraOSl8GfF/u/55D+yJw4YU+/Bo=;
 b=ElF+uIh2qUeFRzUizR2BDtDoyOrNTsDzw7/KTNSOgj4tpuLHgyIQxkddPSD7J/tBQhNkct7XGUUCYcDvaq4b5rRqf7cFqti6kilP7vxnM52P10J/p+4vs0i1PyWr79ZxfTd6jDUZLiDHAo7HnESi25UZolaESCsbHxb+U9xckKU=
Received: from SJ0PR13CA0054.namprd13.prod.outlook.com (2603:10b6:a03:2c2::29)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:16:25 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::43) by SJ0PR13CA0054.outlook.office365.com
 (2603:10b6:a03:2c2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:16:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 00:16:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 May
 2026 00:16:23 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 00:16:23 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] remoteproc: xlnx: add auto-boot support
Date: Tue, 26 May 2026 22:16:09 -0700
Message-ID: <20260527051611.194844-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 968b9e0b-0f7f-46ae-4425-08debbaf1924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vCFhv4imE1EGhGA5AiiaCWJhTNFSsBeJlGsDfRMNRRkhWdA77fiLiiLDR5j8RF6Wbwny1p6+JQuweSrXTpaHR1ao6eujbGRflKPX6kPjig/ZR+Yp4/A1pqOpb42HjvePvFEgURcoXcJuIeBszPqVtjJU+9smI9gvGXFPGI0tGdD5Q8blqBfzM5tK+vjiryL/cH+VWdW7MMdNfjPdzcTAr8hEH1XBZGg1DVwghC5pdAiyrW0a+OWk7dynuBcKwy9QRpk8HFG7j06oMz/xadr5n+AkxAXgNILsyq8jWeXkotmLNDvSy5+D9D33rddoLMP/2pFklABUIglNKNEmuBJiUNnSbs5JnB2zn9TAKIXtUCctwaugYV5U2MRpSHz7ULqMPQOGO4iQgn0q1Jn93KNgeLKzVqzcqd19/QW7gii13se91444pmBdHyS6eCn7KmWs3BzbkhSTcGRpXUrzYseb4nctLqnLNHWsdAWkku3lgNonbPWOq13xf9aF+EiLeP6P2sGbvkZvtMSoLlQvFkayuTxtG0RgAnBsHg1uM/Cs9AcO5ccBzMs76xJGQrXHwu/zS30EOlYjBp4C4CjNFNYuHv2j95JNqdQ47zmXvVdLqGbPvA6YGkAM39RNGCWFRwMp7fG8soPBpqPbBUJcym27A7WUfewTxrHLCkViwIBrCY3pPGQhCS8S6uENbdW6T9rF0JuearjvGLvGcSMOPahqsIx/3iBKvurgedSVkJvlXXM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CYIjN/yrcbo+3/1o4Qhr/IyfuwtSiPOMRLG2uExsXJjApiT2wHXnZj2jPoZH5lo5WdXlsAWr8XOxHkq//4K0VES5TtD3Mtsq61UJRFcfP+86fVQghXVfhYHMIk2t0mo3zCN0P3qfO9XBjhj9NgNgx1t5Hf2ERrafUCXGUcTAg/l+77YNZo18dyFd5KFq3oxrpMJhFrCXqVZHkkYiGLmQyuQn+aY7NVATUoTmO5DuCSOKTbwxAv4WwetQ83C8/RqT5/bL6sZ7kizl/dH68Jmw5eFbeOaXlzf5ZnqoFHes2U8bfBTgPCKTxDvbw6abThGJ1XMPUz7yvUpKppNwhoHPGgC52B7Swf/747MJZcMvYt6ubrNx4LwRLzQhPc7Hc4uGO81WGBXUB70r21zoj1ziJUsu9fV5dM7U6sn1R1Outd5UsmtXJGnYQQKhIwtgu7Er
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:16:24.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 968b9e0b-0f7f-46ae-4425-08debbaf1924
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311

The Linux kernel remoteproc framework provides auto boot feature. When
enabled, the remote processor framework attempts to start the remote
processor based on the firmware-name provided in the device-tree or
attach to the remote processor if bootloader has already started the
remote processor. Enable this auto boot feature for all AMD-xilinx
platforms.

Changes in v3:
  - add more descriptive commit message in the patch 2/2.

Changes in v2:
  - remove the auto-boot property from bindings patch (1/2)
  - rebase on latest remoteproc for-next branch
  - refactor the driver patch (2/2) and detect the auto-boot runtime


Tanmay Shah (2):
  dt-bindings: remoteproc: xlnx: add firmware-name property
  remoteproc: xlnx: enable auto boot feature

 .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
 drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
 2 files changed, 38 insertions(+), 14 deletions(-)


base-commit: 90de217305800ff32df4c0308e240925c8deb385
-- 
2.34.1

