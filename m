Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B026299;
	Fri, 13 Feb 2026 00:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941538; cv=fail; b=gx/9yRooslckL93np3WmBGKbCdSGRbuGdAQXry06GJv2cWkEszcEUTWPNVouT0Z6iH22pkcR6Lc6PPmnk5ozSlw32oIee2r9nms3cFl+VGWhOFOOScNNVkMGLhLnLYYpz8Jxkzg2AV+rreiibePOmhpuYO1HQ82fY5hxIVO0Mok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941538; c=relaxed/simple;
	bh=II1EzelvOAjVqbLaJ8pGzueouzHIL+3HBgRa4k3IGgo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JETDMHTo8ojH2CKmmT94UNjmQIWFaB0KEMjeZX6PQiPXvUeWW3nsMSIkud4L7htK6CftzppsKcP6K6YGDzMRWKeNzntB9VolwpvomvLImApwZtBKtKAPMPGBpoiC9rRHN5QiDJ1cG1OzpipO/+aCnZlEHJYze370IP9oKh+y8OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=STq2E+eO; arc=fail smtp.client-ip=40.93.198.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="STq2E+eO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8889e9S+Vqd4/HUk1N9xO3hZ7a2dQ1/kEkYdgm6mH3n4m2hKwtZJs6ASJBmT3nofsik//ZH1QlEGLUi8jz6R+vNgudIXG397qWxXb96ZBJXC7ypztW3+pW+AvzZN3td7jVzEWHTHpAaB/K7wJ1JKxdhc1FxeBVsLuBc5o2sWmAOJrDWICNnn36QsM8uzAWtDIEB+otBb9nx1BxEilFDWyGVsO1CH7y96JGnaw4fZVRKnCYMR2NBmYWS9i2jsXGz2Z4J4l74SoLFtsKnT8vg+R8g1N25soL1R2hrgwhgOqcuf6abpNnmfS6Q52YX2ieu9Nr6JHaXa3DjMPxi/jDOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8er1eumWx/N0bQKAFDcASCSh3xjERdHCOL5aE+l9fUc=;
 b=Pa/YCfa4PKERyI5PFu1was4XL78WAuGKHhw95iNI0CUDVEFLPde+J+X3sYDWOvu9mzNb2LEdEczzehtQG0RDqH8h0kqxUBkvE7j11lSufk6xt/TvahmzAWs8RhftKC0nJbgOxg+KZGDKWcxd73ZAoVkbbqS+AAAYnHlsvGqhjiGO1eQTshZn7qGwIqwYUcOGbllG1Job/mc7STIeC/dvkww0NkEEGzuygIACirxEy5DwtnP62YkeIVe02uCSU1D+AtLVQyfWPj75oWAw0QDTmyMT9mEhQKmsgBeHzx5ixvuVWu/Fp74lIXwmKNZT/Pg3ZwogkjYcd/ggTpOdaXKlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8er1eumWx/N0bQKAFDcASCSh3xjERdHCOL5aE+l9fUc=;
 b=STq2E+eO4rthnNxiruVNnNs+F2o2kC5Lmk09nDBS0z96Eg5wriFTQPjmQ3JNiEcbIcflfhLCsvsAP5KNnJR73um5dlXtqlmqPiciHkl0BqRq8yQGwj9Pk/O3H/g/WsHEHqiIRKHDT4L4SKBQDP1L5W/3UbCVRgTWbr59yeVWyBE=
