Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF23B6378;
	Mon, 15 Jun 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554827; cv=fail; b=YGeF+/enu2jdhBL2z+gRSx1AJ1HNAqUrL/ixcWW3hFl56DqgiUDLuPx7po19IMVTXKECStmW+VPhaafdbiQESQ4EGi8/3CamIzi/VDlzuKn2TgbQLMds4tPGTJ2k8J7ZjPhSrbY2LuV1AmqjG/kyYdZWKRQJn7LRn0V2TMfb5ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554827; c=relaxed/simple;
	bh=mqKUQPjZu5yzapkTIvhPdhJYa0LrHTBScTEuqC2zUyc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F582f8uB2AG875H9V4l9KxpWId4JNBZPi7WnHwbh0KgxScowTEUmajwNw3V7/ddwGTK1VDCAe3H3LZ6iL2dmTNxq+1UxTFHOuadezQn7B5XNKEQ7HXp6jaTClsxDhSdH6XlqW+hp7c7d7GsaOXLcEw3/cwqyN618jX0WBsXKbCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J6MYpqbA; arc=fail smtp.client-ip=40.107.200.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J6MYpqbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrj1mH1pqeaGgOUXnUDiHTdtXNQgEpQxADCrtdjVQ185pcXVWtH2aTZ3LTDWN6jkqYCWNGD0mxFX3HjPP8JDGw+5Hq4ewuMaHaX1CbKZcN9ou1qWuzmiLI56sGvYgdh3K4TjKxuPJA8sDntGSXG5DZmkOTV+klTKpBZq5hdAmI7QPRHetCVcAqaQv5gs5EBqUk+bTZieq0sxd+YIAqfi4WPTraBQn1utqhHq/1PRUwa5kG0XvJvc4qedh+KyiuD6nJeVyK91uEJc80vYzaxKnz7A1p2tO4LvFrFGeNMSOjCaMTnZ5SDPsNWTgtl+h355kChkF4To2O2a6mXdcy678g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqtMHMOrgnEG8l+IWDoW4p0aMU3RrYXeq6vGdvIVEFc=;
 b=qNXtce88075XAModoPclzjJYAiU4J+6DQHV6gDmpEMAQGkL+yc4VLQqgQzJg9ujNVqM9hvbchs0pqjTZK95Aq93sRnDZAKzrhyDHHSTouDTvwnzvPNkMExezkPcD2mjUojkHsmBG/lRCED4RQWhvlfvRfL2CW6WIR8uyZRgLrPVKO8bf3B4OBuIepO6f1WAbFY1TyuKVKqfCwCu3nnOeGq7OeJ0OvumI1OURUB/Kshv9lOBjtu6dKZjUOg7Z8aWcm+/GB8xLbVeMasvBZ5KvMD88BodArp0rcXPoT913KXGDvMNxVeQi/vm7F/dyf//SaGRjaKHkIHhrrJjIegnZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqtMHMOrgnEG8l+IWDoW4p0aMU3RrYXeq6vGdvIVEFc=;
 b=J6MYpqbA4Y5IF3AzQzGaUIbzg2G1jOG3yPKzsvREXzDr3IhRWIn3NVgQpnwohI4DQidHGnzq49UQXBPXWeNn2aHJbuORcdAcnlD59tVzkSgVEcpXmn24Nkx2MlzanYmjeNsKcq7YT6+JqTQXSPkxeFyxjJz2h+9ZiInhVU5xaxQ=
Received: from DS1PR04CA0021.namprd04.prod.outlook.com (2603:10b6:8:243::16)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:20:18 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:243:cafe::2a) by DS1PR04CA0021.outlook.office365.com
 (2603:10b6:8:243::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 13:20:17 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 15:20:16 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 0/5] Enhance RPMsg buffer management
Date: Mon, 15 Jun 2026 13:20:02 -0700
Message-ID: <20260615202007.3484668-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 453a70a1-c87f-4b2c-4e35-08decb1b8477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HcqxansaNttTHH46+D9JaCJgnPAJbqZHtK5mQ4KaVD1ASR8iw9FqLvqI+t/jvB66gbDIgT75AyCR7AhWIiTS4CgoEITPLO5RHVXEjGh1MMbTjjugKaMN/lptlVrP6jU7jG4w7VSQxONaxrt56P8AgcBm7Jc9Y8fndGX3bRHFQVGNcWN2nwqjwnUJPUAnk14hxCAJ9osDIaMpWQbIHvBe0RGid4O4sNBaucOU1CJRn/8ybx85AvvNJfO7hnzLbMPlQCRqJFrCuaC6bzi+BmUCwmQznV/eX8FyhXn4DO9MM6F8BlyNDp8yvhMf8p20RHSTc2fpcnFQ6IeFuZHdqV7QSg8NfMFEn4B1HquxhDypve/2+hUrBRlGnMtCei2a2YCQz86uyaqqG9TRi1mY7ESD9QrEKHK8IxVk/EUcymvOj5rP43cbvYB/oIAfXlxOMC8ViBV5nkm40OqIy8FnJre2Qzfw0J5Ox45tfmB8OqEXpM/GiPPgWHM3F2XzrchpstDEjnSb6FtUwfypiSFM9+E293L482fx6b5ixBXVgkFQdCcaBiSZIW4bkDB+tlvBDcx8j3sy0OH+JIpXm6THkzSVOjBz7BzYH9T4+DNcecuPOXg7PhBCTzPfU9bQ3pEbYra6Y9E9Ee6dVSchSIvbCTMYrVwP905dJgvnpFNCsf7eIc2WHB06LjjFl0lU2bY+rsxgTvqfjyZusx1oXY55eXzxOPVfyEHfWiwBhoSgi8dkVlE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	efuHvd9aLWTKp/JO6Zw+57RoycejyH8UzuOYnrj+xJ0RDmfM6s69TjGUPQ4Janyy314pGERObZyTi+BzlmlW2yzBD6uJlT7ZOwRSrsVjRZDGb/ltbOvVLoXXr4KqvexxLQhg8rJDB8B/CwwGC311E+NCrpqK/78vItiNfQdeqlXBMGdAeiPB1Wj9gsC40CxS9ALot5lPrXygkBRb8XyWR+4DYt4kOTwzLzu5TIsxdmK6u5vV4mW1+9izsSUu4k+4jObfS+KdOXux9+K0pdJIx6i3z/2a/AKNih8zs8N3bSSmNSeb85rgAzMPHgX0wdaR+/Uu9t/TB+dlAXbJUK3hsu2Ln1M7YAyDwZjkc76RpsaQbVgO92docWATVk4cb6JniaOM1o4+kAwWpjhxBCRZ9yPnckgMbsofh7sOgLgdpLO/plhw+hCoP8Yh+i55yJIh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:17.9310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453a70a1-c87f-4b2c-4e35-08decb1b8477
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

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

 Documentation/staging/rpmsg.rst     |  19 +++
 drivers/rpmsg/virtio_rpmsg_bus.c    | 185 +++++++++++++++++++++-------
 include/linux/rpmsg/virtio_rpmsg.h  |  50 ++++++++
 samples/rpmsg/rpmsg_client_sample.c |  20 ++-
 4 files changed, 226 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h


base-commit: 85842b61f64cac93d28e129d35193e329d463fd1
-- 
2.34.1

