Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AC44BCB1;
	Tue, 28 Apr 2026 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386406; cv=fail; b=U0VIMCE3268iV8+YndB+k7HkaHAIn53pI38KG1Kvm7LiPd91zpLeAPTZSk3vHlXvsOdhzG0O+j4qEF8m9EyoQzj0hvaQDNbfhzSVP7U6wzYjxx4LuCzSgWQQReReuKr41pn2gS2Mufhb//qILuiFMRF7Tas58rYPGF7r1jtWBXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386406; c=relaxed/simple;
	bh=iHh9JOpIrjVHD4/ng/fXmLaIJMkjiAftLet+bb54bLM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YtyCs3SKTcX4IxyYz42qEhfMaPXQaYX+T7pSz19r9GrQ21AlwW42HbCsIvvu9AQjDjLB//jN4X7uSf0eYIROz0CglrmKpZV+KlfvOFkDAciJSee+yBOCAb9tw3fcK0mZPSNk1KSuNXl3JlT4v7xHGaWMmlTHPZjXNasron5BAO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FGLxgy2m; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FGLxgy2m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgMWBYeOa5tZXAUHfoWd8N+SfrzYr3bgSe337jqq05Sx8feVOaYKYDRpmXh8qCl6mH5qyxiuzgUiOjMXY8MzbJdPFP1WeUaVt2vaOqdIpHdQRIxreMr4FNpCZL+H+wWQREo0TE9X0wKCm64g2bF1KovQfglraf8QWrLMK2J2Xr0U7qzwzbOtsvMQLSeCPUYSiGZZR/96vdOR7ey6WjdzPGiE8KpVwsr1HCSwMV4TewF9aKyfrwyLmjlOmEgebQzLVbdjfzpHZ19gSjLP41obOCmEgzRKy8jM3DqNH50Tr+W3E92VrdOALvOMhNbjaF8ikH1sJzinkw2GcnyQMIP6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvjWxy8ElKlxbRSdK8n/SiQ/hM7lCkGGTveScO+0PwU=;
 b=XF21ip5i2FErNrSfo4sW9mIdjO93FfVgrqF//FivwTqCZF6zbbCC/XTzWAe4B9a7rOzfd8xmwFxcIs9U0vfpzCy0CXS0BCVvImpHprct5fcpI94eAAIkqP0e01GzcKS1COAQEl2dX3NRjpyJnQ7x/5lOCEoapnpvt2iqtwPHgUtvnLOe3cz7tw+hlWYBfCP67jODrHlbX4bFm9HKZYbOE9I/+y1TDN+aUZ1zxU2VwCrEpW5bThbPKKVLtbuOPJ5y+eiTukOv32ivqgS5dNnNYe09gXtoaQBVPtveS9uGw1dkuCV8VJLWjFizPyw3+uDhf1sT6sY3s18HsyB2BlH5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvjWxy8ElKlxbRSdK8n/SiQ/hM7lCkGGTveScO+0PwU=;
 b=FGLxgy2moAzQkS8CRkFlsD5u0VYUhQcObaoufuVSKEr8xw9n3f0ciUxPXa8iwICdNoOw296EEsIwMboH1GNRHl1ZNICM7utsWr/stM5KMJ9TuX+aGZ/xu6Tid89xA9fkDHHvKCT6lPo3lMQTfhyrupD+dr/nSrakGrM/TEEIvZc=
Received: from SA9PR13CA0124.namprd13.prod.outlook.com (2603:10b6:806:27::9)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 14:26:35 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::2e) by SA9PR13CA0124.outlook.office365.com
 (2603:10b6:806:27::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Tue,
 28 Apr 2026 14:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 14:26:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 09:26:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 07:26:34 -0700
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 09:26:33 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<tanmay.shah@amd.com>
Subject: [PATCH v3 0/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Tue, 28 Apr 2026 07:26:31 -0700
Message-ID: <20260428142633.1854251-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af9ac3f-d58c-429d-7908-08dea53226d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q0HS8mzDeFqtee/5WesNkTytGpjKjUekyAikcXRe9C0x4G/89PEfUfwWKt3NQboPeqmD4CedthMYGeictl80lQGjHMVTzA0dBJxb78sYEDaTyRe3hO4RjS0CLBdgKnvO5VtAdJTCVGL47bUhmVtSVE0dSUCKN25m7SOaV4z290byXSpy/gkiVxRSr5FeNMzlJgzpuqtiisEnbOfDevka8tFOfMNK7HDBGJKlOql9gpnEpG1tRV/AaMmj36EscivauLGqFY5FoehAzBKHnTRC8jYdqFKrUFyBTP003Z61A0O8iWV1UWO9+wYMvV7b3ZtSMpPSceXzySwXwfUfRr65+XXgsNMe4PO9u923LaV/AM4+mlEw/icEqzX7Zf4JGNuHHW5EdNwntmVplBYI3SSwnj9nSYlrgXYL44wvZnhC8NpwEstHg3XupuobTcb727725wwSG2YO2XdQLtd/EAJchBXsiaxY3jMawkgLY1mm3fAEDwYK1/GQsfDQndsJGTgz3T7rILOS3idzk7oDRsya1J0hX46brmJ73nZrgwgJH280Ah7h3zk34801yaS6gad1K48JLdufOnz+sYsJxC2G+Emu3ZxpIA7uq/Y2mbPIll7WKnODR6AiUNG+MsEXSo0YFnGErBzTr9irGoXIjqLhv0sfGBjcQXjoAfZAU5GhNKL5vTomLr+VTCVUfVPKSGn42eMdhsqX1bi7ZxcsTzjT+whjh96tIUwBbJaUPOZP590nBA5GHSXS/qEi9622Xm8n8uVBWASm1thHcxBeOwBY1g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zgf8jnIK0uZnGDMADv99XuPzGkWXWA6xi6I/MrAJMcNTRrdBL/65fBK5qFkbgJ7X0B+SZ1MR3QbBu5+0EDi2oC1XIJcwQnv8EEg6HoW53KlozeVV06GZ9ck7Gg2dUZ2EyZfCu/CrZL/dsxuBbEP2cFImwkADdfFJbUDGJ6KS4XWeHeSZU4pCuiHxLzMQ/9n0x5I0/Ac8iJkhmkrcgqLjJMfI4ITSfka3yhyvwJ5lHYaVjrHnFzSDj76BnJ5Iivv9QcMNTUlOHsvvh84vsf+ZsbfB/FA1Uj7+7jYKHwthWrn7orIl+lohatuLHm03Ecr5rxilA336q+Baw5B91O1RwwtplfiNqyfigpykRfXKoj6bb3j5LyEkEYVFXQa/wC4VLQOSfJKJF2Z8NGoAFK/4S1rxcVcU5uI/jG0OqtpER4u2N3S+nqDrqETNR7ZWF+Zs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:26:35.0962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af9ac3f-d58c-429d-7908-08dea53226d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994

Add a BRAM-based remoteproc driver and corresponding binding
for AMD soft processors located in programmable logic.

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

 .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 ++++++++
 MAINTAINERS                                   |   7 +
 drivers/remoteproc/Kconfig                    |  14 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/amd_bram_rproc.c           | 243 ++++++++++++++++++
 5 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

-- 
2.34.1
