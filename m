Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79B22332E;
	Mon,  7 Apr 2025 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024601; cv=fail; b=px6/yQCcry7R6EHOXT9JU/5PmaAqK5kYexA8Crwy2+EgR3zNV02tcgJrO0IS3vvz522WRHduyGYNBi9lDdfuwQPiwAq+1TuS1EuykMn0risbqpIvcrKiH/39boHu7PP1jTh8QSw4OH4ajuG+qTXHEQCZRELdZ79cy2HPCvSYyO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024601; c=relaxed/simple;
	bh=CIHuCnkJN4G7kpu0OztoT1ak8VBGs2kMoPFVna9LtLU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D1T0UuEvdavlcEsbCi0T3KOd/I3Y73Ql4EbdwBl2iu9XeKgpfRodTdNhgvc2UVqq99crBfPCOBNZdBZMPfs/GsftdSFNsyFg/HxK6NncQMgzq4fSimb3+/O94qWL64jw3IolFfQLY7nxRBMXp5WXJL2OQS591ZCFoOv6xRrPL58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SXElcpIN; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SXElcpIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csDdXPthMp+CSUAY80UhNuoOau38SqjkmGOUK8qzSFGsSwmimikX8vNHDvyk/kVrOKInBtZmJ9gpeE1YF8VjqOGXrYWBKCaVsgRDg/v+Vc7bA2hGx9a/PfqjiT+JGI17cXH9BL4aEcE1r/CfX2KXUygKnnT3WGOtD8FNMsawmCuFqs7KHYFwxb1KCCQVcgIdZePW3XO+RR97BgkYDMAPAIBC2R6TXoXOp1dfD1y4utsXd95qwqGDOX3MVO/8KvFgl8QNxciwu0PyVQIFp3W9l3Yy6hm1ImPAv/pnRhH9JkvZuZuUFVWLEGQ6e5Tt9RbuFjUTyYTXZJ8B6at67EBGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvzDjsGQHA/RSGGFN4OMc6MFzf3pFaMWN6n00k/9BPM=;
 b=RAeYaUIPkgcpUWbdnF5+YFWnIcigstKJwMbS6orMNN19l905GPhz0cTzsYMHlS/QnB35Jd4N2XYcKOUE3oTUDO9/Ui/ow072l5V9U1x24sLHJtJq9T1aDaqkCn27ednkPPMeGMyCHRMUX2BXTCVvtRQ0t9Eb557ruuKPol/V6omD4KY/57sA9jH0gbuqA7xDL9bTpM3uvL4xB5ZUz2SbelzRodaF+UeZ17SbYKfqG5WAVtCBiknGag4c7FoTrvx3b4cWgeErfe6xWh6XRIdUEXNRMqKXNdY/DLZQ0opEl+q+Q0bJGCx7Baz8xJnjk9kif5B8iw4K2ZgSRnrD9f3q/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvzDjsGQHA/RSGGFN4OMc6MFzf3pFaMWN6n00k/9BPM=;
 b=SXElcpINpuXHHJW7VoYma+/L8kjtIPPbM0jYMaOCFjM7IOZw+V2rBKoNswipduUvQ8fwCp5oGKNhXxg1lJknKwhWEtLGd/Yfz4wat5gKd4kgrlSKDnhIo2u4vK0QTY8JCQv1V8O/4guGMa/pflH4eA9FYWNB1ovfMgWJjxz6diD78uYkp5ghrcFb3dPb1K6MPTo73NhktY+V2MIOmWojTMDVixd9TF3x0rHrM79ZZOFmNTE7szz2h7BCixGAHAECZiW9KQTRiL9RQmDgifEUrjlHWWwdxs7WfC4GLHSSFTQNkquESihrmG/0TRGGOPQTmvbtiQHo+6gjdSGaKGUNmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 11:16:35 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%6]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 11:16:35 +0000
