Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125859;
	b=wnVXmEMr9Ns1bqxS3Qj3b0jrGz0pMC3HG6D4mzC8LfVInZj1ntqfQ39kELvkUZ1JhjPV
	 KX/82w+2Y+tsk4nYFGvs/ccTo+CRXDoFpLrcbzFJwXWF9hjhIdgpUp2wm/qCCmezqAga1
	 K4US0a8cuqzOz2TFVrVmOeryOvW9gM/UMHWnkHCbwRVszMowGsPZd4d+2mZ1qs6ItYz81
	 nZt2LtOOb5FxkXUcV0jv9WXbnneznUEx55WkkBIXSmBnFUUMlTkfKn2mu8JTAZ93gVIZv
	 OdJlGnQ7AQV00HmUTejSGhfNITAY1aPZ+QXOb+mJAtpP3qfBdsWwDgppd4b8hk/Pf4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125859;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WeRENAsCAsyVCh/OuA2wGw2qPcCsykEHovuX6vi9xus=;
	b=D08a2AMVsurEP0Q5OYdQYr/fg6LFPFFHhC1iRsCMj8Fzdrz9ixh9KhwdbH3ffoxxVwJ9
	 H8Cau+rMROPtIgwUTlwj7rDun5gWd4A54zjT3YuD7S82mu+3EZbEQ4B/aOezACJeEjrZ6
	 XS8Iz+S9D8apUHUDb6AyIdI3xnLtij9tL2Cn1qFR1ht+BbCGQ2xcmF8q5mlq5WKCar34y
	 /Ud/y8lWXf7BnqjcbZMuFOlCB1K1wqdhcSVhp72Rwr8jt7hJf1aBvjK3W5VWSiSyiEPs/
	 8fIaspA+kHqgMrw3IXD8t1J3vyg7kMYyoXNwy5ERUQeGlb+C8tyJyumVGg0XRFRXgSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SNoC5nkO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.56
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012056.outbound.protection.outlook.com [40.107.200.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E5606A320;
	Thu, 19 Nov 2026 22:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SNoC5nkO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy7o1Drtg2uEg5fWw0svBBv7kTYDPqL3OoBiO75p083tZSLU20d/pXCiMlX5PKJ49nbwJrfo+nANZLfRKhXr/KftqdTu6+jNmDgB4BDMSkBRGgyjjzlq0D6PziEUOOUWCpV0En4wbaXWE9/33bNX7K+5dmLV3O66BUWR37c3qlTjejOaIY1l4f8JgY+xhtFEr+93dg12iIyc/lIF0YKwxUtvgp37CDkFtV61DijCj9mf37fUBWmlymYr5yv8bOY4DSIwF1G9tk48FxeyxianpXSWR7c5H+O8aN7aAAnDzrHY3byW1pSFZt3agxY3OdbAEQpyfK6p9DG8eQui+4MMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeRENAsCAsyVCh/OuA2wGw2qPcCsykEHovuX6vi9xus=;
 b=LMQ0xDuxFmc3Y2FQfQa3DKE5EivazsxW9dCX7kyJYtlJI6YziWfdffyg/oeTf2bsfAQXJNOoM5I6kSiFePfxHhuquSx9pLPu6Tmoyj+/seSNuKyc5cjKHLik7TvUS6ynp6OoHath4IullODq7ElGZvYSEHCoAeXHOMyozaaXKJBaSi4Qu2i6EuB42N1JdZ/h9gJfeQ3krnwiomKZzqYTcItDn9ncQaKcEd3uH5ofxbAqlQXJcVkRZY9p+Te4nh7gh8FVvo0hr4xkrLpxmM+MRN6qA/vxOhwycmIvzHFFIlQxj/L0cInAe6u9Ynx+sRHENJnxt0LcW5gr6O7uSrmRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeRENAsCAsyVCh/OuA2wGw2qPcCsykEHovuX6vi9xus=;
 b=SNoC5nkOdWnCuihYZ/rOV+fTstWR+rjLnJwxVqzAzZk8j317MsIAbA6IhMfqWi4wgmVM46NGrVt+p3KMOYQqxej6TaJIjHmVIPrEv1dBkgPay5e8ukximuQ6qyRifgzBHoedj84jCac3kRJNwdYW56A113r9LMGwFef47KVP4nY=
Received: from CH0P221CA0045.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::15)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:04:07 +0000
Received: from CH2PEPF000166BF.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::a4) by CH0P221CA0045.outlook.office365.com
 (2603:10b6:610:11d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 22:04:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BF.mail.protection.outlook.com (10.167.252.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:04:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:06 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 16:04:06 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] Add AMD PL Mailbox and RPMsg support for the AMD BRAM remoteproc
Date: Thu, 19 Nov 2026 14:04:01 -0800
Message-ID: <20261119220405.2838553-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BF:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0fd4cf-9b00-4268-a2c3-08df46890852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|23010399003|261026140227099003|11063799006|56012099006|261009221227099003|261009223327099003|261009223027099003|261026121527099003|261009220027099003|261021121427099003|5023799004|261009221727099003|261102123227099003|261022105027099003|261021123027099003|261028144727099003|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	vLGG2kh61hWLH+x31GRjhm6ASmOiBm9qlgVZuKbEfHOeP1x4NYxsjqJ/E8HNshkGq8DjAThx9LTY3d1X1rOTXpgRhuBq0Vr/o8JDmZk1qfJtze0P2PLv/bUIBbyWvoZaCwI8sgWkIcpOnqwtqkIZFWdgJ7QEYfpYkNMVEgEqmCdZt0JExmzejCVobQo2RASTvEC7elNgD0P9wSM1+3wGomlgSM/tMziIzPZuEIA+f6WrDS7DszuWAmpjqlPrYFipLugDu6ifghDyaD0rNQLEIJMNii+tH/y6//+ppEGd2IbFy6NFB4T/p2Pwo1RfMD4ttxkn6E3abfdWeWHdsvpQ9rFYktoAh5y8VA/yjMmodQiW5KU5NGxCYTWc5MXgK7cw4I+JpW7rKZIBvYO8qaELWXOiXCQ77Av/vojfsQZNvDIvdQ9wLdA8lHkIsZlfUpnFINYuwDDvBC7+NVsqx+JlMo7j5g6ajNV9844OdlxIpsO07/wRv8tcMymicSpLsAXVlef2qcPcCX8mxzv0Ew2CL8yqG/Yf3gR/nA9UMKGHjCgIHFcqJrG7XJljERstGedScwIlEdBtE7FyDEMq7eIaUTolTHkzvGh/m0i7qxPWaF4AcnSAK5TM+6FDLV2930CG5VvI5KibQKK6bquMTaiu3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(261026140227099003)(11063799006)(56012099006)(261009221227099003)(261009223327099003)(261009223027099003)(261026121527099003)(261009220027099003)(261021121427099003)(5023799004)(261009221727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261028144727099003)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bIz8s2Lx9hKLaWvx5aK9kKOpF2elSTSPEl00PYwBdeEQjpWyNr97gagtC9ME51lTYU9aJvWHsYr8j8gSFK/u4mw5ip31UNSASvGN14Q5lU8RrjJg3az7msexJkdKyXcSYSRUyFEoAcacAmOVSihwOk65a7JHvFiZumTn9xkRx4M8Auu5FgXlm3/UKLXHfqdceKgTWVG44e4GORqErD+J4uJ1Ej7IcJRdhkEnOoPGYCHO85Mf0t1h4OFpB41cLcewbyIQcUUJZX9g+8yaszKumMir9xJnWkkmVjXo1rZ3RgY0esjapx6aSMFLLmwiZg1WuPvsl1OXSgnaF25iXVdRIN87bGB5sRxuTm63KVemJ+RAPxoeN7+Lcp8gC+JkZf0OwpLUpXZ3wtiJyVGZl+r0DLQp2RcuewgRK2GNSqZ1mVdCloC/BgDTVT2gOAJ3Eg6E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:04:07.3444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0fd4cf-9b00-4268-a2c3-08df46890852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815

This series adds a driver for the AMD PL Mailbox soft IP and uses it to
add RPMsg support to the AMD MicroBlaze/V BRAM remoteproc driver.

Patches 1-2 add the PL Mailbox binding and driver, and patches 3-4 add
RPMsg resources to the BRAM remoteproc binding and driver.

Claude (claude-opus-5.5) was used to help write the code and changelogs,
as indicated by the Assisted-by tags.

Tested on a VEK385 board with the series applied to a 6.18 based AMD
vendor kernel: RPMsg echo with bursts of 64 messages, over five remote
processor start/stop cycles, with two MicroBlaze V designs.

Changes in v3:
- Drop "remoteproc: amd_mbv_bram: Bound device name formatting".  The
  name is already bounded by rproc_mem_entry_init() and a DT node name
  can't contain '%', so there was nothing to fix.
- Drop "remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL
  reconfig".  The problem only shows when the PL is reprogrammed while
  the devices it contains are still bound, which isn't a supported flow.
- dt-bindings: mailbox: Reword the description, which no longer refers
  to a "register aperture" or "processor-facing interfaces".
- remoteproc: amd_mbv_bram: Add RPMsg support:
  - Reject memory regions above 4 GiB, since the remote uses the
    physical address as device address.
  - Validate all memory regions before registering any carveout.

v2: https://lore.kernel.org/r/20261105051902.1646651-1-ben.levinsky@amd.com
v1: https://lore.kernel.org/r/20261014213426.2957480-1-ben.levinsky@amd.com

Ben Levinsky (4):
  dt-bindings: mailbox: Add AMD PL Mailbox IP
  mailbox: Add AMD PL Mailbox soft IP controller
  dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
  remoteproc: amd_mbv_bram: Add RPMsg support

 .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  |  71 ++++
 .../bindings/remoteproc/amd,bram-rproc.yaml   |  21 +
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   1 +
 drivers/mailbox/amd-pl-mailbox.c              | 378 ++++++++++++++++++
 drivers/remoteproc/Kconfig                    |   5 +
 drivers/remoteproc/amd_mbv_bram_rproc.c       | 295 +++++++++++++-
 8 files changed, 788 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
 create mode 100644 drivers/mailbox/amd-pl-mailbox.c


base-commit: f1715c0c04606ebbe832cc760abf49dfd6f2ae1f
-- 
2.34.1

