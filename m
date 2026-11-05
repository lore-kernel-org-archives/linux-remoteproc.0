Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855960;
	b=GopHHo6lcpjExZRcSiyax8vIqUNHvqN49dCFd4tsvjVRY4gt5p90+Yk7SGQkFJNn5LEH
	 2DwTL1eD/55nm6QUIrTaSVArrWvevV9oJ1jbqc5/4s8czjAf1TIXqnPlOEthPeM/I0cKr
	 Gx6voNYakNzpI6DHVMsAm/TLTQm6Od7lE8Ze9xf329aIbrZ95vWyL8z+ka8SIdQu9F3XL
	 zYJ5LmDYlu8dV3Z0Ez8W8jttGjBx9lURBfCdjfda+QfEnVcb72Eid5Xx9wRudDEMCa78c
	 mhMx8rq5ZfuXPBHV+w876ARuDFg9Q0KEHpHlodbwYs62U0bp/GVOff9G1Rlh8uYCufw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855960;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=jbG3MSAvBxEDbuTX4dmHM3pg98zYbOeuCJbudcs7qEw=;
	b=p0Tbw5ChFwQy3mWltqOkusA1b6AAFGdNq6v92xJwbah4uuh6o5l2kO7iplD3XYN5NLer
	 v6P+utgpmpx4ssT8Svw/9RMqyFkpiaTtdN3GczY6iuEgmn7FsxiRhuhrX42rtQ9fhJK3C
	 +zJaJesuOvw283W57mYlNOJP0+2MBwCmOakc9pn0ti+YtIEEazxSLxtPoxmjZZWI8s36l
	 IURjYQ3VBd/gRsJ97PlMJqWj+J2OBmy+56js96KRBxRo1BXNoEQ8xw9WuwT8n2M4PijzA
	 dE7hWYEJ5iUYizXX9CyFMQ7C3W0mttHuHYmTUIkpRgAd8ulEeDf2oDNtneGdFXOeJYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yk7bm6+g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21264606A326;
	Thu,  5 Nov 2026 05:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21264606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yk7bm6+g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4hi7Tvwc0L3bT93lQe2IUW2GJTgvvfmM7UxTfIieeswmT8img/7Eet+naDjJO69xIFtOma3YDn8lKQa9h+1KPo/MyvwwA6/GC6QxAHKAHgjXHBIK7qzV4MSWAkaUK/G0gP18WReUBehY8O8zXFFPHHhjQsQan/E3XqrFfPZQmGmyCbuZ91ooOUhcn54LOw6+E8PDvAsO1AxH/A5C9thcfyt1ulY9H+NRtVLQAVqm4M2+H/NADURm9VPEhfj+BmKW1UNV6KShFWYh+bzp1FirbElAbO0aH6aQ7q6TverTw0+j+q1dpNXnDqXR/P1Eh/+gI6ptZrKXFKVIoCCzVYeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbG3MSAvBxEDbuTX4dmHM3pg98zYbOeuCJbudcs7qEw=;
 b=TB7BlNy3S1wfq2SoCgvXtoevW8kPqgCOPo3GdFgqNeVRv6HTGHKCHNTeIds/IKhySh7SPq4SNdA8yFz1jZBdkDriyAN0tOgR/Pl0msTdjDCjTHVXvwi08FW5001Ae0YC07ktwt0vh9nnjk8PaQlV2Bc7XY6NQyqGxqCcV+pASbBtGWcGvauxvcd/steNK7QJakaC+lHaEYuJ2InBVZA9aeIKX3g3Gv53uuED1439ZgIFabvA2uWWfmU8y0Y/oZqw9KN1QMokf4Idj9ZaT2qtZOgUdlTUmjXJHwNAWd7wK7H7EZ6K5QANcNgnp3UY/CMUhk8ddTZimWG4tdoO30iwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbG3MSAvBxEDbuTX4dmHM3pg98zYbOeuCJbudcs7qEw=;
 b=yk7bm6+gFjAvPFWiokmbCBGdx2d7/2MDhhX4wOWtUB6RHcgUrpeNFtRji79adXxmQdnaBgR2riMBTgEoONm6LCWDUwPOTjzdFOZf9RXBvTTROgt/D4QhEhQ+VL5CWOCX+6fJkvY7ZYKneu3So9A4qeT7UmXV+QXk5odewWFprTk=
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 05:19:16 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::40) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 05:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 05:19:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:09 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:08 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
Date: Wed, 4 Nov 2026 21:19:01 -0800
Message-ID: <20261105051902.1646651-6-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105051902.1646651-1-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e15a7f-7835-4529-a45c-08df3afc5599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|261021135927099003|56012099006|261028144727099003|261009223027099003|261026121527099003|261021121427099003|261026140227099003|11063799006|261022105027099003|10067099003|18002099003|261102123227099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tkrnWQYeIORhJjT5Nl6/Xz/gfNeEBTHQvW1fv/ZaAVZes8uEGs3ZM0E7zzDMlRnlMn6aX7S7HmlVeJ9p/ZghHXOZRifNXH7/YFys+DE9hLC7i4OoK8zETv8zPB5ugst6glT1c9Z9Es2SE2o70jix6J83PSgIaYhM5hgE5rGtyHtlr2+NF1dSLRXby40Jvr7DKeIMD4owgvbHadKN7Mcr+hkGeDP2xIrKWPRtr5aebIB4HFfozNR8TSdw9nO2dOqjsY45UyfjdL9catj3emkcUvuc7kgUs6aKpUw7vrc+nO/2n2WQdlLBc7B2R3c340lGMmz4iZvXJmwN1ksPpnBfPokF5nCS5dwSTg67zuPrIJFYxSUtsMFcnT8vxl0qZho0YIn688dLd8GE0L3euQs3apyx4qvRnKIaJAdnz+87XKbtk7NYhbSm2560qG690eeJdTDko096SMOKjf5GBufLKnweumvvTtExCkQnrx8HDfuSSa59ZLrzBsSayY1EL/W98o3IXZDppGndn9YSpsTOIdW22BI1IObe5Kfw3ZKdJvPTkGdI1AcKIlBZlSa+sfeGwUEK2nXY0uUiICmLBVLIxfQ7ENVcoqvSOvEhDsrnkGi10NAt5uKNj/U4B3yw5O5JWqYU88Torp942tC1JQLKGHLCwsBe4KNxMSg+tXNxNr6S+WLiCujbXYiziglzCDCoKHFQa5kP1rI0LyH1rksbOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(261021135927099003)(56012099006)(261028144727099003)(261009223027099003)(261026121527099003)(261021121427099003)(261026140227099003)(11063799006)(261022105027099003)(10067099003)(18002099003)(261102123227099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PUhTVFbJyJ25BDw7e5lAdpdcvksIGzzRfFAYxjadq/BpLG1BbnMr6hnx8L2FmSqkWW9ceaKYxZ1TKbIEmxsTQQP7cq6eo7Dc8CMavfOpNoEvqqcTxu8KKNcjmTEQvRBoTGS+8N5GDVHPqxKNL+/EoXR/AGu2nX8ZyPWpKihzbkpBgnSZSauRj5hdCol3t82qFy6tI9hJfWDyuop+UD7cjNHaVOf6im5685IM41CYSbOSfbb4TGrvpk6srm1SE8vGnDsT3oQFSkvKZ/WOgXL2XMjzZdErWKX6xicOpoU4BQnM0Mg+nHDqx5qk9XCko+TC4LPeNMAn+G0ZpzoVN25n5/E9N4T7W4dw+tdtPNCZV6fht4AZArdoaljinDtnFyqPj40Y0Z9RYVWdHdCQt32srMdrmxoyc3uT98WERYkguYmk84Q9Lp6ElkVe02vmwGK1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:15.0932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e15a7f-7835-4529-a45c-08df3afc5599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208

Describe the optional mailbox channels and named reserved-memory
regions used for RPMsg communication with a BRAM-based MicroBlaze
remote processor.

The three named memory regions provide the two virtio vrings and the
shared RPMsg buffer pool. Firmware and its loaded resource table remain
in the executable BRAM described by reg.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
index c0359f447ea8..462bd4be087d 100644
--- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -84,6 +84,23 @@ properties:
     description:
       GPIO specifier controlling the soft-core reset input.
 
+  mboxes:
+    maxItems: 2
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 3
+
+  memory-region-names:
+    items:
+      - const: vdev0vring0
+      - const: vdev0vring1
+      - const: vdev0buffer
+
 required:
   - compatible
   - reg
@@ -101,5 +118,9 @@ examples:
       clocks = <&pl_clk>;
       firmware-name = "firmware.elf";
       reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+      mboxes = <&mbv_mbox0 0>, <&mbv_mbox0 1>;
+      mbox-names = "tx", "rx";
+      memory-region = <&mbv_vring0>, <&mbv_vring1>, <&mbv_vdev0buffer>;
+      memory-region-names = "vdev0vring0", "vdev0vring1", "vdev0buffer";
     };
 ...
-- 
2.34.1

