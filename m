Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366947;
	b=pcz2hTWI+0AqbQfJdk7pYXh/8j4594ETwPmjfshCNXjYbXM64RcQPCU0wFK+4sbdyDvx
	 gqywnoPkiy5hB6ddlSYnzPqoPJMHHyjncNaBs0hi3PW5RXTDF6+Z5N3DkTqhGRR2tCu/h
	 KjBvNRhjOyfiQdqAAK9X4GQMgCmnuiok5pATDZyhnkcdXC+SX+vE93hwZTn7ccvJQm0uk
	 KfccuN02TNyYUd4zXOaIAhU33ezjGyz3eto4COlckl7G6yCa/SD2nIfsZbU6UDtC/gTid
	 /1DA9Fjfi0/ZNUlASe1MSnNHlLFhzuYrRB9h6VKv/seiafKNnLye8GD4xCjalOwOUZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366947;
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
	bh=g1FFz2r4F8PvjmDjFo2vcPQQH3TU2BUbl2mbma8oyvY=;
	b=MoCqJzITTMnV9s6H4WaJhltBQ9wVEp9/ezs3utyjy837klRw+BXGjHKk2/MC8eSNWbPu
	 aenqAf/eQkCEvu1o+VYWux6JVISPFIoo/QVPpDS+H3xJUPGdhckESrvZNMRCpr31D4YLC
	 3BUw9hA02kbu1kdXbM5hFWxvWZ6Q2hb2ufSdJt5Xj/8/Wy5LNDzfY9lFgAtRwNMtS9o/V
	 GMjS/+jEtNFlHJO1MoISQ5Usd+rdW3fL0/YdTy6TnJXf2AhJNSfGvSZjhe9GnCXnjS3bX
	 USqJ4xqsK9KcPPujrieWdtNHcl6E/vq6WylkKSvKIUN6BuUv1L6y8X0e5eTVcxTeDSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WpSIg38h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.14
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BA606A320;
	Wed, 11 Nov 2026 03:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WpSIg38h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4retfyI/c9sjIS3Wt7grJFSaa7HQPOGwQf28ZWyJwBxU+T12EzHc446QpEM13Rry493Fs4892WfSS1LbLM1P8O0BI6BjXwI9oOwD/gP2TizN819UuF4tsRLVMb9IPIbMZ4ZMFMLvfQAJvrzaEsK6lT+31lgi69Wrleca1F7S3jt/G+QXcErLxnX9AmpX3JSb0Jppb2HILle9ihA4pdTmenuBNOkkucrplarKfBwvuys2/n6LfwzJLXtpPyvALMG1GSQOe66WkJpdLcLIYjdlZrCLRNGE6C/JLfxPnn4kaqeV5ZQRLwwzvjhGoMhM1j7PAKj5uMpr4QSQcd2Om6pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1FFz2r4F8PvjmDjFo2vcPQQH3TU2BUbl2mbma8oyvY=;
 b=LzkKine1SOfHenN48BPQq3fkHX22rZI72v5t0683nWsVj3BgSPwo0ZTVRfz5FCeLUby52PP50th6W8f2eWTWpikzWnJzRCSoIpOFJU5b8CxvHbDlzp0OFjX6FKvCeifktMLJLfPvuKFfMBfccGRS5pnNeSQaklxNazXI6tNH2G/SbT1nrJzcOFkyMx9HCJB3GpobFXLGSUWUhwOgUzLjieWc64QzpG4skIKKCyWxLBehq871RAc6wwNgWz9eyw2WN5uGMcUNurH835v6ZCVzztw9PYqxvjoDE77WYQBqfM1PBZA6jnQxzQx/Dkdr7iAdT7wdHrie98GlLDGN9qN7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1FFz2r4F8PvjmDjFo2vcPQQH3TU2BUbl2mbma8oyvY=;
 b=WpSIg38hZH6D4ms9BhypjR+3UmtR1KMws6NgDoqv1MFa7FCr0GWnWP2QX8/1wd1yWQeki559WALFLJG4qIch954zZCmx+dTPVZScRh4/u9V5EjlZNo8H/Omcsnvi7XUT3xWaFderdI3zTM+LeyXufY3ZTeFHYwSJ6Ny4Qk1p/+QtCD9YL3O7miuN+s3ugJB0THxqJeIPHO8BaRz9CWhVVkEWCfMMPCIGoPvhQHKLpAuCjHc3zoWOZDjKWc+Z7oUvdnLzVpcU0Q//kezjrNjlL4cj8+gmgfhCM4OJLraRgN+kAxPhzVcLBW4pPA/SZq9Z5DPNaULIh+dt66x81iyABA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:43 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:43 +0000
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
Subject: [PATCH v3 4/5] arm64: dts: imx8ulp: add HiFi4 DSP node
Date: Wed, 11 Nov 2026 11:18:07 +0800
Message-Id: <20261111031808.570680-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 149ca9dd-778d-4380-3414-08df3fa2123a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|261026121527099003|261102123227099003|261022075727099003|261021121427099003|56012099006|261009223027099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rfa0QmQcY3xelWwWfwxzNS+/25LmzKZJVSYJVb8gtcv0CKcVfmqoZ9MH+huUakhujAIW0q9qWHu4Ihgdnnm8DNRzUKkq44m6IPqSx5OEWmThjXbTX5OnpomGHupWb4OKmFa1xkRXquh7blWQseOUikamaaaHIAF1Sx5fcKD/PpOLEhr2Xd0AV0FoAqOzrPIeU/5tNA4TSRzZ9RH0YHXqomOg0KfpIgZzEt29DS88Kfq7ee/R/L7fpxywb7uajziNU+dr1LEx9H/27KDqgKNaZpAlcRwMPMOgZufQSAbm/mfpu4TqhRsIcnnV19Ce5EK7GIs/LBOhtUrYbETTWFIy0dEyhBy0kXXiCph51mNmE7MdjylgSlieCJTUjiYnIOAhRrH4ZUpx39kgdOD3BRrYt+2rL+HibrxQW02pmIoJ9zD2G+K3FE+V01nxCrfm9kRp+T9VI0c2K0/ZRwgL3lLX0mhj4XU2H4IirvFgRNGIbt58bSk+WHsYapCMQyBGECxisGqy0u33bMGCBr2Ggmi4oKYIG18V/nPIqqKSlJ3YaDhJzPIlQ+G4eGky+pVRgyJH/9Um6Q6bynMBVCT47vQCJj9wbLYw9UkthkAoRprpJqeQkVUIic92vR3BKM/g7gT2exa97srj+014WlnE3m7CqbH5a7X2JTl0bUj6icvQsxClwb8cDdSbPuR2pwfxjynoEV1Uk97SMA/uA/LtyVqwkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(261026121527099003)(261102123227099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bMA5QaE1bTc+fJZ8lJrNGfzoubAB9lxt95qw9GhdLN2S1TBrOZq9zeoW5ZrK?=
 =?us-ascii?Q?8gA9XO5PZaujQObmjeApRXPjV+1+Sg7ZEtvYjULWYyMgPyrsBIDHvZUdE+hN?=
 =?us-ascii?Q?cz0djLk3jHyO8oj6FqDWOFbZymzxZJ5rGVNd1YVf/KCQCcVihXXJ3siDWXxO?=
 =?us-ascii?Q?cDJyIxewGuxJMFJShHtAdsTalERvczwalUIfoL5SBzxx7BWb8LVMhjKfRDxM?=
 =?us-ascii?Q?E4veqdDxpBacU+nak9wy6urG8QrAz/saWpcDXXRgap7ScFI8Q346NEXjCnS8?=
 =?us-ascii?Q?dyN8IHpBwqfhQ0g34SL32xMGHGSp9OizqBOUYPjDQkcQ7jbSag+4eGgYexPP?=
 =?us-ascii?Q?nrd2vcPkTmWBPqhh5o6VY9mHbf0r1e9qZ4jI7d5Vy4yWRiB9pqppp56lGJi2?=
 =?us-ascii?Q?3/u+AiKHnlT5/Nq7s0qTAdKswl29jobHl9E8MspRphh7ItcPvSx+HvUSwcBk?=
 =?us-ascii?Q?Wf6r3b+kRYZ5GcxL+ONkkuj8Ox+uKb6hfzTWJZCltNnDRWhUn37QJXK9hkH6?=
 =?us-ascii?Q?f4dLsSLz/YNboLp1uIgmMgkWxx9v6CfQ1BcvuvrfjdsYg0Nre6Sj0G2y1P06?=
 =?us-ascii?Q?RaIW6DXI16isiHhwAhhdU1eeQ3Q81zH2U0X32OdU4O6XAEbSnu16KF938lU8?=
 =?us-ascii?Q?FxqJj24CoQY09ROXW1l++tSDjhrW9qlPfInQHpUXgvVLaBquWFRKhFcAsTRW?=
 =?us-ascii?Q?5VT90CW9qlkZwQaWZQjW+IUun3oB/b4rNoLX1Lc7drhDRVrflSRDme/KngBm?=
 =?us-ascii?Q?mhwec9ZFAcKwoPPz3wGVr+HTsnXutPkI7QNzwefzhp/KAjkDhGDPNmfaOIon?=
 =?us-ascii?Q?qh3hEbz++SEQgN9T11X+xHEX/JvVSagfnREP3mUnJkMGoyE0chd76rDWaXbp?=
 =?us-ascii?Q?YPlfWTO6aoPteleIjR4Q90cUMYxVsKK/zFkz/d6iO4z3uB524BTLRG4ZmBHz?=
 =?us-ascii?Q?mntr1kuZ1aGmaKSAxqTjVLaFonBm1T4Ww4SeIOrRQbuh+WE46HAEFtR9Cgfl?=
 =?us-ascii?Q?6Fw43GLjNWvzmEVso0EYqzqHgL0G1/KwBUUPrTkq25xNrhvwZDTttKNhPV8+?=
 =?us-ascii?Q?8VqzNRMFw50cycpF5q/lbVTWF/tDCEzvTD/A0k8PPjt05a2ffi25uEQCNex/?=
 =?us-ascii?Q?AxHI3NDzchPsJIU8lj6uE29i/7zs7mBzr91l8ve0hHbAFX4UGX1aaB1KCL7X?=
 =?us-ascii?Q?bu1XCfTeAHkeCRSAcr0lj76gKLFMj2124qLvv8aAblFPxpU2o1jAiigUDQWX?=
 =?us-ascii?Q?4fHIkwY64R7hzbuhfvPwKZE7Lj+6RKr6t54lzoctXprKdSzXs/lBnc42ymkH?=
 =?us-ascii?Q?1ZD7mn7n88Rv4RVmUFL8K9tEJFJ8K1YHTMYPL/a5ptxXulce32r4UPt+oN/9?=
 =?us-ascii?Q?GGvx67XN+EVhoOcfHxBhEUW81qzT6JO6t3XdfTnL9ONmMT9riFG1gY+rv72G?=
 =?us-ascii?Q?QyiEsUm1MjaqjD/CinLR31xXBOCTIkHLdzDbcH25Iyz6yEHpifajl0mz2BCb?=
 =?us-ascii?Q?zSv/9Isq75HDCva2/xC1RJtPBxQpB873IGD3vBNdlkiscsvZi1JmkMRBMyl5?=
 =?us-ascii?Q?Wuk3D6bzIsORRUQsc5cwrkrCefwr8dskOu6a3tHEWIvENuzpVZbic1yeEnJL?=
 =?us-ascii?Q?EwJDxQFRU7ZN+PdRC/tV2Dv/2PbnDB8GK9b6O7L0JNv0ksRz33q0AXECMW63?=
 =?us-ascii?Q?lvv5SgSgNxuwOeaAEDxXUbNenO/K2rlsKTVQ0syaFOdGLpoQUwGX+UU0JaRz?=
 =?us-ascii?Q?hjJnvYJhRv6D6VXDF4C3YofoxiaWQKRWlkK7BzixmayHkaVepdEt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149ca9dd-778d-4380-3414-08df3fa2123a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:43.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Gb/OteypFSiT/G3SU3nmtcSx+Ekunxv4oPP49xqt++SVMLuDpJUBs51wVXzUgvE4OYmDg4qqO3ifFqU3DBgZ67KL4aBzmAv7jXUBxPgUIzmUEXQAvXp934byuwUWhoZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add the HiFi4 DSP node with the required registers, clocks, firmware
reference, and mailbox connections.

Keep the node disabled by default, allowing boards to enable it when
HiFi4 DSP support is needed.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..9da690b5e03d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -200,6 +201,28 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x40000000>,
 			 <0x60000000 0x0 0x60000000 0x1000000>;
 
+		dsp: dsp@21170000 {
+			compatible = "fsl,imx8ulp-hifi4";
+			reg = <0x21170000 0x20000>;
+			clocks = <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK>,
+				 <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT>,
+				 <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_CORE>,
+				 <&cgc1 IMX8ULP_CLK_DUMMY>,
+				 <&pcc5 IMX8ULP_CLK_MU3_B>;
+			clock-names = "ipg", "ocram", "core", "debug", "mu";
+			firmware-name = "imx/dsp/hifi4.bin";
+			mboxes = <&mu3 0 0>,
+				 <&mu3 1 0>,
+				 <&mu3 3 0>;
+			mbox-names = "tx", "rx", "rxdb";
+			power-domains = <&scmi_devpd IMX8ULP_PD_HIFI4>;
+			resets = <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_RST>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST>;
+			reset-names = "runstall", "softreset", "dbgreset";
+			status = "disabled";
+		};
+
 		s4muap: mailbox@27020000 {
 			compatible = "fsl,imx8ulp-mu-s4";
 			reg = <0x27020000 0x10000>;
-- 
2.34.1

