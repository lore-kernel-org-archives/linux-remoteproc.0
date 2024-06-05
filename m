Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD11514D9;
	Wed,  5 Jun 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717616072; cv=fail; b=cjv7b4u56XhkMIryXpzu2BqSckqyTVb1KXGbiYyrKHDVLbZNu6f3axzcKIGUnfnSxTVuOPxLBJ/OqT3kL8iA98en5HnjcelPBZA17p+fEG7rM7KMlqtKDJWM5Tp9i2/AQeSYAQc2UuH48hoaG2BbLqD/9p80Ey7fpBujCF/r8A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717616072; c=relaxed/simple;
	bh=PfR5Rhj34LtAs6A1rkiOEjTSGGpOOMQ+ye83FVFJc2o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DcHPcBJIQWJ0gnqT+R5vqMmHNLYBsNkdk9pt7dp6NhEhDGNfrqIv5WuXgadoYj4urhrPeULAoXuq2VH554O5K8LPs/KpVbkmO6pR/kyuRAf2VPq7+UeBTMm53ridvfbavPd1CM7jT71kl6rd9naEBXtfFJqEmeFf7NGUwCJHAU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=JGY0EDX2; arc=fail smtp.client-ip=40.107.13.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JGY0EDX2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oatoxaFE/NP0MlK1kkDWC6CI1C4ZlkcVXMtclRAu6iihW2eR7vUcw4+rKluiiYaJCsVT7SyC76cdPp515aeo45Blizt1FmYVM2o/22qAayAzg0/ZFl9hWRXmIlZq0EYcpyTxlJU22EpQpHvqMhZtyd/e6JaHco5UI0S2XucAfJdtARPP7nfI2rUwp+wb9ndNFwoYj+WuFcN/tti9u45tQAzZgBayJnOsO8He3wE38jKXxBti6C39M/VWckXiLNZS1qSzgicg5VXcCGRjnxYS8FOFr/VRxk10b1QTpiAvesTV2lQYQyCS3/BFL3vUJgAGxPn3qQO41Qn3hVg9LwrR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV3hJlTUgL37149uN1j22QbADaEQsvnLTz2zyJhmplA=;
 b=Lzj7VZVcBYyaE5At8HQClXFvmsAbHvrp+yp7mCniqnA+8DvmaVFwv2eXmzAgyKfrQl/Aw2TY7QGcUXhv0knQfeptWCvlP1whDgacdveX4LaP9l5CjHs0TW35uQFJk/+PAu0PU2WVCmrEpZPDAROGfvBwvbpMxSXWKCOxCOAVWOuYeUr6kmQVSo3UyWsGCE4x1eMGmQm8mmB6neSLo1hQXXtg3QUwQhG4ucpnfp5I55HNAKn3I3PSQ9qjPG+5EONqUuC0/yYujlTnHR0WKRypPzKgRQxEbfN6WB8oW668vgN3aWi2I0f4yz0xPDfCJQkDuw7o7etcPQZ4r7JLyYcw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV3hJlTUgL37149uN1j22QbADaEQsvnLTz2zyJhmplA=;
 b=JGY0EDX2JAkA8+12rTuLCH+0N7fUDkUw/2B4o7ByxJxuaU98vPBDyeeFy6NCRl9g5Yd5OWhKUBauELpcv0lp/Yexz7yVtaoY1Q+zvdbhcJvUTNsQsEueSkSTfOOgDP7ZSExI2SlJABpXyEUJD7B89MbLK+ecI1l+KfYZmQ57dyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8240.eurprd04.prod.outlook.com (2603:10a6:102:1c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 5 Jun
 2024 19:34:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 19:34:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] dt-bindings: remoteproc: imx_rproc: add minItems for power-domain
