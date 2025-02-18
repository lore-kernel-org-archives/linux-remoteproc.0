Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013028.outbound.protection.outlook.com [52.101.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4826E154;
	Tue, 18 Feb 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894304; cv=fail; b=MKlcbtUUXhEyhyiLSnn5dl3CMz/7btcpD3c2j2xFZ1SGVOoedw6cp4Wsi0aWuhKl8+7mQaCHFjF7VPHBELox+SqnDgVW6oue+0PbGkJENaxxg5fCsEwdK64QpQ+iINfTNQRJXGJDGXs+c4yr+gQJ85ab5SA1NaOBweylNbZclpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894304; c=relaxed/simple;
	bh=iEvtsUNcL5Wm32nbDXyZtNScG37at24HeQV7zfVSXfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NutTf3VdrDZeYguj+dlnmYy2yBguldLK6q+sVmaPREsY2/FhTBFBKzsTzhG92Svdt9euJukzZR2CQeI+I7MMIaVzGAlZ5vMk0bf2wIRbiO4NAKe/6zld7r5dKtT1z4EXWW711Ozd/G+jE3rbJL+MGLfAMF7Qgo/hc9Z8zxAGGaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cqlo6SaF; arc=fail smtp.client-ip=52.101.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cqlo6SaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAMZUZd+9tXtTZCFuTprnrROBjJFRTJ5NtcQgian/FETCt9XCt9STIie/Y+oS6+BWDn2OUx4P70LcTc9wTjoDwtUO+EhMhm2zDAPmVCwqCr0/iU+PNffelpkPqMPqdWUT5ES7EcS+rPCzNBuXOg+1oxT4uNHJr9JHETjeHgH30xSKv9Fs7rTcE9mWdEcXcOEGreEFaOLQAzYNWbuzfTQ9tdkvr77ZXNAI+wpNqQjG6Oyd6mtbZ86BWHQ5J5bGWS4lXWCglADmoHXQMQitax8fiiKWiYFM+SH7FbEw4RJ0gNyO5WEgm8Zj9MtmXCyzYTpCWefyphNN8DZd0wS2pKlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd2+Rcob8VDALPdZdJ73+F7BbDtFFiuB6K9eOHYWrlo=;
 b=RLx5MGiGv5Q8hJEJqzpHMtaG/OeywDdX7rvCrLnDQEhJxrkRR9Bg2lsMaMUDnWGrNActUHoP4cHuX98YJTxX5/yzpufJdh9lyHaXYXNy/1oKsTAwlChcbnefmVuQEERKQCAf5ffl1JZPjQCd6XrUDvXupRdPaKANx8MXy74wDIZ/Qr1xPCOc9RW05GxmbClL7W3Hoo5FETJGcEIsVNrkhpk74gdxGneiN53ML8k9YLGMiIKtJ5ae5XFvriL9dO/VGPLfZ4J6P7pf5ZlV2VrtP5eI+FrtdSJ45lez8HTEXlYGFABRcZ3zTPNLFvOc+M31lqI0qudlgDFgyAOq0Oc2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd2+Rcob8VDALPdZdJ73+F7BbDtFFiuB6K9eOHYWrlo=;
 b=cqlo6SaFnZ62Y+GFTHBs9dI2qfj/S1Msrbj8VXGb4boRkPIPzC3o5zxntO2KZsm1VNqdb3eeDwtxHmGV1yV/z0uWNc2Uj4o+Yk9xM0m8jO8OdxS4Ad2Ptj/gZyyHI2G2O4Uyj1r/yUhAxsEWLUbzxk/R+vMAL1nRDQKkuET0AHDnkpR47py24RuzaN0tMKceX/1fFTItwqFftvLHMEtM9ZFrp4A5sMqT2ge6mWRjt042oomfVxtMIYlh+wDTxOPAuBquzZ15ebdfLqU6oPMPIgy0uOrUfGCuTcAGEjonIB/xarVtlZgWSwuPmShNQkY20ft1IKEjMzPlnCezLQXO5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 15:58:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:58:18 +0000
Date: Tue, 18 Feb 2025 10:58:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
	mathieu.poirier@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com, krzk@kernel.org
Subject: Re: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low
 configuration option
Message-ID: <Z7SuEF143A7vEQNr@lizhi-Precision-Tower-5810>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-4-daniel.baluta@nxp.com>
 <be4e8fe598f8a56210154c40d8a6d973a3fbeee1.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be4e8fe598f8a56210154c40d8a6d973a3fbeee1.camel@pengutronix.de>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f71cc6-664b-49ea-15ac-08dd50350f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a9pNtSmBMdkMl/v0Z1OETVbJ83zZjNnyJx9n9gBlAHTAuMPQmpWUeJxFd2OA?=
 =?us-ascii?Q?IggL1sxSP9ibxiQAv+YV4lYDcTPCI2vg/hL3fvUh1KU0UJrr42/pXpPICqzE?=
 =?us-ascii?Q?Whd31yZ6Bnw+aWwONLUwZM3x32bFLyDNcj899xzA8X4y/eipNGx6lg3fT2wu?=
 =?us-ascii?Q?X8VaiG7EI+yXMzxbLmSHjEZT4+P7XeYHsJas70xMqCmz48ioHLbMWOXK+1rF?=
 =?us-ascii?Q?YoAzNd0GZtJB+WZV8b0oOGZ/NnrLJHU8dXA0Nw3z0ZhHb/+6UK34vhCaZ5lQ?=
 =?us-ascii?Q?G8FFJPvAmWnF1N3UUTYfdY4IFSEU8E1vEJECpBM4Y/n1HijXOKGnW3FCPRiQ?=
 =?us-ascii?Q?8xYCc4JQRdFfUiZshKqBxYnmLYKJSplL4rwj2db8Cz3PDVzjsvSS9wsx0VoT?=
 =?us-ascii?Q?+kY1twBQI+5aK0+0smP4wTYWH/7zYoc1EtQp6tSsORq2utVs3Dfc34z8y+lZ?=
 =?us-ascii?Q?IvqDbgbeF/ZrLoqnvFTJ1Vp+dvaJP5vccb/K3xaGCg01JNNf2sc8H8CyIFjb?=
 =?us-ascii?Q?I6Gl6AC+PS2eTKt0Qmq9/KRNf+al1TLtwylRgkQ74AijvDgcQdhnRY8F7epa?=
 =?us-ascii?Q?AlnfcTFFf+YJR3usBiL/9eaL4LMAD/EOSUSjiP52xEvFMgOcbeQHKlE2ePwN?=
 =?us-ascii?Q?ZUDFhbyLhrA97+BKzVlgb+VQbrwqfyZXtvVqBuFlz1j18lDvNpvrVeCJ90Mc?=
 =?us-ascii?Q?O08FxA63qdcBXfBEEf7aVhruDO7Dx/0h9GM2rkNF5ukvS4Q00P+/OWT/EEpM?=
 =?us-ascii?Q?bAC6GLdhPrOy/THf4yUJHFuxISGSLwsD5qUEqervnKOkZa1izNCYs7kF+xiS?=
 =?us-ascii?Q?dDxY+QUmsE9DGzJpqnksqpG0q5zyWjHxUHzTuMF0m1/ZVhuDfmUEC6blkLVo?=
 =?us-ascii?Q?DYlDwFMii4wWwMexTQB/O8xoWZ5PcgHfknDpz70ktolQwhmgdsxp2uIytlDS?=
 =?us-ascii?Q?9gUffGXo4rPRtbW+7lt5QcW877B7E6wFb96X4t9i8k22SIu6NcjKZZhQiT+3?=
 =?us-ascii?Q?aePvq5LpGxqiOTHU2vkb/hQLWR1yXu4mFADjLmaHdztNOgS+BdSXoUMwDKDl?=
 =?us-ascii?Q?b7ptQIjOK4SiiTUly5qcLzk/ZZ4Zj/MUhP0YAzaI9YzGkYTlXNL+p/H2uIMq?=
 =?us-ascii?Q?4tLoIAIbtTnOGaHXDu7zKa5syCQtNbloD3fDB8idgNJlTo3XPUQwSDSzEe4G?=
 =?us-ascii?Q?4FE5E73at5pKyWJZXWhqvK0BNWSXq2WeWEgrZLSS5xEVAC6sHz2oIa9VXDmW?=
 =?us-ascii?Q?q69o8+qi8crVhXrxKle+V2gSNFQOfy5iGNs0gzETUSg+I+FtplISUWZjO7//?=
 =?us-ascii?Q?ylBpoS7RDcroqotlGBIRtZutx+V18XRRdRuydIPUb0258SOhgWOH18lViRsS?=
 =?us-ascii?Q?lYYyJyItYwWO/b0u3flKxVShZJ6UBKj7xTBDtWc5zjGrOQ8OAcQkbB3sEBR/?=
 =?us-ascii?Q?Nk7l3YdYsDSO2R/3VBrl+s81eDk8m65z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hxC913zvLYjqb+rarKiBw88PNwXS/Rug50rwc73fEdv26F6MoGCcatsl/R+L?=
 =?us-ascii?Q?uEk8i9ocewWrUIrX7Du9/7+Sg5FAYpYF+9bhkkGk5CZjVwy0bVZxnOXq9oCV?=
 =?us-ascii?Q?7g4q2BwIGalKAub8yON8e9lqrFDDFQDgHHTnOPkYW/WgOm33o+gLirtmRUT7?=
 =?us-ascii?Q?bGH0TW8v4wMunt56hZkFzs+XWextK4gCzaokhLGRc/dEJEsJW/BeAIltLp4L?=
 =?us-ascii?Q?UT57m2C3j0QRsOl9/Sr0b0cA2MpClZsg5B44Yi2yi1rMwwg3/+feE4NElzAX?=
 =?us-ascii?Q?Vk5qDq6vtbR/UqDnEOpUCEQM2ozcFKbriPUlqMRixo9rZigSdml8wLRzRcF2?=
 =?us-ascii?Q?15f3TKTesZ3hZFc/WUvwYzxk7CIWGV2aC0sIijP5pa97KQNv6r6q7/V+GsBj?=
 =?us-ascii?Q?bPVbH1fSUgPxXZDQM0yEz+yvux4F6IcBa+BD4DnywJg/Y1SU7Tp9DdWZ+/z2?=
 =?us-ascii?Q?m7IDIuq27EFH8e+UGKZngpyW2sYYbmab6xGVJWvZ4rXN2NSbw2auYh+fbBxy?=
 =?us-ascii?Q?YWymqBoG4Urp8WTNRSgSsew641fqZYvG/C4QbI+G7pzw5T/7ghtgKENZ6Nma?=
 =?us-ascii?Q?6rVRi8CNCgSm74BQaclzrPV/5m8O2FEVHN7Q4HYstaq06ck/dpxdsYgqLY8b?=
 =?us-ascii?Q?NluAGddow94FsFBny8oai1XfkrhiuA9M5Imc60BbHo2rAe1nRFEKOhGExbZp?=
 =?us-ascii?Q?tkdzGOepvbqy+TGr3/HPifOjTC3e0qiBwvGCVxN8rU1RySY85r6jV/feLtAz?=
 =?us-ascii?Q?wmcug0pCUNC8ihJaXVO9w0y69p25PjqCc4HQomGgYUDxq64YbM0aNBVwyrA4?=
 =?us-ascii?Q?AbVlgvN6Jk9+TGjyJfzdLL4lmwjmUs0cI5lsXe1fWM4EzvWWuVJSL6s5rK+g?=
 =?us-ascii?Q?Mv/U28dRhGT2BJcvL7OG/H3W2nQEshXHC+WuSn8JsZmui5yVF0dfMtr0Rtup?=
 =?us-ascii?Q?Glnah7hvCiKJzuk+MvibdxuDT3N6DTZBF5MvLRy641/aJpQ74wxdsEakgImc?=
 =?us-ascii?Q?YRNgXS11zuAfK/s5AZc7dzn7BadvWWSVUgcPeAnhEdGbD7la/KjU2QOzX4bj?=
 =?us-ascii?Q?XN+Ww08jV5APwzDbE+gsH+G7PjxXdrOc5B0IgyBp0wThburhrr2po5xjE9WW?=
 =?us-ascii?Q?VoHOooA7V7maVVqOeg2CfZYFcv1qGZ6Eo755LSv6VvbnAupGXCAx52T9LaHH?=
 =?us-ascii?Q?uMVxuswp/GRPqRajgMzhGCen7abiIaRrCnOUoovQyMAJC3HkCk97q9nkN8rY?=
 =?us-ascii?Q?HR0nB4vQY2usyerKeR4mTe4e5N4gG29S56zIbiL3BWpeqPNCbyitqB9eqVpG?=
 =?us-ascii?Q?sn1lP7JgRpI6wpI5+aXj+yj10SwEXzDx4KYgeQj6/K7GosL4LfPuS5yVqowe?=
 =?us-ascii?Q?Ltvcwr1OpGsI8anm2EHkmHCVcFD3SMyfcnO1dtiT8GjMRYxCDaRblzV41TYQ?=
 =?us-ascii?Q?pDmDUzhBR1ZaWBorcnK1LW8+Pb30x+cYJzBHrhXNcz1VcSFwqFIc2VOOHFJB?=
 =?us-ascii?Q?/CzBsgQFarPovpA4mth+gXA9W95xEQKFLG2NjWzarSWk5MKON7pQGI66rZoW?=
 =?us-ascii?Q?1zhezX/R37TZyEKfJbh6BI/VUqNUO0e8mfUUMbBs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f71cc6-664b-49ea-15ac-08dd50350f4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:58:17.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hzhjTbQ+nvPcYteN8v/eVfFf78y5FtKP+euMIfRPEwA7yarGaw7sh+fOt4kypx0cxDFh/4Taz+yFzoZN0ODkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On Tue, Feb 18, 2025 at 10:30:21AM +0100, Philipp Zabel wrote:
> On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> > For EARC and EARC PHY the reset happens when clearing the reset bits.
> > Refactor assert/deassert function in order to take into account
> > the active_low configuratin option.
>                             ^
>                             missing 'o'.

run ./scripts/checkpatch.pl -g HEAD --strict --codespell

Frank
>
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
> >  1 file changed, 23 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> > index 6b1666c4e069..8cc0a6b58cbc 100644
> > --- a/drivers/reset/reset-imx8mp-audiomix.c
> > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > @@ -23,16 +23,19 @@
> >  struct imx8mp_reset_map {
> >  	unsigned int offset;
> >  	unsigned int mask;
> > +	bool active_low;
> >  };
> >
> >  static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
> >  	[IMX8MP_AUDIOMIX_EARC] = {
> >  		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
> >  		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> > +		.active_low = true,
> >  	},
> >  	[IMX8MP_AUDIOMIX_EARC_PHY] = {
> >  		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
> >  		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> > +		.active_low = true,
> >  	},
> >
> >  };
> > @@ -48,48 +51,46 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_contr
> >  	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
> >  }
> >
> > -static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
> > -					unsigned long id)
> > +static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
> > +				  unsigned long id, bool assert)
> >  {
> >  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
> >  	void __iomem *reg_addr = priv->base;
> > -	unsigned int mask, offset, reg;
> > -	unsigned long flags;
> > +	unsigned int mask, offset, active_low;
> > +	unsigned long reg, flags;
>
> Nitpick, I would make active_low bool, like assert. Otherwise,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> regards
> Philipp
