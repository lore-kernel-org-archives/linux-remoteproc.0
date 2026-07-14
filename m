Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727B2357CF8;
	Tue, 14 Jul 2026 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060693; cv=fail; b=DfcQIQ3QjGhlGTrRprzUg7Pw3fora3A1vkNZnNBHbtPrkdFv84Ggi6WXO2bpffC9lQpMURDJGnKS42euCwqzSk5T/BnerJXyDYuax5RfVVzDNXWWGr42N2Zt66a1uqJvslswlyQUbvwAQNFKwg1MH/GHfTsNicYgQ67pyzPt0JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060693; c=relaxed/simple;
	bh=tR5Y9yDVHL34Jzv3ZJzz8dolb34OyU2p0c2qY/Q1Vlw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QK5HGIffAFNGhS5rE9R7vdNq0Jj5d+eB0DK95EWKKK1EHiGfbOUgpDwAXtCul3lMbnD/O++OvcaFaLRlDVSz4RSIybMml+sLebXB6kimDhG4QsEE9hwpJHykXWweH3GkMviq2eHfNQR5Zl/gFS4unb/hd+LIDUxzGrwVovITOI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JWlKQnL5; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JWlKQnL5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvphX/c6ZcUj0m4ZUQ6FhFcLEly8xobgfggEQvIT7Uvuyolp4Y0Ui7tLDvXQQ6+B0S8EI1P7tqkKCFW1FSOK+DrUvWv8WX+Bm6Q1OZZATrbV/ep1pdNkesM5NivbJ+E/HcrCI1so+Xjv/c4+tZEwOdsGUc5eoSDg9HEaxfMLJy0TAj/hGDc39r7rvqnb1XevOGqig0e6ObhR3VB7rERnBtfU7C1K89EI5MaCVtb7mTXXmxXNmDzYExGE1t3jQNi1BGPOg+aOiAk/mBDtqL99RSzUxsroYpVtdTbcsyq3Fd1JKi/rzBjY4MemHqJhbFs8/hzBUBttOI4z778ROUTGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIN1+waErVoCIrF0Mid1XOjtO1YPvqvcFewIDoc91LY=;
 b=jXyptabXjDOyTN1bOsNfMwGKpdA6gFSpR0nYobtw1fv/6k0Z0DWEBEIUp3aIAcH+91OAaBerZfr+2miy4sJfwxzv0xDhXpf7fxvKyC2uLqLFBnFcRIlG3O7OyVlqK6ulLZiV0tOBK/Sf7iyGkKpSbiUzLno2jdx8SwI6Ctip5xAVndZk9If8Ugsxwy3Y/cbBx0YoRPZHn2iOENXosWkKSz7wn1/6oRtq5mqSrBAU75FbQDwRUKzGLcqvAGiBkE5muluXDoZl1tUHKZiEUpau9CM+lzhbOf2odRqB8s0VnjUGM/dCNJBZPCiGjEQ/LuFKOOU2+WUOdpuLhwGmtspMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIN1+waErVoCIrF0Mid1XOjtO1YPvqvcFewIDoc91LY=;
 b=JWlKQnL5TEKlRKMkjJruxRK0b/4O5HYIskvyb6/6bmtFMe5AzrPZnyEF3Y9iFtfq48EkitSeb0j/0PTsyg8UwNwJ2I+4auq17UbepM9hQyaxvyheT+iXTLJBpKm5NxHhy5iNe0obHoSj8Mm0TH5zHigA11aBHC43rD4I9jX68a4=
