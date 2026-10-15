Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF98F34751B;
	Thu, 15 Oct 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074676; cv=fail; b=cKNKlRn+Sl42U4N0jJdLAa+mADXZA7V2vaaKIGZxhUxbPBvpruy0qKnAVbIVf38r6cVvfaj7M7dsgRJl7KXOCI6W7CfnZjC2yn+tNYiaTXybr6bsIsN7xslVYUQd1qHt3kfPfsFr0dcEXibEufbNUGNwZ0aNRjn/Z/fTclEV0XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074676; c=relaxed/simple;
	bh=PL8cLXBS4pQwCt998dMoW6uBZ0PuHtnwyGKqMPV/UKA=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aMfO2cGbtlzhGdaFwSaWcTqeBCUJON80TcKZcTEt9Oav6mDKAcKNEb7cMu8sCwDDMvU6Qzj+ULJLylduVzRQ4wAMHkOYPe5CJYI5vi4+g7gnsgFwKpAw1uapYAEv1qQIX8mn0dSYS3F2y5Zi64dcpOQbSA5wFPiXIInkFGr8wns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wzFXNxw5; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wzFXNxw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aaxj2hWPQy8NTtZccHzZ5HcokVYk2G1taw7XUhFv5p8FXAlezYLX4Vkc72HcqYRFo+W0IBW0Fxshn/OosXKWq2ZIDbN2UmUM5999cysREk1sGT9AM0IWwV6bFqvcqW2eHUjhmXZdl2Kh5VvGeUZxE8iIlI61gYjGIAQW9AcrSicf3iPZlgDMwfeRmEK9OJvcc53JkHnQhfFkF4IW1tunZ3M+CrOPNUHz9E4+DzK417tJi+F4vypL+T8cv6rD3e30D+sV4En1n6D7pj8aYqcwegbDFC4P8R+OiQIRFTxHMuSy7GCJ0+/ZQDBN4Y96qqk6Rf16xxzaXYYHZCGYw8PI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PchfO2/vF8/TFvQIJgEvaxAYMqXp3inSABhb4CzMN+g=;
 b=Wmr1mvFjLwcGhvY11wH6z6CwhZ2yHXXAHHW2068UOCLnG+ov2dSlzyYOWHmy8qJkMSpezCekVaRdhA2ZNjD6TqwJnjzRm3GC/7V7Jpbp7q/b3znEh4uZtgNRaOVePwKPVPopvsUJwPUp9/HCBJWKsa3ac2QuYhBhn1jGoBTa9qIRlMK8vQeXvR/OJp0NQLo999pesmln61EcSNtV9mQ2+c/Cl2Sp1obZ/MvooaWcpdxO1SlA+nJBULgCD4rn0yKWf6NdnPDWbgNezP4WEGj3XCbfvkgK1kStZpDqIgJGiidjI88qTG9Q9L5RV9BhDSzMNTMx0OjBYw+H1I0sTmDhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PchfO2/vF8/TFvQIJgEvaxAYMqXp3inSABhb4CzMN+g=;
 b=wzFXNxw5TrUSm8DqZ4wQtLjADl8+vAeeSDMN20qsIs70MFizRbdEuAbflKBEb4IvakBbHem/Prvk7l6mWmkMW/UZJ2XXT2j/z3zrxM9mqsN0goDnmJpQeZ62t2ftC2otu14qIu9NRWe7jrMwJLQAw1bSrNi0jHxtuNr8ivxYAOc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:31:03 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 14:31:03 +0000
