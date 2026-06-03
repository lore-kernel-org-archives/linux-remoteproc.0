Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D7246781;
	Wed,  3 Jun 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494132; cv=fail; b=nGrz33wTKw54gN16Tfz3toyHphtHaDMx0M/9H7WohgEP0Gnux1ubjCTW+MC+6dVICrF5ksTzVVec6Jxw+H0i6Ywln9jGXin28M68Wm1KV2jrwDKuJYlPAIRGy1eld7E8EuKsPda4tOwA+gAdnTswIYZkbN1nDRbGIVPMsUN+h3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494132; c=relaxed/simple;
	bh=lNi2GCZqjk48Xffh41SC4z8a1uUTE7rlxzy3Ja3+Uvc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=egaCt/gKRtJwGLa+jGN1isFDyAn96kT8VwpFvJLWitL8au/+71F82JPL2se/w61P8aVmS3HZCI8IIuplADCm8Zj+MqYprjL99qg8kj60XgXj9X7G6n32munYBWageNhXKedWyqx4CvPLh2/nPIIa3QqOTHiWz+Wh3K24KUAOgKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qhyy+t+V; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qhyy+t+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKs8CnXULJCO4zzamIRsrkc/lV+eQn7Mu1RxNWekGo9k95zn/oW/9q105IkZG0xeFSOZhMGE3jWJ7D7XRUegisyb5wh0yOUdmx19hPlbPRXj6wj/ED/mZmtVYR/I5XPbv8CRuoxWVMJ7s2v1jUIbxX6i/YQwdVCh3SrbUCqVs4gTnNw6UZTA4b1cyMmJVJTIeUn0XrEMj9qSx+9GUH7rSXNG/LpR/Ytslg/VxGbRCbrSulbfYPPa6YGPXgzQNhe5IFKiOWDioBAhG1Z3BRIxghfHUUqwkqUASRGMagBpwLX62slEHZc21EGnEk9Zvob4bCKcO13M3f1Kgx4CRdT6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2+cWnr5k/fU6kdc/DpI/ROxqiURfLn0Uk2R7ACb4ho=;
 b=cA8CcG0F6MkJ46IEGnmp+gaTUQwvCiOfjM5FGKlq2dYmLyaDeR2i69Xeaa9X0VPUxft5Z52myi0JfbOV3vG8MOqH0WkaX3Wbw9ktP48odDAgf2UdBWf3wy0Ew4UT8D+e6qB0KKliLrf7+idLGsDNE3fsplkGwb4GOKlVNrkDgQz83tNDSXA8ZJ0hx8NVCASsTbfA7azjxqvUEjQ5J8S6AK6BHt0vMFAP50kQdRjMJTPsQx0Yr/GLItSBuSX2tjBxbO6vkOqoYDIihuqyUMdssgovh6BHbsimbudFtLVxUYAzmh9SJTiiYGmP6iuh923DzvsW0iaQ2gSOzYb0JxQt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2+cWnr5k/fU6kdc/DpI/ROxqiURfLn0Uk2R7ACb4ho=;
 b=Qhyy+t+VxqSfi11NjNKPycOpC+0Rdo3mHWfM0jMwJ6/xEy2UT5WNFFXZp7mcqT/Ot8Po6LSxMTdhtHjpvJfgUp/YV2HdEAlevW2xm3SH8GTCIQt+hiR5FitiCwNOAZTpBEAmqu5YQ+8nGk6FXalYNG5X6bJOwCaNKMh+7L0woIKmyWRkCyw99CcRYgQMlRXg3Tgihws7K0af0+BVMCnEBIYSDz0YQ8Li14jgAdu6cPBNDqfUP+O++2hhTd7j+H5em+yEwFXJjNFu9/a+WHFMdSUsNJfS07fhn6+/Twe8ld9ajN6OoCNNeNBd68cHcum+Uz/dh1gygIoS/D92qbuB2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 3 Jun 2026
 13:42:08 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:42:08 +0000
