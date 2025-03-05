Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB82063F0;
	Wed,  5 Mar 2025 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168873; cv=fail; b=ewIyrZLHc5ruSVEsdSeM3D+EemhPDr3RypgSv3GUxskRuCiqS/RPljZd1GlGeSMxPHg0Cqs6UHXyXhpY3lFLW7TfZO7lholDsj3VQsy8tj6pdbJVF89CKPGsRGZkxQU5LO8XvwluOi6/PTqOGgbU7QXwQKbi6cbpDwXa0Lkq3YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168873; c=relaxed/simple;
	bh=EAERBQkLpH8qR86MxmIDgyb++TQDZgGtRu8LK89mqik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YIhi9hkztUkZmP7kvD/u1sH+caGXY+l2ycNFWVCgy4PIAZKEww/eO53lHPe6ft7evxvdH/eaTamJMaCY7OPm7RJdfP2IeTG35Zaog6CVUrstGJfeO4UpXaiex/bkk4OQ6Kd1Fu0ICeS4weUAHHHe6SvFehSTi0kS74GT+hgG5rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OS/WCu+b; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OS/WCu+b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvD2tCNsqcJvyqsDjPjxDEHoPIfLyA0VTDNl2Y36sanSo1tKOXIwHHh/fyQRlQB7iTGJBmhZMKsvhlF6Y8wslS/ur0sArFmTG39PyEJvldQ/vNWb3iQnTZmP3dHBB/hL+fx9upNC53qTLkBgycsAO+he5fld20HU3X9j9P7Svxiiay+FrQzrPR0jlFI5xIlZ9zbfczaiJy44jH6mLBVWqsatsmcH5xCwMUZE6067zsSJEo/sHJepOrh3mpott338Vm7m9ouwiFHfvthIEq1/wJEhSXMbEmtMBorAvLZrsCD1gm4Sa/A5Y+pC22b1BYMIuWCk+eFQfBeobJZF1pOqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhqehvG6czOCWJNUmth5r4kLo3nZ/EIxnbgVWAS9nNQ=;
 b=hqRB9Wk4WKZQwz3cWqB2UhYfRdZvSFHPZCb8+f5+YOS/X5smU/Gq6VO725i7u/NmumgPo+PfNSJHhsQoXny7EZRPfXX20hfsMR6YvEO6Ww4BJEuWtzuWhf1RrnMb3c2u+UMI6+iw/vqYw4n1xoWXpaTkp3w9OFR5RWzRW0HGuV4Ys1wF0Zilt1rJwpbbkWuKWh3VeeI40poExxA9YvYOHyCZSpRp4P8kSbOHZd/xzhLUmDeKMaPMZaKR/KwUdfgKZMLDj0YAlAzNDLVorxqbvHJ8zfdE0E0V5TU5r57n2qnDtSvGPGh5KjNOkQnutB1aY0+lPnPzD2uuQZTVGIYTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhqehvG6czOCWJNUmth5r4kLo3nZ/EIxnbgVWAS9nNQ=;
 b=OS/WCu+bvWeP6VvOMQQhkT+zy6BI1AD1XCwV+yiyU23BqXlIbUKuuMCtAyMdj3QEJ6FVXa30cB7Ku3iXIpFYLODiDRcisWWqUzWDXnttjXduMRJke6q9DvC/HMEzMTUBPkR669fn6r36nHjPATiyJQdS97HUmLpxQ149+2oVTksKqGVArMsjlivmnEAyLyLUhzD2Kx2mQg5onxf8UL4OvzGJJx6jBRgM0dDLPx6/oMu1VWJt9kypLz4FCSFfW122lyPMvdOf8f9YEgoUICjlrJtaYGauBNlBouKptiNvl3EBKpcA4ff0VHlFq5ckLnCPI29VlLOOOF7gU0DATwNTew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:05 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:05 +0000
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
Subject: [PATCH v4 3/8] arm64: dts: imx8mp: Use resets property
Date: Wed,  5 Mar 2025 12:00:31 +0200
Message-ID: <20250305100037.373782-4-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c8a7d636-c1a6-406b-ea8f-08dd5bcca4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpHmIWKkpybvzDz75Z5NOsuXuD6jIhR239niCa3HuCdhrBLG2zwuS5a+GWiK?=
 =?us-ascii?Q?kjRt1i29/otOiXHOJX6i2kiuziBud2K/1FcTlDzDb9o7hxzE/GPRoz8nJUWq?=
 =?us-ascii?Q?dxdgofB+hfuWNnAhB4CqgkQrHuheFXIXJ/L3YJ+xQ01knPCKSvEwnYjbfmFl?=
 =?us-ascii?Q?pgLZnyuksQL/Fg8FfKKM04yqaet+nQo2UkWW5+Bww+uRE7wcHWBrWDsrLhNl?=
 =?us-ascii?Q?LDp6+zyALxZ5cFmiGZm+82hLUV+i3fSVwE4oRjA2TuZGwA9D2W4WTnRA5imt?=
 =?us-ascii?Q?1Kv0WEt3RdOwEcNZZBe/PkITGDoQliiQMm53DYcluiqGpn6GOKQ5WxBR54NA?=
 =?us-ascii?Q?Esy8fhsrj9KIo4t7BLAx8OABXVoPr9qBMPSl3f64GrJz6/aPbREAM2JYc9Xz?=
 =?us-ascii?Q?qWbn1DSLZ8zFmZt4AHzH9VqnZMZwqCM7oLzCnvaaCnFyp7u9GaysGONkxre4?=
 =?us-ascii?Q?FpKJiKJ1qMcl7YrP0aikZY3TjHQsn9jQjjjRrl3fNQlnUy+NI3TGnpWh0jNk?=
 =?us-ascii?Q?JlRrzQf87g/B4rR+ftVo2+HD8DL553jlxIYzGdlf9X3DcSqhfNqtjmffZcX1?=
 =?us-ascii?Q?mvv9hOPcYRjxFByWWdGUqjjQKMK7eaSdB2QqT2tctIhqDs0HbSPFY07T2Mc7?=
 =?us-ascii?Q?yM/t3FodiQaOuFEDC2atJ6wG0KRnBcTh2l5mYcSDB7Y9rVGKBxXS/2vLpR+1?=
 =?us-ascii?Q?QxmN81ULYHgalYooep84rNz1GRxnda5Bz5d60txGFP0N/SdjEZUyxKplSLtJ?=
 =?us-ascii?Q?8lVxAHwJzId+6CtCKMyAPu9xtx0MIOeQoMS+Pq71u14KIpeNnP1oeKGK4Y8j?=
 =?us-ascii?Q?bO57RHs0RRkufjAO9avC7ur5WnbbhaB6LQOSNpFFb83L9o7bPdz14sAO60NS?=
 =?us-ascii?Q?xo01dk5RYMYR5+GuYnRFayIFzre8pcsM/m7o3nVGiGIKkKZaHkdrTQs7z3RB?=
 =?us-ascii?Q?anmjGGdL8UoixzsMLK10WMOwa59ua2T4xaUHMsA0FIxwPB6OEOabRGUxf/+L?=
 =?us-ascii?Q?gDlFhszkrh74lWjv4NkVODM+UY7sts843hj0bFZ9saqMAP0Jhxvg0QabpVaS?=
 =?us-ascii?Q?PUdmInAcnpfdE+2d6Vu4xplJSOGYI4o7LkLOSzLhHujhmbFnc2qCwuFlyrpI?=
 =?us-ascii?Q?Ya0aMxFqONZNrthbXFUtIHbR9nPUGFbydtMncS8CAY2h+LUs92YQNNOvIjFO?=
 =?us-ascii?Q?Aq4sTArXAOP4CY/tXg1YkzdHKy00iBjA2LQ1FJR36eoQ4zisXi0R8/45ycp2?=
 =?us-ascii?Q?PWxR6SMVLNBZwrBhUM1S/dRgATAAA1m6tvPZjZWSgfxCEC249RKbWBo2yipc?=
 =?us-ascii?Q?+qyBXbx/BM5ZMcojfZ8oOHbmILyWmiXTItLid27O1Z9bSVSNghjZ478ueJ30?=
 =?us-ascii?Q?+gwWx2NwcFiDaKkRoy1oj35Z6i6SRnk5WB2uRrHNzMCfMXBwmNY8R4g94Bg+?=
 =?us-ascii?Q?2rdFlOSHNoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?joFYyid+Hob1BoFlyYKiTztte2bxX5U2d7FKqbNEQKo9Oyr/WcOolAYWJ3D7?=
 =?us-ascii?Q?43rT/yUJBSNafvWlPjxSn/1VRSN3fmr9YbPrwoAjCxA4mZmfLsYJ6IORGvKP?=
 =?us-ascii?Q?jAyw/u88zdLss7iuCFXGtQoYrDLEn+4wyzEkpkcvZZyoyyPxf9EcgOGuI6BS?=
 =?us-ascii?Q?/5FcVzn7hBW5jksr/tBHiO/RYJlLEAzinHvSy5zD8kWK7Uu21+//AvBvpkU4?=
 =?us-ascii?Q?kYhsJVibHq31s/2gnCmlI23iFIPjLC5DVFoP9lcbr2/KtSEIaP2J7e5lLXYu?=
 =?us-ascii?Q?5icd6bNvq5NrujLO9+4WGhVG3fwYw0A3xumNw4Tzt2dPi6W8uz6mADCj4Qlf?=
 =?us-ascii?Q?wIuoPxFhLrZjef4qGxpme39oriRtcNiWG87O5OnbFGjdyEGLLQtB1B+TVp6e?=
 =?us-ascii?Q?VewvXs3tt8h3thD3rQZEGQD918H7a1lzlUrPYx6G0ghVRxDFuLU8wccB0+uU?=
 =?us-ascii?Q?ECw9aS8aO7R8XaQAbb7p3XPWQSf9CWQVek/rWNwtqfSaxAhA01hIw1pBFRoz?=
 =?us-ascii?Q?M4lB8SNcq74yn2jz+FANyqaq9TGu6WRK7DvFu5DKPG8FUTVC3cXQza3a3NZi?=
 =?us-ascii?Q?uZXMWiNKicszySSOhB4uaDs/hapUr0Ge2EGzTwyIMYRE3+/83FY4yQtB5gVS?=
 =?us-ascii?Q?KFmu67zcB0QsnSsgE8G4/XJJ35n6yGcZXZkCm2ZeXypI1xq3NaJlkhGyojsO?=
 =?us-ascii?Q?uggI43i6diR8hu7/9MuGWT+W78Hkz9bhNzWSul3GpxI0Z8DjchjElcGKl0bs?=
 =?us-ascii?Q?41FEXDKAUPp6zpFK6USoLxe7l8gc0C9H0xomsg0CIsQtvsEatyM2Gj4rc7h8?=
 =?us-ascii?Q?BvHZ6FGiywemryy865IgsU2R3XbIXy61RwXyyfZzwJyLcXjY7LrLQUYpNegW?=
 =?us-ascii?Q?kZb5S4dex3NLrFqKpwDAzRTW3BuLDhEOR+Eu6rIpagtzexnSVuEauMWWpWD2?=
 =?us-ascii?Q?mAAJ5q05misLQfNC5miE6bGLzzrzcTFJWBkxLf6pb4bUlov47h0oGMjTscqc?=
 =?us-ascii?Q?xwDF8sDTJdgYs/sVJaVCuuJoI3ydodZtID+FtY0O0PchHi7j/9SXPNi7fZcU?=
 =?us-ascii?Q?l9OulYVnRWxiNBHu4Dv2yCDYiLzk2HlZQNdlynISQJxeIZlfFdE2akPxuMrX?=
 =?us-ascii?Q?UF/cLId5H8WJzJo6f2VaobmCoc/HxleIC01gSoutRNm/WCTg1yBAKF7GO4WH?=
 =?us-ascii?Q?tqOpHOPVOG0EyvFgVUC8E1DaejSfJeJgN2Uo/IL63bUy47wawMU6WxedPyWK?=
 =?us-ascii?Q?li0LV1jpQXeqECh/JxcusfNied5cd0dYf9Z/ZxERHpGugDbK4jFOGcPtyyo0?=
 =?us-ascii?Q?Vj4WPksm28D8UeEWb4/Y3yF0jY9kp3/nswQwFP6kAyCcFgXxY15KFErtW415?=
 =?us-ascii?Q?t+VbSUXS6Ov7lKXjqvXrBa+fteDRtN0pR/6j9B9eS4BoR93Jt2ErBplbcCQ6?=
 =?us-ascii?Q?M85Nr9Rep39cWyCOrZdxytGgHADboeJrKKBcwAavPInWdvn5bxYXnKIPEooq?=
 =?us-ascii?Q?HphuKMHfyY7xi+1eZ1L01lvTCPykrl3ATFyxISyc0C+U4cv8BGzMCkVp2s33?=
 =?us-ascii?Q?79fNpyz1EFNE7zG/roPoRstYAlg/H9i5UT84gu3Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a7d636-c1a6-406b-ea8f-08dd5bcca4eb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:05.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUywO+KVQ4akgSJoiPXg5p9O3e/+Eb0RmBTZZTUDJ5UxYEEcCEVnveytA7Z/qE2iNuAu9IAKhkGgcq8uN/Fwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

Add resets property to dsp node in order to be able to control the dsp
run/stall bit from audio block control.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..90ecee81e465 100644
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
@@ -2421,6 +2422,8 @@ dsp: dsp@3b6e8000 {
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

