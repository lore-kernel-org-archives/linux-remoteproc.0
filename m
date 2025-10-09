Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243AA286426;
	Thu,  9 Oct 2025 22:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048858; cv=fail; b=IrYv5y5YlxG0FiEmj0obkPLFtUobhOqCdsdu3AZXkaGa/ABVhyjoR7o8xXprMmeIjvQ/lsW9IHRp7Sua9V3FbIwXcZKeORMnM0RbkH+SCvm21Dzh1nPs4JxLlHYFPj29/U/myiz9yWbNfbHXbmP674rhH1Zi0H7pAL49ooYuhF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048858; c=relaxed/simple;
	bh=dJvN3PVdWTU0uEkXZDJ6LK2XGCjZQ/LHcxCeyghw8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxoqtOBHBhbad2Xf5v1QfJ0BFfDUT/Nl4iHIsYz7n9i8HZfQRE0QIlPR3oHRFb2b6i1VNRbjxUF7UJaS+76gD97w5q8DD7U7WywuuUn4GXCbiHPEKoOkp+OyaDpxXoM3me4e4JBD/yRw8CSyJF6kr+WVR7/S1c96TJrksReAHpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EO1+ozQ4; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EO1+ozQ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm9Cqw8dbkNdd2bVNY+pjYAYDPyr14XPdR8YAgGQPS6bWYuFuLRfZdkTdxvQxBofeTFYeWWvbsmRyTqwmyLjELhKLM1jffgt5XKxCozagv3RiM9EokhOyONa1a/LHvnUQzczjOms2wFmx4r/ehQkQWl8Tu2ZYdrrxNIZJo+eEw8Mi2KIlxggdDXIGRAk/2DZ+FiBSDbrSbTrFlAawmgpS5wQkQo19Pnv2QUyLthikrf9jqM4/a8qInlYiHfvYsll3oga6zf1M0k8eoBmp55It3kRgRtvVWxHpZzuwgjmUYRoiGY6zBOEUDICRlFGPaeibDDV1UPTf8c549/YuXDhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=YtOr6HReGX8f7//xYlkVSs0gpIK2F33RDfIDM6+rFb9aNwuYR1oSPaS+hn8/6hR9AQ3GN44r1APgQ7I6r6LjmPbywFqRR5legXyWMDy976w8AX5ZAFSl2coaRtuosdNwmnGAZnHHY+JOgpFYVtQg3yVHb+MNrDUZjRvr2nb0IoZxva6W1wqJ9tsEdcy30ncw4rMV3XIFMz1p/GRBYTe28xRnvN4G1ckkgzROrYEjp8+ldMsNXJ4xddqfgeFsV4q86tcdeEyxScMFFZ4wZs9K5Xelz+6NqYDomye4GZgbAdVhn5kcR/AhRb/MIVv4wY1h8pWoYJWJM9HzxEP63D/iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=EO1+ozQ4yi1Kl0725BPwkWWKC57/MKkC5tPe0K8OxVLeLuNvD1bbzdtvBLbgmBkEgvCvZ4e5B6Y2reSqI2v+dIT+erLRbXchqlKJvdt8N+ccMDuB6y+uy5Jt78iBtRbSYnHh+Vr7MsBbNH6vw86+UkVkOd/2nGYaJOpJPUEnVbo2wtihbW7Yy75gj7JZuaTz3SCLHqwHv2Ty/Rtp8Ux0zJlhJ7dIDaDnxVfHmGT1rwk/g3BTPFKR0JaJMIr4ycuHf+svxLgGOuwY9HDdmABlzpIUR1mjHcMJHEnAbE4BTRpFrYj9SeUVEbjSdGekxIfl79b6mXCwZdRiFkjhwc2Gdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:27:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:27:34 +0000
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
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Thu,  9 Oct 2025 17:27:13 -0500
Message-ID: <20251009222716.394806-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009222716.394806-1-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b372cda-b8f3-4685-5c3d-08de07830b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H9OX0xKPOPfMnn4wnxD+70stCKMDhsrooCy40ZW31Kk/IZRPBbKeAEyCvlkb?=
 =?us-ascii?Q?E7dF3s/D2Cq26ef6gkcTMU7egr4fgVWj6aXM8YpQn4AV1WPqDJ5rSQxwwHcc?=
 =?us-ascii?Q?9aSzE8orjACiW+UlD97xSJT68mBX7keYxa/V2Qud2pU6oVBd6Nd+7D4XGhn/?=
 =?us-ascii?Q?72aQAElVJzTstQ7tuzNbYuTSkH6i7Z1HoYGkFMyROl00ALlnLXiOI+HFc9co?=
 =?us-ascii?Q?xQfB5jkoAtF2yt2yu/F0FTR2PgIY90mM11Jy6ZDDR+qIZ8zUf/Rb1bI6wG7E?=
 =?us-ascii?Q?+RqTSshqGii22y71pgyxK9W2TU1UE5k3ywnOQZWemQ1OFgdAqmAJ874fa7f1?=
 =?us-ascii?Q?z2+npphAJLdSJUwh2N1CpaCHHF1cnME+yPo0focm5cwN2IeWHz/o3TfCCvY3?=
 =?us-ascii?Q?KrD8E+MC5oOlo5w+iRTDYDix4pNrs/48D524KzW1ytbkRBzubsz6ddQxE9Eh?=
 =?us-ascii?Q?YqnBdeDW1hXx22iDWxpv5z/8z7Q/TUSEsVAZjQLc2EEBACFgmyWx7lR5Ra8T?=
 =?us-ascii?Q?0udx4SZyJGudr0fvMexv66lWz7dJx4j/A6QvH7tq78mgxU0v/+4fOySa46Oq?=
 =?us-ascii?Q?DWXZCxOuHtoVi1tG34Bx4TBXEaBMjklk+S2WepuuDKLWR2rljAUn1qwoQ1au?=
 =?us-ascii?Q?lFeUZqLilngd9BRXVbrbXXntNrvZD0VkkNqoWXBPCyTQksoV2SjaJ/tBh8TD?=
 =?us-ascii?Q?Rmyxo+0pgw0UvslcT3AtraYbIMbrXAnEvwguIm7F6uWUSXGxjeRJeqr/Y0B9?=
 =?us-ascii?Q?Ls8yJ69MR8TtrrWliUB6TC0yzrst28xHSdrnPTfzoeWUhk2mg2THQ+gi0dYf?=
 =?us-ascii?Q?o+mSf3mz/xs9T8mFAel6oaQ9JfVK8EYcvv8C6wUc9Lx/DVIKT7v+KmAJAw3J?=
 =?us-ascii?Q?XZHEozqt3EGDz2WS1nrGdiXWwT0XgEJz9kPVCUTkmPFiFRrBcr1vW8LOfhy7?=
 =?us-ascii?Q?UMkteAVsiEBXMsuNNZkI8bT/W5kvaqR7qrh5j7UHpXzh+Jgce5+6IPh+KwcR?=
 =?us-ascii?Q?5pHgcMtofsRcDKND7YEX1F0I4Ifvx7rTVxrH7tLxTyU1DAREzeeSNKnHA2Kl?=
 =?us-ascii?Q?j0Fwbnx849zuY5sMM/6FEIJ+dz5E8bl9klmk4ywjE+Oqox4jSPrp2Qe1r+Hj?=
 =?us-ascii?Q?pWZceqqKFnxx0M6mmaGdqF2g1po9TRWK8rtkYu0hME3FwwbFHcJLXXEV/hVM?=
 =?us-ascii?Q?cO2h2zzCUvkmx3ZTapuXjIUynSKGD7Zw787aXWi88TnCRnZMuCBLhbI7lBYg?=
 =?us-ascii?Q?xSiVlGgorSHxO4aQ737kDvsSo1+u08JJO3fH+p/ZZ5zPGrPvWdAgtkNsXLyC?=
 =?us-ascii?Q?8B7ZVOErAzVkHe1aAI6zx33PvPKYbsn81dju1OJWbH3ArMLdSzozXVTZjxjq?=
 =?us-ascii?Q?wIv8Njc+Xu47HkriZvX9gmSQun9dvjkRjSf3fYBQOKDgDdlNVsLnehDGNBe3?=
 =?us-ascii?Q?G/d0Fhoc25R8UtfsEHHD5VJD2DsSGIEkDeSlkAksCL9ddYtAV87nSUAgqXBn?=
 =?us-ascii?Q?H481fZP0Te67IWJrMTiWjlHNuta98cGpqKQo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lll9VYjIJB7zsQHS7WboLVymbSPBVFvZRftrLL+dUSkY4U0gAIw7/YSnr5lg?=
 =?us-ascii?Q?1aFt1FFQTuNMjnaiNYjjnesDiSROYMNehBDbW5epC9Jm1LiGGy4tyVM56lAN?=
 =?us-ascii?Q?yr0zK/vc+GpyowTjDgwC9LxBEzElWvxX4nXOHaoXXeO0P9A21cXelUi7A5K2?=
 =?us-ascii?Q?ZYOwPAF/vi2RO/lXEY8WmEeTmIaa0qfcOfMOUrQ74JGd6nNoaPWKT6LRPUKi?=
 =?us-ascii?Q?uPu5jk3XPtmUqtWlzzK0HJO5FfL6Ft1/8y52CX038RDoUkoj8+wVrJOiEPv4?=
 =?us-ascii?Q?717QZHjbWWxbbx8CU01pE+Pt53R+x4N1QTYYFuZJxOFTXfAbSe2LRF1KMJNu?=
 =?us-ascii?Q?suMRkpCQ0kDkBHKXNu9QYlq8Gq4sCkX2Cn4dB/eSyEFuKrPOg7AmD2IVJlZh?=
 =?us-ascii?Q?30LdB4qijISyDirBNVF33Kw+QHaPD3IeTqriqBAZiLUUk/dN1C/bZdEkln0y?=
 =?us-ascii?Q?C2rSfr8uoJbcDmqfKdi14KRzTfBZmFG9aU+3hpqzJB15cEIEzdhksx2nCPTO?=
 =?us-ascii?Q?YtJnvpPNV+enycAeh59reTfqnaMHeYu4azLwL0FUOY6C7XY/OzoJFhHKbZVC?=
 =?us-ascii?Q?qFPeAPzyCM5NYX6Fu+N03HBgfxedSD1tz0NKC6FWhUKISdyCviqNvGH6+T7S?=
 =?us-ascii?Q?DiOYabMoBGnsT8pzcwjMTrLzbj4IhmJvzL4ML7BPyWNgRhDtCxuAis0sH2gB?=
 =?us-ascii?Q?0SVR/Yi0zREkK1r4B84727maiUeY/67w/qy91NaZN2ieTelw7KWQu7rIt1rr?=
 =?us-ascii?Q?8U2pyVSgVG2Lda6gILRV4wXH3s3Hudsquh5UYmIQgd47EBUtFpwpVpFS6vj1?=
 =?us-ascii?Q?0o6x/vACr7OIAHw5qWBLarSEJv1tmcXlyxmMcF0Tz7uYBas3LaL57uzDyf0R?=
 =?us-ascii?Q?KEpmLiiZvmSSr8gz1nvmaQpnC7UVNPtdloX/JoVbqWtDW1lycr49TzILDBU5?=
 =?us-ascii?Q?DZnXsm/NQIUjPSELskvUIHvy172GYRyOS100gbkyI0nr7YaasGk67BX91Dbf?=
 =?us-ascii?Q?0U7X3EhU/VvDOdSZq64Li/dq1GhWg9MY/GpEcs5gTmb0C0XHjfVwi+nCH4di?=
 =?us-ascii?Q?QQ9m0Z3BT3Y2o3nu494FaG+eLUfYJH/ojfdkngYrk7u8nhc3Nfvu7GcKBqtn?=
 =?us-ascii?Q?6lKxcqz4tskxsxr6k04+tcbJet9ipEsWu3KZZeVdHntM6hFVBzp0//A8RbxF?=
 =?us-ascii?Q?zIgPYQ+9WnPUiEUhR+QmZQlay4utQ4jYEMib1YqabKXLt2j/WPpMmEs3slmi?=
 =?us-ascii?Q?1XwBc8yAz0Zs2/q1t2zeF0xWBQ9lCiqsGSCENyQshK7xu2/2xqPCGYRBPB4/?=
 =?us-ascii?Q?Cs3FTpsMen1GLO8s49jJU9hUY+fRZC+Po3AYeEnedTt7vpCg+4G1vnoVjLd9?=
 =?us-ascii?Q?Z7qgZhfG2vHxYrt9S+sDGFz0JTKlcsO/D77E/ftpQlVdwn5BzcLbHqCJfcbl?=
 =?us-ascii?Q?Lm+qXOC8Mg/SArBZJLnwok7cX8dTeCAGEoeWGR3Cj0P4bwdBR15pTR/TOxT4?=
 =?us-ascii?Q?l9keBIlwJ8kPW5GM4sdkcwEw9cAudstBl1lW5w6bRPzIlqlHiAAdZvFz797M?=
 =?us-ascii?Q?ENlKIjCBDcR5nzU5NNghi6MS8RCKV8LAEV+xEMZe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b372cda-b8f3-4685-5c3d-08de07830b32
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:27:34.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6lMVGKF9B8D/kJHQ1uIFdnxgREE2xcIEyNqkoHG+WzCzfCSYSJWQTgcKcqNYSF4LmCYFkvnPU+KAXpIKjyleA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852

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
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..897a16c4f7db 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,92 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Present a group of RPMSG channel devices.
+
+    properties:
+      rpmsg-io-channel:
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
 
@@ -146,5 +232,42 @@ examples:
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