Message-ID: <b9e5863b-cf74-46e4-a1f1-a379be779ad1@amd.com>
Date: Thu, 15 Oct 2026 07:30:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
 <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
 <DM4PR12MB6448B4B18D0B45CCA678814F839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: "Levinsky, Ben" <ben.levinsky@amd.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Shah, Tanmay" <tanmay.shah@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB6448B4B18D0B45CCA678814F839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: 86947341-9d24-4640-39ca-08df2ac8f0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	tjxvdc4zdvHuNKTQRsgPRj5EMI/2t3CIVAl2+zOUVa0QBCcxxRmJEcE5ng0TumyRtN/PwYnWRSsa4Ac9rijk200JX1DQnA4RoTJxfRJyOm0nb5ws8/9P4zrxROJX9i9T9ZeLal1mRIX0+fauNkKw5rcxwMUNoIwGamezSdvLiujMcKa/V9ObJN8lVRwtIFfjiUDVo1l7x9/wdElOAs8mTLpGrZNHLstXH2h5UWGN34MoB0mV04qnCDEsVDcbIs34hVUoIGxq4pCflBCythspO5WhCtilyj6MnVIoa5t7NIJArhkz9cQYHjDvsLDrcnvanTDtXcvLmcT0AVKZ+B+3V7faGMrNz57hs0pxmzB5doP5wTwq+j3Pas5iFPOrvGNSV+KOfr4B9tG3zN4DLRkx/wZAtBqKUM80qyHXcg69ZmjVr5NXfTXB0aLQALhfWP825iY8j6kBpIvvb29BuFNuMKs4k500o1pid2vdR28MyXTlqI02d838Alc26mM3aY0BHHCE0RuamhSoB2VvIi7Is8TRia4Lfi1kEK9i9uhxC7B8+ed+jFhETTivLBn5ea+RIr6sthZl64UZ0cGBBmrRULtCtHt+IyOF0uPWlxwKmRw1dGV/jTkjziBagegy0mhp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZaQ3ZUS3lZZ0Z5VFZiSEdvTWxwckMwajNkdXhKYWQvdytqVTFjU2RWZEIz?=
 =?utf-8?B?QitzeTh3UHNFTExtZVBWRGRyQ2dJb25IZmlTNHN0MUtPMzVSOXE4aFpnS3R1?=
 =?utf-8?B?TUc4bXZxUC9CUlhwUFFjVzhjWUo3Q0h2K253cE5rc2UyYStSQmkyVFovNGky?=
 =?utf-8?B?T2ZFMTVYQ3JFSkh4OWt0M0J1bWdMNHZobEIzN3lHKzJlUFIzSkFSV3QwWWRW?=
 =?utf-8?B?VHJ4Y3kzRDMvbnlhb1ZVVWJnQnk1V0lta2ZZa2g2YllMY01JQVl3RFIva2hh?=
 =?utf-8?B?L0ZEei9XalhGdjFodnFsSkFZSTlUamt1MkdFa2U4ckRqMnVCQ1hnbzFtNzdV?=
 =?utf-8?B?WkN1RlpvNW5JYXNLSm1UTnNmSGhtdG1aUXVWNjFDbDhvY3F3R1dwNmo0M0V2?=
 =?utf-8?B?aDJzdUdVZ2hvclJoaVlRMjdQUVAwN3NwaWZ4UEZEZDc0eGxraFBWR0ErR1dU?=
 =?utf-8?B?SXlBQWhIZjJ6OS9kV0pzYW9PdUtORXNqd0dJVUk0L3hoVFlWYlRmTEJqYy9u?=
 =?utf-8?B?WEQxbjZpRVJpd3h3cVgrVGlTMldtZnQ4dHdnL0QxMTZEY2graDNTeFlXeEJ3?=
 =?utf-8?B?QkNIWm1DMGFUYUQyYUs3a0NMa2QrbW1XOUJPYTlnR2h4WHpJcmszZ3o4cHBM?=
 =?utf-8?B?MjVvQnJvdjZjbkk3MU9BZjdVZlJOakJRSTJlSGIrNDA1ekhJNEQ2eG5wS3dx?=
 =?utf-8?B?eE8vRlJnTGhGWktIbVpoSGhkVVhIQ0NuYzNodm90c1Nibjd5Ujh4OEI4eEVi?=
 =?utf-8?B?bTZDMGNScFhSTlVRalczZlVVV0xZZjZBcTMvNG5LTHYvN2dQQlYrcnA0MGxz?=
 =?utf-8?B?RlY5NVVwbXlaU21Lc2tlWENqYklwSVNiMy8wSGRhZ1pRY1Qzd01VOXAvSHhk?=
 =?utf-8?B?bmdlckxldHVOcWdQZHhZeU9YanVkWnlkVXJIU3ZsV2s2K0p4c0s4OE0zMUVw?=
 =?utf-8?B?TlVLV0dheFhkWFFtaytyT3czN2pKblQ4OHR1OHFYSTcyNmhNUTNjWVpnMGNN?=
 =?utf-8?B?RE01MU9YZjJXSjlZdzNsYndJd2s5Vm5mTHFJbXZOais1NHFKNTR5Z3BLYmVk?=
 =?utf-8?B?S0lNQnhhcDVMUkxFVzc3RUtKU1UvVHNsY1dvRGwweGcxTWdZa3pRMXFPNEVk?=
 =?utf-8?B?MDladnZ0cldkVVNzWFhnaDhUbFo4bEVpRXExU2lkUjQ5ZldOTjcvcWphVWFo?=
 =?utf-8?B?S3JOamFoVnNUdnkzUFpGMFVzSGcyRHV2TGppTk1jUG80dFBSMmhIUzBlNUVJ?=
 =?utf-8?B?QTJCQmh2Q1RiNGY3SGlsaUtoMlFONi9vWGJXUUphSUNDNkFGMkJEQ1RLcGJL?=
 =?utf-8?B?Uk9DQXRJK0h2UWlTRlJGRGYrM1FVSXlpSmxxcEl6bEhtUlNFOFdKbndCeWk1?=
 =?utf-8?B?aVRxazhRVGZCakFvZXRjcVVodjlsemNSUU5MTmVhdVNnRHZxdHhlMENOQVRz?=
 =?utf-8?B?Nk9jMTZRWmFkR3dRL3FKZFhNaVVwbVNzZHRiQmVuS2tERjMvN0JIMHFkYm04?=
 =?utf-8?B?aUl0MTRud05Ea0tGMkYyS0JFbkh1YUlQMEcvdWtOZWhYRkZhUUYxN09Da3ht?=
 =?utf-8?B?S1Mya0RJNHBWU1NOWlh6U2xaakZBdTlEeWRYeExOUzRqQlVZemZPcTF2b0Nx?=
 =?utf-8?B?NEhVTU5qUGpyTjVjU2g4bXFxaEJUdVJhN2hmMjY5YWdIUzIvSkFRS0NWVmY1?=
 =?utf-8?B?ZTFVVE9JZnpkbW5KTWQzWVZTL1psT3lXaS9VUjNzdkpNMFV0L0t0ODFad3FB?=
 =?utf-8?B?bTVqYjBCaC9Wc3ZUN1dIa0d2VFVTWVB5WWJWdVJjb2gvZjdweGRodkliMm0r?=
 =?utf-8?B?dVIyMW1Ic3llVkc0clZpcWQ4NExCTm9FV0lyMkFmei94QTVyMDNRM0lBc1Zo?=
 =?utf-8?B?Qjd6RjhpZ3M3NUdLd0VXNEFnQlJiVzNsTjRZRFYrMDYvd0craUU1c1A5TkVU?=
 =?utf-8?B?cWo2VlFGVFJ2KzZMVlpwdkp4T0ExRk5GbHJMYnc3QUUvMnRxQ0gzRXJYWGJW?=
 =?utf-8?B?L3BLV3ZFc1ljMCtSZG9kV2JiYWJxZ1lnZjRRbHBLd0s3ZkZlbm4wV1ZCcElE?=
 =?utf-8?B?dWIxbE5rMTAvcFppSCs3VzJpMkhrK09KU3V5Q0p5SVN0MFdqODVxQ1F3aDQr?=
 =?utf-8?B?cTV2NzIwNDBXN29LTEFxTE10cDJGOHV0N1hCVDlSVzNxNUZocWpKcUtVM2Ro?=
 =?utf-8?B?WWMrUGpDdUJZUVhGNTRNbnFMekMyUEY0YWxKZitWSW92QXpEMDFBVVFlL1gw?=
 =?utf-8?B?ZmxiVUZ5WHhFd281TmxRS1kzN3d3UVltUmVIczNZdTZnUUtyNlFPcEdVNVBY?=
 =?utf-8?B?cVZNSlZHVk83NzArb0ovS0FpRXFNZ1pLT1RHOEpOK3VFN2w5YlZiUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86947341-9d24-4640-39ca-08df2ac8f0d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:31:03.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rweGjK4tCuUkA12FsmfHcmhUI7G8SLfVgGvDa3mnMwmb/bBh1/ROmjNWg/HbIg55khqtT9iLMUkzgbpP5V6Jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286



