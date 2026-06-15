Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816AE3B42C3;
	Mon, 15 Jun 2026 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554826; cv=fail; b=HmplbAljQpkGANt8zEd09btvzjC2F7+r8aFq2MfsPjrVDd81rWWF6J22LgVmBJxx/DxVZbIehYyQTpv2MNNhwWotWvinOXjSUH04t1cY4PU3PUKtY8Gg9NKqaG8Kls2tjHaaFJ/65FymfM3myEf/5mDWvZdVWfIF+k9rdA8RbSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554826; c=relaxed/simple;
	bh=WT3DTRekDxPhSzKAd8ci86oXAJqQ/Y7JYOsf4GQNvnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUaRHGEX7TvUpJitcSW/j25pmK9J+wXf746BAwAk1x4AKo0pOrQmR76bVqEiK4WGbJL20X2u36tYgulk03a2lP+xeJ9MtZbL7RSZ5VITSRckouDn6hxeuL1hOdUk3z3oj9Ot6OqcL5Kq5zqM0OT1m8kO/zbIBiCxsuW2jPNdo3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q846wZxm; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q846wZxm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bICHnRIUI0M9JB0D1+CxzA3OfmdcsbIy8SE9riOl+IU9xZP/aeoZzTQrhnW/TrI5RTY1sQY4YLyXKu/o0j/5Csx3DUhjwBnh2nOibDbczCvTmIU+v906IRmnwDBPuy5UIi+xCe0FWoIgfm4/EDJ89IhCDyHBF10fW85r7K+7NgzRvvNpNQVJpFp5nTNLaXasAqjSQQNFbTfyLgru9IsSaptempzXsPXSDZ0J84UhHuYUPZEWpITdAG/WVS95yM9NOxJaJQMpV2LywAUCn56JKhnOoJeQBrQ77h4CSjf1M7AwtA4P49Bf5atnTTDgK3XheM0RJ7nwk8SJA1WsWq/IGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSLlhg1KRwpz44YtErOtiTxEsSnF0MNnDZkjQ+YM9dM=;
 b=kcv5meb/Kxvt9H1h3TXRxRr/CWALqbvuU45ScLLlqqBP1/ERZf2CowRl+BW0USl2b2I+BhEo9R4iZtB+HrbdM+hyQtmCL+5HTC+E6R0g+527nbPUZCaOISTnZ0+oBOq0S7+1jwic1KW9773cw749r9fq1uA63zLmRekJkLa+fasgBGy8c8Q5K4Bcechmv8/22cZJ/D0MtngTLOEwW/n08UwUqzVnZNZHACMGpBD0ddzx2onVxv85EEGRIEMz5uwZd50rFhSSjvR4Cd9QbGSfa8GHh1knh5NFZ95k0A+AA0wlBC3jVpSewW7DzygeTRofqPqnZ+nOOA6sQ+1ZHVGDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSLlhg1KRwpz44YtErOtiTxEsSnF0MNnDZkjQ+YM9dM=;
 b=q846wZxm2i0A3yXCafXiBjjrn4GIJwuhgwP1n4bgrlZIvadbf6Af9Plg85/G2wkvB7ulBkoVnqnH65WiEUPvobl1PEr8/dpK63AQncq8egn5DGgOokBfOiNNb8+PKuCaUyyos/UqkSGAtvzUseyffL/wmt/P3aWtIF+IHroVwzQ=
Received: from CH2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:4e::11)
 by LV9PR12MB9757.namprd12.prod.outlook.com (2603:10b6:408:2ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:20:22 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::74) by CH2PR02CA0001.outlook.office365.com
 (2603:10b6:610:4e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:20 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 15:20:19 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 4/5] docs: rpmsg: add virtio config space details