Message-ID: <6c47b7c3-fc4b-43c3-ac4c-f739cc739343@nxp.com>
Date: Mon, 7 Apr 2025 14:16:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Frank Li <Frank.li@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
 <Z+7dso+tsYpSBSFi@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <Z+7dso+tsYpSBSFi@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0039.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::16) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1c5f81-0830-4ec5-25b2-08dd75c5a84d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHE0WElMM0hqc0FhRU96NkFzd25mdkxFOTkySGlQV0NudVEyU2FVVVV4SjRR?=
 =?utf-8?B?UThtV2srb29qdCtEdTNDMHUvQThUTnd6bUZxeSt4Q1d4TVhFT1h1bDZCTHhn?=
 =?utf-8?B?TVUrcnMrZ2tlcFFmaStnMmxzLytQd3dlSjhRV2w1ZkRFdXRIVDEwcXlnT3lj?=
 =?utf-8?B?NTM2eGxxNWJiWk5LbEZocjdCTmIrK3VWTlp2bHB2Lyt5d2tnSkh1emJiZVpy?=
 =?utf-8?B?d253eS9ZRUlrZzdFOW90YmpkditWcUx1T0Jwb1BzenlXUU5WVS9Ld2VIYUlj?=
 =?utf-8?B?bnYwSHE5bzZzL1pyYWU4Q2pRY3BoRCtTTUNjNTc5WHNFK1ZFUXBXK0E0cXZM?=
 =?utf-8?B?MWxUbDgxZnVFalRpZWhqVldkeHk4VE1TVkhiUDNibEpjSWIxUWE0NytNVkNi?=
 =?utf-8?B?eEdtL0RnRzVhR1FUMFRhenkraUF0d0lXQ09UL0VaREhLUHl3Q1REZXRxSVFu?=
 =?utf-8?B?Y3JzdHg1blREWjMxK3FWb2ZxOEVialk5US9DWjNxVTVRTFNMVkY3R0kvUXZC?=
 =?utf-8?B?WGxrVVFzODJnWGJJMDdja0pOL3VwSG9qNmFkSXFSRkV6Q0Noa0RlRjh1d1Q0?=
 =?utf-8?B?dlVvN0IwN29VNkk5RXc4WSs3YnNJMjRaTlVPc2ZiN0tlWEVkMmpzaTlaSE9n?=
 =?utf-8?B?M0hLZFlwcFFvVnJWR3BES09OdmpKT2x6Z2szN1NQRkxRV25WaklHL3RYUjE1?=
 =?utf-8?B?cCt0NHJuMlRLaEtzWUh3UllTRGEvSURBSFN3a2xyU2s2L2xOaVlZZzkyY2hU?=
 =?utf-8?B?Sm5rNWxFdjJldmYxcCtvUWI2M25QYlJWcCtvMCtzSmgxd3l2RzdEb0NTRUZ6?=
 =?utf-8?B?WFMzQjRuYW5KRGlRUnRtYVRLM2tTVk1XUnFEREJNdVZONkhmNHNWa1dnM2l4?=
 =?utf-8?B?NEtVcERKUXlSZGhmRXZCdXE2S2V2ZmRNa1huRE04NTZYeTVvVWFoWTQwcnhP?=
 =?utf-8?B?eTZvT2d6amlnbjd0ZEdxRU85Z1kvNmt1Z1JXQ0ROYkliMDlPNEJraEljWDg4?=
 =?utf-8?B?S2FiR2dCSVZkUnk5QWZXT2VBZE1oQ1hoTUFqWGdOUjZsaGNDYjB6MjVZaFNh?=
 =?utf-8?B?UzVKY2xvS1pOS0lYTnNkdnhPdjJUcDNZS0ZXVENiOWR6Q3VyQ215Tkl2bUxD?=
 =?utf-8?B?YUdQYWh0VEorNUJhN3NDaXF1aXh5empXejF0dmp3bEMraXFUYS9tU3diVkVJ?=
 =?utf-8?B?VUZvdUhmQ0VRbkFmL1BTVnZrM0JpTGF5MkY2UmlDZ05pd0dtNzBQRzBLVDRV?=
 =?utf-8?B?SnBEM2J6OS9vUUh3aWdLa01ITWwyaWZKWW5WeUloY09sTFNmMmVCY2oreEhw?=
 =?utf-8?B?cjJPRFlnbklQVDdjcDNtTklIdVlWcTlTdjh6VHRHZlVxRVo5UFA0bzlQNmdN?=
 =?utf-8?B?K2tuS29WK2Q1cjFmRzRUWTk0S2oxYm5Td0dad2FNSVlmb3JCVkM3RUZmN0JN?=
 =?utf-8?B?bWJXRm1XYkVBMng4RURkTmdpTW9mc2w5S3J4UzVZcWZFbHM0Z3Y4NkZuMUt2?=
 =?utf-8?B?dFV4cmFabzZEZDNCOXlvMkp0MDdUVzhYZWxBc0NZOFdnZHl6ZjVZMnYrTW5B?=
 =?utf-8?B?clVscE5mdm9MeVhwbkNpYTE3MGw1Wm5uc2xiSkpIMkszZWNOenlQQlZWMThY?=
 =?utf-8?B?aUxobC9EWDNQMk9Xd0lJa2RBVFJvM2EySU94UjAzemM3cE9Ebjdhelg5RnF4?=
 =?utf-8?B?V3pscFNCRk04WVRNc2NRLzQrWTR2WlBmWW1kaHovN204VVBiTmg3TFJYc3dX?=
 =?utf-8?B?Z3lWRTVqZDkxTkoyYmkwQWZXc0E1cG5YMmZTSnpJM0ZMQ29ub3dlckZ0WWxY?=
 =?utf-8?B?QUxJaWhmMDZzRkE3ZW1CSGxRa1VoK2kwaWFDVkwvbFJ6NDlIci91WnU2NUFx?=
 =?utf-8?B?YUpMQVpZYThRZllRTmZyWHkza0xQekU3SHR4dm56dkNGVHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVU1UTI0Njg4Y0FQTlJnT2VmcTRzUWtzbDJ6dFVMOVRicnEyakNnZDF5ZXVz?=
 =?utf-8?B?SmhUYUR6cnhiMXlqRENDd2Z6YjRiVWlKMzgzeXhyeEF0QjRBUjBoa2ZoekRF?=
 =?utf-8?B?QnNYM0pydzRrVlI2Qmlzb29rY2pHSjNIUkZXcy9pdmtZL3NkZHhIdW15eXhN?=
 =?utf-8?B?anV3NW00dUpHUXF0NUtOY2prOUlWazR0azFXelJWMTZjcllsZmY0VFNJd3VS?=
 =?utf-8?B?NFNXYlREN2lCdHd6MkwreFFvZzI0VnVSMnZOWjZONVBMYThEQlN6TmdISmVl?=
 =?utf-8?B?bnVFV3lkNW5qcVk2TkUrVDJDWHQvUDhjOSt3UzBhc3FyTGs0NkJCSldSSGRK?=
 =?utf-8?B?cHlyektjUTQ0MnQrQmZSaHJSQVBRR1ltWG5pYWE0Nld1S1VocjZ4OVV4T1Fl?=
 =?utf-8?B?SkdPYTM0a003WHBlY2VVYXdCWitXR2xEWXF3RHdXa216c2I1aFhqRmROZnpi?=
 =?utf-8?B?TnVueEhLZ05ESWQ2RnMvbGZOR0xXWGNLckVHRXU3TU41R3IwWFcrMTVvU3Nq?=
 =?utf-8?B?LzNNS2Jiam5kQ0tpT2tRcGVVNFowNkZKcXFiUXUwWHZqWTlzN1FGNVdDZUxX?=
 =?utf-8?B?L1BMKy9EOFR4TjdlZ2YwZ25WNmVGa2hJRitrWnhXM3FMQVB3Vml6OUpVVlZz?=
 =?utf-8?B?WVpZamdLL1c5NzFEVE5aRVkxMVc2NllqYndRckYzVFV0UllrWi9MM3JIN0tZ?=
 =?utf-8?B?N3l6S2MzUk5GT3FNYThaVVN2SzQ2blpXb3Q0eVJ4dWwzeHZzWkcwZ2NTcjli?=
 =?utf-8?B?am5qeWVLN2FtTm03QlJ5L3VCS2VNSHQ1THI1NUlVdmFIYmU0U0ZnblhOaURE?=
 =?utf-8?B?UDJTSHdSZE5hcUViYmFweFBPU2dEdE5rYWNlaUVxSWJxeFlhOEtuZmpOTi9l?=
 =?utf-8?B?S3JNWElFdW9hQnpLdzdWK0EzLzBTdmx5TXlUcUNmbDJmUy93dWN4SWRZOGFQ?=
 =?utf-8?B?QURyc0hGVld2dm5YM1VJTXlKRENYNFdDL3d5dXZrRyt3UTl0MUNCK2MyUm00?=
 =?utf-8?B?Q3c5MXFFdnpxSnVUc1RYd0c4aVltaXcwSmIvTlJYQ3lKQWI2ZUorV2tIZjVC?=
 =?utf-8?B?d2ZLSStCdVdZYkZ2R1YrVG15TkpqWk0zNkRLeUZRNHdpaGV0Z01TV2tRMWF1?=
 =?utf-8?B?dGluWHBUa1E0SFFhMFFselVpY2RTMCtnRGVQNlpYQ04rMGpHODBjRnJDVHZk?=
 =?utf-8?B?ZHY1QlE4YUUvSElMMy9XU21BdW9RRUp6cmd4WUNWbEozTTRMYk1wZHJEQUdN?=
 =?utf-8?B?Q24wcHU3cTE3RXFoMWM1MkZ3ajAybWxQODU2Y1YxajFFd2s1OTlqWlBFUjJN?=
 =?utf-8?B?ZTNDQnppWHE3NnF5Unkvd3RlRkJFa1MrU3paODdRQ3FhdVRrVGppWmVtMlYx?=
 =?utf-8?B?UkFIS0tGTEZoTm1PNHRvVk4wVWFkczdnOUdaNWNzQm1iRFlzaGZDellpMlB0?=
 =?utf-8?B?MnVpbFJKdzlTc1pFTHBpcUZvZEJRM3hxOXBlR1JWWHdsU29oK1NlendQaEhN?=
 =?utf-8?B?VXpSNGVsa29QakIwWEhPQnI2MTVqQnRWQ2JFcldKZSt1dUlqSjk0cDlWV1hq?=
 =?utf-8?B?YktMSlJhVUpzNmx3M1hCSGtXam1xZlNLMGFhdHFQWTFjZ1JtU0pEQ1Rid3VD?=
 =?utf-8?B?bFpLeDc3UWFxMnh5SnRaQ052QlNuU0J4Z20wcDlaR3JzN3k2RGxPMmtEME5P?=
 =?utf-8?B?c0JmQ28wOWhJdXM4QnQzVWxJUzRCUE1LMVQyb2FwVzJvK0RodzQ5Mzc3a1Iz?=
 =?utf-8?B?S0RYUW9sVXVEUHdyQ2RtYSs1a08wNEdVLzVTK2JVc0lvRkEzaitSWDRwaUJC?=
 =?utf-8?B?OHpjN3NDcFUwTGc3NFRWSVA2LyszWjB1QlErdGhvM2RCS0RjZWt5b25oZlpE?=
 =?utf-8?B?Tjd5bmVoeXF3bmVQU2EvMWRZeTlqTkNUbkZVUitoNVgxZ0R5VXpuMUVPc0hH?=
 =?utf-8?B?b3FjdzV1VVBQQlh3Yzg3K2VvMjFmVzk3SnFZNGpaZmxodFNmWmU2bnFlaU1S?=
 =?utf-8?B?R1pETHUyWXRRZkIxdmowWlc4U0Y2N3hvbFRTUnE3ZnM4UWQ4dUlCd2hLL3lQ?=
 =?utf-8?B?cTZNU1hWeEtJbC8vaXBEQW8zS08wOVBSZlhBUkVYOHRyZlJqNHhPSTFrdjBQ?=
 =?utf-8?Q?03D7cntiszjDW7Tkqrs8IYpO0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1c5f81-0830-4ec5-25b2-08dd75c5a84d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:16:35.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+cCEr9liiCBxuHxkJYNcw2SrGEvqs7Hzwp5I0ioDQbJlSz+qjo4q+dmVaSfaNuszAJ0FH/Aa8zs7Xz1ZoRMRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410