Message-ID: <944c6eaa-05f2-437a-88e7-1573b64468c5@oss.nxp.com>
Date: Wed, 3 Jun 2026 16:45:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox into
 the threaded handler
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
 Clark Williams <clrkwllms@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
 <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
 <20260603132034.NxZoA4pH@linutronix.de>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260603132034.NxZoA4pH@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::26) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd655e7-6491-432b-d265-08dec175e7d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|11063799006|4143699003|18002099003|22082099003|8126099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MsrHvujvutzpslJ/HLbdLSQimgR/MkqWH6a6essgE0RfgoEotc1vAN/4BCaZcATGvZNwUwwgy1Xt6BzmDdGXoIw1FcE7kIVB2WnrEUsEf3IkuY5E3pR6ZlMEW6s79XkvANp/4Wc+9tYBYKq9X89W3Ceh0XVlZlyemsRyVusXYX4fwqtQ8gx9eCTaEvRMfZtsIM+jhfqW4oXbtjiN538aZP5Yo6+f39ThOHPCjT2MbgWVyJXDmZOgd3TpRw+E50tffbervNaKQh87zSbkdNjmKzqL+Qoag/YfZO7Y/FCgh42rsttwFHNSxukGjsaBrDYONnhAxnb+c4FniOEfF3LsdfVuDNEN1o5dwN6+HsZBDND+qyX+VuWIfVT7/sKM0lmc5XGrglDfYEO8ipUkmgOquu8JclfK8OJkfUeLvNDy07y2Ct91Kly1Fl+T53KSaqz16/FCDdlmxarahq4PaIzxdIGP8tH31rz/4K3gvH1sjGoYQIxph1ujmk6t25f2LWW/eqoyLuaLrom9UD0N2WxneyFmewAPUkzf9N8Wug3dVIUnB7NZUgv9VpmHBgjgqD1mwFULvNajNqdEz+qalcYlNPUQjIvGVfTsyZANEHHWXBcgd8FsuZou5V8FmTjLKjhhxBS2XJd4e+3FsLfC5OuKp6I9BEXUpvyxUkokgvANB8qMflXPYskjRqzDyZgEglPv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(11063799006)(4143699003)(18002099003)(22082099003)(8126099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZTN0huc2tUdnZaaUdBT1kwQ0VKaFczYnk5OGcxcC9vZVRhNEFXZmNvcWlX?=
 =?utf-8?B?d3RIR3pGSTV3Q2RHd1g2ei85N1Mreks1c3NzUG5Ta3oySVVaK3ZmK05iU1BJ?=
 =?utf-8?B?THU0TkZhczFnbnptb0JsTHdodEJ2NE1ndVdFTUxYcnhlSEVYMXhnUzV3TXYx?=
 =?utf-8?B?aG1rRitKTE9zQkxyWnlDN1hUdWhWbVVHT1dJb2svSWZwU0VrMGJDOE5td1lM?=
 =?utf-8?B?aGYvUFBOelMvNC9BSGg4bURRL2xPU0YwK2dHN3JZbGpBdWhZVExXQ1A3aUZV?=
 =?utf-8?B?d3BLKzd4WkFXNUowejZmMnc0K3ZHbzJPb2gyT1Z1WVZmaE54c2J3R3F5aTZr?=
 =?utf-8?B?Skd1SzlCamhtQkF0VHF3ZVo4WWZSNldUK0VTVWtVTnlqdzluWnFjR2VQZmVR?=
 =?utf-8?B?eWwzS05XSisxTloxSGpWSlBlYkY1bmxoa1ZjRk9GQzlHTi9UTmtoOVcxdmpF?=
 =?utf-8?B?c1ozWkZsa2NoaDg1OXFOSFlEZ0JZQURNV2hGTUFoVXZkOVhtUTg4dG1hdm9P?=
 =?utf-8?B?V2s3TmZaVzV6aDltS05ndFZlTVpQNmpxZVZ2czlJU1JkU2R1Z2VhY0s5ZW5k?=
 =?utf-8?B?dElEVkptdXh5d2NDaVNyN0ZXanBTN2Z4dTY3SGxkMmNHWUVqQ2hLa0QxK1l1?=
 =?utf-8?B?RVhzcy9uOWM3QnZLamhlLzhncDZvdWVYRUlCelFOOTBMU2RxTnpGU05qOEtZ?=
 =?utf-8?B?UDF1QWZrVGZTMzZLdndUSmYxRXl4bUR2WEx1SjhYdTlzVDJiQTJGQlVYNC9v?=
 =?utf-8?B?aFJGRWtIaGZKLytDdFl6V1NKZkxIRGdNQ0VQMmZBcFBWK1A3OUFkQ1BHR2to?=
 =?utf-8?B?a2FOMUtBdWVhN2t4THA1bzBpdTVjQTZCWDFNWSs2OFowVjA3cWR0TDVMY0JF?=
 =?utf-8?B?RS9aTWdJM3hBRjBNTEN2TTZrYy9lcEhxZXpRc3J1U0I1MnYrMnMzOG1JU0hV?=
 =?utf-8?B?WExVckdCWnhlQng4QVBhcTNsaGk3Y0ZpdzgxNkxJKzhhbjA2R29vUmNCeFdF?=
 =?utf-8?B?TEtJeFFDMHBIMXdkNE9DT0c1VzFzR3REdCttMkFIb2ZRN0NpYjZ1c2FlaUph?=
 =?utf-8?B?YUhtMmQ5TVU0UDM0M25qZHBLS2dxZDFVZGxLQ2x3RGZ6Q3doOTQyMGxpN1JZ?=
 =?utf-8?B?YWh6T0NEdDJYN3hBRE5YUmd5cGY5eHk0cS9KUS9SRFM5NjFPaXM2Y3orWGhD?=
 =?utf-8?B?WEdEemIzb1psSkpRMi8zNFdaUllpY1YvQWo3MVZjUmt1Tm1YUmpIeTg1WXEr?=
 =?utf-8?B?WFVtR2I0dGs1WThGTDhkeVVtV1QyMkpyZWRCNVIzQk5rOHMvRE0xektlcmVa?=
 =?utf-8?B?b3ZLWWdvNjBjRUl2Q2Rldm9tV2E4S1ZnTndEV1Q2MmRrU0FEbGxpaXdXSjlr?=
 =?utf-8?B?ckM5ajg3cGZHZVI4MVYzbytuS2JuU1I3VG1LNzVDSlJGaTIrL1FKZzRRQjQ3?=
 =?utf-8?B?UnZzT0FYYnJ3YWhiNHpUK1RwTHhLQ0VFZ3FnOUJJSk44UC80MEdhS3ZHMGZa?=
 =?utf-8?B?ZlFaZEU1VFl4dUFBa1RMSlREMW45dnMxaHpYU1VCdkc1UU1BdnVUWStrbVJy?=
 =?utf-8?B?TkNla1dzZTltcVNMeWx0eDBNdy9OV25WZ1dKdlp2Zldtd29vUWNhekNpc2Ix?=
 =?utf-8?B?Q3UxSXQvaEYzMU1xUk9ibmNKL216QndtTE1kN2pZNG9kR2pRTTYvWkgwa2d2?=
 =?utf-8?B?Q0JQS0wzRXhwcGVpSGRJRzZaRjVoV1NxSkZIcG9zSzJZQm1jM2JaUFhZZXEv?=
 =?utf-8?B?Qkc3eGE3bWJBamNWZkFzdUlHNzc3Ukg1Yjk1WElBNjdIbXVkOG91TXBNZnpX?=
 =?utf-8?B?YUE1RXN0K3lCNUdnbnZPOWRoOVpSMTNkRW1vTGRZMm1qWWppVmtSNTEySy9Y?=
 =?utf-8?B?eEM0QkhLbWV1ZnV0YzIzYm5KTGN0WGFCc09pRHNzZkx2SlVCTXV2d25IRE5X?=
 =?utf-8?B?MzNTdzZqVWxMcWJuYmg2OFQzMHIrbk5rNGJBdlQ1STFvekdQZCtMQVNaMCtw?=
 =?utf-8?B?T3JFY1V2NU5MTkErUjZDQTN4aUpPTTU5VHAxOFdHUTNCa1hMS0tJYk9kL1lN?=
 =?utf-8?B?ZUxsemZGY2ZZM1czajljaGV6S1MyR291UXN1NnFjSXVLOVMzTlJuanlBZkdS?=
 =?utf-8?B?V1ExeUtWVVMrNldUeXhTcFBxVnNKeXJsRVhiaEt5cEVZMlBrN1NnT0NrRHVF?=
 =?utf-8?B?eTF1dkJZQlRJcEk3NDA5cVJnTmV6Q0F1S0RYVytCRUQ0cnFTTnhlRHF6a1Fy?=
 =?utf-8?B?ZHVsYVJXSmxBeWdwbEVwMUkwd1hmTDNvT0JMRG9HcFlUeW1PYVJmQm5mNzJ5?=
 =?utf-8?B?ZGlvRDNJYis3Ym5rQjFrR1pwR0JLZGpwaktxbmE2V2Y5NE94TzFFdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd655e7-6491-432b-d265-08dec175e7d1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:42:07.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgTBqD+tk1VjCT5P/60t/GeVP0ZL9mNGu0nMEakh8ZHJUjhO2QnpYXQo3i4rDbrxQtp85ihpJ/Ss4Upv9zPNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440

On 6/3/26 16:20, Sebastian Andrzej Siewior wrote:
> On 2026-06-03 16:18:22 [+0300], Daniel Baluta wrote:
>> On 6/3/26 16:05, Sebastian Andrzej Siewior wrote:
>>> Move RX callback handling into the threaded handler. This is similar to
>>> the TX side except that we explicitly mask the source interrupt in the
>>> primary handler and unmask it in the threaded handler again after
>>> success. This was done automatically in the TX part.
>>>
>>> The masking/ unmasking can be removed from imx_mu_specific_rx() since it
>>> already happens in the primary/ threaded handler before invoking the
>>> channel specific callback.
>>>
>>> Move RX channel handling into threaded handler.
>>
>> Hi Sebastian,
>>
>> It is not very clear from me from the commit message why this change is needed.
>> Can you please update the commit message with proper explanation?
> 
> The intention is to move the entire interrupt handling into the threaded
> handler. The primary handler masks just event, the threaded handler
> performs the RX/TX/ event.
> I move the individual events step by step so the previous patch moved
> the TX, here is RX and the next one does RXDB.
> 
> Is this clear now? The cover later explains why this done in the first
> place.

I would prefer to add the explanation for this in at least one commit
message to be there in git log.

Cover letter is not kept in git history.
