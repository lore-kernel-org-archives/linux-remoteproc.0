Received: from smtpout37.security-mail.net (smtpout37.security-mail.net [85.31.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D9A3D550
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Feb 2024 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=85.31.212.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359607; cv=fail; b=KatUF8xjyAVgD1tbkmKLSKKkf7XzDDnJUtYtgX4J1xMVXWHhUxvoyRgNM9mSdbsjtC6hFwX4FZItRg7GIUi6OXYu25+NFWgbU6IGVmcdOGEnwB/vRG6uMrxsDkAjFeeGMr0U2+h9AMY/Kyorlnz7HkaSU/rsOKVKtTKYelA/fAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359607; c=relaxed/simple;
	bh=yq0hWMQxrv+UIjOWyKq1DPmHgMbWy/Z2QqtAb/qlyTY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mvghPiorSDwHbTUIrwn+3EFxfXj6WiEUNTCZSS9jM3YgQbTl4chh9/0Kwh1idCSbS/6lqswDxCFf465QwCHCMoWW639lekifTON+Q1RYAumunEzferklAJSyJZ/VYKCccUP+jzoy4C5gXJpVzKcqL13kKU4Dyt/IZv5LrEnKuaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com; spf=pass smtp.mailfrom=kalrayinc.com; dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=kHuaXDgj; dkim=fail (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b=T/UEzqfB reason="signature verification failed"; arc=fail smtp.client-ip=85.31.212.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kalrayinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="kHuaXDgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="T/UEzqfB"
Received: from localhost (localhost [127.0.0.1])
	by fx301.security-mail.net (Postfix) with ESMTP id 9340BF5FD9
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Feb 2024 17:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1708359468;
	bh=yq0hWMQxrv+UIjOWyKq1DPmHgMbWy/Z2QqtAb/qlyTY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=kHuaXDgjY9Tu/F2t/mRaBlnRQWWcec+atkxUSBVimr0hZ18fKu5kNVIj93edKRBSt
	 TI2NAMhZutaBfVgQ27E3djiU+Gmqo63nsSYPkTx/2E0+TE6/QV7XhMTjCMK0ndUzEn
	 gyzYqDnvDcMVjeiidAh3hBuoyefZ5WFEKpx2JmTo=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id 726C5F5A66; Mon, 19 Feb 2024 17:17:48 +0100 (CET)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx301.security-mail.net (Postfix) with ESMTPS id 009A0F6142; Mon, 19 Feb
 2024 17:17:47 +0100 (CET)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB1779.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 16:17:43 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e614:6271:168b:1d85]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e614:6271:168b:1d85%5]) with mapi id 15.20.7292.036; Mon, 19 Feb
 2024 16:17:42 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <17718.65d37f2b.f3e12.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKJtI/emsL5r+prJmFxxlNVV9M94169M164ZHGgoWmC4smQQW5bB1guA2c1xx7RAhRBYuV3m9LwzbjDnonckGrziOu8Ebj4gUAvF8Jp2xbkqHDYbFEm+RpMeoilqhyhiEGd+VNmlNhQCzDzzt2yFlrnJSkgvkPrpktEiMISJ6xzdm44izkkIaXkjkWCVc7mHhr4detJDsUhLhURmjDvYLy56Lyez209HOhYMe5g9OS2CfROFT044TMIkUgeWABeYBaj/iQFD8cvgTMvl/5FaPWBzdcXcmJXJaQNIXEKWu31SAI6EjuuZJzyNo8/Ol5p5M4lvvNqpuLF5gHrEPneGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTCeBVEENzuAMR3JhX+i9rO6htVbBY6WGO11M1kVkvo=;
 b=GIqPH2wXcSM0+MzfqV2pJsdXmg8AcFf1LIIGIgi9oE3KMd7w/b5o86BCO0OBhR/zsFVrdhilmH1lMkYz6WsNBYHpmR7f66x+/Wg/KBDT8wGEyhUbc51Mxqtlx4EF/KS2wIOMBLCxHrvO5eh2LnPyps1uRlrQpzNzojvdUvxq1Xc9eZieZ74nPQuft0I5AcDne1TQ3CjkeUpKavFpeOy7OiWl+6GB+JoOHcIjaPiDlVrCEUBx4v//yaBEqRuNO6/H++PliIO01Nr6s1V6+bgOSA+kawlci0Su1QMJfuUdMI+bgCb8PHvHZDM0sIuitHX8/rSqMDGXsvOlEmB5UIhK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTCeBVEENzuAMR3JhX+i9rO6htVbBY6WGO11M1kVkvo=;
 b=T/UEzqfB1m233KH94t6wPgxSn7O5SpnFeWusa2u3PUfmnozGmS4d4s6HBi1BGm6dE8Lwegpjjf2W27RtBrFnIGT42tZAt5iLGYooRkz21DK9GIXkq/kLK/azI1Rd5LahSbDdP6e1DEcZS4qfE6ICi1+ipI/6WKp9nU0MukBx+QD4vRvd3ouJAa1f2hjMbJnUBEfALxGAgGdNNnrHI+1eoqgDBfMRXjzt+g/UU/DoI4PdQpcfRsYsAFXlDXkdeNODAK5Td7qMkgZ+CZRQWyiA3qB6JOk2B8My/oqTFdgVyuhYJgY6rIdstcZploTrTlghJN4aZe194bOSqNnmKz2VRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <06a91897-9058-69d5-79fa-cc8c774798db@kalrayinc.com>
