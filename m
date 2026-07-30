Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF033B38BE;
	Thu, 30 Jul 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435263; cv=fail; b=Mb62YGHE2pFmAnslyBlTnipnI5Y30oyEdTGDUb4H0CSDXl5M6yNlvhbliapdO25Ie8rzPl00jbox+UGzVLz0es/+JY35R9Uh/kdaY25vMRBGU5ENMoHuFYuqBx7adIkM0xrlyRlpPDveMbyKC0Oj/YPGNXlY7k0vgin4rYFt9Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435263; c=relaxed/simple;
	bh=K0fQczP+nVY62Z1AUwfO6lZ/MauFGFJYvplJTPzVDbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O0ABDVXHqSJxz9oPjKAIBoRlBhw8+Y4gibmggYXDCmyWphsPWpVvHLvg48U83+HXSb7Pe6lMQ23MAv0Jf0XGPR8/MJkJI18PJ5dT8s8M72Snu47aZAOdRlOxevNQs65bne9LfGC00fNU2OKGj6/Mk2t6pg+pIR2r3cuEISdWDzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DE9r35hG; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DE9r35hG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBHZHn6W2PEOrfkojarU4JdcifvybUHgovsukYyTil7V5jDDR+hAX8WZNU7l7AVBGNHKpELlz4Uea4wT5VEKcbWqr4OWb3acFsLJn0bnBr24ZIezEkGWQVoWMiWXOtAJ5v9TzxEtXWiinvBqaRxJj6QbBHFhs6c0GYYHkbLPwBNadWUdatNx6PjUaw/OBjwTlC+q5+PKB9SP2oE4CrIO1NVsysic2b1Sbn9qyx3I1F6N0QdfeGKfH8S0c3PiRavAIA8cYRO4/v5pMkMiZZSxlVIiRQ05gO5sT1GCAqH1YMf/R3cQwYkbShNQFgv/ryyBPsSiKHPssIjrT71yvkVmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv5Omu9yXhFcyL2TT+yOEeSkp8IS521SRqMG7Zc+BH0=;
 b=enKutgOX4K9b1HAQzzzFRL2Xah+amXxCO3GQVJpJHGgJyCh13cIcaUge8U1RQOi1dH4gqjHOHjS3Xg0/CgE2/RKijUe/vBvvxhydT+FsPwRI6FB9Sfv9TW5JwPewIsRwVuVyYCqvxGpIaD1Mc9EXf3M4zZGrDvA0xbaiUwu6Nh6r8l8rUKsWTp/hnGWD95390+MxsnCRDzGWpyERitFZgxmALAFWT2H4Rp28fA0pGLOp2TsZHOCp8oz6njV7nV3RUFDzPh0Pt6O6RomcFHpFOpU1CVjXsX78YxWFmQ14/k4er9Fw8LNCSXwWZMEVuWK7zbAVNBY5e2WFJA0s4wTqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv5Omu9yXhFcyL2TT+yOEeSkp8IS521SRqMG7Zc+BH0=;
 b=DE9r35hGORjveNotUdvdJcI9S8/nRVMnaHsysG/SJvSRlFrOxm3Cf4O8hVyJdf33kGXTRjR7vlTJtWi/jQ70CgD2aJ0nYhcyk1jnAc5AVvckPLG8KyXd7ZNZcfhqpIE+SmiWxcp+O+Huo5xckedSETGz1RafcbG5ITWGRE9szqVb0rIRbCXJp7ecs1tYeoqOiAprJExaflRNudnPirozXFx9QPoqDmEJv+GSI6CZQm+KIY5M1BHQI05ekfvVHt+VjnYioIXnZAL+DJcChW+j9Mz9/4iO5+Q17nIdLCW6XbKKHBO2Th1NR1jw/H00Ki/K8GAzTHS7rj85uVa+jzdiMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI0PR04MB10175.eurprd04.prod.outlook.com (2603:10a6:800:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 18:14:14 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 18:14:14 +0000
Date: Thu, 30 Jul 2026 14:14:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH7P220CA0173.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::6) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI0PR04MB10175:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d876d6-2ada-4b2a-ea35-08deee665ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	2hIdKcsBqV+b7zzPdzmgpfVNaEjKjcXR1Zkv4zK43QwB0StVO58Ye5qIc8NQXoh7ZBbJKEY5ebal5+cVAprxvAJMS9Z2GoZwJiT4VWwXunLr+v2ZMUzaKY/osSN9rLoMNuX6AGYYfehGdlb17v13TVbynvd73EueOXSjGpabs6fM0GcxbL6wX59RpsTl5TV/vP06l2fjXfcgDzj9EnWFJbRCQW4oKdKhVISxY6szMcMz0+UJF6C2nbTkNQAoyNr3/yWsarhEeeAJq7bJ6ChoJaggjzJj8oX43XkW4sUEh0Y4qlQ5BN2YNnTc2ABxldwdkk4G8mtzy1XOdmQZY+CrRME+3/mUA4U9judwMqKlRszsCBcKBceavJJAqsaZ9gxQ00eBLNTZwQIiUs2LMCmDCLKCNW2jfwTRg5XBpV2ymCHq1ZBIB4Lue/iFtCqKlqihpOQ7+pyFBhAnEO6cGF8lXvBXAb0pOSD8t2V+nMRVbVUmAv96ZjC2o6/MgbrsqOS5NsSbwW+XX+spTeIBBBtUduIzZDuMGqvsSYoTRpgJ5IN9d01v8GtBCcyJfBZ01Q6Ueyw4F/L/Ani75XOZMz84gYHlEA88AAiXrwo4x160yx8YNgKL/aXwdj9D+ZtiD4lJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aE38tqjZfk2Ybf1tdVe8uTv3EHkfJ4FMmM0hFqVknCahKRWCzuDS5a6vKJsP?=
 =?us-ascii?Q?Biz8hHxNlmukJgDli3khwk4+NXnktYL2A0EG8cvI2A3Xbf0V9BfKKg35NApn?=
 =?us-ascii?Q?S004A8Ud2/UlLFxzO2RxHRqTTC6a3yZJQ0rq6KHLVUGs4TB0oQPHNaA+qr9W?=
 =?us-ascii?Q?DO5ZPCg6XLjFH8NlM3Lz6bbC9d4mLAR9cCXh4HwE/K0eF+j/FTGtfNDWuhd4?=
 =?us-ascii?Q?lK9vb+nZlEgo+q3D57z7ZOWlUTvfdxYhbuXYQtnVwVIo9Cpn6Kd9sOev2+h1?=
 =?us-ascii?Q?RrjYVcF+FEa9wOHlMjo1m+cHbmyU0pLsWMZ+D/jvLLyVEKQjAho0NwDqurxX?=
 =?us-ascii?Q?xsBZtkur3FdTBCp20n+stWBUdlo9whicD9nLmgaLFjcFqxsChkmb/0Ix4H4B?=
 =?us-ascii?Q?fzaBRDKJaW1FyNrQE8Y2Aw2D5UTYOqaPkOmR6bBqXsVVdmyb+LGYYc919hVY?=
 =?us-ascii?Q?7CtGa5lRIh7TfvsAtEaPSpIzno0X9ZM10SqfgLorkSdBqNja46vQSnSqVDse?=
 =?us-ascii?Q?3h8zhhC4Oi4zN0TIG1YqbLYXmublGNBMkobLGVeSZVjxgXpC3Q6wqfr+Ha7Q?=
 =?us-ascii?Q?Ey0XZxho3Os2KKhjzUo2noFd41SnBWFnFk+gNj0Q0itowkc4AshhhT030e3i?=
 =?us-ascii?Q?CzHgeQbc9fyZMPkTGGt23xLMzn7RUrbXSONVgdhJiBP02nvlUZnCSC1FZNiX?=
 =?us-ascii?Q?OtSdGL1Qj5AQisURMSZ4EGBa2ziVtgRZrUD7hlvHH+mrC4lkRTao840jYdKa?=
 =?us-ascii?Q?4/28rVTDmb+8kU1ozHRq1fKye2+C2yhxQZbJbURRnip+0ZRvLhXMMPUE6IuS?=
 =?us-ascii?Q?z933R4OMsFQSlAuU36W09XvoZ+YMbvom27HoRmQnbtKpc+2V8FFPdtkhu9PR?=
 =?us-ascii?Q?kUsshNOR4WlpcaX8lMjbzNmGd/U22J9117hLDjdbDEox91cCx4HI3pzUh9gI?=
 =?us-ascii?Q?tLYX2H+aaDdnqIx9KwKTYeXf7CsT0kBf182457mN+gn2rvo6w94jM6F+jeIi?=
 =?us-ascii?Q?cpOzwVElZW/yBnjXFt4ENMWnQqDik6Mp/3Zls5/ZZShi0KED/TPlzt4MU/85?=
 =?us-ascii?Q?ASTVD53k7jAS25m4tqv9JQLdSznLkiB8hsaIUHsUsDKzLuxjfRQpa+kmk4ay?=
 =?us-ascii?Q?i5IfV9JrMepNs1MsSKqPn8pSR/9XCLrabyZzQOsFT1Twu91fd8QS+kaXQNps?=
 =?us-ascii?Q?W0v8UQnQb9g+aGDS6inGIWVBZrccvrTraSVc9DAwNrsszv5jlfdw/7fbtQAF?=
 =?us-ascii?Q?hHLqyswlssU0cU4/32kT66pWI1Zk/AKFVJ5WI0u8LyvzrOkp/dKMBdZOueQf?=
 =?us-ascii?Q?h3bxLgYOLxtAnOEGKXpguptK+JYkYZzmrBH+74ma/A49o7f32o2hYUqSJj43?=
 =?us-ascii?Q?zdoJnPkeOUE+AR5PRzcuU44dqyiGzlmGUuPkPkeL1Aemxlm0klFpYG6WYYTh?=
 =?us-ascii?Q?cxk+Athbt1sWDEULSkrD6S+0AcsdFTPDwYlevaZBjcbRZRy0GTX8RFLgSzIF?=
 =?us-ascii?Q?2TYr6OCjPx6RgnikaUTIWg+y3cqm2sUBEKBWjE9bHXoRjYVf0wofLomSv1Xl?=
 =?us-ascii?Q?WN8jFSGzPM/3E/4B5+fjGJatsLhWaSN4JeF/XwGpRk2LRgAWZPz8OOmnAorn?=
 =?us-ascii?Q?tQtA+jiQFwlhFv9xdYkpv7/1/rA5hiKQdcioiXYf6glsNvNzxmvLFa5tc/u8?=
 =?us-ascii?Q?xzu2vzWUXvjjiEBoX8xyn3IfUCscAdIeJMHgjYoFpu/vTQo6II8ebwaohDS1?=
 =?us-ascii?Q?w7O9eRqHHtafKLJAbA2jyJlUcODqmqNvirEiffks2j6Z+8tEpecu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d876d6-2ada-4b2a-ea35-08deee665ca2
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:14:14.3450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqZRjEhqLysbkSghrnrG96I+he+d04yE7iojVJ65Be+GV7XmE7eMmDG66uKsFBgEsCbgQF8FXMaEme41iCeXQFdwZixGWCAk+LtsRbc1G2ccS2rBd+JpoC9WrC3yCtkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10175

On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The carveout region names are derived based on the DT node names. Because
> of this, the DT node names are ABI, which is not supposed to happen.
>
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the software will have a way to build the
> carveout region names without relying on the DT node names.

"After update all existing DT tree, this will be required.

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

Additional information to help understand why it is important.

1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.kernel.org/
2. similar case happen at
https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.kernel.org/

Suppose these problem should be detected by dt binding check instead of
sashkio ai.


>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +

Need restrict names

  memory-region-names:
    description:
      Names for the memory-region phandles. Each entry must be one of the
      following recognized names. "vdev0buffer" is the shared buffer for
      virtio device 0, handled automatically by the rproc virtio framework.
      "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
      vring buffers for device N, also managed by the virtio framework.
      "rsc-table" is the resource table region used to share the resource
      table between Linux and the remote processor when it is pre-loaded in
      memory. All other entries are treated as generic carveout regions that
      are mapped and made available to the remote processor.
    minItems: 1
    maxItems: 32
    items:
      anyOf:
        - const: rsc-table
        - pattern: "^vdev[0-9]+buffer$"
        - pattern: "^vdev[0-9]+vring[0-9]+$"

Frank

>    power-domains:
>      minItems: 2
>      maxItems: 8
> --
> 2.53.0
>
