Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366933;
	b=n5lfo7s7LruLfMITrzxzZnX9BnwdjMI460fld4CbqYcyQDUWQ5cMv7ZggnxPRNGEKZAg
	 +0mmmSrlaPKh0ODmcAbqTcEnXZJ90DlYH9FJ3KYgD7mhZ85Nr9FYGmF1VkVScfLi1/myM
	 keOKfqVaFqwMr8afNv6B5rgERvad8Q6CQE4ZU6XnJXdf7q7owP4vjGEYoDk2vdvZhsJC5
	 IMX+x4Ylgo7Z0qb9hqQIzoSJURuLWT6AAa/tgWM6RzNzrgxiVLis77fOCpyuVSNpzJK0Q
	 MWEqP5NnjAnpu0TfTG4Vie4xTliAotykIHFyyUmlbMBpNUbzhK+YUOuLre/nVpzmLsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=P9RAuOnLRMSyVaAouzdbv2Qs4kd1hBsXJ2uFqfKqGHk=;
	b=TmD+iIYyNb7KGiePs6URGcvyo09NUeVAF1jeyMCmrnJWDDYdwFLEcvpqCtRpGIy3qIC8
	 15Rm6AUBwx/jdH3stabxrcGxsz/RaaC9W29+Ky00TiG5DdDVmNOEUOuKs9MNHhk0OPbIw
	 cGX0SVp0VezSp/g7nUNAzxL1XC2F6mOUDfQZu0Wt+LFPAS1QrjPGpmXldbnHgDd8IJ1F7
	 w4GJzdDzSb1UPxyfeLm/G+SE2F3QMOTefv1KC5zZ8uBA0i9PImGle7UetLIuurY7GFw1G
	 vThSuMQaPgaF6uUp0g22OuLlse4G2/X401j3C+xigroQMdIEgZu6fx4bAwD9GRTgCxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b3S1EDN6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.7
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC358606A321;
	Wed, 11 Nov 2026 03:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC358606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b3S1EDN6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf9CB0rt27FCytv3H4cOQQNwEdz+TbzCjgfrd8kAdOxdcIrvOoSbZ9kRfOdIbEvVfd8QUgp0vKeO29iBksW7b6ofTgcNZS40zZUt7r8K67KFhPOm/txgEOEjeCf6Qeo8M0gPXdFeXDTzFQrT9499y6SkxpBzDcKwx2ci7PChe+DBY6NYOid0kf6k8rpQimEEWqtaDKSJtHtGXqM5bqvOx2Ve2E06ce6uq+vigwa3qcQK2Zs2s0VPwCd5ZwHvPv45fIbsaJTnzYGGal+eWLmeiuRcoJM7aN03OhK+MzbuVfB/l161fGg6xCLFKcJQiCmk2yl8uURSf7NBudCO8DJrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9RAuOnLRMSyVaAouzdbv2Qs4kd1hBsXJ2uFqfKqGHk=;
 b=pb4TQ1uoUNCGQR+ARo4JPAaxX/fj5EUwFQ2+ckR6EtWSfYOYb+olSg/tIEIcjCpEsdRZWMIlGAPNQBpzcA5oXAYtjkCGEAO65sgp2cOmKVFHEPNbwImn9NygZCCdCACgxtC0Gsi1GAx6gnS/nUvo3upgqpnulJRG24sX8MYYn12A2PAeMnhAUil8Be7z2pPIevrzE16UFsHMihfI5QocsOAXpaZUox41w0YfBCi6Fi35R8O6W2w6kR38FMftuj02ycsMILn8gXF09oTNl61x5tn5rg3P+e1Wv+OuRGU9q4VIC+hzwKM35PM1X3h9xB0NXE4a5W267SB22/usYB4zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9RAuOnLRMSyVaAouzdbv2Qs4kd1hBsXJ2uFqfKqGHk=;
 b=b3S1EDN6uPkHxm9ltAv1uYNIRdFDqe7hBGBDyshZwRTboZylU0Y9P+StEM8t1nt4BOOtUW4Lxhky/fSLFyAlQ/REuw/aO38lKzda0YRxvN/Rm744RNsbyQ+O37CoY9gt++xBLvfUbM5KiPA3J72Byk9I0vofTe1OnX6/THu/T6hurqcK0lmH93WHgetq+uUbNPP6GeyxKGwN5fo2+qZ3yzOoLocT4C6bJl19KVCtA8+LOv8G0zqjXlmV4+AyWTY06btPiyzdiSYsh4SdRlL27d2FHJPJI+IcHhAYwYrtY+OPiP26Ev8fsWEXgohW3jk/Vumn6lAb1L9bwyJO+ebH9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:29 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:29 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
