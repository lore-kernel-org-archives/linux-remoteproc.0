Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C1205E3E;
	Wed,  5 Mar 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168871; cv=fail; b=MCylAl5fD39zrIdZlH3/N8KeOWTGXZtz6VmgBeAH04+eV0Cxi4n0yuFWXtO10uSqto3HOZZ0wbXpaX3TmcQDatsAWwSu1IlBS8wLMPVdmSm23O4jf5eFYVXgJi5+1Lpn972MzSLZT+Rv5GmIzwLCc+yWQZ4mdBqpPTJwwdBX8vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168871; c=relaxed/simple;
	bh=yOe+tdSfV4kQ2i4yYHtuRcJ1OvYEDiS+u033Zq5dAKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFq0J83Z2pmaE+FKn2zC9p0m6ns1LrKn07sj4sXYPib5X3LEiNTFnuEr5FFpeZ+LDDkaIr/yWs3Y1HxxL3UPI5L3vDrBfSga/VuX9igqSKDGjiNxmKsUMkahjAax6hjH0g+RK8XGkhDGpYnClxn33hzNTTFZlOWKc2uA6xytM5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rb5p6KBn; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rb5p6KBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RANCmJHT7/ScOHb1wQatIioaS5wl4YlvyTpo6TbRa4YGVpCQr1rf4Cq0hLNY8UPVI7YLO868fflNWcJ93VkJxbVvn26crtS/GFbDXjqzq3o/dnhGpGdcibgfwfruQ6shRUnqvvOYfyfP2tuX6uQVsQ0ntGTzLa22uRqXdX20XaFk9KdXi0vcJLOLjAWSfzT32FqxmC9IgKNGhfQMkII8wGPigmrCH1I1HKmftGye4eCU65moZJPW/G/PKeYltWo5VnW9sGWwU3yRNfYEoCv3JuulWG2kWSKGBzn5DjjPtO8peDXVM5WqKrbn6CjpFlR9Jz6FAgVxtehsxIKnvZBoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKy2s+27b2kojQ0f97gloccGL0feO2hcAJlvBdx21Lo=;
 b=XQj0cBTLOSCYh5Xji3szNK14HJRm5z6lu1i2PbTfOpNJg0Vlc/BJdqgHDCXNRR86z259uxpj0IJW2tpTHuRLlnC8m1rKx0FL+/sD0A7T7xysvvFHbQl5SzVrRG5bFYhgObrS3vPg/n5BUg2TlFOo5Mncyy+lIgr5pRAuDqMo79Eaac4I4cgEypoXu/YrADUakEaF8E1D2k85jKI7M1t/Ed4VPc2j4TIwSykci3d+pGGIRnscfrCo9okKhSS6T6D4nbV0iPKWCoHLb/fRn5EfySVzOeA9XgaDPdOOCWOfiqmuBvrPW/ENjmlInnOA3r7ClYL3Zpud3TIcCD0zKks9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKy2s+27b2kojQ0f97gloccGL0feO2hcAJlvBdx21Lo=;
 b=Rb5p6KBnND4hT3Ys6bMgfzcR+bNp5naBZnkf/QgthqG3WXyRFbp+YvhZimE5uLsy6Bjrkp0dXM7YMIufu2sPrA1Sc8/KcMhzhOcN87ZnRfTzSMY1ZP3X7J33J7kLvLJCDdFAAXD1FDCnkR9F1nVueKbsbseY+SmCtTe+k7UcyJ9BrqB9Qfz4YVdzVpnozQ48L157cAk+U4SaonJnY3x4Rn70w7DQsznVRTYgZ70/M8VJZBcEO+SgQJs1Zx0+WXWUF6cE/xHR2N2LNWDg2bh0/l6KoC3jYqDazNpNhuNNUJA62vjaM5SMvaqonkrCP2XX8fRB6IozY57IQhd+PFo4JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:03 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:03 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v4 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Date: Wed,  5 Mar 2025 12:00:30 +0200
