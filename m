Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE70241671;
	Mon, 17 Mar 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218316; cv=fail; b=aZEBwmQBKervx20cM1lbzfQVd4mfiarDwcj1pZxVx4GutUraLbJ6bdQkBMtKShFlj7eGSy8jrzkuUFlitmUUFMXpYzC0zs0O+COVKJXx+ynDkyFjiYlRC4Q0c0dD5DVmO8MC9NjPWVlDnUsKgp7u3t+WY6nNnUEQmR6k0TWQXjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218316; c=relaxed/simple;
	bh=qZ+s6vDz0K6OcStSwsIXOaQgzBYX6J9DzZ+wo3Rnngs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lgtVIypcu3ZX8hFpJgRhJDA9MGw/V2CGhknkpZALuRmahTFzxPLHMol/BnmVkMiCkR9zGv8o1xQER3vpIPiUzgpEax5Puu97veJ4xqw/DAI4vdog2WAsaqpuqdI8MxaieheF/mLwgUj3ORVqDSyRdhh70K3eSGtlD/ZVU62AYFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S1z8tt+v; arc=fail smtp.client-ip=40.107.247.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S1z8tt+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUtqigTTh9z896rGBLejpPRosiPJDmlPeJivUrUkh5gVG6/hA+2zfTkNy8xVuill9PRqlqh9JPlI+qH4izMDsvu/imvWFBun6TpwB8Ac0E+PI64+9yMc8Jr1tRtMnMcWA7nRQOFLN0LIAl4NE5d3Pgcm+xtJcMHrwDGqZVMfcdJt74tvYgzcUjwGuB4lBzo+PRMjLsPi9i3rfJN0N8PYX+s6aZWUoX4Hn5TqxjpUA/d7w75wr7cKZuHlDmVyXaEhp3L01lPG1hVVSHXIjwr2GWurCbvhC9CjK6NWEqyUWoQHJ8GBmPf7I7iU9V6BZ1QvRoeTMkcYKwkvg+2+GmzdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=cTpffVnMrd8uVq5n3UG/SvdzdEr0bBMY6eu4VP1KgtUgrIbOpwbq8arzDmtd2q49MXBpXLZrW9TZ9mrIWd4a3PE5YIMXhlAB8BkPFXNQdQjsUwzEJPkO34gL2OvO9Rxmvc1P/adeiK/2JN72PabmhxQt1FLLP406yupnSsljf2SzZAkYOpH0xXKwgDptNgxnNOOy53fkMUOSKbMd2oBNSkn1l8vGjf4tFNvE8dx6E2rMlRCHEZLTgsDB5IK2x+78ywiw26m+6kjxkxJnwRC//shGnrm8L3ncI0sLwgrOyLxUbdl1VvdOSUk/to7rNhnpgLnQY2oICfY0/hdizhCUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=S1z8tt+vesu/S9KkyjwqJu0B8IwxB5atBmq6pbZfbRlVRRrE0zT0IS+LBOE7n2Z7eOqCP2TZDUthl25YiDkUGpu2VyJTqBKlBYGwm6j3Z/QoeW2MLnIWTCwM2HQY8hMs4GpmHi/n6Zt4oAmMdghO45lI3E5RSfpA8HfigXjY+pn5qxYTwCAADsbK6PGdM2Cn0Z+/8m1ouqcZjf2a+UkxfXIcqefO9NAN239WqdM+rPHqKfl5x1e/PtZckjIk5mYxVo6QRjGYzJwhx9JnUSAAGkUSubXFPYDH799JLF/FDP3wW/r8wcd2bSVl1rri2DnR6Iv6Mig1X3/l5RET+NW9Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:31:51 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:31:51 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 1/5] arm64: dts: imx8mp: Use resets property
