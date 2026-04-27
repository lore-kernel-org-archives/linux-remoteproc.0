Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AE397692;
	Mon, 27 Apr 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777307242; cv=fail; b=OWDK6j2JWWJ/JXSdQ9U1HOWneytnbu7zsi8CIIMJ9YajHTqsYkjxAM8qRZmbSIf9epsAonQ2kX9DGHpMIB5Jm4qWCPy+FR+c7pTgqm2wkWzNe1wR4wShG6UwFBUN8A1CR6ZB9aLRbcVcqUrhkt2FX/KmTkYF2RVC+08ZpedcCCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777307242; c=relaxed/simple;
	bh=4Rp/GUNBIpkaz8uPLs13kH9xHbTdRcA5mXowlxCKvgU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EuTPeoVx+YK0WdYAlRYHrg3hkerMzmKA1zf/MZRrzuoLeNL3m0oSklQw8rQUOkljiENWyj/hYqSo/a0MJo8OKX8V5iWnENyzw2owWespDp8XVaPqsgig2YEQ45P/gU+wjUwxbgo5uc/NX//SHsL6SS1g78NGdcPcOJeXpP6WPdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uXQccjdy; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uXQccjdy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVIY+6Xi7B6xkR/JSX4G5bWTDWrlgi19cYgUUS0SyIfIrCV/FOi0qMqYnU1VMVuPOQ0Fv+F8przUp3aJDKNA4bRxWxdQ2ILAr+ZT5y9+RqQoZ90TqciqH8BUCmPY28PMBUUY2mxlHVt1w7v/yHytL+bKeTkX+dg4sdIUc75UNZjiAR2lsYJjR/Tsegl2oC0tp63Q5wAoPBBDvra1QM9jdJYgvEjmAPBAu/ulFmFBC90uMP5wZtDg1O5oKrggg5x7zokj2k/Vc/mTmNOCbDIEt9Z2IPf1M+92MftjF62mKZ232MSX/e2ISKLhU+nr5Ky0kxt3jQ+TLd6aatssEqfNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBG/k9WdBkNqbdR/uN8Y5n9CBDulUnEPG6xAU2gWYvk=;
 b=Hdu+7SYpM6MrP7/FZXX9CY4TQcTUndWuNphyb7U1tHWivp9/C/dBrVojJ5DLPT5gdNLxD8BfBOYyKDuBD+uIX/mWNXn3167ZFG9TFUrs5fZgJ7l8b1HBGGFs4Hysc1KexobPHq2sm0g5enYOhPpKS4fd0xW6qTf6Fy5bLmQnUijZOELbywIHyox3JDryLHqKprbryxQw4XQCvS4a8kCtoCB8I6gdKw9E/URXjA+4X9M7mDaQjZhRfQ8PgNbCBO7+NkbGlTZsGOqkGzrksqeFMLWfz2pXVdHWD1Y9HTC7rR3loeMhsV+BgqVrx7jbulCdN3eb/nsdTl3klJxiWzvqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBG/k9WdBkNqbdR/uN8Y5n9CBDulUnEPG6xAU2gWYvk=;
 b=uXQccjdyC6yIcFzsRGMjHN6fYfHH5GEU/6S5u8QNyHSeDytdI4FpOl/ThG5Hf16zzdqP1rZN5m14StOt3GRv5wknPutXYytkMQLMkDEhuj5Bd2sV9yOYMG78zCkObXIXKQOce+8IJ8IU6k06h5OC99ppUlkhTIgaN+4482FXqIE=
