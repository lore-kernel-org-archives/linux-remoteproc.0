Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33963537E5;
	Fri, 22 May 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472817; cv=fail; b=pqL6TjD9KBgeCnMJ0cVhZ/653i59/QymOo/PSbCHi9Qu8lGyOBdhLVweDbhRPLkgD2kPK6KfOr+hujA3kc2hPfX1ojc0TiiuAsv1Y6zFvCxIi2wlcVV53Q9zAOp7hpkQCz9oLtymqYHz+acx6AJBoORlkB1tlUlg5meMgin7HEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472817; c=relaxed/simple;
	bh=qy8RXCVmTL7hTYeMOfHxaHE9G+s0vL8KI0YdsvhR74E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tWCmea7cEE9bO2Kc/kf/+vQpGq8Oe59qSjQBbtUWzQOeMjWsOQCoTYPy2NNeJpjvmC/1dtCDiV3gPgSi50Wbt20PkL7pLTRK7HFj41IGLdX46T1E2sQQyd0Oh6ww4bHgbGW72gSliU8hEHMcdi9pZYiuYT/Ei/9HFbXVDPhkGik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BeOVLRZi; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BeOVLRZi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1q7gghJQVHdVUUKpjG4q/IxiiA+zPvDopDHWdQJTvyo5L64sDAbRhJPK0MkJCC37RYTzbGaljul89WBvnXqx87QUe26jIiJUifz47OfLK8+Mfsq5YuGQH9zRPmYe2neOb9qJHR+frEAkXJuVy3C0dwewhoKY+MtbiJTshWM3fsCYBsWeMLhocWucWvb4Ng56UemixK79kF2q+m5KbsSFZJifgtmVZsdyBEli9lXedKiQsGhoe3M8lGcH7Yf0lUwyWAr3h1cToC2bstCuQ8bUV4eauvoS2WSVf3eBEvvsnYInRg3PKiZrljm305nircrb/JOPn00gc0k3rSlCpx5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNEOjVzES0rYYSXyj5TslS4hE/GKLlMrmeAgorGcFeQ=;
 b=KXaB46KliehqraTtp3a88KA1HgZgQ6TxR3mFZt+XEiD9DKcPbJGZMKYDz+tqR9zbjq+CAb2iV/XUj0J5IDdnyq4TeasXyXda+DxNOzDHAVtLzUcjtXutKygyG4Q2Rz77aCTPV/nP3hfLtiF3fMOwRyksGMIMaAw+z+SsSOAe3zR7VtYs3rFrT9VkHN+razt2AwSzL7QccsJq22coGeDBRLZEcDpw4Ry/mXbQ72AJH1gEITYShJLFzlSkw7ofSsm8rAFxWsggvxsJbSrjqMBwT64770fdwoJaXrIj6F8Ja83ibtuFZ06SQGL1aFR4jiN2V4+bluDdRDqmcg+JM2MoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNEOjVzES0rYYSXyj5TslS4hE/GKLlMrmeAgorGcFeQ=;
 b=BeOVLRZigmTxYV4vPH5IJiy+mh5z9C41+j3RX0s0s1jcsTIZVRWq6uocKquPQnHQ6pB63RDRBoLTVumUApDDzO/JGJG4CjraMz5qOrXSGzkje4DlvPwfLmifZVVYbjrsghNOhsBu6PlRXp7OCO3bSfU4izGo6HkpZ4GwDZOqQPg5On3vdEDP778o/wvzk1HHW47xrHHPMIzaxXbmk4rnux70pktjQ/QBCkg2cBUR3/le/LEsxiVfsI4Z6BnuKejJxZwm0kwchQ2RnSieH1Vq8XsyeSeEy1JPs2LuTwhqQLlQDqFGlH1phkDpFy07jIHqbqL6Mt9g+3IYSAuuFFMDVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:00:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:00:10 +0000
