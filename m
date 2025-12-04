Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB53F2FC860;
	Thu,  4 Dec 2025 17:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868823; cv=fail; b=cD6SebkoDpSBa9RZiC8xXjPEelL8YVrzS8HrsggjtCKQLAK3kNIvjUrcxHxL7cQrC4kXNYoCfwYKQTcJt1qK1L1V6AAayTcw9umL2UuJoFSS4EkHzfytNv3y/kP5rNObkZ1uisDlFr8FZ7ReNZzNtu1INiLQ9skTJ0m7OJcgpd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868823; c=relaxed/simple;
	bh=4hFIyPF6+alJ36Fi2IW/m67JoQkegTrvYb9+t+uCIAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QUhidEJKWGzo3RjRSyweWwLbFqort+iGmYew8iM6RtTEdgxNnvE3UT6TpfA4zL/KRZRLEK0xqgTgv9s7QKLhE+RKb4yOQEOdF6rfHn84VJL/kLaebZPaY6XFPFvu5+pBl9Oijle/KpOnXm8UJsOxU/+wFpwQ5bpvvvSiq571mmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UpjZcpEx; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UpjZcpEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NI8nuxyID7Pa6zgk5BKro78Bb296CYy1UvCMMSLhHJAlL4bJOjs2kZjWE6O5nLVwig1/HNswGHUujvFoVCGG4mdpKfHP4t3ad+eritQM7UrWA+6BM9GDOLxQzBiGtciu6YPdXVRA1c/yaWbENnSoA2VhVHn4C6LCtKCDbApwlEXnxRTWJ8gppdGtLEbHHZ1tw+Cc9WP9oIeZCDf7hrZZvsZ+fgKCKYS3xUL7Fv8y4+qJBnbN5Lnuh2hVLHjITWRmCtTDSqEV4zHXzgD5/ShxMB0wFTXqs+CXJ8caFq37hOxwB9g0k3bDzbCMf4EzKcMZ6xS1R5tzxhsy6usV4AjOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2llOf0ksC/AAk+CnNTwujJF2vbO63W83HTbF/+5Xzu8=;
 b=B7YwLJdbgay+mje/kVcN7mSbPhYrI03ApkxhfTbtCA4j8SuYTKljz1rxqln9YnCFm1XUF8NI7NF1CQw0UCsE00xFWL/a9g4yTbghQohi0RIlOVID8jw6DwBr4kkOIlpog/dJHRzyZBmdTiHWL3ik3k7yVkAnH0pP1hUPZp6pTdxiS7iSVZPUNfcV3ipHZ/5WjJvaJp8BR/1na5wQO1cmquJLybE6GVdcAXPjEsXddEnJq0i3iOi8yTHX2cX2BWzWxbQIfJPgpI80Y1gRxHtF6l9fWG2J+ovoXsyfHs4vu+iynxpEe49zoEMz6nTEmBQDPMUaqY3EjlFSO9Zr9x57cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2llOf0ksC/AAk+CnNTwujJF2vbO63W83HTbF/+5Xzu8=;
 b=UpjZcpExczc1YlDxEf+gt+yTkF/OOY/JOhqcVMdyMlgrilPol9LzirmBiWBVEWK9ZE4jm3rmBfqhu/SIZFrnQssaEMRTT7zD9qmb3j9xYrWuQIVgYK6vR+VEtuNlEO1UPLVbT3fpVN6YViboBMF7fqe+a2r6IhpkQMLsQLA9tEQ4aT2KDhD+MHS3P6+6hGeSi11GuXxlKc+k8OQfHIKj8/8TDn8NaSt011N0ywvpNszCjRf3ng1uGRQf8PVy+ropLc6/5WovN8AUx5bg89fFc9yx+qzFuNa/ffDRhQ2s3JVj61J+Nui7vusymoPx7uJl9+NkZ6OewsDV4JtFgYSu3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:20:16 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 17:20:16 +0000
Date: Thu, 4 Dec 2025 12:20:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_dsp_rproc: Wait for suspend ACK
 only if WAIT_FW_CONFIRMATION is set