Message-ID: <20250305100037.373782-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305100037.373782-1-daniel.baluta@nxp.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3e644f-497a-4dcb-8ce0-08dd5bcca37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?63Pq/RXnEWHWI4YoqSiHuzmUoMqvU8bTIMUIuNtFEh/qA9Xmqaq1zpkU71zY?=
 =?us-ascii?Q?dhX9PG/1hSOE4NK1DW/aR+ylaJ9nxNxWuvMiZwD8TJQpfn6uvfH/sAwonxPe?=
 =?us-ascii?Q?qLxSwmXg9tezKJeWkesPOTjCoDQ0lMgu8BErQ0TV9DHkl0QNws6KlC5CtkIr?=
 =?us-ascii?Q?W3+x41LBphoSACsJPB0bCh2LjQwRhnipa0vagwNH+D+LvmyJjzkoiavWL3nu?=
 =?us-ascii?Q?hV+6umoJ7sh5wZkCGEYY484+bdFUTH9wL9mlQbfzsmSSm/2UYNzVr1oLzm0/?=
 =?us-ascii?Q?N7i0LJCriBGMx/OVvCi8xSboGL5GoHh00FkxzAdUX10ArbnJ82YzD894c3bU?=
 =?us-ascii?Q?DYyFu0S5XVm6O5b7BVW5gNmNvNzLMFCcRT6BHNieDiBjP76+O6He21pIEVGZ?=
 =?us-ascii?Q?GyYxfoXolgqGmvOja88cuuD0ReCncU6eGgxWcsWxlZ3B/uToVkwje99Mww3X?=
 =?us-ascii?Q?/WoEuyE25LW/98c6So3r6sKl7m7ZJ3JzTh8wglyvmqUpRbChzZyjj9cXhZOy?=
 =?us-ascii?Q?LcowgzMEUK1+3uwjdBVmg09vlR/7D3wKqAIljMlfcPj5kBzMcUMAngpizZhV?=
 =?us-ascii?Q?OtrLELR6jbip9EVMUgGBKEfMunbpb26LBiwRPdenCyouJzBY8jMrlanZMUxu?=
 =?us-ascii?Q?MA/XPwSSiYoaJdWw53kDOu68waCm+reihE8Kf1xXl45S/rdMOZXyQNEUET0w?=
 =?us-ascii?Q?YentA3pA3Rlfur1ZGi8xZY1tFTfv9KNU5Uvl8X5srnJ+25p1Qo90Fuo90oEa?=
 =?us-ascii?Q?ZjkEHMcnKLRXAmTFMzYhz/Gn32XXUdCJX+dFg28I7se3LdqDbRMaBL+nYLt+?=
 =?us-ascii?Q?9//BhttLV2Eti86yOJkcAR85oCmL8z+wiG9M4BCWaX9T7X17X01zsHeaC9la?=
 =?us-ascii?Q?MAzIlNgm8sI+EX2AB7t+cJ9Z2iBEVugK3msHGGA+Xxt4DivYoR7nsbXA14aT?=
 =?us-ascii?Q?KQhtX6LsH1EbC8xZVKn7EqJjiicw2CF8l3nI8jNILRx14oKF1kjdLZqk/UEH?=
 =?us-ascii?Q?7aNpaoSnQeQD/P5qAlrLGKeU8NICcUZD+ucxAPcHk/xSlxCCKhB19yFpYCJ3?=
 =?us-ascii?Q?PNF8McrtMKQ46f9GemPYBfAnC52Wi/KBx+f0qV920OOlxXRk7sN2ASLTwDNT?=
 =?us-ascii?Q?lEhxotn3UyWGly3aGbc0S+8ZitRb9VBlJ4N7WPGAJc39Vis2Kd4PZjtFdu7C?=
 =?us-ascii?Q?wtJ7FscwJk4nRMXa3usNOsoU2LOvFxPUoBUjTE8r5pEN87Je8e4lncYU/3CV?=
 =?us-ascii?Q?eGfABOX+sMCA+qwbzq11N0MGIgRUDRkC3rTcHK5mxJPtU6ULybKWx5/AORsh?=
 =?us-ascii?Q?tmgEVrqAHuo5I4S1yVgeNc70yfpPwRd/ft+TT7cWfeMruVdlA9poGDJFnhGN?=
 =?us-ascii?Q?Op0/qfy1CpGojXtw0Gfyd4hFMi6NtS6ZFdPFetfC9ksa1oAldVacIkkmtkC9?=
 =?us-ascii?Q?gupRKdewG1C1CIQ6pGpU7HwigzPk3MoL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0qHmmjVr6T4y5/jiAekpkIgbEPe1t1lWffNPJX8rSy58IoeFqo54dPQfeqf6?=
 =?us-ascii?Q?Z+43r+ckF+sEm9vhW+nIqC8udETzHoeCQWvFCwIi5XE15FvTC8CQoaSuTdYo?=
 =?us-ascii?Q?B6QZI1w7OH/fe/0iFD3ncSFNgmM7BMr8nBwaWYo8IBBxGPj4FWQgWSrA+mUD?=
 =?us-ascii?Q?OPv7d0dXul5mMQ8AghZl2jUpKdcmsUib345fCOKCVCJavjIQF42HThxJs51o?=
 =?us-ascii?Q?X5ujeGIw/segWX2WWvZ7G3JopxjmEBF4uAZWAV1P1yAQoN2+eZjUe6X3jyOt?=
 =?us-ascii?Q?8xq0jM78zu+3TamUHmDpnQX69MOzpjKcV7jkzTHpsSGhgb2nOSO+umHvOmqg?=
 =?us-ascii?Q?6pWmvMCnjhBT7l6PpXdZXSPX2uIPkEsDaHzymosJAX4n5jsY7xrsDyxf0zzX?=
 =?us-ascii?Q?bHQz3CJ4DtlEKLc6BNs1eM8KlBtgoYv0fuZr2jXq9xAMRhao3A3/7vysunZe?=
 =?us-ascii?Q?B0U+j3FG3lJsUOT9HII6aJ44yTa3/Er0ZOApOt/Gfz2C7XkxcxnwV3ZEcF7l?=
 =?us-ascii?Q?Rozf6Z9FqwmO11Vjkdmzuk/sH41VFesk71Ca14nIQ5ZEWZpiOWSxqRCLd1l6?=
 =?us-ascii?Q?DRafOFEF/HXi/d3IyCbu88gv7ldGME4zkp6FU7/++8uUi6YuXyklKq4WdTD1?=
 =?us-ascii?Q?iKXXqoarpbx7IHc3xtzOU14v7dxiirouF0eFnmn2Nun/yWqKbP0gn31jTY1z?=
 =?us-ascii?Q?eAnFUYDPtviEMvQa2EA/qSX7KIz7XA/M3iPETMlgifiV0j+azvd/4TFZ1YNJ?=
 =?us-ascii?Q?tj66KbnkFO/mG65qSU0G3zr8Kc/oF4GThU2epP1/T/Acf46qBTrriwSoPZMk?=
 =?us-ascii?Q?NTTP0q5yjCYkxgV8nvFBcdEOYeV8Bhd3BlRExSeX/692JX72CJMkdn6Rcmw8?=
 =?us-ascii?Q?ciRs/M1B2Vxf2D0b4BEyqmbAqSm88LVYIKtUNfZ2c+GjCG7QqzR28DpeEtVh?=
 =?us-ascii?Q?DynLfsZhJcUWDtrNc8j4b9pAtMWLCG9Vq2ThOhIbWyo7jhEcMoSIKQYA6dtu?=
 =?us-ascii?Q?FKvXZDpSB4Qs3+lrSvCnOenDUx+hY7GrWTXx4PlXzVPZ+s1fN8gOcde2dZ+m?=
 =?us-ascii?Q?lEGve2GOv4ewYbiGAFhInXJTcHCOAZ1VbpRQrZChL2m1dmZFk5zGxPwKSew2?=
 =?us-ascii?Q?85Ubh0ZFx00p5HMScMJ5CgspRqEHgW5MeiU937hd8UNTx3bE5TCWs4+GeojF?=
 =?us-ascii?Q?8PKYIWvklra7Epk8Bpdf2uVN584ccsTARP3W/m/kVZY7h9kZSYC4u4Bklf0Y?=
 =?us-ascii?Q?zAyvUEl9dgdr+8jmnuLwioe3vNhTF24znnYoctdsvXoNlZNEV6aqIrJSWvT1?=
 =?us-ascii?Q?bipqT7xDDbi8LJgo4SkVJXGsJCe3zHGA+YKu42UsODqGjeMZwaNV7ss4jXBB?=
 =?us-ascii?Q?NoB/D9rjMkCGLzdf15HaWtsw7kEUYKgSJ4OviIxU0dEbHJnNnGZuppR9mnne?=
 =?us-ascii?Q?96TVkfpshghCCQZdLdbelPLQUAM1ap7x/lPfI27h0hSTA5DaHetDr2vsDAEv?=
 =?us-ascii?Q?XvO5crrvCJv92gjtWYPHMsql2plgpZT8V7ZqucCBssv90t0lnYLcE+m8qmPy?=
 =?us-ascii?Q?axj2pYQZynUHCXWbWJlE1Ujsas917Ne9j3SYZGuL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e644f-497a-4dcb-8ce0-08dd5bcca37a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:03.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtrdCIgpU9cbdB/3bs1VF29V/dQ4+30SXrzXpkpF9YV9jf2IRw8RzqjkK6CvUL41a57W6rd6utEdJNKcdkT0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

