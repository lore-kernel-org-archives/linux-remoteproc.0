Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B067182C5
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Feb 2024 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706867041; cv=none; b=Vf6l956x/xdbSUArpiRoIr8YySx4tgIBQj7i9b7OOa+K6XnGO2J73sHJHjRZpXMs73tJETR1vnb8EbpYzH9ntnnsviFL/uWJAiPnJisF2pS7G5g6gHbKYDD5U4BcEgmCblVJMGq+MwqyMrhbYJHdU3AccLja0qUGDz8XwauLjuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706867041; c=relaxed/simple;
	bh=0gSponWPD5pRMgPNjQiZK7Ym17xVjhx81lCmCyLMrhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=auKJ1g8BHNH2dSas+ivyfWxDPBIe7VkSKCgKOGyIv1ga/OcYEuJm7efLXVCxjUxqu4y3GcAgksAwn7CP8UESmszYgop2pY325BHRRtMgszBGQNJXnttrc/to4JeLTgRvCs/FB9EvRVZI/IAyCnYGqajzdjKluUzA6zy9/ha6IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GDzwbbpY; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GDzwbbpY"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4128jYtg029462;
	Fri, 2 Feb 2024 10:14:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=beRBQd08SkWcu2yrQWWKIySWaH5YZPesRpx3lxFNk0g=; b=GD
	zwbbpYg1lYJuqHZXm1+TV2WchPCFP/0NuyUhZx7ltSJqDakBk8sVsBweFCC8y0P0
	UAN/xKa3vTJYxKwJcQ9HGLB3+X4AzesI4CLkq0eUS46CFrsAKtOvDIOmAnT5cdKR
	HZiiV31rloyeBCCTEOkAPuJYKiIXtPW06QplPhJ6nIUnIRHXyXwIY2mVElrCamio
	P84FA8qxpqcTdt5qq7Y496zRA2xxFk0CMo1rBrdF4NsHP2Xrfg/GlNxZtm7n0ExQ
	AZhh3I/aDSaKWSohoVCATOo+a/SOZKllVMCrP6mQH4NRt+E3UIQynMImsOO/zWQ2
	kBgxGkNziNZIkTp5kMXA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w0puj1jag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 10:14:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F097D100050;
	Fri,  2 Feb 2024 10:14:09 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E6222FA5A;
	Fri,  2 Feb 2024 10:14:09 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 2 Feb
 2024 10:14:09 +0100
Received: from [10.252.18.177] (10.252.18.177) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 2 Feb
 2024 10:14:09 +0100
Message-ID: <cc9926d2-4341-47b3-8b00-a33fbf653744@foss.st.com>
Date: Fri, 2 Feb 2024 10:14:08 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Passing device-tree to remoteproc?
Content-Language: en-US
To: Yann Sionneau <ysionneau@kalrayinc.com>,
        <linux-remoteproc@vger.kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Julian Vetter <jvetter@kalrayinc.com>,
        "Jonathan Borne" <jborne@kalray.eu>,
        Julien Hascoet <jhascoet@kalray.eu>,
        Damien Hedde <dhedde@kalrayinc.com>,
        Titouan Huard <thuard@kalrayinc.com>
References: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
 <f67cd822-4e29-71f2-7c42-e11dbaa6cd8c@kalrayinc.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <f67cd822-4e29-71f2-7c42-e11dbaa6cd8c@kalrayinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_03,2024-01-31_01,2023-05-22_02

Hello Yann,

On 1/30/24 11:20, Yann Sionneau wrote:
> Hello,
> 
> On 1/23/24 14:32, Yann Sionneau wrote:
>> Hello,
>>
>> How interesting to upstream Linux would it be to have a way for Linux kernel
>> or user space to pass a device tree blob to remote processor when starting a
>> remote proc FW?
>>
>> For instance we could imagine something like this:
>>
>> 1/ user space does echo -n firmware.elf >
>> /sys/class/remoteproc/remoteprocXXX/firmware
>>
>> 2/ user space does echo -n my_dt.dtb > /sys/class/remoteproc/remoteprocXXX/dtb
>>
>> 3/ user space does echo start > /sys/class/remoteproc/remoteprocXXX/state
> 
> Any opinion on this proposal?


Interesting use case. There is no concrete need in ST, but it raises the
question of providing extra data with the firmware to the remote processor.

In a first approach, my personal feeling is that the ELF and the DTB are
interdependent.
So having a mechanism to ensure coherency between both could be important.

Then it could be interesting to address the need in a more generic way
to be able to transfer extra data, for instance an audio tuning for a DSP.
Adding a specific sysfs for each specific need could not be a good idea in long
term.

Have you looked into some other approaches such as adding the DTB as a specific
section of your ELF file,or adding the support of a new format that packages
everything together (for instance FIP)?

Regards,
Arnaud

> 
> Thanks!
> 
> Regards,
> 
