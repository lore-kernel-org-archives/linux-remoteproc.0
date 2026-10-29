Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259088;
	b=ZVoRpkik8hr+cRld/0veBBEAi/g/UDUUyAFRippZYFezYIkPf2QF9wtR9wMch4nvnRn7
	 3yEUZLOf528BTCZaeAcod2j8YsMCE82z0hQeBD/WkOheLqInrBvcSpK+SwV4TGNii4yHt
	 hqjkugZJ00JDv3N0gLTqjeZktjAcXsDygX0QWAbYTjb4ttv2BZ6cJOghBsO656YvthNv4
	 IG5LbPAER18lYt7Q+IKWSesuFLM68X+V+XE6XpBXuGZuf7prJNLjkFeczhjL2sC9R7PLF
	 m720YYG2tl8S1fseQ3lIQpbJ/vn/AazVr/cFoVEEPf42pSY8Fw5B0fRxAOFwLz5TrLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259088;
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
	bh=OyyaXDxiZBIIP1QP3ZjwTOPWpZjWGuV1/tNBjv6UHmc=;
	b=tkNHe11e5b5NdPqwNsWgYnle9VEFNc8LHqH7K/y9jH6lxFGYqM/86XX/rd5sC1q+tmtQ
	 xV/+8JoPJO5Wz8xxPjTZUu9yY0UqydlF3pdFcSHkvZAhlPFH7ihtYTLuQQnTKJ7Sk97km
	 0HQsAVjA0ldGkOCHEOJlGT57nWcG8dJz6kpHp+ir7vptZv8cO6PGYWxRzOJV11dcq0cd1
	 56HaVJlueJg50+1DiN0ewBF2N4ZR9hYgf1Lb5QxbAjSFtgcS3y5/f/Y5CzMxM2JO2qWEw
	 8XS3nkF5+G6qbAXD2NqJo/TXTffDOmYzlibFKwFSF80un7XGEQ6qZZ35+uH6qUCqF6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hws2CTZ2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC2606A322;
	Thu, 29 Oct 2026 07:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hws2CTZ2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r595CXo9tS6ttlyWGxAfIOSvQehG7EH6KfmmNgdRBIFCRKFus2hMPrfNfh3h2yKnInxqxZ/EFGS1sqUtxeSw5KzED1LaxmbEtYsnfkf23ch+VYobGB8+p9ndsrQVuSQD7+4QXv+uUKUJGbtFFebUbwlQM40y9UG7TMQrdBh8SGwygqd1YtLxFv/D7+MhV7i7W7i5+EinIJ3W6IT1cs7Z7uEwTR6hTPA8W36ESPnUlxR7SLXSh4XgyLqSCZ920s6byAfwaZJPsY2LVrFomfUGnz1baWzNLJ6zxi5ki2ug264IPJk2GFdZCKBra39xiCpjB6kNRJojF9lle9/fJcWCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyyaXDxiZBIIP1QP3ZjwTOPWpZjWGuV1/tNBjv6UHmc=;
 b=U5drD840fygcVSKpBQSyWvnMcwX4eLXXydJDEqqhmxBLaGJ8oQ6snKzjgl1TVP+mvNoGdUtECzEFhyJDPVvCUk/nUxeyscOhtNhcSp+yfp50fqEuZt6drfQ0MlAnTfxyq7VerlH78Yr7kTuAy78IvOe2PXLok8VfnpNfVoKaK/Ah2XBgHWi/SrWThoe2v2Kb5/uqUwSuMuEOz3RIJZiZQYp2WSc0Dqlgu5B6woNWrf6L3Cl5eNOE0cRVOFgAO14WtjroZqRI22YCATxE6DwpP4AyCLWJIIjBk+bAj3qsR3+tLbuf4KZnQueZ5ZSnNm6n200taMomyLYghVEe3QgvKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyyaXDxiZBIIP1QP3ZjwTOPWpZjWGuV1/tNBjv6UHmc=;
 b=Hws2CTZ2IGcUbemEqORZqR/l254HbgdYVFOuwWEtAHmjPvh3kwwoWG+koNAk2wkJ1pQJFZBetg5lkvFhxK8XZuvyGlSFrGXK1BoSC8SMXb4U8amqkeJiqvUaVuaDDWCZUn3H8qvLg2JQtTfM/dSK11hqasXRZGy0bJgLkTNio2odyj+3VYCvDEns1hpHwD7ufq7r8uju7WtMr11ksTpsFnmdBWxd3ju/JKz+NDM21wV3eExYsJxB6q0GSbnRqRZoxMzqjoV176HXyELC0Iq/GP6BMYycvIM0IRKUOK5D9SgalEJ+iRjsDAwouk05LaOc94Zic2Mv3ipiNnG33Y2mGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by DB8PR04MB7147.eurprd04.prod.outlook.com (2603:10a6:10:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 07:31:24 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:31:24 +0000
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
Subject: [PATCH 4/4] arm64: dts: imx8ulp-evk: enable HiFi4 DSP device
Date: Thu, 29 Oct 2026 15:32:57 +0800
Message-Id: <20261029073257.84594-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|DB8PR04MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 8669c586-1092-4c3f-1930-08df358ea27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|921020|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|10067099003|261022105027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gRGISPCicwjMNDxxoGIZJ7nXe6eazdnG4/A54QKQTFX9GiblvoqPR47laTAXDRbtvIenvLf1wi+ZMQkM3tdXKkIp3X2//paykE0aKl0vE9ca4OXM7/+m993R6ZAhhhTVMKwxEEPlV2lmD5n5jAn7HjE4CL1c0CWF9F1qafTrUEJq30jvKETxAGxKojw6RzRMDExa8Z5I9vdRBlxMDUKfCdyBTTrFu0p/+dxrxmjvpvR635CONIRvacQmuSR1SkilTCjvbIlZS3kt9GqLnuoCbzdkUAmRp+eUoj7awukU4S24XtNW5taOXvrResBRvcGjQKNGvVa7lOyn59js5Q7PWsbvudtUsQa+eFbkdbph7e4mDF58yT9bovMAZp2kFNyc+GWJwp1gcOiHn8muK21r5oA7l5h0UgjQDloKxVng0LLuEhBZW7t5hGNLW4Mpgv8mVZORmSSnjoIwOlRsnVRvO0ou1lq8xk8dSNp1fLGjzRGmpei3w/DoD71AbmMIdE7aUkBYfN5IMXf6Dumj0ZFM+x+qexle685Ci4SrbNLBJwDPnVC4f6cCrB5Q13IhZASFernFyip0a7Fszf3THAFMQkb3oekBMiP0rtniTGmsDWfvkiXfJA6grrj65ar13WYopA/1Wnth64EXcuKr+9qR41ZB9t+GRnspQcqxJ+OAozCO2DG6xw26My7WDcO30wKczjDbgvtJQ/maSzMoytlXRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(10067099003)(261022105027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xa4eXDjTiQfepDUN/ZGZ5MjoCYdKe5ihwbQeAKNJOweoG7iGMPA+4OtcXmA0?=
 =?us-ascii?Q?qM5V9DC4fC+c5za4OiXw8Le2UzY2aQK9gUJKYD9dazV0oSpp1mgknugmx8Vk?=
 =?us-ascii?Q?ESwZfV3xjgIUAdWAX3AbtkzL+/ZYEVNWGWp7v+frPEeAF9z0bC8faiLVINH0?=
 =?us-ascii?Q?YaVbC+ATV3JN6ve3hzNDDMoIMqoxEzEZ2Cq2XAxo0socrbSarh2gltHTPH0K?=
 =?us-ascii?Q?I5iH75848g0jBOP6uc/F/Hj+72721uARhUPWC4BDemp+wEcEwDSI8MHzeeFV?=
 =?us-ascii?Q?nd5I0MDq6Vpi4eDZrBT4h9R5uz4pZCniq1vajw9Z8V+etM187l7gckX5KJ71?=
 =?us-ascii?Q?SethBYzOkyUhIvTSHZLXKNzW7/5bDNPC6i4S0VEbpko2yR6SqUGbSww7y1Rg?=
 =?us-ascii?Q?AStdkF44YCulvvcPWYOZWCLMGKGHvXxL/KwMaivp/3fRluNQgVC/Zl4jGtAl?=
 =?us-ascii?Q?6sRKxHWuy/7wfHkSDc0EGsJIWtat+miThrOzCCotoMJmkeCB4GwLqZoT3WDB?=
 =?us-ascii?Q?dFl3TEEOLWmHfj1zM0W/FLaAWPxxWEYL07XZ/gRDYNJnR+fhxUPdTiHZCDNC?=
 =?us-ascii?Q?brDqvGH2u0V7clcIgW9zP+rKQgAugeRG0X5WiNOT990pXr53+sHKswUamo/T?=
 =?us-ascii?Q?/07gDRDVolzSldNFe/k/sCVsmlsplTbop3GE2VDHr3OKbCuCUwr+iK9iEJWn?=
 =?us-ascii?Q?2o3ttkt2swrH8MDMhgXOOIMvQqnVY5zbsi7SPoGACoRfQb8w+93N9rLaIFo1?=
 =?us-ascii?Q?fiI6PoM3dIljwmPAuGFPhx5AdDzgsD/rlja5UfUCW9b1amVtzuLVSKsANBOA?=
 =?us-ascii?Q?zJSpKftvKYC/6GKx1MmbedA+wZoTLxoeuc5rV3/et8xWnxsEj2fIxjCV6+aJ?=
 =?us-ascii?Q?SlmNuzgoLeLqPBieonNWMmd5XKGxBYc+V7dpGHtuizBAYapay2O4J0vOwjzA?=
 =?us-ascii?Q?qd+5/Lg/YECDVVVG1lNukuhnjOExnPZjr3HgM8rqUTnceDo6MDyCLbBRE9c0?=
 =?us-ascii?Q?Iiqodxim6gORgcq7IEFfU1STJfeKY3HORw6LPHpYQ1sbmHqo/azIlfWrHKJg?=
 =?us-ascii?Q?dMgyAnpbd+WxhhuDtbG7qp7FHU8zuSbdr/abOzMex/CQA1yAohaYufgBjeYh?=
 =?us-ascii?Q?u5EzwgdVwtD6rqv4FaAd9zEWaQRtkAE2IITUY8eafrjH5eCnZP21ZOsPOOtg?=
 =?us-ascii?Q?uYCqeOWBe1/+lqjVCZ7fUtfr+Uaw4loZIiZCOMW7bFwa0soWtw7ODEGdxL0H?=
 =?us-ascii?Q?f+7OjdWsjcf1u+8x2iBbbeByVGD9Ol8uqM8NdCyd/IoQCnIFqYoXOhJmgutw?=
 =?us-ascii?Q?rV3qso8rHdJoNtxbunZgJpTx8wTC9lLJry4FQPYwOpJ5KykvEAhMOxNbkAgl?=
 =?us-ascii?Q?Tc4Sj1SXQApmfH9qUmvtkSq6pYbNVeK8ngfs29sNbkX3CEWMwllU82VB4buH?=
 =?us-ascii?Q?R9JsKo3kGhUDx2jftz1Lbpm72RLRqHJfn+QufIsVaEJ1CVQxkwfxK7JZkZvT?=
 =?us-ascii?Q?bjNHO2jncFjNjKlGQJdk8daRNNsNnNcdX9fJ9vb2mUnWiLv6URw4vDyIl0hl?=
 =?us-ascii?Q?udp1lGxYVaRDr/ONLWtMzxAgybzOp0YiiNhRj0SLhs5MCn81zA1gSX2EzQFN?=
 =?us-ascii?Q?CuM/MMIo6nvHXU+sG9c9c2XazG4Nn2YjVlRae+ZZLciStAGiqvFSWONmJpHc?=
 =?us-ascii?Q?5qciyh1q0lZTNvhj7S1PMhfbcrfrTUVECYhCJV6LCPvxhQYJplD4UYtaIKqQ?=
 =?us-ascii?Q?VR/B/nLvSPDyea4qdPjq1yjJ+jFQx/qA/TUgeq7lkOZVs67pWSI3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8669c586-1092-4c3f-1930-08df358ea27f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:31:23.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8w7mO+VpGfEOci5iFyCKIDTCPfmEeO7cxZtUGs1PeYrwnE/6HcIFd4bfvDt5CiTUH2x5BzFH8mfWQDEW0Xhzw82Y3nBwwZv/j6RGvceAFHRmeC96Ok/ei+xLk5n4i5U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7147

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add a new `&dsp` node that references the required clocks,
clock-parents, clock-rates and the `memory-region` property pointing to
the three shared buffers (vdev0vring0, vdev0vring1, vdev0buffer) and
the reserved DSP region (`dsp_reserved`).  Enable the third MU
(`&mu3`) which provides the mailbox used by the DSP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index fdf3aab2224b..e253b99c2097 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -61,6 +61,27 @@ rsc_table: rsc-table@20000000 {
 			no-map;
 		};
 
+		dsp_reserved: dsp_reserved@8e000000 {
+			reg = <0 0x8e000000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: vdev0vring0@8fef0000 {
+			reg = <0 0x8fef0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@8fef8000 {
+			reg = <0 0x8fef8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@8ff00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x8ff00000 0 0x100000>;
+			no-map;
+		};
+
 		vdev0vring0: vdev0vring0@aff00000 {
 			reg = <0 0xaff00000 0 0x8000>;
 			no-map;
@@ -145,6 +166,15 @@ &cm33 {
 	status = "okay";
 };
 
+&dsp {
+	assigned-clocks = <&cgc2 IMX8ULP_CLK_HIFI_SEL>, <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>;
+	assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD0>;
+	assigned-clock-rates = <0>, <475200000>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &flexspi2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_flexspi2_ptd>;
@@ -321,6 +351,10 @@ &mu {
 	status = "okay";
 };
 
+&mu3 {
+	status = "okay";
+};
+
 &iomuxc1 {
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
-- 
2.34.1

