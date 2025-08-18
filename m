Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C51DF73C;
	Mon, 18 Aug 2025 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549926; cv=fail; b=EZSKY+HwcMhpwWI9/Ou0053LIl6LyuL4CZ7bZ5mBnwju4j+3y5WUiUExutWTZrI0f1I5IbnQ12j3q81jKsEAY0/nD5p3ZUSaEiDIt4ob0n618645H2zcOXBkTTDGEmvTCO0x3ls0Y4+anjC0pvy8E79QJBjaP41yp+46UFj1vh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549926; c=relaxed/simple;
	bh=MGh1d7rpKh1w2lZHAN+OXRD9CK4rXY4Ig9lyX9YNeeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tAjpfHZgQ2rFcoEdNw7DdJy31o5WqGNmwNe5RuEPXQTcDa75Pfxy0JQOO8TjLPlpTXVKu9M6iH1CLOq5qzuR4LpoigWxDWIdKQaY4uuRAcNxLCoROpS34iFG1uAOM0UdSOEB/GJYqZfn8rBblYC8dRUWnUPG35KkZ1KpgoKd+ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lWjdEFcA; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lWjdEFcA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMJ1xRHL1F/NamAXfUUPhDLMmHJmaEYr/xP5gV50gX6lniESoW6yoJp32ZwJUfj7umgHssBmkrfD/TmW1q3WO4eQ87miwPgA0J13hJI62stalHUoM/OQiO9tnCwlWLr4VYFqnM3BWSfFZQ8gP+r+1LNNeECHmIUR2bM2sVDLmv0gPiG8KPKidu6ejVPN8SUOpyHNkwr+vn38DNS0oLYXt4YPduBlnQABqgx/25sQEC45gWowryyWGYgFUaz2YYM1iD5b6JlGcTXwsZReWX6nniah9zxcHzUzva889kShqgKFPvT0lAGDDvY7FlKibYmBeX6vyaTgaO9iz1PA5vTkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap04mJfLjehbOYil9cM9HXsXgeJNgrj854yd6jYEThg=;
 b=AYaVYE3IHXKgIBQDmZ6JkGSzVKoZeOQKolSnHEt+/tonCcHcFyslpHZoaMppcwoD7QAj9ebrPDgLrorOU0fweNpwQDxhLK7JTOI78jDbMKwWYMOFkeE2qhKp+h9ZhwOQ3yf4NW0tDMs87zcFkuEyZviF3xhbT1HyYkij4vypQqFjcmS8pLS+qaCcPTFo+Q24XCQFJMs/9w3FaPdxaiOSSxqNe3BglHF2Z4LXipR2ajrc3vDOcXx4+49KlV+0IxrWmJM2DBCEbp0WzheKjA7NFYOztegL6P/CTz+VOtvnDDkge/f405vK8PXxK2luF1LESSBLad8H5EWTDq8DQ128uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap04mJfLjehbOYil9cM9HXsXgeJNgrj854yd6jYEThg=;
 b=lWjdEFcACCWeqwHNT7SowVW+htWlhKALVG6zJAtd9dqpzRT8aN9k1RvtDZtdry7zHhrFLI1TNnUoZrAHyWa1ffQ8xuRG2JOJv9Z7jOzr6s+3zeSxTszFR5lzlYd+8EaNBLTpqQTVRf4BlOUlCAuWB9Mjw34H6NTtWWWo+dBiRJGwcF1kdNqFo4kFJsLcR1qmFPNjriNWOFbEU+takxEBxY8NC4sorQ9Iz+5UTB4+Smxh9meTiDhWIUQlyRO0nkjJJ+er28w2mKDIMalRo2M9NypcU0T4FGqs0a26lvca+js87GPxRb+FgkvjjoChJy6faHDkvXt5FFvAWVPzG4nyJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Mon, 18 Aug
 2025 20:45:21 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:45:20 +0000
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
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Mon, 18 Aug 2025 15:44:17 -0500
Message-ID: <20250818204420.794554-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0092.eurprd02.prod.outlook.com
 (2603:10a6:208:154::33) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3ceb42-7c84-4d97-66e0-08ddde982567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W8bhoyPwNOKEzw+zQ5IRQhB9n89VxE5aiZYenKoxMGJy5KsGfbn3TZ4zNOvi?=
 =?us-ascii?Q?YURwlQ3CxgB59nfL49JH9W5tJ+FjfXgifrGxOqrUJD2R4Wv+3rW0n8JtMwLY?=
 =?us-ascii?Q?0WBE2nBlYYVt4PM6fuCyKN5ESReqzDYHz/pin8yE7K/MpsdfX3ieBUSrpiOr?=
 =?us-ascii?Q?7h762OmWLnfwoAsxp2HFa/PJ9kNLAsd3bU03Amu9KrieoipOljfwieUcFbVw?=
 =?us-ascii?Q?BWQZEZiFm+tug6zTqmTzfsPy1wWptPYK/yh8ivnwqhXYg45Z6QlwYPVbfrMW?=
 =?us-ascii?Q?mbfW0p/63zUWiSmDMDvmH7N8prUxmnzj55tsHNb9DcpCUOATArrpqx6C/mqb?=
 =?us-ascii?Q?SYncqOVrlmE7lgygYgHs1KdtViBem5cYRcrWp8ItJN3HZB0bMBgx46GlLXFa?=
 =?us-ascii?Q?wWVyLbgBAv1fGeNfcKJWCa0xo7tqAXjiYoaoIoi9SbccYZnJOVYzQnVsDC3U?=
 =?us-ascii?Q?tr9QuK8FnLUy8yqWubcNFavNIBiljEmXiZp63mlmnbOroiA75fo2DpFnMciC?=
 =?us-ascii?Q?1PxrlRTY+gO/zAciq1qRBKrySUbGSVVAbDswhZ3TfUKORk/X+aoCZLGHlGUu?=
 =?us-ascii?Q?NTRzNZW1K8DaExYSc9DGlfcRxEEChSTlVmYEncFhX7ltbd4kZ8axBm2JVtWK?=
 =?us-ascii?Q?Yj4i12cgIpOP1OnAh3HDrhEaNLzsqGnUonCFkUboNqTnx5nKLmLd2ippmhjL?=
 =?us-ascii?Q?NuuF2ZvQT5eVEgABD7SFBVD1cC+IV9Cd0vap+sEA1OLWZqHoSoj6DXMVwgyl?=
 =?us-ascii?Q?QsCQYQBlP761SKr7R0HsvK9CzcKZd5zPTB5Nb4FU4bIAhRiAJjDK41fZknqr?=
 =?us-ascii?Q?FNKaAXUcpVHlXVZ6uDWyRVK+fhMWl+qDGEYXmz5fM769nkfNEBrPCPXw5aQu?=
 =?us-ascii?Q?vLZvjSNfOuTfKpzqDMBSXLh5uAXb39Zt+PVb8DmOhd9U4qEEchbytAcevgxG?=
 =?us-ascii?Q?lVQO78l0nZHDM2HOsWWtSBCtxA55W6DCKNRgXplMk/hfW/s9xU96EdtC1kyc?=
 =?us-ascii?Q?3+M3Maqj2Br2V/Xk6xcxkSo2lJy669QVjhiF3UQvtxWGdOvtxwcM2TfN7kO7?=
 =?us-ascii?Q?cSVxW1kB9YCrHMscuTBxh9C+5jHslBuMsgz+4oPieF2irn3tK2tFLRgv05aC?=
 =?us-ascii?Q?YyjepTPU2TNrhwV7B1KJhMhOlSW+o9euG7ot9TDLj/s0DladV7I3sfwEX0Le?=
 =?us-ascii?Q?uFZYLVjqAbTbAww5uoVMpBM1HWX/qBFf3hM7AHKYTOffZu0OqB/BVxyH1X4J?=
 =?us-ascii?Q?Dli0/SuLK0Ii9iMvHnHaUx95BNq5jg6z/S8qSxFXV0cLa2dkYO3OIu3g1Hwh?=
 =?us-ascii?Q?16EKD3+x2bP0XVtB5EikayJexDBVxl5nqqqqNGOZEY/A34u+AaGbENP0UO2k?=
 =?us-ascii?Q?It+hMJdPLMOyBvKlK7Uyj357vizyCJSfpJTmYmcbRbbY+b/nTp2PB/ppOfT6?=
 =?us-ascii?Q?h8tjjZL6U3/GXX2Q6Wl+p6fRehVbXdj58LuBRrbX8heQIQDYbZw+XQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K0vY1xMmEBWGaWGETxoLPn29Y+Wix2uHz1c8ZsFWP434Bm3flx9gZ1l4Tfdq?=
 =?us-ascii?Q?fVAQqzOlDPbHU8Ww6hRIJZLLOQdosUUdT/F1BU2evO3bb7ZtuDy/+x0jcEwa?=
 =?us-ascii?Q?UNUqp6BxJ39mCOzffrZKEm3DHc0Vx3ATbclidWTwhV+ke/+F4fZb1vyviMX2?=
 =?us-ascii?Q?+CcBT98SqECVO5YFRIJD4OyK/P7zJu2jNixybC/d4LmqqwSkrcXLmEhoHVDc?=
 =?us-ascii?Q?Lg7zv1zgkdkCvVz0DSbDE0bA4EIGbiIb5s5qmk7smmDiYTwfBoXyEPBJMjVN?=
 =?us-ascii?Q?0SBkT69wBTqF9eYFD4leYJOKjBhjcGnBze8ogkwiol+zjijVEcf1zdL7NXYz?=
 =?us-ascii?Q?6EDRvPF7mXT/r6UUwR9tJDEJK4Qix32noCjGc8fUQGYD1su2eGQ5muQtDyzO?=
 =?us-ascii?Q?c/T7XVh0TZTbAXzFGhXjIk/PfhiKaR/S6CrB8QIUmkeQqOT5kHlVjmzTYIAB?=
 =?us-ascii?Q?E3VAqlb/SeU3hHyfabL9lqPaKyzWqYZ5M+H5eR+wYZV98lnfMBQEie0tTTSO?=
 =?us-ascii?Q?/RwxGU4/MLuRSMNl+/95EO+CCzNYlO8dMunsvo7RdkNR/P/Lsir8BZb4+ARt?=
 =?us-ascii?Q?bPOkHw3G83rwBiwKOt1pxjPSNYM9silzIHEjPtdzhxqwlgM1/+ElyohdwWva?=
 =?us-ascii?Q?NPTWhLhjtK4AdyDLPnne4dS5mixy6uQ1b5By+545cOu3hk+DfgzRihZsLoju?=
 =?us-ascii?Q?K+HtN8lb+PgqFoJL4r2ENyNUoJUSKMjwlP/UCavlQxRaGCCclm3AOt02sAPB?=
 =?us-ascii?Q?eFdUkg4tmbW+x/QeZHhas58QwaxlQwpviu7nziYdrBY9MR0OIxrQIfMHKx21?=
 =?us-ascii?Q?iMHbl8mv2Q4mLRtTRL5oNF+kb9Qfnd8Ee40obpWYfumIY3HLD0a5pvoEK1Qk?=
 =?us-ascii?Q?ybH1HeSjcQ3ub6lCBzbsKti55PlpXYieTYogsJwjDy+CEgfmDvTee9CjkW8C?=
 =?us-ascii?Q?zvu/gO5C8Atiyd0HntbJP6URHK6WJjoRBFfOiIav1efaM8gnIPqJL/MsvFIG?=
 =?us-ascii?Q?KRJg7rAOOHbY0fx2iKdC0KMr04W3yV1/0ytpC7pstnJX3Z0xFGw+uRAgDBHI?=
 =?us-ascii?Q?6Ge+L+/pixvpJi26YOlM9uh3sMpJu4DAzBiKqvYbqGmMKfGRBooStRLxfSWq?=
 =?us-ascii?Q?DhlTAzLfOvtyaIS45covj4J8dQ0B7YPdszlfARN55d2j6BLZQ4EPYW3qb/DL?=
 =?us-ascii?Q?Qyy2K889um4ijUH01k94iw2MUbbCeLFXFFtarQ6HceW7AT9gmvQFQNqrCD5m?=
 =?us-ascii?Q?graGaYPhwuMJwnnPQkvvUPMICuNtv7ozQmQotnc7ugGmEO4hmqO7ydbk5dkq?=
 =?us-ascii?Q?jRk7Tp2J9DKkZmsvAFnM+VIng1O+yTzMpR1gacLPyZ9Q77FRUIQ/QWg8BFOQ?=
 =?us-ascii?Q?IXz3CUZdP7HsNC7upl8KsM5HRRz3HJmH7hEiWZS0Zk/pzMbTpWj3UTa6To4d?=
 =?us-ascii?Q?uxWPNntiEsU1EFYmEeBJtHdjh5yuDzFSa1rm0LuVyFsg9VeoFu5IbfXw+ZD8?=
 =?us-ascii?Q?pKD+uW834dsOFc3+Mm/hmVUQulybSCwSJ+V8ZE8PJjUp2lZ+sDsJhKULXGEl?=
 =?us-ascii?Q?hKlh21Ixypf/GhS7I4dqVDNdyKzFI9O/PD9+bzDc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3ceb42-7c84-4d97-66e0-08ddde982567
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:20.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty4M3TiMzNSVF/h+2WDO/R90+Y6okS4EnAaIOeTIFrYMEBcW9gew773AScgduxKgF4qrPNasJDMEKRruUJGxIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

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
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..a105aac798d0 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,86 @@ properties:
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
+            required:
+              - compatible
+              - reg
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
 
@@ -146,5 +226,42 @@ examples:
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

