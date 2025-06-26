Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A32EF9A6;
	Thu, 26 Jun 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963541; cv=fail; b=B7PxjxwcNXG+OsGw3f2oKm4h1N5aS9BCDmpe5q6abdsTn+VL2Fs01fCsbUGMJc+GcAIsaspWM5beBIUMuL7fZYxhaxbFOZSZ0HRwnirrY0o3XDwQ5SaLMZDROro+GfWUIkNLYBXA1nI0uLXyryWWvYDzoT346N61qPBsZiNL4NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963541; c=relaxed/simple;
	bh=oaunJsy4Pnlbl/6K2XBGZItFY3OEqCFOrQTYzMduOws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A+rAxg/CuOUCQfcQ7qIjtG7eur0k6xWzGLegrkcaoo1zSL+NcB6eInb8E3ZS7SfR7nOn4yFex8xU5KPeaCoZUQT5UyduWqijOidK7d9dW/uu1QP6xnjNICCX0qg2rQKecb6iU5itX+Lib4m+zFp6wlUtVQTTr6TFNF6hr5Z1HWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vj3TOBNU; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vj3TOBNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvyQe3aQ+JnHQPJCawpxkBh024Y1cTkJXF3ML7Dmmq8XZ6OxIBRmXQxK++sbpWrl9HsH5wJ+OBucCd1qT/ei0j/8epKt8RLM5jLc1Nd+5G7TbYlfBsSL9pvWGqhT4tdxZWwmIjVpNW4tMteX7rjQfx1imu4HiuYQKscWcBtNOq4xIbraeakJ0BOr9N8RANeaqi0vzwFTfUYoe/FhJzSn7yWgTS17BCTMX6ypCE0K2gIl1kmmRMyWgQy/OCFTaeKTMIzZ6X1AFIHmgE+Mv+85NNEhUKk8xxfP9/+hg8pLBxqOTnh/rph6l19fTMJeJJ+nFVT3KNKp7dK1S6X98JZgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoXErAzFhFVnyl3pMEV2rBUpahnFUBo0mjPpPPJQUoE=;
 b=U7QNYvfGWFGGBWB0D3jljW4bAaRttQA8WQRLW5yG0vOQsA4zz3SxXGERfMeetuem35BygQ6QbFVASGcHRnDcIBwzt6p7xuyNau3QT4zPLZfK+D6VHl6zeuzIhh8KKQyXFxl2ojuYdfZunOnjaSci5OJJnpdp7jKjamFrtzlragFCIzDhkAmrGE8S3MAvH3kR9CNFkdLYvQJUONxohsv74UlYiMah4hvtdKOo8V9/ulnEMsGT9tLNtdx36JQp3JeDoZH9p9BIjJM42lreMswSYOuXfzcuqMBZr64d7YXNDtWesAL9hn0pevu7cqwziC4QaBhEIPXjoVgSn5lKgVc/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoXErAzFhFVnyl3pMEV2rBUpahnFUBo0mjPpPPJQUoE=;
 b=Vj3TOBNU2M0VMIR6YOpsQkQDKJ74uooWhFufsxu8E6BcxJzdG+/DuCiBotdxRkNDOhidbm0keMC8W1pJcFsd6e7csgx8p+Ol7R89te5IZ9Z1rcHucmPOvDibqafRTT1jAq+mlyoRgdb2ZRWVvVCftzpS74VJXW9DrnoOhIONjlhJpRDvQF0jg70ZcQzejCCw0bTvbPG+UbmV5y5Mxw3p25O/6Fs0bOWCKx2UnX0R8ItPMksBZkh6lSlERtVDJpMNJ+tDKiK6QuZrgsdJjbuiQIVk6oXiwKAv+CkbiVoFs4hq79K6IUmMBkYFuJyIBHP/Pb4ayNWdKaRoQk+dqRLS1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 18:45:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 18:45:37 +0000
