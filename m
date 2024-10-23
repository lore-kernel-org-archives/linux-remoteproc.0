Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE31E51D;
	Wed, 23 Oct 2024 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707364; cv=fail; b=XnXh40vtZnMU3hV6jyYvb69lHf3d7KtF+Y1lMTWUr3/Ule7ZXdpXRQaqlCufS1bSAjnhXPuwWRelTQYPgZG4lsJcbep0jhVKfIxdWjWiIXZv1AqAjMAu5jsDhEZz7KV2gztASoLVsaNzHWVgbs2BOg8c8LVMMUlJ+4Hp9ZtuXR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707364; c=relaxed/simple;
	bh=kyh3boZg5ypOCGtyCc+sLEAmNRPr3FGj5mw/nvVfQOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HhEUEl5B8BYD4ThJrcTOC+UXcZyMCfxUhmFhsH5U953KLsHC6DBEV4Mv8/PTjt2sAcowxoMX8MjuQ8FniafO6PDNecWV/LujEs3EcuruAKhYSX7ajjy/O4TIGDlcutFwReCMLhXQHDIOze0Wf1d8mEvjxE0LPlGEivrN+pCZO34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D3GOLgIF; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D3GOLgIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLlSgQwJvuZmPHX5LnJBzg0+rdLqeD14w9fMvV/dWldHLS8EQRBzXSqEXE8bmYlw5sTg7/4nySQqKET8eSD4CDnqdK3FcIfWEMtYgFsuVTnYCZ8FH9iYGuN4Yhvmw7uyVWDq0/LXbpzQtyh83+ioTdpk4m8Wv40XGl7q/uJO8iUxl0w3xsC6xmHbDg7G07Ya5ztPvP+9PQxHYjiVCAplkxxU1mpFjQSHNTFN9TtHjKUjtoP0KwWS/PZkQ4HLrW79+UoSvxy35QWZ9QtUXba8HrF54UpAOlJVo3NeBeCkztkiIs2FONX/g39mOLKCKxr2T17ucvpYvwweIHMBBJLAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C8Yjzno8z8a+kD2YrU+AObUlk8fs8IIoT0GnangFms=;
 b=RT8KAw08D1d4nPKaUPEZXEQqQrmAFD+R6OQymFGL8IBHnIOOZ1XNEB5MNDRukFc//Xn1rXLEvQ5tFFA/9Wrzd8d+TUgUdhjuDpt5b97+xNBWewaxi8EmidBKVVgdRXlu0XmRHod6klT8c1GU6PTNepT1/u4A6OoVx7E08uamgv5CmcgL86d3n9oh/iqgjZ/mSdEamdhgluHLWovYYktICeE/PqGGiTBU+GAIwCQu5BjmIIHmtjp3tx58xRP+44ba5z/8DwaGC7wBaeIpJjWDx0sVt4HQjYSwvMxiebsXENMY/OWRyrl1mqsh8AzdPucUo0ywObUM39xt5Jl/0SAfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C8Yjzno8z8a+kD2YrU+AObUlk8fs8IIoT0GnangFms=;
 b=D3GOLgIF8izMTzJBedVnIIgPcLujAaG1lTBPhwCZykQNtfpxKasKU0Okfe7K0dVfCJDZlEHP+DirrJx7m/utLa0Rh+MV0v147NCoMW7EmhF8Q34cLTwFDFk9mRbuo3GuW2IQRsWgXOMu0OIOUMTmO+QxVkimXs9tafrHJUPO/176ffHgWEGHna65dwFjG3yuAq3+iXjBLPc52JL0MdCD3zK8cAWuk2Xjm6047SG4kYXhkIPtwkqxf1vvylXdkUA0RZavVYhSPfp4hgk8o+ELUd9GKFWWrkz9jrkKKukM+fU2praqSsV4NyWAYBivWLu6aD/Xt8Jp5aMslh6/BCFdhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 18:15:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 18:15:59 +0000
