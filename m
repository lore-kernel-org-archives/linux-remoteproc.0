Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020111.outbound.protection.outlook.com [52.101.61.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE1219E1
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jul 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722456130; cv=fail; b=puvxHDrGXzZJF2BXtELulJShJoiMbMV2xbjmrI/3wNRn1nPkA0yo1PAri2yF6q6NRb5UoRh/p4tOhEy8ft7qBcAhmMEfabQ5UTrOG4EYhqSZBc4EA3qWl8KPkl0PQ4EeQbvXgcesFqr/wJwHKeASqKtn8y9pwAudKsMwty6Hl2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722456130; c=relaxed/simple;
	bh=qQQhOTAmL+kbdGZuEDhfsGjzAyP6P8EhjWhBNXjwU98=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=SZ0eVf6N1ad5uc26wkx7/QVw6nir6w63nuWxZjuZIfud19irJqWdyiJVyIOKyw6hB96RnF1eO0+Vtz0oBx0Yfuw6EFuUFaMzY1F0mvsuYR/4DRAaxgIUdfm8XXWnRjYGQkZnPAgDN4zo6Z86/oKs7avA4k0z0jF2SzY7UtZC0kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cornelisnetworks.com; spf=pass smtp.mailfrom=cornelisnetworks.com; dkim=pass (2048-bit key) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.b=XxAWzelV; arc=fail smtp.client-ip=52.101.61.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cornelisnetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cornelisnetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.b="XxAWzelV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpuTP86AvPniNHVXDQU7S9/1049akvANEVpZTDw7DH2Q0iOmyM1OzDY+UrS3jFHwCe3tG6oXFV0WxUWPRv17neYr8T8T/vfiOkjJ3GUusSu0fGwIsljpOZh6R6yIBpVvmbqwdZQQk5/6paZK/cR632bseYnzRihDYazoI8et9ypgJ9SC22mJ/LdQ4sE6iLKIWrPSXQzw3wcgNjWSWAoO5GgOds1Kg8QqKpXmsNHD0qR2FOOPH7EQuEmuss+I09CYU301FiOKsGpsFQOl0jNUpnG5wkCaaSAw69Rzn1Yfzsufs8aRnJapVrSnFISZVp2YXOmQKwbxI3a291q8XRDLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQQhOTAmL+kbdGZuEDhfsGjzAyP6P8EhjWhBNXjwU98=;
 b=dr3N2wQUzr3DR1uZ1ByEXg9S4OquwEuK0nGZi8z0KccHd3tO73xQm3ycRDRbJXwZLRh41j8EjiDrFehHCajULNPTvQh1+EkOQRQ8wit4QAy5EVhY/W19UNxDV1pa0bjSKApib08bQh52i81Ggl8Yni65OTun8Df3hsAxpqN0K12ktlhykxEDCYeeKGmFlpvHcqoscLXYkCSH9JPpdzwm/4VYNdjRGz7LvZFr7UNwM/wOM5KggMVYsjF9j6UhS0ZZEV0XnEc4zJRSoa3Cx7tol7P47dHIFnu2lTbPkFI2wvwSQ0qGkst+U8jkY9yhBhYcnPYbS4EStwwRn3ARnNU78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQQhOTAmL+kbdGZuEDhfsGjzAyP6P8EhjWhBNXjwU98=;
 b=XxAWzelVPxnf96ID+PCqZKGL9Uo/JQsBFHqJ+Eb6nj3JnfWk2d23x8p/mG8lBFDZAnMesusGwqAqOHLSqaarJjK2wOkexTeZKtRnvetIVyMvlD1ClJ720WlFXL5tF7uwZpTOiwwC79n7dC4hD24lxRMxABI6WS1+7KP3aHuVEgOoZl2x1Ca0dF+pSbqVXqooR+FdXUSEgFtYwAL7JkoTbGEHKGjc1C/uv5GZeMO/BHAWXb7qNUfDEJVoO0pAekb90Kjt9cffjQpQJIW6Cl0aDjZtjUqiJuiSTK8eOQF+M/ZmRDZyJpyBdvWQxQo4DQZfqNpenFxATbHFrEcXuSBM8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cornelisnetworks.com;
Received: from DM8PR01MB6901.prod.exchangelabs.com (2603:10b6:8:12::10) by
 PH0PR01MB8117.prod.exchangelabs.com (2603:10b6:510:29b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Wed, 31 Jul 2024 20:02:04 +0000
Received: from DM8PR01MB6901.prod.exchangelabs.com
 ([fe80::7850:2655:cfde:c9e0]) by DM8PR01MB6901.prod.exchangelabs.com
 ([fe80::7850:2655:cfde:c9e0%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 20:02:04 +0000
Message-ID: <133c1301-dd19-4cce-82dc-3e8ee145c594@cornelisnetworks.com>
Date: Wed, 31 Jul 2024 15:02:02 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Dalessandro, Dennis" <dennis.dalessandro@cornelisnetworks.com>
From: Doug Miller <doug.miller@cornelisnetworks.com>
Subject: Using RPMSG to communicate between host and guest drivers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH3P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::30) To DM8PR01MB6901.prod.exchangelabs.com
 (2603:10b6:8:12::10)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR01MB6901:EE_|PH0PR01MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c3bb83-cb3a-4c2e-b560-08dcb19ba5dd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkE3c0dQblllOXNzMkVPTHRPaytXWnU0STNCYkJ6Wmk2ZlNFaDNzR1BsTno3?=
 =?utf-8?B?UWF0Nnc5blVmQXhsWFNqWEFNUnJ0dU9HeUp4VWZpWEZoeEc4cGpMejJoMDdq?=
 =?utf-8?B?cHZlRWR1ZGY4TXg5cURkRGZOVzAyOFJlQjBPYlZmRjVuYlM0b1lQYmVQRVF2?=
 =?utf-8?B?R3dYQjg4dUFiOFFiejFIalUwYWdxL0pNN1ZUZERQa01GM09CSk5XbGlyQnAz?=
 =?utf-8?B?RUlseUo4WVY4OFFDSUlRVlhoeWtydkZaVUx1NmFwTmtrakNHbkhRMlBjVVpu?=
 =?utf-8?B?NUp4dURURlhBT29uamUydEwzdVIwWEgwV3lLOXFZYWxITTZTamlTQXVpK21m?=
 =?utf-8?B?Skt0dnByZ0pqb1ZxMndXRXgwdXZJa2V2VmJxMEczL3VrbU1RVTRyV1lnVDlX?=
 =?utf-8?B?V3k1K3o1TWpoTEY0WVJoMzl3UStkcTY1N2puUHA2N2NlV3NwL09aRjlKdUJN?=
 =?utf-8?B?dTBKVG5rNjNTQ2Fodlp4K01OekxmTDdsOWVuT2RCa2NtczNBcHA0ZExmOTlT?=
 =?utf-8?B?V2t4Vi9WT2JvT0lwZ1o2QTJjMG4wVzRqVm5xOTlBVGZHZk9EZWRnSERnQnc1?=
 =?utf-8?B?RktVdFpNLzdwcDI0bDRrUk5MZUZhSjI3N1VaWGF0L1gzaEpFWmJLc1piaGN2?=
 =?utf-8?B?bk1sbVBLTDhOUFk1SWxOa1hxai9kMG9udkdJbHltRFUySTVvOExWcUI1UFFW?=
 =?utf-8?B?SW80NmN2bnNtcmlYcUxLNVA1aE9UeThZNkhGTE9zb0FwRkRYVCsxMjRXU0hR?=
 =?utf-8?B?Q1M5WXU5TVdYWVlEUy8zbzl6b203RVdOYWRJN1dpbjJhQ296a0RGQ0ZSOVlO?=
 =?utf-8?B?T0VxSXFKRE80eFJQaktRb0ZTVkI3VHNYWmhpZU9rTGRqejJ5Z3N0VDhCY0Vp?=
 =?utf-8?B?MnlqbHpxWFo1UTJla3FpNzE0bEgveXVWZE8wem01cHVmUkh3eDMydENmNmtt?=
 =?utf-8?B?L2RlSjYvd1hhdUYrSzBHS0pKY3VVWDNTOEVBTFBKMDZrOFdzMDVVamEyVDhk?=
 =?utf-8?B?YjBoQ1VubFNsSVZBcitxRWhuQ1lvU3RMNGpkUFNsUGwxZ3grL0Y2eE9VbWFl?=
 =?utf-8?B?ZithdWtVekdkd1BjektqcGZPRDUwcVh5M214RkgzNXdaYzczTFhuWkoxU2RK?=
 =?utf-8?B?akZCV3VFSWR2QmVnWCtBSUhteHU4a0oySDRWS2V6RUMzeStvSGFrT3o1eWVL?=
 =?utf-8?B?Y1lNek5CREtKWXBZWTEvL0RUODJMRXJjR2QrOHVOTUNsSGdjUmtVN2dvWFhm?=
 =?utf-8?B?MHk1eVZZY2lKT0tLNXozelVhZVBPZDc3TFlWdDFqeEdPSDBYTGhPZXlWL3ps?=
 =?utf-8?B?aUc5U0k3UXRuaDJHUi95ZWlBdXAxZ3ZiUkhmSitIbDFZRFlJQ3lVeEFNMTZp?=
 =?utf-8?B?RjRRNm0yb3RzMlFrWm8wT2ZQcHVUVkY0S0VIYzlkWDcySEJxRVZ4MUpUeThN?=
 =?utf-8?B?RGR5cnp4d3BhM0xZYVYrenpmNkZva2FZakJoVVpMd3FDUlR5alAzSXhiSHcr?=
 =?utf-8?B?c1NSazRSZE5lcGJ2czRSek0xYmE5eFQ1VVJLaEtIL2xvN3kwRnJEcXg4dk9k?=
 =?utf-8?B?ZzZ5aFJJZXhialA3YnJnd3doNnZTME8yaDRUNVo5ZkVsdlBqN2RDV21FOFRm?=
 =?utf-8?B?Z0ZlWkw4WDMrRWNUWTNUSkdVZHdFeXZIWDkxSlBNcm1KZzF1czFkcHJrZ3Fn?=
 =?utf-8?B?TU8xV2k0MmQ3UFJ0aWFLWE5xWk5QbU5mR3JIbFFMVDVvOVRsV0ovVG9rMWF3?=
 =?utf-8?B?V0N1bjJOK0xpS2N3SFVXNXN6ZVdpSTFpQ0lHWXZiUnFjVzkxb1Z4N3RYZE5u?=
 =?utf-8?B?SlRDdjU3bjF4MENVRXpIQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR01MB6901.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1DZ1lDM2tOS2FKL0dhRUZ3RkJVdVUwL0JsZDlac2NmWW9PSnhOUS9WYUpU?=
 =?utf-8?B?VWJDK0RQUklBVkdudkZST1haenEycWNWYTczdCtvRmRtR2FUVjZWUW5EQXJW?=
 =?utf-8?B?Q0ptRUwwTzBEWU9EZkM4ajBjNnhFT2hUa1A4OEFUdjhEbER1TnR5MDZJcFBZ?=
 =?utf-8?B?OG1UU2ViOE13Nlo2RDlkZGFTVEFoc3dmNkdERC9Pa1liblp6THRYTHRhczVr?=
 =?utf-8?B?SXlqOXBNYUUyS0FXczZxZnV1WU5Sc09IMTU3RkFZell6RnBrZ1pacVJSaWN0?=
 =?utf-8?B?dXc5YnFaK21HUFlkYWk4Mks5bFl0N2N6cTNTL1F2SWlzZGo5Nk9rVU9GQjdm?=
 =?utf-8?B?ZE5VRUQ1YWdtTmtsTlZLaEFSaDFrTjNIbXMxTndDd2hFdC9aOVlMZ3Y2djF0?=
 =?utf-8?B?eEZRbVpuTk1mZTkxREY0c0JlN2xlTWQydzFlNU8wNkg2Nmw2bzhKYUgxN3NE?=
 =?utf-8?B?cVNiVmxsVjN1R1JDejhmNzQ1TlBxS281NzJYK0QvRTNDYTNpdnJJYU9jRFQ3?=
 =?utf-8?B?QmYrNUdOM0RCdFlvY2NmdFlXbnF0L2hRTXJ3VmdkaU9vQ0JvWXZjQVQ2eFJy?=
 =?utf-8?B?NHJDMUJ4NnFtdm1sUGhXcHkrbC9PZnlpWFlwUEh2MVhzNnduYlRpK1NiYXFl?=
 =?utf-8?B?dDhLalZXd3EyendPQ081V1lwWU5YVEMwLzdFSWRqbUIyYjZFdEVCSWxtY2dR?=
 =?utf-8?B?bzJkR3gzK1VlbzFOVG1RSlJ4ZFh2LytDL0llYkVWOUJyZFQrbGFPUTlCbVlm?=
 =?utf-8?B?WjA2L1YrbUhteEVrN3lDSUVyZzQ2U0hWVUdQdzBxZHpqaEdYSTFVTjJMeHlm?=
 =?utf-8?B?ZlIvZ3dnbjhvMWZqZzY3QzNOaGo3TFE2QjN1aHhkeWtScUsyWHd4cjVqcWVh?=
 =?utf-8?B?UTIvWVRickxwRnN1K2dhcENob1Q4OXdVQ2tReGdMMVBoNWJ6cEkyNzl5dEda?=
 =?utf-8?B?NkovalhHVTlPYUtpd3ArUmE2MFl1cllCSVZtaVRBWnV1RkNvcEh3RGJVTGN1?=
 =?utf-8?B?Z1hRemRDeU5qY3VvRWIyWk9Ed1F1dHZIWkVzS0xvdi9BK2NXdU11SGlMZzdT?=
 =?utf-8?B?Q0RDZDQ2ZUxGVjFiRmJRa0hOOFZaSEhEQlN1MktieEs5UnBYb3ljSTl5dzZI?=
 =?utf-8?B?dUNGcVFFT3dQOCtJaEdPRGdLbW1XdGZlb0kwMDg0N2JtR2R1ODlmd25xSXcv?=
 =?utf-8?B?NVNSV1BITzc2V3FWMEM1aG54YjRVdXgrV1AraUF4dW1QdE1CVHhnS3QxNEsz?=
 =?utf-8?B?bmxHVlY4czJlcE9SQm9uWG8yZCtDaDd3bWNlTEJwQTdRN1R3N29jZDZrTU5L?=
 =?utf-8?B?NVlIQWlxWlZrS0FHYzQzRzFLQ3pldU53cm4wd0tMNWpDajRvUno0UlpQMUZT?=
 =?utf-8?B?aSt1TWhkNW9VbVB1TVZyWlFhRnNPV0tHNjhRNmlWbzU1clB0MG9DSWhlYkxm?=
 =?utf-8?B?dURjT2ZRQm4rdGwvM3NpK1I1aVlMdnpBa2RRUEZlS2R4UGt4RW5OZ1A4eEM4?=
 =?utf-8?B?Sng1cnlkTnY2N0hQNVd1SUo0akxSbk5ITEJaZkp0cUt1WTNFb1Rid0JBN3kx?=
 =?utf-8?B?NVVVYUtJN2h3NHVnVVZjRVE2Z3RzcHN6NkZkQ0ZMWHdUa3J3cUQ1WGpDUGpK?=
 =?utf-8?B?d3B1NlkzYnpRVEp0ZmdpY2RaSWtYTktSSnFBRUdEWS93S2NMVWlGZWMrQU0r?=
 =?utf-8?B?aklhU1B0ZlFGa3Q2dWVpK0NwcWZuMm5mTHJtMS9nVTVzMDU5eFAvY3JyajB5?=
 =?utf-8?B?dHA3VFlVaUU3TFdOakV4eCtzWFFxdk5JWGVtZDZOdmxQZERsdG9ENGZoeVpz?=
 =?utf-8?B?cCtpTVBFUm9sU1dKY2R1eE5aS3I1NzdFZUFPcFZnbVJ2ZzdadW4zbE5jRHJ1?=
 =?utf-8?B?V2FHaTZwM2ZORUEwdHV6UTBCWFAzTXVKdXhWNVFkVUxTSHpSL3U4Q0MzVk5P?=
 =?utf-8?B?ZVExYzA5OW5HUVl3S3c2RElsWCtYYVFmVjlHTmlJVFBtaW5EN3BpQW1ONmNJ?=
 =?utf-8?B?YXI1ZlVOWHZ6MDZUYW9tTWp4MHQrRTUvUGtuMWxCVFFBTDNrZTZVVGNEa25u?=
 =?utf-8?B?YitjVmhSQndKRU5oNDJ3b0JZREZnQXZBL1k5bkREWXZzZWZMajA0c0g1VzRo?=
 =?utf-8?B?dEhFQS95bFhiSEdqbWdqSVBqMFBOYzJ4M1ZBbGx0d0I0ZmR5UGhWSnBMVWxz?=
 =?utf-8?Q?kT87NVwfm7NTjxK/VGWyH+g=3D?=
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c3bb83-cb3a-4c2e-b560-08dcb19ba5dd
X-MS-Exchange-CrossTenant-AuthSource: DM8PR01MB6901.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 20:02:04.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6GAfbX5eD3JxS2Xi06jky6eTslBVjwlDi9HpeXVy0xEmFo1xYU+fZvSydjVFt1N1CBc/3uugJNrdXqhqsKD06d84BqbrYdOR7uy/TcGkvfTYBbp6NMyGS8fIjrcWvgf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8117

I am working on SR-IOV support for a new adapter which has shared
resources between the PF and VFs and requires an out-of-band (outside
the adapter) communication mechanism to manage those resources. I have
been looking at RPMSG as a mechanism to communicate between the driver
on a guest (VM) and the driver on the host OS (which "owns" the
resources). It appears to me that virtio is intended for communication
between guests and host, and RPMSG over virtio is what I want to use.

Can anyone confirm that RPMSG is capable of doing what we need? If so,
I'll need some help figuring out how to use that from kernel device
drivers (I've not been able to find any examples of doing the
service/device side). If not, is there some other facility that is
better suited?

Thanks,
Doug

External recipient
