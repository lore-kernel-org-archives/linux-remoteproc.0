Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F434DCE1;
	Thu,  6 Nov 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445449; cv=fail; b=ibWEphpIfPYRKxEtTJVUUDcJx4kYfPpp/6AWdX7Y0ZrGVFlZJDrG8HgJZv7vAZ+cVK4eVYBVYXk/crkItBX6so+x4EdEDCe+nPPBDQSjKkXhEERbTCBkAI9Jmfh7csRX35Ch7tXfW9p2Ldu5LYQunnAKIOp6R1FWkmHmIIUekjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445449; c=relaxed/simple;
	bh=s7f/DC2ok1H25tyyA0bT/tk3mGL/MbXpAw2hTI4BFwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sODbWBgGlfKnqhbUP3cCzgV/U0NiNgGtIHagQcz/4puvhCHhdPjflnVeH89hcVS46buIllpsZ+6GU6v2+70w14zqG1sXD8aSkDqsWB+O37Fkijxw14bhg88bw74Y7mwcN62/t+8IfIdY+QTcsYJK2WktqL5BkFZ9NJ+N4/ZKhik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nNorho7L; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nNorho7L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi6Z0F+xABx2cjHr32tDMoNXT0WGlAyf5sxl5ZVMwJUC5pcRs/Vy4ihqhokPpfE3ZkTcy89v5d6m0/2HZUczm77XZfk7mC9QZ3PacOUeEg8k/mKB/TwDq02lP60t5hwD0upW7w52BgD9wg/bJtuenprTIzP7RE+lWj4hYRxCOocbs53qNWW6Ul6/OJOMOc4mNy5xjbNHVbodBKA/PRoOnpxQj68ojaG+VuJscLaVSOMQGspvbGBAcmPp/ibvY9m0krCWLS6uZDsnMLbCBuDFBxt1pQl8ATX+rfi6pihk1+aNq1wxm/UgZTDGxDjI/Gnblt30E8wgBtnywjAaMHelKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRQsXifAT2jLWuA0KnRaCBqnLCJV8ruoD9qRC600qvo=;
 b=PCaqCISb03B0zsnl2VouYdVMpZlZhP98PvctCGFb7P8g7gtEkf5jm7rqWz6YaPjvonnbahwbrDJv6KwGWU9AbvlzhdnxHwBvIFXnjYoRJ+H+FTOmF88RdG1avVmttC6YHC0yDy2SGO5bf+Yvud0TlYNo5KuMUo5ZtZ4FLNEikSKU5WFWZMQ23/Iz9snIh60SXO/6HnwUYGYSyo/2v1YkY2MDn3Pb155c4Vj2Ev6M+bEpEZXJ3mOPmKwRRcm0eVSpZ8Tzea1fno0b5dwQxx7o7/oQaz/3wp3A/SXTlf0j233XzU9OMiMUP6xzL8sVOdtPJFtF3jouUsDL7px6BgsnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRQsXifAT2jLWuA0KnRaCBqnLCJV8ruoD9qRC600qvo=;
 b=nNorho7L/Oj/sn59E7HisOb2eIpBOwU2VBYuiffzN3xty3cz1JZSy9nInLCBs3lr//CLKbPyU6lXRmdiAh8tvQLmUvQkSHYg6I5Ks55wbNi55fq/UgK7FunechJ3mOYbwBNOqJrBCKf0+FLa+NyHrhweAq4B3yveGOwmWZ/VY/y0Di3jBAbFwT/qfxTfqDY8lAz9zufEGvDGqLgL+moVmmUo60GNmN2Wk3RWxY7SzRJi7LARyb69b3hc5GgeAG+4B7XEoRQrJcggwJWqHR9J8C9Iyu5yAWu49VI1KBSu9ayLjVTtyQP89a3Gk1yJjpL0gpl8jhY43VMNj9PbjMrWug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV2PR04MB11304.eurprd04.prod.outlook.com (2603:10a6:150:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 16:10:43 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 16:10:43 +0000
Date: Thu, 6 Nov 2025 11:10:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Message-ID: <aQzIeh1bb+LieDzl@lizhi-Precision-Tower-5810>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
 <20251106-imx-dsp-2025-11-06-v1-6-46028bc3459a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-6-46028bc3459a@nxp.com>