Date: Mon, 15 Jun 2026 13:20:06 -0700
Message-ID: <20260615202007.3484668-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615202007.3484668-1-tanmay.shah@amd.com>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|LV9PR12MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 3635c426-4974-4393-972d-08decb1b869d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1x1jD0L2bNnp92tpKS4fMZE2AC25J7IrM3ZqK+jwYv4ziZc6nhRJoaGDORW5I6Ewu28nk20slUcwqwF9oqtmXYuzLRtgad5o8RsiSwe6fSlhBWXWTchSbRpv0VeSPbmOdeGTrLE08JE50l7qVV4ITmGUky+tlzkxv8XPzUVZSvtLfwpiYO69mKBOBxQroN1UH9wnihbiQ5ophXEfQNBF6KWqxediUL/E9exCodWbcrJCCdxjk0VZeY3EGEgeXlWXPattZ+2JKLB46Y95TjVnZrnTsyS7P1jLdg7ZxT8aVEe/fFcB5f7tmNM0xicRC+bDSssJ8ZnSC60+CcDxDB4mIimIc983hpm48cyS+Z4c9eSsLp0d4RUPFSIFzFsqQ7dY3PLI6OPAxosGdwj9Sv6ay5AZDmbuE7YHQ0QJL9MSKVQ9eYCVa2dYNOAQ8EAnSw6K0K+EwYZ12mJ5KOPlO52rrAgJVUAZXhiNaf1RwtUtPURAsZ0C8wxEUT+R9vbdPZSWyeTlsBXEDjKQYI+GrMduuBnAxJBzVHgkyAoIAP9Rk7Ytz76Sol+ct4YaDrzOjEKFk+Km/ufoxiIv2GpaHZBqx15LJnPnlP4en72jiQdaw2OPXblVd2UjOp/afTSycLyE9djGBlL8Ys/I6+2Kal77Uk7tcbXURvNdGSC3fJF0/HeUCUMN+2U63QFfReIHG0022OpuC7TbJ3YADG0IwjtV/yU7e7VhCZsOo21EO2bdan8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XR5aqhmjgeZoGfGtkqiExIoKgreuCGWdNMEPZDWPcDyDI3Vd+Q23zaowB8cx/FZ6hud/0SpvaDB/fbF/qd6prxRDoElVcCl8e2rIIVkEFXprS5WcnADjTg8QkKMWVVWVS2TpJp85mfjqIfYboyA0Ybn+OvtG3sKkqWNaRhC5to812mhwmr09DUYZUUiOf99ei3Dr2f0CeUaJfq/tzp8EqehXaEa00q1rUGLmSzYTIXCdxhdcklO0BxT2j86PJs7BZQZQGlkf3AkpkZ3zu2PTnZQai4SbmxS8qe0P58WbkSfePQ3DWdIJ+qORxzY/k+CUT0lOkww+zz3HENHLUCRkMeoTAB/mGpCN0YiL2H3weX94QBuzhfRBtgCjvsHVfDZIcyKAX4RhsXJMprXcEpBC//fc1MBJJ942SpszY/oSfBxFodxGqdexEP4kXFy53SXa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:21.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3635c426-4974-4393-972d-08decb1b869d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9757

The virtio config space can provide single rpmsg buffer size in each
direction. Document details of the configurable buffer size via virtio
config space.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 Documentation/staging/rpmsg.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 42bac1149d9d..c06602e169a9 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -300,3 +300,22 @@ by the bus, and can then start sending messages to the remote service.
 
 The plan is also to add static creation of rpmsg channels via the virtio
 config space, but it's not implemented yet.
+
+Configurable buffer sizes
+=========================
+
+By default each rpmsg buffer is 512 bytes, and the same size is used for both
+the receive and transmit directions. Remote processors that need a different
+size (for example a larger MTU, or different RX and TX sizes) can advertise it
+through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
+feature bit.
+
+When this feature is negotiated, the driver reads struct virtio_rpmsg_config
+from the config space. This structure provides the size of a single buffer for
+each direction (TX and RX), and the driver splits the total buffer space into
+TX and RX buffers accordingly. Both buffer sizes must be aligned to the
+rpmsg_buf_align field provided in the config space; a value of 0 means the
+sizes are assumed to be already aligned.
+
+If the feature is not negotiated, the default 512-byte buffers are used for
+both directions.
-- 
2.34.1

