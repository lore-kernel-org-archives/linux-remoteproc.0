Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253731E847;
	Fri, 14 Aug 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718746; cv=fail; b=bnD4jD8Vq5AJQgBlVmTHt+MFKm8xJk7aMwUT+7Cx64kyktioPptP0TnZF04gFyxVX2s9Rdf5QJ+P+c4BLsPtsvuNkKOkX1GYcjuAFnJ9vFHQRz6Ww31X9icx86z9jrFqKAq/Np5zt/Y1TJw6wEtQFle15hxOQ0iWGZ5AohEbLco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718746; c=relaxed/simple;
	bh=OpiELeFVc2tSaGnTS/JhDPVjbKn6vaLn52vjL2JgG3E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYNoxU0rYh06nAhjBer7Onf1cfXrF5zOWTr3lrENQ6wsJco1q+wMvsmjW8aIVBWXhcBrzfKmGaRsVZZQt9R9VwPn2hp7uBPcPZzN7jPqjgwurhuDZ8Mgj2Fvvj7a0ONIBs1ialooLV1vMOJBUNTS9U5ewOW1tLV8rIFy5ZQOQmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rkBHupId; arc=fail smtp.client-ip=40.107.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rkBHupId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STJM9SuEw5FTfb05ybohlukoKJ4IyMUA2amRwhn96KcqzzbyC6rEf+uEBH/dvnb0+vqD8Jibrwfk+XFrQs8ZynebZStV4m1ulSFhwDyGOW2NSHXMg/vhlgjpoI06kASL5mPlefZf0BaoyNmSPoziVcCztCGvewPvgNfqAf+/gRYOBVLRsBHzE3erJFQOjLHWV0WrOLGiHGraa7HW0A9D3CjBlJ3S3X+5l0Lb0C07G7upgcR88rk82LW/L9rZnn4Il34I0/GXx2iVL5LVKObif8aI+I9MmhcK9TLnZyA+LlLTWV686LFV3e7JS3Fjkh6ZXoC+dEDdpY+TqVperKWHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k92ieZxbsck6vleotbwjxMR8bCWvkUhla3G15Yoc2eM=;
 b=iIBKOYcoM93ZhFgjJCThH62W5cBFEKbMBxe047RE2ujtddnYdycme9MVGlaCFTgJrwujD6o8qPsu4gZqyWSA+hYJXguoc/TDoTS7jkXpawNf/6iIx+fg77HJnaJOYWXfdJXlcbCPvM4I8Prnf94qZ5TLI8jufqPySmqDttC4+B1vgYNInd72KNnw4pHDNvCxAvyqCsQ24Ldg8UdjW4wl/vl8Tsww6Uo6B2nimMsp3sRbWUVklYGSIe75TXO9+pFkyJoUj2VtkKgse6sld2QuFRF0jzUtzo8uZUPdFFnB/jEdbmSDafc7tRswjYe9WbeTN5MQYAZnP94Hm85uhiUEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k92ieZxbsck6vleotbwjxMR8bCWvkUhla3G15Yoc2eM=;
 b=rkBHupIdAZusw0FvK1b8NCn65XsiZMPeodh9kbYbUOJXZHRWsKA8w1Uf6m+YL1Jfqv8g5SPAXSi2W+/9cq5mSKQWG7IfEw479irMn6kcVRSU89LCtIJwf8dlFjlx0gECfdVBZ52lMVt/WIgpss0qWDVpjjsgQg8/GLjJFNfowOU=
Received: from MW4PR04CA0166.namprd04.prod.outlook.com (2603:10b6:303:85::21)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 14:45:39 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:303:85:cafe::9) by MW4PR04CA0166.outlook.office365.com
 (2603:10b6:303:85::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 14:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 14 Aug 2026 14:45:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:39 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 09:45:38 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v7 0/5] Enhance RPMsg buffer management
