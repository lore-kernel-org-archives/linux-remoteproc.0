Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17F2E413;
	Tue, 26 Aug 2025 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219866; cv=fail; b=SH8RIqDZu70Xqn4DXwMd5lUplniuXCxhNUNyZqyCUQrtWLMzMykcdNdeBWkXgPWC+ikKIy3oryLFCJUlNI4eJs9xr/qakaMQTDLHu+s0kZq/ssN8Q8nfQdxL2AKIFurUAf0gJLTNgB6Zb09Iz4HB9moEY3kcKw1gcTStbpp1XDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219866; c=relaxed/simple;
	bh=+f//SUget1HzyfvuiLRLDB7ok+TDYbu+Nyw8KCkAevw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UeiYKPhnYT0uaAJId7E3ljttEt/d25gD9+4TXW6EFAiHwj6OGyYvdd/KBRVzCro5umCLsoZ+WueioPtLewQhvP1LyoIdib/6/5aDQU5QBD+nGqrKcanpGL0PSYfn7RoSsdo5F3mGRlHdQzvma+gxxcwGgazxkg4ScG2CaFhAQ+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XyWdn20o; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XyWdn20o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhV15i0JmBfjQrJr+S6dTeJvdyEqx3H5SGR1QF0+TR3tcm7NgIZLMKejezS1VrDxEr4aK+NtOv/InJ2aATk5DM+pYcVPl1jXTvKTDGXsQFwUmIYJ2VgpvgNASjjVbZ/9lSFwm1VgSUBaw83Ff6DkNLGIPaMgGB2+yX0StxuH+RzbnjLtIAwpWAwKq/9QkfnkJONJSpHzZQN7PC/rnLReBnzPtTDhM14xLIVtj4+QKaVpu8Kcr6mgdq1UgIxfMGLcIZSt5Vi61nrhEtrow39ZesStIYFmMsRMAtmfwnxkuu9xC937en2F78dsuWOLMTusv22k3Y0VRNrIr7mFjlDDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=809hjq/3t8ZiFOzEOcrFkrLQFQmcFPcvdjOXvHxUmdA=;
 b=LPAFu0RwjFfyOYLjSOXd36HhdjZL3xbYyUi9taQdw2RyXDPqx+tEinq5SKuGjOb/xo0jUDMg8G8GT5zoP3PQIeu+N3kNHdcJA/KESGMxJI9oRip4h6Ir8NV5tTkmH8itLuSzNkm88s0FVfO55b4/8L3qjwIDlvgtiXrueniblWvWpRnveYxFkjVKquVkpuND2u+AXIMvAhCJq6sAiuM8p9B3oyu+Aj2doksUIZGL65f6OkbKtbv/MfOJIqQmJsYTRhvzlR/V6c7npXSiGAT1xTMIC8XvxRSqyLPYX7cx9Pkoe7ccwemqUVTG3QcYOi1/uaA/Fb3LIRZu7xdfn5C3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=809hjq/3t8ZiFOzEOcrFkrLQFQmcFPcvdjOXvHxUmdA=;
 b=XyWdn20o28kpfg30CYaNPR7Cinoqo/117WrVj2h2N2jJOp1NqqAfgXHsJQx1CSo5sGgrs0tofRvtsr6CJssj29LjSRABevM7UGL3fekeLb6MyOFb0Ojx9oplnKzQFzCc3NIlpJ5L4gccC3QDTTobkC647CT1aVawcb0ZPcW0OCiGpVXJhBLO6eHAK32OAIaKDufktOxGQcytrBFuL/IgzyuXzPn1iZzd3NAaTfWMKIyEjwQWSJ3s73Dqgo1EcR5bozT/EptTw58oM4HYdwBYYqMgo11+ZS55UXC8JhekW5Lpc1CABVn4NNrvK/yLFUGyWJF9jv+4BUNyeZKH1aJ4BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10880.eurprd04.prod.outlook.com (2603:10a6:800:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Tue, 26 Aug
 2025 14:50:55 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Tue, 26 Aug 2025
 14:50:55 +0000
Date: Tue, 26 Aug 2025 10:50:43 -0400
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
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <aK3Jw4ISQfwXVnSB@lizhi-Precision-Tower-5810>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-2-shenwei.wang@nxp.com>
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5742e98a-dcd0-42c8-b393-08dde4aff5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w2SD7qaNYSEwW/g+thn5nlHHeJjRX5LEJVXJL84PPGtDj2lqGJw4KjX5OW7P?=
 =?us-ascii?Q?9M3MishZLMdARGDng7TEhdwe6UEO2yHOxk/pi3Oihehj+VK8ppJW7vvuYMxk?=
 =?us-ascii?Q?VOJoOk5jzQ+Zsy0inCiXV5oIdPouLEdmywArQMg+GEYT8+IALJnVxS3RGr49?=
 =?us-ascii?Q?Sobp+9OTkc92KNFuS1wGZLmJsJzf/CP3xJX5FAljgdfmsdd6QnO0kMIjzhuz?=
 =?us-ascii?Q?lg8b9VAXw9pPBgtniHAZXz25pO5exc5lnNnmY5FB9hgEzTFa31Qq5d0R74Ls?=
 =?us-ascii?Q?VohNxAEFW0zrC4n4Srsn1lhVw1+JY6EK8t5u3MBGCdHj1TKuh8QkjFAunsi7?=
 =?us-ascii?Q?EefG3fbSLzATis83tZJPYo3fm5SiKlX5a02FupLBFlHU380khoM4SHL4LCTZ?=
 =?us-ascii?Q?vhGKFFXxTp07Ed68xCAcvvwsgANBmB6+9awuhPyIVB85F7aPKSq45ZFD2O4Y?=
 =?us-ascii?Q?4ZYvNBLazCkGuSD6itYexHGx1izur3uce0VNKraP5rSZm9RCZA2vvjoLmVP8?=
 =?us-ascii?Q?eIcZEKpmvTqItNw5fHINr0a2bvH3jjVAMpkOyO9CU0xcZSEQ0wLW9fkhBR/B?=
 =?us-ascii?Q?e+ZvmB9bYrQtOdhaFl++ouOB0+9LksjYoKOT4m8Tr1V1feq1WkDvuvx3RPad?=
 =?us-ascii?Q?Rf2eLmal1fDJyXUkPGseZRruM0fUMZthueYN0n4phJD4z+ShVcmHhpgg0Iiw?=
 =?us-ascii?Q?yhF0CuXtkisss1/P1OIyBzwtemb3cdKnNHGKKm497bUcffdugLVeu19bdqm4?=
 =?us-ascii?Q?VHg0v3h7xIBYEZg9fhFtLMbs7KV5ZnU4ZeW410vyE4edCJYvYmt7zruSMt69?=
 =?us-ascii?Q?83UEjSiA0WpSxoXCFHhvgWnBxdnjM2z+l6if7iIQ2cO6GtdLt7BNn9iusHN4?=
 =?us-ascii?Q?7GJ9FsbnFBGp0yLXCFUNqPvaUObYgFo0fhHqgRj/NCqqHTlWVxbhABTrXEv3?=
 =?us-ascii?Q?BhWPdLG3izLN4k8wT/l4xICU6F8IVAVGA92QtDOWAzAbfzmAX9RxzvtYfRKn?=
 =?us-ascii?Q?LwMZwGQGDIfskMsOy7cD/aGdIJQPMzZhacY/CO3WgV21yYKS5ES2CODzNOhZ?=
 =?us-ascii?Q?e2e0wUELAxlzDg9INAktxza/7D73Qy1LYbTGL2r2Et/s1VqJgBqxb78oowFr?=
 =?us-ascii?Q?5ui7h9jwWLFaEvGDxavfDzlZLt3+/SIlu1gPOfmajmH6oTuYK8if+7RUorVx?=
 =?us-ascii?Q?VUjNRi/I0UlIFz+sNsyaU2juwKrZKqMtXrz5bnkb0/Qp4hF0kbnAJ3RE4VqW?=
 =?us-ascii?Q?rPA1YDCnA5pWRG0WDJSSLiBI5S8UjBM1r2fDzq1Z/qdHQqXuau2pRREsVaB+?=
 =?us-ascii?Q?W+A8gz+8aLoJmFJ25WxRKBQ4DIX/yDqZ/3FQKkVD6y3f4YtLkbTnj2GDTaP0?=
 =?us-ascii?Q?SaW35+g/bh5kf8vqKP+BLRH/aI7/16IK6j1NHm/iT7RoabUB/Je+d8+fd4lV?=
 =?us-ascii?Q?Mk/qe8rvKSRq/gEr2dZBBfh6NV10EkzVHrgguhc2K8gk5iT1jTTGuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EGllzSpObu/TSwCT51F3Q3HJqCjbNwklK0XubvyQnQWTg+rcvL6rnyMEEfJR?=
 =?us-ascii?Q?TP33ZBSGp9+5HDGbP6P4zIHay6b5VGrYxxvahRRe2tfOnCsMqXEYkwk76lui?=
 =?us-ascii?Q?3Sb4G36x1fhhSH7B/zbvsHpg56t3kvBxZSwjEOxQ/pxvhduuWak6DR6bJkSa?=
 =?us-ascii?Q?Sq0cgz3YuPUJI0i/8S7DGjNZtfQrrP0iJXnVAMJulIBxOAqghbslCO5XqYpd?=
 =?us-ascii?Q?GQ1ZzP23Qev58Q2YB0jG50uhSwaFpCeObo1ZGotgNjqdouUhLxzQI9R2hnZJ?=
 =?us-ascii?Q?kD8WNlhl0Gm2m/omVBbOLqP7WVY9gKs0AKgnQAMd086uBHz369kKBvOd5wzm?=
 =?us-ascii?Q?0IgEHDuqROK1jMvNJziZYmk6SnHao29/icWnDo5nl5B7mBnUEUuz9Ya4HXEK?=
 =?us-ascii?Q?8IlD12OFynY5+oswVv9N6txWbUEDHi34AnRh/ghSo/zAUtYKyBERK6h1pxjJ?=
 =?us-ascii?Q?XZvYj1ahdlRYvNzma4c1pev5LO0w+u0xzZgjboM/GCX+NMBssAVTkf6/XHYM?=
 =?us-ascii?Q?ozuQOr6oAvBsexA9OFAb9ASX9awS13ZCotFDJR7VLJe9k/gL9iFYnmqrAOUP?=
 =?us-ascii?Q?377QErDfhGQGwhw1dFEKX2htmFsOtTeYP1y7bkrsrFadxgLXv5/ZbG9RTWi9?=
 =?us-ascii?Q?V6LlWjUdzCDNxJf9B+sMLL04dE8DLRXqViRjgMDustElO/vKRWhMWjVd6UQe?=
 =?us-ascii?Q?GTq7BZ8ZQWeV2ZHfXUSaBvLpd83YV9bV+8SDgtGfntCt+mGsbNuZqmoNKw5r?=
 =?us-ascii?Q?vFLmYxNQiWVIxIccVETbiVTsdsnUojfa6m7B7rYRBoL8sxhizuXsHy4stCSD?=
 =?us-ascii?Q?7w3B3oC348fVS6eGIRHU8PlEtJvMylfRRYbRpBkG2lOLrQTO9bBPlP7qz8Ue?=
 =?us-ascii?Q?Ck/0jGx28uZtz9D5kENIgX4aOUPleYhKPwWZHR4ze32namwrXtaR556JGWHD?=
 =?us-ascii?Q?pZ2IQxjdGCQNcjRKjQWwvXGhJvH1ONYbIRDfVaBJPdKCpen2Q5f4MFc8fq85?=
 =?us-ascii?Q?5YrVUGdmv96o9T8eXa8fu3Av2BK1cVrbzNYX1Ip2AqEcm66l5nGnk+B4ZHTR?=
 =?us-ascii?Q?exEG0PFEodSyaR3dgC7Iut3JEsJDW0EA2WAUja43sGY+ZuPW1Y5qiu+GXRpC?=
 =?us-ascii?Q?oCrZMO/H6cZHggJBvHbu3Sw5XsEG6A9GGQ9ZD4sHs8/lve+Qhctq/c+bQOF2?=
 =?us-ascii?Q?2mUFAUJhR8hVLKykzFjTFXAU0SZVXloYrjJ7bQFYCeGE9ibjWF4EpZk0+TQy?=
 =?us-ascii?Q?MNbIm25JjXAgnUyWI35i4yWWS3GFg4uWdC/7lMo9fgAAh6W0FVY1B5y0pV50?=
 =?us-ascii?Q?Uhroto7/pmpevLJggteQkKsvD76zwhrKqqeSEycAvkXkzPaidMObCMbNQMwX?=
 =?us-ascii?Q?7kYtKOxMpF5PCOU0hBPCzsEam6FQy/0nHtW9+wqEPv4eM5TC6gS5Pk8pLHq9?=
 =?us-ascii?Q?I7wUjv5turXtOe/zJH6x85+YadI7jczpFup0dtiN3AAB2uQWhvwrUxN1WVaR?=
 =?us-ascii?Q?KSIc1umcJBq0AL8QnO6D64/LCwXpRwSkEExedFxr5zR4WiifiJmVvtmHh5IT?=
 =?us-ascii?Q?hUcj2jijOHXkFdW2AjBlZLN/ZzYTIvnwErc2Acwp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5742e98a-dcd0-42c8-b393-08dde4aff5b3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:50:55.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S93l/x0/qJA4DCsS0gHkWiVyrJVZJkr37J7gqZXqcvUyDkDlkEqKjpkmunZapM5UiMZ4I64k9FRGaPBjXFUz9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10880

On Mon, Aug 18, 2025 at 03:44:17PM -0500, Shenwei Wang wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..a105aac798d0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,86 @@ properties:
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
> +
> +      rpmsg-io-channel:
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
> +            required:
> +              - compatible
> +              - reg
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
> @@ -146,5 +226,42 @@ examples:
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