Message-ID: <aTHCxkHUKyLLurzi@lizhi-Precision-Tower-5810>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
 <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PAXPR04MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 484b17b3-6f53-4e76-a197-08de3359639c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?we/YNabtN6vRY0ximYWZMEZHDy1kPwQmD9wISwdzolrCma2CBbkpuTmhrbTc?=
 =?us-ascii?Q?SAFvpBZAJjhQdQLooyAnlVh4s+eWiVsSzw5oky4c0Su3gfqfMpVBULd7e/HV?=
 =?us-ascii?Q?ca9OiRKdwVyISLWeh/+T1uXbOQAih+rbnYAGIa/6vf4Zc1PIP7UASZIKRYvz?=
 =?us-ascii?Q?r2ZOElg0qt/1o936K7fiXM6uJCFtuMN4ewEUmRFNc1qSeCjbCXqS3VOWhiyz?=
 =?us-ascii?Q?4zfqmIBBAQSL8HZGOH1YJB4SUPUm0+QAoM5GpHpSuS4pTCTRko8tYa4u0lks?=
 =?us-ascii?Q?L/CxrHPboAYJsQ1wnX4K+DHg/pVmlW2Wq+Y5/JJGmxLwO3u5IEeFU/3Tw/cQ?=
 =?us-ascii?Q?MV+swrcgAPz2Q2K9RsCTVx5jElvYnUeBlrzLyNdT+w3ZHxqdiqruo+q7f0O8?=
 =?us-ascii?Q?LGrazkYl8O3Mu/yPJ/2QL1AnBHhEXWaUm3NMv8Q+dbXtaOoZZ99vUZJXk49Q?=
 =?us-ascii?Q?KZlBOzaRKNVrZ7Lr9NjR9ENpkzytgn/1MZDPVUBC0FLPfMPMEZVprqEeF4ZC?=
 =?us-ascii?Q?8wzWLFnRQCqlBWH84+H4T3z7RYGzlRMY4q9w0k/yDeWUaH4vIteWQuCifLKm?=
 =?us-ascii?Q?OOstif79SW0ZVoLL7XjPU+9CdjdbLUKlHSVpWveIa+vRSmtUV0rAyBaYVDUw?=
 =?us-ascii?Q?/Zh7gd7JpxpE5H7km/LNCc5lu1uJGqzkEkNWYrpnrEJJyke2etIItEw9ffBm?=
 =?us-ascii?Q?RCA3zM0fd1YcxOW9ASk7A0ssAk+IAw89rxbHRMcUwfm6hcXMrMnod/pV+3cK?=
 =?us-ascii?Q?BWLVz34to+C1cROHbWgNw/jyRChNc65GRSzqE0jj1RxJfi22HfIpEC9p1B9E?=
 =?us-ascii?Q?6J++I30KLY/YWRCeApMxMuX9PCES0OeJmsF20XYr+y/1UBK2198SFUMUMXKD?=
 =?us-ascii?Q?CNy+HZ6VFbUSjhoAyYCPHtIS/xKDgmBucqScSaLQxkBbWA9jh6DBTvJvMdH4?=
 =?us-ascii?Q?rM9xP5rDpbqiBIK97EoNZsFbUCF4+G96eMj7UhsUb4+MebC7DY1ctGWk19ly?=
 =?us-ascii?Q?cJo4iIYAnRkgR73hp2hD0KMRiXAHM4JkOJXdiOd/J8L51bCsM0c1WtV0RYFM?=
 =?us-ascii?Q?nEuE5XcxxGttbV+y0qYR4oGzEaNPHD87LXnebpKKkSUaiVbLQ7shG8k/QKYt?=
 =?us-ascii?Q?z/kqK7pDyEyss1yh/wFnAntqhnoHRmqhXjJHjRw4+sfetzGgPjBcdwrhIwBx?=
 =?us-ascii?Q?aFYSnjiNHa96zD1zcwpA1R8vt7HHASU6tk5Cclx1t+9HvAycjLW1k8F7S3hl?=
 =?us-ascii?Q?/2q/MYNFEnpfbUjHyRFUuL7QPSxquG8gmbJ0xtHGjIBM1wcd74qf5Xs695s2?=
 =?us-ascii?Q?xd801f1MMYk5CY61shG5KSlp+5bz+cRNM+32pzg1nXZcx00etsSo2claVBVl?=
 =?us-ascii?Q?0lZY7mO/abH4dmDmKwjkfX1zXHEMFsTH60Sfd65AGRW88ks+MoxM7UnqEwkJ?=
 =?us-ascii?Q?UZ5/RgSQsxspSjpe2b1aoER1l+hKHa00s6AIac3r74Y7g37EIH8SKhaqlR3u?=
 =?us-ascii?Q?2uD8I1WSFqyQ9W+kKXdN3Og5YdkOa/sxbU5+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?llNV2/XTME0hZRxwnE1H7QsrtN1qCOBmvt2r2PefCiBLhyPAEZDy/YG8xmjr?=
 =?us-ascii?Q?6C/AS018DBdJ/8gkrjWdnvs1cHCPdHaErMS7xdVSzdWX0MIgTurXPYOe8XdY?=
 =?us-ascii?Q?RI3a4xSCaRTZGLpJUrSr0pkIIfJEI7Oh+qbjrE9p/3xgzW5/7cV817FXGt6g?=
 =?us-ascii?Q?Yr+ek9nVZhtygPFzj6xK2EtYdUpVGoqeWk1L2qJxR1gdYXo+Rfbg1zA24ofI?=
 =?us-ascii?Q?nqelJLOnNWgIHWLinjbSLFsNrUOHvrOkZ+qSVJNsnvOpd16bsjcq0d9eck+G?=
 =?us-ascii?Q?Hdbw4N6Qdsqh1kukakxbiNvs14CZ99gNflDFOs74EMz/dln3Lt9cU951zGJC?=
 =?us-ascii?Q?Uc8hbwkvSMXqoZYUdDgbQj3aMmZpGHmmVtndArNF9bq0IV93o+zLmAU3Kph+?=
 =?us-ascii?Q?Qzly0HGyPMtkV/C5xwTQlC393zHfST59+lHhU2ljT0sHrF2Z6naAj5P3bLKF?=
 =?us-ascii?Q?9X98/GrTL0FrUCITyv7cewFKQfz8LKO5o1vVpfvAkTEhZNhU1I8Cj5rtf+5T?=
 =?us-ascii?Q?A80hOl5+5pJAT7jxsVN6AdRLyOGlme3V7QAyQXgQsOjv8hyypD1gRGtbJ4vH?=
 =?us-ascii?Q?CNge8etDxUhJN0D/rouE/lNnW3HZ6S3i3UxfyCOLXSbvaHKKkBJpSX9jE/MW?=
 =?us-ascii?Q?9GmrCjnnqM36Zh++7XhoF5hIyhf6PNJRWel7LXIHiEuNINtoZbv2IuF7Mq6P?=
 =?us-ascii?Q?znUXeWWn5lI+Ww7kU1E9maHHlrK/Hk+S1rx/U8OgFAttMymXPk56VLxKztFJ?=
 =?us-ascii?Q?DnDYCYh81dBv66BZjDy5ErvrkFIwrMbp1+oCBvmlPQ/2XtgsPSEn+04neahL?=
 =?us-ascii?Q?rDU1hA+ZG+7EjUoTd+K+hCQmb5SB9Al53gIcq4bd2Tq61VwaFMDOmSAHZSnI?=
 =?us-ascii?Q?RqDQ2mDLU1qVeP02SQ0gSrMwGEB/yKxfJ2mDm3eZSPYWTpQMsI9CHzEPom+9?=
 =?us-ascii?Q?V4cJnTnSjPCBYYVCcpZR6zqCM+jx0Ifu8DgZEtQdFf6W04BSFrZuYdXngTFZ?=
 =?us-ascii?Q?gePyxU34HlbUp8gIy8hn/xvXAlRdkhMXF8+kH3B5Y/P1iNlLJgwp6n04p0/G?=
 =?us-ascii?Q?FZruHPMdk8/fsB81M3IhWpO+LdpcP3cm6W7ULGRADG+ktYBorSdZbuMvvhN1?=
 =?us-ascii?Q?qKoapb9iQUg/SlZRBUl+qaG2u+9Hb9t50hi4jK2ughn0twWaVXefr0dft9Tj?=
 =?us-ascii?Q?ATPXwwdyoYD8bAxqUimjH4/tRw4zWYVwHgVcjtXrpnOba3oKkrj+w0gQoed2?=
 =?us-ascii?Q?9Obe7TwmW8us/CgNpF+qkyBDcd7huhVt0kiFGmgMh1DX8ArvzFWdREFJGA5k?=
 =?us-ascii?Q?ZOy1jGZzvlv0PQw0fZC6VfyZlKIOv5fpFEqZ0aZFDujw6RaKDr95GK8hlpi3?=
 =?us-ascii?Q?9nHJ+xdXRH5r0q0V9WGZGQ5exo+COOVd5dZNlTX9T7F/k9fyG/SOAh8P4v8Y?=
 =?us-ascii?Q?HRq8fcl8mRs+/teHAhZLbzZYiw4WhSvXZ0NwwnQmK0zkmoEyopD6zD7qPFus?=
 =?us-ascii?Q?I5cycziGvc5AzrgG859dXhEtGGiR3Ts/ewnh0yCYDB9ikzbpFKbNhVsJ2RM1?=
 =?us-ascii?Q?uhwkYFBXteYBKBdfdEza5pxuEZ+TnJjJdcYzYs+H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484b17b3-6f53-4e76-a197-08de3359639c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:20:16.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aenwti3bE9M2/GdJ5xD7iRHFrPS1OvusVw3YEr9tRO5jcRbBCH/iVQrUXuBdnM6EdeOsBeYdd6ysuaHUH81h3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108