> 
> *From: *Krzysztof Kozlowski <krzk@kernel.org>
> *Date: *Thursday, October 15, 2026 at 2:48 AM
> *To: *Levinsky, Ben <ben.levinsky@amd.com>
> *Cc: *jassisinghbrar@gmail.com <jassisinghbrar@gmail.com>; andersson@kernel.org 
> <andersson@kernel.org>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.org>; 
> robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; 
> conor+dt@kernel.org <conor+dt@kernel.org>; Simek, Michal <michal.simek@amd.com>; 
> linux-remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>; 
> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm- 
> kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux- 
> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Shah, Tanmay 
> <tanmay.shah@amd.com>
> *Subject: *Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
> 
> On Wed, Oct 14, 2026 at 02:34:24PM -0700, Ben Levinsky wrote:
>  > Add a mailbox-framework controller for the AMD programmable-logic
>  > Mailbox soft IP. Expose separate transmit and receive FIFO channels.
>  >
>  > Enable the interface clock only while a channel is started, before any
>  > register access, and disable it last when the channel shuts down. Keep
>  > provider probe free of register accesses and leave the IRQ disabled until
>  > a client starts the receive channel. Initialize each FIFO when its channel
>  > starts, use receive-threshold interrupts for incoming words, and poll the
>  > send-threshold status for transmit completion. Stop that polling from
>  > accessing registers once the transmit channel begins to shut down.
>  >
>  > Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
>  > depth given by the device tree. The FIFO transfers 32-bit words and the
>  > hardware conveys neither a byte count nor the FIFO occupancy, so a
>  > transmit length that is not a multiple of four is zero-padded to a whole
>  > word.
>  >
>  > On a receive-threshold interrupt, read up to one FIFO depth of words and
>  > deliver them as one message, then acknowledge the interrupt. The event
>  > latches only when the FIFO goes from empty to nonempty, so a word that
>  > arrives between the drain and the acknowledge, or words left by the
>  > bounded drain, raise no new event. If the FIFO is nonempty after the
>  > acknowledge, toggle the threshold to latch a new event for them.
>  >
>  > Assisted-by: LLM sparse
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >  MAINTAINERS                      |   7 +
>  >  drivers/mailbox/Kconfig          |  10 +
>  >  drivers/mailbox/Makefile         |   1 +
>  >  drivers/mailbox/amd-pl-mailbox.c | 369 +++++++++++++++++++++++++++++++
>  >  4 files changed, 387 insertions(+)
>  >  create mode 100644 drivers/mailbox/amd-pl-mailbox.c
>  >
>  > diff --git a/MAINTAINERS b/MAINTAINERS
>  > index f53047aa8d3c..4e28e0c311c0 100644
>  > --- a/MAINTAINERS
>  > +++ b/MAINTAINERS
>  > @@ -1287,6 +1287,13 @@ S:     Supported
>  >  T:   git https://gitlab.freedesktop.org/agd5f/linux.git <https:// 
> gitlab.freedesktop.org/agd5f/linux.git>
>  >  F:   drivers/gpu/drm/amd/pm/
>  >
>  > +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
>  > +M:   Ben Levinsky <ben.levinsky@amd.com>
>  > +L:   linux-kernel@vger.kernel.org
>  > +S:   Maintained
>  > +F:   Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
>  > +F:   drivers/mailbox/amd-pl-mailbox.c
>  > +
>  >  AMD PSTATE DRIVER
>  >  M:   Huang Rui <ray.huang@amd.com>
>  >  M:   Mario Limonciello <mario.limonciello@amd.com>
>  > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>  > index ab869769e278..3c3f262c903c 100644
>  > --- a/drivers/mailbox/Kconfig
>  > +++ b/drivers/mailbox/Kconfig
>  > @@ -8,6 +8,16 @@ menuconfig MAILBOX
>  >
>  >  if MAILBOX
>  >
>  > +config AMD_PL_MAILBOX
>  > +     tristate "AMD PL Mailbox soft IP controller"
> 
> Missing depends on Zynq/Xilinx.

  Hi Krzysztof,

  Thanks, I will add "depends on ARCH_ZYNQMP || COMPILE_TEST" in v2.
  ARCH_ZYNQMP covers the ZynqMP, Versal, Versal NET and Versal Gen 2
  families, which are the platforms this has been used and tested on.


