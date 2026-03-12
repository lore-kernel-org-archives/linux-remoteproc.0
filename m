Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA52F5A05;
	Thu, 12 Mar 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318943; cv=fail; b=UvS1EQlLSNUvsc3luGhi21aMVPZ5thJ7GVZPELsyGniqYXJN626OdslZe5jUT4fau2guMjJN98KkNUK7DEgGuyqeLAtuRfXczSuIbla0bZquIUF1C15PwOZ4X32C3gxC53On4Gf/MWEdyMcGZ2POZiRCGjQk/rXuOppODPsRDDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318943; c=relaxed/simple;
	bh=ORrtsvQNBtIbKV8D4F1YwRJYiCI5MXpHBr74+WMJre4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DMXM98+etT4NwprTJYm229i7RJ8HeqwykNgl0jjZ4qeRYrnNqtqmFBVYhLY7nQAW1Z/j7/EaWrTNDmkcxDlswzIDKTW/jxsME10PBP1pwxp9BuTb3LJBpSwlfOdgCPOWilFHQGFZaOM43PwPGSQHXSyjJrefaMegXFwDLnz9mc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vv5QLOtz; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vv5QLOtz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaUY+K1O8dJpAdc3KsRoea9IN4AtMTMdJq7WcK46Guo45aGBQ6vOglewOWPgxnbuyzMA5/gvX7UszuEIW32PXDh8wTEqt891qI0jg+3Bd+OqhjHI86T0AkmFd8Cf6MXNMc+/jWftTXigpZEW07Y+UcE0+WWVdnjEsWthXQp6CxzjkcPDQNk239JeaPN9A0OUDk9G3TRbEjXVr3bpcrDX3aFrVHm9EWSGnZutDXSF7SBV6gIQf1qK+ol8kk55QkCVYzH+h9UDCwB7Bxb3LB7BH44iZ8kGX6VreAwBthS8BfMptItpa8xwbewNiUlTArLHp9F2TNc62wnuc19XugFwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRQA9vgXgE0zRZOoS4WTXi3RVKIBqYUEDLEHPDxppE0=;
 b=fh2J/yGRKfA9kQ90N/eaHDqmKb2KcTCbtPMrtNhvooRLbbUqWkteHPH09i409YmHsj5lImLRHN3XkXoCrBDmaz/YEdFToaC2MOSiefsiolt5bPBzsro8u+Wk3tDh5r/ID86M1W11MFXWNVR3pQbojqmxm5VtUDE9MERPeg5cGMQsVHOhSG5WXQas5VaLoaqmcduHT1cPP3CbKMeGMDQkVh+Y54P3Z4YXgg70QtET+gO5FIlnnNPMQRkRT3UQdOFCPA4t55b3MxSFT+dk38siVjsHznKvf9A12AquSmmWWJQRdsUK5s5pXPjzcknjpHEVFwEqxnwkYZ6lu+ZESfRdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRQA9vgXgE0zRZOoS4WTXi3RVKIBqYUEDLEHPDxppE0=;
 b=Vv5QLOtzkmxlKeEn1CdE+iQMEW96qv+MSPBjFdz6FZ8lsvmlK9SgB2sZ6A0AzGnc+1/xfkOC9m/8kX2q2OkJkQLSWvsGckv8uNZD4tLyiWbwPBK3jmFwIJdBa+0Vpa/IcbEhxKqma3PHKhbTIbDRSSPGq2GBkslAzmL99G48/KZKc3WhiL+cwdXfvN6EHZRGIHJGCSU3UmU5g7uQhUDeJ8TQoqRDUcYIxG7ErtP4f+SlwvMpLshgCD07zOrgUSfqwbpeLwDy+yaQX4ZfNvMEIO6ATXRcENlnUHgAo5H1jgjQhMjzBVnd/lF5EVJSZ9DhMrNjSZi+nwjryxYUIqGcgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 20:36:56 +0800
