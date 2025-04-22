Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F861AE875;
	Tue, 22 Apr 2025 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349716; cv=fail; b=UcrOkIgQWnHDON9n7EJswzeqFCJ3/GVaokFPhDq6kE0N2Co0D8ifS0slCNzc5Yl3gvMuOWe3BisePZ23YzIvSppPndyqhQ8euDJoA32U3zfCNzDSxSqUyI/QwvUmGpUx4/UxgEQHG6ycx6tbpNs1vouQ2553BrL0s2ufX3Tp8Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349716; c=relaxed/simple;
	bh=YIvW6UbSCxRpNIEQyGQ0fXrfv9XOEPTH6XfXwrMU1ho=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g8h+kK5IvWCI6jJS7rPxTwCUAxOs6+nLhhIV69phhCP04Dmd6cPWiceswQdpuWZi5qpCUj4uZ4d9NfvKtpv9hxNDgqCna41mjI0VYTwP0aN/3ylpk7bgjGbPy6aVoEPpSSZqI0F7iKeyMQ7SdaVQQ1VRCN4k2Q6epUk0CHV3P1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=va17V8ca; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="va17V8ca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZCUgRNUdUJniGAenRZDbG5GCCZHYvdMnUgoDWeeDv6S5pU8HU2juOSlEjXDD0/Zw87pUWwDqgFiGojnOlS7Q9iarxKK7pk+ku2VoNf7cW734hxJs0S77cnENEKii4HuxsADs3gniQVNEMIdo8GKufrEwmclAjcoYvd3/HiVR5bpwQeKmiFkfXzYs4NTT/Iigg71sGpkbNpMpID52IWAhwBR7mFZz41CDpUquLsF+T0DmDg8xaiOT3j9rIYAyEw2RebUs4fiho+iaMalMHD9O5VG7ARgboDdz4YFo077Yrpdi2HJCa6u2e+TrCuogqJ4bOYRdrNSxKU2igjnVNpgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYNc+l1MbCECqlAMTh3ywswLyhNgxL7w5VLCgRQYiEc=;
 b=a0oEKCMIbm4RvU2jDQMl/oS3gVHaAQQwYFv/hZi4IOfaY3Nw54UIi/0poJDRqdS+kuuFaKfZ4ZnWg84m6ZKVAILRHcbZsjx2XfOgW1kyJsIoJpZiq0vX+Q/HOp6hiSKzSsSTuthuKux8AvAPsMR2qbZLsxl28tjwCk8CPtcKdDiKSLc2/sgMFqenmwaB8LOMd0j0mwfn1YnnQrut8eD1THbUcvYAOY3163o+WNjWSezOa4ZSXQ89eyCiih7OLNkQmwjd1IBog7cpvDlp8sgP5IRHi1brYyHjmCoLVraBG53eggFeQ4ZuU+Di3dxYa4omA/3ryIjt3QMGD7DXJRQ6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYNc+l1MbCECqlAMTh3ywswLyhNgxL7w5VLCgRQYiEc=;
 b=va17V8caOUNdXHRiCF6tgUmg5E9ZY4LhosFEI7nlzXDJDSMZCHyAuR4sLknGo9Ef2e4ERKBCp4p4h05WCJTEwc1mI+o2aHS9nFtIIYwMpXJD5PAWr8edDCAwSHdiij9QnUTCoOpIZ6GVxqwtree775IH8uMrnlghTqypCOtmW8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 19:21:52 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 19:21:52 +0000
