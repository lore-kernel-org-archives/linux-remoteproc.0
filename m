Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE931CA5E;
	Mon, 22 Sep 2025 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571518; cv=fail; b=qyXE9MmzQ4izCOL+lJAVaWYcVJwboopSpjYwFYcFS8FgZ3gIxVt3WZFnXTwebz7TDmVb9qYQwKCLjIVfbKpU3T5M1H2lqdtVIUe4JK9aVXAgHXfaLUgOujkK8jzZSCKYR9LLgidCsd4fTMIhU1VPGPNqvoCg/Mif3/CpSbQnIYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571518; c=relaxed/simple;
	bh=vGLhSV9HOD4MlWjPO5ELI7rFfhHl/ceGxaektFvV2mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXX6EB1hM9emFY8CsnFmxZ2hg5FEXiKyIVTh3Q2VdYr1YJ3lckc/VU9zl6Pul3lHjYUE1BPzFYfuZcjnZDklToDLH+Z9A1sYnog3nRv5XzItC9p9ISXXYRhdkEgwPrCVJqXzFEHBr+f5v8qAL0Fe3EQhB2743aYPSv8AmIuCPZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OsEc+83m; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OsEc+83m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAEkk58XE3eUgA/ZNAhs/H8XHdWCS9sQxJMUhW/7hW2ZO0hMx0WHkABtIqU9eB7eT3h7oN/TiY2miQ2OU57q/fSodi9rYV5RsSwXqhY0DGcVp0Hf7Fuqpj85jjg6YU8g4c0dpUWflA7shX4WfXYYIxODh+UVaItkqzxV9pIoGwndV7kVQfUodklxvtJkgIwnCu8/3PwSRoVcVJLGURYYnK+vsfJgNTWWkZYI7MiQxbCJ5/70J22D5TP05el/6iiBQ8wIk3tsmg64wAUzT9ZYCIxE7tznQ4v26uDckWJujCpiCEs4IdszcRnDTgBmZHMYb5XHcCKlfEEC5KA2ag1ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=Mtn8ekEFzl5zY8QIMgQDKtXo9XvTT0mPmDRzXHq1LOn4Ik6mV4A6npBxnfahGG6tJfptvldRW3P8GwJvY+cQA2Q7wGJw36t2Evqtj0s6mg6jaZxOXZqU+qA6Gny6Y9Ib8OZ2PwLQOBP8RJHD2/gzY5ZI8NBqBxy4d65i9YL0VzjDQiTGn1zJpr2nT4JQ+5VtGN7lxeb/n/GxGDtQT2NOsjV9KcNWgOaKm9Rc18cJrvJ6lfP7DiuYxEGF8/wYa2vSg0/WhOEMXBVYEByA3VvNrV/DdEsEAa9fzwBv5csHeZhQuvmpnsR4lPEJ2jzCgT5vSNti2CYMdESylkhCrx5flw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=OsEc+83m/ClgXpWM/GSCmBIVRi9g4pFCLfbsmyikGUEsjMs+KWxy13JekwOIBKA3p7tDffaf1GVak1xwI5+hXqGixRl+ihKcti6MC+hWzC/Lc4FnobHzTvXIaAReb3pF1LKqCir9LMxqQQLWD3A5CDKwkk8jen6gyzgFmRnF1J8DzNVkbXrV0swaIz/PyjJAHvNr1ftfDNvXpNWRmEkpoV6ZRMCBJWFD/0wZ8kUhX/Qu2rJP/WnChmXe0A0SRXynsQygXaHwhLywl9g9GMMAsod9CnkYrSWL+1zpQKZxMqsQkDmY9NjqjJzFP3JPri1R0s/sPMyjMAvBgyOOU8ujkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 22 Sep
 2025 20:05:13 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 20:05:13 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Mon, 22 Sep 2025 15:04:13 -0500