Subject: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: 87605460-e88f-4900-1c01-08de8033db5f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KVz2uqKPrm9dXu4Y39G5VTWj9Q/55QKbu5XmNtZf77Y5K5cENv59+bf/BpgAW7a6CYnkRx/FNoqRRb0+9hmHACIfx1dutLjyWrSS0PD+SkdafLnZrKwYaL+0GSFL6gxBtu7b4028gRdQHC4fogujU87fwldtQ0r3OsMCymNMZ2JqUEnqJBqFwVvjjNZ0OG9mKA/tu0HRNwtQUOPOLui8DsKKJ8LeEDekVyJlFQRiaf/lxePE2YzZM67xSkuCR0Ly1vHL8dMK7NOCPRYiMhOROIiHiYERfZkcSoxESsdzYvw2xdCt9TyGLxxGxNX6ABr/co1DpGe6xk3WalKIlkV9hj/Vav7r0EAfSe0YhsuxMIPBkOLNCf5SvovxH2Ph5MzLRkHUSlAUeVi9NUNVNM4yHJxexGPc6crfhUIaa7pdSxLgYVizqgThRnbHQXk1rdn4nXfuUYXRHm0YmWaHzq1hSo6wkLpzlCzmH71fV5TmzgCQnwitIwyU4vbAaYXVBujkcibRMO/i7R2XCqkoZaIHFGXx5tfKV8eY3+AY9npy0Fe/blL88CVf4WUuOr7j3IgsU0HulOSt6gDSkV6xtoQVmECeGenCAtIEhC08I6fnxfI+Yzxz07WFp8H3Ie7suE/MzqA7JC7jQx+sqCUw1K3g5Rc7p01c0cvHrNg6uIJtXH/9EghzyS2Uc8L5l56JbR18t4Azqk6KmTwJXIHTasIJRxCs8aqNgAKf/tVCN5MwqnNejGgaRIvO4Rs8/o3bDfy4CyJUzUn+lDJVBOMbigBsPfauEe0YBga0CNUPRxt/0PU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hManoxTXNHRjdHK0hTSFIzMnRrdnVWMExKaGcrcnhUdTV0RUdYN2hWbktT?=
 =?utf-8?B?SXNSdW42ZGp0dmxsS0ZPRGZSSis4T2pLUStla002L29ZdU5NNnk5RS9Ob3I1?=
 =?utf-8?B?UWZQcWhaTWJYUU95T0dnSEpWTTBsN3orYW1ZMEZ1UFBrWDNtbEVxSnhUMWRr?=
 =?utf-8?B?UmV4K0xDa2pieFRMc2dvVnpCU3NmN1Q2em5KbnZTWEs1VnNCTmlzWHprN0tR?=
 =?utf-8?B?TU9TRFdwY0RjUExaWFluMElXVjdKYzVNSEhtZ2JSREEyZ2JxR3hCanZWU1FY?=
 =?utf-8?B?bzU2T0dmRzhVYnJaTEsxQmZoMi9LL3REUi9lbGRpbjJzRnh3ZDZuMjVFdXJt?=
 =?utf-8?B?cVRZbWFnei84Z0d1dHlMc2Y3M0RiWUxLUEhITElrYktTVytEOXdNZUZ5YzhV?=
 =?utf-8?B?eVdHbzFpQkRDMVdjNzR3UUtrRUZ6WlcvZ3hteGxoaXhqN2JXRzE3R3NNbkkx?=
 =?utf-8?B?TzhjZmtCeDExV2lYSE53aXhUYzRJYjZRNnl3eVhxQm1tdERnYTRtQytzT2xM?=
 =?utf-8?B?d3JMK2JMTXVLWVE1OXUvR2pldkNkbjlVcENlSk1qL3VsbzNqbkszcEdBQ000?=
 =?utf-8?B?UXYwNVgvL0NyNXRSNVplMmh0ajh2YlZOalNGM21pdXJJZ1dWY0tNaEo1d2cw?=
 =?utf-8?B?dEVnallXZUIwRzZFOUxCaG5VVXNjWVBQc3A4cHFpR2Q1K2hWZUc2MEJ0TjRZ?=
 =?utf-8?B?bnozbWRWcGw0c3R5b2xOMW9Ub005WC9iQ2RyamI3bDdhNDlRZExBY0plTVdC?=
 =?utf-8?B?TVlZQUF6bTNvdnFDSHFQLytJWjF4eDkwZitBWllmQW9haDhvTEVraVltZUha?=
 =?utf-8?B?a2xWYzlYQ0ZyWDZ2UUdzZzdOQnU2RUNtdkQ1TDBsSlpnMDMxNmNrM2RxbHVq?=
 =?utf-8?B?YjAyTGM4T3k4TXlsNnBlVXdxZlBHaHN2ZFcwV0ZCRTRJQmNabitQNU9lZ0hx?=
 =?utf-8?B?d28xWlg4MlhENFltMm1maUx6eXNWekYvNzk4cnFEYzJMc01OOHArK3dRMTRO?=
 =?utf-8?B?TW9iVUNuTThCTWloZTFyZkludk5Zci93ZnNqa2hCU01vNXFtUmhWZS9NM2xw?=
 =?utf-8?B?NXdMYUtRNmwxdlM2bDRKNkwxKzYrVWdwL2l2TWM5eWZFVE9iZ3pIZ3A4NzlE?=
 =?utf-8?B?VDFtdzZDOHg2VVJqNFNsREVoRElkeEg0ZEJSLzUzUkdwWEUrM0p6QmRmYzZM?=
 =?utf-8?B?b0s3eXVFQXFzeHJyaWlqZ2t0U25CcVNtbzl0WVdRN09DY0ZsOWJoQ1BYOVg3?=
 =?utf-8?B?eUE5TlJoVUVCakNNSkc0bk12OGk2dzNuZDlSS2t2bk9LaUZlYmpUUm9aY3Vi?=
 =?utf-8?B?SThEcGN2R2wyRFFIQW5MdzZGaDNtaFlaQkFoVkRnMTFiQzJXV0hrWGZTQita?=
 =?utf-8?B?OG4rcGZCLzlFaEt4d3ZpTURIbDhDbzllRDlZektvMjc4K1VMdlBqL0VUKzdo?=
 =?utf-8?B?OSt4amVUcHl2UG9RS3kwNWFnejN3ZTJWTDJ3d0JiWXZxdFg5K0dPK1BVNkNs?=
 =?utf-8?B?MGZqTC8xeXVtS2RnT3BtNjF5VHdmakUrUmZCbXdLaUVBOFZjcW5CUDJiRUoy?=
 =?utf-8?B?NmZyVHloSzQ1WU5hN3pxQ2NzZHdKTlJFT1JmM1huOG1ibkc4L3FIbVNnR2FR?=
 =?utf-8?B?enJaRXpHMjRFVFkwR2JSTDVEbGdkS1hMWU9uUklnNGphTWNSU2xuTTVLMHlz?=
 =?utf-8?B?UmJkT3NlVy8weWlFVG1XMzFRMjJScEtFTDNyTFlrY1ppeFNndVRBNENCQS8y?=
 =?utf-8?B?SmF4WWJUVGpOcStqRXNJRlBlK0RXMEpDc3VHWUplTC8zckU4aERFeExxblZE?=
 =?utf-8?B?ZlpWN1RQTDhzVHl1YnI3bEErVHpDZCtzTlVzZkVPQXdvd1VsTWJEelBKSGpr?=
 =?utf-8?B?MzdKczdKOVc2NFdxL1VsaEthb3l5eHh5VHMzUkVFcTY5U05BakFLa2xFKzBN?=
 =?utf-8?B?Q3lUY1BZWnhZQ2I2d1JWT2lUVDNTVWVPZ09IME0zc25nUGMzWUk0a2s2enBD?=
 =?utf-8?B?dGVQMWZvdkd6Vk14WnplRTR0U3FRaFZzMEVURkVoYzZzTjBvSkw4bkJvcTRu?=
 =?utf-8?B?a1o3UUlkT01qdVhabCtpVTV4SVFVUitnTHArWFZ4QU1YNmxQT0xTdVBheVBk?=
 =?utf-8?B?NEN0UnJvVDhQaFEwZFJkQ3Q3VzcxaUtkN0JudGJteGZMM1lidTQ0Tng3NXRV?=
 =?utf-8?B?OW1wQjBDcTBxSVlCQ0N2RDJtdXRCdmRvby8wQXBadkE1MUxjL1JyMGF4Tng5?=
 =?utf-8?B?Smphd2kxRk01ckJJNXRqeFlGYkFnZkwrRDNxSlgrVENLejBsTmJUMGphOHd0?=
 =?utf-8?B?RnVOczkrSkFaaEMvUXdxM3l1VHlqVFZPekJJaVM0WHgrbmVROW5Qdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87605460-e88f-4900-1c01-08de8033db5f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:34.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAtYQvq7kTMW9Dk0Y59pZLybD3fhqfpd92CKPSrQZfL8jZyVGE8aW8c1fiQO2wioPAP4V61/jtsRjPVMk8fC9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271