Date: Fri, 22 May 2026 14:00:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <ahCZonHSLyHH6q67@lizhi-Precision-Tower-5810>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd381dd-92fa-4fcf-bca2-08deb82bf732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6untASrq2si1VGch9NhSzM2FvAksYDoQ/b8RumEXx3MFlDpkXfLPp50dZiBDQPMr/zyGl/w8cTm+XXp+dLvQ36f0b0XLt/VGVQ+Au0NSUtDIw7ulUWciAo8vF3xuWC2D6avHGBCrsgcDQ8KJYUx2CC09y92GbKxLu4ygi2kLtQ5aSP7AM1p9lKeDqHEqENkvSKs10MdeuuB9MJI4yOfIJlcAg0VI/NDSOm71WeXzrPNdKJnOttU6BvfzLFljIo5bp6NhdHbkYj2WD8fRQemGVJVw2cjEnFfzcILSEr9QWWO1o8R5t5UTm3ZoFGIGXbxmcqybEOyJL1Mr4YztEJtW1VDO6MhZyuFK+2Vxxry5YWDgBKS+8TIFCqwEyINgoeiBCKd7ziDKh5/J1p/ooRli0RgGiXUwNn4/xK+zkNzehbWL9F6fQLRIWPxPY7lxjGL//KsHBcfibXAyMGwBw7MauuE462jrmUxrubAm7bAB593EQI7h7EQYcjHZhcEpxixtsYukcnZwEsBu7Sm0I1g3wDaVAicNLgbuQTrreHA+g+pBZstH0nQM6eDfA5Yry4Xj+dD/qMJaCbdW0thx5mFdWkNavDVRPYl0ohOnwLSj62rJeeNeJZzOy8rOkfy63SoJjD/C6tMvPslFn821xAfrx4LrUUyM5XCls7JK69udexlkTWCKb0bj6FC6aiDku//6P/CCeDNLTfIGkNK4uWvqt1d0ybmU4gNcIRJ7yl1neZ9XFgXqV+L7IcOewRaKbGqW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tqH1RQOkGtXdbnh6AgwmM2VdrnKP8rY43cpku7N2kAcqIEO1f8B2zN125MpX?=
 =?us-ascii?Q?xaPG2B9FiAL+lIOFSF1V2ZG3CIDd3mrqv07LfEmy+EvZx/+z0zT/UoyF5Z4y?=
 =?us-ascii?Q?Qq1HYR83dCojSIBcaRGA9NK/lnuehfn+gABDJM7G7OtHLucHGQ4Vjqa0GrkS?=
 =?us-ascii?Q?h5An2wi0sRmtQJLE5W4YmURaBpZhp5N/W/oAJaVLqMMPOAhlygWvDHp6eLWT?=
 =?us-ascii?Q?okf3DwHEalsUh+Mp1tae1MEDP2KfiwhnQ30/1oqm6wypByyhfOhYeLhIEWee?=
 =?us-ascii?Q?UqLJZvk4zJ6OLW/BiAq0ouR4yCpU+pZBw8/TaNF0j/ju/hM16lX0gbVX2ynl?=
 =?us-ascii?Q?yMcf+BLsUgpUlu6Wl4HI/TKvQQaHRLcLJjkvJTiPkvnSI10bcEhLfbhsQBS9?=
 =?us-ascii?Q?icFls9Z1PTN9YEruRwBC3QK70tIGXGjSFbJNeWQ63GZvDdEflKwKMouwSzYQ?=
 =?us-ascii?Q?fv8HPWYEyKJP5P/x6Kueav6pOEiawLOevW2z5CkGyPM7uWXLurtn/BQPSN2M?=
 =?us-ascii?Q?GhVFUE+zh3iapqC7fsvUbY45VJpprhcFDhYiH/OZJXD8UYMnhFEMDBTnf2P0?=
 =?us-ascii?Q?nJS8o+wqCvRqFsYU64/qtw4CfTUklB0/PDwFK1zDr3Ywh4XPf2+OXt+6BX93?=
 =?us-ascii?Q?H+wUS6Xw6Gblw7Hc71C8x54BS0EQjK5VXlJRUWt0UgLV8FIEfLLzl22tP3PZ?=
 =?us-ascii?Q?H9UL+k09kLXVuEGY514gwkrjsgGjNLarsNneIgBLF/gyapv/Y4dhiaw6y8zL?=
 =?us-ascii?Q?FF/d/SDqKQbHpEJMhV0xn3qxi5kesUkse14y1CbreaFoFCwZUcrMLNc+Lped?=
 =?us-ascii?Q?ymVVIMelMR8jhmdkcr0E2BrwS3d1k589ONF834IAi0GuPcwfJnB819mbJzk3?=
 =?us-ascii?Q?jGRpfnoo1mg2XXYZhhxvndq5XsWR/xTTiXjGVj4yjJi0rsnJxpzPsN+ODbF+?=
 =?us-ascii?Q?NVzMDZH25Z2mgANVV7I5M+liXM2De7OsYsUvVkOeFhJkq9YgIPl0CZEPHC+y?=
 =?us-ascii?Q?NJ70GLqzj6L7h9i0HLhpdRJoqY4E24gOs4JEFI+HxSeGzHyRJoeO1K1YgRLE?=
 =?us-ascii?Q?2pGwkAxh5x9xynlUU9Ux9aj+3rgXa4qmZJwyJvblGTwHPb5/gyygmOytfqfj?=
 =?us-ascii?Q?tNI+/NNWuhmjKbH5hzHuII70Me7+htzFD4UuojEPlhVGu+9tfNhLNdK2E+Mn?=
 =?us-ascii?Q?uWxCR8gAvbgnDQCzlGir5QK4xScwlpEP6rOpVSaby87Aof8sQJfNBkK/uE9M?=
 =?us-ascii?Q?CYQa4WVtaOs4Q+fKZD9xxUch3i62BGtt4xajrS9iAIzAL84BOF9e6fqEga/q?=
 =?us-ascii?Q?GcteXd/tZxLNTPCgLGjfrmEcKqrx/yWvpndRn/UJ+magQ4SFhRJUqwQ/peqp?=
 =?us-ascii?Q?bZ0Lge4boiTKw5S85tKvHKt0bUDFbVetdYaVX5oijJDnL9WD5hrAF9Wlshtr?=
 =?us-ascii?Q?XLxbPRWWU1Xpv7lH56o44Qr/AUj1Y72yTqbK0D/SSJRG0BmHPhvlw4tII2w1?=
 =?us-ascii?Q?uc6JPeTdCe0qaJPwd1YTeMurg8U/KUCFc0azRjJvXFTQs0zIBRr2YXi8yPx5?=
 =?us-ascii?Q?4TaYQh7W+DozMDV42dq4+iV9kL7GMHoApnrzyxGJqFd7raOrqVwEUSqZWZhT?=
 =?us-ascii?Q?2YQRV/MO7prm98LDFNyiPrRIIGFaAJfKwHd6AJlNhnobnFzWRlIBGIeMtzFm?=
 =?us-ascii?Q?1qmTrNdRJISl/xmpwYIQEyakU/xRAnOVxcyoYlNP3QgZZzZ5bjuaXSkRecP3?=
 =?us-ascii?Q?eEszuBuQ7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd381dd-92fa-4fcf-bca2-08deb82bf732
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:00:10.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXi40ugmZVtf+bHDeIRcpRdjYshDr7EaXxBx3dbKTYRfdUtmabMZHPkaXvqhoDjn2scZAAt3ZKgDn7OAo1Vl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

On Fri, May 22, 2026 at 04:18:45AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Document the optional "memory-region-names" property.

Need add reason why need memory-region-names.

Try to fix previous use undocument ABI method, which depend memory node
name. But now prefer use morden memory-region-names to fetch related
resource.

you can rephrase it.

Frank

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..6679b10f9da5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,14 @@ properties:
>      minItems: 1
>      maxItems: 32
>
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      oneOf:
> +        - const: rsc-table
> +        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8
> --
> 2.43.0
>