On Thu, Dec 04, 2025 at 02:28:25PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> The DSP suspend path currently waits unconditionally for a suspend ack
> from the firmware. This breaks firmwares that do not implement the
> mailbox-based CONFIRMATION handshake, as the DSP never responds and
> system suspend fails with -EBUSY.
>
> The driver already uses the WAIT_FW_CONFIRMATION flag to indicate that
> the firmware supports the CONFIRMATION handshake at boot. Apply the same
> logic during suspend: only send the suspend message and wait for the
> suspend ack when the firmware is expected to support it.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
> - Moved confirmation check earlier to avoid sending the message when
> FEATURE_SKIP_FW_CONFIRMATION is set, since RP_MBOX_SUSPEND_SYSTEM is
> not handled on the remote side.
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 1f3a35756769..d03017d6b214 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1251,6 +1251,12 @@ static int imx_dsp_suspend(struct device *dev)
>  		goto out;
>  	}
>
> +	/* No fw confirmation expected, so trigger PM runtime suspend */
> +	if (!(priv->flags & WAIT_FW_CONFIRMATION)) {
> +		dev_dbg(dev, "No FW_CONFIRMATION needed, suspend directly.\n");
> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>
>  	/* Tell DSP that suspend is happening */
> --
> 2.25.1
>
