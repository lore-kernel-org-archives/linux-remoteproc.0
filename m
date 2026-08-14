Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C37355F53;
	Fri, 14 Aug 2026 04:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682578; cv=fail; b=RFcTZuMtibLBiN9GR48wJDKFkTYLxmZlap+nhwWQpQav8dR2PXaJjkawVO1qXeGFWyvJQBWbQb3hmRqglhKv1yxgl/NUDHb1rvmB2ERd+jksZOjtBeFFJ8/P8p42H1BiJQ5ATrC143zl0CydPBWX5gOcXS0/4pYxVdt/dF12ZqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682578; c=relaxed/simple;
	bh=jN7M7YXAQVcnZh7dBnjGa8N4VyJx8k8w774qZx9sG7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwfABUarItBHK+4YGw5eiOrAAB9jmEHThnufk6/4qcOb0UCeIN+lrc0KLerqZ05pnu9WqxvIjXLBdVhJX741VL5/XO3qg2q4+tE+VUHQxybtkXs9vDySVa5Vf9XFPQa9kRyEhB5DdtHwYGQOFa48NrnBhV+h3s42YFOmTzigKjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rWUyeyTw; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rWUyeyTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYDQfJ2O02m1desIQ/+RG6haFrLMOsVQ0NK98dR+1Dvvhmn30dHxcjy2LdR++esX6VP6B3yNmbXzQmbn2K4X8BsUxI0eYrNGuy5SSkG+dpbGsjkXUfbod8tCSiBwZ3zVBvONI5DZ+hjcF54zjPIQcYk1B+9LHQ26nTQD0IRxAVTC4j+zwauExk6Z4H+gAymJEYkqIb9NY3Tf36Fc4CX0XqpsNCa4NxClv6E2fua+zuQxhEyTFyCY3ORyFwW20CPjtWXI0eY/B3hQDZwOWCktzgJX0IF2stg5Btzek41n68Hx7WNCkKD72nGye4KFkUy1u2qNXPZfRT9mVCj6vIM88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skFpr9cZTy/amuhbo48zxozsRP0Cs5Ao0adxqGjYzsY=;
 b=ceQI53Yz6DJEkGdRLDeDPyesCtSyGcSH/fBtiyMiEtz3M3Ny5SteJbd4BpXwUdAjO9AKP6GgU8OTqKizlRP21tcGNc/ENuXmpIlG7IHZmwrRGhWJIvWR7VGBoVN8q+E88NsGk/zC/YZlY1bvCbl0mTkQlpwBMPTXun5ruJmycmRPR1m05l+QtVVZ/6qtkaTrtWDDYx8RjDca5n/DVQP5x24aL5o7XMYtmY6TNy/B766qfifZQp2pEvJs47EzWmnuqDNW7iogtCyO/Y69SRSTJ7SBdF5t/rWruGZ8rsFMO0tfJaRtm+Y7y9NqhBfyI8tTwFHyRTjmWXigAdqttDXSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skFpr9cZTy/amuhbo48zxozsRP0Cs5Ao0adxqGjYzsY=;
 b=rWUyeyTwQ+gJsRxtl39xF6JD55TvFBMjxa978meSKAga9wWp+ZdHPsqkLBb/TjgCYlywB5O1CCGJVF+OaOyHqvWBLrGGtREpsHAqJIZxts1zcdfCpZk8rNZPpIypgxEfDyNv93kPsQWMuFDACJ4L4uHtbRKj6j/fn+eavtff6mI=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 04:42:53 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::8) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:50 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:49 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 4/5] docs: rpmsg: add virtio config space details
Date: Thu, 13 Aug 2026 21:42:37 -0700
Message-ID: <20260814044238.518296-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814044238.518296-1-tanmay.shah@amd.com>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 45471870-8095-4aef-d074-08def9be809b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/c9+N4c2JR/XqF6S55axBI/ESiHkbCoBVjB8F/NZLmBnmYpj1kvQzMeGUZI7k+jC+vmPODDuOHXJdzwFvb0gWdY37rZZqIvq3DNZQKfnDjoZ0vMTH6PLZuH8zeARp92oxw3wso9PespBOmy9hiZZwE691hKrsPE4Dy367GNeD6TVPig215VXW7LNpamvY2bUTaVGcNvfFVaka9XqaJ6NiVI/KCVtWXGmdf7c2ABp8yX/wmI4KgfZUrx4f7clqEIbSqEO6UVpwKTxqZC0jpYv7CEM5Vs9vg3myq3+xc8jsiSRiHov81IWhjpVpKHRdU1xl9BZtaG+hPdWLcvmWSYS/65tzZJfT+TxH1R+FXewSJsookQJgkSsz8OokQUiXxH8WVLJxaNi9H9GGmWlNAarGWXWgeqlbqHeEoX8pOB78iy3zhTewODUnkDEwBxnNhbql1dbNcZZrXbgNH5PoMfMsUkmLPpzPx1K8cgYwIPhiyREFCSpaRrZHBnfjbnBYJ7K7Sqg4iOoyflCEbYDMPpaJ0M7zjvFAYjtWaEclvtrW863fLBSLuci1DBouSDgfMj4vqgvKXomNRXFvQJWt4B2aX/vB3kFRsrt5EU7y2q1eASrixr5Rn2u3xEFr2Zt51nizQieGuyrhtqm6tSv7lkVnzlb4jOO5L0+vvm0dKusvE5TgzO/QosgE/5+l4cFGGZxO9ZkAhpJ7oRyQ9tcfo9LLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9NIPd0dLfGppEvxL3H2iP5nENeFhSLieOjUbqJXC3xxHrJZhf+W0JjNYhauOrC3mKgXNaa/l9eihA4B1EB1u+IZamE/796L7NimTjWf1NvFMeRViTKJz91bXZ8Yonfm6EIsbqUgM0bLB04YvOvju74xvZRufuVxxIFZ54oaNcAPKeHLQevd3TnhwaoIhI93ZKLVGqq84aKFSwH93qZV9DiUCC7Td0hadMUc53KD6mfWXL1PNPlV8lMBGhuq95QFljhif/4RA2Gad5BSjz4Jy5gmJrzNVRh8jw0c+BmSGdF/py9CPWaqmXsRfstCX9qqkfyG0sqHR9FZTLaZfigJl6IivOdn5xoZ9puhwnK6nCfYGPGTGZq30ajtGVjuvOtsVAVUwLwR3gfaGoCieuAr2AhXOMLk9i+ws+/n3BPlEHGd3mgqYn4NA/sTj4EgLjsxv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:52.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45471870-8095-4aef-d074-08def9be809b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944

The virtio config space can provide single rpmsg buffer size in each
direction. Document details of the configurable buffer size via virtio
config space.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v6:
  - rpmsg.rst: modify alignment related documentation

Changes in v5:
  - fix documentation of buffer alignment

 Documentation/staging/rpmsg.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 63612b7ee120..cabaf3d11ae7 100644
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
+size (for example a larger MTU, or different RX and TX sizes) can advertise it
+through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
+feature bit.
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

