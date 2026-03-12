Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2542F39C2;
	Thu, 12 Mar 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343474; cv=fail; b=hcFtc+TLIxNoq7fmJe1lStQeYCz4Lm4wEIzpUARC/UnkWg9lbN/2qC1VSj7sJKpOYov/JINXwhgtrwU/HabvEZb1x4p7EqrSIVAkhhYxGY4uctH5cZmuu2cwgKXTljqGdrip7AmjnEMXDo8RLCXF2HE3xFKYTu6CyiGjT1hijUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343474; c=relaxed/simple;
	bh=dDxRJAcxzYyDIxnkxZ8YYquEeglTYSutmRuNpw4aMg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjnEMEkrKpR6PGBdFmihY1Vf7J7kGkoVrvzd9zAHa0vHDGYcOZYIAR3jGDDIEHHwFu1Nnu5vDlYwUK5MLhnZ5Suv+Htof9py5tw1/GHteUCDj9S8BgkoFiGYHw/RIG61w56A9qu4TuxKlQ7aWNUJoelDWkHyltzT/yXlgeRz+E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dcznTCpx; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dcznTCpx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfeIhnBYpnH4U7+UUiEySIEJ13r9QiktD8jQq00VaJ2KqOXHoMnwxgPD+Drgxhn2ZQKVNWfNjCq1cjcdDeYT7jip7EZi1jr91mVFv4xcHFAGxU4koHTTuMwY3RZmQIfyc17UnaA4oxjQKdx43HJdPooh9WQxibeYv0vqmoD5ym4wHMsqopWizTbnPod+XRv3NRQkdcxMJqm8EtZ1tpGL4k5G8TycgZkXMh+2YYf6oPnsFwop5T5+apq1edKzKibfd6Q/RUp9BUiSAePeY1SBJqLv/zsn3kcx3C94XKFoi7xVOKye1M9+FCylB9ya9TDMirZCqwxloHMMcd8ExBSjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEamJxtaKlHadrfFvcusAILYjU4Ri7LBqM0L+cVGLAA=;
 b=GQSB0vgpVbfonau5KxOVQ7QCCs/Lqf2zfybZGnprK6n8U7uZp3Kv9DeuUdLFxhbVleT8Q+aYtje6ejJT8rndO3/yxYV4d0w41uf+h2YQlzq3Sq8MIhQImTnlnA+uhaRMXboEF46uBTO3aGoVfQTETfjLKDjaLanHAjmfZkPtS8N4lg0ysilo8KcoDPvN5FXoKNSOWrreAxIEAI29njja1F7DYCMYzTclcbaQt7Zmf1sTdVu8+wZvj18SlXDiHGIE/ski3KhtcmCfhUyiH2WgYj5DX4kW2T1BI1V6fxY16TqV3bkZ2fI/Ijwrvj3viEa7gfVA9+0nEzzYxJuCmgjfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEamJxtaKlHadrfFvcusAILYjU4Ri7LBqM0L+cVGLAA=;
 b=dcznTCpxykOw2f9kHi9Ku0bZLUvt+dS+6P72rxa2kA7oNBrf2xFxoBAy27Yvjw/MQVzkWXtzj//K/WItx4o9HlQz0fYAV0GqpzHMPQXghl6llDsOZQA41X61DQxSEGnjq1g5Iv05zG/j8qjO58Ge3LzaUxkZ5tOn6155v4QtqcBLAxOLkPXhdM4qgY3CrX73lAFxLwsXj/GUB9sS9r2yEZRYAzhGgNO9C4pzP2RxAxXI7sq78eawqcLtNPHHECgdqlc7MryUrbzsDZT3Bp3PX4QJzb9HDiy33K0OIgQwYGFJjuqpBy4r3J3Cv9U6yJBP0unUxJcdA0INkWWnrOpt2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6935.eurprd04.prod.outlook.com (2603:10a6:20b:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:24:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 19:24:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX94
