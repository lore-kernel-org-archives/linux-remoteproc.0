Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BCD2417F2;
	Mon, 17 Mar 2025 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218321; cv=fail; b=k5Th/Brp4xddzR86/EIbPL8Su6o+p1gYxNXqVSitgDdscfzH2jldgd9Yy04Uv8uxNk1gPwnsC2Fdb76XVW/5+mzDWnRv34qLR6gqoShcNgttgvLQHfyLI/rU0hqgZa+rYcLtCTjTljIvDF8VfrPmhy5LzTDkf5wnUjf5v6AYH28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218321; c=relaxed/simple;
	bh=H2pCm30rpwGhF19ajelqMlYlU2j/gIYyx4VPZYSjjcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lWMYK5azeWW2F8te6H506T9fTgS6PM6UpaOZozlJNmbBYsbY2QGjjP4vfVxd1w4u+CRdOGnFd9ifcLNFbMLk0i53rgRCfIr0O5BTScCd93jO+IKG/z2uMN8/RceyF94s8eeBxkXw4nJ+o/5vHfvM/KWfy6le7IluRVnP3YwqpCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EB2lAgwP; arc=fail smtp.client-ip=40.107.247.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EB2lAgwP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmt/H9IpRcrkw19EAt8Qs8oLRtOfMzkNXEUZOBsPWBlVxIwwBDEKxVFyilQiAIKe2/8MB0+h4zjDW/Jo043WHieRAtvIdXFjW72QeVJ3Nh09vwLRR8SFIl4g2zqivohFhzi0UxYsEiI+43jv8klu0bKrlcHnuLn91cWyijvW/KRz18MkfohrCRjoorPtx0lEJfhDv0Kxb0lmau4LuVyEpmWFaCsucVInaSlLAYMdhvGEvZe1Wffl4GfR4STOnuQaV9vCmGLWpXNcdib/gxE/dQTJ2n969kBZMst/Kxjbz87ip1+RGmCLoDVBa44XvtHU4LdtPoc/OwA5AZLZ2kBtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lmc78HbkisR1OHs3VfOhUZ3IGy+sHQAJzUOLy5So3O8=;
 b=DIO9S08zMOvUy/4lnl/q4qIhwgaV5cO9d84abVhCvTzjOOBoBiHxcn+O7x2icGQoBrKD1MwAV1wGZ3wVEdIF7Ufc+iWXzWBqVFuQT9oXlDvPAl//huspujSMSGiT0DgBB9sqrNaFbFGZdNi86rA7gZ6xrik3OL6Za5rRIfYxYw8qaA1Pg3RIxOicBXPCzqdavbEtIiJmzXWQUWXaBpf/zSova8YgQyj2PLOAocXmexm5+fvi1+5fo1vmBQsGkHXNgW3l4rNWRjAKZYevIp9/MvxQN46OduXnDzfcbp2lXvDzlktCBiAnta+iIy1X27uEyp+fEUhnxUup9fr4KeUNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lmc78HbkisR1OHs3VfOhUZ3IGy+sHQAJzUOLy5So3O8=;
 b=EB2lAgwP8RdUs5adY9r426skFyKZL6bIVlWbXCFZwenDLyHiEQP2DDSTeU1CIxfYA3Fby4EuXx5yArqs1t5dFB8o25J+gVw2DrdOXFoBu2aIws7GYy9zvnyay8ucVgVTNIRZ9IohpbLlnnWdv6sngd15YV5KIF4ZjcDWXBcAtNP9Cdq9OefUyZLwATNZecDAvJOkm6oAyEa7BzE30p0e6lDU5Ykfie9LF1NctIR38DCUYnMmNBHEfmP34tPSTvTXfOdswx+1I4FI4MoZ6mlgp4lrPopH1icZrEgVJDhBBBaxlaTgWQq+7xSL4Nm6YgxfNXqG09oz3lYCNqQptu9BpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:31:56 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:31:56 +0000
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
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v5 3/5] arm64: dts: imx8mp: Configure dsp node for rproc usage
Date: Mon, 17 Mar 2025 15:33:04 +0200
Message-ID: <20250317133306.2003909-4-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 120397ef-db45-4634-b82a-08dd65581658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IceuOB9T7c7gw/L2F7OhvTPm+fTJwtCYAOZsoVzt+WkuI9NYYGrdFMSvfiJc?=
 =?us-ascii?Q?EamZ/Wl80WTQHWOrIPZEYfHZVEkc94i0PUq+eLbbzVzc3EJWxvARaOHE1QyK?=
 =?us-ascii?Q?TKcCvvjHkTPdBKqvHYre1YLTMXTDL/prgxX2KkZtTOD03bX8JYlAkwSeIn8G?=
 =?us-ascii?Q?2QsDMTVmJRFqWQIQB047GGBB7EbbPvvheb+zFcQIqrhiXEMT+Ic/Mk2LYrrM?=
 =?us-ascii?Q?2BKjoD24CLLpZ0aroXVtKNIBsCRyQ10kXS9meyqcuJsSG7p+SdVAFuuJpgrX?=
 =?us-ascii?Q?WQO5TEF95CxxJogCvNi0m7MXGrP5EEA625uKLKDWjId2Sdvx5wXKI9gZ6LOz?=
 =?us-ascii?Q?1tN8vjvoCHrHamSnJImfs9I2EIZpy9pdKO80nOepiDf9bZ07nfUjzzMwgEtp?=
 =?us-ascii?Q?idjlL6Vq9vLnYuj20JFFEinZbjMHhrj9zH9t9TnwmyUd90tg7A3jeO1tvSXo?=
 =?us-ascii?Q?Ju/l1mMEGSuwC++T8luBslyf/8xrvJDijLAvnaPaXF5MyVK4YKIgQ2I1TL0I?=
 =?us-ascii?Q?rHbJmGJSnG5uFml2LXM9KZFYdZ9kraol37dM4HxA+U5O7okUIhhZ/ghO/IYU?=
 =?us-ascii?Q?rn4r1cPjd/QmrQIRg7Y1n0+HyueWF0IezaPrOTwy+J3qiH+RkDmyAH6O7G4Q?=
 =?us-ascii?Q?lRQLdGND9nj/4c3iK6b7fHfe/OX3Fma5EMrQG1eX3tRkhyBNlXqAqOIjuYPl?=
 =?us-ascii?Q?qO0Fki7BDJBRO9c3MhibCCwMTRS2JrsHlO7RFUysOUealkZfXYLeZheN/BOk?=
 =?us-ascii?Q?i9vqEMh7gRbfz1BaitOHYDc2Huqofzt/RAyoMNS992dsnDuSCP28cpuyWwXu?=
 =?us-ascii?Q?AigcCN++SqVFllBFkiYGpmw+yXhmMgHo9P8RJzwlFBsJOK4OCunZR8FuvonQ?=
 =?us-ascii?Q?EUGWKqYUtg4EDdcc3UjqslOKcvipHpIOHJIWbM6rZc5Sm14pRz+92kSP75Q+?=
 =?us-ascii?Q?nqVvpu3lXYgAk7bAqhReyci7I3QFf0AihbL1zFB9OxcCjeDgJHZQ/aEvzLF6?=
 =?us-ascii?Q?bbBNB3MH75FZkbOUQ7V2jzD08xaSq8Lh7bGVn1H2qLnr2LDn/gdtIqJ3l3uF?=
 =?us-ascii?Q?np8vfZxrU4H1v4eYG1kQla4KzMWKgMDk48Soz3YWFGQ0bf5LTfh4tzqdQtDF?=
 =?us-ascii?Q?9kgpKd3lXJ26izLuDmn9zveso9uME47tFTSnuls1B5NIQluMc+0DvSSYf+o7?=
 =?us-ascii?Q?QJg6PxvUoSBjrpM7eYw96qfDcEox36nc6hFcCtSGwhAXHxoyVaGL6VX/aRmJ?=
 =?us-ascii?Q?7qmiHVeR+wdspkGxk162VOkV+V0T6fXX0DBFNqs3h9AQ6iMUAF5DQiC3mRI9?=
 =?us-ascii?Q?CdzA9QKCgT9b1QHoDe2GSzTGWXkOZCkNOIItrGQetisLFSdgkNpTJ1qA7mZy?=
 =?us-ascii?Q?BWsuf+CLh4rMjAQKbFW06j8CGsDyZokl+nqyOo6ReqeFqdYqJlu/0bydLcdZ?=
 =?us-ascii?Q?PRPRws4/HJUoAOdiQg9Cf8nifRjpJNWR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8ZTgtZ5coNEyH5O3rjV0OgLpjIfwLfc0TOJHPHT0OxOaPoLktp0Xfy7I3Cr?=
 =?us-ascii?Q?ekBXS2B8/c32m4RvdydYOvAIrf9xvRxVESpYzTUW9XWZ9J5aeBtiEUjgchRQ?=
 =?us-ascii?Q?He5SlieGnnrjCTkbnOGOSbeb7kxdcztLqCO+9KSOVN0Y8SjSemlXTXU62LUx?=
 =?us-ascii?Q?+JB2/7M7W0M9ZDX5LZPVaT1TqO23XLTd6fceGK0ne3IFIbsloL1e5PQK+0xR?=
 =?us-ascii?Q?wrprjWpGypEVln5Tv5u6G7eUNHDf7jOlcgMmQTSD6NoCosd9fe70r7RuuC4e?=
 =?us-ascii?Q?tMFEttxTps2l+sKv63CP7/2dShR0fyeFLGLJg0rdI6F75TJXUK+AGXABM2OL?=
 =?us-ascii?Q?1sLg/psDoK5Hrzv9TAkqPxd5VRR7i6kGq7nsbR/UmUaFa3cEC7cexR62Jo+f?=
 =?us-ascii?Q?gaXtRmoqpfwUvwF6zbfhZAPD+yVooA81qxb8pWZmTJC0qMP4mfKG/TadcKMY?=
 =?us-ascii?Q?sChUkCyQNAtPyOZk1suGmrTwoufg2t/FhBj0hbSLHq0wYbfSxE+59tYrhqPS?=
 =?us-ascii?Q?aSe8vZGyJ/FPZMjYRn38mmhL/SOTRxx1fdpYENYdxZ0/+j6s2/rnlI8fx+CX?=
 =?us-ascii?Q?Be/ZXA0PNJN21Wq6NEXFzqqXqZWHe1Ut+x2xY2kGNInDgkL9j3gPWQoEV+Xp?=
 =?us-ascii?Q?OSQz19lD+zbHCJpqNSpHNgxQQDMq2ecGoedzR6GUJojkXOIZkskoTJc6xbC7?=
 =?us-ascii?Q?9s50HcCheSufNRVdCou3K3wrBr9R6/ZBQ25pcZnejf65JSEeV997ez0JIBjk?=
 =?us-ascii?Q?iodeRHzaFd0b7L6v1c3+mKwlbH+w606NS8FwRx86XOM65bDjnHek1DhCmj5t?=
 =?us-ascii?Q?3ThYQcvvqS2zewlIy2KTJA25xSehjqsnve7OT9EQjROHX6Xb2HTGWKgsLGEd?=
 =?us-ascii?Q?skmdMGkpycSPjEvdRXCbwVmYsHt4zSkvIYsw30Ay9r0YOvKET45vbdNvir/g?=
 =?us-ascii?Q?WdXDaxdMh+MH2fECvrd8li3h9v74Nvq/xXU8vK95mX4e52+mFmafeuGJ2W9Q?=
 =?us-ascii?Q?N+DNctHrDdx63qX224bOEvtX9v6nCOsyAeRfKYPE77zkQPRtL1Oibg/oqn9P?=
 =?us-ascii?Q?5NIlUEH2vDpTapR6riVjhvj08ntVyNDBiK5znBlgoU/6rmSXlp+KaiCnLuxh?=
 =?us-ascii?Q?JTR4+hyBb3p7Rq//M5lxOxvYf4oCsviTuKLzhkJOud/oZAXxJoU2qKZo5xTT?=
 =?us-ascii?Q?VJTqYG/mO5N26hntSgJxRB8o0u4XFi69izubtnWCllk809M6J/Qtpc+m+WKx?=
 =?us-ascii?Q?ITlbid8ThjoAflh41E1baCScX0tF1TeWBFmHfnWPLrtp4Y5rhBngz1pzRKfs?=
 =?us-ascii?Q?QNZ+JnlkxPRU8tKwhJX3kjPn2YGleRv+263kdLU6W6yPwO+Lb0GjKs1sHygb?=
 =?us-ascii?Q?5zr72Np3+ZK511bGFxNDrAAyuuc5lVEztiToBK97lLDNm7zVn4nzWEGH7XXe?=
 =?us-ascii?Q?5dQDgOtgfXYqlwYxl7VUhpeEM7o9V5Q7/SJ0xELlxJEY5NSJNbvKZZv+nLre?=
 =?us-ascii?Q?I/bh9UTtELOpuw3Fq4u1T1nXdNmZglJSSe/NAuk6i5QcVpI+43FoK/83SJtc?=
 =?us-ascii?Q?0vCxXTDH6l/zuEE9tg03LZJ+2gOo7fA+6ctJyWtB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120397ef-db45-4634-b82a-08dd65581658
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:31:56.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p97Uo/vhDZsPQBQhc1/ZOFUzmsZxXCB0vk2QDUHBnqkxhj5TO4XZavpbJhS3/cPeVPSHpIQG6QUHpYf0eNIFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513