Date: Wed, 11 Nov 2026 11:18:05 +0800
Message-Id: <20261111031808.570680-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ebb413-9c4a-4a16-c75b-08df3fa20a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|11063799006|261026121527099003|261102123227099003|261022075727099003|261021121427099003|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EwJS5Gqb/WCK6Q7nOh+7dtMzrg0joIJPUzrwuz2lrZ+Ja3JDFMcZek5dU4ZvOYInswD7z2odIec7C83B8tp+ofYcvAkq7Bv5wtbxj5Ui0rqDVfk6uv0c78RgrA8kYoAB01GuqxTtebKwSIvKwu+aFEUBtElBo+HF6uz1xa3U6yro0N9FtYAuuy3AFh4x3ooVk/bQpMBzQAp4lF+hn3Nwj4fyiX55oNxo5DX2CU1H6ltNEfCB+MdKSwDKMhPXUPElbz8WZvoEWXesYwFQuywyfSnl/51xhaEZUGCk30ldVjSnz50+2rnpFDsYDwKFHb7A+DyzF4tdf/QRND5HZ97VmfnvRejCg+z8yxZHHL2isHyGDR/19XmEF5CjPxmf+23CaZl/lyqMCAP5F9/hP7O3VLbOvYbPFR9C3Sq66AgD9oItTJ4NLkeD7+7MfUVFO2j+xwMFKJnfgY3hbl/JbwujtfAeM7lLOUdRY9uncTT5zjGvAEdSXnKbIKBQ4/rdf5aC2A0OQxW9UjDhQmBdnElxRt/wvTN1OTHLufyka0xvgf1gp5Yfu89l7SnxLc1sn6m0tI4EZgYtM/8EX7PaxNySpaTEph6bcUq0mdQEgj6FqIcy96IujFqj3XamoCz1uFnsDqj0xIZ1Hn/XkIirJibXe7ORiUI39NWKTvyvIfBtf5zmOn98o/ccAlM1SgOZJMjvFEoykykt+/GQort2Jqa+EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(261026121527099003)(261102123227099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mKzxfJN0qTLa003dXHmBe+BmfQd31xRnf2nDa5qhxxFKCf0Ywh1VyFjNX8f0?=
 =?us-ascii?Q?9oxLbZH59zGa1WRfWXyPT6XvLjJG1iRxmv8PT6X0/ZewNkR0W8f0xAwLdS/T?=
 =?us-ascii?Q?DEBnb/RyD/Rbg7qB/JnBo9t5G1g1TtBGei3dpe28tgJoIcU+IzRI7QN+AaYD?=
 =?us-ascii?Q?TB5FprQ6Vcm30HWuigLW0gQj2yrI67X6O8HOewXqFQWg0eefO7es2GbvwEFs?=
 =?us-ascii?Q?j7mukaAmAMVb0TyHwZPod4D14Gnqw0edTMrMXbMkbMPwbLWMtYm2oSXXseo+?=
 =?us-ascii?Q?8mdf1sI/C/4fKb1SLO3oHEPV4TQOnjvU0umP+7aA048WvbwErL+viaNc4kfX?=
 =?us-ascii?Q?QN4WGDhV/3mSS3yYUafP/hcwjKB4UaFVjZx3EjSzSqHwWC8wgGWjIJ9yd9y0?=
 =?us-ascii?Q?0n4ebQWLo6kHamS0rk5+uqgZ31n2fK/ZFkW4H6/P/J0V96u+jqTSPUOjpupO?=
 =?us-ascii?Q?WfT5WLbkUQyEx+TltWoVdnyGSbeilgoKoySmgBHgAr2ld2DnltABM/YsdEWv?=
 =?us-ascii?Q?wf5T76WXn8mDxlusODdy3LupLQmk/HsSq3zqxFNYUJI6AjMbButjUPd4toFM?=
 =?us-ascii?Q?yN33tVGuPV2hSb5PJq42A+ie++pHS4fqWIhsY1k00j7NVaXoiIpb0EV5gYoq?=
 =?us-ascii?Q?WqKVdnVV7z8E0ffgEtIeBO12vUZ/Hwy4RIH17XomiQT+ab5XJi1rA9cnNh/P?=
 =?us-ascii?Q?gt42iamsNSQo+vUA4xaOqxEyvE2wGbbcSaHVBvQ2Gz2aOwL+DnKVWeRKonAD?=
 =?us-ascii?Q?HF60RpPljm7oZB4n4CnwM/C158D1yhFOX0x/R9WY4B/nqaMW1LmLrKyfbzWp?=
 =?us-ascii?Q?izwmeTW4edgRlTgKCy+OOXaY1oQH+6vpQpX7ch1RMChihmX5zOElA9TXve1R?=
 =?us-ascii?Q?tANodF3p+opBZgWD14kLAE1GGEbOiQrm7Hyj10Nr/CHkUc8DIIQ5BhxrpE4x?=
 =?us-ascii?Q?3PwyTQgXBY54nO54nWoM4L2Yq36Cg3lNO1qIGP0YXbJChymGX+kAA4PN+kZP?=
 =?us-ascii?Q?FfJwb092dkZ5Ce8XoSRGXdx+RZ0B17OO4X1SEbbDmnKueDB3xf/MPxJusG4M?=
 =?us-ascii?Q?/yPMZBSwx7YGMwiNeyBHFTwqHaYRWATIhrDs80J1IoYXJMCRkj6gMvj2yBZ4?=
 =?us-ascii?Q?iU+x2ObjlNTGE5hAy+cFAdUzwdWZk8xAfrmlK+niNlNlZ/V2O7LphKWJbxuo?=
 =?us-ascii?Q?lPTtlpgsoJ1C0sf3OGsXKGphCNwexqWW+uQdPLFu5JGV4N1pNFcyitU5FD/V?=
 =?us-ascii?Q?P39VBmufdm9iU/aU5sJCZ9W+YNDu75vuhLmXBfYLbf/wqrmDvFcBNBq5EFqS?=
 =?us-ascii?Q?sFYx2k1KyvJnIusYXP3OeoHrHIrnwvs8peMUaH8MoIe/+AXIBYRiAQ5INjWR?=
 =?us-ascii?Q?NItgX4GVaDIEy1FAa//Xf+lmA6vSxCeQHxSECO4xxsuUQhh09dfy9j3Fl3O1?=
 =?us-ascii?Q?ep8JgtzzVq7CZfV2tdMBWCjgu9eg080zh6wpClowJlDyp3bqFsXov9bGwcjB?=
 =?us-ascii?Q?fNzph1GgBtSLme4WcyrMAcuh+iigsMNqpXwlj77Jo+gfemTAatgD4X0qcX0Q?=
 =?us-ascii?Q?nSYLBZU/bN11fGFRJYdx0V0EISK3ifTthfSDqxVk9Bng8OPalox7leTypycm?=
 =?us-ascii?Q?9ItMmBlG0Xu+h4JbrDLWli95W5YAB27s67x4Tiy3o5csi5pPiG7abLdZQUJZ?=
 =?us-ascii?Q?hAhG7p9mNp03rRAjF49avezttzBe7R3GRt8cHPwyEmIjY0zlSwvx5uzpqlfg?=
 =?us-ascii?Q?fxhkqJhS2AS+ePZp9LIrX3kRC29RSwSHS3FqriMMSV8l8IGtF1OA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ebb413-9c4a-4a16-c75b-08df3fa20a11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:29.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZqsRXqAA6ohZQbWPoutyLloL2P0cam9KgOIJ0p6DvUByyZd6ZpYOvMrC2gk0vUJ6okOC/SoIwiiIZ1LEwp6NPWqBOmwNvd0D/1V+gg6E3rBUYryhVcasi+Wpt8lgfDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Commit e1b312356d7a ("dt-bindings: dsp: fsl,dsp: Add resets property")
introduced the reset controller interface for DSP reset handling instead
of accessing the reset control bits through syscon.

The i.MX8ULP DSP also requires reset controls for reset handling, but
they were previously missing from the binding requirements. Require the
reset properties for i.MX8ULP.

This changes the binding ABI, but the i.MX8ULP DSP has not been enabled
upstream before.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 4a75a271b7fa..2f4c8623ff21 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -185,6 +185,8 @@ allOf:
             enum:
               - fsl,imx8mp-dsp
               - fsl,imx8mp-hifi4
+              - fsl,imx8ulp-dsp
+              - fsl,imx8ulp-hifi4
     then:
       required:
         - resets
-- 
2.34.1