Date: Mon, 19 Feb 2024 17:17:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [RFC] Passing device-tree to remoteproc?
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN
 <arnaud.pouliquen@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, Bjorn Andersson
 <andersson@kernel.org>, Julian Vetter <jvetter@kalrayinc.com>, Jonathan
 Borne <jborne@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>, Damien Hedde
 <dhedde@kalrayinc.com>, Titouan Huard <thuard@kalrayinc.com>
References: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
 <f67cd822-4e29-71f2-7c42-e11dbaa6cd8c@kalrayinc.com>
 <cc9926d2-4341-47b3-8b00-a33fbf653744@foss.st.com> <ZcFNnDDORrVuWKHq@p14s>
Content-Language: en-us
In-Reply-To: <ZcFNnDDORrVuWKHq@p14s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::30) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB1779:EE_
X-MS-Office365-Filtering-Correlation-Id: 02eb910c-e0b7-4281-f2a2-08dc31664cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXlCfb9mM1B9lSbkkQZIIY6Qtdg82YWm/69eHGplqo6iLaaRwKhRPcCpeUBpfR/yQEfIogeZStHOUC2gI6PSHDnKNjPKolHSlZJFAhHqVxaKe49ZUKMPUQvoIFQ0a3gYbmqU8brAzmR8yXpLZJSll9pAvMPhuOjH6oyPe0Io0OZdHw3Tfeq9Lfoaox0fxi/uULfkxuui8zJI0RaFJLqVyks+a7viHhFTzrXKthNq9keUerDFHxfhKr2QPzTLVLe8hU9oiixAqn78FFep8+AMboYgdQpkSV8kRE+cYKKkf7AR6ZEg5BFW2t1J5KAMGjD1dfxb6gXIsuJ8j6ZWjRGUVigqBpZ79pxlB4TUr+PQd0LUqp9ZQ16CaHedYXsSPrZqSJhRP8xIzA4SzZlIbNHleWw28fn7P+RqbReevR6juNK+U5lixwA8Tdjy0/a/ac423PL+irIaDgb13tg7udtxiS+pNZK68ckLdBGqYYUnh+qdSvOAhkYGmfUJxhkmdA5wlxqetdgsYkVBkVu4kKkdB8535ny7HHKtOoTjvLlMoPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rljP7ngMGsA+flXW41nNYaTznq20ngrtvWRdvmOh91+m+IacH9dPIMiOge1wExmt2qHA9I9YmthuXocG04JZhWyKHPFyPiIlug8Aq2xs+1GO79zYOvegqJAHRes/uy1DUN6HrmJi+nwBfEcqbAofvcG+Op3KEtddU0Gmt9atZZSiXolZraJd2mEqfPy1okx0/6WVcnDip24FFO84JD8jlelR43JsDjxY5GNdstyzZYPk90QjDUPGtM0LHvZ0Ynb3O4iJglUi+JHLtinweoM1W3/iwMS3cqNnSP+aXv5noscWIFCqVa9GuFLs+SJlezyJfibjLIGI+XCvtAUWv9oOrtb6X6XFLj8wJRGWhuXm22GaxMurHSV88WIvsn8fIRqhabSRvsHgH3I+ekfIAQ53lzPU/+2YINBOETc3d1BGeF292odrONi4AdoKucg0y7p44tH+3tpbGjQ4ADzAz5rKRGVHpY1GFCOlH4b133adoZwB2rF6L0xlt49nvhRXaa2BflYsGNXrzgZauHa3XgoEQFmve7LhciZYk/4SxS8mlPzYq+OiFt/dY0TtW1u3eCfR1TCUVkEt6T1CY4cgKWzGIyfjtFiVF1MHZS7dr9IezLC/W0zUfFjjThR16qssYzThhaPAkILWXnW6Z5xi4zc7HhXSr7uXV/vO1G8+NoyjyiH8QBlaUpkSP/7pIEIJp/DFZTJT34w+6M5R+bDnAjQqJmcCa4vC2oibrDywqB/aMgBdxsbWRvncf8iEiYSRGBiDGUbxcZgmtX6WPUFeSNnhWVhfNp45dtoVVaRQmHekjFKhdYhyl7UGBVbIJ+zeo+S98lpsoODxQm6OjBBc7u+ivVlkfcMBmueV4yMcmv6TWZM59myRrfNxcX7p41Skdst4YqdPFBPi+lgNHpKd48Ezs4PQmgxYWoFuoKXZG3hMmC3xNENPoP4sMEZtIvz8cC9r
 4H99wJBTj8BSconeqNtaWqnMcifLzgrC9Ffni2j2Bsub2Fe8dRQn3VZTLnAP0aZB/2XEg0cUQ3OE8VM5QmHtIGvmi0+aGTuWJL/0dLq1riwjUolUJXPWFeT2or9qW+wRejEbmswCol+KZ2EKsmWWNswI/+3Ggl3xZwO9rMVJk6dVz2e9kQVkx61BwxdvFyJfposq/E4gCxOBvg0RcruqmQZwvb2wdWVVKhG7mM7EccBXe9mu7QiTW64qJSEFVqyGPcB9jIdKeuw1UZljMALPj0S0XV18Fc3NFpgPHcpRLqQBBGjqgBw15/0Vn9VJNKcSws2owAP/rvE+E/VxnuJDM0jTZ8zufGDfFIfZFRkMa0Dw565BH5DP4XmSCOCkWZ5H8HR+VtMLlyZHHTkJcU8LUrkfYKriKKh3wxbzpGD8rG1/OFm0wYtLH1MzobLA2GxZd7m5QjsmPGyE7bw47lnu/oUn6h9cUaQV9aTOl1Y4atVB4VJC0HiCjXD0YRY0swMQIGtajwRgxKJbekfWmJ4FwQGH0sz5gtJbKt7AeVRXIU/odZEkpRVqym5L4h5pQe/N4WQU6jak1GnHzAgvPEtaKiiKZ1VWr4I+FISPjn3TArYFIiNkfPQ379yf6NTloVJrajZW+tFr4rqyj6aqOqEkJA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02eb910c-e0b7-4281-f2a2-08dc31664cbb
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 16:17:42.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXEhRgI7ZNEGw/xHRHMjNHTm5PtFIP9gRDo9WT5SrqMeg7FfPksAu+7WuNFuh8bcoXXLeASuiprkgq5Lqf4mrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1779
X-ALTERMIMEV2_out: done