Date: Mon, 17 Mar 2025 15:33:02 +0200
Message-ID: <20250317133306.2003909-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317133306.2003909-1-daniel.baluta@nxp.com>
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 67936848-3951-4cb1-d6f4-08dd65581387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2byaR7Kowyfmt4HPU2FcgikLU0CCL/jVdsAz5ybjQYu/xBNexTdWGJ3Ku85?=
 =?us-ascii?Q?rzIUWmKg6gPsk0Tda1HyOV5BlXT7CDPk+ZiTDIjj7E1ecpR/kwGtzxpBYufG?=
 =?us-ascii?Q?0/Vd1NMcoJbyBRo1eDEQkyNNoL9hKrOQ9WE3Bbb35H6sEzBoz3XPBySTrr+0?=
 =?us-ascii?Q?tT1Ur878WH4wJN5uiyMXdjwy5BmbblfSbRjiNoK61DprniqDMYWU3Si2Nszf?=
 =?us-ascii?Q?MG5TL3wRsTCmSqpphKsASt/O/LMYQBMvIa46nFsY1w4s3x8y9udqvJ/6i3tC?=
 =?us-ascii?Q?DfvhjIH8zTwySa9U07W42fpRLN8SZhYY/tQn3mn+arz/cDbj2WSypBY5c9bE?=
 =?us-ascii?Q?lQcFGXKQITQ9BezSW0Fbk8M4+z+0mUkl4bj0yH8M201gGzYwaroAkwQk78w/?=
 =?us-ascii?Q?xLkaLHs1qEUPTYVu5UTa9NoBjBTI7mndglclTkgxAYFKHBP9ATCAKMT4wWR0?=
 =?us-ascii?Q?2vHjuzKi1fXq2+ElZ1Wsj24bkY/eoShn94uzfHDHwkZxqyNsGuh2gwo6Dz5/?=
 =?us-ascii?Q?cWRanZxTxsWEhrTuLiyfOMHRaXydJau6FAscMlYcaNJKFWL8jzSzUlfS9zM7?=
 =?us-ascii?Q?gTYYorB1s29TZ12u46FtCukYzCzbtV88ZwaTwHCnnrPoeIJ+n9GtoHH9xfVD?=
 =?us-ascii?Q?S7vo7tXIhLul07MSC5f5/FBLShtkYk6AwYLzQqRHgCCyGCLQtR6Xz01a1TMF?=
 =?us-ascii?Q?DAMywCgrbt5YqVnOSM7j0LKzueDYlq1uNWd6clu4Fn+0fB5Okm9wKq25pE4F?=
 =?us-ascii?Q?slm/iff0za6aDF/yHWXROl3A8JUQPb5IfHMUk6xcGVXlBUCWSiCYQDzwqJYe?=
 =?us-ascii?Q?ZaouyHvIissrmCm6TBMEJQNF3SyUfsMkHLphhs1+64hcOMsgmj8qZ47Y2z2k?=
 =?us-ascii?Q?T+fVWH6nOWeLPgw0XqRYqhm4u29I0BxKSPzlTMIdZKRJapNOPWpDkP/shxXH?=
 =?us-ascii?Q?uSwNfbLYLaGuzGM/erN45J9hIDrxRB94DILjhnsth0b3I0TMXor0MJRLbkQH?=
 =?us-ascii?Q?DWt49UlDDDxRfQg8BOgwih6+eMrwP35dAYI43qA+v/fCkSUscFJbFncfBmXY?=
 =?us-ascii?Q?DQC1ey0L3nwIC119clBgPkPuXqoDlSPKNwAzSHfh16xQhqjcWW6NLptelheV?=
 =?us-ascii?Q?ENj7aYTec7LCIYctBIW/jxIK+ZFE2xVnEpMbqLIW8jCGemCTxMbdtCP+B772?=
 =?us-ascii?Q?c1ihZPlojXQlMrMt+OPI0kb3xd0vORn69G+OSkpGYhJMKOSg5WkInXaKtGwK?=
 =?us-ascii?Q?qR2xtNFHz4dnvifhQLSxPWY7xCzF/01+VI/UQ7Zs7rrVqPK5hdqMGx5xR8rk?=
 =?us-ascii?Q?sirs6ahL0scus/1ACu25kuv52Mtv2e/Bt9w1v60S6c19QD2ECIC2VnOAIFtM?=
 =?us-ascii?Q?4V8qVm6WxbPJbuv74ZQeLxFIe/2ahkQ4RbJXjB5pxnGOax4MJhnuqiwXxEOW?=
 =?us-ascii?Q?qJlNV496is7lVgMUA61WJFNdaPPqRIao?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1wi+kd9ykzymoxhUdcDJjtDIIADGFc5cyGc1N8vnaUwYLCW6JQ1trkmvL4Qc?=
 =?us-ascii?Q?tdbAte2wOgAYBD1fTIV04fkQrUtPAOLWKtRwu4U0/W7TBsuEJ1X8wfKQ/YNs?=
 =?us-ascii?Q?VOWonjL+AzSStH1qw6aN4ysqsDT4/Taozc2f2GF1Id7Y82k3ljwtA6YGCiw3?=
 =?us-ascii?Q?tdl0ajKvV/ebMFksyed0/AWQKHPjpQKtMyd37c9KzrhLkeN5HrMqWlaov6yJ?=
 =?us-ascii?Q?VvmbCr49EC1R0eux2gxWA09GuTUNtcBR/cRspFkzzo3gaZjqQStdQImIYb+l?=
 =?us-ascii?Q?ayjkbF2LZFdIEF3OGchWahbx72sdSyJQCLSfaqpAE3rjH6bgLCi9TBd6IbjG?=
 =?us-ascii?Q?juQH6u7joR2DBYGZmHFgRQw6arXa7n7JqaExJ+aEetxJtb1LTlByDjXK59y8?=
 =?us-ascii?Q?mI9ZHyy+/xMTKzMRRfb9CN6jluO4mACnJ+g6ZYKciE0BjVa9qYUnI6RgBhKo?=
 =?us-ascii?Q?GD11mS41AZNXo8Qdl8ZSLOLNPdKz97Q80cXuvu5T/Vq2NfKRAZN6hTTgwf8v?=
 =?us-ascii?Q?QRIr3eEl9WTJJPznIwiKhXRTYEfaLv0TieQxYBhyaiPUoAYX56O5kFq3oDtJ?=
 =?us-ascii?Q?guCynoy/X/sLEcBMlqFiFrqTFa21+kjyQ5skcqPThonxdVpbiSmtHH7hbZYb?=
 =?us-ascii?Q?FgUvsrnA5MpDSJEtnTqbung4wsT5OJc0gm6j1qjW6zPZoAuDq1ffJRRqnapS?=
 =?us-ascii?Q?fl6+5+oMp6WN0eJav0CeJbdLDJ/SnaQOkIYFoomN5gqUYCbMcB6jh5pufR7L?=
 =?us-ascii?Q?rvchhJuh3AVtjMxoSMC5lfwHeMv/eVwB5GVEi70mVV0XtzG+DwTn2NyvUDcW?=
 =?us-ascii?Q?WFkR7U9MpOqImcsySwmVJ5JgCx6KscmSg6/bCw9YCrVokR/4bp5cLa6FTMf8?=
 =?us-ascii?Q?Gr0PBYbV5jHEd9sz/ACwIhjr1COvBIKRiLbPeMEb/I7RwjtDlJYGZYdrhFpI?=
 =?us-ascii?Q?uNVmhNAnItD4jxNGMpyvpbvloRudNAs7DKHyDI5ScV9hRbKef5dEXgCtYWvB?=
 =?us-ascii?Q?0PuByjDqg3FHsD0IfO1xTpbg7HEWB3lfAhZhV//F6PAnCOc4z6iUX+gy+ui5?=
 =?us-ascii?Q?QkCW5LDpVsKofoyp3Os7xWdaQ+f0kamMrpo+HqH8ILzxWlj6uObmnsk5/6+9?=
 =?us-ascii?Q?T081jQqliclrXT/gK1LQZoy6XyDE9vei4QvyybNUv7YokXtdqgeay/wy3gZ7?=
 =?us-ascii?Q?41ZkTajhcsCisGTjHhlbAw9b7AsvaznOVVDJvQ2rEU2T9TDWeyF2nrgbe7Jt?=
 =?us-ascii?Q?VRKbmVb2/MD248SVATX4UnlpjylLblb44w0YiLwAZijYO7LS2dnUqVRGpzxg?=
 =?us-ascii?Q?HL5IQgDSU/gBI6TYDP8W/poBs4LlKNpuBMw1/JdwIqbNG13VaDgppVIIBcoq?=
 =?us-ascii?Q?ILtbIUZDiWf+xhyepLjHLPF/VM86wGJgtKWUl1R+X2dN9sG7Elvag2ZE24gm?=
 =?us-ascii?Q?hu13bqlADpfS1CY5EBojBr5w7+qimgCBWPoCX/6Ec6AJC/z7ne6fX2Ngvnfw?=
 =?us-ascii?Q?exPpPM+IDXTHKujv4nCrsbSinwJs2vcAPQAfemI0Zy2K2yuJ9A1iCBb5/n/x?=
 =?us-ascii?Q?lqE00jDveXblz5gfoVFWqqT38EjK4ZvZ0zhpYKi+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67936848-3951-4cb1-d6f4-08dd65581387
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:31:51.8218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Zhm0/F+V851coIDwEWWq4vBt/EtVLLbxwHZDb9pptmkPHjgY6Ik1yLRUi2YI6DdT39ywZ54/R2WwbWd3/1I0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513

Add resets property to dsp node in order to be able to control the dsp
run/stall bit from audio block control.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..3b725fe442d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/power/imx8mp-power.h>
 #include <dt-bindings/reset/imx8mp-reset.h>
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interconnect/fsl,imx8mp.h>
@@ -2422,6 +2423,8 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
+			reset-names = "runstall";
 			status = "disabled";
 		};
 	};
-- 
2.43.0

