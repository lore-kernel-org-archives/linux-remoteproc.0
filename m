Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4823E0082;
	Thu, 17 Sep 2026 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669222; cv=fail; b=odGEzLBFVu5RjYGKMIdMJ8eqyOMOiNYydYnPciH49eZWDurbd3jGb7y0cteD+TmWBfqcWWompWQJv3XMQMduVnY5QU47ENlvABqJ8MdxzjqgLYRFo4SgG+PGebftl+XTeHP2pL0B+mjSu2MhEoKihSuhB81OSJsn9CZztnWLThg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669222; c=relaxed/simple;
	bh=S6GyNxHoeoCAiVY110kf4f5uzC6GAsf/4JNOxuqCfKA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KXPAiKFQWRp1l2/h4YT/H5ILG7ZiZDcdPLZDWLp5FvcTymq5uK14JhVRcXQZFrX/8VYUFBfF/0G82dPRP73T0Ot7er/3YX6YpaNRwx85cV5yLpD6R4yIYA4cccqTb3YLoq/LIz933D1OeJ26dtr1NfHsIdAKKq7s4mTi+rmpSWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D2Vs+xYm; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D2Vs+xYm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUC7+v8OidBtz/PzI+oUvydI/XX61M+wNzUAhWW+KBkVwKhdzP5MQxNhIbT4CXsC5LUjf/2/tdJHTdcdE6RB/hMvsguibQsL8MTxYMSDw06VmysfdVbMNaS+jq8I606qvpwA+1hBJaItkH5aZXU6HPOs52lo7ylcM5FV8AfG3UfOJSZ17BaRH3/t7HasPAvyO07ggtoQrd5mahyFlCU6UW95y8+979XdkLgmAIkDUTuO6lm0esi7z+2ZXUKkx6tsdTtPUiwZ5hgKE1wDjUXV1WG56moHXXKvhowJD1z2/ti3qIOcay1X/DOuI7K8bcyU1rihcZgZfb/4Lr3wVk7lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXEN9x62Jq9UvbWjL6UlQMRwViT0/7RrMrk3YQDtxAI=;
 b=PkmW/g/qa5rnA+FmOXpeJ4QaWOdgqbRUwuQJVLoLmtdiPHawZBusr9rJfqItcLuqD/TOqloYgTHTrKcZmMsZc+2lpuMHdcj2dCu84blXxqVX+vb9xR+BF7IsfvcQw3DfXYHqHm0Nstv2kY0leZGv2iuv6xlwbn4X7ISltLWmS8/1MrS280qxemeaabafIcsjcqd9V2yBylHFY+wVC0by7p0JH8lAWjVIPfGhtr9msnttnh8HAA2rXq0gr5ECsFB9skJXEnhFXwOnVRJKMtJe0M6aOMTb8hmg+CoEck2rHJruwUfLL+ZcyFsJ/uCZ/ox/nlRdIECMIjm26i/NGjJb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXEN9x62Jq9UvbWjL6UlQMRwViT0/7RrMrk3YQDtxAI=;
 b=D2Vs+xYmTFIyQhNLKmms7EL9aQ95sk5Q+MzcQVGLS33Vfze8ZIrmp31ezWZ3ktu4/eOY0o+7wtk44YAGeh+d/k5wqSjdbS/ZkwyfhOxnl4M08VWvgCzGY89Ra2ZKypd+YOqCFZcCHiey2yzO05JUO1aXIvjwQfOTT0mrfA/7XrW8ATC1295kU9MNCYpYn3eRA2oF+Bm4h7PCbUzRBHJkmjN+PEJN0zU2EP9esU/00SR6RnVpmSsLMj3k6BpJ8Z8YrXBdSO9mCCLzfQWV9J0wRWRCpFi56ufmD+k7UDBTsrxBcMP8Ca37fvi9zAfY5NwC++VkEnCa5g9ZkIDBdteeNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:20:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:20:17 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 14:19:44 -0400
