Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774022;
	b=5j19Uw7w6rFQEWeQLt1j/PQdDYzovD5KH2vLWd7aW9FXiKRma0b8IESwBRnvwhs/rAxZ
	 SXs+RbQN4Gn5TDIux5wbByqo0oBkjtfW+dFJwFaTLbLDbtRHkA/x/sKjdOZpzOapdnoDx
	 OW/FH8imL8Tur34gZgCHLJvbDRGJ0Z0zc5ko1QRe/3ECfJGGkJmF5nrG0cZxSW1j+Due6
	 uVnK1NjZRJ7MW9D5jYOZ559No438vKwkMocOlDlBjI5AKir4t5AEA2/OKIOxvAF7b8Qia
	 qFKinDp/WeuNjW9D5aVHyv8r2G/lTCl8eXpJCgBX0qnjfwOV4MFYb8MaIisYWVIdCag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
	b=ar46lsd5ApWv1qBaFEUM/mwPiqED3MQp53bE9sPvTBB9wPZs/idxdv80QV79gTO+mrn5
	 kEh5irdtJoLi2rjWbWnPNhJvXn3RzHjTOzlU3ErSOyl/R8qwaXrOvh7BjWpDhX+Y92czC
	 CnlhjSvXgjCkjLwMMp1paHNcvpdoEV7PJ0JnQchVHR4NyQJHfxTZrBbuOjVpopsblbJOJ
	 uAsY0YOKu2WJv0LxljlRHMatiquJmfKz0NMUInifZJhI/8btqxewxXkgdHB8PhfnrpeuE
	 hfjETj7h9p3y43kXYd8MxfEbb+PXteTCU40u6xGkKzUDSuKmKQ5NRluj8pyzDdWEi3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9MQL8kW;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D48606A31C
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 10:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9MQL8kW
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cddc597d062so4771343a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774022; x=1796378822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
        b=W9MQL8kWF12NP8Ld0CddhitaY7skX/cPI29eygyDp4q7kKffn8ENuaGDAEY7HZp+QZ
         W4FWujCgzWYGUl1e5wGZ2lE/nQQjPOgP9e3Qu0NzEo4YgpLst1IxW6yVk7/26zp23o9K
         SAnZRMuX5ORkHUk27aPyKiXmVy2hB7oO0KCChdLs4SBpsw+2l77rMjdP7a2gn+t4kptc
         j6BAHpWtqVRD9IVq6JzV6dkfjBh5ZmsNPALLwFtddqt91z9YcwN0DBUGgzd7QKf8XauL
         X70613+5WIFRTdunHWdD+0p8Nrasr8RBHiE/F+qDCh9KPAdznjV97PpV1IiMXcqu6nxw
         6HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774022; x=1796378822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O73XxAIF0LgsnwonyeWn4hJSY1YD1aIc/jM/RSa6a3A=;
        b=atLoTCJzG3OkGW//kr5DgUX9ylzhEZSeZnHkDfNuk8we3ki7tMglhWtLnUijspjvC9
         if3Nza6AIiNflzwE5FlNNVccQiNq4PeoC7ww+srhONGZ92+IodVwqfLPH/piGW3liXW3
         ToCbpyxqUZJIcqYo593sQv+na4GKx8oBM6J9x/bT2kUU3jlmlsRfZgOj/nvq4d7bRxkj
         B9i9Cfo0+ceRi5D80guISHR4hu5dXirLI8AkndoPDabeLFP7GZ9IE57xlXRfuos42Z62
         lrP0AhYjrdmWvRv/jgwHM1aBLjUUGDEvqquoMpGRBXs6+SMOrLhUykC36iz+Ddrf7Efw
         dRTA==
X-Forwarded-Encrypted: i=1; AL+hErECV2l18XHp4ycjBxg3SW9Jmn2MYmXJEqwPOEcotO9PQc3mvgVZNGLy5amO6dqBTuoYt2d9f88eb3b47o0nzFm2@vger.kernel.org
X-Gm-Message-State: APuU4Z9F59bjpHgsUmVZxdM7tqiDPvyyXQkOheGMv68uVFezLw2L1Tlc
	/Aac4I+iYhORcUmpTIEHm+BcVOjypcxSf6KjXalc3dpPoD8OKqtaWFWDhQQT34w3
