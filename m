Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A840B6DE;
	Thu, 30 Apr 2026 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558460; cv=fail; b=I1SvjQc+c639QTkH/qDEaipb8AgE0JYD/bGbP68l6HE7JFmls7jYCDRRUAj7YC0lvy6stqFfjg1RbKag9EBXfug8fMsR0Mm9jLgg6PQSKc/mJyCVeww0bC7t4sR7KP8yHsnlbDmJXP7hmrc5CzJJA80QxEKeO0T1O1hFx9uIpXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558460; c=relaxed/simple;
	bh=KmnZGZN92OXjVB/0WyW/LKfclb1iHDQArTqlSh4a3jg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JLi2xnNDh5CzY8AcMcXhWN1mBYKKDd+5v+qrTenFR3vUzNA9a0NLoXwbsiSHh+SbFI7/500FjdL46MGgilHWm9rtBB3bxVNpV2ko8PiiagnFpdX2k/s+V9a2WO3N6fLrh6msMpsznQ48DWy5BRLpgeGGaW4HPGmi1A+AcSvpBjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bd21AhFt; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bd21AhFt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWDzXkbm/xNULyb899+Tt/hgrhyjOBUDXJbDxAbBsehlEiOeArCsAeicu9oaNiUNGSmDHm0Bes4O8NPfYiTr7/i4mFv8F/+wpU3DAGlh1duLcTMnKIQVFqy1dMlCWRzfoNebD8C2Gzl9acP9viwjEbGdfPgLLe9Tm76L6finfHAJePTHr/gy5Peii6Kler11LtYPrT+Gwiv5tXcQLVef2E1Lk2Cprb7r0jqN/2MhHpVKsCoIJj6/Klp2Hl5PJclOoV91CPw6iVGH+/xTgA3ISvnUg8HukUyPnRhkT942xM65GsSCVn9Tr+niEXbrCUfAwbUwT0k8lvatuV96HaLa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwTVMVtLxobXUnsPlLiEvxCINGrPGhgk/Cqt01Hm8+g=;
 b=ra9pM3d15HzLIRMvDcQJu5Ui4BEm3M3rZKTMnsMfEc7W4i5dJDdksHbQaY8TMwu2b86Mco9lzpv2kH5U0Xu1dJoT8GPxBnF0CUPP+uZU3dD7BPyzhiLqd0f7M8leqtp7ruZ7sz+ImRy4beAri0mnz01yVjd5T3lWjbmBW2+oQ4wXP/aa1NlI2VN04IHfwok+9I+i6CpSQyqsiUeI/+sXauF860reQt7wpYi+EQgEc6nxvHGglQocQuhxH0k4+3t9lRVO7U/PSOlSONWVGy1FbgP0JLPpsyOXeXTVct8G3MoADXEgoAC22Ax3UOhTcN2nf0tC1/5cFiGusRmxGWZ88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwTVMVtLxobXUnsPlLiEvxCINGrPGhgk/Cqt01Hm8+g=;
 b=bd21AhFtk74XgM+r9S98ieRmpV/WQtLh6pVNEQ8EH8zjOkWnFtV07H1UFkwgIj4jTiukNtroVYQgmfRyicEa1jzZopZ6dRN2A2v6nFrZqPbx/fXJyLT4ZKtQ9qDTDtB5B4mBSSC8xp3KhRW45Gn6sBOMJjaomlOYXF/4y7ITgny5qCZQPkoGr/LYUYYbP45GJHcWVVmfke5cMkNo3cdLThkoTk4xqZQdxBtQPWrtAWu259iIgYUvsrVnRHDg+k32QuJ6tfE5S+IAKBqWzkdeBMJbSG2ZGC2mqdDkW3CgduxMK5s0pJ32sQg5jjcSEIwHzky9y6ufweLEzFSRMYImpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB11962.eurprd04.prod.outlook.com (2603:10a6:10:617::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 14:14:13 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 14:14:13 +0000
Message-ID: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
Date: Thu, 30 Apr 2026 17:17:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx: use device node name as processor name
To: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com
Cc: daniel.baluta@nxp.com
References: <20260430061701.27270-1-Jiafei.Pan@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260430061701.27270-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::14) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB11962:EE_
X-MS-Office365-Filtering-Correlation-Id: a813c546-3aaa-47c7-981d-08dea6c2c11e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	p9pdpkwHnR3vYN8D4n5ETKNQ0vDmp0FfTaHUBE6L1G6NH3fxMaBcKZWtX777/5ky4D9kGJF37r3vvGo9GCB0azr96Iv6b/edx7iuoPSF/4GODw4W9iJcqyIKfyP+GZkAP4+7/pI+C3mDohlouWG4cplkNZj26OgQ7X19/WR1i+aqeubxy19t+cyQIIINi6x080cgx40rVfVVsVEYP7gYIy9osahl/sTqZJfv7v535OqaPM5v7ubMRtT4qClh2P2OUoaN5HqWBmb9rJa9SBQY/ZW2roiyHUdAQWbsOS2V15BbY86TgRnVT/RXhuHfycY8sIMQGcmL/SYUsq+0Zq9I6/PUSP+5pTmt6RR+tLJJD5uS7v7R65tTDa/yVtUi8wiO7f1O87WYD1DHQcXlxdxrPXtuBmjCTHtmoLtqbhM1m98E6ZJ0C5eHy9sJTBozCgUF8u09KJ6yMn3BKnr4FSlNqEmh+HY9CkjiecgKaa1ZAJr6/ECrBIreTr7Wsdp/d86cnCf+NSl9AscXEkChzzA6DK6l0T/MxXkuLC7JSrB4zwsFa0XXWePDKSt0klmyvQRKD7wv7VedO+LAfoC+pvlFizlr1roydcyRR08An1ZXE3VttM49lO9kRygq5ICXxwB5HXAwg1DpQGDh4U6eeXVDKIx1tkZg6dDLNXbWSoeDgi5rwejROCS7nqR5/R8H9aaVG0n8Mv9NpxLKIGgJuruKeP6759pCUzmSsYBlfSg52X0tBhHkcbrOF2Ky3w/3f/vsy2Kq0wuiAsvKBn3NjgLO1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBKcGxDeGpXYVp2TFdVS0pMSytjZmx2Z0h5VkhJLzdCTEo5eGhDVTVmb1lu?=
 =?utf-8?B?dzdsekc4czhpeG51UnhocnhBL3VFM09CZE9NeldBVHhEMlNobmVpdHNMUG5V?=
 =?utf-8?B?b1VaTGdyODFBR0pBSStBZzI5WkJ1VmNHQkE3MGxYL0g3T3RtdVF2NEQ2MTZx?=
 =?utf-8?B?TS94aWJtRlNpbENZaHZPanQxSURYNjZTVURaeU5FYW5pTmNZbFZrS0VLVlEx?=
 =?utf-8?B?UXhNUi9oQUlBZ1pUMjdmWndtcmhHVEx2REtYYU93b3gwYjlTd3BSTVNRSlk2?=
 =?utf-8?B?MWVlaGVtem52U3QyT2VpNWpuazR1V1d2NHBXcThwT3doQWlUOXdYZ2hSWVor?=
 =?utf-8?B?bDlSbXN4RmdML0dJSGlWRXpUUEJ2bG9sZTdmZ0o5dDUwY2R1YlB5dGpIUlZi?=
 =?utf-8?B?dUttUzRWTnVtWjhKbEVQM1NoUzZzQTFqYlJzYTBuSnFaRktVU2o2dkdpeFZY?=
 =?utf-8?B?TDg2QWNZNm15TnFlTGFPamVEUjNNbXdpZ0ZYb1pwTkd4QmxQTGFEckNpQkJX?=
 =?utf-8?B?MEsxOUNXV0hXb1ZBM0lRM2FkV0grbGZJVVdMMVVndEdTV29IcTBWdTYxK2Fs?=
 =?utf-8?B?RkJVL2FnZDV2cXF1RGNiSmpXaWNBdjZXMi9adm5BWHRIOEtDaUdOUEdEd0h1?=
 =?utf-8?B?SmozRUJhZ3JrazlIMFZWU0RDeGFmZ1d2Q2o2SXhYN1VQZDhCbk5lWUFha3cr?=
 =?utf-8?B?SGZrZlh2NVliSHdsTmlwWFVBWXNEUnVXNlZ4cFlSOHh4NE4zZVFkcFJ4Q3R0?=
 =?utf-8?B?TjBXQmJOMFAyZDdSZTJHbXV2MDFXazNKSUl4S292QVc2Y0xoQUl4NXhONk9H?=
 =?utf-8?B?REdvQ3BycStuU0phVS9ET0tQbVJZSGcyRUtGeEFCYkpDY1Z4U3VwYmdxZy9M?=
 =?utf-8?B?Wk1ER0owbDJ4QjVhcExQOUVqOEIrVlQyUy93b2U2c2plK3BzdHBOY0dVRzl4?=
 =?utf-8?B?VTRwd0hQZ3o4cFh1cXR5U2wvYWdtWjErQmU3YTZRNXRFbld3dWNRUUgzOWth?=
 =?utf-8?B?V0RSaFhnMTZ2eUp4bWlXZi84b3F1dWNaWHIyRUk1TiszTHNiMXFwYUliNlFx?=
 =?utf-8?B?RDNpNjJQZTNwQS9SZVFXRCtHNmFWb1crM1loTzVvUHpRNmtYUXdQbWJjaHYy?=
 =?utf-8?B?SXBkSGp4Qng1RTlUMkVaQTBuWVpXS2dhL0Q4b2ZqcnViT2NjS2grSXM3bnF5?=
 =?utf-8?B?bHltVTVjakJsZlR0NjlaVWpPVmcyVU8zTmJycEhkeW5UclFMVnpyTHJHSkdO?=
 =?utf-8?B?RlR4dWV1UDMzOFFSWXJlMG9lY3c2cDlmc3VYQXR3cnl0NmVyR0NvK1BzRVB5?=
 =?utf-8?B?TCtjTlAxMUdnKzFMYVVGVXRyQXp4MWZMejl3Y0xnb0YzMm0vUndQQWVWbklj?=
 =?utf-8?B?QU5pQ3NCUGdrM1JMaEdValZiNXY0L2tkOXJIckRlYVM4K3ROTTRzVGppRUM3?=
 =?utf-8?B?V09jU290RVcxcnJGVDJDMnFkZnNOYW14UjFrd0lLc0hQdERENUduT3V4Rk1S?=
 =?utf-8?B?V040MmFPS3NNcncyVVdwZVJaMytVcTVPQW1PYW9qbExLUTF6YW9RdmtlZ0xj?=
 =?utf-8?B?SE91Wm5sSHlhSm9WNFNMYTNJbHlISWVqS2VkbjE5Tzlrekk0TDJVdHp4OTdN?=
 =?utf-8?B?NWpMNmIxaENnMG1ibExRdmhLUkd4eE13TEpPTzJNV3ViVWpFSHp5VHZYM3Ft?=
 =?utf-8?B?Qkx3bXl1VjFRL0hSMjRSTlQwUWN3TStQK1lIVXE3bnJGSWt5dU04c2w0SjdF?=
 =?utf-8?B?WGtkU2Evb1pmWkVhc1czc0NNb3hXSFR5VlNNMVR2YngyTy9WTSsrUGo2N2dS?=
 =?utf-8?B?Ym9zVDFmeC9kNWFlcmg0a0ZDL25VSDk4a0oyMFZCMlJ0SWU5T3VDUThvTFdB?=
 =?utf-8?B?QzBvdHdWRXlFQVA5U01mRmNxMWpwV0Y5Z3lRUHdwbkhiaHhWVVRMckJaU0J3?=
 =?utf-8?B?eXQ3YWtFVmxqOG1oOCtnL1loRGd2d3pwODhVU05YYWhiYlRsc2hYVUFpUFZu?=
 =?utf-8?B?bys4ckx6RXF1WStmdW1xS1kzZjgyQnFjN3lBdkh2ZkdUUzFFYTNmYzFJU214?=
 =?utf-8?B?elRzK0VhL3FBOWpzeTJpYUZDNjE5VkdzOTAzQzBpT3hiMEdwc1F0NllUdHNp?=
 =?utf-8?B?NmVhV0NQOFJVYUFGOGw3VmM3SlVWQkdWeE9jUGtJS0tOSEpvZjJsalNSYWlm?=
 =?utf-8?B?UVF2VmV0S0ZZblRMUTZxQk9pc3pna3ZPUG1WRTNQWm5GL0l4Ymo0ZEF4V1RO?=
 =?utf-8?B?c245RTcxdDVlU0ppbFg5MkxKREJobXplUU83NGVCbFdVVEd4bmgxSjRWbHoy?=
 =?utf-8?B?aVcydmdLZ2QvQmh2M09EZEk4ekZ3T0EwYnJHV2VXUDJtRlJLQ2hXQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a813c546-3aaa-47c7-981d-08dea6c2c11e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:14:12.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sGL9WfrJ3IpItAKCPjZdK++QWbQte83uTEcJ3lO1WZf7lHG8+JFOYPj3cQ4VaMbFZIj5cKBZUZ2+kZMpMxH+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11962

On 4/30/26 09:17, Jiafei Pan wrote:
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

Please use git log --oneline drivers/remoteproc/imx_rproc.c and check the prefix
subject for commit messges related to imx_rproc files.



9b2451658afa9 remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
65af722aa86fc remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
b0106defc0ff6 remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup

Thanks,
Daniel.