Message-ID: <547b3804-ae8f-46f8-94c8-3b8dba4c1f36@amd.com>
Date: Tue, 22 Apr 2025 14:21:49 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414184600.1166727-1-tanmay.shah@amd.com>
 <aAe80OlwWENHI2I9@p14s> <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
 <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
 <7dba1e4c-a7b8-4e18-82a3-db2a7f4fbe5c@amd.com>
 <CANLsYkwadvmNiADUoMLM2rfoeKhLxJUtr-pY_6CvER1eSzd-UA@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CANLsYkwadvmNiADUoMLM2rfoeKhLxJUtr-pY_6CvER1eSzd-UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:805:de::35) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f9749b-6b66-4303-68ab-08dd81d2ef80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXRadUZUUTAxVXBKVWdlTXRmR0dvSGhVMERKb2kvR1ZHVFlMdkp3TUdtODVR?=
 =?utf-8?B?SnFjSjRBSlFmZkJDaVVrVmNVVmR4cWhrck16dGpHb2NpSWZ3emdWL1pFSG5t?=
 =?utf-8?B?Sk5lUkltcExiVkx1dlJaSG53NWpxYVJMejJpVHZEVHdZVk9RSndvTVNKYWRy?=
 =?utf-8?B?S2hrRXl4OFFXb21FVTlwQnVPRTdkcG5yR093ZWhTYWtiazNwbnJmT1ZyQm16?=
 =?utf-8?B?RmhnMytMYjY4UGthOUROM2xjc1A3SHhPSkJIS0ZJdGNaRGU3aUpQOWdkZE9w?=
 =?utf-8?B?UVZqM1A4WGpvWmM5dWI1MnJPbms3Mjl3R2tyOFE2bVk2ZW1pNm9rMCswOVNO?=
 =?utf-8?B?dnlXR0VrYmh2VTZYbGRnOGZGaERHTDFwanVTV0hmWlcwNDNZRHZ2Zkw3bzl2?=
 =?utf-8?B?MVZCK0F0c2ZXcytVZTRUREJER29ZWHN2RzBnRVFVL2FtbGE1bFAyMUNtT3N4?=
 =?utf-8?B?Tmc1cVBwclB5bnd4eHdFNlh6aG1SelhZQW9USmFhZGcxa1FNWVFJUXJiMDht?=
 =?utf-8?B?OHBoK3BFUkZTL09lV3dmMlFIZmsvU0VvUkI5N3BDTWlMM1J6NkdUbEZnN2FI?=
 =?utf-8?B?SzdIMnhEenZ2N0N0ZmkxT1B2OFVBa01PZnplSkduUUZ2NHFmZ2duTWdaZFh6?=
 =?utf-8?B?MkdOd05zRzYySmR1M0Q1bVNnY3JGckpmQXM4cjl0Tk44cWsyMEVoYXpQS1hz?=
 =?utf-8?B?VmhvQUEvRmdHU0duZUtwTUZQVXBRczcyd2YvaW1OcVdpMXQ3KytaTmg2bXJD?=
 =?utf-8?B?OXJMeVN0ODZ3U1hsNm03VDFZbTdaM1hRNG5FNzd2TmtCWFkvVkc4Mit3Y01J?=
 =?utf-8?B?RHl6dzlFcktHMFI1NmluYzNaNkRrMlB4ZlpVd2hCSDJvMjdIU3JNeHpxSEQr?=
 =?utf-8?B?RVRlVjVTSm02dVB6YVVVM2JaWlBtMjRJUTVOMEtLRHlMM3lqL01iWCtBclBS?=
 =?utf-8?B?YmRsN29Qdkd2WnhGczlNTWQyNUg3dW9iRzc1MVR4aGpOdGcvTVVrZWVqU25E?=
 =?utf-8?B?OHk0Lys1R3dKbUNNN3ZWQ2JSZFM0aEdKZW85VGx3SkNDTDFtMEd2VVZtUlRi?=
 =?utf-8?B?OTFOZHEzSUE2U0pJNXBDMjRtYk1KL3NNaVdTM21sNXdSemo3dDAzdENMRzVh?=
 =?utf-8?B?Uzl5ZTFZelU4STdmcWxyTHkycEdMVEkrWXlLbkFoT1luZEcxMlpJSTczMXhi?=
 =?utf-8?B?d3ZhSGd4Mmx6OXRleWFkZWs5Y2JOVUxZT2JKQTcrVFlwMDdJQ0hNOXg5WFUw?=
 =?utf-8?B?SkhMelMydUR2S21uQnJtNTJlYVZ1K1JLRkovK2Q4TXZqbFJrVDhPc2RrcTYv?=
 =?utf-8?B?bEJjVnJZak1ab2ZDN0Z0VTJCTkJSSFQrbjBGL0FyYy9aZzhtOTJldmNROVVq?=
 =?utf-8?B?MzVFVGtVUTMrK2hTQWhXV3liYXdpU1ZXUWJJRXd1TTA0Q2dMa00rSXdGYmRr?=
 =?utf-8?B?a1FET3pMNUJ3VkdlR1djZGhRdysxRlR2TjVKOXJtdk5RdUdqbHJsZVlFOGxv?=
 =?utf-8?B?aWJxVmxQMFFYVFZlNlYxTi9QVEtEQUZ3MzlvaFo3UVVjUTY0N1ZXQXVXd1Mv?=
 =?utf-8?B?a25CWHk1UGMrSVowQXRoQnl0L2sxNkdzcVIzeXd2QkFjeFIzRXdkd2N6ODJy?=
 =?utf-8?B?TVlNakRVOFNrUHEza2Q2MGxIYkFOQjVETEFQSTE0bHhiS3BESzBmS0xBeHVu?=
 =?utf-8?B?OXhoVWxMazNoVzR6WUpyNDVXY3plSmx1bFN4Rnl4NUlQWUVpMUNwbElxQW11?=
 =?utf-8?B?eVhwMFo2bncxaHhqblk3MlpJZHpTN2xSdlJtcjNmU0V1TVVpUEpyc3NlU1pC?=
 =?utf-8?B?ZXZGL0psVmFkSXpTWG9WcEkwYkxsMlpqNHRHNDFQTUZoZ2NSa2ZKUVVQZGdy?=
 =?utf-8?B?UEdnc1BhUnZXVG52d093T2FGRUJCSU1wak5jcGNlaFFmSXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2laNUlhdDI5WHBKYkluUC94RGVIWWhULzNQRHJFRUJMb0JZYmZUMkJ4RFph?=
 =?utf-8?B?aittWU45YkI0UGxsV0JxamVmYjdsYzRYVDdtMFRmQXluaVdPcUthaGVlbFla?=
 =?utf-8?B?ODhoWnNSd0hRZ0Q4aE84b2pMbDhQcE1VZ0RsK2g0TUFYODdqSEhRajQ0OXdq?=
 =?utf-8?B?cFlLTXV1V2RaaUNhQ0pWb2wxNjB5WUpUUHVsY2ZPY1hjKzByb3orU3U4M0JS?=
 =?utf-8?B?VTFnSGZsazRMcTRrSUpBbVpadmlUVUN4QWZiRWRMUFZKMXQzbVBPNW9zVmdH?=
 =?utf-8?B?WnNpaXFrVzJPUHpyOFRMYk5lcy9SVUx2Uko3RTUrcWQxSUUycDVMRDhjTjVk?=
 =?utf-8?B?TmZaNWdGb1J4dUNMWUI4anFWc2VjOEJ5T2VsYUZKNy9jOXg3eWJPUzd5QThh?=
 =?utf-8?B?WUtSOElHQUx6S040WkM4eVFwRUY0SlhMeTR1SlczTDFwSW5yVUFvSHIwNWta?=
 =?utf-8?B?MmhBNDBrVW83SnZ6VmNpWmpZdGg2bkxmYUhpWHpCTXpqSk1SaVpESnplQXo3?=
 =?utf-8?B?djBLYW9hYlRtMkJXbmtHUW5RMm5ZdUpmNVBoZjVqY1EyMittOVQ5dnFtZ0Qv?=
 =?utf-8?B?NDFzMk5NMEFrYzFiZzBJbW43aVNqT0JyMWpLS21pSjhvZmloTTE2QXluMHN2?=
 =?utf-8?B?cGlFaWFGdG9sWUVmL0U5QUg5cWFRWnE3K1ZQZGJXU3NHcGJVbElGeXNRSHEw?=
 =?utf-8?B?S3h4OFcvSU5EQlhIdjRjWWlrSDlxVVA4bUFPVllBeDBUZFhSQkI1amljSGM0?=
 =?utf-8?B?WFZkU2djZWwvQkllTmhWRENOVWk1Zzh4WlBzenJtSEg0SFNnMlJHY1Y3T1dw?=
 =?utf-8?B?MWM1ZEZ4Qkpjcm0waFhrcENpd29VdzF0QWZHV2JYYjBpR1lYMkZqVUJ4aFRP?=
 =?utf-8?B?b0dhQ2drelhVUUM1RlRrdy96SVIvcXFxMFVkdElFR1p6eGc3QWNjTnNoSkQw?=
 =?utf-8?B?RHg5Vkp6alhNWUdEbU0xMkhkUmJ4amsxSVpxc3ViRWxoTFFEeTRrbjBMcmhB?=
 =?utf-8?B?Y1ZlaG1OZTBOYlJwdG5zZlcybWVObU80WUJ6Qk9LSTNweVZaTVg0bnQxaDFW?=
 =?utf-8?B?c2xFdzFXWXg0NGZ3NlEweXZiV0ZRcTc2Q2R3WEYwOTI0NU96QVpmVnA2aTJh?=
 =?utf-8?B?M0ozMjZJWE1rbUlhRTNhd05zNWR1UVhOSGgwckxhNkhjQlJrTFU0VGZCQzVQ?=
 =?utf-8?B?a2xjdTZQTkRydVdjVUhBV0dqNWRKZ1VOell4ZDRFZFVCMTAxaUVCTFV1THVy?=
 =?utf-8?B?SkZpakdWZzVPdlNrUkNMNk00V2JuTXZIN2FrTEhXMU11Sm1obDBNRGluL0pO?=
 =?utf-8?B?V1NwK2h5cmlKU3Q0K1BMZEJnSHFJczd5UVRLRWdKbExsWThQNFJDdGVHUHph?=
 =?utf-8?B?aFg3SmRHM2xNSWYyVE9WNlBHVmZCOEd5WFQwWVUyUUVGMGlrcVBsTlUrbGI4?=
 =?utf-8?B?bXNNUmlWZy9JSDc3M1JKV05jREk5VGxQWTMrQktvVEVEOXc2RndrU2RScnB2?=
 =?utf-8?B?S3NzUmFzdXNONXlBTklvV3I3WWRITWIrSHV5UnZlaGNhdVpacHE0bDJsWTRF?=
 =?utf-8?B?S2MxNjVTZkhFNkpBNFpHUk1DKzVnODRTTEphTnJwbFQrSUlYejdhTTRGK0dC?=
 =?utf-8?B?Q29wS3VNMTd2Uy9jNFY0VzVnWUREN1d5MlNWZ3ZvajVsVHl4MlQ1bkNHdENV?=
 =?utf-8?B?ZzQ0ZUFSTUhCWFh3dmZvZWhvR3ZhT2V3Y2ZhOHBkelRtYjJYUXFtQ0JOM0h0?=
 =?utf-8?B?MllJbk9IZWRvamhVMEtBYkhpVHc3OXp1d25EUGxha0JUL29uNnhCQ2IvTjBu?=
 =?utf-8?B?NkVWcFJuc2FNVktXRkUyTi9GaFVTUW9yajFJUHM3NzJQMUZlVUREdGZJN2xQ?=
 =?utf-8?B?cWtwK3MzMXJRbTRiWko4elB0WDRDZEtKcExXSVUyL0xCOUJFNFRJR2RaSkJ0?=
 =?utf-8?B?c2lsNSsza2ZDK2djaU9Eb3UyeGwzek5VM1M1WHl1Z09hVG5uTi9qYVZ5VW51?=
 =?utf-8?B?aUdiUlN5MGVvczRvWlNmN2JVWXhFRzJhZG5LSjVNdWNJMk11TFdXZ2NLcWZM?=
 =?utf-8?B?QWdhUk1CUUdUNm5USjU1WTBsbGtYNVBRczQ0TmFUUDFsNkFBNDN2UEFJcFFt?=
 =?utf-8?Q?vTX3/mLthsDX7rXfZbjtCdKmn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f9749b-6b66-4303-68ab-08dd81d2ef80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:21:52.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNtAAfD5eEmAV8svY+oK5agu8sYHSUzC99LWQZvkqpEfMa2khSD6fm6GSdyvsiUO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336



