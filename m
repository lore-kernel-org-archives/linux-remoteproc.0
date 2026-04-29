Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE33EFD25;
	Wed, 29 Apr 2026 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479201; cv=fail; b=gmLD6rakaa9O1ooDVpN5bbspB3KECu8YqLEr7S/ZSx42WStP4ftZTgkJhChmcRF8JjV8MnRWW/JuYcZYbgwTppbSQ/PqJAMNzNi6cBjctY2YVddHyqQHCSrgDM71Sxdh5NZuL4JVpUGBrzCPVM2gT3WM8pdErxMRRec0Xz8KjpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479201; c=relaxed/simple;
	bh=GrlnJ1z5+mAcP1VFc/VfyGJ2sQqcyqy1A3kfErhaA1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r4/ZZn2fSObzpmWoQJVg6zlvulAksCIjMnNfxH/VmxpKlwcbmnLv9wqPpFH9imSYLOLpnfpy0/EXThzxARkrbFCfcdcSeyiQ2lf85eOQMs6pDw5DX2xxZsLovYX7BmKiX4PBXhZ/DP/+15zkLBWmk9T49aGnNidxCTR/3MdFZ70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tmx5tqI8; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tmx5tqI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhEL0FBQ8xu0SFfmpQkKC8rEX2qaLCgRWEMQ4Gnh/IQvARZVj8WZDSND8+v3XyHNCJeYc0IPvC4icwazT1yHzXU4zxDckwi4168+sacibTzNp/SslTrraIhFY4p6Ov7Soed5pdhPAxJmvtbarp+MGtZlz51z8/pbjJD/JuMmgYdyHlUAUjhVUCalcCmKipEvr5tzAzm6Ag8T05NoHGllquIBWW8fW86mMCEjcfE/vXMBuFii9kxBgl5s1Tt5hahfzkRb2VFeQHXMA0AlWjf2iTTpEJBGvikr8rpl0L+Q4wlYYCK43hXTdatR8C7Fg3mglz5YLhY7l8YFRLhCauEVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zsi6lu2xaC/ek5jSKwsySu/19EgzmCfj54g794YZpY=;
 b=diLtZg8Pye4lfdcXl1nnxTCuPq7Dvfs1XFNGNOkLlIx2jUFL9jotIHc50kCDw5VmrynrImYxRgnS2Cn56L//8IJ5S2sXbpqFGhUetSv0PQkaMTzXEj4wpDjSt2uZ3Vzx3xpnFFyWOYSr3q6dCEnVOu1ZvVsLZpNfj61KD+kUDaFFuArPVEQ+RVJpykWIQkwSF7ysW4l13XnQUMVESMSsHfZ5yxvRRUnV1KWWpsDv0pEVSAU+fWjIRAy91MPOgf4+MUTbLwzSyW2/5Xsabfs0lcHbKzy7eJ4buRB4Sn69jc66WKAFc4aD1NvM7pO5XDe1ydclawcIUKD5d8cE8rkEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zsi6lu2xaC/ek5jSKwsySu/19EgzmCfj54g794YZpY=;
 b=Tmx5tqI8+uE5rmFHaARehnfTB8y+5/1bntcwXbkq05VKDg5Nfjd1vPNMEvak18m5tjhcDgHhPxLvT7zi5riy5F7kKJutKjpSePuJrD1DiUQJOrma4Ln9KMVdsHLytyF2fwXRZpRBF8PA10M0HW34Z3NELS0Mxgb8rrlhV2I6uVI=
Received: from BN9PR03CA0413.namprd03.prod.outlook.com (2603:10b6:408:111::28)
 by PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:13:08 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::13) by BN9PR03CA0413.outlook.office365.com
 (2603:10b6:408:111::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 16:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:13:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 11:13:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 11:13:05 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 11:13:04 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 0/3] Enhance RPMsg buffer management
