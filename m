Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB72868AC;
	Thu,  9 Oct 2025 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048873; cv=fail; b=DLQBbVVHrjKRR9BstkAL85YNaPvZLHx+6Jja3o/CnhlvUVuykqeUl5qSxud1McSaIEcuJCkNcSI5ism+/Bu3lr+Bv+AQbBU/bDBwX/7w+ExDs2kHWKKro3viED9q8Vopz3ULOe2vpa/4gQEA9gNCrC1wkCK651X54sf2RYeLfoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048873; c=relaxed/simple;
	bh=vGLhSV9HOD4MlWjPO5ELI7rFfhHl/ceGxaektFvV2mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIl25kAoJZ24YldD3T1sTYQwzSM3BO2ZX0BmUvmLbjRBBgTRGbUV30Podk90QwTa3Vd84x4IhyZCbnH2xuM4Dd++J82gf0l2q4fx7FBh8s4rbSlbtUZcN6vVII52ZUSlNjTGmdJPgYjLCGLmsfh765T6uDF6KSyszbpG8WjS/8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BTdInd/Y; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BTdInd/Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpkTTtmDF2Wz0wueBcngOcRYtNefdTrCyWPTuvW8NRXrP7jiolpQRoGbdHDZ2pTwdmwppDOZbSxIY6giWvSRiutEajoC35ZOWqqM7A8O4/QHTdOc4MMaAUhLgfHpIT7gZlH74T0Gz4nN/AKF7SKXFzLQqAFh7Ih1sCpOpJ/Q/8OLPpSPHG3zKFgF6vK91pfincS8kwLN3ow0oH8+w9pz1YiqWaiYJlfNeFO6EJvsAolPNkkJyc8gWzpn+p+I/BedlfKWApchaJPxmVDjG+ZKUmtMaSS95CUJoiHqKDvr85F0/WW6nADS9R0is/Ysz+r0cGsDodk8JSmb8wPERjX5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=fZDwpp4HfIos348aIgYbYZaLil2LUEjDIqMgkbH69GGAUp3e6F5aYpX2Xr8QyFpW8BGjHmxHMAiFTGKSxzEAfD2YtW5BoGYNuDiOC1zxlN/IfHJoAP7Il6wnHsXPtP1BJanTB4G71rEoH4VsZVmrKyaFNOHvWzd3b3rIAe8qLoEjN3Npb4PLduuk3Wqn2xcdQ7UhGrAjqEPvloDXIVwDxrQzKnz0eBh3uiRT5u60mkgQlLEZWgaM+I7Hir1keYL1zaRu+fygQTGTrIU6QA6fe4hJnRPMPDWRodl5+QGCj68VlnjLSbCLo4pCVb/rln0hs7JjIlFMDWAEJvVrjRD6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=BTdInd/Y11P3Otih39H15yWrDbh/RVr2qRo825yMjtUh7+PznmbTPBEGAqXB3x7hmdnNbQxTuwHvuNh/27DB6UMtdeJYAnRSSCY0yUgdmn7rK242Y29eydlwYkrWZXkHyep5MaqtOMTTST/SLttxq+D9ynZCxoOWekyNjRS01zlrM9dbakI0ABH3Gx9VNGrbF7sxVPoKYXKn2sGlDrCGpvubKIMm7dpPhqp31/U7jFg4fTut8lnoZJ2seOrYJPjM3PQCfbxqV4IyZt5nJDXIDHlrXgBg9U3fIxBWPxne2CafB9uPBYcNxbOxdRhbNTgRolltSqSPzHzOYqIjIDHPnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:27:48 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:27:48 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Thu,  9 Oct 2025 17:27:16 -0500