Message-ID: <20250922200413.309707-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922200413.309707-1-shenwei.wang@nxp.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7ff512-eec5-4d1e-ce63-08ddfa135726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zuhqGuOKuUWpIgWSzuIuS0O8AGbedSMgiidEcnC7takiaPgbjX46uzX3MJcq?=
 =?us-ascii?Q?m14pk3whpu/gRhKegVWnC7n7UCpROyZ+Ga5CFpAYbTSMJECT/GPCqdwgfvpz?=
 =?us-ascii?Q?73SWoAMd/JFbdaeZDQirUIuUnrctnEaueGvYEq6n+pb10pryV4PCvV/dZe7w?=
 =?us-ascii?Q?tbXVhyvXBR2trBJsHvy765mVOgLCQ7T2xP0JepY9XFRnaSNnbjjgs6lsryyV?=
 =?us-ascii?Q?vy580wpO2rte5IhsBDwnO0lZvyeV15M4VO3hI+POR6bg5AvpKe7UjHadY6a3?=
 =?us-ascii?Q?vYR6TqdRiX+M+4VFrgEDIB9vRf/D45Csev67h27mZU6mqAOCcF7AWObtU2mW?=
 =?us-ascii?Q?FCkQOoGKrpCaOAEEt4jz80l14EzUcQMbIi17f1Wmln+Fb6jw4YtzQIxyucaN?=
 =?us-ascii?Q?duOkB1Nli6i5HYeHOq8dGjQWtsagoYRm9TSQtTHKsJQKaSm7sSxZM1RZm33W?=
 =?us-ascii?Q?Bs+L2yjLs61af7sEtzdwIOth2pA258VU97wXJ6ZnSqS8skn4fAtJxFMYcP3l?=
 =?us-ascii?Q?OPAjVuHug0sst20gBqFoaEHBE0zwbfMbzi1Bj007sJPhpLf4iRocN41LMKZ9?=
 =?us-ascii?Q?Qp4iiJf+T2oYWNambIYRNuQA9hAwuagGCFLbq9c0MIr3LQ1ZroAGyZ2qQsgm?=
 =?us-ascii?Q?PTowU3MUZb16Y2ksJykcd8VaUOUJY9yJrIOAM9yiglmYEkEI2/PVK/PTwmpA?=
 =?us-ascii?Q?gvU6DGo5qe4/6EbhjUWwz644hmYzCxxxCBd1ayZ6B0MXVYOojYs92kbDteL9?=
 =?us-ascii?Q?wztgFaIMt4axbaG9McfZWOqVzISbCynhjWfj/Bo5fMpQHJD9pncZMi2cCMah?=
 =?us-ascii?Q?/FgKWPLifo6bSpBNbfblhwg0Vhoq/t2cq5S2VPPE++kU9nUo0i/GfyonS6a3?=
 =?us-ascii?Q?4dSaXgMJa9fbFHxqyM7LhqU0r+AoNBcYKMeZbi6qddUzeCnFBio3c6CgKPly?=
 =?us-ascii?Q?QeO2eo7q+HzBzYAe8HtW7ZY9/J34VX0ZzyWsRCsyilVNXxWGohDoKRHwY8Hg?=
 =?us-ascii?Q?sN3GEQgnAkF/njF5wu5LX5dH9ouo90wZMOQnV8ggtwQiZ5V7cgfq/3v662u1?=
 =?us-ascii?Q?oL1PqtSiSUx079GQygE73qpurWDhFRAStizoIc5r/9c7wBLekzTRkF7YowsA?=
 =?us-ascii?Q?00TkZuIEpPHJuF8UBI8wGK1bfL2415q+sXnJfgaEZPVIbMnNNSR3vSDVB7VO?=
 =?us-ascii?Q?v18bfeQS2EqMXaPADvNBcO5hUIjiJufizcY1/40AX4Eqrxkz2WwaDQBjHQUG?=
 =?us-ascii?Q?3qj1qpstEiFmmJm3RK+7R4E3Hlqch0yV3yf2Nu4fHXaKqhnHt8H7TWNbceeg?=
 =?us-ascii?Q?RljFADP40echHlKixplrl3bJXQGPx0srHw+Pn3jc/QRHUbts6CueBmIZEkxj?=
 =?us-ascii?Q?LRGk3xikPaNoDldGhg2q36P0aTR+M+RQAJDaAmWLrQRXmRgvfBGZDgFz9vhr?=
 =?us-ascii?Q?Mz2dhyTuGFZG/J5UDkgOZEiBdd0fTfoOtYISqF+ODV7PQ4q5My6S6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kslmHddt98en8+UdbzoLSQgLiYUHF6gtgHdnHsfD1ELkcBsWkkXHmiWLt/68?=
 =?us-ascii?Q?4vMtnSHxObiwVnNeLSQz9G9iLEc74EvgpCtL4sdLTDKC+QR5/4pFoHoi1aOn?=
 =?us-ascii?Q?2vPZw+j4uH5mDhIq4uEesU0NZhVz9xvDJ935jLvHKxGK2WqEuQFOya+tS/xN?=
 =?us-ascii?Q?GHdep82AdZqN3fYaLaktT1XQb4Lj536YcTUqZeIO9JLtE+kcDCr7qjPp7vXw?=
 =?us-ascii?Q?oV41M1YoIdReJMuYJqeXruH5qFN0Oc/po1yJfVwKbsifLxWYAz9GmlIi4r6r?=
 =?us-ascii?Q?ebebpjsJY0U9bMj2lUYj9QIbCxpnd/QO7P0uijABn4DvheMupb0nibD93clP?=
 =?us-ascii?Q?rWZJDNDUqlJAPf/SDQdGPRilCtvUmQPUyBxtSyANZujpzT2f2HCf4YFcnzVq?=
 =?us-ascii?Q?znls8puigZlYEHO76Iuyz9DGIKIccLEM6mF/sWXI+CMkAxc9ttUDc6f/XLy1?=
 =?us-ascii?Q?YwF4EJJD9+G+x2QZBEPIzBx97/q6c5+KGBdDFN6vERKQnssGXu/YLYAHnX8R?=
 =?us-ascii?Q?jKZyvNE2Cx0jIyvS7AUHHuE+SlCebovDsiQWdbyAlsv1fSC6tWwwqUqbgTzg?=
 =?us-ascii?Q?0M/wEjJR24QMgsAQ9O5RHJuwSP/gIfyxoGL9R6yt19Ttgp5JxZ/C7YXiVDmx?=
 =?us-ascii?Q?5MDZmGNyBxbWZu3jIcRuYwLmQgt67cN2MHR/d8OEuZ3ezAoCKnEsZxaYgmg7?=
 =?us-ascii?Q?VspiuDR90LofI2gKNGP36voO5l5DvY9WnRgs4yWXobeRLKgzjZLuHQskML4o?=
 =?us-ascii?Q?wgrENG5K4jfccrJbOTc8xrTWcMICaFtWFJJ6oIyxSxY93sDYg27VN3aclbEC?=
 =?us-ascii?Q?ups+N7Ahwf9Pw/1tRsruI8D6WO4uumOkOqkPrETgQqR2ZDq678PRurYYIPvd?=
 =?us-ascii?Q?hw9U9aFXrXHGqbdDmKOinJN5K0Mg0Tt+yiIaLakHC+YHcBYK4f6aK0LiCQO9?=
 =?us-ascii?Q?dUI6aabRSonzjflCAHHbak2Y1MJiQ8qWJEvWcpbISmglPpFyq/DfkhF/PG+c?=
 =?us-ascii?Q?8EEWedQH889BhuXYFdZD+EwN+DXggRT+achvzHDvXK0VqozMYHbAJY9u3M6c?=
 =?us-ascii?Q?swTSNt63u02+1cR1LZejaIsGjaK/GLtDmCGqF+RfOzUO8edXubkpExGVlFNL?=
 =?us-ascii?Q?i7cIZTvWGtQ8CiUgT5LTVMhm15nekv5pGjat2fDimSj++KTSEyp6cuzpKpu/?=
 =?us-ascii?Q?6nSq+Q+A/H2Jw/D3uCuT5ir3ExVhqjzxH06sEQqBV29gw4mJqvbErDuNmgIk?=
 =?us-ascii?Q?facgw4JAntNZZKcyh6rV9zEinixOnFfU6vARIgkrwFQI8hcvVqm8Gq6CHxZO?=
 =?us-ascii?Q?rC2fulB5fEUodRkf/SCfwEES1fxib3VuAVe1W0TWOrSrWMXXNPRDa4gcn2k5?=
 =?us-ascii?Q?RGHKoTr/SEBhcNt6bdtuwpWZ+8st31qEmTKRzQta4/f7oU1UbozDLy9wFgcK?=
 =?us-ascii?Q?8Md1NfbSvoBKhZa3qe6Dybcc2b9iIXjJaczrv7qLUNC8skJhu/5SyvEtTdPy?=
 =?us-ascii?Q?KY3kas3jMQF/vIKAv54FCo0wqIQVqtjhvyiJpJxCKs+7PhTqkggzExcV1cTw?=
 =?us-ascii?Q?bIuZ43hS2OzDGvQR0BhXYJVWw6HIQH3GwGrUJzTn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7ff512-eec5-4d1e-ce63-08ddfa135726
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:05:13.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkQIpEI1uMrCeH1UaoFdYlWfk2GDM1MGfsJHWj0UoaY+mO4mzmsAoWEftHYsf3kg1BKHSMCUn75+AxXgho0fRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

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

