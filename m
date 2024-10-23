Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2077.outbound.protection.outlook.com [40.107.103.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAA611E;
	Wed, 23 Oct 2024 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706709; cv=fail; b=MfN5sgEUAn2odZRydOOtiLtoVYiTRfBxkbMyzWgba5Qu7MwafwqL8rUAJqHZyFj9l6Yg7RRsNzYx6HL/LabZhbHEcjKXiBRt1nn2nOKPeRsHqMcDRW2qJZqOtgXQ2Gq7Zy+Y88rgWX2yD/YKXUwNT97b4J53rGHbPBnC5YsfNEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706709; c=relaxed/simple;
	bh=VChBq0rYm5bbrWCzeMIOw//IT7ved7VLDNKstBz+KD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sGFRJhnHjg32KUSYT87v7OzjELFgzugpwCWb5+Wg4Feuy2vEUj/h7833tkcYyu7n52wIbfQWw8pRSLc8ii6zfHfCRPT+MSsx7iNqGFqCwBbov/3DlX74TB9udbVTSMNW+gWXBOkVpFdETYZjuvukGI0q2SZJK4QgzE1/sNQb16k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H9vcct6K; arc=fail smtp.client-ip=40.107.103.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H9vcct6K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc3htDhbf8a/S+f3hqDLgj6Cg3mNmScAgjmJ9RNjBV4dJhLPcsUrrOs5+NsspuxQjExBlXW4fXsnA0FSMxX2tDU2szF1fuimOnQTThxvfAAqrq+j5RueNGrnxIRQ9dujRmPM1K4lrlCmVol1S2Dwi0OYgsZpsRG3fqZCBndYRwv/cfPCWKrJ+w7Tsaibd+fY9Y9BJyCkR335iROysAtv85xS7suu+l36uD+zUWt0w+Cd8r9T+CSF285SfiEL8lvSsUR9xyniRqWsC5GxHUA8x/yaGHJShZttZEshBFOQCZbzDRRyuiPEoMKgMDAZUNjLIs8000d0xTIj4Bn30X1KWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSSezqxZ32DVSzCU4KN8uze3jRdmPWjCF0L4RGvMQbs=;
 b=bnU38qPIoTucmneYOvOi40v2fryk3LDd6GMqilGsM6XJ0pSNMNzmuR2hzCtkfuVrMf1jI81UJ/IjnHZTJQrDjeLgk3DV6iSVGX0V9K3j9l79i9MNAeiUjezq0NKMwjsugQSRdA6zn0SFtWjjhuTur2NZjPgqHay3RGZqxOmSVjb/mIm24R3y6KevhffLvXnwx54pVJaQELaBjfHpeNjlNzQ+U+Zv9EvVAD5+49j7eHNrFDhQRMQGEYCirpNq/Wem9oj+5oSkpw/mAYT6qmLfkUBr3fajbbWbSYpEvCaa+ImgTI/TYGlqnxaXboe2lWYYuzjOJeNqHmLFnQPZXEBtXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSSezqxZ32DVSzCU4KN8uze3jRdmPWjCF0L4RGvMQbs=;
 b=H9vcct6K8vztdIkYIuqOo41SnAIh9WQXRdT76b8JxyVoQoJJh/8gIbFtk0Dh2r5D798q4sr6JlQGvClbUk+GYf7fWLegM+oQ1jop7XHjV4V92Y5y4/ggfF3wr4W8d7eUeQU3kGm+3CZUYfHAgTaU6G4EMl56rnySzEvXtcQeBrYIhv4hW/DO5PX2a/BVHFbZkNYPNroIP15uJP3RXbrQcNdQFrrdfSji8btyj9sgVDTYVpRl0DN2vbKaWcNsxFNNhEYmPjjXbvNaWPd30DS0sj9npOg7VyUyWFUQFAgaPpzu2ySjh0KCy8skPuTqyZMTZSS8EINjtyVAC/KjJ7RnNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10253.eurprd04.prod.outlook.com (2603:10a6:800:23e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 18:05:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 18:05:01 +0000
Date: Wed, 23 Oct 2024 14:04:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <Zxk6w2bl23UrCE1W@lizhi-Precision-Tower-5810>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10253:EE_
X-MS-Office365-Filtering-Correlation-Id: d6859c04-e379-4cb5-dfe7-08dcf38d36c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M8X0uaXCqoyXwfz0bFau8Y35MnU0Tc2CIS2YTFRbxXOWEqDrWbwnY2XPfT48?=
 =?us-ascii?Q?r+doEgjR6+hlQFLaevU7VOZnEs9My9ETX9MhoN/IN5w6/BeqKb1No9lsgeU5?=
 =?us-ascii?Q?JYmpQF/dreP1f/jeZgGsEEV/ZiJ/NzPiYoRqahWk+1+cKb2sbmLEVldpbsjW?=
 =?us-ascii?Q?047YEgXYzPAle343IrkY+A3Tv8CSPdyBa5F7bTkkeVpl2Q4G3IAk9cL8O+L8?=
 =?us-ascii?Q?B+0IIMxIWDMTcAOA4vFs5IYOhsuusefx52RuwjXn/JhHWUHhVsHxJLalOHTS?=
 =?us-ascii?Q?n7UqgEnZ2bL56Fyk+oIkCTzqkcGHOTdHEfVP8kxZsoh9sC7Fyk1qAbk7SCvu?=
 =?us-ascii?Q?jiOdpOq7OHvhbGGLVvDGyEjUcAQ0qR3EJfPB9i5uzAwvbUvY9Qz4hfUufj90?=
 =?us-ascii?Q?wQjQwXRlDyttABBKyM0btQ1lnC8cUS92BM34cNtFNdZ3T39gUtGdxl1BxeKy?=
 =?us-ascii?Q?/xexVqwzV31Xd+xjqmic1XGnpN4uny+/KSbMUpaMzsi1ZekF4t55o3+mPoEK?=
 =?us-ascii?Q?RRMx8aL9Hu7LLl61XpbvkQBZ0q2IuPdDzL0rJY3dwBfkJnevIVfAu0Vym66W?=
 =?us-ascii?Q?RwqFMm/6m2a5qe3zYVoQgAeHHCD+ZqJz+4z0jftasvTB8V8NZ9infKu5DZpM?=
 =?us-ascii?Q?mQKdY4lX19uGALJInu+nijKm1krhfVvkdoE0Z/GqWBKmCHansxes9vbFLSWn?=
 =?us-ascii?Q?GNIRTOKWA8DfMTfcfF/dDUSj6AEkA9b0wksBuwmjiNEVsD5kN+QCcZsGZnXb?=
 =?us-ascii?Q?UwzsUv8L3b2NomKWiPGqO1jEh9mPE6Xnd5Dmjkgv4VeR1PymlK7f4jZp4wxf?=
 =?us-ascii?Q?u6bVv0mRPv/C/d6fn20piCVakn8EePV901Qumi0+yFHCLfQfWm4TjYkeET0T?=
 =?us-ascii?Q?bm3NXbiqItqE6MZK1HrCDGAouqsnuXCkZjCFvQDU2M3okMvCgrOYaciB5TZm?=
 =?us-ascii?Q?2meHC9nVKJQCn/o+YD+/JAvwe8UFsVgTr5ZHWKghX5rC79xkvTgVNYTrbM+s?=
 =?us-ascii?Q?5F1/xl81HbAxv/pm988KYRM7HKYXXxjSHnaP0aAuLWOBaNMi/eKrlzKl+07d?=
 =?us-ascii?Q?mqxNCN7P5/k1seifOMbgyK7qo3EfTSVmECGNGDKWxsugikJIlfPXnHl+hByz?=
 =?us-ascii?Q?r/tZ3lxgXxHoVh5z2M6VnrtjC0qZhaHvcmvfykmYbKhNzDLyKZM6aVA53QU7?=
 =?us-ascii?Q?kvG1Bc1jmNvk80X+oWp6pcPYI5dhnO3vi/Dw7kq1lDiWdNKbOCOPbM+4Gdeo?=
 =?us-ascii?Q?ki6cpSLysksrxrCFII6V2HYCf8Keutf6Z5AsrV7HthSKMUI6LEBOTvzy4bzO?=
 =?us-ascii?Q?EaGi1SremcmPUomKIsEiSpaWQfbv+vfTZeymki7KK/T0+FKH62uTWfA+QW8+?=
 =?us-ascii?Q?vtsX8vw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZclJ5IRsPufEX5alRd3VNR6dUetXcYSW3YiAuhSnfrmVdmbSriHeyn7de8n?=
 =?us-ascii?Q?BOnRmyPKixVlQU9x+dXtRyJj/C6dxepKHPmexz6uLBFdEeelaLM7vL4JM3uH?=
 =?us-ascii?Q?NfIlrJVWXDNNOpzTED4RwgFuQrmVuP805UC53OOY1Chy4DASuphGtRppkZxu?=
 =?us-ascii?Q?hsuwyuWzPGYUUWuN3917Dz33DW+N90iSxgv7eXDtPZlF+AAdqxgENMJ5OAZG?=
 =?us-ascii?Q?1Y+aw8fI224WHlJZI87p/EiWjo7jHNjpP5aStq/yp5HVA3ZsdCoSh3os6VkR?=
 =?us-ascii?Q?fj3EgjEuDnB+B80XOoFTwwheryCsHI1Cua872LLYsZkJs7uwENgNLMaBs2Ww?=
 =?us-ascii?Q?CxKz7eRsuq2fqHJYAgrn1qOjTMg7reVc0FW9o+v6jTMfg70xy18ACLM37t20?=
 =?us-ascii?Q?3bFFZKBvm5ZAegtvYiFdjrRPmmXXjTKWWj1qz3CKmJAoq9DOc2h0iJia+zPj?=
 =?us-ascii?Q?svgenG1I4PPZ4DsDpvfjoPgEGn0weqcYYUTBeqJ3oWOgcg2HyBNXgxidM/D+?=
 =?us-ascii?Q?gcglkTVjuRckpkZbkrpXdig0KV5QIjHdnD+/T7T+H0M3xSEkvvQ19QZ3qnJc?=
 =?us-ascii?Q?57wBcCnna1p8pyPYkts7UQb3E9wbHLVBZLqqtUw+R0oWhWLsFtOCJIUkP4jq?=
 =?us-ascii?Q?gdYmynHB5N11xIjuPxGuH1kO/4j5iPzdu7ba7iarjwRclfnb7CaA/IS+QDpQ?=
 =?us-ascii?Q?o3rnsPKoGfFEftx+JEknmcDzzGUWUg89qQFzoSsGiKe1AltE7g8X/ktGQob5?=
 =?us-ascii?Q?JxqpKoM6Ft74r6A5yrsLPMHqHhraoqKTpchIeVuud9e+vrFIShEQQjEfhLlb?=
 =?us-ascii?Q?f5rZHTw2lue5wi7w0gewDa4GSRYnC3+aqFQ3QSDxmLHlLNj7k2jqKb/TFfPb?=
 =?us-ascii?Q?Oi9gpvTglhd/utsECdFPVi867s5NYOEzk+B20iqD35QoPgOWGUcWUM63bfan?=
 =?us-ascii?Q?G/If8QkedotRntkw4hdLJRii44B1N2fGj5OYDJUfymyeyl/1qc0/ATyCUrLN?=
 =?us-ascii?Q?vNtCJPKi5Bf+NhTVXLFWgRSAmkptwnEJpdLtlkBBwm7QQYMu0400cjLY/+b2?=
 =?us-ascii?Q?yID4KlKE0M+8vzlFUg/EjnXuptnUJj4ELlqY4vkVYfE2ZGViMDxXsIPtkqpS?=
 =?us-ascii?Q?/f4F0+tZWTvsevdcaSqsw68aoFG2kcCSTdN0D8WaprIEJcLQk7sxqoYb5Ue1?=
 =?us-ascii?Q?ok5hdfMnRcqXWei3x4qTl1eFXZ6LZtUJZEiIavFGlupBSD5aTT1t07sBUN0o?=
 =?us-ascii?Q?WInVVlTGTDUnswyBCfwMUoz0WDSUlCRDndoUHJlJUhdHbtLUZFh+mj0mRj8/?=
 =?us-ascii?Q?grgRrgoRXSBEdtgYSxVgb1ujIN6VPW6lvhUh42JeNsIsTg/R5zsNldbFwlMR?=
 =?us-ascii?Q?p45yT/C0R0DMcyWyEc8+EAUEyIXUgk7hx5RS3hL2KNBL3Ro/97jns5Z2ew07?=
 =?us-ascii?Q?Rba7KuePqsleEuy284v/d8XgtGNSUYyd9YqBXT+iriB6boAvQCljKT4OXWkZ?=
 =?us-ascii?Q?/kMOpCvtyG9XoDYsma7hO5czqbRnFLzepeor7klno3J0PDkxXajbd6nknEfc?=
 =?us-ascii?Q?BsRNFDuoc19mtRwqQ5zRmLPMpxMZNOW204CGY6Bh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6859c04-e379-4cb5-dfe7-08dcf38d36c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:05:01.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfKv9XyWs4VLeB8fdSqIgv5UKGve5UoI4afwIGJAdRY4OVc+lFYXLx8BSRm2/NIihYNb23EwVMi60CoI6Ff0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10253

On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add new compatible for imx95's CM7 with SOF.

It is not only add compatible string, but also change reg, reg-names ...

Please add descripts in commit message about these.

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..ab0d8e017965 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,15 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7-sof
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dram
> +      - const: mailbox
>
>    clocks:
>      maxItems: 1
> @@ -38,10 +47,8 @@ properties:
>        Phandle to syscon block which provide access to System Reset Controller
>
>    mbox-names:
> -    items:
> -      - const: tx
> -      - const: rx
> -      - const: rxdb
> +    minItems: 1
> +    maxItems: 4
>
>    mboxes:
>      description:
> @@ -49,7 +56,7 @@ properties:
>        List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
>        (see mailbox/fsl,mu.yaml)
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>
>    memory-region:
>      description:
> @@ -84,6 +91,10 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  port:
> +    $ref: /schemas/sound/audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>
> @@ -114,6 +125,43 @@ allOf:
>        properties:
>          power-domains: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7-sof
> +    then:
> +      properties:
> +        mboxes:
> +          minItems: 4
> +        mbox-names:
> +          items:
> +            - const: txdb0
> +            - const: txdb1
> +            - const: rxdb0
> +            - const: rxdb1
> +        memory-region:
> +          maxItems: 1
> +      required:
> +        - reg
> +        - reg-names
> +        - mboxes
> +        - mbox-names
> +        - memory-region
> +        - port
> +    else:
> +      properties:
> +        reg: false
> +        reg-names: false
> +        mboxes:
> +          maxItems: 3
> +        mbox-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +            - const: rxdb
> +        port: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>
