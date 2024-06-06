Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2084.outbound.protection.outlook.com [40.107.249.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D838DE4;
	Thu,  6 Jun 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717686054; cv=fail; b=P8lKNI2TkUvSNGIPB1ezm4kWgrH3jBzkEzIzfGTlNUQ657vAW2s3L8pXiAJGoXtHw+8zd/jPZHacRgHSPHSm+uhWsmfyxklBS9E4TIf96QVaDera0LKkp1Qi1TRM238C6YpyhaX+pIvdldCnhAdea4nWR14h+AXiezPmQVTIFNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717686054; c=relaxed/simple;
	bh=Ua/oGa2PnalZQbsNNwQcfJLWPs/nLDqA2K+IMXgVoQU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tDJY4JC8++NaXUFI2bZleDbxmYgpzh7CNCmT82UPbmgVsHYvL13dF1Ut65bApHsF+TxKoXzVM2WbSN0YVNbneZ7ziL7h2YdVVeqmmD4aszxqlBxKv43pjTwH9htd7ttT/Pjo2eltGeBLD6trCq0QJyyPTb9hp9bldoED4I0wr4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=WO22DCFA; arc=fail smtp.client-ip=40.107.249.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WO22DCFA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgPZm9BGhP6r7uFb4e00XIOPfWTjfsWZGCeceQ8uz3KSXBkS/n7/0FAbvWILkex9qRQjJGlcJQY5ME9qdpYyK4UzPIX8CYvYQVPwd4NlUXNTJUX/yMpyp+ea0pCAeWIQnuKbv+bfb5JNZ8AUK3yR2M3js0ylUMUlFkJyGnevv3HmzbhMBOGmKsB+KNnXMyufY1ZYXAYvsdxWETNljV7J48DAMRCrBRUgWooiwmQuMqQdmsHJjlubWvKL/IKMUfO0hwjkvvqdSR9fhXC99b0t1YggCv2Z+En5nmOFskEPqugvDnJ0MtgrA6rIujwoo0/aysh31dUORSR37HuONsHIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEV0rhpCdwaafmjQ30nwsN5cRp6+KRPRoyj3YAXV18I=;
 b=KLwY4r1wDFS1ssD7XHw7GoKkZneZUAF5L95S5GWUUN+gnUHi5Qo8y4lD/p/EWPr3/+5EXV7lDfav5Ux3C16cz+CPtOJ32c6pkq3WB6nOf/9+WKm4Gb9b4NmBM/zskyDm4V2GABABcgFhEAoFdI/AmT4/zkn7weQ5Dvyjzbfalhuzue0hVgbaTJnwpVNHg3HWYbuz5KTvnnbUQj9bZVcJtaRbsPtX8DvNgF4WKqYS5eumQTfnzyxlvAzbXuL7pFmSuxd3aiWtarMxmDwsb45OJ4Qt8oBwN6cf24jc7QqzDsDizGx94VYHFDT/1/IfHEmjauDcN9a1F0LLJgwRlBDjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEV0rhpCdwaafmjQ30nwsN5cRp6+KRPRoyj3YAXV18I=;
 b=WO22DCFAzzvi9r7pqwwe1RNnYI+NaRQVMh3UQ6ly9thT4Fap6BatGpVj3nHXhnZI+qfHp8eu1Yjebk5isq2hxNUk0hCFsG4mF1WCkErcN+RZ90uPjmAnmRpWXNaEWFXd6qJE80SYSYZUcSIKRl4/cRb1AROf6kPZyjHto9m1PeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 15:00:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 15:00:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: krzk@kernel.org
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: [PATCH v2 1/1] dt-bindings: remoteproc: imx_rproc: add minItems for power-domain
Date: Thu,  6 Jun 2024 11:00:30 -0400
Message-Id: <20240606150030.3067015-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 812ccaee-b8a8-4dee-51bd-08dc863973c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|52116005|7416005|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VcBxPSeU/6LoVmXbDMy05dURKA5xxeq+YCTwNOPBL12nZfGZWgmlVOjH6FTn?=
 =?us-ascii?Q?08KXsBKLWHDbhFlkvJBbMzdfyPSBT3f4cxKqOi+wwQoXKDhi1HlAFCBc6iGr?=
 =?us-ascii?Q?xn/WZw6qmXS6GvtaScR5rVpDYCQk9DsDm8blwa7rDGDLNL7ZkUYHOrreDMH2?=
 =?us-ascii?Q?+UpLrxc2gvcekdZrq4cffZGJTT1t0vzS0iGAFSbmQJLMZtwCotXfFo3vuHFm?=
 =?us-ascii?Q?55lCujpXTKJE4MXVeshYgTBE4lrB4zxZuAI7EBrW9+bGc6xxUXk2Ow6CXOOR?=
 =?us-ascii?Q?so/+eizkM8E4H4NtBtR+BXAb9NyUMD0oRHaFcGa3i8lR92O//q4ru8q+66su?=
 =?us-ascii?Q?6pTYSAfwt8cd32BQw0+Xv6x8IudE8MA2R+x0bcP1cQ/dGifR+t5Ug1JrrrcU?=
 =?us-ascii?Q?0fu5DoVOE3CTcg8KgL7X8Y6HGPoEjOqg3tT9JSnDU50XJGI24yNGl7pgiECZ?=
 =?us-ascii?Q?6DadTMOIEV4r1luVt2XZDhI3JOQtuvgjstjikbKys4dUdCjIbMgXzz0q5GFz?=
 =?us-ascii?Q?sIwco3gq83+F5d448fsYLBbqI+DjIzZVrzxkcRXs5bNfRwGZmMzOCqpxW5DI?=
 =?us-ascii?Q?fXDCjl9lOIwVBAB+Bp8LwtVDiSqyoz9k5JO+nAbf2ixjm7qhZBufSZHIHEeo?=
 =?us-ascii?Q?aag5gGX/F7Ai7GxxTZHSzOR+5Cj9IWMPoJRny2H2tEvWYIdBMEr89Hp00WhC?=
 =?us-ascii?Q?RuQrxq+y9aNxSMff9Pj2Rlx6x0CCtJv63X45WMwXWhsDcYpxIl5qyjSwo3W5?=
 =?us-ascii?Q?s6co7rCgRa2IyxXPDf0G57nYwayD22I4k5Ts2NCkBWsUY1QgNki11csNZQ7K?=
 =?us-ascii?Q?dpbu3YSwem/tArLnsuCYBgVx1N0V27cCVSvlFjcTkIkefyRp9clTEWll+DQC?=
 =?us-ascii?Q?iNZhOPCXX3TFxjKJhSrmv1xWkwyfDk2mWmCDvk7tR0F7i1x2ptgdA3bPelCx?=
 =?us-ascii?Q?R8r0V5/x4DBJllsI87/mKM92EpYVNGCS9gC3Mu9M9sB6Oy45gaY+b4W5MsvM?=
 =?us-ascii?Q?+ba2axiGxQZYWEl1lHqbnnH/5gz8nXXTu7GesI0leBWs0lfq7lQfyiU9jORh?=
 =?us-ascii?Q?twpBr72ei7gTZggtUHK/8W8Ci1Wu+p4TKGw0mphVG0IANo3/nW7wL8Ypue6q?=
 =?us-ascii?Q?RarADZ/+/NIqpyhwqxqWqEJsiG88OUw8vNGxr1UBIjHfqcioY7gxjltlPiu4?=
 =?us-ascii?Q?SvB5pdshTfrOrWM/KTv942xrJV+5Gox+/SeKQ5W+naYxwnRNUcVeUW/B8Re8?=
 =?us-ascii?Q?8CyvNlwegmTmGS04tYcVOFhp5IHMjfuDOvKBtz4Aph81vb85oVZxs6I8bMdd?=
 =?us-ascii?Q?Po44aYIaM829qvhfuwxvYpDtA14peMJiwVlYFXpogWNNZ+jCtqZocA0JnLwd?=
 =?us-ascii?Q?H/Xowe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iQfN6A6Pha9Zkpxy3wqETXxGU7abdrh5jLmLP+p5kvPp+RvhTPIDjW4Niad2?=
 =?us-ascii?Q?cXPtzv8nJpnVt35lRE9x0BQiVyJjmtg7kqJeq5lz+B/LfdITWaEUtNUOAaIm?=
 =?us-ascii?Q?1f+Xn7g74WXwdeKJt9I/LNOGo6sEykHzyktG+OUpbIzCrXQjHZofMZXsjU9N?=
 =?us-ascii?Q?t53ZNzIk+E9A/i0GIm11Mg/PCnvheNyotCXOz4u8tThncOweqb06EGUn8tlX?=
 =?us-ascii?Q?dBYhJANWYbpY7LpcQb2g/93TzPcJxg/AKrSJClQ0s8uQuUmgZq1bxAdQEoSY?=
 =?us-ascii?Q?B2ERZQYwnoReHvlT23LsXI4X/LMHJsimISsFnJr4VlIEYHKP1iHsWUMtZvhG?=
 =?us-ascii?Q?5bZxDY1kIm9F4Iw+49i3xAjtUXx6YsB/ua1HwlKGJ8ROSa9EGUibgK5hBIWz?=
 =?us-ascii?Q?53NHKiC4NnU0Kf9PLSv5PFnPkv8hsRn7CowSA+Cx+O4f4Z2NwzO9FWxqcGJQ?=
 =?us-ascii?Q?6CsTRfsEuKPxEdxoAtaRn/oen1e0hGh+wTYruAdNIBnqxxcubky3idL/d77k?=
 =?us-ascii?Q?KJJLX0ee0gZQ3CFMXNaJLNBdPYy89juHue2sz4HPSjFHiHb45DNHLus0ZCPU?=
 =?us-ascii?Q?AUgRxWifYjOJ5BkLLbuobOeCn7LLHXftz9g1mdcZWGtFysXMype+ejlsLNXo?=
 =?us-ascii?Q?vT4NF6CbEM642ILsDbUR1F8yi4QnzwfyqnDw7/1QPUUPDO/igr+x2UO4xTPw?=
 =?us-ascii?Q?dCyVXeM6hHXDAeMdCLq0Mn2W8eZAd8EZ2fDJZqAvkUKf36OWvansV7WugIKl?=
 =?us-ascii?Q?yUyzPXDo1LqFMAO5EE6G+rwb/BerUnBkEX7tIF6AAy9+laQLVOmm790hYMsj?=
 =?us-ascii?Q?uNbblf8ioWs8sFP4RG0E4QDRw4r9Wayb5v367uvW/CEphz7viX1JO98v3v/b?=
 =?us-ascii?Q?ZmAlc1aG01yI7wofSlPHAJD7inq5rUUTBk5uStLVHdz1MioTlF6GE04+zET8?=
 =?us-ascii?Q?XgA+NlQ+rIcBLy9vz5f8nKmQhhu0mV1AgwFe1BvzVlsIRcwqiQbYjixxqCoA?=
 =?us-ascii?Q?M105r2HdYeMXklhdk3NeLmzjKhgFNkf3n7d9ved4QMUnA0celBAXf1DzgK0i?=
 =?us-ascii?Q?VDo12COtm4UrSfqUMSvyG9k0tRoVad7zJKmHh/g5d5Yb5jzrGc4XuJa+kbff?=
 =?us-ascii?Q?5iVppkOMcU2qzMNbJg3kKkHURtbmLR9aeS32UkQCZOKsnfUEUt+SGLov+4Wx?=
 =?us-ascii?Q?ttrOpePrryrfQ40zvWl+gCIYqsRSzeZj4crBER7i2i0LNy1naFUKFQHDr1f9?=
 =?us-ascii?Q?nT4mzE7wuh6a1lWudmWnAADhmqMkip5uNTJ+3+G2EaBUqTG+tQHkeUNMyziN?=
 =?us-ascii?Q?PF1XUUZlUwNmcbVb6fD3BBsQmTsLwy/bP/ewvun4Mf8udCqtyjmLfoUxTL+N?=
 =?us-ascii?Q?xkZRtGvdq6yKft/Pf5zSp6zy2i4aJplbF6x5envCJhw4PdNNyvkPDneXdVFr?=
 =?us-ascii?Q?Hsm8njiB2AGKOqCtSrqTKXfNrj1N+D9q7oDXtRRCufBdlRbyERQ2C4HKevIo?=
 =?us-ascii?Q?MVP1xMorjXkxe+K5QIq/xEwmkEu3CCvX5+yaY/RSAqfjCUb7suvTYI2+8WC2?=
 =?us-ascii?Q?biT/SuaSiBo8Wvi5U7U5mWTuaBFj/8koO79MXora?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812ccaee-b8a8-4dee-51bd-08dc863973c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 15:00:49.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+vULZ2pRptjxzSoczBrRisD2Vgy1JRyg/S3sq8/EGer6+RDoHUwKQ5hyiPzJtxIv1wZOJ6y3wp/8x9wguq0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343

"fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Keep
the same restriction for other compatible string.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - set minitem to 2 at top
    - Add imx8qm compatible string also
    - use not logic to handle difference compatible string restriction
    - update commit message.
    
    pass dt_binding_check.
    
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
      DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index df36e29d974ca..da108a39df435 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -59,6 +59,7 @@ properties:
     maxItems: 32
 
   power-domains:
+    minItems: 2
     maxItems: 8
 
   fsl,auto-boot:
@@ -99,6 +100,19 @@ allOf:
       properties:
         fsl,iomuxc-gpr: false
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - fsl,imx8qxp-cm4
+                - fsl,imx8qm-cm4
+    then:
+      properties:
+        power-domains:
+          minItems: 8
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