Assert and deassert functionality of the DSP found on i.MX8MP is
realized by combining control bits from two modules: Audio Block
Control and Debug Access Port.

Audio block control bits are used to Run/Stall the DSP core
while the DAP bits are used for software reset the core.

The original plan was to use fsl,dsp-ctrl property and to refer the
audiomix bits via syscon interface. This proposal received NACK from
community we shouldn't abuse the syscon interface [1].

So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
interface instead.

Example dts node only uses runstall control now, but softreset will
be added in the future when we will convert the softreset functionality
to use reset controller API.

[1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..b8693e4b4b0d 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,15 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  resets:
+    minItems: 1
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: runstall
+      - const: softreset
+
 required:
   - compatible
   - reg
@@ -164,6 +173,17 @@ allOf:
             - const: txdb1
             - const: rxdb0
             - const: rxdb1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-dsp
+              - fsl,imx8mp-hifi4
+    then:
+      required:
+        - resets
+        - reset-names
 
 additionalProperties: false
 
@@ -186,6 +206,7 @@ examples:
     };
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
     dsp_reserved: dsp@92400000 {
       reg = <0x92400000 0x1000000>;
       no-map;
@@ -220,5 +241,6 @@ examples:
                <&mu2 3 0>;
       memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
                       <&dsp_vdev0vring1>, <&dsp_reserved>;
-      fsl,dsp-ctrl = <&audio_blk_ctrl>;
+      resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
+      reset-names = "runstall";
     };
-- 
2.43.0

