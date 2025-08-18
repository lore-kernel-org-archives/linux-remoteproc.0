Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77256274B3D;
	Mon, 18 Aug 2025 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549940; cv=fail; b=F6G+4w/myCgWQ5MshRnouwLIa4D5FXgZcqH8p3fl1V35NTAzgdlyryl7ot1MG4uu7PvfHPJ2nXIjKmdzdK2K7ygTnsgycCqnlZpIfJZRMRapgwpBS2ptDsoGxFCSFmJq0vplos3mjuuqmvhUwHS8zCx4XgIPAQEeCyOdYvHn2ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549940; c=relaxed/simple;
	bh=vGLhSV9HOD4MlWjPO5ELI7rFfhHl/ceGxaektFvV2mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVmFjq0eNEGikx/Kq+7BDTy2QJM0f5Wzeii3F4ZQ7zKPsgSsKg3GX3e9LRTXri6tbBp+MBDnXLSo9OKJhyL1Sf37cROB5fhK+iz0mcSVD2axOsnhpf/378pBneIg++x6uTPwlwBixFove+dDA7HjCEkye2rNOgSVsAjEzuYkRbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YdLrL6js; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YdLrL6js"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYkR3EmEsg6rW3qWRfYAAMhjyoUpf+yq+fyj3MLeUupJzkWajkE0PoWRch0dnNo5eWJ/WaUy8iT2VQui0u8JsuMZpvZ+elHSvsi80ztF/GnzB80xb2kAPtxJl4Uf2v62pRQkm6Slq/QEs86IZ6Bu/mDgNgNqNS0z2dzjGsSJVaXDmit67VA/EGk+eRwO409+AE8LdHkODY2nG/dEJ1ssJkUZh//BSfekd7fj0+ChVY60Po67KKKsgPsSGI9FitettHkzUgxl++Wk2pgM/ikXi664BbfxPv4Up4HZCkPiabF6ZFg9mAunQo3XIQh6HrHmWeAPlrmRd5kY91gQjErX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=HzBa6zCnbmvnw0H419CKsxXS8+A/YNbFTqhjRJoQMuG5y5FCnyQIttxz7YBU0o0w7CX217ijbmg86HO+1nvWvXfIwL8/gXDCn7rBhgvozqfC5bXdTN5L8sKdYNvKlJdwDWMeQQoY4Rcx7vfNF4KRFEsLCYVkFtW0GvztQaEyUT9xUWQk264aoUIH3d+b/IDXL/Mr03k/I54TcrAEyFpjPR0r7UE/wt7Onn3pcfed/Ti1kFVt/cvOKy1TUrRsMDFzbpyPI7pA192/GupmcnTvz3aPBSU0mpK67ln0e/o60zwzrSAo8bPmtRFbJZJAflcohChWaoJH4/zK7vNmDzH7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=YdLrL6js3lQNpaIadDXH5islSVgc91IfAQULBG8InnCzGb6EVIsm2QcYfjH7Y2aESrDb2hdbrMxswCPEDYG9ZzHvI/0NbesCwg42G4t6pjLbQo4PNqmjCQEr6qH5U0iBcxmDsoKnY5qsr+rgicLPxdqAH8df6r2piqJyVNRQFK+5mOWBEzLMgwmJUkv90PC8doxuUm3XG6B5IX8JM29TVZ9R+mSJawdkbSTrWOjBYe0CnspVdQh94ngD8+bEVepZr3k/tDe9iBaYxu/Lyjr3UQyR8Z6DLu/gFtQAwPNsDJCbk9q2MOAudoGe5MIGXCvYxkjvrNYLK/Xw1txqlZMm1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Mon, 18 Aug
 2025 20:45:35 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:45:35 +0000
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
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH 4/4] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Mon, 18 Aug 2025 15:44:20 -0500
Message-ID: <20250818204420.794554-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f213bc-4bcc-40be-2829-08ddde982e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2UD7A2X2VEoc5H6HTcbcJzPQd7/JtqVGVWHXhHl+pX/6QwfYYNrv7cH6/qjg?=
 =?us-ascii?Q?200frAPYLk21ge+stFYQ7vucZh/RWnx6BTgCgTUJMCYcUE2nRpyDJ2GPiiOU?=
 =?us-ascii?Q?ljPPAIXpOkSF1VbN6h7SXzgP3qwwh1oCmUAFjdL+OBXUu9PlMAQq04wYPPjd?=
 =?us-ascii?Q?/DpEvoBgoacsApXmLtl0Aw53ZkWCI1v7BqwUIETInZFqAibSlWE3FAXrf7J/?=
 =?us-ascii?Q?BhdhD8P+unYE0dg/g28MSJ0UGPmemP54sklRV7PMXsn7M8QyI+xbtDFGGYmp?=
 =?us-ascii?Q?F3g9NuK8H4PE2fi8urZmtd5XySJtxgUkyyDWe0f4uM+xoPOrGjE05v6i3pNc?=
 =?us-ascii?Q?RjgNQUbTL+BlUeWYuGRRTKE8ZF3demZryAKdRWdq2QNmag0fFkz60oz1TpCS?=
 =?us-ascii?Q?nq36BkVtva0eWWOQJpytOwIv8rS3jk6wYgwqcLs6JRJXTrRa2kQrZr7e9bcQ?=
 =?us-ascii?Q?pe1HggOQ1IaIE9fZPzWtAhysxff7S8Zdma+T2PYgcT3AJxtYekQxAXp0oYRV?=
 =?us-ascii?Q?VmdFDgckSmqXi80NWr/pIsLQtkZy4HfDU+9PP5R2q5jUZIiigr3rAXwp6AE0?=
 =?us-ascii?Q?dXx1THEEdhYRF+wfJpknFxhxsWtcbZl04HVZ7x0d9Pap1EqMUM/t2krkseTH?=
 =?us-ascii?Q?CoziuBQV+pEUm1qS7uJlPWveaajttbnu53I/+gC2s21sWddZNlLkzgdrVbJT?=
 =?us-ascii?Q?I/17+XLq4/U3shEWTnQt52tQufHbipiMfT5v1cJdeF1KS4y/tE0fOW7YXX/V?=
 =?us-ascii?Q?k1ZhRoRMEUCoQSdIQO1BNPvr+oFgc1iOP3EMlqE6gUX3DAVqk4YiJoUHSi2O?=
 =?us-ascii?Q?ZoXK1xjMKYvDQFrDbMJ4ULHoTp+0vgjyVEwbqcWocEnN75/SNxQhTRo7AFLW?=
 =?us-ascii?Q?h+axIbZ1l1Mvr2dAKto4kf8VLSUsJshHpXzv9GsZODD0zOu1edcZzpv8RC87?=
 =?us-ascii?Q?sHCvAUOdrPpKQkjevfm7ZlZgg7gh9VcPAJNCQzM9AvERdvuohWO/JCJmc8KE?=
 =?us-ascii?Q?lfAKw7KbsJAm9bT3eiCDXSsiE2IKGRS3Jze8yaILj3am00m0AoWsL56IC8cT?=
 =?us-ascii?Q?IbaVIQejxecwKs56MunFqIx+SlX7Hi6jAI/IAnlzgkjQwArgjTO9XpK81agr?=
 =?us-ascii?Q?61DrZvFHzkkR2Zng9SGXpFqT4Xe3qeu/NLcs1ek4TyeP+JkrHvpD8JsKQae3?=
 =?us-ascii?Q?oL18sf+C084UP1a1KBe6P2QzC0DYz9btRMGww1aOuPlJ9Um4JZOboDbybUev?=
 =?us-ascii?Q?ehDM9Sji4XpTqlrtZA94FjDz/VLCF41AH37jLy/n3Lw2LYPPnmliu3r2WWHf?=
 =?us-ascii?Q?qdcX2Dm6Qm8b6s9wrKjM+AgeKrqQvVDNiGOJxaF0aFKYuBytXmjavByEhx2E?=
 =?us-ascii?Q?DVGWCOOd5XdbG4CpmJuziAbjaDPNNOKuYmWqGyL0gnDsg0HobBoTsYOpdmq3?=
 =?us-ascii?Q?naTXDYDxSKQ42iXnbJPrC3SRIfCDTby/V26zzVsmJsJtRmo4foSR2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WtR2jTeuCsX35ozIIIzvVQPjYL+kFR1aTa4NCqrfkmZZV6bp/oN70x+V2pS2?=
 =?us-ascii?Q?w5hE+2MVb1KM2M2HjqKiJxdnzJQ0/t5G5Fp6h1M25ka/N/dGpWLBjQ241eLe?=
 =?us-ascii?Q?PfTfFGs+kFmRzfF2293IsKVZl676GFo7zM7STuHrg+RYd1MPuG0vNZXqCm8u?=
 =?us-ascii?Q?PhTiUz6OUQ+KpYghqwa7SQtqtVUDZYcsCXZlQg8PteIZNd3qgUWdBBy3uVgZ?=
 =?us-ascii?Q?tVFLq4k80eOwbDXYp5RaakjMxIusnghzFUpYggxJfYtAdMJkwQ97PNMSyzTD?=
 =?us-ascii?Q?LUucjDx9lnSjc1gvn8wuOLv2zgo8DPCN/7dQ5hP85REMh2+6qRLyoUJU0Q6g?=
 =?us-ascii?Q?wOimVdA+qdA0eV+g62LOqN7Acj1JYUd+YCjPjtvTDyG/0xBCkgWhxHWdSIuI?=
 =?us-ascii?Q?AS4iV1yegVCGxrszNvHlJpaqMu6asd4ATMRRs+hikTD/AN7CsOEzjqDY0J57?=
 =?us-ascii?Q?RCkCKYt1RG+4TRiH4OL645AjQ/Y5Oi8gFrPuzrj0Qp++YHo1JB5sCiq0XQ3r?=
 =?us-ascii?Q?awLEqCjMNezkbHCiHpiTsDBpAEp2WNSYZgKZXxWOdjT+mPv0+PcNR10TBq9e?=
 =?us-ascii?Q?wIGgFaE+ZCEng+YGeZN487lON62x14Asx8AWWheokMAerihzY0X7YHNlgSi3?=
 =?us-ascii?Q?UVDXI/qB4uc+vMTu0E1bJE5ZMVOTOPQhh4z0PTq7sGc8EJwj0tGdzQ05RTp+?=
 =?us-ascii?Q?7Ejhai42JZNSyBgfsb15eGVt9XiQmbN4IVjuxr6dABMbbQ8r6sxKRgXbIYpC?=
 =?us-ascii?Q?4pdysKcmncDm/zirwMtq/7AdV4TRch39kuqYRkP9SPDJRUINoGn5e8pEE2PN?=
 =?us-ascii?Q?a5ckMmo/O/a9MkxJUZqmToz0Xs2wQLeTzlLsHycHb7jba/VOtFIbWcnugq6Q?=
 =?us-ascii?Q?slvS6w4UGVuiVLFjr4Dparczkm5EsK6U+SZAqR9KI1Onq9EaRQKjRqVAapzj?=
 =?us-ascii?Q?psTyhaV2dneof+nan12LxgNsskaRT3bw+udmfP1PDuGK6mmoAkNfa79uEKuo?=
 =?us-ascii?Q?2EufPqKbSumClVDR9MamtFaQ4v3HawiDR3fKku8X2jJuqIoFww5H5pXkdHqc?=
 =?us-ascii?Q?7ludn+254aSeSYAExeUxVkjIX6+nY4vm0LwqFvOtFDyn4ZeA74DtI1WkcTKp?=
 =?us-ascii?Q?Bb56HVGzcOXX2conwUec7kMegO2nJD6N5AnwhrT5ywv3clWY0t+BE5hFzgGM?=
 =?us-ascii?Q?Lw7sxSF83QEQXQUIaVzIFJJJBeBWcsmrrtAluRwIDim0GaJEJmWzrfLITkor?=
 =?us-ascii?Q?3MQRgZLaD/kiiIemy0LEjTAAwjfvMfQN3BlEwTJqYWyEujYvb4x7oUl4WNGS?=
 =?us-ascii?Q?HkONUj2HbUJLFRYdWovyFhfb07Pk7MGMtn3DBY1xeHrRJoMA6z57+Dc2RIO2?=
 =?us-ascii?Q?3O4/wPH6YYwBqkt4Uf30zzQ4ibg33LoBDVTAFEBtXHlsY74YavNAhRfq9DJX?=
 =?us-ascii?Q?VeYa2Cu6pfcrVdXZIt8iwOF4QDUOQgK4iBW5PYRkfyQjz+Kh1U06TbgmeWCQ?=
 =?us-ascii?Q?FyCiw7oGfH46nbVFk4tOmhg4RmHZHunzgpD4tr6bbYwiUQP0SNjoevC7LmmH?=
 =?us-ascii?Q?hM43xxdG46Qcn0C/eEdlz7G0PVjdd6EM2Jr5ble9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f213bc-4bcc-40be-2829-08ddde982e3d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:35.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DvALkAlRun2TC51gM3yTo3rFYLpuIApmOrXpGSgEEXggDHhrOEU7Or6dvmH3EEXn4rBcuU7fD+rOuP4xNPT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

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