Date: Wed, 23 Oct 2024 14:15:50 -0400
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
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
Message-ID: <Zxk9Vq0jtws/DNAb@lizhi-Precision-Tower-5810>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: a36edde6-8780-4cc2-08b4-08dcf38ebef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BLR0iZzxPUA9xnQL/EGFMk+nfm/axBk9YDcE/wQA2ki2/MFsX2/s0prhNnD5?=
 =?us-ascii?Q?wb215eYFMgmC/JLYHwju/S0TClEhSKD3kpNgb+sYTseSlt6G8bn83BzoSwIp?=
 =?us-ascii?Q?N1svxMz35Mf50BojDDPP5lPv+f9v8Zcwo3sew9uLXfPQTK+pUX0fbLQ9Pc+k?=
 =?us-ascii?Q?jvoAwRkwblcFzj3VvgChoyCpXmHgEmV6pLAcgtQH5Cp6XKwBFZ0BZBfvxuTx?=
 =?us-ascii?Q?S6WgYDsr5O9uFq3ESTuIQwNdWxYWIWwHmo9hgQ8UHmA6lVc/tOIQvI4I4YIj?=
 =?us-ascii?Q?IfaY7JQnYqnL6qeaQhShXhGDfa3eJSOIoDCah8gefEf+ueSQrvjl2xATbGMU?=
 =?us-ascii?Q?jIXf/HIvaVIC3qjR03ZRcPUI+Nn9GDZ1T0YCwuFEKss4DghjGABTOjiiaP3L?=
 =?us-ascii?Q?7C1WKet4BESFU1ERpJsgva6YPKswjW5xMU17UpZbhAsA9eezLM+uKf5fuBzJ?=
 =?us-ascii?Q?zDWH981XjMmzY4Ii4qIlXiXsZGznpVn6eWo2LLiqBedN8O8oajP6ae3qk0jP?=
 =?us-ascii?Q?yGS0/fzcvNV0IRR+rW2U//jsbyIuNtVXjo53vmsKRfEpz+mDbJRa61wCMRMg?=
 =?us-ascii?Q?IxbSum0o+BmcVE6UALodEYcPQAS7uaWdVVJllfGgKJx3nl5AHiTlaHj5QU5m?=
 =?us-ascii?Q?FLChkbVp6bU029VeDDzIHm+H7lGLTV4uMC/5cicV6V2wwaDXCRmcpLjLXhwO?=
 =?us-ascii?Q?kW13O4CbrRnssd8QlSq8c2KsfHb6rw4moinVERAhHT2iTkGI7xJ+4tAd3Fek?=
 =?us-ascii?Q?ES8G1issZswkaQwEwuIemrzAUks4l13BYpmVfr1nJSSmGt5+E2wpBOrbnCpX?=
 =?us-ascii?Q?oYl7V0lFoj8BSYAAnlHOxCsJUeUE3Ez1FdJMBl/L0WH9r2ZWlRyEJTOwDAvW?=
 =?us-ascii?Q?a+4CBsEHKeGrlR2Mlb15QmgbtHdtspvvHT/Xakdng/NEZXlsGaA21+wVBxFX?=
 =?us-ascii?Q?pbTpNIYF4xxu1gSyKkx0DXt9hf+p/sR6fubIxBHE2pooFbyHlJ4Dv3IdPoVa?=
 =?us-ascii?Q?GkPSSuagYNGiBT9Z9+oXe0vby8oqnUD+WnyoAfNYQwz0WXlx0EvpOBRUoqqQ?=
 =?us-ascii?Q?q+ZAxtwdUvlV/SzeTJ0vs3XkL9GflSj6LvN7ezrND8D2GC3Z8ILFAJrreA+Z?=
 =?us-ascii?Q?xwVnhARUEj4uXSHqMFALediyHD1/jKUUP1zlvvgigdUmvNJJTcvhlivR3stv?=
 =?us-ascii?Q?hEC7+WVyvVMIPuyYOt6TCe78Su8XCqwCBhxk/BNBv3jMErqDKidpAB5OkB6e?=
 =?us-ascii?Q?2rgx4htu3H5VMPmuXcqhAAXUJ9MsFun/RQOmYxj8TGhg2p+UOxZoicun1SSk?=
 =?us-ascii?Q?HM3jxBJmsbyqwcavm4IijEcRGlXmViO1SqcupOQjvktdA2uLDeTX/JJ9CkkX?=
 =?us-ascii?Q?1Ae5skk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rMG1kjdK/wveCn+aQ5JgGsSlvBo2TPSK6QGUlH5nh6eQHQIGc4cMXLPKquJC?=
 =?us-ascii?Q?rIE9Rz/rwgtH8thjDCUTddE3KETiE/jYHTdCxoO0GKwTI6kiwMOdK4EOKWO7?=
 =?us-ascii?Q?jRyT3fqJGeAaE9ybJWbJf9asozGJSmoUGMbdQ/WvKI3byVIsWNYmsITNCCBE?=
 =?us-ascii?Q?oCvGGssLzFtjdDzOKIZyfI26RXptPgAVpCZbXvJBlWJwLP7TECl0eOWP2ITN?=
 =?us-ascii?Q?/fJjlBus8yqjVsj8VtvMOr5sB+DH2hg6mlvOWTPGD4b3mguHM5JMiIGnCQH2?=
 =?us-ascii?Q?7bvMd1fZXxn3jIw18xcgLbR1+djkr0p5ZDKi9UPMOj1jCXONtJ+LDrGaZC7x?=
 =?us-ascii?Q?Ki5s+pFdoI1+y0QzURkoE7bAbYVo7VxURRzIqIXOsyAKSYjCYOV54iFr+Z3A?=
 =?us-ascii?Q?Uxe8wJIHSQVSInR8dA3RvMLLYs3Fo82Ejmre+gnTlnglZLwPjFF09VE9oBUa?=
 =?us-ascii?Q?pgwiWIFmwPDBrCDF4PqzP/5K7f2TCj2bmM6eeYzmx+zCiak8m4I+OqfEQ8kP?=
 =?us-ascii?Q?Y9t4JFDsFbEBKD2PeBZAC25YMmY0NMKvv/hmbo6ApQR8pPgt41VjpCWtj9Qd?=
 =?us-ascii?Q?45vvKn1A3CLdPWfEsMX8z6xM3qdF6FKPCgRzDS7ZV6UIv2/UYc7tdtOuulxy?=
 =?us-ascii?Q?eYSOE2ZPX3AHAOLXwAgJWEWlJBJQ1RTnbwFG7vR0W1ABrj3zxzz/La010h6b?=
 =?us-ascii?Q?r6YVU7r0hqx5GbmuMu2PLFRL+gZpnMmBr0n9EytmGX8Rk/pml/dV3VKmywvY?=
 =?us-ascii?Q?L8LFzn2ExPnCv5Zg7+LCJLFqMfOq3LQTIj9Ce1EgImwLGBgU6BHtjnS7mZX/?=
 =?us-ascii?Q?teic8pbzJ963x/F9yWC1Et+uVQZtXaZBHRihBGgfc8Pkxi3FEKanefx02IKL?=
 =?us-ascii?Q?URqd5O0FzvTuKEEqvlNguxkj8zSl6QvRaxN3OgVpsQJmSNZXJSOx+tnDGEP/?=
 =?us-ascii?Q?73jVq7Wc4TgF5RWxCiR1rVZe6D6390AYMm8c0sbOnO4uYl8Q2Yg1ftP3p4s+?=
 =?us-ascii?Q?xmqKr/bll9pLJM0qwDXZefUO429Fdjpvqn438SRq2rCdbnaO6ONZYKLkzNfq?=
 =?us-ascii?Q?QaecWm2py+EHUDnAtLcDOpRBQVlM40OzgCjSdhrRdkIuZf9hjk1+jdXm5Fhc?=
 =?us-ascii?Q?IVJoOJaEDWALbBLhynZpzSxN87fgwJbFmrqmk19NGgHkRbJtYQ2V81giY+Ni?=
 =?us-ascii?Q?AQ5qxMSjjEjLu95gXJrYnh+o3V8B/2G0IKuuCv3rCJx3bjojsH0H3DK2eKS1?=
 =?us-ascii?Q?dmHzsVFGxdxAAZk8xnOuzrG0XjfJwJGUwrpGjSYCW69AIX2C8FJiLaqBl6oi?=
 =?us-ascii?Q?6s8eBhs+xY7vlNYBcwIkIDgAY+odxlUVPztRD0jWIwktdfBRM07afKL0A6tu?=
 =?us-ascii?Q?lGnQnDAWeyJ1n63TZSJuBwYh/ju/+J9FqzujKJ2QntBEs/5720DqQyeXJSom?=
 =?us-ascii?Q?ZvXFCdJ337I2Sjhsi62pYildUx0IOQTB5D4gd+ArsgwH7z+gTDnkdLQ2pGkw?=
 =?us-ascii?Q?Q/d8nfFGBU6BLkHJ6WwNOV6FEI3zLcN8/6izUdXiQ0KU3Uh/kRot6dB2hK3T?=
 =?us-ascii?Q?hGzXKJDZL258rRLSsZc/ZsWxOfUhUjtf/JRKbxlL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36edde6-8780-4cc2-08b4-08dcf38ebef6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:15:59.6069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QG34cf1FBL/8iCm6oBf046aSSO3oOzJNjkqmHTwXhncoHlfCyH57ThrmBrYebFpjEFiukS037ad3iQ+Q6111MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

On Wed, Oct 23, 2024 at 12:21:12PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Introduce the 'widgets' property, allowing the creation of widgets from
> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
> introduce the 'hp-det-gpios' property, which allows using headphone
> detection using the specified GPIO.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-card2.yaml     | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> index f943f90d8b15..f0300a08f7fe 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> @@ -37,6 +37,15 @@ properties:
>    codec2codec:
>      type: object
>      description: Codec to Codec node
> +  hp-det-gpios:
> +    maxItems: 1
> +  widgets:
> +    description:
> +      User specified audio sound widgets.
> +      Each entry is a pair of strings, the first being the type of
> +      widget ("Microphone", "Line", "Headphone", "Speaker"), the
> +      second being the machine specific name for the widget.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array

Is it possible $ref: /schemas/sound/audio-graph.yaml to avoid duplicate
these properties like audio-graph-card.yaml

Frank

>
>  required:
>    - compatible
> --
> 2.34.1
>
