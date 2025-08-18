Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679B19995E;
	Mon, 18 Aug 2025 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549923; cv=fail; b=FSiSxcbqsk3j8HHwiQGh2jtCjNhMVJTeROFYMQrrXHYuA+XsCdp0zcJKY7U9w0XesxfxKUHmjzvVecBFGDl9NGMMXKK+Xpy0dIlz35Yxldme/wdk+rpFvFaL/mjKzMJzjFPLPuFX+8sHAbXtveshiKcXtUlaDTru7SLt57DY7pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549923; c=relaxed/simple;
	bh=uG9mKadJjf8XJXQX9h1mg/GpfA8PsvlrwKcr9D3dxqc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Cz5LYX3+/Xga0KO/DrRz68Rzfhgsj5ygzl2UTqu4G896qbPgEzr10EsM70dq/E9omYOl2Dut5YIdOBz3UiV9eMVqtcaa1qcExckFfLN93rvVRIdwCjHiWNyTA1eX3KwlqiPH+saQ6X3OQAzXADZw+i/3kTiOBOXYcHfjODebgVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ATiECrNV; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ATiECrNV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBt1vrO2tlaT3uuKL3w0kU1PzI5qvY3x2awB53T02nOj7l04qKZGBPLUYS94iemptlr95I3uQ4++UFeQnaE9At6IJEXACgSVOG0qm4OpBA9Jva3kya6SR2Bu8jkbIBGEwdft4YRfd1LM165+vFFEQj+7xRbU+Tqf8yxh7+CvQRFJ1dibMn8RYKyI1gH6tLiF7fFj5njTAVh6u7ff4WegeiH/0w/9KuBVd2B8yvHgIUOhFvvTT4qbcOy5WXFvkSAODm/IYx1o2aqCml0Se7R7wzSVMbSYbKKjugYcQLsX/kfLb8n+ZrTsL4i18ZaGgO/RGeywQ2x2Ecg3r/O7gcVjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKsgPePhAUYu2E7HIONeHzUi4Re8KncIP0xPJaPKuNA=;
 b=hIK4lPFH5SINfd5g5Hfo3Yblgstq6pAtC9KX9tlzbAOqbia0BN+yb3CLKru2u0XdvNVDqfkhXX6rnXpsZY41/1khSju98mMLj5zc7P2zkQ7lLh3kW+ollUA+zTselE7mu8D/0uuNJu2guU8BmEpnXE69NPrwPjgwFUn0nqLSlWxqjrBQs3Kod9asvYQpBZ34blTKkaw7oCSCj4isrU+NTQdIFP3hzt1r+/rT+2JMBlF6tvDwAapbB9zwgvAPnXe/HagN7UorrGSTPSHlT7hhkJE8YiPnTINePvJCAZDVGakilsXi508KBe7Pt5HtwI4prCux9MWdsZ8KpBr+IeRNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKsgPePhAUYu2E7HIONeHzUi4Re8KncIP0xPJaPKuNA=;
 b=ATiECrNVZ2SHzk/GK2UFwn1EMUSJQExt7ghmlqTswua1DhRYQyh/b0Ixh13h0HwSjDcUqdhidEwdZV1V94zs4Ru5apmsa2Uqa2U0k3jzRT+bdt1kdgWNFWDBsWgsomkuaMGqsxkG2Yi7nJ/+fAyS1LalatgAlUPMIvzq5R4K60QfV12DSTI9Qu0zGI6dIJKp2vGcV13nIzwtmBTgSDJ238TURtJcXUn0TNyII8Ygmmgx4adg5Q+Gwb2lIKApT/rmp/Ls2cqDu92pBT+MdlJs/Anqxc/Wmi35O7DG25kOEWZ1+bFbAF6xN718w/7CAi7+3IbF9PUCKzgnGU5UKr10nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Mon, 18 Aug
 2025 20:45:17 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:45:17 +0000
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
Subject: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Mon, 18 Aug 2025 15:44:16 -0500
Message-ID: <20250818204420.794554-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: a54397af-80ca-4933-d268-08ddde98237d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bwAtgC2WAwvPtLrvvl6nxLM+wRJqwJUCK0pGfzEVRvmIDgw3JWZGwUblDmxQ?=
 =?us-ascii?Q?XXxta7zC0FE1x88LXR41m8Ix3KneFtT0X2gw39F7rwbdkJgsKAvcw0Y7encT?=
 =?us-ascii?Q?ApicLuq65eqRar9tLpOFAzG3+bG6i7o1kei1PW4Is0b+3ppWnUZg8vriWKEW?=
 =?us-ascii?Q?Oi1TiTrHc3euA4Ig5vd+3PBlITrp7IUSCJVKhIgWqHSXqBjJfidnaFGuYFDE?=
 =?us-ascii?Q?Bjk5XUfQnucn99JyAuP9CuPiaB2yM/E5225kZecjHyjAp96eSbKYtuhT0Axx?=
 =?us-ascii?Q?jQ1gJzOlX5V3wmReit26eaixeQaHFUpj8rZy0pWDfzB1KVqrMIsk+lxM8tUK?=
 =?us-ascii?Q?4tZy+0iSIoC1TfBftxjJBriGZ1SqJRrjT7IpCIl0y/nW8Se/C9bUy+NTl5Fh?=
 =?us-ascii?Q?JvXYL5zpEj5l87rK71oU8Yl/LRpNFQRU8CAAi77bToSTLUpYj627vfGaBW/N?=
 =?us-ascii?Q?k8dnu/01X+e4TkGCTFUvh0sz91/ueLyPA+VXvak5EqvekFyJ1drQ9imR4Irg?=
 =?us-ascii?Q?olpu4eafHHQ/wXMMPUvce5ZLHGGC6NBTCkH2PH2NmPuR0Z4jM2uQxIukyvjn?=
 =?us-ascii?Q?NEGgWiuZnkqj0iPS5Vc1mwPm7Id2/V2pfkx60+Mv6V96rFWfdVHPVwm02nNR?=
 =?us-ascii?Q?920Gev9yXq9Nn/gS4LSwKZBcTnrbaLY4ilCTAsawuE8tTCJ14gG9n+8yvtpS?=
 =?us-ascii?Q?s774/MapvZzuMtKl5meZf6hTG/Vxv7WezgZChYkCACujJQUrH5HhGh+LyR53?=
 =?us-ascii?Q?spZGyPL5YqaRsCnxWDoAUYOWXqfGALYquUIfcVDhyjopMYnbZQE+ESAd6v0m?=
 =?us-ascii?Q?AUiYI7BA9ZgHeoga5YpSujYsz7MgJsKjxR5oYaS/5hncrOXWIFN2+bQkzMQ9?=
 =?us-ascii?Q?FXyOmDTeNDoXIpyRoELloBoa7H1q+skVAWjRRqxlYMCOraWowDWsADx0GDiO?=
 =?us-ascii?Q?BwAtVsp68TmEVDnZGD7jYC4tzbsa+i132FAH+X53wGkjqvUey4MI7Rm3+HVw?=
 =?us-ascii?Q?IY9l+LM+Tvj5IRMgojL3THWDkoavosiTyU4HG4SJ7FsJVx/cnJGc6LXoAX9y?=
 =?us-ascii?Q?/sx9XUZhD5ZhZA5dJ5k00xnVvO7s1Pmht5Mjg+K4kGZizWyOXEGraq7L5ed2?=
 =?us-ascii?Q?a4/SpYx7/XRu67+xr8ippYzfMKa7zxbIWDNZibrQsEmcQ136w6FMenFVBYFj?=
 =?us-ascii?Q?FmdV5LX16o4PTLyS/39GEmkDjnY/z/G6x9eQ0VGpLnC6XMOSYvtJGOHDEsfz?=
 =?us-ascii?Q?fYxwbRHI+w3/zvFvtU6aBwd4mu2dd08G2dEqZWCLgQt8vvGg9p9p2xxMWR89?=
 =?us-ascii?Q?X+N/4L2OUxlj9+LhEa3LTbG/j9b0oBxlDLFQOlNkKkrCjjBduh9LQHOZa3L9?=
 =?us-ascii?Q?0JLxVHOo3e33jjBocfITvz7Gibcf/bIa/Cgx0q31nb33a3EZUnD5hIl9l+rP?=
 =?us-ascii?Q?4CNf0d7WIekTGMY3fSZ++QO3VMtYucSNp2xMmTL/0zg3zndrt2Sj1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/scmr7qtJ0hEIzpayoK9X4orQ76z2ruL5sqUgN/SrxAgUzJeWF/2ovBOiods?=
 =?us-ascii?Q?XkKmhvPY5TwDl+XbAS3j1LS0Juv7sy7vRVzymm5AtGf8+wulj/9eml5c3Zm9?=
 =?us-ascii?Q?2Igrid0ivH4tqcYFTzpN57usbg6LXeLSyvtpn6JwrfogHzbW40ZHeeXcPjFy?=
 =?us-ascii?Q?JtEJINHD9nYysBkPkRoBV4z4tWnQQvVM0gaEFU8OkCl3FPoSbsvsrzXGRo9z?=
 =?us-ascii?Q?RRuxXW8q+sSxnyogu80jJdAFKp+lgi+lEC5M3pZ9qTQKZNBNtP9soUIQ/BHp?=
 =?us-ascii?Q?uqAZc+iNXeYpnc6NxVBHBROc6rHiAH/8FENltRsFyIoXMY1S+yOLJM2dkhOO?=
 =?us-ascii?Q?sDb5Ktg2G3K/3wdeBPwhLAN6lnLpD9OmLLrriEhSyyMhCFrxy9Hu2jWnnyfo?=
 =?us-ascii?Q?03fCSjNRgURDUFllMtkd8iYcsi8Xjqo6C9dkkO4skt+9lW014CcZrTy4wMHV?=
 =?us-ascii?Q?UihgBxvEFFqCCSE9wk+RKz4gEVwzgAtcay9QgDINHr8+bTB9WZmRx7V6RNRf?=
 =?us-ascii?Q?vUsPeBpmVQhj9YWBWrG6HaoGpdizU2AuWjZrU4xQelyRk0VnEr/x4MQ9OKK3?=
 =?us-ascii?Q?97oPal45N2ZwF7PuuuUzTxtoHdBMCP904frbL7Mmi3eji8h3O4+ZeZsMfnku?=
 =?us-ascii?Q?7TnwOV99vCQBbnbH5slASbE2dOcDZwFzMtyAjNzncBYRcXDour6zAAYSiPhv?=
 =?us-ascii?Q?aP3JBd24iPudle6S4Y+6C0Gf2hWQKevoFXHLwICZ2DeXj5cfGBKp/xcgHdTq?=
 =?us-ascii?Q?SqSBvkAVVdMGlWiZry9kW3Hp0a/YodLQCFHYBMVbdqzpgWWhP0HYCoXF4ocb?=
 =?us-ascii?Q?0wh3HffC1EC8ESQThwwz6IKdh41lZdauJYvwjTC1qTxl79iUGMGpmgjJ67ZK?=
 =?us-ascii?Q?SzRI74iKM1/fbqy82N8oBJiYiuKtDXDywtelFz59kpmLzAYuN1ijWUSp8HlK?=
 =?us-ascii?Q?iJr/yKZPBYz6pvgvdvOvLB1GYqEViTgiWNvG1YH3A6ZZ5KLHa3xHvhtGzxug?=
 =?us-ascii?Q?jHkqaun63DflDEoxhaqKf6RJ7UKz3wlv6NMdRVheGegdiuhMXR8HaAK8DoTH?=
 =?us-ascii?Q?CaueyRwjnTxEz9/sal/1yyQaZqSCD3nnNKovhNI8jbkW5aIto17NtpKl4jMd?=
 =?us-ascii?Q?i491ReGFGz2P32WQdLNIpO2i97OQv4O/lbYoaqjtOkOdMreaS5HvT7qchxdI?=
 =?us-ascii?Q?sZQr2JJRf+U2aKWvK/zANaxArsDpxXq+WDb8GlsaNHpOHJToQLUfkY+QzLXY?=
 =?us-ascii?Q?JqkW1DD+eor7rJOMRqULbbLMgrplH0uKSZ9fSOROFRA8Y2l/phimaB6NgmFI?=
 =?us-ascii?Q?v/jghoGvyIUMKZLPzEkK+APRpy1pNZx5YvNn9T5akI3TaAId8o2zoVUusxpB?=
 =?us-ascii?Q?+oXXGZiW7PNY72nEm7jFNh45YM89fdDkk6zfZxKdfnQIvpdzm9BlldVcBW2p?=
 =?us-ascii?Q?hULCO74+7/R+NBKFQc5mwC13wAUw1yqw3EcTrya1ijkbi/qIWteN+MIOdzJY?=
 =?us-ascii?Q?CN/pHi0zLFzHHUAhtGs/kA3Fpbl8NolLYkABuXDAlFRUUJeV9PyNHnpe2ENB?=
 =?us-ascii?Q?S/5RxtZDdofyulB+1LTNTGmpHGl8TssU4dduzrKn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54397af-80ca-4933-d268-08ddde98237d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:17.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtSdRyeXfESRA4ySAuYfEdFO6/YGllmWUBLhvHQKXHFB8wOeYld9cW0UzgT189HfZySXtSp+JFoHk1RwXN9j1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

The expected DTS layout structure is following:

    cm33: remoteproc-cm33 {
             compatible = "fsl,imx8ulp-cm33";

             rpmsg {
                     rpmsg-io-channel {
                             gpio@0 {
                                     compatible = "fsl,imx-rpmsg-gpio";
                                     reg = <0>;
                             };

                             gpio@1 {
                                     compatible = "fsl,imx-rpmsg-gpio";
                                     reg = <1>;
                             };

                             ...
                     };

                     rpmsg-i2c-channel {
                             i2c@0 {
                                     compatible = "fsl,imx-rpmsg-i2c";
                                     reg = <0>;
                             };
                     };

                     ...
             };
     };


Shenwei Wang (4):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  gpio: imx-rpmsg: add imx-rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c                 | 559 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 125 ++++
 include/linux/imx_rpmsg.h                     |  55 ++
 7 files changed, 895 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
 create mode 100644 include/linux/imx_rpmsg.h

--
2.43.0