Date: Thu, 26 Jun 2025 14:45:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Message-ID: <aF2VS3byLWo9fEKM@lizhi-Precision-Tower-5810>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a38564-6da6-4b3a-85d1-08ddb4e1a3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?31azA6WyvMzUdaCW799CdU+Aa0wVZfwXe66AXwNcjVULmRxupngVNSLfqmU9?=
 =?us-ascii?Q?LF7phNk0sY915V3df3Sz5EeKx4r4LnJCwqTtYcg+DnGrcKn6fNZGP64RpI6l?=
 =?us-ascii?Q?ONtV76EoGrYgA15b17/0pRuFd0ZRz4iU/ypAGJfKzWa7ch7cSHsdp4DZLgZD?=
 =?us-ascii?Q?nJrGBT5+Aj+nvqihbHYY8BWLPjN7ZV3U+Xrbc4I7dfRatCT5ZhVoag/7EkDL?=
 =?us-ascii?Q?V9PNAHyXqOO/7RGR9dCagEIc2Z0S9fiMdpc5myh6/wq3EUjTloYhOSvQUB+Y?=
 =?us-ascii?Q?W5pvhruM0nEAqfbHk0tFhLYFs1vCLqVB3rMbwZXuPm89yi2MW05xEBHh+FUE?=
 =?us-ascii?Q?g5M8TOsWgWuMk2nkjqTFGa9tZym89i0ZdDySYnV7J5Nri6mg+ZvhFvrWy9Ze?=
 =?us-ascii?Q?W4Cz5W7oOZGjD4L4jg35SObGULm+KxmJoTREfQJ4njATbsj2is33rmGANNJS?=
 =?us-ascii?Q?3UAgFicvQkpoK60BGL9QSsMT+XgGNN6c8zqqDAamK2hvgA6QEq2j5Xpc6SaE?=
 =?us-ascii?Q?lQDeM0f1WEf41Ym+y2GueLt8ZmUWQDeakOphbuiN1NFAU/1N9v42aT2vHn42?=
 =?us-ascii?Q?JW3V7hn1GSx1ScpMIS9lyb7Z3gbmPXnUSAB6YXOceIN/lMQ61RJU/+AIQNxr?=
 =?us-ascii?Q?0nlP3Gkx+LbRsPoCkw0JvA2Y3K3VRfCGboaA6SYMkLnj++OtUz3wfoYle9r/?=
 =?us-ascii?Q?ouHStknOdLE3CVJYhGYlik/zE6ISJcWrFWaSMrRgJTjcSS6A9irT+PGVuB/+?=
 =?us-ascii?Q?MplcSEclvow5ewNt2zDEEtr8U4UFCqlfxYZKwDODcwFxbjeFCF3ZxQ+1vxAq?=
 =?us-ascii?Q?PLS/2gCBRyBJmPXJILr8p/yWiRUp4iq2NFmT3dzmUDPgrLsCFSQNbFGjxoMs?=
 =?us-ascii?Q?/ZxRzUbzu/ucDQ7471onkQZAgfkd1t/sTq2la/VYW2kdsQsl0NayYHb7kfbK?=
 =?us-ascii?Q?4g9hYFm4xQ04puls97cUU66s20Q/AgBkzqBKKM65NgQ1PMHJzw6iqKZPrY1T?=
 =?us-ascii?Q?LD8b1pofiupFfwxlm+LLTb7f1NTu4TxxfuKLcefOQWPOuInCr9IP70I6h/hE?=
 =?us-ascii?Q?lLwts0ngD3k+LqS7btjvqB8NbtjwOeB1MdMBf08rLnms1SlcgZHOyRA5U0uU?=
 =?us-ascii?Q?dbER7BHK2GtxvUmQaivkTQ0V9k0OTWC8MifeRpg0906iWk8qsgCtHaEFC31+?=
 =?us-ascii?Q?Eg7KCreKUQV3DT9fx96GStbtjpqd4oR4sITdI7u7yDdvNRTspRPnjtIPtmrB?=
 =?us-ascii?Q?gKaAu0WAyQpx6ovxh7iHmdmYIycEZlHBKfSR8Bi4RjAyxFgeFjHYSQB6RhUH?=
 =?us-ascii?Q?avxk07FP6S6kgaNAfvp0DIgkjc8q5h87+++FbJwVmZpSEqieFCmQgM/rnTPi?=
 =?us-ascii?Q?wC7l1Sap653nBb17CiC/oDWRKykFT5kAQUshrcQjmMDKYZS0ZNy3TfSpC7fI?=
 =?us-ascii?Q?s66i10e9NqSvrhPuBTD4zSy8CP/aiiMqx2sY7tCr9f/13uvGPDSzIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y7hrRBKvL5GF+wtqKhbyrFjF8pWz9p8TwceQG21PNNMlgGfmqgYKjh/yMgCw?=
 =?us-ascii?Q?jyYDBwVp10rajET+Ffe+7U9eXjYUshOnmID6//nypH6f3urfNqWq1cc2urXZ?=
 =?us-ascii?Q?7KONk4HcbEhh1V5XcvkQI2LmOYQMQRZ7h3ube5lIMvTHMtq/Uo2KY2sqV6zq?=
 =?us-ascii?Q?fSIz++DZmov1S9scuE2Rb1+zpAUD+9mGuKInB03b2s6M/zuPWtcN72nQx6pP?=
 =?us-ascii?Q?HcgdyXPVnGKBpY1QxaV4UlUBiU9RlOZD2AgPkoHeC96DQrD5BG1Stnc81G7a?=
 =?us-ascii?Q?8R/ANuCkDWgv+v7fcziZ/8zR3vZYJop74hVK1H4ScLYViOlI5Wx2kbsDtzVu?=
 =?us-ascii?Q?9pcupTU8NkfuudgThsdIFrrsR6u7auQ44eVqGAvKm8xMUpT/bH9lru2n733X?=
 =?us-ascii?Q?Cff0U8sE8Y+Q4/IVehHoCBcBDOSlKETkdJ877dP9y4hr+E+nll+JyaXE1TPT?=
 =?us-ascii?Q?k+KaWTZCFGcB0hAcuArb/efk5qcnX5lvJoj3uQcDXx+ybinhvLpxXlgprh4w?=
 =?us-ascii?Q?NM/uPG0+QdmWY/nBNy3fxIIPeXc3b4ZsamQ6+okreaUkafNTOltFUnGQp8Z/?=
 =?us-ascii?Q?gX/ArFV0XupdUTQdFYEPsyTMltdg2CLW5xR4501zhwRVhpRqmHmr/DeZKM1B?=
 =?us-ascii?Q?/S04ni6maCVh8iOmeZJS0lSS1cVKHIJ6AgjrY27Sc90vuFCYmEhp/9xA1DIW?=
 =?us-ascii?Q?VMzRK6YvISt78jQFWZWBgzpiEyM83sEsqtx4b0u8aMVBoegiEUZ8GfP4XIOo?=
 =?us-ascii?Q?VSud6uR3oaSVd3RPiTl5OWmAU7iA+s1ACPge4BupEvpWV0CIPmTAoPtzgwyP?=
 =?us-ascii?Q?bmXiJvXL01eATLTiOg1RQBj/tgBOwQJKTsLKyLuTQhTbZKRRjSUTYQsVaVI+?=
 =?us-ascii?Q?3ObsP7Ar/B9hPmk8O4WX7DXTLKxCf9r2LBxG03CTBItmPKdb8CT6PAOtdJ1p?=
 =?us-ascii?Q?UezMLuMcoTxGAsoGPsvl5xaebQtacxUofPGsoH0jXKmoSVK3G0l7i63ruZw/?=
 =?us-ascii?Q?D1W8FvmqxoRz93cftFXXQPc4xIkD6yClajfOlUW6rVWxfRHeF2APU13zjmeu?=
 =?us-ascii?Q?o0YxZkOKA+WBdqIvt24Fsn8HAR6M4Psb+o1rVdZeKs0Sa4xu1Fqb/syaBaVt?=
 =?us-ascii?Q?QgMiOpuxT11C7hZKZzZCbkXbMA9ZS/kL8ekFl0YRGFPALFF0WI3W3iTkdOlz?=
 =?us-ascii?Q?oC78OaXGbnrIHdBaxOe65o+uaGVLgVOrApDgw5C/WeFU6ZL3pQ9vCOtxzGNR?=
 =?us-ascii?Q?K/smSxZRESUbEL+Yd7ccKzKSu5aAPagHqux8TW+LsdaCX//Zrq8QRGzCOqq3?=
 =?us-ascii?Q?33IMkQYIHU/cQLl3uIQOvMF719MCTb6VDJCc1zRCaLCHCr/0Q6z8TiuIFpP4?=
 =?us-ascii?Q?JNsqmh9CE0JceZ+bXldQxaSlMj3r4PHZWKxgTFE+y78IEKkpvqU34Gf2+16L?=
 =?us-ascii?Q?m/5TJWTq+qXE0yeSXZhx44d2J38ERqDKizCcUS00W0WDHGh1vhRI9ifFgt2q?=
 =?us-ascii?Q?jcICSntNp8yq0E+aqQHtNwfNRUD8ewyPO5Ajbpf/TrVoMqELKXqJukfmixbD?=
 =?us-ascii?Q?9Bhg3xUfsxD7zJolQisTRfnkZJ13jNeSXPOrO9mk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a38564-6da6-4b3a-85d1-08ddb4e1a3f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:45:37.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH4aRbfpBbI1YniCJs6K2cEW7rfWlRi2kRSE8Ef/bvbIhWWi4pXof6BdI9s3Z3fRvEKSc9znTV2Gp3YTCHmdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445

On Wed, Jun 25, 2025 at 10:23:27AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add compatible string for the Cortex-M7 core in i.MX95
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,7 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7
>
>    clocks:
>      maxItems: 1
>
> --
> 2.37.1
>