Received: from CH2PR14CA0037.namprd14.prod.outlook.com (2603:10b6:610:56::17)
 by DS7PR10MB7227.namprd10.prod.outlook.com (2603:10b6:8:db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 00:12:13 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::fb) by CH2PR14CA0037.outlook.office365.com
 (2603:10b6:610:56::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 00:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 00:12:12 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:11 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:12:11 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0CBmr3961853;
	Thu, 12 Feb 2026 18:12:11 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>
CC: <vigneshr@ti.com>, <s-anna@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Add C7xv dsp variant for J722S
Date: Thu, 12 Feb 2026 18:11:48 -0600
Message-ID: <20260213001151.17370-2-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260213001151.17370-1-hnagalla@ti.com>
References: <20260213001151.17370-1-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS7PR10MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 4919e2c6-443d-46e7-4f38-08de6a94893d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L94MOnkeMpWdkcgSk59SKu6skjwSEG2Y9t0Bba74iQR3fK95NAHIZLuwsL9Z?=
 =?us-ascii?Q?aU+bIbHhS98zIQR0mYe4TZCFKBnlDA6rWbOspqmFDH5VjVQqyj2QWtLvE9jn?=
 =?us-ascii?Q?5MDDrH5DDT7iByJB3j4bg4BnsBKGtxr+5xagcqEOqIUSGlTXPCS5/9FGTYDg?=
 =?us-ascii?Q?kzhO0Qkdeicn4aGNxb3J8Pp2Sd3FCzvz4ppj2ruOkiB3vbsG02qHMWlOzUBw?=
 =?us-ascii?Q?2Fb7x0S95JGt1//H8wcSx41iE9Pdf0WGaNcK97ivp4i4sRH026nNSOSE8fdZ?=
 =?us-ascii?Q?9JYmD3nIJkIoWegFhUsvVX21rvKwFGvQ4JMXweqH1m1LXUcoXfdPmZ8cXZ4i?=
 =?us-ascii?Q?iPfhAKUwCdvEa2w5mmf1I+/4CmxztZtJ6wDWyffKEz11H8jRBVBuV9glcvW4?=
 =?us-ascii?Q?8AotsY2PrG5/QHP2lwk2pTCEvPFASvs+hOXJffA71yAl3pg1OcnA3IR4GRZq?=
 =?us-ascii?Q?qiVXS0wplAZ8JucvIG6fQSQdeb26+ek9DpCaXFtunzw5VbBRjEqIJcYswMen?=
 =?us-ascii?Q?7oP8DJK1eyAjnVFST6Ymzeomf83xh/Jo6K4RKVGLw9MZ2bPglU4yerY9I4bC?=
 =?us-ascii?Q?fwWyYXxeSxhyIelocTzcAHIuq71OvFiO5nm9SLj2IKEp2m6p8yXFj5Mi1kBx?=
 =?us-ascii?Q?uXKzQjueBCvJyBmx89imynMh+MkGWa+OYJP8O0CHuDqPZqmAwTEo19qq462H?=
 =?us-ascii?Q?KJPyNNun3X3pjZKMIN4rUDka5Sg6fL5Sa28A4zjHHK2AXfbhPUU14ubHF85Q?=
 =?us-ascii?Q?ll5yhZIn4HTxOoRqDdQhQptoMKr2VucDPOuG8yAd7TJzVh4Z/ed+/7BOmAb4?=
 =?us-ascii?Q?kfQ3KmT8nF78d9h0TKgp1yYUKUDCZt907G18weiSo1TYA7jADmrhbxx4MzPn?=
 =?us-ascii?Q?FxjF+PCvRlOyeEE+urrGJU3+g3BKLQPH59BtWOGw1gYmlifESN/f4h4TZ2JB?=
 =?us-ascii?Q?AMimzlDj/oRpX6W0oICFzNCPjRK3RDtV+8nsexBfN+/q7JzfoPpLHwOEBfHx?=
 =?us-ascii?Q?bcDlxvMMxJPOr7+jSqSKdnacDqRaSGeloWcC7s3v3GgqJMCUShBLpULZpNFL?=
 =?us-ascii?Q?h9Vmc8qlWHei4qZHs+4t2n6GsAqjI+04U8a6TYSpA/BjtExQ41mlI9QfzSM/?=
 =?us-ascii?Q?phtLjHQTUXSgMvZHONZYTvwkGegw1ubuy5RxYP87PVQO8CSO6GYeVjw6dVOa?=
 =?us-ascii?Q?BlcV84ek9Op7ZnxNv5wttdXYaxP3zQyAgW8SeQWPgvrlNIAllmHMmLhEwoOB?=
 =?us-ascii?Q?x325ZTCM4XeEEBpsNPMPTpqHdk50UpmC5GGSiK9HgTElwGqrVrMVtC/qx9dC?=
 =?us-ascii?Q?ZDusD8ZA9fTifuBnU4KMgOpkdgQ3L3X9RgZ6P0uR5H84O/i2OqFQaoPbiUhv?=
 =?us-ascii?Q?EVTp7otW8kukGhc1AgUsw+gCNU9fT1+msGGVSiru1dcy9ZLGm5/q77o028gt?=
 =?us-ascii?Q?m5pagKShoZipgYGtHH375MfwZReL9rST7e/B2DG3T1vbgJ3u2hBqkWGlZ3Ah?=
 =?us-ascii?Q?IlWUn/xQ0EZ92znMefZaOx8m4xyOngx8qDXsRZY0udh/Dgnd1112roF4Jg16?=
 =?us-ascii?Q?8obMDbMSMk8CnI/I1zNznFAPrF+BE/ZWyRft2CQkXCle4nuxCeu+ZeSERzdO?=
 =?us-ascii?Q?cf3z/8b2AL08v2SVY54NLVnGnnQ7HTfSdQZTTnI+wqKRWsgKN91NN/tG2nT/?=
 =?us-ascii?Q?8DC2uw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izy10J8ssMmoxVJP4Glzc/Ng9LPGFJvmjIeqjFRv1gAKXZWC3K3p9YYzEJzisucLMqQCdsYWPG//T2uOOlhH6H9GDygBUgJKvBr10fuOCzysav/+27aI6g7XiQt6iGSYqv1XjACwjZb4cSGQ6TnIc6xf+cy3YRdRGF633c3I5eEssYz/ldZoEVsz+KvkoGM0LLxMQ7uf4zPpRiCIR36n6XcS4mJDUcjr/drllw5csj7izOBuFiMT/g6YjmfUF93BHyf46djAE5dRkxI8EUAKj2IujVXEU//zcJURWyLAbYnpnlpo+NtHfi6NDe0C2DPOHs71PamcBuKub0/m/xU52HF7A4xEdLhqTw6rbTQ0IoNZz+4okBX21fZokbQ9LeWFLBaQnOzIInQAuiBoovLQdH5kcU3xxT0ynle5qP1YKp7UyhBQWqAzy3qhhzVeEYjb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:12:12.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4919e2c6-443d-46e7-4f38-08de6a94893d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7227

J722S uses the C7xv DSP based deep learning engine similar to AM62A,
but the reset and module enable integration in the SoC is little
different. It does not have local reset from power state controller.
So, add a new compatible string to distinguish this difference.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index b51bb863d759..c241d88f640b 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -29,11 +29,13 @@ properties:
   compatible:
     enum:
       - ti,am62a-c7xv-dsp
+      - ti,j722s-c7xv-dsp
       - ti,j721e-c66-dsp
       - ti,j721e-c71-dsp
       - ti,j721s2-c71-dsp
     description:
       Use "ti,am62a-c7xv-dsp" for AM62A Deep learning DSPs on K3 AM62A SoCs
+      Use "ti,j722s-c7xv-dsp" for J722S Deep learning DSPs on K3 J722S SoCs
       Use "ti,j721e-c66-dsp" for C66x DSPs on K3 J721E SoCs
       Use "ti,j721e-c71-dsp" for C71x DSPs on K3 J721E SoCs
       Use "ti,j721s2-c71-dsp" for C71x DSPs on K3 J721S2 SoCs
@@ -127,6 +129,7 @@ allOf:
         compatible:
           enum:
             - ti,am62a-c7xv-dsp
+            - ti,j722s-c7xv-dsp
     then:
       properties:
         reg:
-- 
2.34.1