> 
>  > +     depends on HAS_IOMEM
>  > +     depends on OF
>  > +     help
>  > +       Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
>  > +       The controller exposes transmit and receive FIFO channels to mailbox
>  > +       clients. It supports interrupt-driven receive notification and
>  > +       polling-based transmit completion through the common mailbox framework.
> 
> ...
> 
>  > +     mb->controller.dev = dev;
>  > +     mb->controller.ops = &amd_pl_mbox_ops;
>  > +     mb->controller.chans = mb->chans;
>  > +     mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
>  > +     mb->controller.txdone_poll = true;
>  > +     mb->controller.txpoll_period = 1;
>  > +     mb->controller.of_xlate = amd_pl_mbox_xlate;
>  > +
>  > +     ret = devm_request_irq(dev, mb->irq, amd_pl_mbox_irq,
>  > +                            IRQF_NO_AUTOEN,
>  > +                            dev_name(dev), mb);
>  > +     if (ret)
>  > +             return ret;
>  > +
>  > +     return devm_mbox_controller_register(dev, &mb->controller);
>  > +}
>  > +
>  > +static const struct of_device_id amd_pl_mbox_of_match[] = {
>  > +     { .compatible = "amd,zynqmp-pl-mbox-2.1" },
>  > +     { .compatible = "amd,versal-pl-mbox-2.1" },
>  > +     { .compatible = "amd,versal-net-pl-mbox-2.1" },
>  > +     { .compatible = "amd,versal2-pl-mbox-2.1" },
> 
> So all of them are compatible? Then why do you need all this?

  Yes, they are the same IP on every SoC, so there is no reason to list
  them separately. As described in my reply to patch 3, v2 uses the
  single compatible "xlnx,mailbox-2.1", and the match table will have
  just that one entry.

  Thanks,
  Ben

> 
> Best regards,
> Krzysztof
> 

