Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BF47253F;
	Fri, 28 Aug 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929169; cv=fail; b=auFYSDPhUidb7a9d3FHw7/OvSC/wObOtV3URihy1iTxDCXbR5J+BD9uxBV8M253B22LUnLnHncEspjgeuMUid+PLOOPlsjwLKJ0QYyjK3CyhyFRc2d7UvYfjjkdyMcL+0HdLSauyvVZvf/FIRgiqKrAy2vKBxuHlu7+xMeP6aMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929169; c=relaxed/simple;
	bh=U1O26ixsqg6TDetP9Hl7DD7ZBLCFDgdcPZ8iFREw464=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mi4pPk6rACU85hr3UErMP9x6/tRP3pHG2ffeobYeRBPHL67Z3EPUi7RkGJJa+JZfkWPuHXqi6u/4S1wtgVP73vnj5MTcHCxxicU/XEJZQ1qmEd+ny1Y7VdriLNtuYcpHuCPjM8G6uYz0GNqx9BwpD23cjLNTVAxwI/iEzVXtuCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FYARygvf; arc=fail smtp.client-ip=40.93.194.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FYARygvf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skEZxc1RLRsCeCBEYq9U1PSU/yF7LG8s2Iio4bZcjaHpvjAoRATZwSRrBlEqmw+cixKbQtLES4dPY7ua21DkIEmOnAvMYca/kQ8pV3d0FYAvJ9+rFQR/eS5mGJsVAN3TUAMmzUY4DVUdxzZCOviFTT6ld7OftTb824v9cVCFWlY8uHwqE5BveO5KNqyY52Qm829DMqWubOH7usVg191xZY2d7nU3h3vFFvcgGSFUvs1dqY+JjSGPVPvvg7lTKPVJK195UFz80kHohke4ubKBpovzOCOuHYoyDG08xbR4MAetM/Pkshv+IgtnU/1f3K5ua3SX5SjWZkzVKctIS7rBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89+MCQ8UbC+6cm7ZhEfY8zA60AxMBDyWTwdMwYzwipc=;
 b=tR61jB0LunXdYfGOa23dgBD4WNDKNyugiG7YZMoNCBvIsrOcOnAaKwakFfZPDaWA8UsBF3d+jz5/s1H9MZBF27LgVD9jgGJgeB0XsOi8rgGAxu3/IQkDFqsozZCpoy6GGGTS8jnyJ95zO+T2MqU5uy/t+FdQE1EXA8NXAt7+R8+fNUgoPE2txoSp4di81NhyxDH60onasSJjWoLBvXYNY552pc5vtaSPx8sUtVyKY1nHzwyRIYtdz344rhnAIgJEIapp2vgibhEW0hZU53Wc4shbxU5riRndltpd9bjLpfWubHhyfnInMkyxclu03qy2HNzw8w5mZVUm00VCgCQX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89+MCQ8UbC+6cm7ZhEfY8zA60AxMBDyWTwdMwYzwipc=;
 b=FYARygvf36VAPo3dFwfvZs19OfJivrTPF9PO/eydAfcZGYdO3bXhuyc0GZIQmVbFNEvTPAuxAP7v0KvBzNeOuHS9Zb6juwlFSQO2cr4XOxSN3tjWe/DT1jq7WzL0jDFUtCMSE672zNoP7ji68F98jZLapQCWcfebzKwC6oNsLxo=
Received: from BN9P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::16)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Fri, 28 Aug
 2026 14:59:18 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::7e) by BN9P221CA0001.outlook.office365.com
 (2603:10b6:408:10a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:14 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:14 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 4/5] docs: rpmsg: add virtio config space details
