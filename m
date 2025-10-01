Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D91946AA;
	Wed,  1 Oct 2025 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759351645; cv=fail; b=O/2GAC5xzRTr79QwngPm2eL2hIdbCRcnVTVlKu+mI3UWt4bZOqk/KFr5fzj2NmqcRTY/eFc+c40651Myi70w46YcksZO+yIqEu9D7jCAPVALTeH3fxbewX4pri3aLcGT4nFbj9P1QmaNj28fCU+S6oW9oSnjwY+VvT6+uN+FhjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759351645; c=relaxed/simple;
	bh=c00RlwaZ7qoVmUPUFCTp676DiiqLQdRdFDNuNFJbpvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f0ustPgmRyRrfLP3Vo3HLr61txcvVwFHB9xtpIcpBT8QgEKKlNVy0YzPmV0KXMrgUs6dFvdQklhchi9mrsuFUUwdzJTL8wNkQBmwyWDFpwUaRIAZxj3kaxhQluvtoKY9fCROs4WJnp4iNLRCE623ft7jb2LLbX0I0ay2BCTvXYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hbRBd2aZ; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hbRBd2aZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW/N42CKHGZaay0L1pqpNzmmtsLCrGWP9P6DUHOrEUXYOE+7Fk08Fo5xHtILW+4KdHQIw790MWFHhwNA1+8d3rImu1G8JpDAOeBc+99TcoYYkfmonHqU7/ayR7oSZc3xvBUaGNI0PqYAZGlQaymhYIq7sR0aCdF7z+ekl+cDAJu2oR4NCbDiufIRIKfiKdt9dopvdsUGNaPlJlFnibmwdgZ7l+bcWWJdKO/v5QR/1Ldb2Ns6gxfVFQ9D9CE9ziwss27w2cKTzgkax+yOt5eblx9mA4CQDWzo44/xcMdAE3ujt4/IGX4B4E+5D5yq0trql/eoBD7MTUSDP6v9buPP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/qgt2eGUz/Y/sS0Pt9OCDBFKLe48ccjJY8jwpfsQZs=;
 b=d2kD3loypWt+Iuy4xF/LvSOrvvvxvImhWpVHn1ChSQbiXrJV0o52SO8ommXCKinFOuWVzfd7N2wBIw2qhdEV36H5ocEAqNjIWm4lAsdS4p0Z9pdQJb/zK9Hzo8V4Rw+cgPj10aZgO52euvVd2Hdy3jHJQU7pfaeQNdCC187AHCrkUE/nJLPXKVk5BQEXJH+z5ZcwwL/3ckO6lxhFKwp1UJTPoqxeofX/7B3YGYTT7zWvxvJ39kUlndCjqzFVABW8F1Y6yOpUIaFMq9wf3astnD/Ss7mH6GrMu3A37pbWuIkPkoaq+d6/DM8bBF9N1652GFAg75bv5Y6LZTfvsZcHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/qgt2eGUz/Y/sS0Pt9OCDBFKLe48ccjJY8jwpfsQZs=;
 b=hbRBd2aZOr+nd5gG0hji0E54EIQEOEd3EIQBsPejKZ29yH1D8E0aA9inm+j6w2SIYA7hEAHUghnoxJvpFQ3B8vBh5om/HNPeKSexGlHpbioaPaRPjNqDo2wD50nGII+uz3NCT1Rl6devHwQiz11LpKaTr1VYqjO0FpUxpsdlR7U1ZgIEUwD3Spi7yse1w48qc+zLYgnFhye5srDmL6Q4IlPgqzUDZ9I1b7uKFVgHob9+0k+r8Cb1l8e6UICPScYYjXdOwuwGbn4qXK6PwPYBHsh5T4XtRH4jUGVkVH62SpGosvQHueYSoUz/bwUMeFKzl3+bdzieVAxsf9X4LJ4phQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 20:47:18 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 20:47:18 +0000
