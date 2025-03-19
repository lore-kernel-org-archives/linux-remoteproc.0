Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2051.outbound.protection.outlook.com [40.107.104.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D7253320;
	Wed, 19 Mar 2025 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377536; cv=fail; b=t/ckrFqvXcaHz3604wVt3m3Up6Jf12QaKQc4D92SyeZHTYj+VqPe0D7/V+kD4erGZ3BeUV9D5iYRkjEILLQ1aVadZOX/+8c/c5lnULTZzZ+9gvJl2kKtD7k9hHMtipiTH3C3gQ+OVqqd7IgymyCEZanz4i+UHZ+uYqrG+YHU0UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377536; c=relaxed/simple;
	bh=qZ+s6vDz0K6OcStSwsIXOaQgzBYX6J9DzZ+wo3Rnngs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRpvUFUswHOHtDAhO3loVNYSTCqhdJV7GyZYvdM99dl8jzesqqnLE0U5CPYFieqe+Qq3V51nBtqxLlBm86arlaVbeYW2PdsXUdvjiG1dszmkK/Z/8754r3kBe9V+fdwZjayeYntAmKjw5MiJLluBXyjztBLcf7kHlEVWD9CVCkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ASOmjY8K; arc=fail smtp.client-ip=40.107.104.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ASOmjY8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFQus5Jb06vMOrkR/FVmCgyLenr5Mo1pnqy3X0FQbwH57/nHivFGDGLV9aOcsizA6qREV4+q7Te2uefk/7wnMUvtFSWcerhigipnz/6P2H4QSYyjTU07dfOomZcnyRGkUWDgwiVwjwa7EUHGq9xHlOGBXQwttTQ3zogIY6150D76NOUVYeC4G+4izDaGeLujd8Jn9v+b+iZ1Uw0M2UaScEyHQwERwo1eJIhYeNwrMKqwK1jyOTTDuMImH+CiXDcdluygoooP3ivI7lMdrxHzSbXYA2JcMahZf01KVVP1uvKv7l2bTc/D42p9SWejfXkbe/AV5Hrfi1/CKBDuZqG14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=kTwu6HNLeRit5QclOTMeVsst3fNjyWTMdGUhfXf5C5vpUTQb3aGCYpRSqmKkVPCZSQdM2YJkXC11GMCx2bnQBS8gpnN3QauBOM40N/cplY/9s9NX05as1tDoN7oWmCncFd2oPaW0SXh3a23CHnl9JMAGqJ+bJ/6XteA0H9aIc5Ek+Qg4pMwBF2334rddbs5R6r9sN3CgJoBprMxqfO5iCkpXL3M48lEso0+50winT/mWrQ+HvcvlKt4FtEav56+4oyA4JPvPIqa+aTDcwUB34OToSMpxg5R8xtWmH6WsxoQkoqg9cJuQ3hl+T8fXVQAJVoEnI3akgD4nb5dI2CtfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=ASOmjY8KjkH2oZb6eX2gYv/kSWpX2VPSC7Fuh1n98dcvnxlSnBr1UYd2wIMMQqM8iGMOUhhqGOVouvJ1JoiWh7e9MLJMAP/AvHSsvkVFkPlp2PLzXe6tsIj41l0O3SPPpp/Et1EVhsYEjuFRwfj/OJD2/9MvJno5g/0foIcRjAVsgol5J6Fl9YFZk609g48I0lJwTZlog0xG/Mit+7BDduHTvUllWM0h+U4NxrjydQEmmlvkY+0VBFWuMOxpjY8bs/efcHjKnuEnOnPn4fMFAzNe+s1j+0H4kz6jKi2aVtWBuELzLgIzvB6OTuwR278QWO8AKsj1+W+1Bc4ntY9VjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:32 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:31 +0000
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
Subject: [PATCH v6 1/5] arm64: dts: imx8mp: Use resets property
Date: Wed, 19 Mar 2025 11:46:17 +0200
Message-ID: <20250319094621.2353442-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319094621.2353442-1-daniel.baluta@nxp.com>
References: <20250319094621.2353442-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::22) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: c7604dd4-2f3b-4025-f34f-08dd66caca1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abe7jp056UHYTLjl74MLDykuYmZI1SOF3idVNSXkkmixp+NEIPZcDYZGBMOA?=
 =?us-ascii?Q?dfUbpUcSr0+F+m+jb6Dy56kJuSuRlQw11o2swDegqHXgiGLKYuhTjwBwnMgT?=
 =?us-ascii?Q?03I02hMsH+PgA8FlIEojc7rODOjbOYZgiv3qyO5rL5hn7FhhEYLZehxKs0WH?=
 =?us-ascii?Q?Nlep3c1AMtW1Q5yfEJ2utYk/XOZvGiN/VfL5ri3J4LHgxn69M1NG++zj+IaI?=
 =?us-ascii?Q?C11vOqL/+EaXYkPwvfDhTz8526DW5a7NQtF4sW9MqxAZ/EIfGLhsRU0iblUf?=
 =?us-ascii?Q?qHoo+0Xo0IQvysqH0TJ1LqzEKIUpTEmiYDHoZ4ZTd2hFUs0I7wcJTYYF1YtJ?=
 =?us-ascii?Q?5V38duBMIYjtpLMCJE36XnrDieFXbxMLUjxRsa4j6swJOCM/c+PqB41rHEWC?=
 =?us-ascii?Q?1EHYndEoBOvVwzS2EISUQx2X8kJJdbrufdlpScF1/V27v0eDnGvhIgQ22i4C?=
 =?us-ascii?Q?Jvq80IyAsaVLb8h9RG5Nz/xN1WpAR0xGZmrruDo3rAPlfNOcMSqDBBQs4+1L?=
 =?us-ascii?Q?b5cZ9HHfcptqjSSRVJhguIloSzJukcX5dqvO77A41ui4Iyf/EfSDr/mbGdjV?=
 =?us-ascii?Q?oy5EH82txGQuUWllDc4s3jJoOfwhnTmeORaS0PD98c1nCgh2kcdv8NpAsI6i?=
 =?us-ascii?Q?GPMoEe3S5tJhkWk7FPsoPj/Lmoz7ABABdkT3Co2e3LF3xuZWYal7DNw6eUki?=
 =?us-ascii?Q?vYvks1k1yDBnFwyIPZQcBBAc1x7Q0He6smGRrwyySK0RDlYbimszfULN2VCh?=
 =?us-ascii?Q?L06DevunBPrkXITOSMEMewUW9X7aOEjUQTLS+0Abx+7SOwXyiPVHrfzj8ko2?=
 =?us-ascii?Q?b4snmQUpybNzDztfRoq4eA9zowXyVPVfkPTSnl2AOtR/jl8c6oymagFGjsUM?=
 =?us-ascii?Q?qMK6eMqRSN0qHrPo1Ax7hIzyfiwCA/ny5Ag+Unw/mGAlWGkHZ0fUvpsTwbDt?=
 =?us-ascii?Q?byqzk4gRW9t6S8nvWQf+03oBhgIEePU6So/uerJJipyYO7RObXhCv2sFemqd?=
 =?us-ascii?Q?2+jv6gHDiyom4MGUpZhr4a/OSSDAtXH8DG1GB+nCXq2yq8wXm0EC06IBNPd7?=
 =?us-ascii?Q?kjDoUuK2T42zxf/uyyhxXrcXakWTxwLLz0d9eCK+5FLmeQFRJj4t/LWX4eoq?=
 =?us-ascii?Q?PO1WoJJFEsDL6UpsBdR1zavvR4JUET0viicx2RiE13yePdNt+srDDoT9FMc2?=
 =?us-ascii?Q?oTBUBdE28lsDQWAY794qnvu6I3/9B4Y65bYH4dhLC25xb4A1YWcVLPuNwMRG?=
 =?us-ascii?Q?2ZugP8YpXkK0oi3hJz9vXk6Hx25pNS1/KXx5z05NxBldfVmrek6uiLJYx4j9?=
 =?us-ascii?Q?8YIlxNnMAXJAIZ4jpSfPJ0fpt22eCcZTekRHIs2BaaDS04mmJQdF8/AGGVRc?=
 =?us-ascii?Q?a03qaVpaQYQaAuJD6/JpOiFfaZnNI16dq2A3XSb0VZwmX+15nsQAbWODZ+um?=
 =?us-ascii?Q?1rYJUBR6mxn031WEuTZQjdLq/4lMZ8dV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AkKWrirp1FveIGtJm2JHyw5votlb3jDLk8Smw+gXGYGwuuk/xe1Gjm1p9bjT?=
 =?us-ascii?Q?DjTn2xGHv24UliAdELxhCily6v1KwZR0hGd588zLlxmkaMC8jyU4pTPcIXQC?=
 =?us-ascii?Q?f8qriWaaF/uT8FMkWY/rcv07sAIPCkUaTmbSmsViCHlRVd6SKBxHJaQCrKts?=
 =?us-ascii?Q?aIJu20vdLVnDyxSiLLFxiJjYUNit1ZFKs74qfyqFkyudQ6F2TUrNj1p6oF5l?=
 =?us-ascii?Q?LYvMUPlz5upyO7qe9k8sP2tlFNO37mCdA7SzYE17VHDd89Cx4EnPUpHF1iAW?=
 =?us-ascii?Q?gAddM2Wq8VVyUx4x3ZN979Hx9OJw7mJBuubEofsByfYrVrJgvQC4jvYAW8/A?=
 =?us-ascii?Q?ISS854GU1nC2lEDBAMJWgAY3Y2NmBgv1TrbHETiJYdAERrOW4yl9WfaZyZT2?=
 =?us-ascii?Q?RzXhM09dFTD6qfnVTRmWvur4qFHMtVquCwStpSfDFXGaWSi+DJjUqpT/fXlM?=
 =?us-ascii?Q?2WAZW/VrmEHCLcnFX26sC/ZJrD++OAGsU4/UYCWO5P/unBQ30Oc0X5YeStK9?=
 =?us-ascii?Q?amX7XkoJITfm4jCL6cHyitxA7LPICrZFFI1VoGXKJxlQiFSvnxl+39UlxVti?=
 =?us-ascii?Q?RTfT/CGY4KyV3yitq3isUJnEwJ2wFMsqn1bol/BTNp/J3PVMphJuWElp/LsW?=
 =?us-ascii?Q?oYxCQaid4LI4Zw5q3XzVoM8LIfQ7ZFlBelvndDTyACMjxrsHgPNVKqqvB0F+?=
 =?us-ascii?Q?0B6wyb9UgXPdA/NcAWolzw1/9ZMqMFRKm18cdafLFeYL/vDl1ct904HVRYqi?=
 =?us-ascii?Q?4ZioVo4hYHyxphwyh7Jkg0F1Qx5hB16HPbhQij7PTTkyoiu//e+RJ6Bviwj5?=
 =?us-ascii?Q?8fNj8ElyLSfvhKyrJ68YuuvBvDYlafWzGxgx8pQWKWR8T27kh1DLeI45278t?=
 =?us-ascii?Q?r2em5tlcnAeEccAlHLt5TlP4/WHUFcgIvdb+EnF2Cio0KOysw4ElnhLvN16F?=
 =?us-ascii?Q?sUeKRAZ2kcqFCcSPbSDZOV5z/vHNN0ETkHvsNFw01sU3vEWPNF5qzbSwNNdg?=
 =?us-ascii?Q?w4XGcyIz4XEEz/hjUqkxuw1B6EcTfvbOIY79xclM0lF78OwSkKfVggUAe1XS?=
 =?us-ascii?Q?9T/nt6VNyAEjvpOUQomSHwM+fvQQ8rD+DyMsUnuBoOfBDI3rRgXMGyfoXQea?=
 =?us-ascii?Q?sqEJ1yx3eb08U0s8K+/VxnpC1pfL6a0qOqi9D8PK1oOYspKT74PH5A7PZ1RY?=
 =?us-ascii?Q?OVP791pZ5sLl1USNPGMCmU/kj/6Bw0qpo/yblMd900yK2gOoQWE8qNUWXybQ?=
 =?us-ascii?Q?KzyrDUbqSiAi/P7xNR2mBakkCuR+g1uBbNo4SI9RfoJIgap8BN7V7alLNj3d?=
 =?us-ascii?Q?fiLshKATbXKXMrP1Sn4BN9XFLHHoDp3eU7cBuR3fBcYwd6qRla/mFLqXALS5?=
 =?us-ascii?Q?xIuNGMgMzCorzGj6Kf8s4snGtg6Hu3lnRN4uPj9M7P4ZFzD02xGGyFG7IBKR?=
 =?us-ascii?Q?9dgf7T3ys1AbQAcVg8/lWQog7OrPD4Q+mqpwwK1JBJzEztwGUpSy2nxxRFF9?=
 =?us-ascii?Q?OLEC5gVoVXUuGW0l+a26YphWcOaBujRXNvvzz7nb9kRBXHrehvV1CPTL3TRe?=
 =?us-ascii?Q?1WPeIMsWZtAIn1JTQz8aGHvJIcBur+ogpnTOaRhW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7604dd4-2f3b-4025-f34f-08dd66caca1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:31.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkrJBtnAMCU1F8rX4HFZyweWMN2ad6H/OnscqpAEvNiZdxtWiwzHro6RRHvP3UOILPw0FOjBw5ht0YIPRkgexQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

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

