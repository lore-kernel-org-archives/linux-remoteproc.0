Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866243F2101;
	Fri, 29 May 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073029; cv=fail; b=TebsvkTsB4xxo8t9ID7XVtMj9KIj+t8fSsVEzojQXB8/1iw5fXXa0SFTkPXEhVrif/Dk5iervmaYqsuV2Y/owfdRm3MOur5aR55ERBo3D0Qe/wZAJVsdAMZJd5Qt00S4jju650NVj59OFFnXgQXyh0g4ixq5GsscDQTiR9o3CA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073029; c=relaxed/simple;
	bh=iOshqkp/SJpSE/xdnXgQ4g3txCRhpYTlZs8uJ4Ljp/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g5dOHCVRi79408Vp6eBDrc/B/1QdixANHnnO9pX4SblMFSxykcK2zD25FOsZrC/YJCOVIUxTo6UEcgxLaOmLVXNxJAzlEKOddmaBcdxAr9E2ZoC6blQip7BJlILoH6LNsVkseTGcm7jCvGlMuSwwBeyHxUghZdHwa/67zr8ke6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RH6ZRcsY; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RH6ZRcsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZex/3pM/ZB96J+B4h4hjeP4O8Ksn6FIoOVZ3wu/Xe0yRXO7nL/ZFQX4yYMjzIfRbrZ42RGvZ4iyxUYANZtZlAYAJhL94/M43wYC17BfEhE5hSdruIUEM88NUgZmMWlW9TE2J9XkzzIu9zF+syIbqls9KwW+3fDFhKS0hKF5Xjk0OBxBBk1fiUtdrQWPZwuDBvhrjvdah2jT+fjTeCaL/cU2WQaJWbyvcSlnQSFKWzRNm2kS3hEWyXv2FD7T1kx1O5nfmVOfdffA8sQl/90FaCneLwPQ/4NO3uCnalHzQ5ngARAnRbtzxqdS2W7xenOpHz2Gratf6wlKrS+J91vdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1GKw+XIKHe4aSDArXpnanHUUqrzUrmlwAHL26g+eRU=;
 b=o8XK9pwkJbE4K+hJI4MEQ5iXFbvTp+Qdt8sIphvbmgZaJmrUa+0//ISJEScwYgm5ZobkvkCmhKNY+DiwFEEBuwK3+l71hU/2dhCwZpepYkIh0jPEUPWqRSy4/zO+QujeJ36QrXYv29CZYb4xR3fIH070y5qB6dIFKPUdCdlcEn4mWnu3PS520n0YebM8gav2fVs2rmzBhO0UF3UN10Xrjl0hMJuKgEFBtm5WQDG89UZqP7tJGvn8XANi98rrFcR+2nbGy3XrHFflqoIs14+P/xGn+vlVBGVRVw9PHB2ehs6zw+wUM4r6l5fMjMnEttMfXLpnjOTz6QU/nP+RH3c+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1GKw+XIKHe4aSDArXpnanHUUqrzUrmlwAHL26g+eRU=;
 b=RH6ZRcsYSRcSUvG1s5HzQ7IjlBrz/OQfE8a70GqaBrbIpI0C214I+DynBxm++Pvy/O+AQCd5LWauJxaBSiaAOXq9sx/h99qeeJ1/DwDTkqIaK7eFwJ8YnYJJ33w6vmI0WSgUeU8vJP0goS3xWShmn2+2fPCGTl8xa4qFrhUM3Fk=