Date: Fri, 28 Aug 2026 07:58:51 -0700
Message-ID: <20260828145853.2843486-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828145853.2843486-1-tanmay.shah@amd.com>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: b93e83f6-f2e5-4a6f-fefd-08df0514ef47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wKppawuV04yGF/u/IX6kx4msKdhHHyXRlekFN4fddg5RFnCJSLjySHWr5Ay6k779ZdZr2PDTEg6mqHRxRkL/SxlQiFm6RL83VvqUlIMBmKHOyuUB6lZPU/g4EgjlKI2sAC0E43yb56pVo3CfidW4Toa0jJvM1+Gbn1a5zztq631Os3asKPhgOdbg3pBxkHowPIf+9AK0rUbxBUu6aRacNileCZdN+qiM3jHpnkykpZHoI6ju6DSi7OLCxqCv3o9wCkRCXTQDnEeJ9MPt002wHlF1giJGeQTgDTZFLrS/91jPST1nrycPcKXD5+fE0j4GvAUwAD5ekM0qvUWI+nOxbougCfn2Loj+BSbKbCfzuT0Cs3rz5oT6uHDr35rcvYUknW+Ikg2f9p6CmdQrLDxKuwHA5ikGlq/ZFNCmFmpfan8zpGA+vkw9JOwFWsyPYj0E1dK+8Q7i+ZPMFnfNwDopyRgSp/LNIFP24GKD898zo9Vke5VpVVwHgpD9Zlri81HAfgJzF2qRUx5bjQfQqA4ZXY2zgarB26w68c4cdAX7t1HytpmxCc9WHc/Ot6Cyj0JQo6d/axLZN0jI0hvGPH1HFec0E9Y2YiHaiiqNclF9LAoQigL3lZWsIOXc7Je8hmB1R0EhGNNnzok2tOToSI6lTS08hxrFMq35VOkNU5HntdyaXe3WcTg+qeYd8nC93fylyiVSg92GOAtwCpWzuywA7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3sCqZd1BFIRxeY0eZKRaj8kcxRodFUoAgYfninOKt2tny2/Ajx92lK6JtkzKNxOlpTYJw6Lyg/gR0e2wK0JWlYmXZidWSP79Ac30LAQYAQEYQTv+yhlw3/Sni51NVmfRO0pEroRyN6QyMPbk+QghUvb+TsMcqpnzC+Nijo2bz1duTwyFqk9Ulg1aDqGytoJZY10s4FX4z0nK6cWls+dfEcUvQ1W1jv0MlBgnDACMsqqFHeAjX5siZpzYkDT1ev5x1tJ3t+mSLAUrs39Npp2UvTVG4J2CkQ6AjK0lnswkj3vwS+3opWmuWh7nc+UoHYqUoYT/yVJNH+f18gsk6uHFMsK9zkScwgo3MCUfybHTFydFWtvvYcLr8G+5C6TmWiR00hcsRKc0EJqeBqM7BbHhfddRB//YkzDMJLIqR2WlKTBkGRt+qNFPYGNVY/hOUzHV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:18.1501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b93e83f6-f2e5-4a6f-fefd-08df0514ef47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

The virtio config space can provide single rpmsg buffer size in each
direction. Document details of the configurable buffer size via virtio
config space.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v8:
  - "%s/or differnt RX and TX sizes)/or different RX and TX queue sizes)/"

Changes in v6:
  - rpmsg.rst: modify alignment related documentation

Changes in v5:
  - fix documentation of buffer alignment

 Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 63612b7ee120..d711d1643bab 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -299,3 +299,20 @@ by the bus, and can then start sending messages to the remote service.
 
 The plan is also to add static creation of rpmsg channels via the virtio
 config space, but it's not implemented yet.
+
+Configurable buffer sizes
+=========================
+
+By default each rpmsg buffer is 512 bytes, and the same size is used for both
+the receive and transmit directions. Remote processors that need a different
+size (for example a larger MTU, or different RX and TX queue sizes) can
+advertise it through the virtio device config space by setting the
+VIRTIO_RPMSG_F_BUFSZ feature bit.
+
+When this feature is negotiated, the driver reads struct virtio_rpmsg_config
+from the config space. This structure provides the size of a single buffer for
+each direction (TX and RX). The device should advertise TX/RX buffer sizes
+that already satisfy its own alignment constraints.
+
+If the feature is not negotiated, the default 512-byte buffers are used for
+both directions.
-- 
2.43.0