Message-ID: <20251009222716.394806-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009222716.394806-1-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:510:f::34) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10852:EE_
X-MS-Office365-Filtering-Correlation-Id: 890e5fc4-d07b-444c-dfa2-08de078313b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zlmBenf4MceaoBUnTUdWk5KgPxfWVw1AVFVoz6s4k5Xj2ciOFPsqE4k54MXA?=
 =?us-ascii?Q?C0HpTm89pQysY4ShiVjn4+3IyVrY1geTRRDavedjV03p35iSLWNQ7nNK3xK5?=
 =?us-ascii?Q?G5F+jueGP3NTWSTYA1Wxn7JruO+xoQxrlx1G+NNKZ9yxbfpKUHLzBwlAGVJR?=
 =?us-ascii?Q?oJl/oySXRK+CW3sEL51vfJtGWElB4wcW7Oms2TjUMmZLBdPkw7e/bopcn0DD?=
 =?us-ascii?Q?HA0JpfYJCfVQKsKiBwjxgqoEIG9JmZ0Un5jBH4Jt7qUMa80sV4gomXg4Aye6?=
 =?us-ascii?Q?8iDinadjNnILqsXb4Dhxe2Xpd553KipmR9Uhmcw0NNZeEgC1axUFu9y6HlIc?=
 =?us-ascii?Q?4KQkg0IUpZE9vj90HbUuZgpPSoaeejfnat7PZvUthgeCI8Wa2M3JQfMpUz6s?=
 =?us-ascii?Q?PuUi38XWdOMv60kTUF00DNa8l0iDpG1mJv3gzMQdhOpCENeN225w0zqiYjgk?=
 =?us-ascii?Q?hBFmhlU2aP/aXwNChXM+0OHWp4bFx1MDXbakz3TEVvhATOuYitsCo5t5xvbk?=
 =?us-ascii?Q?C9MYDQtSknPgxqJ0RX4SteDIVspDH6SJIREV1B1+p9WWQxCNVFkm2OBd4Cgy?=
 =?us-ascii?Q?l9/zRh1HhtHo0/qLUhra8hST/kHL0exnY4iBDfzOYbrqCW0k/Jj44zgp9jGs?=
 =?us-ascii?Q?U3cPZ9Dycxe9JTYrIZbwFyfR1t3re2OyxQ3hxG7fRNs5B5W/fQ6RZVZvqg7A?=
 =?us-ascii?Q?lF3nE2TCKL1aMN6l5ZFGXpVT42vw0jOS2LJ8LlsDbTlkri5uNnwkjmhZlqSk?=
 =?us-ascii?Q?vQh1SMTjJdNHOAnSBxIJcnSGhvdYk0+7rjg4oARE+GEY+lgQwxEqFZaX5E+u?=
 =?us-ascii?Q?XQvoKXRCex3AYkVtv0zX5mW7KaiEXjtBXUko9RCqMiJkYNH8w58Iv0IMUUUV?=
 =?us-ascii?Q?+yx9Nve71Khjr67q8iPFBFjo1sOItUWykf58SUICk/Mgi4aIX3RqSjFFtjEa?=
 =?us-ascii?Q?R9AD3E/gdRBBj2npLhRgZ4xVLrFoaUo7ozvST6S21zAStHSk80qU3CE2146B?=
 =?us-ascii?Q?QaosBeX/7nWP2v8BNxJv8dZTj4sVQXaImBmnFrvzdnVtsaFqVUR8S6xBh4mB?=
 =?us-ascii?Q?Vikow3WEfd+e9iZCjDkq4Uxa8ZOUam3cvnXP7uq/1sDLs0GCNyhS/m/hYdDS?=
 =?us-ascii?Q?/j1guq8KTY47lhYbNdyd+yoCvTHj0Ey3pFGf71X+cgVKQB6JRotOdLy9jyNU?=
 =?us-ascii?Q?vr1p1bSU/iZUJReXCpKa1a2wX2bhFV0z1sj8/VlRs4ppKbT4Nt/XejW6kGna?=
 =?us-ascii?Q?tWu4e0zyQrcQcVSJ4LHpKel8ARvFbfTT+gvjJ9MkJtXapr7LY5/WhXt6Bhdl?=
 =?us-ascii?Q?ZY59Yk8vofvsBICwepzUFY0NNE5zuevVHzpQ2H20QtbLFitrvyGin+FvR89g?=
 =?us-ascii?Q?n1SnX+RJ1OOMQvk5pM/K6/Bz5ccDog7U2xKNd7OLob8Ty9gaoC/k5mBSddmZ?=
 =?us-ascii?Q?NaUxCu75rOAbH8R6xYrF7aw48GQEk+JC4ujtWNDSusIHhuGtXgKNoI9RTX1b?=
 =?us-ascii?Q?FLUlV0OnL0Lqd+k/rHYvojNYemtp6/Uuz6x3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zOXkxLI99vbPrSAFBL7HcjN25hDCu+qDrRHfXlN9J35gOdMuYAD4Nm/aWXLK?=
 =?us-ascii?Q?mwfdyMyli3TdiFtVcbU/lkXsNkf3APWrFDBB3GSUNAo9QAlG/Vwf3FHqPswI?=
 =?us-ascii?Q?lwwzz3CTBLGf9mLIoJMUOfWc3kiWJJLzZzsRckylxYXW1dXcGxdNhlcpeo6d?=
 =?us-ascii?Q?byPH7QCrtOUpKhmdRbOhvc007CHpq8Xo77Bf2nmiOCKlaMUOcvX5r65citlE?=
 =?us-ascii?Q?dMlrW2q7BhJ7LtjJ5H24tya6pGiJRLImpcaAMriq6a3rq0zYRpXf3hL3I/Uf?=
 =?us-ascii?Q?kjX8aDr9pHqcTfVJJEY7IEB5f8UdqpRRt5lAKFVVGD0N4gmIrjIugx6FTiCK?=
 =?us-ascii?Q?0NeFKwUqyPDxzkSK8lwcoturbZ7Ak+tLnzY7AZchWJVPBc5uUuwKTb2eK4ws?=
 =?us-ascii?Q?oX0Hn63dOcD7U/0yOGW/Sl0z2jBoAg30/JkyX0qcvSQoI7yIqa2rTCShvRUr?=
 =?us-ascii?Q?MBfNWXfU0ov/Uboxh9SD2ynvpf6/lEVHqAsGNyNop0WFH27+RQK7UV5lrEzL?=
 =?us-ascii?Q?WpTUazWT0DlmGGYtry5Em5FjvCoDXvfaR6uuPk7E8Wfxp1aJ6fxdYREMdnhQ?=
 =?us-ascii?Q?0RCguyP63KF0LfczpVb8LqThJWK/dGUTJrNb3zRQzJQWEnmf/YZ/Z2NuhOqR?=
 =?us-ascii?Q?051/+KaM7aze7tbPSkiETZ/l/HZRl8F99FpgSTJZO3h/YukptT1JIDoetcww?=
 =?us-ascii?Q?wwVePE2dwmqIwT+TDpZr7iAJ7J/jHCzeL4Cdg0qqlys2hCffgaUhbDEYqhCT?=
 =?us-ascii?Q?Wp08/uP7FcHJwGFNc3Ylj3lh2eDVb9/YZXsuueidsszA0KH4z8aSqq0ygdQu?=
 =?us-ascii?Q?AMNSxaUq2A8UytVCd8wVwBMdRUmj3IAMkS5EW2Am2moHlkRE95g3uHU3I9Lp?=
 =?us-ascii?Q?p2idw5Of7Qs+WIE8oKwVE+QxBoOpuOW+NxWoB7qAPh7u+zLc+vzurAiy4on2?=
 =?us-ascii?Q?FkZaHzrIC6mEJ8197YFH+qkqzgx7Nrxd/MCoRdAgZ1vBxtkONiOveOyNcIj9?=
 =?us-ascii?Q?EEdVMFNCzj3amH88TH6D3kXZwKcjOczJMHOuQ9WMHjo3QZkNRa7aevD70nI3?=
 =?us-ascii?Q?gnuYrvMPbM1gR6iAukAtuPdekK+IhUDoMUEf6/Hj+gTi9Ivx9w7Ty7wM5gbO?=
 =?us-ascii?Q?VWHnx/Xu4g4ZrlNrl8L62R9tSRJyHbWZVOwB6UBTgBAQZEJxc9Q6ZkNFGWIr?=
 =?us-ascii?Q?gP14uk/I+p6dTuf5mWbotqv7R4RWOgHMOT2zv+BOCPKLD6iN7D0VL5Kv4egF?=
 =?us-ascii?Q?m3YL2VXjJIkOCkal4R6qa/8dCc2iHYZuLT0MHsbjfs3+IixQ5Vx3a8waGMRI?=
 =?us-ascii?Q?rkrqIVwMHp1dTi7XK9y95RrfiD+VDTjgXU/kvhjQIxAI/oxcOkHZvQLvM8Hn?=
 =?us-ascii?Q?c6E/pCaOhHx+tdXl302incpOWqsSV8Iz+5GtBSMGM71kzaxPDtWsfwuX7R/N?=
 =?us-ascii?Q?/kjhhJTBdRzD5yAFjkQUBiDQ3PsB7RKzJza2dJLgOwK9z6WNrKL3jxPg4ImV?=
 =?us-ascii?Q?Nb+DrjwfDmHJXvj5BeeioGt2dwOP5/AIhMwvp6o2IoHVtDJCIRL5pQFVhTpd?=
 =?us-ascii?Q?oqnolv6WdHMUHOfTrlfa9pdq1g5xBatClWQy9D4O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890e5fc4-d07b-444c-dfa2-08de078313b6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:27:48.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6p3qdSEINp9TNzu7melef6kVSNXLVLJSAzsK6JgNoW8SnHdWDapLhh10gom5fQy8rNNrkNvqTbUeGc4QszFhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..6ab1c12a3bc1 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,33 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpiob>;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0

