Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B545BD6F;
	Mon, 29 Jun 2026 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751217; cv=fail; b=sTJvaTjYwd6pnB54Pt/AFskgq4K4GWmJ9MjS6Qn/Pmn3kJQMVAC6R/BrVJygRKd0nXhIGQBmRhFUhIoncjr9U2bxx0pBVlCc158bm08stliH9FKWTbJugVRFxGd1WftB2FkUZg5TFoSVGl6dv9gYmAXCS4D1s8YpdCgAwsYQ1qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751217; c=relaxed/simple;
	bh=nMoXeiwmRNMyQjdZpFYvVbbGB2y3+5FgQrTB0pp3jF4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h7yt4frnWR2vJ/W7C0LiHzRYfSMEw1fxVX343IrNm2J96x/4fVd/PKMF6HVHANNtrJp5XCDSGI9TAN6NMlVE7sJyRrBfyImZjWvyUeyLcmAaZc/tgsNG8/XYxOlH4xS2tt/8kcJBUuOSTxGoYbY/IL2G9EXNoeT0abIPIQwA4sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JS/kHmWS; arc=fail smtp.client-ip=52.101.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JS/kHmWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvjUagkwAAe7l1YkZN/muJQmlIfJQREjdKb9I308JORHwH2Yht9h8yPEPasdWPTiyN+oKA1J/PcM3b0ZkG6RaWqst4Y5DbVcPXUYJJvhPSQq9m0KEZnSxtRc3lodmDQnYKw+TFEsx+ynFufOmc/Cy+zS1nyhHgzYK/W6bw5+uHy+G3a/EgS3aAwYEg+bmOnsmqdmK4ggXNK/yKnblBwSY3nwIfGSpxfQeFCZrNWDy+KpljSmJWdQ9+G0sbPPoOcv0eLYJp6le+5AMsF4wk2w5tp2Ne6scj4jiZFIyeVOUsDTLuEJk1l1Yqs88GxE31Bo/+xGAWqwdC30PkVHsDsNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj5R5R+u9LeEr+xxjH5yHZzhXww1yVJbZ/M4aARhI2A=;
 b=it9AZkbMtvR4UxHALJsx17PsvYvinztL4HhEeVj81JvJcMda/teDBk8yWykoWnI/GRYbVOZAQUQYCp47x89N8ayJTaRqoG2RzhewqDGprMGj0DTK9X8Zn/aW2ORhvyGo5H6KwQdP/ywKndZBAHuDVnSA5oVI5rzX31ySfsFoEUs2zkUXMlxqgQpAsMrHat/Ld7nR3yEMiA8J8VEk1ItZufpmsPe/FnWArLUZFZP/T0YaiArHInivMTb/KJCdKvCC/dPVTEt0Yp/hUnxfjiA+rPahK8WVqHQX0Us0/CK5UA4LmwuKmO7FFYbdRq6ojdXGKRbIt2Wa9W8qtH7Am1x3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj5R5R+u9LeEr+xxjH5yHZzhXww1yVJbZ/M4aARhI2A=;
 b=JS/kHmWSWkYtl/+5eHsw8YFlC7VsvqQSgkUPwQtdKCu0Ey4KLZS0XivPUX7TY2RHxmje9nHOcGRxWeO3BFHwib/CxUUYbGIhAQ4ya8kgSKkQirx6Ko/pssIVoSnbRVKPZgbEVlWeM0kgHOhfbdYV6Jojl8vO5Au/WUH3i2bkV54=
Received: from BN9PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:fb::14)
 by DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 16:40:08 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::1a) by BN9PR03CA0039.outlook.office365.com
 (2603:10b6:408:fb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 16:40:06 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 11:40:04 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 11:40:03 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v4 0/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Mon, 29 Jun 2026 09:40:01 -0700
Message-ID: <20260629164003.3940208-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DM4PR12MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 636acb2e-f30d-4341-805c-08ded5fd139e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|3023799007|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ry2dHwyNum8p+UI17v0dLKLklrRQtVPkoPZvBYasatSad4KVn9hJ/uCQpjXKg+cI8S50fF7A8HS5m3VlCjfOzYceJyFT/B0Scs1LqRddFAL+8GFaBfWLZq6BYXfcEu13ygC7uXAoGV/Tuy1oeOyiJz2lQgBezbsCVAyq1kVA0uNRm8OGTznPjoBdTCOT5dD4a3rhCP8AyIgej9yuI87C07ZbGO0ZsvyWOjqzt1D8pgNLqixT5a1Kms76X5T0vSl8X2+Sj2ppDS1q53veg19AXQp88xJjyXW1zysDt380h91564rnO5CsY/4SYtGg1Oyq/bgqc1LaG1d6mEOsTJIfuh+Yy5tT/hUC9/aXiUOjuHWQAeRDKIWaNGkmRiGqH3dyo67XjlosDfWCFpyrKCb/ohOhwcxGMwG+NdV7SuxYFXLbNrC9E+79ZP18PoNkl2xWPOVFbKoZnjRAEj5PxZJsMdyq9flsYvDha5Z4EVSohthsBgMSgKK4lS9C60O5zzIfAfK0W8kyjwksf52Q5eG31c+QLJERHFKlzjyk7ZO2tNOmCDVGiAu/7CGYMkGTGzkJ2gWcFvaj9k7o6La/MLbwJTdR9ldGJZK46VfKFIZN/946fEdU4U3UQ0OD+s5D2g7gigunpqtRa5rEp/jsbR4o6bFr3/K/2iKsMulnzYwGWP9g4B/U32epmE6THShibGXh9vjAVVHul6l4QlE6DIiy+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1IPyxvDfg7G2wl+U4FMaeMgENkRN4TxgzLKugPK0hi88c1jTGEQ5bPGHLzlI4GEOLIeTsS80eD8v5eg/P0Ii1a6kVRaNoSR7MMAU+wBN1nFQx9bypJMwjj2heWXhhLuaHaOuMuPZpiHI/shS+1sdhepg6NH7Pmlr/GupdvqWy0gsfGILuQbvf31tPrOtKU7ATnTVVbxPQ/03EmvJkZcmF9MurDhHZO71ZsIMoOqfPL8jpIknUgvg+j0dE0P+6e+c3aBfqWUUNu0TDUzym61dUcAP1phEvLUKbqcDGzGvqsSVxc0G9KJTanQ+mj0UneoqhgyM0AFSu3eeNl7opc9FoSojLC6fHS2E8PhtnaBO+0bR3eesNIMFVfjO9sZ2pLiLD9Mhyw0PkSKtudQFLAtpe6jIKtWvUMzZGwB+n5sKelKHbHbBZecWTtuhnPK+vM2r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:40:06.5365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 636acb2e-f30d-4341-805c-08ded5fd139e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771

Add a BRAM-based remoteproc driver and corresponding binding for AMD
soft processors located in programmable logic.

The series models a soft-core processor subsystem that executes firmware
from dual-port BRAM. The BRAM window is described in the processor-local
address space and translated to the Linux-visible system physical address
through the parent bus ranges property.

This series depends on the remoteproc cleanup series available here:

  https://lore.kernel.org/linux-remoteproc/ah2aVdlsLqy9aeHP@p14s/

That series adds the common WC ioremap carveout callbacks and optional
ELF resource-table helper used by patch 2.

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
  dt-bindings: remoteproc: document AMD BRAM-based rproc
  remoteproc: add AMD BRAM-based remote processor driver

 .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 +++++++++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/amd_bram_rproc.c           | 213 ++++++++++++++++++
 4 files changed, 330 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

-- 
2.34.1