Received: from MN2PR16CA0040.namprd16.prod.outlook.com (2603:10b6:208:234::9)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:24:43 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::58) by MN2PR16CA0040.outlook.office365.com
 (2603:10b6:208:234::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 20:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:24:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 15:24:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 15:24:42 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 15:24:42 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, "Michal
 Simek" <michal.simek@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v6 0/2] remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver
Date: Tue, 14 Jul 2026 13:24:39 -0700
Message-ID: <20260714202441.554065-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 447e86c5-3b53-4107-c1bb-08dee1e5f09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|13003099007|6133799003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FERGgxwF33Q6zUYYPDfdDofQibq1f1h3jKGSIx8l76lYnxIIZ+zTwYzqe5h51nZKdpsAF6L96X+oFlqQun+5U/oOSzh2MFonhvu1UxDIosbWLFaTIJNFiYUvR6mbCRj1t9/snVtOPImQGa/ub2vMXOrA98+oolg2RS/U19ArJNsJV1YTjjjpo+bYVTSfGTLF3TBm977NcZ7p4T3olcXbCYzn6S4ageKNrntVo4a99bBsjxlFpCsQXM0MgZQN/F69cMjmu9wy30NRSMXQXrKipfj+i8bnGtrqG7WiWmgcz4sRZ7DK59zUVuuEmCNxLroFZby9cmy8dnwHB5z0wmcYwbFhnJjrWoqWI9FMldob2aXrT0Qv4abzPLAqMyiSmh8nTL7UJMdYyaqLedQtVVX6mpM4H5Zkr2ilyIkd15PI9YuGYK6v0jOaTD92zBMpelUApwaaxs24nUK3ZHuYl1/IS9BQrsy2rXFWBJ+L4C5EYNmvTsI9588FWoJ5wowS2zNlTeefICMW399rvKXZ1b0ag6/Nk6RNRxboGIqDRWXQV5xCB21rKoDtcL2GhPXFGLx2pB7df5aE7lcqjRTI5Taow7ZGy8UKoAILrFk2bAuJDnd3tIEN7aWTxZzkk+VgGsfV5ymXbGhbErlEi5HY+6+gWTm/MorSNJ8S7GR5877L2u/Pb+rhk5N3lHTvCgbVW/paFEbYnoAdP0k3SKUh8q8OBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(13003099007)(6133799003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gtn8qLpy2dzXFwFJk2LYq7fWRz0lQz0EDgalGsigDhK/GQtdKxNikMww0QVn5dU65pZquEXR4MEZJ26oexV2Wb0N+OxNgwe0iL8Jvu8iiqd6KpTVubyhx0BCJF0VQiYUDkxiSwpnA8qsARuWuTyUtJafrDiC7pIouhBiYePl7B+UikPWlrh8bfmlR903LLi6Odxct00fDNI3fuJpxy7eG0LzLdHwKiZ8Pufb7Eus2ktgOOOD0vBU+zjmFuxBegl9ohYqvdUX/Qmr+ss4vDliyVQ3hATh+vCOL5b8amqfGjGIEqPNzYAv2TDXvLl+Jd5U3zdXvoZiPofI0m5avoqGaM+PWxM3MxwhijJ5mejmcpwRYVPfQv67rnJb8HS5JxCIeE5fFGruo9n1J0tPnk0XyPopsycS3inDjFEqV+6b6k/78MJLuTITMFfN3AQnvNvs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:24:43.3261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447e86c5-3b53-4107-c1bb-08dee1e5f09b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660

Add a MicroBlaze/V BRAM-based remoteproc driver and corresponding binding
for AMD soft processors located in programmable logic.

The series models a soft-core processor subsystem that executes firmware
from dual-port BRAM. The BRAM window is described in the processor-local
address space and translated to the Linux-visible system physical address
through the parent bus ranges property.

This series depends on the remoteproc cleanup series available here:

  https://lore.kernel.org/linux-remoteproc/ah2aVdlsLqy9aeHP@p14s/

That series adds the common WC ioremap carveout callbacks and optional
ELF resource-table helper used by patch 2.

v6:
  Patch 1, dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based
  rproc

  - Corrected Krzysztof Kozlowski's Reviewed-by trailer to match the tag
    provided during the v3 review.

  Patch 2, remoteproc: add AMD MicroBlaze/V BRAM-based remote processor
  driver

  - Renamed the driver source and object from amd_bram_rproc to
    amd_mbv_bram_rproc.

v5:
  Patch 1, dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based
  rproc

  - Updated the binding title and patch wording to use MicroBlaze/V.
  - Added Reviewed-by from Krzysztof Kozlowski.

  Patch 2, remoteproc: add AMD MicroBlaze/V BRAM-based remote processor
  driver

  - Renamed the Kconfig symbol to AMD_MBV_BRAM_REMOTEPROC.
  - Updated the Kconfig prompt to use MicroBlaze/V.
  - Removed the reset GPIO and clock sentence from the Kconfig help text.
  - Updated the driver and module descriptions to use MicroBlaze/V.

v4:
  Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc

  - Sorted the SoC-specific compatible enum by name.

  Patch 2, remoteproc: add AMD BRAM-based remote processor driver

  - Dropped the driver-specific MAINTAINERS entry.
  - Trimmed the Kconfig help text.
  - Reused the common WC ioremap/iounmap carveout callbacks.
  - Reused the common optional ELF resource-table helper.
  - Used resource_size(&res) for the translated memory window size.
  - Kept the coredump segment address as the processor-local device
    address. The coredump path resolves segment addresses through
    rproc_da_to_va() against the registered carveout device address, while
    res.start is the Linux-visible system physical address after DT
    translation and may differ from the processor-local BRAM address.

v3:
  This version updates the binding to use SoC-specific compatibles with
  the fallback form discussed on the thread.

  Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc

  - Reworked the compatible schema to use SoC-specific compatibles.
  - Added amd,versal2-bram-rproc to the supported compatible list.
  - Used xlnx,zynqmp-bram-rproc as the fallback compatible.
  - Updated the example to match the new compatible scheme.

  Patch 2, remoteproc: add AMD BRAM-based remote processor driver

  - Updated the driver OF match table to bind via the
    xlnx,zynqmp-bram-rproc fallback compatible.

v2:
  This version pivots the series away from a MicroBlaze-specific binding
  and driver shape and instead models a BRAM-based soft-core processor
  subsystem more generally.

  This follows the upstream feedback that amd,microblaze was too tied to
  the processor architecture while also being too generic as a DT
  compatible for the hardware interface being described.

  Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc

  - Renamed the binding away from amd,microblaze and reframed it around a
    BRAM-based soft-core processor subsystem.
  - Dropped the redundant trailing "binding" wording from the patch
    subject.
  - Rewrote the binding text to describe the hardware rather than the Linux
    remoteproc framework.
  - Reworked the example to address the original dt_binding_check
    complaints about the root node and simple-pm-bus example shape.
  - Added a clocks property for the soft-core subsystem.

  Patch 2, remoteproc: add AMD BRAM-based remote processor driver

  - Renamed the driver away from the MicroBlaze-specific name to match the
    BRAM-based binding.
  - Added clock handling for the soft-core subsystem and the matching
    COMMON_CLK dependency in Kconfig.
  - Cleaned up the reset comments and removed the success dev_dbg() message
    called out in review.

Ben Levinsky (2):
  dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based rproc
  remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver

 .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 +++++++++
 drivers/remoteproc/Kconfig                    |   9 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/amd_mbv_bram_rproc.c       | 213 ++++++++++++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 drivers/remoteproc/amd_mbv_bram_rproc.c

-- 
2.34.1
