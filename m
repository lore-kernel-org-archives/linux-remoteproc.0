Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20509386C0A;
	Thu,  9 Jul 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609140; cv=fail; b=sSgZSxd3kuoTU76MB08maUkei3q5aHpG4TCcJ2hHeAWZoF12jVLO5e4xCjQpg1MWN+xJjDwfVigDjUAGDaH0FR6sdP4ijyYfHK9kBkfQpkFL/My/W8HPYktiXWqyJlqFD9kfCiYXn+cqrhUhPSZL8lEB0dO+zpbetBLiVv/9VqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609140; c=relaxed/simple;
	bh=eRWXM6yoWLd863VmHBqmlSaMlCz4T99TAK6T8TfU9a0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ws6X5CP67PRIr/LG3X2qb12qsDhytSbqlfmmRsft36vGZYdp8YMGihiDzEz/hsqNVWYPR9q/7tpS3f292MIikVOZstbY74LY2b/Hfd6wsEHLrjnR96mPfJre5yfdCZy8UCorL5RWnqi26vKKJtF4Yxxdish4DtLTmu4Gs8Kah9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tjWdGkX0; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tjWdGkX0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC1RWQI5FF1E4HzCPBimNZuP5+D7dvOHxQ+VKWt+vwv9Qi15+pBXCyhHUkevy6Xfl9I80Iwt569WqZmEftnAVP3t+7RnHdCiRw51hYu9HgwnIu6CvlETk1RcsA13Pgdz/5d6otbT6K83eIjhWamVc0Vt5TEte/aJ/EkQaW1ekMKqnug45xjJDs7WtzpQLsdkBDbQSgwkaKQQS5pHlwcnnck6EOdaFNiYyLePYFbpZrfXd/T4MDByL/E53lHDd6e/iDAvND7NQp44/pAc67sIJTgvSKqT9fvq2WTCSJAFmHiVKZdV5pYHjikPs8cIAk/4IhHnopGIwf3bWaAQ9Egp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wj5D4rXJ8PZvtTARpSNMHa4ItC1GHQ8Xwm7LSBa3Go=;
 b=Tf2kHeFb5LUSTSAXo4DkRa25yeN/tj1zXqvJr2QXufF1OK2costtrDX5FEJQK/IwECq8dj+ziNtlk9Do35q3hwpq5ptMLRw0eOXd4hfxCFObizJafkwaQIN/9QuS4Ps7IHM+eMEPhG2iqFUASUjqyqjFrQnS2XWzcQFesPkxSGzGWaMQiivN3b+QNITXmBY40OxzUnhZFKxk9XumzL3MdWiFMqcHuSlnkM20cjD5B3qX46O06boRrmUA1TueZof+CToyl0fngaXANocUrA71IcCd/VQyWaSPAV4FT6PwtpVtv/p68MqqFLPoJPq9C2YY89a1lgv8p1rc9k5twbTaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Wj5D4rXJ8PZvtTARpSNMHa4ItC1GHQ8Xwm7LSBa3Go=;
 b=tjWdGkX0GFI73+EeoUC9hV63vF0cKFqDKAWULYI3+EgtI4LfxbsbT84MQkf6pJpV+T+5P49KfJ4P0ImvS/IASKS96+1ZvI/fv5xc7R2tNzKSDYAlyw5HbvYzYRokv4FZ6XlBWQo8ai1IVDRQimeYsP4t00HcF03cCu3Ua7/3akw=
Received: from CH0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:32::16)
 by EAYPR12MB999180.namprd12.prod.outlook.com (2603:10b6:303:2c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 14:58:55 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::9f) by CH0PR07CA0011.outlook.office365.com
 (2603:10b6:610:32::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 14:58:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 14:58:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:58:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:57:12 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 09:57:12 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v5 0/2] remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver
Date: Thu, 9 Jul 2026 07:57:10 -0700
Message-ID: <20260709145712.951146-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|EAYPR12MB999180:EE_
X-MS-Office365-Filtering-Correlation-Id: 259c273e-5f74-4a88-b9c0-08deddca9741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|13003099007|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	nGRfuNALyDlpN8wGN/GPRjQkaRtcPYm9hA71uphmM8GeNKJ8cte7q9KK3POw1tlgDkDvSaU7uA70zkUCSLMXWkf8bZyn5K5I8H/quteZqisc/SBK5fLQCg3YPt36u95N1y5Mvd64cWotxHM5zvRfqfla6y+IGjtl7oGUZThJOXMiZmrrwmVNeFvML/N+mUf9SzPi3mRKRniH+scfGlvupEmV9tbQyrTb3ru/NCiBvmhAWF09ZpagaI7kAvLjnrJrZ7s/tsIV0AapTZN0fckTgS4F37vVI6DJ7bQB00aPvhHELqTD5VRnkSvmQNjgo1zqYDajHsTxORhVCuaFAuRxTxaZukAIu0meMwwasai2B+7IHsRZA00U/T37Mh25c+duh38zgL5o0SAGUwCXJiSVfGEkjoVzVr42Fsqn7yIG2i3+81u8i164s3gvtaEosK9K0opp/4c3mJdvl16cVycPblSJkBULMUfrphpjiQchjXCHYXEJ4uUCUmZLFVZ1dmARuZQ5h5Iya30mXp1N4Tf12vAUxrhTCypZ5CNqbDhqe2uM1Qd4WXnriO3fa/5AlCUSWNA0oCRZXJUbZV1dpF8fPA5sMsHtwMz3+hrCxiSLQTgulrfk2gCsv9dhkDuLiZJlLSeecInSWB3kkm67cQuAnYC3jNnkZtK00rJfE10lAVZsWpAvk5pjE6Q/Ng9N5dKpuemEGOBy+eJ85LfZJfSDbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(13003099007)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iZg5VXuQKvI19VD3kCeTYUVpo5W8BPWq3d7or58gSG2fwmqYvZ3RBI34FDRA1afS1C0MxkRgljD2LjFF4vlOcRAnTV/teMdPOAPFuTA7sGxk6QD8PkHrj1oic8mH5EJGErSchpHNwUn5Iigf3u2/KXN5/YCChUdW/dfEX3fUjAq27lCRWs7IvFdlmSCqmAGzzpy7vJ8m0KC6NbxhQdibFmSMuHnHqx/7o7pLeAikB1VdKU8oR1cRzzP+O9h7BY1tnTQ8uMvLAuepjfiP7iyd8RvSsEtD1VaPY6zUxeOEa0cER57L5S8y1PSUW0R3KJ2tGMkgj4WMl+yDocx9mVUaiV1lDlMBJvA3/mkxFeHTQMuY+RqvIpducvZEOA0t3+6sZoJqGPpv8IJHJPdZBoTF6Cz+0Jk364V63qwvTgDaggGSCGMa1qChAqzasQltGLBe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:58:52.3501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 259c273e-5f74-4a88-b9c0-08deddca9741
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999180

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
 drivers/remoteproc/amd_bram_rproc.c           | 213 ++++++++++++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

-- 
2.34.1