Date: Wed, 1 Oct 2025 16:47:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <aN2TSUE+AVppc4VB@lizhi-Precision-Tower-5810>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922200413.309707-2-shenwei.wang@nxp.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f5610f-599b-4372-036e-08de012bb56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N6TWJHEge4YUTh5Bj2QkO5EnjD2P0PKYtDCt4IlT/MOMLLT4ngtCXAatePgn?=
 =?us-ascii?Q?jZOkp9n1tg0YdPg8QGwoBfcRZL4idueib5K+QHs4RCn64UYDCKfkUnTOIOEQ?=
 =?us-ascii?Q?L1n5bIWYsz6KhiN1s2fa7x/IHNh3fUMLAzf79cLQGAx2U1KDgMB7MWe1MgQB?=
 =?us-ascii?Q?b3ttP9KMZCrqKq48qE17t5G8SnLoaQBXFB+SFZ3KdicbgAkg0fye80Mi1KOs?=
 =?us-ascii?Q?uUZWNyf+MCqMJuBLAd6Pb1cNWavVBEyo+xBRN5j3qwGxvIPrx8cyIgpEzCh9?=
 =?us-ascii?Q?bBXxz6kVvU9p7vH9vF1TtHx8o16qnNpp88A0UTibqFgc1iuV3DvB38bYH3uC?=
 =?us-ascii?Q?Oafv3SrBL83X0g4I4bLJs3NPa6Xb2JJJ0ymVOp5HA3YWa9/4YMxxbavFTJrY?=
 =?us-ascii?Q?Z9otxB6sIYmsgcvo/C1vWrSKHy8v/g905I9ubUJik8pQIpOyScRgFSyL3qHg?=
 =?us-ascii?Q?05s9JO8mXpD5Mf7eom5ZjWXlF/2VIGFJXGSxJZLkhKixELaGaf/FeZ8mGmeo?=
 =?us-ascii?Q?7b0wxWHNgskLMP+qqDoiM9GxJW30n8kki18ahVay8xehBFyuIhbeA+drc8KB?=
 =?us-ascii?Q?z82wV0GA5C0lVEQKJBfy7CyVPj9IJKp7f+3oOAQ3Z1NpinJ49IL+e1C+/Lun?=
 =?us-ascii?Q?V/tptnLrn1OWJw3k+fiRPm6RRHCHpD6vX6kE5rrvpv+/YLpvwgHCIL5tNC8L?=
 =?us-ascii?Q?0LSYsAZS2K+z4B+fqlnTlQNdUUJsN5C4Mhn4Q656vnElFQmqIGHxVvewUmZY?=
 =?us-ascii?Q?FgG8zLEe1yHGhk0Ta87UCNa7L92qPcIWXsmA0mK6fuR8bLn0XiwNT2IEdRNu?=
 =?us-ascii?Q?hHZrh2k4ZzvqDPGwL3Q7qKVzK9DPYpLJVXqCsxQkdpj6RZ9Eks3Q6Ap3H1KC?=
 =?us-ascii?Q?SKTLIx4NHLIahhdxSFmNNsrWiQhe0oPoEJN6U1YPKiKRnYSEmb2c3WJlCEkG?=
 =?us-ascii?Q?UvUcE742vA/9X+cTBt8EIEWLI64yMEp4CjldGW+RqWe97cofabRqTXRxLnWs?=
 =?us-ascii?Q?33xtY9U3M5IViMZr1RGmRORP3Qzn1Yptcl91fOUKhApxtb+lebuG0yR43LIB?=
 =?us-ascii?Q?lUYeOnQXiCCcWed0tjRtPrNSaQeaGbSpLKnraw7dAzd36wPD7emjelIAlg/N?=
 =?us-ascii?Q?H491NsNmUkP4Tx6zrrMh3T8uKo+lUWGuSth2AyM98lnt4IfCxVdlWvQUo4vn?=
 =?us-ascii?Q?XlnlXey2z0Cq2st+wwJ7Zb7B2CWkRPRbctGgC3xYnaZcGqbrl9J14+H9T5SM?=
 =?us-ascii?Q?gtluF9nHZuJYWnIW5KdhMIVA8xc4dfkWce2M/Ml4DlSRlBSLvPsAcB2vCIQ2?=
 =?us-ascii?Q?C4AqbfJtNqrPu8tPZatgkwW/oZ7XcpW5qbkVdw2k3HhKAmGhKxbslkiCKkgf?=
 =?us-ascii?Q?qvRgXQNiZTWPCY8DxVa5PM3wl5TJzKjiN74IkMwRQ6ye728icvDKyHjRQW8M?=
 =?us-ascii?Q?UfDVs2BbjqRv+fk88UdgdmODYgAX5pKMP66FtGXd9qO463NUri4uHZm5SLzR?=
 =?us-ascii?Q?/MarzVwLt0Ksf3BV0ureXFe+vVtrXPG/9l4w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QoXt5ZYA3iapYU9uoGYTnOx+/mK3QLixLHTimrJHnlKMcTKy4BB1FEmpZDza?=
 =?us-ascii?Q?2+gQ/aoj32pzbrBBZLvGgYcoflhfeL3Gw1IPtrSrmuzsjhfo6Sfy93fj+Z/X?=
 =?us-ascii?Q?5/UQsVyxIInNRvYoYDtD3rhKIUSEpb9JbKEDV3YJvm3Ff8SGke1/33eR39oL?=
 =?us-ascii?Q?/RHXUZzrhYL+34m4vDUhbhbbkrFYUyn+8Oxz06hX4ZjSc8dCQ2AHw7Hje3zZ?=
 =?us-ascii?Q?ohg98AOrfR1Yna+qjhIxSvi+E5u4tIQxyvwKHbF1d9z6SXmkXMwv+3HcMEbx?=
 =?us-ascii?Q?U+7zW5xybZ/PqE89YPXH3YuTOX3MNUPTPuyDfVXNMS+NhpUk2XfYPOZbqHD9?=
 =?us-ascii?Q?DIvF7c2a3uYNB3tb6uLZkj4uWT7nGNZMrwBpclsYIg89qht4rPvFWNq1H8Vq?=
 =?us-ascii?Q?KIQpIrVCO3qZQDodaoB4cM2CKhOsj90cRym7SderOfaCmiCPO7Jz2zliQfts?=
 =?us-ascii?Q?QUU9geW57QCEkn6ab/14m/MkwUOl2+feKhM7mOJLdhe/wiarbQnGBrMRnvRL?=
 =?us-ascii?Q?mgZ3kzqFD35Kx9oaxF61kmnNKM2mTOUtwRMX8QjStdn2uiqBuJnZkHDIDclV?=
 =?us-ascii?Q?QB5qFwt84DT0RQIkQE+kAJYHoC78f8/iXQFYOSJ2/Sx+qjIbmHH0VNu4IsHm?=
 =?us-ascii?Q?dUvQoxpkLgExcCLDolKiL88Z9EFyjr+a4U9wOapbZoAkCCgWntD7kd5BRsKO?=
 =?us-ascii?Q?uARgUmKDq286W5KPeDmVg6OIoOYH23fwxCbEU34cSzsWB/nY4ovAiIpysxi6?=
 =?us-ascii?Q?u2naViFT9CRlv43lVl6laSE75cjKm7Z40CmsF6h5fD8Crkjw1jivbWFWUnLm?=
 =?us-ascii?Q?ZSdorPYnSJFYgTwihyXyaz1lvMDp3r5m53O2SDjMlJLlDuExLQJuJ5+wL44E?=
 =?us-ascii?Q?DMCGZa6AG+WhS3itCu6O03Ei2UUH2JI6Pc40jCXk6mnY985Enxw3bVxeIES6?=
 =?us-ascii?Q?ijfGCQrbN1DAxJObszdl1DeT9dHg/+rT0JNJQpuVa1Ou4imIUnF5+EAeSuSi?=
 =?us-ascii?Q?FCqzseBvOUUf1VHC/xIPBcSSMwyNyaWFkcS5vLVhX35882FyaB3mxh+Y67aZ?=
 =?us-ascii?Q?JK7gSRfuOKArBHJy7viuf9/kPqUDcz5wKU/ColDVr6adLFSzqvMSuH5QzBQm?=
 =?us-ascii?Q?98iXOdoXn00AvqjboAe5GsJZHEpVrjlkLHZILgksvkv2kfkxen3qHG3WbiYs?=
 =?us-ascii?Q?CiDvgSQgeOb3jwJoDep0PoeIqqATsha9bjU47XB1KyC0I1JhvWW4w5Hrw7oi?=
 =?us-ascii?Q?KBeLTEn9ZW4F4THAmYQl+ongVdgVH3lNBxAyVc4qaPJmPRwHUXXCoXRPsXpn?=
 =?us-ascii?Q?F/t0IYHeWp3pBHDRW67y0mqodX+abBO3B87ThdWtUvdY1JzanmrgdCrlyMMr?=
 =?us-ascii?Q?8xisnSdRu32nEKZf3tZnXAcZvqZp+1bSAEVZh8GMo71Xi7Pt0P11p+MlO/Ub?=
 =?us-ascii?Q?Koa9BsBKhk+vV9sCH6Jtn3utNytSYiVHwOf2XVYDPo1oPr5ZOPswvrR+/2IP?=
 =?us-ascii?Q?mOHanIFIw/kL2WnPqXZwPksyQoRYu3KwTY5vhO3U8vWE2zcM2VOfAhC8s2wU?=
 =?us-ascii?Q?RweIqdBNfQcg94i8wWfRJmiUaIJTQxVZ1lAnaCla?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f5610f-599b-4372-036e-08de012bb56a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 20:47:18.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3fS5wBcedG+aI0uyc+eo4JdCY8qoHtuQpvJJdtOgxtJpG32cjttwBKQW5JAbPa3UN9l4DkTNvWvDkEbWJC8Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On Mon, Sep 22, 2025 at 03:04:10PM -0500, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
