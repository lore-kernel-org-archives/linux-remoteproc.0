Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2F33BADA2;
	Tue, 21 Jul 2026 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666906; cv=fail; b=Rfo1CVfAhmwbpG5PHnszRat2pO/l5Tj0c3djHa3SYMaFlc55x8077WHmo6vLafZKH8ekVTRclnLieIaM2B+WK4igg6TH8XsOnfbregJAY8JTwQpD4ZwI9mctnBDI0Qz++Pk7OTaIYHd8n8+PFvsydOnV9vZ096tCt3h1Rx3TIhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666906; c=relaxed/simple;
	bh=Nj7cLHpD8aO0SbuXNabnTNi6ppvg33SN06iYZiJwxkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P/ygWfsN8PQSCHv5uC7m/86Z8fTIRFaWgLnVFROT8lblH+WHNM2CHCeaY14NxzX3jJI6C6fOj2jupedhpomKfYUPCoIt8USE/55jUbaZR4+cajz2jWQqo8mrGAOb1+s/d2Nx6XvYvpK3D2bUqYgopSCgUrX79SzHZCjb1I7mnPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aJBaOrCE; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aJBaOrCE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWQOVkTBlPfR6uEKao7lqd/rXxn5TefxG6dYDu9DX4DMxsWYYEWzNRG1w9bcsCdreU8J8klPLjulDgVSjmdOKY0zdVzHwExYvWjeVIhuRQSly0RYJvj+AWIWIvSKR7FDsl6Hj48rqXnLj3Yad5B3Q0QxnP2bfB2t6eAQnfI5OV+5EodsUIhrOdJhI24SWFUkSv/PTNusU4q/g8gQQzJ6mzInqKiikyt2WMJSP6myLlPwVppGkRYKLl+MI6L/FqK2tVrpZ0NyDjJRLCBB1lyATpiNfN/YvyPmBW3g5PqqDrEmaso/kexCOSEF3nNc782LQPKB6kqpYk9N6I5OO1+h8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9lbnBpoZ4xLTFP80dARudPNpbFJruXh2WqAL/NIii8=;
 b=JHJmAQWhvuGxKXr1NIRJepf8wj/aTFpGWyDjkKVIAaUHRdGdrkGqvh8/eFNU3B2LUf6CA8Ux5i8+drVV6x4uzRyyJqQHY4bxgRDyqLVAN4gDuWgJfBfmsj8s/2/cw4nkzLmxxNu5cqxSrEEb1gscll0XHrRPYNdoN0Qxiqe19vqkKqrbWWMkKCmkFfNDSUXSRzYY+j0qJmZbDVMjBqUaLLJ7PM2Ym3JSFRPLhjcE2gotudEoUi9rpZicx4yqS71H7XcG/6jxGfQnuq4EiCffzvUdhD3jPO+bkf4ZMYYxmlM61qVnSBN6U+l/8478RUwBlQ9MXpxd9d7OMqgOVhw/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9lbnBpoZ4xLTFP80dARudPNpbFJruXh2WqAL/NIii8=;
 b=aJBaOrCEe4bZxHcKt8XFOGWilgMRiwIRtifXTuDm50K6YzYKylyOdTlIIhrFuALJvqiJJOAV5a/VujWZZUIPTOduTBzDsR3+wjqPsrcptQTYGPKJw0RqXpa5OCoFtQw8hk8RlfE2pZqe6dtvO3qMoYzBP54EwwQvLrObCC9xy0PInb0yy/tBYv8hAXlCTa3OT8+ZhNwHHyDp2atx48boU81rBzdMGcso6JiPIfdjfqfy1ECh0CxKFtN3fjcUaw8a04WNp0K8rvYM0BARz6I/IvRJNUEVc0P6OZJHdkkLkjdSmlIAxqlRBxsrI5VJKqeMPfcop3fJADjIvONVdOP3og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:17 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:17 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Tue, 21 Jul 2026 15:46:45 -0500