Date: Wed,  5 Jun 2024 15:34:08 -0400
Message-Id: <20240605193409.1131220-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 419271b7-0192-4af8-9fee-08dc859682d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|7416005|52116005|376005|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JvLrSksW25J0FCokmQXaEb16RDgHJkV+MBevpz4Ee5nNCcFcf5GZ37RVNysr?=
 =?us-ascii?Q?qZ7jz61RC0BAuBQJ5VwEbCNmJHavhjF2mCkQd6wVwoD/YXlgZixUbSPMIqMz?=
 =?us-ascii?Q?I7nf2tGOlmd29muBw/PvkbRh5/pIo4tbd3FK7Ki7NFTNy9tXBVuC/eOmaYKE?=
 =?us-ascii?Q?FROiTWCtaiRL3IVs3V0fjZQHXYUsGTx9cXJNnoyx9MV9CZ2+QsqYP4D1R/jb?=
 =?us-ascii?Q?D+3mBYGCoAky9Lkcw74UbVlmqBVcaSMniVPlu8nA6NFpByf91xX2bH6RS7v0?=
 =?us-ascii?Q?HJGbeICGi09C2WPgEKaliQkJNLblrD3O7o2BY5WOD3JZZS/kTt9O004e7Png?=
 =?us-ascii?Q?NgCFC5wDuSwHya6EnR9fRDe60uETVCAyEhAW+sW7WmDXy8BhNj9M/lwDVk/o?=
 =?us-ascii?Q?AxvnMG0Dq5cxdjQI9RS3Mcj3U29H0jZjuJCnjjtQLOuw5hI/tBD33S1wRhQD?=
 =?us-ascii?Q?fg5593knBb/myQJMysKOxcqKimoH+Uc37kcCr0k+D25dlJ03/x6oJJJmJtxy?=
 =?us-ascii?Q?4vRp4IsReR71RWDIAqEvbP3p7IdunysFf/jCehxIfgZcDMoiwBc/sH7v/Ne3?=
 =?us-ascii?Q?LnAccTpzu5utQLYoyFJsRvqOxLQu3KkKAxfKcGayVdrJsUj0ADvRVl/ZddA1?=
 =?us-ascii?Q?z1QyC1KN+scbtFQTdKky5SXegDosz1yz0BKD71V7zDjMq6uGm7SoaP14ekPi?=
 =?us-ascii?Q?ZY4rzI5maJLBm2nYTrPez2dvAWz9m87tUZZS4mXZ4i2891PVefm2SeenrXOR?=
 =?us-ascii?Q?CeTR6cK0wS5+zDeSarlJyIdX2M4FL9Bus64Khc02353v2iCZOCenUUndJW3m?=
 =?us-ascii?Q?Z76qdowcnIfi7tZFUiNm6m79P/qqn1VjvdBB7llviDdvgrAaaWiEKkXYUq3k?=
 =?us-ascii?Q?op2zMFEWI4OpyJcMzqvLFuu8T+v4eCxvr0pTVc+b3zHuiO7bccCGAQKUBBmS?=
 =?us-ascii?Q?9TLWAIA2q/CeEvVGWdhJ7Fbv788iQS3YyozRgdAMMCK1PhZgsTIAvX8X1OXD?=
 =?us-ascii?Q?uKZSkcmFwC3skxOsrLXFcqkSftXAS3R/Zd0o8toX8OGOZBNzxp83beTrLmbS?=
 =?us-ascii?Q?HzJwMLt20rKv7Vwk+zQJH2K8VUKn4iItULb9FVaopraByspUa372PSqsdtYR?=
 =?us-ascii?Q?9DcFcrdO1oMx1QZ1XK2igg6i7+8oPVq/T9CbXi5ONCR3Q7+ZXS7kQ3w1dsvD?=
 =?us-ascii?Q?waZ0d/lr/Mj7ELbKQu8coa/EPFtYTm23ev/C+HUVb1DgKZ9sOCZXbZAYygPh?=
 =?us-ascii?Q?aynuLmTQwVD0vCj3YSeymZCynUXFFiOlnAGENwckj+eiSIIHPnTmADoTzIgy?=
 =?us-ascii?Q?P62paOBnW71BBsGkbWuZ18n/ciTUBYXoP79rZQaFCOC65oRLgRKik7dQ+oZb?=
 =?us-ascii?Q?nz6IJIeE0wCj6teFZUZKVKNyt8Q+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(52116005)(376005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xHrTXncBi+HyQUTYXQUJodLD5UOBAJXptwVkRT4O8D7IY9+9/hHg255VGIlt?=
 =?us-ascii?Q?5DIbxgKmh7k/33Zo3roDch2qgY0/P7xraRwgelneprLvhR6xMYYogaZbno4k?=
 =?us-ascii?Q?TunAPrv7uvdJbLAIeG97GcEpoZlUbXC9065wRViootcszlTIUKQOvrwBGwh9?=
 =?us-ascii?Q?9fdBBoP/vTNV+GTyHeE1Cd2T/lc/KEzYIifBhIdzuwz9SbiHEVXIZILPABgh?=
 =?us-ascii?Q?jx+HWATtG8TeM2VUX4fqQNIDeRvHGE+npDC/je1c8wTJsay1RFcGt6xFhfpl?=
 =?us-ascii?Q?U11H6aWfkt8f1FayYzKp5L+auhaTcMudJnolYHAheZX7rFXZ/uHi79xESVxe?=
 =?us-ascii?Q?7I8JFHIoeSSmG2L+NhAkIRPYIHrKWKpPAhlMzXBwAtaGz19USNfpV4/eXe83?=
 =?us-ascii?Q?HwSgM5vK6Hw57CeYRMOuY8DvLS3wXjORZmbLLcxpSZhadzPtdl0dyVshIZr2?=
 =?us-ascii?Q?JiA71RQZWA1tAa0yLa0alypp7oqdCDqMJ9cxcl8Q20RJGDQUhZCb/GMae7dh?=
 =?us-ascii?Q?GfzDylxwKzaRm9NMw4GLq6LZqUHXJFTzknjxWH5HfG0LRJWADdvDI/fUllDR?=
 =?us-ascii?Q?Wp1t30Hu3tDAvHBSDBdkHYgzTFF1O+RC7K8iCz6Dm5IcJp0ucYn/CWbA9boV?=
 =?us-ascii?Q?u83eqJC+f+8TP326jHFdh3cqEPVXeRC6NBRf/LVQK42XmE+bzlREYysebeOJ?=
 =?us-ascii?Q?g31miO6eS20xGSvLVSawc8cBok1p70Fw1KbfWyyBl4hFqTybRvb+4oLroyA1?=
 =?us-ascii?Q?ETBZ8OxJq9E3YzRrgNukbDl92AKRZxtV2fY4Fa9hdin9uqj+Eezzca9ZKF2K?=
 =?us-ascii?Q?bCF9WgH1nwwXxAQBtkA/cQB1J2tvEGaaes/ui/G2q2CzxALzl8z5hXQ3je3F?=
 =?us-ascii?Q?JAIjCC81WNKD6rnFXIceAxNO1hnaKLpP79Tr7Frvg+Zvjod0enQSl0qv4PdW?=
 =?us-ascii?Q?+mRpMLpkCAHriX3FhtcDCkzwBUM8ELWyfjcaiMPzVfcLP4yF/dG5cUlBPySC?=
 =?us-ascii?Q?zQYR846YD/OX1r2dxQVUgmpR7EDuit0HR+CQ4VxqhXVoKH8aU0xgy18cKLAm?=
 =?us-ascii?Q?qUo/NmNcNvb1Ns3hV/oGUyS63ffwPGfG+g1QXrE/+yKtmqzzBu5uuHQslUcK?=
 =?us-ascii?Q?cmnZ+y9iYk5ILA0L7sG0prIuS3XlY9/u6Ab9UfB9sp/ZWU4CfueaBUr/XWK7?=
 =?us-ascii?Q?6t7dKqEPBHyZFf9Yv52a4w0FKY8AesRhWpxX8jWRhiZDZ0be4SQKf7uLyiej?=
 =?us-ascii?Q?kFipvLPtFCtehAyNfyuQ6f/GlHfKcJhPzwXIwRCpxp0ScHGLlINb3+vTiqTU?=
 =?us-ascii?Q?aDv/w5wwFXJbZ8xOBILM9JrPjx+bob+EhOav3nGDZfTnHq2qNzpBhQKAqlfT?=
 =?us-ascii?Q?I40ybE8ySZZdCHj/U0s1MI3aV9r0XRAJgKmVEGe+4Ag83XtL9dFhAZpvRqSH?=
 =?us-ascii?Q?s3ol/APibIpYUOJH/bpxbllf0ws+HqynXzBotwdWUe8Q0h2Ojp3AVT6nFLvI?=
 =?us-ascii?Q?77LfEzEHDVydJJFulNKJttqe4ApueLzEX/7lNv96Cnd50gEppbuIGUxhPmgn?=
 =?us-ascii?Q?uDn9+P4u4pk/wSPEVd2pTFmvJ1WMDG+Xri4iMY5G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419271b7-0192-4af8-9fee-08dc859682d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 19:34:26.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VO2Kvbopm8C/Vp0Bi4JpXIar6OdiCk7laK0sGDo13AXAGM4OXLwaRAeQx9m6W3glDO2lK8nOSSPo6gzxABjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8240

"fsl,imx8qxp-cm4" just need 2 power domains. Keep the same restriction for
other compatible string.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    pass dt_binding_check.
    
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
      DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb

 .../bindings/remoteproc/fsl,imx-rproc.yaml       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index df36e29d974ca..60267c1ba94e0 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -59,6 +59,7 @@ properties:
     maxItems: 32
 
   power-domains:
+    minItems: 1
     maxItems: 8
 
   fsl,auto-boot:
@@ -99,6 +100,21 @@ allOf:
       properties:
         fsl,iomuxc-gpr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-cm4
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+    else:
+      properties:
+        power-domains:
+          minItems: 8
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