DSP can be used with various frameworks (e.g audio firmware, rproc).
Currently 'dsp' configuration is intended for audio firmware but it
doesn't work well with board level DTs (e.g imx8mp-evk) because
board level DT enables audio related IPs (e.g SAI) while audio firmware
needs this IPs disabled (because firmware will configure them).

So, configure 'dsp' node to be used with rproc. This way users will be
able to use board DT to use the DSP as long as they don't clash with
Audio IP configurations.

More comples usage of 'dsp' node (e.g by audio firmware) will need to
create a separate dts file (or an overlay).

This change follows the approach taken for other i.MX8 boards
in commit 391a319c81f6d7 ("arm64: dts: imx8-ss-audio: configure dsp node
for rproc usage")

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5b443fbeded8..cbe8dfa3b3bc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -281,7 +281,7 @@ reserved-memory {
 		ranges;
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
@@ -2416,12 +2416,12 @@ usb_dwc3_1: usb@38200000 {
 		};
 
 		dsp: dsp@3b6e8000 {
-			compatible = "fsl,imx8mp-dsp";
+			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
-			mbox-names = "txdb0", "txdb1",
-				"rxdb0", "rxdb1";
-			mboxes = <&mu2 2 0>, <&mu2 2 1>,
-				<&mu2 3 0>, <&mu2 3 1>;
+			power-domains = <&pgc_audio>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
 			memory-region = <&dsp_reserved>;
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
-- 
2.43.0

