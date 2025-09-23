Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C51917CD;
	Tue, 23 Sep 2025 03:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597567; cv=fail; b=I0ok651rfC7dpnZJAnMNBHWHHnuHS/7NqTj9gfbwzdBPg/O1/cxUYIT3BKV27K/OeFvdMUd0zX1S7ewbFM3vPYOCCm0msHlPgBKaqf+gJ9jOirsFUtOaVGQrtMcma9CJZ7lONAqEclE2VHVJQt7+kNpQBO5MVaD6CnsWtL2sFeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597567; c=relaxed/simple;
	bh=9IcPnTYBGeYvK5DHg0Ktgg2EhZx5eUio4Q2zYfJliR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pKxD4G0lYd+iD9hvWQ7vFnUc9gGY4omIRlpfQNXBoUhZBEmhROR6ecdRb7yU3jxYCVagkS+ueQgfabPRd4FAGVlwsHIXI9migpjMHL2vDA7PnwhToYpGicgdPoRHlZeo2optIcyF5G84xXTjXp1S5TP4FS35n9x9ghTL0N5KHdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jTyMkDfy; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jTyMkDfy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9LQQ8cnZiy0vIZTuQHEmHaqMFUYIig1e+qi3DQJm7QyczojkcIISiXUH7Dh/l7Pat9XQDwRDab7nuTSSaLEXXF+cFnYMP7sdveBNvxCckFl//ETPARh0XxOM2GAt4w8Q3rNGcYMhml8nxOmjArA3sod+0pYZblMkbh/MJqTrBKdQm5O4vj/MppW1D+sSVxW2sxYhzUn3ZSFd72bjyXgR+p2MzpJmeWyPwvIxFX+vF1oOOuC6MloIuZ4HcJYDUO0aTfzPyKI6SUziFpy6J3+5Iygnxybju6wyXK5vDXSIHMTUpYXNFTg0C4GTKgdqFY15rQzDxdfHsNoZSZ7DPxbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTbZNARJlq5F/K4GK85V8hZbFf1ZA+2uVnmlvwf1j9M=;
 b=ETNVlZEUINHVMJQfWdV96s3IbDauSJ0zHnnwFeOGZ/0KfSYVhT6MSNDZci0v1qaPXoM2b9/1457nKR4NGSvCErl6FtYzTq0ESOB2OdQqu1CLG6wovLJaJj/xBMmUr0gG8azheIjmtXxutEhhJwcL1bhFTc+nF1toDgaz/lY1mAHlc0rdDMpoKTaWun8eomfPsAuuVQO4bEnCVu5dQvvUSwRZ6qa3NZR0v4DwznqJaipp0gTyWUnvcQxQTyJHy7lRkoSqRzPNML3blyMJSqDNH0yuDaYBBXseD07eCCJgqeIGF2RK2UXrSBqytyzYNBxe6pivxifAz5X2e1OXF92XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTbZNARJlq5F/K4GK85V8hZbFf1ZA+2uVnmlvwf1j9M=;
 b=jTyMkDfyMNpvHufrqQSw4pHThTJ9wB/Q9fySC9UPKfgJMuZcFd3Ag7D1BGBY+nDFClQv8gWxG83rOgfOLvi51RcZJ48xf9+VnrW/cx/FF0bDn3lITbFnPDXEIGs2Lbi5cpOOcXqdHi0Mk82z2kQtE8g7PuKPRdDaRtS5vbZqLid/8hVL+xr5PGrOvNtRZR3PHGSKuXCo9QWdwH0QlRuTJ9zcQIM2k5yxf2IkyvfEZK6QOlv65bL90YrpsRGxHPK/LZXa4it/2ZUkfr6e04VZi6l40Nahc760J0teRFdmHD5MIFZ2nbrW3W35o38F2cjkIA6nm5cHP3eLlkbZcNZxdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9679.eurprd04.prod.outlook.com (2603:10a6:102:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 03:19:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 03:19:21 +0000
Date: Tue, 23 Sep 2025 12:31:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Message-ID: <20250923043100.GA31170@nxa18884-linux.ap.freescale.net>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
 <aNF0LFkuS_hADmrz@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNF0LFkuS_hADmrz@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 230c9145-13e1-4f93-4eb8-08ddfa4ffd04
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZWtBWI4pcIp1UJXqXavBy/TS3v7Roe5qdEkmbmTn9iv74H4o/QDiSAeYU0Ao?=
 =?us-ascii?Q?Ixz9ZJgc+Yy1ZUkfTkMlZtpLYMtm/SFs/uOWTi4qFA0Sy9sbYlIJTflKhsZD?=
 =?us-ascii?Q?QiIkXub3e3CQX0mfQGOReNkPK53TRf8kCSO/lgYlMzLA7VhaJXY1WtYRXu2b?=
 =?us-ascii?Q?FyemwgUcsezGlwrPHjmdgHyUc4/3Y1CH4Ae/PcWduIaL+goETWuGJ51eDoF7?=
 =?us-ascii?Q?MRw5PU7utTKXJhjJ+VAiAaPz2nkIXZkwHX4VxZDqvqENGJ6iI2zr4Th9gU6Z?=
 =?us-ascii?Q?8tzpbrULaRZRzIL70fdg59HZTzfpRjDMs4rw2D/vcHjHG4m0a3gqBawNahor?=
 =?us-ascii?Q?Zl3YhY3UhARJHFkRKf5sGsb7hgA1fXT0VcjJwDn3MB2WvZEOr/Qql2gbunEL?=
 =?us-ascii?Q?LN0EVOgAo1jCandJ18FIAb4MexS3RVxiaCZzctIcnhfgWf35W4kcCQ49Keun?=
 =?us-ascii?Q?S4RLhRGI02Hbk6nETntEm2FKAU0PeFcpi+KbGRIfzkVZ4UkUNfngIVDqk6YM?=
 =?us-ascii?Q?qMwyvzoIiP7/rHjG/lEa7qaVfvccy3n9MUqo3+qKULmYOBtSgyNmLKx8gfZO?=
 =?us-ascii?Q?4EcAQbXGeJA0OswDtC6+boPrCXOrvw8hHeGuhScuIG6tZpwN8rFvQJK5AROx?=
 =?us-ascii?Q?iPWurvErrvS58AhvYdeosZua9WYEh6tyGr4Q2K/TPvCUiYliNpSx647VxV0k?=
 =?us-ascii?Q?+M4kN1z5AxgXpTmaroyRqlDL+UkjU/LVWbX41VfMDOiRc94jmZF0Ow23EPxf?=
 =?us-ascii?Q?8sL4xC3mfd8D8TmUtCDRsAUkmj41o220MRkH4FYSEj7oMIeYZLSsF9z31eSw?=
 =?us-ascii?Q?wZeEf/wZiAw7DM2yKbjbZjIzmyRWr1KQSihSMizk/StIfDNtWNRyR1jPAhfc?=
 =?us-ascii?Q?ITZXV0w5k/boKnW7zOple4+c5B6GHbVYJYZkuIAzFBXl7fRCSSynMussLP9b?=
 =?us-ascii?Q?goN9XJisxG2UIiTfrShgfwomXTdUNmuoh7aa8qWFuH3WEGK+FmaUJnv+X4uV?=
 =?us-ascii?Q?5rxWW7kzMeQtDvtKhQqsgU7x+OmVfZzZ1FaZXmndieqMjWmVlbD+E1yKc4lz?=
 =?us-ascii?Q?TEym/QybsHRyE347eVxxZDQB7YFd8yLhUlWQclCIG3EsWgrDqQaQtE65wphq?=
 =?us-ascii?Q?L2HrGGk9GFnKAi83tA9dcm3Fr3nDtYTYffV0fWxPJ0td2dB3JfgIsehtaHOD?=
 =?us-ascii?Q?9fS1Ez3mwpY0zPw3Cj/i9FF5JrLCyZNOsvQMyAc4AsTFG10NusngF9TJ7frJ?=
 =?us-ascii?Q?IvXhjXKBeod1Hoce2pPVDCQunJFqryiKsk8no6mnVavC28gOsc3aOxtuYgMi?=
 =?us-ascii?Q?b0NcGvvVdyXnYiI3Hs0ZKIda7uuEO4Z5VRf9/oNy8xGCvmb1tVLqgqcPcDx2?=
 =?us-ascii?Q?8XTv8bwTDuoZuD6mEicpuwfXEpvUMBAkRtHhQppeFnH2zGGdb8Uh63nwU9P1?=
 =?us-ascii?Q?0aNII9cMnVB3TTqXqwTBN5SPlamHotb4503m2TJSbLpmuDSx1qAgMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UD+tMU7XjMUH/Mjr3IjJH+S4ZnSJlhycap/ZrRcP0Bw4EqTXOBVykg1ydo4f?=
 =?us-ascii?Q?Ye3kU0hzZRlBlCMoMOhI2lMgvq0IPkjjYQgQLOFXFtegUJSuVRGu3F8AA5/V?=
 =?us-ascii?Q?Sugb+P2LI2q6UwKIuhKUFcAgkC1r/hziLYwjTUbB58x6p64KZCPd1LlzpC3d?=
 =?us-ascii?Q?3hKrxu8lfxvKpny6Nmoj1MOfKdiLDZxVCwLMeR8FCNxtcX0H4q2aacgsjTaY?=
 =?us-ascii?Q?5NrQcuTrMLnwCc5r+sZv7FdMV9rgksw49ocPxbEz4LzxuxZ82A9NeU1xumYF?=
 =?us-ascii?Q?fLTTItjbBmw5IOqWnUUaT15i1VLA6y0XrSgHAooKKBvMs5JNGa3sK4UZ9o3b?=
 =?us-ascii?Q?fVAb/YYMuve8jKOxH0TzcfGi765xIoyhHcqJoXb+KDcRB2mNhWFIPOblSqsc?=
 =?us-ascii?Q?cuqC1AvVXgOOjyOSCAPEQye0Wx0jwtIPvUn3XN/T7Og5bqXb2z1+k6f0fTDz?=
 =?us-ascii?Q?+BbOjuAbNDYqoN4dGxQGjNPZY69TMqXP6MZosBLyFhC2oz0uVpamjvRkE13r?=
 =?us-ascii?Q?JLV0z1VpUdJvHhik8fXmt7zdVze+HwjdRo9NxevqlXi7+XRyOx+5gPXTNHHS?=
 =?us-ascii?Q?cAyLyYbKkd9IAHsxIDELVP5msFsXHoyo0ErFTy6or6kxq07LtYeJLE9j1U3U?=
 =?us-ascii?Q?r8Zn9/B+aOyzDHjyItNfBDVf0G7iCmx2fGqPfszAlkHrBKaG/8KlvY3bwgVp?=
 =?us-ascii?Q?50S39DBunzXLKE3bRCNOVsdxDm9VvlE4CB5nbxasHa5LohVOYsSgBFvKW0N6?=
 =?us-ascii?Q?HT6Rx9yMe91ebd4xWzPn+FNF8bFHbMFOeP5+L13qzQK5dI8fsowdHGzGNbsy?=
 =?us-ascii?Q?INgq4bP9Ft/b5Dc26nq9OIIvs+5yPPTK6CZSAMeeTXutrnhTOiktJxcvJ//Q?=
 =?us-ascii?Q?wzKB9hnWsMDRiBhP5BsNY+IFZg7svPTQthb4TcbZ1QUvEZhtpiBqC01jC3qa?=
 =?us-ascii?Q?Ck32H8BrsCPVLRI0jQVhSrayUUkwh2lzvaHJqGg967O0v/DiFGl5SMNxRR8U?=
 =?us-ascii?Q?tp1XDiyanqcsUuCqqDKyfeXMYDw7fMJDJ05J4seWZC7gxGVkxRznnfPIqElW?=
 =?us-ascii?Q?nreGESmuNZyNhJVVWwilrtGqOhV5Cn3WPo/nx53wUt5r5UtaJw6dMZlZo1yr?=
 =?us-ascii?Q?4xNsJ8WkCYnOFoKYoBTWzx67AUuGDgVuXL9WzvZQhM18j3K7PyP2iZCn3ZuA?=
 =?us-ascii?Q?NqNhR/UALevU9DbCiKKHe2hsD/HJ3GCy8T9hRUxFrZ9Eg9Hp+7Kou+ldKO7i?=
 =?us-ascii?Q?a/eSr2zi3DLuOD9zvlu72AVnhqXvslj7LKGBICoXCwkVSnr7B1nQuThPke27?=
 =?us-ascii?Q?Y4jDmfr57KX6ZrCSSJUrACxDfDTSJATAVrlD49wxnm2hoD+gd/UrU+VK/qom?=
 =?us-ascii?Q?7+1ZQMqjpf0v+E1NFc4H4PhY6uKtD0ee2frM5h+cr7SZohMskVeeDTBrEMUW?=
 =?us-ascii?Q?1JljOPe2VQx5mvQB6Mj39+n/5IwUTVxGOtX2li/hbamJhCPOAK4xOKsQ9LDJ?=
 =?us-ascii?Q?FM3q8dfGyc7AugYUWhut9gktY5QnSpa3QIqoim/dP4ztlCrYObegyBgxx7CE?=
 =?us-ascii?Q?ZxjoOGVi5x0vAlA9mSAsez2ltwu72lPjB2/vwaOA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230c9145-13e1-4f93-4eb8-08ddfa4ffd04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:19:21.2889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j1WbnRU7pQNs30+SkvCl3zsd/2vznZNrie05qBAHiJg5t9D7mlDqZxrZdhEXoWfnG8b6cbGqHu7WY37uLxEUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9679

On Mon, Sep 22, 2025 at 10:07:08AM -0600, Mathieu Poirier wrote:
>On Wed, Sep 17, 2025 at 09:19:13PM +0800, Peng Fan wrote:
>> The order of runtime PM API calls in the remove path is wrong.
>> pm_runtime_put() should be called before pm_runtime_disable(), per the
>> runtime PM guidelines.
>
>Where is this mentioned?  I have looked in [1] and couldn't find anything.
>
>[1]. Documentation/power/runtime_pm.rst
>

Per this API says:
int pm_runtime_disable(struct device *dev);`
- increment the device's 'power.disable_depth' field (if the value of that
  field was previously zero, this prevents subsystem-level runtime PM
  callbacks from being run for the device), make sure that all of the
  pending runtime PM operations on the device are either completed or
  canceled;

This implies that pm_runtime_put() should be called before pm_runtime_disable().

Thanks,
Peng