Hello Arnaud, Mathieu,

On 2/5/24 22:05, Mathieu Poirier wrote:
> Good day Yann,
>
> On Fri, Feb 02, 2024 at 10:14:08AM +0100, Arnaud POULIQUEN wrote:
>> Hello Yann,
>>
>> On 1/30/24 11:20, Yann Sionneau wrote:
>>> Hello,
>>>
>>> On 1/23/24 14:32, Yann Sionneau wrote:
>>>> Hello,
>>>>
>>>> How interesting to upstream Linux would it be to have a way for Linux kernel
>>>> or user space to pass a device tree blob to remote processor when starting a
>>>> remote proc FW?
>>>>
>>>> For instance we could imagine something like this:
>>>>
>>>> 1/ user space does echo -n firmware.elf >
>>>> /sys/class/remoteproc/remoteprocXXX/firmware
>>>>
>>>> 2/ user space does echo -n my_dt.dtb > /sys/class/remoteproc/remoteprocXXX/dtb
>>>>
>>>> 3/ user space does echo start > /sys/class/remoteproc/remoteprocXXX/state
>>> Any opinion on this proposal?
>> Interesting use case. There is no concrete need in ST, but it raises the
>> question of providing extra data with the firmware to the remote processor.
>>
> I agree with Arnaud.  From a mechanical point of view it is interesting and
> doesn't pause a serious technical challenge.  That said I don't really
> understand the motivation behind the idea.  More details the exact problem you
> want to fix would be welcomed.
>
>> In a first approach, my personal feeling is that the ELF and the DTB are
>> interdependent.
>> So having a mechanism to ensure coherency between both could be important.
>>
>> Then it could be interesting to address the need in a more generic way
>> to be able to transfer extra data, for instance an audio tuning for a DSP.
>> Adding a specific sysfs for each specific need could not be a good idea in long
>> term.
>>
>> Have you looked into some other approaches such as adding the DTB as a specific
>> section of your ELF file,or adding the support of a new format that packages
>> everything together (for instance FIP)?

Our use case: passing the CPU frequency to the remote processor fw (in 
the future we might even need to pass other things like device nodes).

On other use cases we do indeed stuff the dtb into the ELF `.dtb` 
section and it works well, so I think indeed it solves our problem in 
the remoteproc case as well.

However, as you said, it's even cleaner to use FIP or FIT images to 
ensure tight link between the ELF and the dtb (it could even allow to do 
signature verification).

I hope our use case is more clear now :)

Thanks a lot for your answers!

Regards,

-- 

Yann





