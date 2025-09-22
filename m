Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B882931A548;
	Mon, 22 Sep 2025 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571501; cv=fail; b=MSGPJo0qiRSMLcDPqrCdfLa0orSCQ50jZoGoI1IYPdnfoKyR2/o1YI9/FSLMdPzPSFhgrdHM8d6vm0KGD8ca2BPx+zftn3D6HjR6dIglTAgqNkoJNjZhzMvwV2BYA8E+2Oww8NJiJfd/DIwUHdKtIZtKyrgB2Rn8xuf1BpaTpL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571501; c=relaxed/simple;
	bh=7n0Vlj1bez6sMwLrQcDGUmkJuwArblaSDFYSvOzh4Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=itsVO1aAUJos1JMFf+MTSqHh4NOY94DpfHy8jEVLm/VI1CAlRl3+KsjdVzcM6WTnFbnrkUETtRwLh5BMy9gn2OBvk+0CDwRwtUaOvQ3uEJ6PDC6YDqqnXM56o/JSHN2vfzYZQN3a72Ym1cLl/jNMf19SFscOkymt7dJr9Bm+T0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XYyiOLGL; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XYyiOLGL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTp8EZUlnIr8sphK0AT5eMPBCcdb6Z2SqU0S2Uht/vW9KPmBkI+Y/7YSn17bPNDW5HLB+Q5Bhp9/d9SB1mmWZnO1fwRHejRj2ErgFRInFQqsir7PGZ+qSbVs+80tQIyuAVDoqPVFP0N0LC2RJVsRFqiuBhBiPj19ATMzyUGGj4BxuRlanqEK5pZ4XXPPXJ4ZTehLOrOOBoD28CCp31MJl7Mjpa3ehKvXitzdiujh8+rj3j4879hZ3eRikoL6fnciNsmBpCOeJ5pjnZbbcc4ZoTVh/CxSHG2mjhjUX0I1SdKdK6Z4Em3cqEyXAr0FrlH/eYRle67z+XTqxIo2XVUOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdInBsqExSRpsvUqPVLYZlBidfBpQRF7H990exC5DUU=;
 b=y2anN18tAGKvREnlHRDJG2Yr0OBeWG9q+OiPNYllE5cWNFzyqDw2sKM/u43ypZqd2OX764PIbsAmdEKy9We2vL9srBTC6gn6wtRZrIA7Np8WeoQk+WpzgrBeX7cYiNoPbWeYxs4rRVarxZz45rwf3TO/LhQNet1cYLfDXuglzMDnUGu3cJxD4DswirMY547zKdEJTwLPWKlo9FTSqLI/QZZHV5assnR+B1044A8DWYuUB0TSuyh9aOPcmEa/Tj4Im+Fewn268UTjxuWr1IGLrPqu8TFEuLHtXCrZuihPi7tV32enT0duFzXN7zLDX7g7VW95IPfwLXzgVGqIOUcNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdInBsqExSRpsvUqPVLYZlBidfBpQRF7H990exC5DUU=;
 b=XYyiOLGLgC7vuJ7c6e9t/VWFFyFOyTcO117q3WfcO2F82UEmawuf+PB3gSyYIh2q3HmVeZEUqmRlrYR5TUXBU6UnYUCwAdJVgoxZS7oH1L92gJh1Vc/gEyyTpVkg4twDgxJWp2T2IGiQXUQici2RDBVWGxrQ/2Y17gjq+efI5rRq1CUwaqMf3h4S+rP6gSSNE+MCkbHj6LXbHAnRwcJZc2RFWOcb2ANKNiW7vp/2IU2xYn6vgh4Zc/TP9Tpo5JSjpWp5TpIs3FYYQGK0FkELto/12J/Xf4fYUdgzQUNUSMKASaWUacB3mTwBxCiheKMwmKK7VuFkTPgAuTm9mG45Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 22 Sep
 2025 20:04:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 20:04:57 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Mon, 22 Sep 2025 15:04:10 -0500
