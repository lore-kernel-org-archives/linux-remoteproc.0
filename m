Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D05326A0;
	Wed, 23 Sep 2026 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189010; cv=fail; b=hMTCYZzU+Lcbrt8CrOz14zXPXjXvu4lY8cKkPQkF9Phh6t6xDY1aoSsMTvx1U///Ykcm57t4O4LIlAzaO5SrKKYLEhX7dtLcxx4V/cUfxVNndtFgDTyJHYWGQuokFnsDWPr6JGb0QLCCYzhwVlYQ4LY4lUNWT3Xzti+aJ6G/wdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189010; c=relaxed/simple;
	bh=qFHv0ibaWWiC4+7pDJd6SG+Xsmxns7f/JHsD8EqUsxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pIiv18TYhNbHc4niaZW59PNDH+w4tPPWXWhZwsqU2kl46W7+3ESf8UKIpX3K8xe8XJY5tMPpQkEoBM06hRb/fHASYiHEBEDzOJ4Zg5v7MwxkGicPEDZNN/4NdX9JUBqWHpDMNiA8SuuJXpaSsWp33NGjSKnl5NkCnQL9ZJG+5l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XA2K16HS; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XA2K16HS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra33dZJIAm3japftUT4hmiTz5ldOoonE1iTVAsdhTE8GaSOu09KLhM9kBxfz3bplDUSqR2jDoDTgzOlTXe3L+HPo9T0sk/R5Ig+bNFEfdhiQQ5Wc/h2RLfk/Dd8bNiwTRTnPQCHdxvXfNIKdd3xzfJCnEFNHmbKBS7N4mZjkrMCe1+xIqAwg3M9fb169D0+ie5YtD5kFjGdFueTbX+Zfm7XG5yXkfudccSM5mruMR4A7J0/P2+2uh694IigX87gF49wFloy2Gvd9q7YlDryk4t4frXOJihrFc4MwnLgE4CO1yD7dvL0dX8DKCOZQOQi/n0rIr8M2RQVCSo+l5FO52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0StRV3Q733Fyf5gbuiYcsjHzsDpO28rSAqvxJfWENk=;
 b=gUfNLBjlm+dNlnK77ODzkRO22SIUzQGnGlFR9XpABc6+hTJABB9jO6qW+zDOGeJgPp7rRbhx8ikYm+MK995tYEKSllKmFtPS8W6GveD7+ro0lCIorWNBJvX4+y58tfeANW4FiZxC5ibqScoN1aDro3UTRG2PPPVrxJ3vfLttUcCCPhF+6TVZUjktGvEXup7asewXnFkQA1I5rHxeXdwcbxu6HRkSAm/XAaRPEQB1So/1j4m3l2m51eJdUpbBnrmDNHDti0Ok7ZksO2SF/8gLpr00D7f8xKstkWW3n/oaYY1YyCHAYCU6BHbfn46eYSeQdGIixL8WOBdrlFae52p8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0StRV3Q733Fyf5gbuiYcsjHzsDpO28rSAqvxJfWENk=;
 b=XA2K16HSlFbRGS8x41gUdo9fLt2ckl4P+FwOVtEbXt6p4OVMNglwK7MjobW4gyyiwgOZuiELr/rPFPFuy9t9iahte0J7lrW9vXWxZvPPnVHACM9vFqJbcH22NuoEEk5QPrgSRTB08mgn2En4tJdw153R8aZmpp20Y7rmoxAwQxAsYKalyhIxR9mcH92i+XbfucBpqgBXblVcW33FLyWalngVTOv35qwURGlBYMdnJ+qPse2driuJKG/m1sKpT3XLpBcQQI2T9yfj7JraYVBnsPoz7PZmCKadf/eNFwPLVbGQGEBDKEkAdEJ4iiyTp1s4ACLsv8Nm0p+mRg3ChYP6ZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:22 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:22 +0000
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
Subject: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Wed, 23 Sep 2026 13:42:29 -0500
Message-ID: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6130a9-99ae-46d0-199e-08df19a28b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	unybcfVE40tfcUX4JEuOK0F5gJKOxqiOFykxJWWEuszaPY0wlF/O4Y3tL2DIqjRYkCdIFWYXrqAK2V9vYrSIcJPaB8JPN8P79oYahlof8T7q5KemjVpXPRPDbJD0hJdpwDrBKRIyY0OZuC8NhPHBTEozBwmvYsRYJ3zAJK4G8qZw68XJTr/FGQLh29P/86PDIws20MB9B9VBsJ3anSfLJ6LKoHsbRN2jKz7EKBxRhSHFXy3L+gHH/Ic1kNX0oXijNY57SGeN47H1f83pinrE6blKXwgBLoQID3+puAb5qrY0yCla+rS7jKbpXIU87yFeN7HOk8lP8vj82EnyhUjXBErRzTZjwvdT+qyUcq6ws0wRrwBVq0sYrriAZ1DBfbs49UlopD7cvK0a2D9/SrXohQCN2MPOEow4y8O87IPyDLjpKPn250fmSff6L6rnQYbs20i7MuyZ90BdzyPxDo2HGlbGwRGXM29hxn3V8Y7Az3f1qtFLnCrYnLhZSgjepvMkZOz1bH4TMM2VDfI5rctQhWVl2mEkz3vD/zq6KIrejM5UqsVwXHrOSI3ir97qOXeY1oLETfhzzIvfU5BkDCrkCmaQLPq0UPsS15gnGHixZ3nibw2E1QZXq4DEiXd26DOZPZcRLNblEi1ZrQXelbwyp6I8sc1aKzZutTFAaugB5KM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rE7SuL76R5VPYDlvcIL3qZQQ84Wgf05oP3oKUfYheg9DIItnv4hbOu561JhL?=
 =?us-ascii?Q?4g7oqTHpbfYvze8DZoZs7Y8Xf3zydDWTDDrDzoiEDD40B9m9Mm35tuNp2tN5?=
 =?us-ascii?Q?bIgx+hjCcw8VRDa126jkr8GHY6ELibUqtEFv9dHRBPIDcsNPtfTQfeY1Ticp?=
 =?us-ascii?Q?WW8kaSaNXrDEFWkq5Lmc8N/Ejnf5CKQIoPLV8XTfSjxOhMhwz1TJP69PC7Sn?=
 =?us-ascii?Q?zGDikfiX645y3ywypZr6zgZVuNEez9JR4GHAIlIjcr5EkCl0GXiHkf/U3Vgn?=
 =?us-ascii?Q?vrYKU8dDV32Pfa2/ZmnUi8Qq9TlgxjCp1UU2NMtstSLgv5Iz2gYc7IF+pZQo?=
 =?us-ascii?Q?JFYOWE2pTb+G4z4m2ar9/M8O+NUyGGTKR+ufxVdVqoI2tvcReGRGz8T8tY0k?=
 =?us-ascii?Q?urOjQhbh6f5VicxAkykwXRJGTI+UEijBz/elAqzKLRoeEBNhSCRLi6mTfy85?=
 =?us-ascii?Q?Rn2BAaTlIQd+ckbgCr6ShoSASlZHUS41i7yWqtbcXKLNfGHvLxkayYpKMTKS?=
 =?us-ascii?Q?5Yc2GpypoTLunNu7DBuYsyvsJs5Icn0uB0Y+qWlyeq62EHTJqH6lY9xKlRox?=
 =?us-ascii?Q?SsrQaYEtvuxI8s8xyndsZLQhW38A/g9/VvxpQhZ1/wSgxPc8JTlZvINbKGUH?=
 =?us-ascii?Q?ill8DxaOTwZQ6KqRQsot3jckbL7VTbg4luUgLJ2WPveagSkZQWYrmR1RXRGw?=
 =?us-ascii?Q?ALQ8DcNjDiFe4xD6SCc6qo1Etxkt7+xqC9Rra1MeBEc0vaDzsqRd1ThoD2uf?=
 =?us-ascii?Q?gMlumygJJ5ZydJqiY8oPDAtOmvxvpg1tbWqFYD9uXRKg3XGPXAyXLxDy0MZ0?=
 =?us-ascii?Q?Ver0LL2QKYVbnfMhmlkxjLK4Ul9BrIQ7Zklmvp3HrbeDHR6QQfBxSpgwDfvq?=
 =?us-ascii?Q?OnhuYsIs9xRatOrhelE2qUn57YVxBvI2ZBd+yHErVGhFPnSEdBHZNbuPl52h?=
 =?us-ascii?Q?RaoibM6MmJSbZSck2M+tqheVvm2mbfeuH5U+7pMsGQJcz+i96Lhf3jOCWSfN?=
 =?us-ascii?Q?3mZDuBwOmZ89HXQi2xyDMPyk1Hd6IzY6gNVGCaLBImhJU91tmghmptfhU/jY?=
 =?us-ascii?Q?Qm2LVTeces9ffrZ3UFqagsSRwK6PlYUUl0FYMaKIak+fuHQzufJxN0oBLg2O?=
 =?us-ascii?Q?xnvqLzUVx2VedqCQOVydxuJhrKpENC4Emh1b7SDyA4BiIyOctgUbgSvGfNky?=
 =?us-ascii?Q?e3m3uS0uGlCQTHhe8P21Q9TVD64PESSJo5lC9CljqwzH97qDGU7WtOLdSO2p?=
 =?us-ascii?Q?W8vHQzgX9d9E6eT6/KZ2G0AZfScC7Xto737gOJFlwanyFCgcEU6s5KDUbkEX?=
 =?us-ascii?Q?dGzZamxQPLaX/QYLuX7n1gn8HalGkJJZcURwScBW4Qz4L9UeUXV0vHWJ9kmv?=
 =?us-ascii?Q?+didCjNouMtNFw8gomqKd6ZXwDLsrXcn/83y+Xptz9uACT6BrEgTEClfDC72?=
 =?us-ascii?Q?nmLFaRrzBqinUd1aNNlfQuFacX5gXKlltOQf0soGZZCIq3UAzYbO1k/+vrw2?=
 =?us-ascii?Q?GP68D61tiBk3iLtJM70V3DuTHccYfOFtXIsBbxtSxnBAj7JFwwE1F1L92WrR?=
 =?us-ascii?Q?OyVDI9hcxWQy9L6pj26Ixz+2TNwgeXr8q4tE5tr/Czu+BQJ4jz0tR3K2MtZG?=
 =?us-ascii?Q?/cANAroCBDRSgHFKQ5z9v83a12id6s5059FvIOiDo7eGkpEDXoO5oj5lIaDx?=
 =?us-ascii?Q?khDEOrK5szAWr23H+pM+ys/mCfY1gNBat8sc4VBPftrq+mLy48QdwZREfXU0?=
 =?us-ascii?Q?toE+cROenacQ82TQBgfbHNftwjWi5ErmBssrEWiMsHgTkVAI7wGt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6130a9-99ae-46d0-199e-08df19a28b61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:22.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX35qz3uQE5DpyYBIV0ASKMDB1rQgNm0u6DJzl28tNzr0qhfm1s+Y0G+TuEA49bQ2rSFILSa2jLte6K0CcUaYkRDRutu9+s+zYcMdKOzAdXfxc27kWeOy7cVvP6SJMqL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

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
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 46 ++++++++++++++++
 2 files changed, 101 insertions(+)
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
index c18f71b64889..5c82255b92a5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -88,6 +88,29 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG devices running on the bus.
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^gpio@[0-9a-f]+$":
+        type: object
+        $ref: /schemas/gpio/gpio-rpmsg.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
 required:
   - compatible
 
@@ -150,5 +173,28 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+          compatible = "rpmsg-gpio";
+          reg = <0>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+        };
+
+        gpio@1 {
+          compatible = "rpmsg-gpio";
+          reg = <1>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          #interrupt-cells = <2>;
+          interrupt-controller;
+        };
+      };
     };
 ...
-- 
2.43.0

