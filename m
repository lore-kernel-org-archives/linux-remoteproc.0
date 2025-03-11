Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB1234970;
	Tue, 11 Mar 2025 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683422; cv=fail; b=dgup9TNoeUDDX8tUDqvtT9/G193Iqt74zhZVpjaCA+/i5yg3BEjgsONsVTvOw70Z/kTQSZ/iorvUapQthQorKi8U96PBHy9cyuZekEke2J+4RR36dUGuTh7ioZ42LceJ3vVx5DSkjHXmel2DUilfeA7eHhoRAflvg2vd+O1ZkoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683422; c=relaxed/simple;
	bh=mjgP17nbONlgm66VpUh/kR/QFlbS7uA5Y3XJaekHcB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ea8bDL8Fz2hsmQNbjw+ESvV6ABOO9vVfaEtFzKlUwQbYy9cKkA8EjVpgyjn3pf3yHACaDD/KoTkeroyJnkuoVuZaKyWNl3kGe5H6w78dMDImX3HxbDv2lIOlqRPor606eW+1X4r0FR3WMWv+LPeq/7lD0Zi68FF+UYYL3+ixQpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J3YMgaTg; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J3YMgaTg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+bfGcui38nptYSAUHonCGsgM3NvFB/uqGjkV42Gn+2AwbAcA5ZwHwh5qYKjmlVYPGN78BLmrCSpVaXjdpKMe2TDtpkPcj7SfgSFzkLwUelMMlJM8s9hygF7WyFbwwLAwn3AHIzeBSurZtLq2laUrZRr8YqzHwSuhVPi5fdAHubwa7cXIkmNky2Imt/ru2BlA0zAdEi4dw8e9h2S/yud5a0jvYIhjRdlBl2DV3/DAXi5UKJw49cgjFAxS6T7BmMTsAEM4KIBxBy3TeoIONRh5Lr6ZDG7BqgVqQvSGyyO2V69u5GgSnALyeWrRwqWn5xT4iNCAsaywEXw5UqvYP000g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+M+3gmhxXg/+Lofdry28mP2pMGnnjQuENiEPrGLf8s=;
 b=dG+mRAr1858TNKegQNmecXcxsIMOBGZHf+IwX0xEULl1IXZcIzJNyeLJf/bQhxKz30chJ2GV/3ZWY8jZKo1L4EgXvQxLDWEMFRxkGdHG3rJYStjvCzr/+JA2gweNkgfu7SIOXrfNbvKSCO2on0Ypx3amhxYw7GH73kgYIV49DA3+oBrjiLWxEchivhGkfOe/ztieLOTHEnD0erxfQ8lS2jf7IO5ePfJZyyf9Js6qgPPiYI7PYVOzKIcblTuhMqKafqCyPWe5R4p3qcsOj/u2ancmINiASwq64ExfpVdO9loAzAclEj/hiWQkjwn6k7MkcKvu8I7PtSsqE9lTlDYnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+M+3gmhxXg/+Lofdry28mP2pMGnnjQuENiEPrGLf8s=;
 b=J3YMgaTgxf513R/5Acx3pCT3hPMEhgCv8p90uT9gHB8Bhd1kneAXvTe1LFKbvArltcLJXQLLX7KAAtb1eyJLvLewFrqFoqkilCBTaFT0JRMLqaoZ8vOq2cixAtTne/D2x9tbFFopmpuUJEcuH+c7+FpdniqbEp9wd8uk7bLFtPygUiX6FZfnhiEoHQVBiYscdmSqpF8zhxim5anl2CBATr9tHz5UTjDQBNz7zxHM83IghF12HCtPIBOzHMXnz91X0dkV/+xTaam/PUVhRlSKgNb6lkXoIslDiDdcs1z2oDGAl9J+YkjXZFEntU/tc4F8zWVr0W9XCpd3hQT5JLxqmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:56:56 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:56:56 +0000
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
Subject: [PATCH v5 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Date: Tue, 11 Mar 2025 10:58:05 +0200
Message-ID: <20250311085812.1296243-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 33218b18-c2be-4299-5650-08dd607aaca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OobwBeNmUrzvCWHpZBVCVFmQ1ghWRHcVgDIigH9wGfCiKXjOTdSuZXezoCp0?=
 =?us-ascii?Q?tbXVK1pczrbIJmCzyiEOrSzwdGRmnR+nvVS25+AJwcm7uKAgYSRmbZFo5D/K?=
 =?us-ascii?Q?zLTTk+1XKJdhen9mgmLDYs8Ug0LLkLjHj4BcaCOFUXId/tdnbN8aZr3mgjg3?=
 =?us-ascii?Q?csmiP7lmvAYu7OAIGvf04sJV25yOXh3kZHDibgVrUbuHHDQ2GgvLJyRm1zoQ?=
 =?us-ascii?Q?pcKflhzqO5d6SVwaMCxSLOSvcRIyinO45mClZHoQlC1Gl2Awxv/z1UbLOPSa?=
 =?us-ascii?Q?jWe5DEO9MlpC2xSo/kKPxgRlqwLeJUfpQr1fM2NH2WO9dhHRUkTI9pf9ZC+c?=
 =?us-ascii?Q?HoRpsi+3rakpouOmReC2M0EEY35kkk6YOXnLu5fBWnNW/olWKJDZnLFMYYA4?=
 =?us-ascii?Q?uPHm+LDp/1eQ4ZKM5kF/sBKOudTfDWSqeC1AXf283LFiPj9Fp2ydBNjoGVpH?=
 =?us-ascii?Q?KidFINgwC/57BgAxu+vnvwHp8Ca6HyY2S/v9wz+OlmvYm269pxQ0Fn70R7bz?=
 =?us-ascii?Q?UqM4hXsSrRUCp/dNUP7eWo4Cti51iu2ez6+Dx+3K2s6F32La08GdJtEM2r7f?=
 =?us-ascii?Q?ToIoYpHLGkOLm0fRRSEMg6rACHcBJW96Nerox22ZkRySCtJQfSvCdClCE5FG?=
 =?us-ascii?Q?GtxRbJVieIVbtsMy1Ld20T1DTyj+iaUiPd1G3koqxxoCwGZRrba/kghWuboR?=
 =?us-ascii?Q?ilU5MM39ndBcDHwzoMXqw2eC+LH8o0rRVJroEKBYoZ7kr23tb1M9Ey1GHNVA?=
 =?us-ascii?Q?LkyG7iE0gbBaQQFY1q1LdCnHxHnNlZR5P+9W6GApdgdiYYG9/eqebixZDV7b?=
 =?us-ascii?Q?MGx9+B9rTeb46jFZ06k3jQXBRTlq/Dq2YMavNV6Qj6IiNR1BwVW3aA6kyQaa?=
 =?us-ascii?Q?5iTizyxdN166IVmEhgKv1jrRKo9zPLXiCQwfvPurMKm/353Bg/diG2yUBbE4?=
 =?us-ascii?Q?aQ363FKf+FOPdxS6a/rO7htcB4UY9tTwtrbv7+6jyH5MnS37qnfv2uEzi/Cf?=
 =?us-ascii?Q?2LdoKWJ1KE2Ig9FS00vsedKByY0U7Rezg4sgfAl6mgnzFT12taqr4jxbpqj4?=
 =?us-ascii?Q?g1upMmc2eCw1kwd4fzOVfm7rvYJZFW7ZQHKyOUdMuqyM7clm0JukLmc4tLMN?=
 =?us-ascii?Q?JeirXFPw5scLwIjss7WiWk5yZ6RlKNgDWaNDDTawwlRPB/hCcCi3Wxo9NPcH?=
 =?us-ascii?Q?0dwO0LwyIGO+SGERydihCvpMho6nvOoiaNqF0n263ib0c+VakPJLN0qEaNlT?=
 =?us-ascii?Q?FbJKHI561iiiuBzkOOkYZ7KZxYkK6UFP9Q4qxVo7hFactwMkxKhq6BiAlHfD?=
 =?us-ascii?Q?Zt2glDjE8GEB74rng57EPjRCtKXGYpmHnoZj6owXnlHruEYLYf29SMn5eA8g?=
 =?us-ascii?Q?W2J/rqLNzK4O9fKRwpKdQrCb8ETyB6d6AX/u0HAjiHSYIB/lyJnbZjkIUtpb?=
 =?us-ascii?Q?+nG15D24YtK348qroIJ/rkqDGGfnF+g+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Usr+um/2IRj9FV1SUZWCFus0OMYzwBFoWJenaNrS6ZEOk7+TL7xVa9k9JxQl?=
 =?us-ascii?Q?HK5+832d9h/VDMDfb7LDOBzpXQQ22QkOjHs8c0+QI24CB24vl+/h9s/VHmok?=
 =?us-ascii?Q?/aOT4SGtYavOdJY8roQwh00Lje1Goo095TD2AxBAzGzeIrBHsZEmFe1mssI6?=
 =?us-ascii?Q?+4lLAtBeab4B3kM7Zg1LZ2l4Nmnzz8T5wUmOokXOGd+7mP3Yn5tjo/kkC4Un?=
 =?us-ascii?Q?YmAsFT9088kGhW7wWcTcfQB3WpXhf+CcehIKHquKYmBCVQCatFNQSc62QYRp?=
 =?us-ascii?Q?mwDLuLUcL6uCcUNQXwGOKyENwOJ791n16mIC1DBfzwR3iJxwJaMHXWGKi6vi?=
 =?us-ascii?Q?P8OYgmFVGz07av3Si6FNFMUYCYvDU1EVcazPP7AE3AFHRKQF1LHlMBSjLYzC?=
 =?us-ascii?Q?RwiOouPHBi9TCiWw5ERqR5X/y4NCG5oaoDx6OnBDIseHk4iV55JxCXPyBn2v?=
 =?us-ascii?Q?5uBXI/FgkwOko6rFhm9cmdXQNn6kYc9ZAcARLH/IZ+VEpYZp73zOOAkze5DR?=
 =?us-ascii?Q?+jaqSJMA1CLqFjt+CsF6PYic4zq+yWvd1UWtlfTqOU3X52UlpyDQRgOAa3Xj?=
 =?us-ascii?Q?aMAFvVxBnrVC4qWz6XpAgXwVInvzUp7U2enCMdR6Q1MCb0m5yKrGkmoTKcvQ?=
 =?us-ascii?Q?esYWsZo5AT4+00t1TUBwjNkW4HClWn5Lk4kYogjuAQ59J6EDFzEUPJmFZj6b?=
 =?us-ascii?Q?sfLBjeWO5gsJ/iJbf3ScI9dKb4wcEsngY6NcTZvGJoGR2zhUiirD65Pv/uZC?=
 =?us-ascii?Q?Cz7i2ybxVfbEIUzIvws5++iyQ3RVccxQkIaUlRGBHtTixb61REoay+YCQCJe?=
 =?us-ascii?Q?7DqyUqPvVY7k++A6+C21O01K89pM6qQBTiZ/4SBo7x4iowwtEka+k8GxCjoP?=
 =?us-ascii?Q?nrhhHDAWH1Z3obOK2GelULm1uvYdZnSCTo1w3yHRRyhhmSbWAez64kKrkkBu?=
 =?us-ascii?Q?3D+Zn1Zql9UCarNDplFbPWPA343ZN/Lu9MSSOyPm/eHU7g8lR1DiUAR6+Rqq?=
 =?us-ascii?Q?e+ophD1dc0uhvMddqzg8mxFd7691Rq1aW+7+XCgKDP3Tuja5uovkXQ3YTcBQ?=
 =?us-ascii?Q?OJnJ4/NAcbs7LrPv+BJlUszj8k1rrwt7z/bRv0gi4O1zY5oBb9eHDdbMD2gb?=
 =?us-ascii?Q?n/eB+SMG8fYb/ewiY+6Vd1sI3Uhx2hUE37ptuiarwDOBqe50SW5KYH3bZsl6?=
 =?us-ascii?Q?UhwpIkHmqF3Ag5H8kFUYZnOP04z9/0FcpkyYJLFKn/Mh4/m/vWp7yDJhqLo6?=
 =?us-ascii?Q?KnEevOMvms7nGQ2K5QODzEJAmGguaamqdWiIUgq3pxakiFg88p/VBQ4Tcxgb?=
 =?us-ascii?Q?bdvC+PbWGIrWpVyewwmJJVEzeLThHpc6/nlFmC9f9aBISsXxtXHlawYQm5R5?=
 =?us-ascii?Q?1ppo1vrtqj8VHORul4sJdugqrSGUvcJ6tnQKVMyiy5JwcJmC2AvzFFfOwZyo?=
 =?us-ascii?Q?Y/qfdlI2JFd+NFSV3E4blsAKrTIi3RSMt30zY4ZzJPohsVU5OPYorYwFj8zq?=
 =?us-ascii?Q?mX3AgjTq9tMuSPAnvk7GAJxV0VDwKc59kC90LDSWVd1bvntQX6grbOLldNFD?=
 =?us-ascii?Q?AzGK2vQz0IaM7xEe6O/m4DM6u0JqUpvVCs1Xme5m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33218b18-c2be-4299-5650-08dd607aaca0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:56:55.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqqIOjZOBZLA2ghIjy0iRAJePgen1EK8DPAJXjcpNnE3Q9VDwgFFHA12pIKLceaKv9gp/5nwZeG0BcGG/HINhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

Assert and deassert functionality of the DSP found on i.MX8MP is
realized by combining control bits from two modules: Audio Block
Control and Debug Access Port.

Audio block control bits are used to Run/Stall the DSP core
while the DAP bits are used for software reset the core.

The original plan was to use fsl,dsp-ctrl property and to refer the
audiomix bits via syscon interface. This proposal received NACK from
community we shouldn't abuse the syscon interface [1].

So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
interface instead.

Example dts node only uses runstall control now, but softreset will
be added in the future when we will convert the softreset functionality
to use reset controller API.

[1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..b8693e4b4b0d 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,15 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  resets:
+    minItems: 1
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: runstall
+      - const: softreset
+
 required:
   - compatible
   - reg
@@ -164,6 +173,17 @@ allOf:
             - const: txdb1
             - const: rxdb0
             - const: rxdb1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mp-dsp
+              - fsl,imx8mp-hifi4
+    then:
+      required:
+        - resets
+        - reset-names
 
 additionalProperties: false
 
@@ -186,6 +206,7 @@ examples:
     };
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
     dsp_reserved: dsp@92400000 {
       reg = <0x92400000 0x1000000>;
       no-map;
@@ -220,5 +241,6 @@ examples:
                <&mu2 3 0>;
       memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
                       <&dsp_vdev0vring1>, <&dsp_reserved>;
-      fsl,dsp-ctrl = <&audio_blk_ctrl>;
+      resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
+      reset-names = "runstall";
     };
-- 
2.43.0