Received: from BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 16:27:09 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::8e) by BL0PR05CA0013.outlook.office365.com
 (2603:10b6:208:91::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 16:27:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 11:27:09 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 11:27:08 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 11:27:08 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v2 0/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Mon, 27 Apr 2026 09:27:01 -0700
Message-ID: <20260427162703.1644103-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 68faea16-fe4c-4150-9f72-08dea479d489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MskiHMCnrH6CydMR1Fj5/zHEyIbbycRwmHg/6tPvVDph8hf+OHNCjVvgJdrNnp1uytABnmUqqKCpO7sKdBl2iEKz9Sn5+rSM9BvqurXplPC+B/SK1ZZCcRYZ7XAKkSgcqjBDArn9D8IML6KsBxoTYPxz9VOZqA0qxJCN0bLOs89mnfkLKaW9GKZlJnmPoqvKvgIgKoDf/ehyUxpbmzToC+/UuNxi4qsPd52cxV/CqnSuJsQWW65XGinhh4Fr4b19I7JIQFttsic2wcIyRb8ADiDbikmdYHZFPe1to/qzz389gG+mzy/lVqFcRwFIA9SRTmg+I8EqrVUpA0NLbnJ6/o3lHnFG1mxyYnxunXAl7oljO+u7sVl3rDFyxMbzIMUa9mSy7bKk8TY55IQejs5jtSIzAITBgXIUeJxZ9lFfPa8EU/IPSFgQqWCUkmZxHMWbBiDU7yWD5CNQRr8nXjpDvfL9IsRcBwVQDDTzVkXIs4ooSw+K8pUA6wzgXrkVqJ68y0Biqor/jZo6paWq1OHcLmWit8I1a7fKzNzp2XgjrXXOKqMiSqKVYxdQp2xikhWvR402Uk1tzdjnmsdvOwo9lIUz+ZBkdRfSLMKe1F40y30xv8X/kiaL5elYfMMSXDjMCwF72micJge1XH6wbfGQ/WyaNhHvC1AwRHNIhg2nvugyyFI1mfoeHJVDKbjJ5qRdTEQDlqdNQDVvCvIdigbVBop6dxh9vcoByvK0D/PeNIoxITAMtVtLxDArpTaz19+FXVUUG3VoaA40O+JxOLBBSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2p+f8Gmxkn4c7VHtRyCyQaOIBtA5o8WrgJLdhMHEOX9sKJU4LCu/JRdERr5ZtpxWsQoqT7bBuPL11ijT+SLq08w37PLNC3CqYKINNOw2usoOHlX3xq116AoRk9LbMY9YSt0kA3SM7uBlQVSuJV/Aa70+QC+hgQu7yHDPWdIw+JsEvqj56yEhTSr0p1fHgbgkLuL5rqG3KNo/e4fsMdW4UKXZmI8hSDZpQtWcSd3e8gZM3WSzOt/HyY3rc3OOIa+GRzxi7892KTViq3EpvzWB9fDqI5gF5TB6/1CV8Q9HkTb/K8f7qlS4/nGwhoiau0zC78mEbml78DYCotFH2DfOmtVGys2KZFPQcZAm+Tp6NvJybsryijnbSBmj4AGEBsWF9KtjOGA6RCrGgK0bH5LjpBxEpE1XVndAR6gsIeiA6FNsro54rExA2QNMgQjgnD/q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:27:09.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68faea16-fe4c-4150-9f72-08dea479d489
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567

Add a BRAM-based remoteproc driver and corresponding binding
for AMD soft processors located in programmable logic.

v2:
  This version pivots the series away from a MicroBlaze-specific
  binding and driver shape and instead models a BRAM-based soft-core
  processor subsystem more generally.

  This follows the upstream feedback that amd,microblaze was too tied
  to the processor architecture while also being too generic as a DT
  compatible for the hardware interface being described.

  Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc

  - Renamed the binding away from amd,microblaze and reframed it
    around a BRAM-based soft-core processor subsystem.
  - Dropped the redundant trailing "binding" wording from the patch
    subject.
  - Rewrote the binding text to describe the hardware rather than the
    Linux remoteproc framework.
  - Reworked the example to address the original dt_binding_check
    complaints about the root node and simple-pm-bus example shape.
  - Added a clocks property for the soft-core subsystem.

  Patch 2, remoteproc: add AMD BRAM-based remote processor driver

  - Renamed the driver away from the MicroBlaze-specific name to match
    the BRAM-based binding.
  - Added clock handling for the soft-core subsystem and the matching
    COMMON_CLK dependency in Kconfig.
  - Cleaned up the reset comments and removed the success dev_dbg()
    message called out in review.

Ben Levinsky (2):
  dt-bindings: remoteproc: document AMD BRAM-based rproc
  remoteproc: add AMD BRAM-based remote processor driver

 .../bindings/remoteproc/amd,bram-rproc.yaml   |  98 +++++++
 MAINTAINERS                                   |   7 +
 drivers/remoteproc/Kconfig                    |  14 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/amd_bram_rproc.c           | 243 ++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

-- 
2.34.1