>
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
>
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..16c7db4c5a79 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,98 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0

This is reduntant. child nodes have not address.

> +
> +      rpmsg-io-channel:
> +        type: object
> +        unevaluatedProperties: false

should be additionalProperties: false if no $ref

Frank
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-gpio
> +
> +              reg:
> +                maxItems: 1
> +
> +              "#gpio-cells":
> +                const: 2
> +
> +              gpio-controller: true
> +
> +              interrupt-controller: true
> +
> +              "#interrupt-cells":
> +                const: 2
> +
> +            required:
> +              - compatible
> +              - reg
> +              - "#gpio-cells"
> +              - "#interrupt-cells"
> +
> +            allOf:
> +              - $ref: /schemas/gpio/gpio.yaml#
> +              - $ref: /schemas/interrupt-controller.yaml#
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
> +      rpmsg-i2c-channel:
> +        type: object
> +        unevaluatedProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "i2c@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-i2c
> +
> +              reg:
> +                maxItems: 1
> +
> +            required:
> +              - compatible
> +              - reg
> +
> +            allOf:
> +              - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>
> @@ -146,5 +238,42 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpioa>;
> +          };
> +
> +          gpio@1 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpiob>;
> +          };
> +        };
> +
> +        rpmsg-i2c-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          i2c@0 {
> +            compatible = "fsl,imx-rpmsg-i2c";
> +            reg = <0>;
> +          };
> +        };
> +      };
>      };
>  ...
> --
> 2.43.0
>