Hi Frank,

On 4/3/2025 10:12 PM, Frank Li wrote:
> On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> subject: remoteproc: imx_dsp_rproc: add handle_rsc callback to handle DSP-specific features
>
>> Some DSP firmware requires a FW_READY signal before proceeding, while
>> others do not.
>> Therefore, add support to handle i.MX DSP-specific features.
> Add support to handle i.MX DSP-specific features because Some DSP firmware
> requires a FW_READY signal before proceeding
>
>> Implement handle_rsc callback to handle resource table parsing and to
>> process DSP-specific resource, to determine if waiting is needed.
>
> Implement the handle_rsc callback to parse the resource table and process
> DSP-specific resources to determine if waiting is needed.
>
>> Update imx_dsp_rproc_start() to handle this condition accordingly.
>>
>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> ---
>> Changes in v3:
>> - Reviews from Mathieu Poirier:
>>    - Added version and magic number to vendor-specific resource table entry.
>>    - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>>      - By default, wait for `fw_ready`, unless specified otherwise.
>> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
>>
>> Changes in v2:
>> - Reviews from Mathieu Poirier:
>>    - Use vendor-specific resource table entry.
>>    - Implement resource handler specific to the i.MX DSP.
>> - Revise commit message to include recent updates.
>> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
>>
>>   drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>>   1 file changed, 100 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index b9bb15970966..80d4470cc731 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>>   MODULE_PARM_DESC(no_mailboxes,
>>   		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>>
>> +/* Flag indicating that the remote is up and running */
>>   #define REMOTE_IS_READY				BIT(0)
>> +/* Flag indicating that the host should wait for a firmware-ready response */
>> +#define WAIT_FW_READY				BIT(1)
>>   #define REMOTE_READY_WAIT_MAX_RETRIES		500
>>
>> +/* This flag is set in the DSP resource table's features field to indicate
>> + * that the firmware requires the host NOT to wait for a FW_READY response.
>> + */
> multi line comments should be
> /*
>   * This ..
>   */
>> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
>> +
>>   /* att flags */
>>   /* DSP own area */
>>   #define ATT_OWN					BIT(31)
>> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
>>
>>   #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
>>
>> +#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
>> +						 (uint32_t)'x' << 16 |	\
>> +						 (uint32_t)'p' << 8 |	\
>> +						 (uint32_t)'s')
>>   /*
>>    * enum - Predefined Mailbox Messages
>>    *
>> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
>>   	int (*reset)(struct imx_dsp_rproc *priv);
>>   };
>>
>> +/**
>> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
>> + *
>> + * @len: length of the resource entry
>> + * @magic_num: 32-bit magic number
>> + * @version: version of data structure
>> + * @features: feature flags supported by the i.MX DSP firmware
>> + *
>> + * This represents a DSP-specific resource in the firmware's
>> + * resource table, providing information on supported features.
>> + */
>> +struct fw_rsc_imx_dsp {
>> +	uint32_t len;
>> +	uint32_t magic_num;
>> +	uint32_t version;
>> +	uint32_t features;
>> +} __packed;
>> +
>>   static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>>   	/* dev addr , sys addr  , size	    , flags */
>>   	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
>> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>>   	return -ETIMEDOUT;
>>   }
>>
>> +/**
>> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
>> + * @rproc: remote processor instance
>> + * @rsc_type: resource type identifier
>> + * @rsc: pointer to the resource entry
>> + * @offset: offset of the resource entry
>> + * @avail: available space in the resource table
>> + *
>> + * Parse the DSP-specific resource entry and update flags accordingly.
>> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
>> + * to signal readiness before proceeding with execution.
>> + *
>> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
>> + */
>> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>> +				    void *rsc, int offset, int avail)
>> +{
>> +	struct imx_dsp_rproc *priv = rproc->priv;
>> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
>> +	struct device *dev = rproc->dev.parent;
>> +	size_t expected_size;
>> +
> put
> 	priv->flags |= WAIT_FW_READY;
>
> here,
>
> all "goto ignored" can be replace with "return RSC_IGNORED"

Thanks for reviewing.

I'll hold off for a couple of days before sending  v4.

Iulia

>> +	if (!imx_dsp_rsc) {
>> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
>> +		goto ignored;
>> +	}
>> +
>> +	/* Make sure resource isn't truncated */
>> +	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
>> +	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
>> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
>> +		goto ignored;
>> +	}
>> +
>> +	/*
>> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
>> +	 * wait for fw_ready reply (default work flow)
>> +	 */
>> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
>> +		dev_dbg(dev, "Invalid resource table magic number.\n");
>> +		goto ignored;
>> +	}
>> +
>> +	/*
>> +	 * For now, in struct fw_rsc_imx_dsp, version 0,
>> +	 * only FEATURE_DONT_WAIT_FW_READY is valid.
>> +	 *
>> +	 * When adding new features, please upgrade version.
>> +	 */
>> +	if (imx_dsp_rsc->version > 0) {
>> +		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
>> +			 imx_dsp_rsc->version);
>> +		goto ignored;
>> +	}
>> +
>> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
>> +		priv->flags &= ~WAIT_FW_READY;
>> +	else
>> +		priv->flags |= WAIT_FW_READY;
> if set WAIT_FW_READY at beginning, else branch can be removed.
>
> Frank
>> +
>> +	return RSC_HANDLED;
>> +
>> +ignored:
>> +	priv->flags |= WAIT_FW_READY;
>> +	return RSC_IGNORED;
>> +}
>> +
>>   /*
>>    * Start function for rproc_ops
>>    *
>> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>
>>   	if (ret)
>>   		dev_err(dev, "Failed to enable remote core!\n");
>> -	else
>> -		ret = imx_dsp_rproc_ready(rproc);
>> +	else if (priv->flags & WAIT_FW_READY)
>> +		return imx_dsp_rproc_ready(rproc);
>>
>>   	return ret;
>>   }
>> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>>   	.kick		= imx_dsp_rproc_kick,
>>   	.load		= imx_dsp_rproc_elf_load_segments,
>>   	.parse_fw	= imx_dsp_rproc_parse_fw,
>> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>>   	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>   	.sanity_check	= rproc_elf_sanity_check,
>>   	.get_boot_addr	= rproc_elf_get_boot_addr,
>> --
>> 2.25.1
>>