Date: Wed, 29 Apr 2026 09:10:50 -0700
Message-ID: <20260429161052.528015-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|PH0PR12MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: c231ff64-1654-4198-292f-08dea60a3366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QeiHkwQQaoGPrdvnhbAHAcRE6upp6LIeYsHkptysiOxzrKMH+SF1XiMcXVsX+VZF6n92/R2l3n8b7BlyScSm4eqaPGft7AW2yNCSSMV22eKntGgBmM1i7ovVs8NPp0sp9tUFacfZcjI4/Cm36t7gC0h9K8y/ANc2/2lq21ZeVWDSLq+VG3bFAzthMsiIUWlF6Q4Diq/0MnwOMRbHzWU8e6aKjsUn8Ei5108oh4MudwSSbDv74RpLgCk1ND49wruWtXcrQaiSskoz+8DhuHBLCOPWWPoX0sO57WTk2XQZEjCqhlrKjKLLMbmKYYABspu0YTrSEc5w1do4BqJFcdmTVKePmyMYD4YlyTfI2EGF1Hp5yg2zYdj48yqGWJQO6K9nVuXJ7bCyKJ8LXqYtTNGkHZKBzR22ayvevwPhGqBunIR3V40CXaczoKwZBqg+ESqf5BK2E3HK8kCFiQm8RvTVXydA6wG6O/6b4jnPBXw6JHrc1nCcw5+7MnXpvpw0DFhFnEekZXlEfCRoWwyOs97tTxMxFU3pJyjMLN3rOGxXC1NIio0MO5/wm7Q+MtW0rXH5jtO+7rhqA6qaDrkWRf8sHSWplQzO+uFU28qfoZiUlkfM0mCFtGKk9e8hWxiYO7Gda636jLk/YeYP/HmN6ZoG029DQdZDPOSw5Z/YivmoESbSjguT8iPZDLyzlsI6UFRKOfwWBe/U62wki8OX44U195rn2kl0dkH1zJnmjow3si+aQ4Hq1D3H9WqMqlDKx531kOW1kZnQS16qGJS0Soiljg//syIYLqcMUHk22hB+1DY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0tyAqdjx8jNl2nom3G+RpU4TS+zeLoR5xq59eGDxF0Jcj6tfZRfnro6tEV/f091JhUIsyECEvZTlhc82/G3rmcBXe2GVY5EJgXglB28YagjAkbND0EzDb46eLxlc3x00A0slGPFrRQy8GV08w6t0h56C+Wp8ZrSb2a54RzRr3TwcxqRowqAOF8h/xbhiyIhV6FMq6G+z0fVhs4gudOHguA0q0DW/tPmQHG60eQlKprAcG4fO7o5BJVyw/H8xqRWTasqw58ZnQBCE8lpmOKm6QDeM7cjUnjRG6tIrsP/tFGMuQnyVkLBYKYwwPgnybu28B3FC/D1TfSKIfFLQ5gWwFzt0lU84byT59c17jk/12sNDdtcyt2MrFV3v/i/NOuUWo2NNRi0d03lVfs+EPsYh/F+qOnmpDEgN5jy/ng4/xzl5ZBNPRqebok4g79qQm8k7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:13:07.4962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c231ff64-1654-4198-292f-08dea60a3366
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

Take rx and tx buffer size from the virtio device config space in the
resource table. This allows each firmware to configure RPMsg buffer size
as needed in each direction.

Test performed:
  - Test [1/2] patch with existing firmware as it is, rpmsg working.
  - Verify [2/2] patch works with the existing firmware
  - Verify [2/2] patch works with the firmware that configures
    different tx & rx buf size via vdev config space.

Corresponding OpenAMP project PR:
  - open-amp library: https://github.com/OpenAMP/open-amp/pull/684
  - openamp-system-reference demo: 
    https://github.com/OpenAMP/openamp-system-reference/pull/106

Changes in v2:
  - Change author
  - fix commit message with better explanation
  - %s/sbuf/tx_buf
  - %s/rbuf/rx_buf
  - %s/num_rbuf/num_rx_buf/
  - %s/num_sbuf/num_tx_buf/
  - %s/sbuf_size/tx_buf_size/
  - %s/rbuf_size/rx_buf_size/
  - fix typo
  - do not use ALIGN on buf size, rely on allocator
  - make err msg more explicit, %s/vdev config:/bad vdev config/
  - fix license and add AMD copyrights in the header virtio_rpmsg.h
  - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
  - use __virtio32 over __u32
  - add version field to virtio rpmsg config structure
  - Introduce new patch to print rpmsg mtu size in the sample rpmsg driver
  - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h

Original seris:
https://lore.kernel.org/all/1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com/

Following modificaitons are done to the original series in v1:
  - Separate dma allocation is not done for tx and rx buffers. Instead
    allocated chunk of memory is split between tx and rx buffers.
  - If vdev doesn't support VIRTIO_RPMSG_F_BUFSZ feature then use the 
    default size of 512 bytes for buffers
  - Change MAX_RPMSG_BUF_SIZE to DEFAULT_RPMSG_BUF_SIZE
  - move virtio_rpmsg.h from uapi to linux dir
  - RPMsg buffer size must be set to hold rpmsg header at minimum in the
    vdev config space of the firmware.
  - align total buf size to page size when allocating and deallocating
    memory

Tanmay Shah (3):
  rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
  rpmsg: virtio_rpmsg_bus: get buffer size from config space
  samples: rpmsg: add mtu size info

 drivers/rpmsg/virtio_rpmsg_bus.c    | 124 ++++++++++++++++++----------
 include/linux/rpmsg/virtio_rpmsg.h  |  27 ++++++
 samples/rpmsg/rpmsg_client_sample.c |   3 +
 3 files changed, 109 insertions(+), 45 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h


base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be
-- 
2.34.1

