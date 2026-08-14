Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75119355049;
	Fri, 14 Aug 2026 04:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682577; cv=fail; b=E2MnUpaNzfi1Uc/J64fjDlRG1tZPmei6YuSWPNw19VEBTLP1DesZZwJHXInr6+3vLunYTBLvt/Q3BL5D3JyBQBDYNWKXSNXzKEUcetBEbgusgPX6E4xjEY+MuAbQASx/H70pIyvmYKH9e+EDCelbBxNzB8w5KWfqW6QJTngDzfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682577; c=relaxed/simple;
	bh=iS/SJiQlOycSyBncMugjFB32+pAVTqz0hL7pyVwjavM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tn0fOTe8JHb6SvPglhgrNo/W54Il1NYvxV8GOmK/PMXYECWOta19X4D9tQymV2m4NDg/KaTVCijFEXuwnO9P/w2HkTKPZBB+SrVLZ56WBbAqs8POAffvEuAh6yGUeMKDlQFVIo8aQdZnT3Zay4Kw90uQ26kMEojV4y6qPCMKga0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VPai2wpE; arc=fail smtp.client-ip=40.93.198.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VPai2wpE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIJXgLhSao0CRGi49Updz4csfZdV+1E4BToousD0iB2ax0np2YRpcwzcYRLgFcXBUqLXkx0CdqrFzXfxrzngTG0NbAwV7KpXrbFX8L0zdFbTu1Kc6XDnuFwhPTs+lyMjbaB5uBbBUUGxaniVxhLuK8gv8Dxr1EvQJ2NredvbFKiG3VjWoQtRE3Z8gWUYaaI+rWAWrGhQMNnPAyad1Vl3kO/Ih4IA7yChTQQs1kEF9zA5CdDSFZcQTJajlKxM91i9KxkJWzKep1jJz7TewsaCCCWEIEKbhCDroh1OhYBoPaiENoV/NCfQz3xdA5EzC3PRjsXZmVmUcq1eAdFGtdnvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RWhds3PGlU++J+g1QHxRok6dr0OiNgqa3ki3Rj3iAE=;
 b=qe602wiAqFexmWfrJfNbpXhuAyVrgKEH0yy5XKcJ5wCBTXRVtZkGvdpbNihYh2VrmS9sfKypZyExtLa7KKXM3oy2aA6DgWh5pRFnuFO6I7g19FVnHA8JJXnxiNQZP1/gZEDhtMCQ3/k8MhO6/VzJhP6/DHI/Og8GhaMX/+Ip6q/OzwyHyG5Oz1KqnHnX026xD3Z4f/fwYGvU+TSYreV9d5Fcr1TRAKCeFr/nbSR23DwMtIe58I2DV1E2kz2Eq86K0sSK9dBUpTHeu/A6pPuJJClL56XHbjzSnFVYznum79Zoy7cp75SEzSdua5xtdPJDViUiEOirnogOHzplORxO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RWhds3PGlU++J+g1QHxRok6dr0OiNgqa3ki3Rj3iAE=;
 b=VPai2wpEXB6tvf3WjN4852GIrRKy9342fAQRt9+8Maki1ucn1S8CD4bJF+PkxlhIwPaj0MARYKMp8oJFeTSH9eIw12E4IQrcpCjP9p6m1FbcD482FbUACfKSe44yy6ObXz/atDnETdaI3FySxWe8NvAQR8oBXqFS7WU56tbi/7M=
Received: from MW4PR04CA0365.namprd04.prod.outlook.com (2603:10b6:303:81::10)
 by DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:42:51 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::a5) by MW4PR04CA0365.outlook.office365.com
 (2603:10b6:303:81::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:47 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:47 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 0/5] Enhance RPMsg buffer management
Date: Thu, 13 Aug 2026 21:42:33 -0700
Message-ID: <20260814044238.518296-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 2191da35-0fff-4e02-d2e6-08def9be7f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	WcgdV7dzpoAKP4aHAZ2IydaQX0dcGE3XVa0r5mUIEGX0o4T4IhakAnvP9BQYp+jI6rASiKkq3XMs/5h4Zd8MDc3j4wu9PpZM1Jnj2yqg3BhOUpgna3km4ebXzH4zEpA8V9SXqgi1yWPlTcifjiJ8BTwTPBSAyA8y56xIzMqAcKO+t7h5DbhR3uaT0PVWXwB43zyhQDmRbBS5z06US/PdXgWdKOLxrKmt0QyLOWyWrXmTzYZnzXygpBnodATpBed0WGCrZ+rJlNH+6iA68E7redAleTwxy0KNmnItIlj9ze8aLh7yEHJfYmImO+rxYyJry45mPXxcQYLPX5qSnVQWsT436cU5fmDX5CJNklIDQW/zcddW7efM4pjF4LeTRIsAYGT9oHbcYzwboYRIdm9hoZcBvSgjoW/5qgU55AtEwA7U10faTM1RsCMTv+gw3kqWpyqYrLsYeA9OIIoVH87M+CNYLuEsDVRSB1ql6jCBwUtXW+nqcWxdRIPZ4uYpFvxjhAU4EKiKtxnucNXpnkJFRCIPdgYPFDUVhY4uJGwzk8yOEWjp3Ho7s2FgKpnHD/qwqU+ZLtdZDKfqiVx15ukndaOBxW0rZdlKoO7n8zlK0z3Ml0rusbFYWu5UqeE9Jtz9ekth3K4Vf4m0UuKxJ9XBni2n8yfVGYgz9BOEQzjxP9hZQIRmNbORIiFaNXS1yvIW2yYSe/L4Qjnqx4OpDp/ZXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8iTXwyRNPFWCu4K8zJLu9/ZW96lF8hxhpBFSelBUKKYP/VTAQj9fPef6g9tF3pzBIipVGbGnGS8E+m30kYkhb5ndBOtrSKih9Ot8WsIEIafHNsMSp/S+e1oCPPUDJf6w+KmtuRtvkMWxLi1bilY2ZJEMrkXC+Q3GvPJWLGj2S50Shf6Nzf2VNLNgIMaLqI3GuMfGwx5W25sUeeGAy3lNyesmjOuRB9yds8X+MKVfT/Q+KWxKdX5goQAcIDhz0bE9lk4fbdko9VOfDd2lGmXkY/6xY4WpXD/M1LoeK5EmHNtiwC5k1ubGmuGdeeU82N3atwOcmI+ScJVl8Rkk4bZRjsxV+JjYzrkjDnB+gNpZW27cR+DAP84n6fBaUlEOJ1h79PybJUoP6ixnhNYn8Jg4vzFphRbu/xflJRNXz9imRzFUXKs88f+R6xYakr9Z/uCz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:50.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2191da35-0fff-4e02-d2e6-08def9be7f58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

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


base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
-- 
2.43.0