Message-ID: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:806:a7::23) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7273d303-ed5a-46a4-a572-08dee7696452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|11063799006|3023799007|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	orus8v5DUzhiYooSN+jSkS7kSdjKu+wPw7oUvR3iKAGjcays6ebrim+2IuVHeriFvwtL9QDXH/u8ZpMZsQnKchCJ72rPw6adu/eGuba1ZHdkuEQ4FWzN2cF5lJTVGw7gdct2rPV2K7RCfxxUk48fqaVkRU0c7ulCx0jczEcf88RCMAARe94ScKDo24x22po7XhDhznsVSFVFUo9cdorNrgDqmUeoyze/jBKkq5R3D+iiD8WeArqmDDGtUatAaaqsPA9FMqGgMSuXia6y9+tl8f85CjZvrp+SIR9GJf9t8KOtFB4Vra3irB9KeSqFj+1noX5oCxzd8q90rqhUj+SDNA46RrgoFlPkCSCje+xgz1Zxo2XcdbXlXU1+01QVH6Hx42a5orBfYDpUoblUgvv3W5zVKLP+GZttivD4ZDPQ0SOCs6haeWCfFu41i3lcrJr4vslMImo2o1WXalIG5iuVBssH9zdu3LCoIZyCvxhc61ng3YKeSEcjuAK6raglyUwukho/PjUkFcBX31j8bkdBvhVzZb3/D6YV/AFzGTs6wix9twad7nsdkc9moZDJrIQXMa35YcRyhRqgxv4B+k+M+klEkiPT75ZElAmLp4AUkPNfIUqqm5TOSQO7dvt19ZswYiHHlYfWw4wu3KWl0DqigP+Fbb4SWnu9eAKiJ3Dr8Lc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(11063799006)(3023799007)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YuL0DZ0N+EsiMsaFmKL371KWTWyObAuL8tVwwQP0Pdi6Z08i62myt8wLH49?=
 =?us-ascii?Q?eI7qFH/4v/UD4uFf9gI0U6eOr2C72zJ2EcczTIgVU8YKqnWTaDKnqzMgHe2C?=
 =?us-ascii?Q?EK5lc9lZqTkDMp2ceaQEXe6a3F4C5Fx1OJNXp3aFulv2cRNDzlZ8m7qzxIKu?=
 =?us-ascii?Q?794q/UqpIJku0bmxA5u5gUdTz4/IAv8U2adSSBgr/DujFO5eLNqmhPBYcMo/?=
 =?us-ascii?Q?qkBg9FgVRwr8afKlBnZ5BTs8AZiPRw72DwcshItR43Fs2K9J8KLds6tmBmOi?=
 =?us-ascii?Q?XQ5Qx/zbcAfeDAizBA8UUUQ06z3vumzL3HEWF/9B5IGqSzTnB0IpLsT9ChvR?=
 =?us-ascii?Q?82YlhWd95K5+gnYgkNmMSeyVvO/8cX9DukH+aaHe5QGYRQQvAGycIkWfUCiO?=
 =?us-ascii?Q?csxLfMTwoOuO+tq1xbIJin0rZ2X1XP9sfRSbsseB75IJo7c1NecsBhjhq1Wy?=
 =?us-ascii?Q?ErBhXdJKuZ3NUe+JMDP1+Oebo+piTCL2UWUuQc+EgCsX8YHcm4KstOWIJHwA?=
 =?us-ascii?Q?qP1+NdY5Z71XAhIqC4wZl92HCiBAYVOX/YFLuJJPHpygGiOwv7qDb3Hl71T5?=
 =?us-ascii?Q?i+/hHPoPs8oCR5Db5bjoB7TxjAgLIUl/rwRrOb6dFVXJvF8/16hmCHsb6nzh?=
 =?us-ascii?Q?7z3myQVVPbJywj7k8fWsumd2CNN0rPDs0zNLPffiDNntFL1L81Byvl0E60/4?=
 =?us-ascii?Q?Rc2eaBO8xGFUJXe4GDZMupsIOURDck/L1ARsDnIbep5pPTcL5EP2CwKgrmNZ?=
 =?us-ascii?Q?opUTeB1VZsWYQGDQhZ79lg3ZO4Ukc9lckLT0zNnxVbSgN7XCq+enjPnzv9tI?=
 =?us-ascii?Q?3vJbRYrJQ7GOd65bM2pmzmKKR54k3/kOLQj7ZnfCmMt3asT7XZ6q6AA2Zcv+?=
 =?us-ascii?Q?2KiNdT14RqxyXnFDqYLlROf0CZxR8qzfiQx5OHMl3uG+xKzxCPsjixetGJWU?=
 =?us-ascii?Q?+yGts/CMlfspjxhvH1DCoVHCr4Yw6gyrDzXF8mLdvk+PV/CLj4J2F8gkSsoI?=
 =?us-ascii?Q?IU8fNCHIrNVpu38dVjocJ3tVN0goW3AHb5HPB06G4ZIaRZSVyflk51f/56v/?=
 =?us-ascii?Q?7lK9i+K/DtkRxPcwloE1F/fa1SGQ+vB1YgEzXZJzXtxMe7VdDxsaNvgWzZ6b?=
 =?us-ascii?Q?gyG72YLc7vIKVCavbH20QaqPZxXdWnbMgJ3spdqCF6f87/uyyZlUv/V44IWP?=
 =?us-ascii?Q?GCf2pK7a7lE31glHc6l0Mc5zv2KDw46MuO/GBOaL2GzNdsvIzSNi9hJAtB5k?=
 =?us-ascii?Q?hQbIGISoJ1New+Dqpb7Rl8C7pK/RPXOdxcO+xf9Xt80/TmE0TiQneKWucEH3?=
 =?us-ascii?Q?BFWsMQzwP6AdYzw58sZlysTwMqB9YMqQya0+7FLSHMvlkeIr/W5MFpAAopgy?=
 =?us-ascii?Q?1hNEMRWCA07QbLC4W+GsCxPwCOUMX3GPjPGZ+kpoG36auzy1gw+LlLzG8N8i?=
 =?us-ascii?Q?q45sWOcQLpD+BDcj5wsnIN3ZYKMnxVb/YbYfEh8BKc3PPjS0+QB/gNrdXXB8?=
 =?us-ascii?Q?2KcKxvBWfjzhW1kasCC/BuIDQ31Jiq9J7pOpF0wTv7SFZloAP0bOYZenLJ9j?=
 =?us-ascii?Q?qtIdg9kd/VMMQO3PTXRlvigQutjIsE1lflOc9fv/IA/hLR93nZxaEXPGEYhJ?=
 =?us-ascii?Q?hkh8XHX6qBHh6KKf1PF7UyMXycKHmMGu5iMb4o3lVRiyK375rjWmDxq9Z3oY?=
 =?us-ascii?Q?3QujFhwD4BYMqlhgGtbT3WQpWzW3eJ96kAzvZ5G1okeh06hhw2YtRYrx4TfN?=
 =?us-ascii?Q?aYUAY5O/KqkzdT1+9tLeMtgaxo1PHD4epl69gGvLrGmfHrSMfs6B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7273d303-ed5a-46a4-a572-08dee7696452
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:17.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l67QxdHsBIS3N2AXhzlmNnRb9UEVXZBaVhKfdeqHbxlOAgyAmNIhTRjRO45d7QU2IreqelsIjTeFP3/BtJ+9a4jjGHBqTWhBmX4yUd4+V6227/qwZUHdoXLZHqBbkfGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

From: Shenwei Wang <shenwei.wang@nxp.com>

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..41eb2e149942
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..b9b559b186af 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -88,6 +88,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "^gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -150,5 +178,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0