From: Peng Fan <peng.fan@nxp.com>

Cortex-M[7,33] processors use a fixed reset vector table format:

  0x00  Initial SP value
  0x04  Reset vector
  0x08  NMI
  0x0C  ...
  ...
  IRQ[n]

In ELF images, the corresponding layout is:

reset_vectors:  --> hardware reset address
        .word __stack_end__
        .word Reset_Handler
        .word NMI_Handler
        .word HardFault_Handler
        ...
        .word UART_IRQHandler
        .word SPI_IRQHandler
        ...

Reset_Handler:  --> ELF entry point address
        ...

The hardware fetches the first two words from reset_vectors and populates
SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
Reset_Handler.

However, the ELF entry point does not always match the hardware reset
address. For example, on i.MX94 CM33S:

  ELF entry point:           0x0ffc211d
  CM33S hardware reset base: 0x0ffc0000

To derive the correct hardware reset address, the unused lower bits must
be masked off. The boot code should apply a SoC‑specific mask before
programming the reset address registers, e.g.:

  reset_address = entry & reset-vector-mask

This reset address derivation method is also applicable to i.MX8M
Cortex-M7/4 cores.

Introduces the optional DT property `fsl,reset-vector-mask` to specify the
mask used for deriving the hardware reset address from
the ELF entry point.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469c8fc0979a192b6e3d3a03108d7d2..683f0c36293c08616621daa79c0b8914b0f48bba 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,12 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  fsl,reset-vector-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This property is to specify the reset vector mask which is used
+      to mask off unused bits from ELF entry address.
+
 required:
   - compatible
 

-- 
2.37.1