Message-ID: <20250922200413.309707-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922200413.309707-1-shenwei.wang@nxp.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: d7bf4187-36c9-4446-8175-08ddfa134d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAdrOCMhbzD2xPedxZcAnRWLFg0a2KONCgkJhk5URmQ5g+ZqOSOy12/nUzku?=
 =?us-ascii?Q?x1YQmNHEa7Q/rgK9dpeAkJTWY+Wh9hsQJ6nXOi88s8iyU6Nh0vS0MB1VhiCX?=
 =?us-ascii?Q?eyXMXfSxA9Q0czs+XhW+iUzHMp4wEXSPe7uZ63FB8IyRg0HyWZCJ5srHLJGX?=
 =?us-ascii?Q?ASJLgS1pTHiMhq7JrEA1otFAUGA9GHx5Xx9XiqeVn3VDe5iFn8kZMoD9XcV8?=
 =?us-ascii?Q?G8y58FjuXuXOjQu/rRakOHGHCPFK1D/08FYuIq36FnEuO27rVsMF02aCcBd5?=
 =?us-ascii?Q?WPwZXoFZin5LwWF/mbc1IosiVtp/QjPtaqb5E5oBPYV0CuwQ5dowvFG3oz/G?=
 =?us-ascii?Q?q6c3IvKizIltmNvQpqUw+EbDzjbbFxDPfzlArm6SX9jTORCy6EIK0ViSVL81?=
 =?us-ascii?Q?BqsfboGdGFsdY3HVXKy7ieJTYFlBA19VCxzhw5Pu8xtQgRjpZ1BzeROPqhfh?=
 =?us-ascii?Q?dlr5RcYjkmcDy2js76HwrFOoCfdA/eh7w1UmfDLdlFB6IbkRGP0FLQ+aCrVE?=
 =?us-ascii?Q?pWT/Qr8/gNMYh5qYOeak9AKnnhJlw5zsjJ2VPzbjsba+aOF5dLRSFQXGroL9?=
 =?us-ascii?Q?q9c3WoZa+nef+IUDYS5l57jEday9g+9H0bDcfGPMFlRIaMwuGMPhOehaXRWd?=
 =?us-ascii?Q?IJmzGH/1Xg/c2DltZOr9u0P1ikI7U+FA+GH4N4/Xg1d4we31GeETOSvKNGLM?=
 =?us-ascii?Q?ix6k4YvDOVuRlwFuLDzJXooC+T8lB3nJkAceYDrJMk1qRCHU+t5oq4Vz9dYq?=
 =?us-ascii?Q?A/IFWCYTb+b0VT6UoF+WfFab6/WQB9dixBnk9VeqqgDarWp0EjuCiKISy5kq?=
 =?us-ascii?Q?geph83jhxrsvIcPoJXRJjJEvSIAPEcoOabCQJSaj9/4G4rJn/llpq10TtXir?=
 =?us-ascii?Q?td3qT4yoM1isyaAjhJYyEc4LccHgSUrX4dI8H61pX6ESxR3JxFBniRW1l6lU?=
 =?us-ascii?Q?s5hu2z5Ej+544z6UUNDWiIDEGATeJ6epsDh2LZBVmoOgzDtf7TvKDKsLjosc?=
 =?us-ascii?Q?MwE/2w27Ag/jOJuNFyC6c4UVi939yezSmLK9G5X4oOjgPKya+khUfJu0sKxc?=
 =?us-ascii?Q?jbp4JzTOdkUgvlWC8QlTcv/rpy8NLFbXZlshi1CXBiuhgTs76XO0t20ozkAs?=
 =?us-ascii?Q?DS0jW35F7VM28wOXjELATHxEqdDyl7QOEbNBMZ3ZcNuLdlXMhV6QSbo/Eul4?=
 =?us-ascii?Q?g7bHgGiFQZvvaVJYpXT/QBkj0+AXaYTVcKTMw2dz5iV9xJ7bK1kl3H0jnjwi?=
 =?us-ascii?Q?wjrW62dtLK5T4PT+qSv7r8uymWzfsZ1WGVeHOHieO/Iw9im0j3/qDJxnklNR?=
 =?us-ascii?Q?XRkiavSkaD2cyravmC/v3vKrapyXkycoLf3IrvZ22RVLN51VuBLwxyPMX2v2?=
 =?us-ascii?Q?AB7kNXeuTYMo21rJcTO1WnIlnmqWqUZEbgO4OQJmgu9EW2nHTY0EbjlqyrxP?=
 =?us-ascii?Q?rA/ERlqFtiaUOkuVBM7vPwpFx0kmj6RX4+4zO9sQYhyzy+jWWcLyBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o1PpI9B+5/D6aW+ch8QbP9p4HnF0qwSy+pVWrosHc+T+J2F/n+g6lT6zvi1V?=
 =?us-ascii?Q?Gcl/BHb31MINYNfY8i2GvjMaTcZy/LXmUhNchLcZsAH4TfQHF7fqZbR/C3z3?=
 =?us-ascii?Q?M//j1oVfBdUBbBeZvcaH19BV0VoITM1hA9g/XWy4ahF/wkxHEYk7R1Bk0lIe?=
 =?us-ascii?Q?nopD3Ppj0uX8zAr2dO9ISeU3kl5Q13y1XnzxqHQzFoDHWnYoMAHi47ZZmDHe?=
 =?us-ascii?Q?vesGCt08GZftNkRK49UfLSnMjTn53kXuxRKCmFea60fd7odX6KRh9MCjjHqK?=
 =?us-ascii?Q?yOIjPL9IOlA2vKKXZvjl60kDHh6hA5vRFQAhiceUPzJ6rEXgt4wjNX5YelRR?=
 =?us-ascii?Q?S8JuRU0riNU7DQwzKEhY/fTsP6Rb1mJlSBDlsRmUYjjE44RudBouEw5THfWr?=
 =?us-ascii?Q?3OpiamJN5Iw+G5A1AylfREFqG/8xZ4VexR4QxRDG55m2mo5+DOWqc0sdz+4P?=
 =?us-ascii?Q?dqAAwkHVYfmYxKKUjwPgQImbNFqvu4rjxI0SV4dAbCC+aY7EPAxpcie3295Z?=
 =?us-ascii?Q?qxfg2HapARXku9c+staV1ArUfXSJwA0J+2MKIgbk2GWHHJxmHHhwdwt8Ed7B?=
 =?us-ascii?Q?0MFigZRHanqQfezVLGXs73kKshy+LzvmofSI13YNddo4BFRIBwZr7xG5R0jw?=
 =?us-ascii?Q?Y4w7wm/x4+nAE0vG3g9EVPWW0xpfoF9kAa5lcWEKUXH+lhDZs0sv5oCCYQuh?=
 =?us-ascii?Q?CFO7WppqG/OC0iES3Anh1N7DaTyziKTQPNDqr3EBbU/J08/G2jQVDYTaA+MZ?=
 =?us-ascii?Q?QueSGbQW/DcYGtgbONFtXsT5+3oFpiwaJT0R6/3ZaXBuTq2+qiQXU3O8jwP9?=
 =?us-ascii?Q?mlH10iUhlDTPnPp0Dooc3hx3JjTr5q93rBlou7ioBNUKjUJj+OxFyW+nbw8x?=
 =?us-ascii?Q?a+VrlCZ7pDcrKkoKy8IcGUKoXkM7Tu/owslD5fQAelH/Wkf7/GIou26hRIma?=
 =?us-ascii?Q?PFcHTGQSUvOMSfUHG9237qX2G/ifwFAuyjfcyt8HyBblwsfpEvfqFX+DVn5X?=
 =?us-ascii?Q?5dTWpmXh2NJhy3hL9VZQIEbd5R2U4RYLGUJ/8Rfkz2hqNZuKGBBdYcsXTSqh?=
 =?us-ascii?Q?AQw4Xc9Et4dkvTrMfdqq2RmDP68xdF2VFne7va7ovNx5aavPTKxsOX6Qt09E?=
 =?us-ascii?Q?W86YO5FD7l0rKG8CN0zgZRkwtvOSeHUoKEEfGuGhwkL9LZFVGgJkTewFCoqj?=
 =?us-ascii?Q?HdmTLRhuT8sQPfFzb41Cdwst+dk1WqlOs5okcdZp7HxA+oXTAvKP1TGXpD2c?=
 =?us-ascii?Q?LCp2GlH6E80m69RER/COXtkqZM+XEZxcKL33eH7l/BKgVE0gVtlqczePyqRi?=
 =?us-ascii?Q?nOZVNjjkBIyJdLlrsVs/Mf1Wix8atl+7u2Rxmp88NAj0N+D3Mf8kir7A/1Wz?=
 =?us-ascii?Q?01r0iOlwHGbrEvvxLRQmqWd4cd4Z+43QjVMnUjNqF/d0z/UcEQXTbWmlc71+?=
 =?us-ascii?Q?C0REQZBa/fOHZYNFMrRskAnKBuTxgiMKQgecQTH+qy9WqzSrEMwaEwlks2FO?=
 =?us-ascii?Q?DFYLW/yTLOy9+dd7/qluduGoYg8yNlIvlvPdVm9KnfkXprkT8DQeCBs03XF6?=
 =?us-ascii?Q?8VS3eLy5lUVDtSOW2mB7gTaobANNJ8e8kHD/ThuD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bf4187-36c9-4446-8175-08ddfa134d9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:04:57.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8Kw9YQyWv27kTlhmnfkv91ue1viNAAIwOzimOl+RO0pFgSTPNpjuvk0n8NmpaqTwpYFjCJdIlITyN/C//9/BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