Subject: [PATCH v4 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove
 some rmem regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-memory-region-name-v4-3-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
In-Reply-To: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789669196; l=1446;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=n7rL2/Wztxf5HaC47YdpizAOER63w4fMbCUBi/lbHd0=;
 b=DUHYaaKIlEnFdxX8bSHZq/QF8VYLOI6oIdC9cIfL6SQ1BRMdZ2rtWLEp3OhdMtFqMSz3KMOPv
 5VCKzdvO1wkAYLVqvL6cmaQVl7o8hdepMiOfYksV5sRiyBQzwbR1/B8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY5PR15CA0010.namprd15.prod.outlook.com
 (2603:10b6:930:14::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: f98b9b2b-7695-4b68-5d26-08df14e85364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	BLYLymN0iL013G4C+5hs13h3zN627lS87g2YCUcjj6aZkIb9uUCUw1ydpVOKB6ICO5+N+vSISgSFBndFa4kK4wmY7FhroSanKZ9BJNrrRhef9yFRD+ccq43APj1tsnvWCUYpZueHBP+H7oo8wTk4Fnz9z3djey2hWkGiCOq4hP7MgXl7Dgh/2zl9yXQdrJH2WZx0bwq2XnqogXMeHYSkpwsZ2TjmuzjTUS0jW87HhVNDmbayj+14u4bdJEOVe+Uc67KLQ7bUK9We26bQgbLCVwZMyxkH4AnGQAoMPHtgLUvY/IjzPR5QrA2HOb1xAX98Cy8Ub4m9rthdJV7ce0lkwK9ProzHncm4wSZgCqnB6STIHcxIvoUMhGoJG9xfNQVjUHi4t0sVMK2bpSK31EgZCvRoFIr2PUtr4lFERRtZA+dfuwHrSE4t1/SwjIRji8aR++67grDIrg9FiOqXHqQsspLYevoFvA00oyC/kKumoeMKcJmA0Rz5/xu/c3PFiGVh/TAzMsjvp8niZIJrMlPbm08/fV3Eukwj399Uq8ncIfvVWZJKvvRdycyXvwvkG66KOQCu4fuOLP0+YcCCqE+MZDwZjkD9MRNhKf0SDxttowsyjlhx7+KXCwmxZsiJN4JOHrNtOIbPHsWQXuvtoto4orVVxCxM8gMvG/ziBlHADT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC94UG5nZC9tU282Zjc5SG5kTENmbFRFR0RPcWVwb3pyOEFUeVpHb3RqbW1p?=
 =?utf-8?B?MVcwU0FQR2x2cHhUVk1iN1BxaVd6UlhaMFZveGY5dXFtOVUzVTEra2hjM0d4?=
 =?utf-8?B?a3lQK240RzlLZS9HdjhzdTlxSzVjQ3d2OGdUbWUzR0VNZGtoUWI0djBHZnJC?=
 =?utf-8?B?SzJ5MmY1V2N5WTRHMlNaVUNrWlo2VUo5Zkt5WGhSKzB4enI5U3RIbGhiK2ND?=
 =?utf-8?B?cGQ3Qisxcm1KNGU0elZHSS8wc2pjZ3E1NVpOTjM5TmdTazhVUDkwN1pQZmxX?=
 =?utf-8?B?RFdJR2x6aTRaanVQM0RHQmtaOTlCdWlla2ZyT3Q0SFloRDRCdEwyR1ZZeHFY?=
 =?utf-8?B?bVBWOHlrZlA5cVo1emdVb2wxU3grUVNiSUtiM2NqcXQ4Y3FRNXNjNEh5QXY1?=
 =?utf-8?B?bnk1ZkFFSXI4akJEeFFxa0pGN0k3NlhnLzVvbWZsdXY2TkV2MGxLUWw5NUtq?=
 =?utf-8?B?bC9VcU5ubUZJZnJzcGt5Njg0YVlJSFJkdXhRdVNkeVBmdlhzSXpJZC9xWGlr?=
 =?utf-8?B?WDg3ZHo4UTRNS0RrVUg4V08wQzlGc3NINTcxTTlTSHYySVczSXJmUU9YNU9a?=
 =?utf-8?B?VU1XazVLaHFkdHIzaitIa1FuekhhWWZXdEVQTUhZTm1FdFhTVkdqdDcyeFAv?=
 =?utf-8?B?RGtSeitsbGtGZzZnRGhCTXV3QmE5d3dHK28vQ3lXbUQ5U1kwYUpMeUF6RTFR?=
 =?utf-8?B?bUxMSzVrYlRBVHNPNElFVHZwdnVtUXNWcmxZZHFPOVltQVdnVmJKVzFKVzlG?=
 =?utf-8?B?WC9qNkE5VGErNldOTWdxZXplaFpzNGhSQWpmL0tRUENObHJTZ0NycDcwcklQ?=
 =?utf-8?B?MllxUkNjQjUvWHI0M3FvWHptczVGOE82VTNCQmNwdmpKelFTNVU5TisrcmNq?=
 =?utf-8?B?RlRPcWxwY0pDblpQMDlHNmdGanRjcFNDYlZJOFZIeFhYb1Ftc3pGZDIrMDVj?=
 =?utf-8?B?U21oSVk3MnYzOS9WREhTS04vRUlhdW5seGFxTURpcjZSbTlvL1pjZXVUL0Zy?=
 =?utf-8?B?WC9vWUtWbW5aTloxU3lsN2w4Z1B0TFBiNk9ycCtlNDV4RllpcXZaVTBVekZ3?=
 =?utf-8?B?b2FSSi92OXRaRmZMVWFKL2dTOTBqSlY3NWVTYWZoemhoS0lBRHRQdTZpVmF0?=
 =?utf-8?B?c2RMWDRJVmJTUExlamUvSDNKQmJuenRmcVpNd2l4ZlVFdHBvQ2ZFY1BFamgy?=
 =?utf-8?B?QXJrSlRDT1NwMEtNZXZCc044bmsrbmQ5blkxZUh3WFB2YXZmNmVKbFpDVGNv?=
 =?utf-8?B?OWRrcS9hRjFOUGZCL2xzbXRFOFByNjFIYmpxM1RCR3ZUb3h4Z0xSM3N6TXpy?=
 =?utf-8?B?MnRPWXFIQzYrK0dNbjFZVzh6V0VyNFJSTFc4dkZRc0lmaVNIQzJySTZPMnNi?=
 =?utf-8?B?TmRZQzJhRWFjRTl6ZnY1S0V4amJSNnBlLzNycmordkVkY21yZXZZRTdhQ3RM?=
 =?utf-8?B?QVNIVFMwOXhIbHM2THlLRnVHNTFsR1F2Z0xwQnA1NE03TTh4VHdtRnh0MjFC?=
 =?utf-8?B?UlA2N2MzNlIxN0tkMTlmc0FMV0R6UUZmL2ZibU5tV2pXdGtib040ZjlYZUcy?=
 =?utf-8?B?c0hmYkEzNkJydmVZRzZlODhISWc4NE53MWJONkwvbnlyV0wrR1NSbVZkVlVn?=
 =?utf-8?B?RlpiQkpleTBDRGppZVNJejdrdGJSR1dWaGNTUzR0WUtBTzNZVkNtTUNiY0Ev?=
 =?utf-8?B?R28vRG1OZDNybWNGY0FBT01BK0NyZ2RucHA1cC80Qi9pd1BuRDhtVVdzTnM5?=
 =?utf-8?B?cHJpNmtmRUp0bDBlVm1hcmx6cUVCTTh1UDFTelVVNFRGNCtncVI3S3JINWgz?=
 =?utf-8?B?Yk1zVHdiajVzbFRYQmx2S0F0WW9wcU5XaGFhOXJrV1M3enBzMkhjaXZHTjdT?=
 =?utf-8?B?STVNMDRYUU8wcEMxQmsvdjBGR25sOEk4WGl3ZW84b29pci9xTGNGK2tFdHNH?=
 =?utf-8?B?UldmZmFWNVhrWndjV1h5VkZ5VWRQa3J5K2d0a0RlSVhmZzl2Z0ExbUV3SHN3?=
 =?utf-8?B?Z1drdG1JcXdiZFhWdnpkTGtkMzJZUXVWcE1od3VsL00xbWFTMmNGYVFDVlh1?=
 =?utf-8?B?QTYrV1Z4SERUWE5CUDB4Ukt2WW41VzVnalM5VXUxRG43Z3dVWDJQbDk0TTFs?=
 =?utf-8?B?R2s5SVI4UkM5Y2hJdnBNRDRkVUhXa1lHSXJ5VHhTN2JHYmFzekJJQlVPYzdI?=
 =?utf-8?B?RDAvZHU1UVlweThSNnhURldUY1dUKy82V3ZlMzB6dm5HK2FvaUlHdXQyQVZL?=
 =?utf-8?B?VDB0OEVOcnMvU292ajVjOGZRUk4rdWVsYW02NUkvVmhaUWt4ZlBzWWorUmJy?=
 =?utf-8?B?RGtqaFo1THZlTEJkOEJxd2pnaTJULytjaC9aSEhmMFJITURKSnYzaW1zUWxJ?=
 =?utf-8?Q?SMe0Rp5E1hFoSyuAKJ5CIackjHj7PRfW8/0rn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98b9b2b-7695-4b68-5d26-08df14e85364
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:20:17.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz4ydnQ3pOoIAGaJpXCyD6NrUXczHmQ1xqEVQ7OjtnP2DFv0XdnhDkqGMt5yBwtwhyq/TOMIqXQJVk5c0imdewc6KWe95Mar0drjBhqBIxyJBvbW85tI4LVGDjEdoheF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be70589..f9b0e266754d6 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;

-- 
2.43.0