On 4/22/25 2:10 PM, Mathieu Poirier wrote:
> On Tue, 22 Apr 2025 at 12:30, Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>>
>>
>> On 4/22/25 12:49 PM, Mathieu Poirier wrote:
>>> On Tue, 22 Apr 2025 at 10:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/22/25 10:59 AM, Mathieu Poirier wrote:
>>>>> Good morning,
>>>>>
>>>>> On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
>>>>>> Powering off RPU using force_pwrdwn call results in system failure
>>>>>> if there are multiple users of that RPU node. Better mechanism is to use
>>>>>> request_node and release_node EEMI calls. With use of these EEMI calls,
>>>>>> platform management controller will take-care of powering off RPU
>>>>>> when there is no user.
>>>>>>
>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>> ---
>>>>>>     drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
>>>>>>     1 file changed, 28 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>> index 5aeedeaf3c41..3597359c0fc8 100644
>>>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>>>>>>        dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
>>>>>>                bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
>>>>>>
>>>>>> +    /* Request node before starting RPU core if new version of API is supported */
>>>>>> +    if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
>>>>>> +            ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
>>>>>> +                                         ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>>>>>> +                                         ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>>>>>> +            if (ret < 0) {
>>>>>> +                    dev_err(r5_core->dev, "failed to request 0x%x",
>>>>>> +                            r5_core->pm_domain_id);
>>>>>> +                    return ret;
>>>>>> +            }
>>>>>> +    }
>>>>>> +
>>>>>>        ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
>>>>>>                                     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
>>>>>>        if (ret)
>>>>>> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>>>>        struct zynqmp_r5_core *r5_core = rproc->priv;
>>>>>>        int ret;
>>>>>>
>>>>>> +    /* Use release node API to stop core if new version of API is supported */
>>>>>> +    if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
>>>>>> +            ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
>>>>>> +            if (ret)
>>>>>> +                    dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
>>>>>> +            dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
>>>>>> +                    PM_FORCE_POWERDOWN);
>>>>>> +            return -EOPNOTSUPP;
>>>>>> +    }
>>>>>
>>>>> Here I have to guess, because it is not documented, that it is the check to see
>>>>> if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
>>>>> zynqmp_pm_force_pwrdwn() returns and error code.
>>>>>
>>>> Hello,
>>>>
>>>> Thanks for reviews. Yes you are correct. Actually instead, the check
>>>> should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is
>>>> supported, only then execute the call otherwise print the error.
>>>> Hence, the check should be something like:
>>>>
>>>> if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
>>>>           error out.
>>>> }
>>>>
>>>
>>> The above still doesn't answer my question, i.e _why_ is a check
>>> needed when zynqmp_pm_force_pwrdwn() returns an error code?  To me, if
>>> something happens in zynqmp_pm_force_pwrdwn() then an error code is
>>> reported and the current implementation is able to deal with it.
>>>
>>
>> PM_FORCE_POWERDOWN will print redundant error messages from firmware if
>> called for feature that is not supported. By doing above version check,
>> we are avoiding those unnecessary error/warning messages. Other than
>> that, you are correct we don't need to do version check as
>> PM_FORCE_POWERDOWN will send respective error code and we will fail
>> here. But version check helps to differentiate between actual error log
>> from firmware when call is expected to work.
>>
> 
> That is the kind of information that would be useful as comments in
> the code.  Otherwise there is simply no way to tell...
> 

Yes that makes sense. I will update comment accordingly.

>>>> I will fix and add comment as well.
>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>
>>>>>> +
>>>>>> +    /* maintain force pwr down for backward compatibility */
>>>>>>        ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
>>>>>>                                     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>>>>>>        if (ret)
>>>>>> -            dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>>>>>> +            dev_err(r5_core->dev, "core force power down failed\n");
>>>>>>
>>>>>>        return ret;
>>>>>>     }
>>>>>>
>>>>>> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>
>>