Date: Thu, 12 Mar 2026 15:24:13 -0400
Message-ID: <20260312192415.3486965-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e30d926-2903-4972-6b5b-08de806cfa3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|7416014|1800799024|366016|376014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fLAyvp1T9+yGEqxV2FhXXXeu67cJ0u5yTxwkKPdgHzpOqbuqIcqhs3SN7by/dONYogbN3w4kDBQ5ee0GlN/A4vUClXpJXeLQHDAqg/g3H+pCYjxCThdzOdVunHFW5N1DUrFa+HrRqtJ913f+M2p6N4u/Lk7luGii0GbW/DnlTKrIF/Qixcixhh6j0ui2ohNVE43jBxqXsmoijetnIUmDT2Dmr5tyWCigeqO4BwyIBmB1lIxesn8KUrKnaKeteNdvDK4wn1FaxvAaZF+cZbkBsVKJtUntsxXzdhQRqN8d5JfJtwVXmgB99VBjG9NUxa9m9zJeiaSN4OYlKHyGY22MWjb91/8qRnG5uNC+sxnVyEYkeE0MGAO399kyI+FjbEYqXUNr5Z1LRGuPx61ke/h9aD2iA/41gmBYirfJ96McIShiWb4g1aEhUzuIbrxCtEQYUShrJJOLJdbaYkfIrwlLbiNPW0X0ErTzK5nwjtj6tP0+Yw0GyjwS6cWvaNShmKbyqdJJ5Psq1Hchz7iy/OgE3YhzjlA9dH8YbpuNcFW3nJr3kp4IA8Q9dOwFXH4ZIWeYqXSotVvLv0hMOdUP7qN0hYV47AXgR7xcTIsaKpR9nJG/u4Xbeu80Z6NaI6THlHfp+LbqukNu6eOy5ZVnn72S5h8oVaIl9gmsBJRPukPoeLmLnTFNiUP8GBqIkdN8y93d9rmfjkob+rePGZWi88hQe1XUFviAP1GKKfI6FSqhjox0nNItuO1GlB8tYTqMWxVpq7oTyrwqDohQjlolOspHCYtD3VSnWUP41t+16ndKGkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AhI4RbtczUK+Bf2zj/84/xV8Vd7+Z9cbX0wte2cq5DDyH4ZOx7K2lCFUCDm+?=
 =?us-ascii?Q?/YEy37DGUy4aoJ+x73RvEPxwzXaVbbIPIWtA0Bc7duBq+tE5Y8s3BctruhCj?=
 =?us-ascii?Q?jTfF9hDUwxo6X8oCkJpGbBFuDHU8Gl9Rl55biQaCsgNnM9vMVht+3UkOKTRN?=
 =?us-ascii?Q?Z29OwepBN+BK8kcjqSOSoJIeBsBl2Au2pix19M5q55kHz5WlDoqqedBZ0y6/?=
 =?us-ascii?Q?28Yacm3Ur6//Pr13FMFCFZABlzVeO18crw4WscKHwCUFbw5yu2+ALr+en8FJ?=
 =?us-ascii?Q?hW840zJk94khv1HhhwrI0IO/TI+5fFBOe1Je9RJAql48uX618Q50+7fhe3Uk?=
 =?us-ascii?Q?tgsf7d1+3dfP+Szt9ENnqgHpjh7PJzTJ4coKsPqwvo+Hxej0HzaVfZybJALU?=
 =?us-ascii?Q?nhWPUD+c/XeRH51gMkYLtCVFjEdFqhjYCc/m78d+9oj6lUX0d8WWjxfGa80o?=
 =?us-ascii?Q?RQCyTCJN3okAg2+dHfTeKDVvSE1R5nBS9lpz4hzuZ3T6QVXkGhPZVAzxgfwZ?=
 =?us-ascii?Q?ChxGp4YC12ne0eHKt949L/3BmOQKcXeiiR8qvGcZGmDPsyMncgr9X2y9wM1I?=
 =?us-ascii?Q?cm0i9PIp79vujbPZolTntEpJ4MwUsYLfw1qbbhxi7lAnA9TYTACzN8kannkk?=
 =?us-ascii?Q?YfBoUn52KVATmFRc5raMBcC53BVRgunUXeKIMfrH7V34/OvxLKabi5NrCUn1?=
 =?us-ascii?Q?0AcoLdJ8us5IOMQRya+rr/bPnoNk02jhERfzX2ASz9lpThYPCDreQ0MbXTao?=
 =?us-ascii?Q?DvZMleWugzl9WeQMNfIp8aU9Ejbmlzi18MmIPpfXBD0SoHiPzjou0DqAgbTn?=
 =?us-ascii?Q?sW0p+MA+KlhLc5irvwcDmxiwcL8o3yeW+P5ef717g+5QeQofWTtp3P8MwTqA?=
 =?us-ascii?Q?TuSndZxAgJJ8CA6rmkU+hLXWcv7tWPgR3PcmvB7SOcpkiqpjWYxXrkyO3R2P?=
 =?us-ascii?Q?RFcZxEoDH7KcNxXoiEgIIjVpBdQ4HwXAPd7CcErQNsgOEZuA5xsHHLA0u8Kq?=
 =?us-ascii?Q?O4VwYIaIjdICAVOTjqtMG6FJFH6CqClt8WPE8ml97DTup/ZbdhdQffFBS3/C?=
 =?us-ascii?Q?XEr1WFIm6uH4VA8PD5iOFy+BtiKqNdlAvKrbYtddiKfPXSiRcLMpBt8/KZnt?=
 =?us-ascii?Q?gVzDlo22Bm38bBEr18BehEs1piyITpE9COIEJO62hS4iPIBTe807lhjR2lIA?=
 =?us-ascii?Q?6D5npxBxfp2QbYE9hoKgseE19Tqz/DzXn7eAv3tBPZJou/Kr0d0UF0YduACJ?=
 =?us-ascii?Q?MWF9dRF48MneDtLDHGMskTqfke15GyXA5nzDOY96FCn8kZmr1q8y2K6y683p?=
 =?us-ascii?Q?gf3PN/aiFP+CC+vBHs4NPqtRyo6ol+9KZ7rLmUF8Sw4ckD2wa/grLvkhgVOg?=
 =?us-ascii?Q?jovP+vfd//H71rf/5Fh4DFwaD5Gq0t/ExGgW8sz3DIgMPYvFOQX9/3J8zbrn?=
 =?us-ascii?Q?xe61MTdRpkSXwGd85B8bDaoBW5E1Q8C8cGJ2lG46pxWwC+yHHyg3iBUdsM+h?=
 =?us-ascii?Q?e72IpYY27asgMIWjRwhmHtzEZgf7aTh1fszbHxVIZ69chot8iLF45D1EJ9BH?=
 =?us-ascii?Q?s67tRUzroCXek26o6+y/BXJj0Z7N+H5Zv3tW/ZUQtdezLpP2DsRRoc2bOP4m?=
 =?us-ascii?Q?dMk0eO3hla/jDpOuc6sYVhgHh4H/pcPzgnF3AkaVOncnc4IoOk4dxH3kXk1N?=
 =?us-ascii?Q?vZJ6ooxuhC4UDH139rz3e2Ee0vJvzgQ/CDg5pItbNQ3LmRtm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e30d926-2903-4972-6b5b-08de806cfa3d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:24:27.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xoeu9aWFVzOc8aSWuUy+Md5/ZCO9Nsrjv5+XkMiyfMu1JaoX0UAwIhqJAZs5T0WxtlSLDyEDh5ty0ASYb69bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6935

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	/* TCM CODE SECURE */
> +	{ 0x1FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE */
> +	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* TCM SYS NON-SECURE */
AI: Duplicate comment label. The second one should clarify which TCM SYS region
this is (e.g., "TCM SYS NON-SECURE (alias)" or similar).

Frank
