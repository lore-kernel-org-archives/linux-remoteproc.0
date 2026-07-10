Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39452E5429;
	Fri, 10 Jul 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711723; cv=fail; b=jcbvfC9fR5M6NZFjhJfN1eo2qbU/C7TfGOhAR1ZhHPtfMdiXRb3IfCLiGCc4konvNPSrkQXkt79iAdSbJtSXjpEV2ZiwNuzqbJT9dS4waisx8qh5Wv3+lAgY6JWM9y94VlA4TlZ3T9zpRh0BeQrjer8zBxwd5gz5pj9LXoG0FOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711723; c=relaxed/simple;
	bh=weFlAQbFtITiXBMr9acbiFsnYaq8pkZwTBC8oYA4JsU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n7faNoDcGRiWeX5igrSYNqHeATxcSDW1h75/57stDXytTof8cEg0cHMKUuA2QvSRRxxrUtEgYVq7JJQ7WIa3rdO1VoSWUtj076uM6sqNrPXQWk9XDB6KUe7g+7FkCvoxze6e2Cv5VL0s3Y30Z2sOjq9GELqPPQzfYLgC+eljLD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MxP9z641; arc=fail smtp.client-ip=52.101.193.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MxP9z641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+2HZPGIw9ISm/mpmcIOjlVhWVyzL6nAfMgrSVNSr8esIt8/oazlF2Mu7TFVfEkx46U9+IH1krWiYwJqlIbwJjmdiSP3fF9u2NVCt6uOE6L89ZW6BaZf3gQMuUFjeJx2HyECEW16oM3UlUuFGMGiJDvoDmbDHo9Y8+yFcjawiG73Ril8WUwpNxDxfNOoP+pVXGYYLscuSSbGzgb1hBuOwksCmsxHotj44COL7q3Yf9xXxwlMnG2SzdYVzT6Jde8k0rkoUhNHry3rXxyVmC7u7BxhFV6p5NDLM8Y+1XlYKplwFiApzJFx2GmRjnj3Jgyxw9aRBIm7I5nM9g58C3fFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3uJylWLRM/6jZe+aG/B4y10++tj6ZGx94ffiDklnEE=;
 b=rsY0GZspISBCNCg4DOT6tI3XxObmZm6wmFnLjNuaFRwZqP95Zuzr2AzKSFKBAwDs/ZcM/GXj6tSOJ0yQqpd3VekCnw/ORi5/wOdH6LUaiimNjMMT1kxmgKt4fucu8wIzpwyLqEsC6AO6k95OcvuJGncJut/NBR7/SdpC+wUX86uusiwRzAIDv+LO1o9s9/bmN95jhJ68B2kMQWaqbHlO3lXKHJ0gKaY3noPXxD8Y0rkZURN3Mi6i630Qbl1kQTWuHsIP8dTuu52H+lsYHs14EKHJHX2KVbd1dwZoR12YZgSpvYGfMR6PvXl9TrEQ8D2RTr/PVtO/EqUtYNDSzNvnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3uJylWLRM/6jZe+aG/B4y10++tj6ZGx94ffiDklnEE=;
 b=MxP9z641pINxJf3Ok19/xRjitm5fNSTiLBWv0tNf8Qcw7lDDygtw9TaKiioA2olVcQyqzd5kSDNL65uvF8TIlMzSPv3Fxy7tbzncBzDLHz9e5JM8+ynVOYPsKSOz6PVo+k98CSYMpZFBW8DV3H6ii3ZrcJRcbZU8LDo63myX1cY=
Received: from DS7PR03CA0291.namprd03.prod.outlook.com (2603:10b6:5:3ad::26)
 by DSWPR12MB999153.namprd12.prod.outlook.com (2603:10b6:8:36e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 19:28:33 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::a5) by DS7PR03CA0291.outlook.office365.com
 (2603:10b6:5:3ad::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 19:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 19:28:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:33 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:32 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 0/5] Enhance RPMsg buffer management
Date: Fri, 10 Jul 2026 12:28:26 -0700
Message-ID: <20260710192831.3440427-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|DSWPR12MB999153:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b9fc87-c5d6-4a2a-7cc5-08dedeb96e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	rmuVfX03MyqjkSJcoeaj7FoCxzCi6ZOr0q1SWnm92PK1Rp+qs5UG5SSbtAf8sku+kAx2HR/W/E6xQmL4AZjdHWExV4yorOI/khyrZoW7KF7vFVPIXlttYpdch9mUtungGPqtJAHqLl8cgG0iVryEcpzqkDVJ7HcYgfgZU/K66LnxLGay+RR7XkPWywaJKzilAbwTmvshio5cAhBZ2qMP/zz3byVG0m8pWcVhAAu6OZBZ1+UyMEY5UCEM2EJIU3tapDopjmPKdVguJYK5cF5sOLpoGb2XG8Ba3/UbuDL7FPziLkAajyTAMAazhDxjVBjL/qw110T1PwVNiglNDQsWm+jI7V8cHbI8pqQgg5UWLAFBACEIdlBottHSNtlr2kT1JJwR7s31jYs1moYJPJm0PkG+pEawf4+dI+qy46PvOosE4xWaihmW7jVOWveME0bgW29E2LyyCganwCf4Q2kD5QfVHjHoeHuK+rhUT62jLvggbsLg1omQlQE3tNJPAoWg3FoySuSikI4FFdiGhqAzuIBO6QGFtkQx84AAjo13uHVeiylKMYA8nZsRrfv13eUSdy8uDjVpZd8Qi5XXl/M2qmnD2tibQogf52mwp6DUbO6mNue9gOVSSDaQfh8VZmNXf8lKba44X0s4dwv4HDO2TNHsWLxnsqJekYFdnvcYdIj31luhkEOEusZt/H9+cVGs1HJRtpupGnOUnusfVk7Dhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UMWJqbPPQ3aqTV37d/YQMD1Jxtuc1xAT+gdFTjR9rA+NhKquvGL1rYET5ghDHs/e5ZgdjK0I6ZcBoc1d02vvnJhFckavE/gRdikykRnHLakv5NeSbWl2+mf9HKNF/QCpcOpZUAuOoXRqFGpMMwyAj/LB+ldb7l0TGQL81PaLkdqKSzYEIeTXNVAMpcLnMLI/jOpxWrxThb6Bt7EGshVE380f8QdyCJFRt+fvmK3PPqlyeU0u78rEZLWIGZMkWoqc6s47ln5q92BxvUVySAHQ21C/lvSGLVLvn1ssrYdF+Iz+im5BQbWTaUT8aQmQR7kaGVkYcXjWPOp0ObsAGA9bwZhZ5c/E+7/rR9UjOU8/OcrVviVAOw6JF39xFB4ORpdg0EQzRyMKy0/lQezf4s/chnFLUa4BABQRkYcjPOXcwpAJlzKVFJNQ4uwz3FhMdWO5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:33.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b9fc87-c5d6-4a2a-7cc5-08dedeb96e81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999153

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

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

 Documentation/staging/rpmsg.rst     |  20 +++
 drivers/rpmsg/virtio_rpmsg_bus.c    | 186 +++++++++++++++++++++-------
 include/linux/rpmsg/virtio_rpmsg.h  |  48 +++++++
 samples/rpmsg/rpmsg_client_sample.c |  20 ++-
 4 files changed, 226 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h


base-commit: 066e0d00bee1331abd2b2ee51ce4b32a0db1b969
-- 
2.34.1