Remote processors may announce multiple devices (e.g., I2C, GPIO) over
an RPMSG channel. These devices may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node.

Each subnode within "rpmsg" represents an individual RPMSG channel. The
name of each subnode corresponds to the channel name as defined by the
remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..16c7db4c5a79 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,98 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Present a group of RPMSG channel devices.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      rpmsg-io-channel:
+        type: object
+        unevaluatedProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-gpio
+
+              reg:
+                maxItems: 1
+
+              "#gpio-cells":
+                const: 2
+
+              gpio-controller: true
+
+              interrupt-controller: true
+
+              "#interrupt-cells":
+                const: 2
+
+            required:
+              - compatible
+              - reg
+              - "#gpio-cells"
+              - "#interrupt-cells"
+
+            allOf:
+              - $ref: /schemas/gpio/gpio.yaml#
+              - $ref: /schemas/interrupt-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
+      rpmsg-i2c-channel:
+        type: object
+        unevaluatedProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "i2c@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-i2c
+
+              reg:
+                maxItems: 1
+
+            required:
+              - compatible
+              - reg
+
+            allOf:
+              - $ref: /schemas/i2c/i2c-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -146,5 +238,42 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpioa>;
+          };
+
+          gpio@1 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpiob>;
+          };
+        };
+
+        rpmsg-i2c-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          i2c@0 {
+            compatible = "fsl,imx-rpmsg-i2c";
+            reg = <0>;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0