Date: Fri, 14 Aug 2026 07:45:19 -0700
Message-ID: <20260814144523.744382-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: c02ab705-f561-4fcb-a0b3-08defa12b5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4LjO0nTcKTE9tgkdxFlIFSffOm8pMXLUCfzjDY5gG3NDciEYPgM79ebesK0ztLlxTp1wkS1GE9Qddw3AM4PmCFSwot89HEo3KdWVW5pjLkLnwX5f8CGkFX6sybMgyfIbCxDSsKmgfQMavVxBaMYZNAqeWJYPi3QbCzasFHRVf0a/ESzUiGdsoDky7edC7cOAj3+0p2+eX848Xcz8MLidnh+NkcejGlas1S2Yzez3Z0l54dAoDxFag4Erd3Ow0wOFF1j0qOn7w89XRT9neiQl5q1ulmcKonrNStoq0gcJJkpLwDmy58j1X9WIqqU1PS5agwBsr5EHUNAqU9yaJZ8xIAlHrHQQnLRDmCsyCAD4a4ydF6HBLeyPQuvG0/uogMxB2FDdHavWhnXz6cfJin+7mI5WPIXlHB6Xu6SIMjE1VoCRz/gz800n0eNwKxsTLCRbj0I+XplHCkcm5f7gD5+RtKgv1IXl5oyPW65my6696T3ilbP3rUYlWxf3Erp22tgGWOGB0OdxsXPsxoCMGI/mx1uXt8Qx4H1FySQTBSg19oYyYU1/8JY2Scc4zhCjpKmSMBNxrKukPBUxlsAo09fuKalVvIXFnq0j84+UE9adoBo4y4AdrwdqjAT7ImOWoPT//ItDx1xDaWOnEnG5UN1Vx1ZLjZDTw43/7gyAV1i+O+0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vurt0trt253cqr586fpnz2a/M7w5XzoIUO9AXVLP0wxY1ygaDlBCY8uLAbrGd13fnZ+zYv6fNp5C+sZCm54846dwOFbkAK4Jskj3J/mobPk91rnffGRIbhmJG4dLuYtRooXP7Dg55C3bLhVXRTPYHHRcl6g+gVGaxDCI9ABBfSg2O62Cb/ITAEUJGkkfAW/yXX8Gf/3KtaSTiXEUVO3t7k8ZSla3Ar27oTuHbsXWUma9WyFoyBqnZf5m3bEOrirc5bDK9DU8LDtgiOf6ecyUxXwm04PFR3Y1kZxyGsrAhwSMfsEfMwuBhY2DGLjrj1omDUAQ5/7lxfmgixWvqCztUN3iiIfMEX4UKgNe7AAjYrkHtc0hi5Vg97VJzCmFLMN0RAEi6ooiImCqm2ipfY0JGnfeTjdAgsns+GvIw1C/9ExbF3vDGLG8EYhcAgiVjvva
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:45:39.7399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02ab705-f561-4fcb-a0b3-08defa12b5b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

Changes in v7:
  - Fix 5/5 commit text, and move change log out of commit text

Changes in v6:
  - remove buffer alignment from config space
  - rpmsg.rst: modify alignment related documentation

Changes in v5:
  - fix documentation about alignment of the buffer size
  - change version field from u16 to u8
  - remove buffer alignment check
  - Separate buffer alignment vs MTU of a single buffer
  - Use buffer alignment only to get next buffer address at alignment
    boundary

Changes in v4:
  - Introduce new patch to modify rpmsg.rst documentation
  - check version is always 1.
  - check size field is same as size of struct virtio_rpmsg_config
  - introduce alignment field
  - check alignment field is power of 2
  - check tx and rx buf size is aligned with alignment passed in the
    structure
  - check msg size is < MTU size

Changes in v3:
  - new patch [1/4] that renames variables with clear names.
  - %s/rbufs/rx_bufs/
  - %s/sbufs/tx_bufs/
  - %s/last_sbuf/last_tx_buf/
  - add num_rx_buf and num_tx_buf in the documentation
  - change version field from u16 to u8
  - introduce size field in the rpmsg_virtio_config structure
  - check version field is set to any non-zero value.
  - check size field is not 0.
  - Remove field for private config, as not needed for now.
  - add documentation of rpmsg_virtio_config structure
  - Check for error when retrieving MTU size in the sample driver
  - %s/mtu/MTU/

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


Tanmay Shah (5):
  rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
  rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
  rpmsg: virtio_rpmsg_bus: get buffer size from config space
  docs: rpmsg: add virtio config space details
  samples: rpmsg: add MTU size info

 Documentation/staging/rpmsg.rst     |  17 ++++
 drivers/rpmsg/virtio_rpmsg_bus.c    | 146 +++++++++++++++++++---------
 include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
 samples/rpmsg/rpmsg_client_sample.c |  20 +++-
 4 files changed, 176 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

-- 
2.43.0