X-ClientProxiedBy: PH1PEPF0001330C.namprd07.prod.outlook.com
 (2603:10b6:518:1::1b) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV2PR04MB11304:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dc1456-95fd-4276-81d7-08de1d4f09b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/NiiOtgQcxrr5EPRgWfRuc2UJi6eEgqUtCcaDGvde6C0FABFEySRb7EEO6w?=
 =?us-ascii?Q?QewYVvlE8o/MIZv6GGu3X3I+nQzXi+a+GnwIoh0/5zPeCxgBztlTOk2TehT9?=
 =?us-ascii?Q?n5rciJ7p/ToITZtzak/Bv4tVc+Nr1a20xe6CUp8O8JMP6KTASIO4HuiNMivy?=
 =?us-ascii?Q?fviH7ae9D8Kw/B1zxa1fN+DBANGQunRYyZQAUcnCi+KnQ7RQCYH3yFIz2YJy?=
 =?us-ascii?Q?i7Jv2+SzW0Mr0p+QYA+tta6GXI49F2WmKT1k/FQt31Qg4ZukNkc/qzpgxi5i?=
 =?us-ascii?Q?b2Wv4L6MwVnHkVwMUEsbV/h86MWjRoq3KlB70K4rrgd/4MvEF0xEXBOM5vdl?=
 =?us-ascii?Q?BsRtNYDJp+2NXbvTjQSeLGQMJTywbgrPZKu2ePd8i82BtekXv7k9ruOuhOgS?=
 =?us-ascii?Q?0n1IaDGRXknFz+fcZtIfNdwQh8SWY4lIYpdBaFa5fK2knCe2AnbTdw0FkR5a?=
 =?us-ascii?Q?+/w0JubXbjnS4C6EETcNKl1WMMmZ2coV86UOCBglWRcGyoQEz8yLpHujpUea?=
 =?us-ascii?Q?HOyX6Qe86Oy797cjYadjXUc8bZfvSrTmWcn4HzW8I/x1e34mfTcZ3wmS1xBs?=
 =?us-ascii?Q?0KiUJwBfb+bB4h0DYeXI0cU/YdKdtAP0K2+ERq+HtAJqw99R6oLlzJdHxUNF?=
 =?us-ascii?Q?x3z60bXtCg/P+aQq43j1uVCmOmE/1ZNAiqwrKjjgkDvEeFjncNNypnuVTav7?=
 =?us-ascii?Q?KHqOR2SdrspJtqPvU6QfqLT8FeQmuhrULSTceNVP0YuI81jgRHh2WTSBuuXV?=
 =?us-ascii?Q?vxhBlIDQRK6a2C7lJcyE0MWnfHvBk86aDBOnIt/2oP+slipptGtI5ug/3U8k?=
 =?us-ascii?Q?wm2QDfApu9Bfn3DaohkUgffHnZin5CzpVDO5XXaKJXywbXw7H2wLr5CrkFkA?=
 =?us-ascii?Q?ub8u6TLZTy6mU9QgMXRdgXugVUdCPZoPglrJj1JWbhCtUG1ppK/gDdul1ihG?=
 =?us-ascii?Q?E/DjJ0FBrguSfcUqw+/vq1Shu3wgzOMgQ0XlooGsu4QpIcx/2T0rHiFH0T9l?=
 =?us-ascii?Q?uW3zPDiczc8/UjJ5ti6QcZzQAA2YroYOmIz5RwUhCL0qfxIjGdb+u0eUX8tc?=
 =?us-ascii?Q?RfkF3j7ATi85kHZ7r3uHR3iF34rXzhOHOStI8602cGbfe8KSPlPEdCIZ32FE?=
 =?us-ascii?Q?llVaYnUyWjiWzIsS6TJijX4ZtbhvbH07Er3ICZcA0+0w8DCaL0mn+WcJ/0Sm?=
 =?us-ascii?Q?AXPAbCxCZAQx5B0dzBlvkldaFuftDa05w1vzxg2XA0KpBlPl02hF9VJ1dkZ9?=
 =?us-ascii?Q?9zNQNj6dBP1MYAQiQ0jH+SvNliELYD6aIY5HAeS3lbng2m8668b7RnjUn27Q?=
 =?us-ascii?Q?t76las/7KQoMwQ0ViMhIxSNe4TmKwZyqtS4fOd4+OnChSHG627Ha+AtNyPzu?=
 =?us-ascii?Q?vMLyHiyP4FqeI6tCtbI1HcQrSlJnVvvGIaZLyqJD1PcoEvJLVCv2aY5cpflC?=
 =?us-ascii?Q?fCcVytKEenDEsy541acVlLj/ufjRsGA0G0NDqqCP1MCi6LiJeK+VTMfV7rNz?=
 =?us-ascii?Q?bw5HOTAduCM2P9TRo9bMLsIOuMF5uCz0Sd2S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QLP2BkUmob8hDnrFmfLEM/4a3lJ5uBatq+1RX1sXUFsLVGlNxWLhoj3ueCRQ?=
 =?us-ascii?Q?zl/yGQ/sIkWrxxkKpt8bB3IGksdx3OkoQOxwlUqCF7jdF0tmbKm8n/W4xSQT?=
 =?us-ascii?Q?olQ1hW2oRp8F3MjArw1UieUi2jW+nHq1dYqIaOo0qKdPsmhZiDoRV0R4cAq2?=
 =?us-ascii?Q?+G1g1Pa5+oJmgX+pIBDlwfiEHTIDSXmkUPbWjqUNXUB/3scaZo/knK6TC1AU?=
 =?us-ascii?Q?4tlA30h3QraUfyn/qlTlnm1Fmj6qzQOu1Um3zf4Va/UjDJvqexB3l6UgqdQJ?=
 =?us-ascii?Q?jx8i3jRCapypdsoSCguyACPYhwD0U9LQzSlUx6oxR6QLR3FYu9JafwLmyqyb?=
 =?us-ascii?Q?pZA0XkGH7Z9kl5XyjOIoCbgmtv5m9ImfHEejUKaxhXNR4lvxkFYub+vYlyhQ?=
 =?us-ascii?Q?MjpO8Q9jxzUYPO7KveeXSPpxiZ8D/E04JAa2e50Spf/w9KlDYYNulkAnk/AC?=
 =?us-ascii?Q?Gp+BJPNyibzUOqSF9tCcu8CBaAswfYphuuoZURCLEby68RwG89TQ0rSqqHwy?=
 =?us-ascii?Q?j0EiIkjAauIIs81lVbnvBUhA/BVq+hP+ZyGMo+sE8FDTDCKNJmjGQ8nYFjbt?=
 =?us-ascii?Q?+QRUJcsTd6CIwpl8FJZO7rdmwUt8lHhWvfuJtBtE0VnhqigtEfGThVyrfzep?=
 =?us-ascii?Q?wqDnP2npV3MYycdBeO5zMhxb4xOdb0nQnlQp1u5zAdS1QUr10ae4CI3qkbwt?=
 =?us-ascii?Q?iTCWTaGCyGUFfi6g44Ffoi4yiBG4rxSfvcWJy6i2pKMDGEQ12GZsr/Gl3NP7?=
 =?us-ascii?Q?F3lFDvlW2NQpnDGsal1Z74sIzVLnFixGgyOUKvOobULHBKUsSkrr61ZdkKEI?=
 =?us-ascii?Q?jBRhs0bB87kyw472R9sJrf9r1wN0KZYOdbq8a4eswP1Wr0gQNFxbpITyUr/L?=
 =?us-ascii?Q?T9dhkRwcf+aMZ3edXOKNVVW9gEE1fptgBB1G2fsET//4dO+HV0Agqb1JKIsN?=
 =?us-ascii?Q?giUxN7bCISspNZ3BJiso2kVP4R6XywCBbySXZ50em0ozDgauiOdQDvX6aikL?=
 =?us-ascii?Q?DYeYiQtpIzOD2iiri5f25hWjPbkLx0PvepqIMlE8CagFpYTNEOQEyTLZlcAh?=
 =?us-ascii?Q?VgSxwYsFxisvspZeJ1bw7EE2waSyHItmXvTRdg8ifrBIVXWpRNW33KrTFbtq?=
 =?us-ascii?Q?H9F8UHLhOFzsetn2rvilFJErqkslgBMWsdoU8Tfumn8JgajcQJVL9NzUJOGN?=
 =?us-ascii?Q?EEo83iQQtit7SJUumGbLhmwxfVbk4ckkStHj3URKsNQlCeYo5SvVgH7QsaIE?=
 =?us-ascii?Q?D/cvYu/FEmEbzyc/MMHPk7kVqHG4pU9+wwXgfnWXZkX8T93CIg7PINa0ox6N?=
 =?us-ascii?Q?PdNxe8h8BnL02SenP5M5uuZXUCsx5wqF+BXbxmjio7tKMkE8mUhkTPbFBqUH?=
 =?us-ascii?Q?Avo3iTqyIIzPVPlaHVgmLnjM/kTonaLa4rZJXknON/ozJnrzBnV4P6oVuhEz?=
 =?us-ascii?Q?lZwvtoPRj8nuifg97FxbERl8ckH4hT0i/KOgaUmiQRpDf+A+OeG8QCmRjCCb?=
 =?us-ascii?Q?IIBUphoT9cKCIzGW3zuNQFVpWhDVW1dTkBD4birGhOkGxqcjg3H9+Ex6W/pb?=
 =?us-ascii?Q?P0v5N3iiZh9sb+jiu98=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dc1456-95fd-4276-81d7-08de1d4f09b6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:10:43.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2B0Jhs7cSCg7vvK/kPnbZ+jUOReGMdQtfv+cJEUfy9jxm5eWtWW3L1FCq1t31a0pw2M8WvrgJLTgXSvHZUJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11304

On Thu, Nov 06, 2025 at 11:30:32AM +0800, Peng Fan wrote:
> Allow each platform to provide its own implementation of start/stop/
> detect_mode operations, and prepare to eliminate the need for multiple
> switch-case statements.
>
> Improve code readability and maintainability by encapsulating
> platform-specific behavior.
>
> No functional changes.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>
> +	if (dcfg->ops && dcfg->ops->start) {
> +		ret = dcfg->ops->start(rproc);
> +		goto start_ret;
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap,
> @@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  	else if (priv->flags & WAIT_FW_READY)
> @@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		return 0;
>  	}
>
> +	if (dcfg->ops && dcfg->ops->stop) {
> +		ret = dcfg->ops->stop(rproc);
> +		goto stop_ret;
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> @@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  {
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = priv->rproc->dev.parent;
>  	struct regmap *regmap;
>  	int ret = 0;
>
> +	if (dcfg->ops && dcfg->ops->detect_mode)
> +		return dcfg->ops->detect_mode(priv->rproc);
> +
>  	switch (dsp_dcfg->dcfg->method) {
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_scu_get_handle(&priv->ipc_handle);
>
> --
> 2.37.1
>