X-Gm-Gg: AZFdTZdWVXOC6VLxyYjwnWipKfoOP6isnDDmfYVs1zZdXtOV/cvdF6KdINdIQq1JIrS
	Ox9jP2Dp27ykOp+2xnniJN3hHpfZ/gsNZaNS+KG1IOxH45MQcYmxsd4lJMW0+OKjUKF7GhNe0w7
	GvlMaWDo+hj34EjpHRcunyxRcbMVfC8ASu+bvw6cMTbuYvGdK0FExyXmD8fT0x4/2JiUB3mmp7S
	m4wp298NzuZGoS5NNdI0xeR1fuXgXenShVXRdpOL9E2e+E3+Sq5VXE64ke0WKXYWt7r74d0UrXs
	Ci5CbTJIgQ5E4kSVJVqAvR7XK9fXJ1qxs6tg03sfOU2mS3NiZmlXviz361SW/fdsesVhYQWANKc
	X3+F8b9bisboCTdO6OGrNHsKkPULs7/COO0aFreAePsBW3ckZqwpefO4ziVwDHaOp8umxLtu/BC
	QSfNJDLB+8bJcZuaB9CU1k7vXErYEUjQtynT8POD3SYcbChaNhZfBMsgrdSddcoLocqrxX87lwB
	BU/GeQITfreJYKxkP2yuxiAj6Pm/CyrgbAPYRWK1Oxy7TcA+HRuu/TLmMs5r3nxsNlE/20DVA0a
	OY4uVu5lIlCXFtK4WSRYGvUCMSpTHlQwSWB7uOEOK09wQ0qP
X-Received: by 2002:a05:6a20:ef0b:b0:3e2:8c83:6824 with SMTP id adf61e73a8af0-4014a17a54emr20630236637.10.1795774021793;
        Fri, 27 Nov 2026 02:07:01 -0800 (PST)
Received: from [172.22.14.75] ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm12059639a12.21.2026.11.27.02.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:07:01 -0800 (PST)
Message-ID: <5934f495-45d1-4e78-80e7-e33f802bbddf@gmail.com>
Date: Fri, 27 Nov 2026 15:36:55 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
 sibi.sankar@oss.qualcomm.com, robh@kernel.org, quic_srichara@quicinc.com,
 konradybcio@kernel.org, rajendra.nayak@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20261127092834.731-1-atul.akella@gmail.com>
 <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Content-Language: en-US
From: Atul Akella <atul.akella@gmail.com>
In-Reply-To: <8500763d-778a-4183-b8fe-2b16cfc67b46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-11-2026 15:11, Gopikrishna Garmidi wrote:
> 
> 
> On 11/27/2026 2:58 PM, Atul Akella wrote:
>> On Fri, Nov 27, 2026 at 01:07:50AM -0800, Gopikrishna Garmidi wrote:
>>> The da_to_va() callbacks compute the offset into the carveout as an int
>>> from a u64 device address. An address such as mem_reloc + 0x100000010
>>> truncates to 0x10, passes the bounds check and gets mapped to the wrong
>>> place. The check "offset + len > mem_size" can also overflow.
>>>
>>> Use a u64 offset, reject addresses below the carveout base and compare
>>> without risking overflow. Apply the same change to the pas, adsp, wcss
>>> and wcnss drivers, which all share this pattern.
>>
>> Hi Gopikrishna,
>>
>> This overlaps with a series I sent on Nov 7 covering the same four
>> drivers and the same root cause (int offset truncating the u64
>> da base subtraction):
>>
>> https://lore.kernel.org/linux-remoteproc/20261106184312.100-1- 
>> atul.akella@gmail.com/
>>
>> Mine's still awaiting review, so happy to defer or let the maintainers
>> pick whichever they'd rather carry forward. Wanted to flag the overlap
>> before there's duplicate review effort on both sides.
>>
> 
> Hi Atul,
> 
> Thanks for pointing that out, I missed your series. Yours came first and
> covers the same four drivers with the same change, so please go ahead
> with it. I'm dropping this patch and will review yours instead.
> 
> Thanks,
> Gopikrishna

Hi Gopikrishna,

Appreciate you checking and deferring; Thanks for taking the time to 
review mine too.

Thanks,
Atul