Received: from CH5P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::24)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 16:43:42 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::56) by CH5P223CA0004.outlook.office365.com
 (2603:10b6:610:1f3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 16:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 16:43:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:41 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 11:43:41 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
Subject: [PATCH v3 0/4] Enhance RPMsg buffer management
Date: Fri, 29 May 2026 09:43:24 -0700
Message-ID: <20260529164327.1827121-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 21aa3e2d-d876-4187-bd39-08debda1715a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	MF78oVqOFFbeKZ5MdLnLMl29MabB0xQ1P4PNQgfKdSaGjS7E8EU+aiM/rUaKRnxOxc2J1nI7sYBamzGJZ/eHdGX04l/Pc5yXIRnCbK134F0Txu85bVIdkg1bt3pprvqLQQavyaYwZS7AE1yedZmG4gTnKzzoQlFQCicKAc2zylWlp/hJ116zWrDIGcInmnhmtiq7OQip0mvDh+77FVNELMHvH6I6p6bahTDpONeCD5yLCXsjjDMOmIB3E2Dqn3YgL139nn902vE1WL6aKtYYYbc8wFWlIyw1X/gKzzDUbMusC1Kd63lGoGJL+SZvsSFqIh70G4/c3FImUZhHjH7GO2kY76Nn+Lcx5IO5szA+yoo+Zb7lLWFaWx+6pfdiROKijBnXbgj1Vo+7mMgDOUewtKoXF+b3drO1lkZvy2ATje8h5emtNc8QKKHnu/RZNWDO7rdpFRFh/oyhvUVHXq/RGef/dTzZY0gtfC++9D6y/w6uA1iWBH5YLIWFR8w3YmSYLh4YJdl3t59TI086G15twr5wcO4ofdCCquNikyCjf9xcMtMqq2toA1aIqGGQrSZ5dHS5RLYo0kwg+7RZO3dqMnYBwDgwJJlZtGHwe/ItopUHHwXNiNkPrgyjakrQhwjKQKGkkSCtaw4qcAJ188SZlAXjAjBnL9N3mGOt8CZb58COKHtNj214mO/spBxkrcLj0RKhKQ//dTif+JnIlySykkdNwELhIaNdCLgzpURIv94=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(13003099007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xEswTJdW9xAsm3S++/TYvL/46whLA+56ci5l0gAkAFkIC6mtHDI4dzfB8LIVzDkR3cTbBkywxaRSMerAwdQCpnel7TChPiVsOCNYvaHZERQtq0XZnicWcDrteJAqNnSaYTqGPpzDJDZPjA17c3AKE26d66y2PWULrM9UjSzDg/XI1Ylev+a9IBguPwzCUMeXzU5F63jlMx1FXaEtkBU1LGE2mVpnDIO8QKDlQ6nN9/tYHvSH4BI58tTEH751tutLGtH2FCPuygybSL3ZCvpCwHyzdW5O1Pcr+DJikhvn7cFNyQYyquCE+/VdkNCRx1q8csdhJZ5oCRZHDUMUwKyZNiyjKdYfEgigaXOuAkvNgS+XD1iW32JVzoK0XQGVh/egrkas+/PLvK6pvD39xirl8dTG06BA6dqYVQ+nFlJQexljOCG1o2eeaXuNyFo/QQHV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:43:42.1611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21aa3e2d-d876-4187-bd39-08debda1715a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120

Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
tx directions. This design is not suitable if the payload is larger than
512 bytes or the payload is very small and doesn't need that much
memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
size and rx buf size from the virtio config space in the resource table.

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

Corresponding OpenAMP project PR:
  - open-amp library: https://github.com/OpenAMP/open-amp/pull/684
  - openamp-system-reference demo: 
    https://github.com/OpenAMP/openamp-system-reference/pull/106

Tanmay Shah (4):
  rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
  rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
  rpmsg: virtio_rpmsg_bus: get buffer size from config space
  samples: rpmsg: add MTU size info

 drivers/rpmsg/virtio_rpmsg_bus.c    | 148 +++++++++++++++++++---------
 include/linux/rpmsg/virtio_rpmsg.h  |  34 +++++++
 samples/rpmsg/rpmsg_client_sample.c |   9 ++
 3 files changed, 144 insertions(+), 47 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h


base-commit: 85842b61f64cac93d28e129d35193e329d463fd1
-- 
2.34.1

